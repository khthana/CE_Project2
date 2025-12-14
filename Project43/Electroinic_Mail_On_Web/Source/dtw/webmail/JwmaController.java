package dtw.webmail;

import java.io.*;
import java.util.*;
import java.text.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;


import org.apache.oro.text.regex.*;

import dtw.webmail.util.*;
import dtw.webmail.model.*;

public class JwmaController extends HttpServlet{
	
	 public void init(ServletConfig config) 
	 		throws ServletException { 
 		
 		try {
 			//kernel bootup 
 	 		JwmaKernel myKernel=JwmaKernel.getReference();
 	 		myKernel.setup(config.getInitParameter("configlocation"));
 	 	
 			myKernel.sysLog().write("Controller inited.");
 			myKernel.debugLog().write("Controller inited.");
 		} catch (Exception ex) {
 			throw new UnavailableException(this,ex.getMessage());
 		}
 	 }//init

	 private JwmaSession getJwmaSession(HttpServletRequest req,
	 		HttpServletResponse res) {
	 	
	 	HttpSession websession = req.getSession(true);
	 	Object o=websession.getValue("jwma.session");
	 	
	 	if(websession.isNew() || o==null) {
	 		//always redirect to login view
	 		try {
	 			res.sendRedirect(
	 				res.encodeRedirectUrl(
	 					JwmaKernel.getReference().getViewUrl(
	 						JwmaKernel.LOGIN_VIEW
	 					)
	 				)
	 			);
	 		} catch (IOException ex) {
	 			JwmaKernel.getReference().debugLog().writeStackTrace(ex);
	 		}
	 	} else {
	 		JwmaSession session=(JwmaSession) o;
	 		session.setRequest(req);
			session.setResponse(res);
			session.setWebSession(websession);
			return session;
		}
		return null;
 	 }//getJwmaSession

     public void service(HttpServletRequest req, HttpServletResponse res) 
							  throws ServletException, IOException  {
		
		//to catch the incoming login request we have to
		//look for params first
		String acton=req.getParameter("acton");
		String dome=req.getParameter("todo");
		JwmaSession session=null;
		
		if(acton==null || dome==null || !acton.equals("session") ||
			!dome.equals("login")) {	
			
			//get the JwmaSession related to the incoming request
	 		session=getJwmaSession(req,res);
			if(session==null) {
				try {
	 				res.sendRedirect(
	 					res.encodeRedirectUrl(
	 						JwmaKernel.getReference().getViewUrl(
	 							JwmaKernel.LOGIN_VIEW
	 						)
	 					)
	 				);
	 				return;
	 			} catch (IOException ex) {
	 			JwmaKernel.getReference().debugLog().writeStackTrace(ex);
	 			}
			}
		} else { 
			//fetch login data 
                String user=req.getParameter("username");
    		String passwd=req.getParameter("password");
    		String host=req.getParameter("hostname");
			
			if (user==null || passwd==null || host==null) {
				try {
	 				res.sendRedirect(
	 					res.encodeRedirectUrl(
	 						JwmaKernel.getReference().getViewUrl(
	 							JwmaKernel.LOGIN_VIEW
	 						)
	 					)
	 				);
	 			} catch (IOException ex) {
	 				JwmaKernel.getReference()
	 					.debugLog().writeStackTrace(ex);
	 			}
			} else {
				try {
					doLogin(host,user,passwd,req,res);
				} catch (JwmaException err) {
//=========================================================================================================
//    Edit 3/3/44 2:12PM                                
//					req.getSession(false).putValue("jwma.error",err);
//=========================================================================================================
                                        req.getSession(true).putValue("jwma.error",err);
					try {
	 				res.sendRedirect(
	 					res.encodeRedirectUrl(
	 						JwmaKernel.getReference()
	 							.getViewUrl(JwmaKernel.ERROR_VIEW)
	 					)
	 				);
	 			} catch (IOException ex) {
	 				JwmaKernel.getReference().debugLog()
	 					.writeStackTrace(ex);
	 			}
				}
	 		}
	 	}
	 	
	 	try {
                        JwmaKernel.getReference().debugLog().write
                        (
                          "acton = " + acton.toString() + " , " + "todo = " + dome.toString()
                        );
	 		if(acton==null) {
	 			throw new JwmaException("Invalid request.");
	 		} else if (acton.equals("session")) {
	 			doDispatchSessionActions(session,dome);
	 		} else if (acton.equals("folder")) {
	 			doDispatchFolderActions(session,dome);
	 		} else if (acton.equals("mailbox")) {
	 			doDispatchMailboxActions(session,dome);
	 		} else if (acton.equals("message")) {
	 			doDispatchMessageActions(session,dome);
	 		} else if (acton.equals("preferences")) {
	 			doDispatchPreferencesActions(session,dome);
	 		} else if (acton.equals("addressbook")) {
	 			doDispatchAddressbookActions(session,dome);
	 		} else {
	 			throw new JwmaException("Unknown request.");
	 		}
	 		
	 	} catch (JwmaException ex) {
			JwmaKernel.getReference().debugLog()
 				.writeStackTrace(ex);
	 		session.storeBean("jwma.error",ex);
	 		session.redirect(JwmaKernel.ERROR_VIEW);
	 	}
	
	 }//service
  
/*** Dispatchers ***************************************************/
  
  	private void doDispatchSessionActions(JwmaSession session,String dome) 
  			throws JwmaException {
  		
  		if(dome.equals("logout")) {
  			doLogout(session);
  		} else if(dome.equals("login")) {
  			//just do nothing, because this is handled already :)
  			return;
  		} else if(dome.equals("redirect")) {
  			String view=session.getRequest().getParameter("view");
  			doRedirect(session,view);
  		}else {
  			throw new JwmaException(
  				"Unknown session action requested."
  			);
  		}		
  	}//doDispatchSessionActions

    private void doDispatchFolderActions(JwmaSession session,String dome) 
  			throws JwmaException {
  		
  		if(dome.equals("display")) {
  			String name=session.getRequest().getParameter("path");
  			if(name==null || name.equals("")) {
  				throw new JwmaException(
  					"Missing folder path."
  				);
  			} else {
  				doDisplayFolder(session,name);
  			}
  		} else if (dome.equals("move")) {
  			String[] folders=
  				session.getRequest().getParameterValues("paths");
  			String destination=
  				session.getRequest().getParameter("destination");
  			
  			if(folders==null || folders.length==0) {
  				throw new JwmaException(
  					"Missing folder path(s)."
  				);
  			} else if (destination==null || destination.equals("")){
  				throw new JwmaException(
  					"Missing destination folder path."
  				);	
  			} else {
  				doMoveFolders(session,folders,destination);
  			}
  			
  		} else if (dome.equals("create")) {
  			String name=session.getRequest().getParameter("aname");
  			if(name==null || name.equals("")) {
  				throw new JwmaException(
  					"Missing folder name."
  				);
  			} else {
  				//remove whitespace!
  				doCreateFolder(session,name.trim());
  			}
  		} else if (dome.equals("delete")) {
  			String[] folders=
  				session.getRequest().getParameterValues("paths");
  				
  			if(folders==null || folders.length==0) {
  				throw new JwmaException(
  					"Missing folder name(s)."
  				);
  			} else {
  				doDeleteFolders(session,folders);
  			}
                } else if (dome.equals("updatedata")) {
                    try{
                        if (JwmaKernel.getReference().getMailClientProtocol().equals("imap"))
                        {
			  session.storeBean("jwma.trashinfo",JwmaTrashInfoImpl.createJwmaTrashInfo(session.getTrashFolder()));
                        }
                        //=====================================================================
			session.storeBean("jwma.folder",JwmaFolderImpl.createJwmaFolderImpl(session.getActualFolder()));
			session.storeBean("jwma.storeinfo",JwmaStoreInfoImpl.createJwmaStoreInfo(session.getActualFolder()));
                        
			
			//prepare and store inboxinfo bean
			session.storeBean("jwma.inboxinfo",JwmaInboxInfoImpl.createJwmaInboxInfo(session.getStore().getFolder(session.getPreferences().getInbox())));	
                        session.redirect(JwmaKernel.FOLDER_VIEW);
                      }
                      catch (MessagingException exm)
                      {
                        JwmaKernel.getReference().debugLog().write("Error when update folders data of " + session.getPreferences().getFullname());
                      }
                        
  		} else {
  			throw new JwmaException(
  				"Unknown folder action requested."
  			);
  		}	
  	}//doDispatchFolderActions
	
	private void doDispatchMailboxActions(JwmaSession session,String dome) 
  			throws JwmaException {
  		
  		if(dome.equals("display")) {
  			String name=session.getRequest().getParameter("path");
  			if(name==null || name.equals("")) {
  				throw new JwmaException(
  					"Missing mailbox path."
  				);
  			} else {
  				doDisplayMailbox(session,name);
  			}
  		}  else if (dome.equals("create")) {
  			String name=session.getRequest().getParameter("aname");
  			if(name==null || name.equals("")) {
  				throw new JwmaException(
  					"Missing mailbox name."
  				);
  			} else {
  				//Remove whitespace
  				doCreateMailbox(session,name.trim());
  			}
  		} else {
  			throw new JwmaException(
  				"Unknown mailbox action requested."
  			);
  		}
  			
  	}//doDispatchMailboxActions

	private void doDispatchMessageActions(JwmaSession session,String dome) 
  			throws JwmaException {
  	
  		if(dome.equals("display")) {
  			Object o=session.getRequest().getParameter("number");
  			int number=0;
  			if(o==null) {
  				throw new JwmaException(
  					"Missing message number."
  				);
  			} else {
  				try {
  					number=Integer.parseInt((String)o);
  				} catch (Exception ex) {
  					throw new JwmaException(
  						"Invalid message number format."
  					);
  				}
  				doDisplayMessage(session,number);
  			}
  		} else if(dome.equals("displaypart")) {
  			Object o=session.getRequest().getParameter("number");
  			int number=0;
  			if(o==null) {
  				throw new JwmaException(
  					"Missing message part number."
  				);
  			} else {
  				try {
  					number=Integer.parseInt((String)o);
  				} catch (Exception ex) {
  					throw new JwmaException(
  						"Invalid message part number format."
  					);
  				}
  				doDisplayMessagePart(session,number);
  				return;
  			}
		} else if (dome.equals("scanpart")) {
			Object o = session.getRequest().getParameter("number");
			int number=0;
			if(o==null) {
				throw new JwmaException(
					"Missing message part number."
					);
			}else{
				try{
					number=Integer.parseInt((String)o);
				}catch(Exception ex){
					throw new JwmaException(
						"Invalid message partt number format."
						);
				}
				doScanMessagePart(session,number);
				return;
			}
  		} else if (dome.equals("move")) {
  			String[] messages=
  				session.getRequest().getParameterValues("numbers");
  			String destination=
  				session.getRequest().getParameter("destination");
  			
  			if(messages==null || messages.length==0) {
  				throw new JwmaException(
  					"Missing message number(s)."
  				);
  			} else if (destination==null || destination.equals("")){
  				throw new JwmaException(
  					"Missing destination folder."
  				);	
  			} else {
  				try {	
  					//check if it's about the active message
  					if(messages[0].equals("active")) {
  						doMoveActiveMessage(session,destination.trim());
  					} else {

					//make ints
  					int[] msgnum=new int[messages.length];
  					for (int i=0;i<msgnum.length;i++) {
  						msgnum[i]=Integer.parseInt(messages[i].trim());
  					}
  					doMoveMessages(session,destination.trim(),msgnum);
					}
  				} catch (Exception ex) {
  					JwmaKernel.getReference().debugLog()
  						.writeStackTrace(ex);
  					throw new JwmaException(
  						"Invalid message numbers format."
  					);
  				}//end try in if
  				
  			}
  			
  		} else if (dome.equals("compose")) {
  			String to=session.getRequest().getParameter("to");
  			if(to==null ) {
  				to="";
			}
  				boolean reply=new Boolean(
  					session.getRequest().getParameter("reply")
  				).booleanValue();
  			
  				boolean toall=new Boolean(
  					session.getRequest().getParameter("toall")
  				).booleanValue();
//เพิ่มเข้ามา
  			boolean togglequote=new Boolean(
  				session.getRequest().getParameter("togglequote")
  			).booleanValue();
  			//see if its a forward
  			boolean forward=new Boolean(
  				session.getRequest().getParameter("forward")
  			).booleanValue();
  			
  			doComposeMessage(session,to,forward,reply,toall,togglequote);
  			
  			return;

//จบเพิ่ม
/*  			
  				doComposeMessage(session,reply,toall);
  			} else {
  				doComposeMessage(session,to);
  			}
*/
  		} else if (dome.equals("delete")) {
  			String[] messages=
  				session.getRequest().getParameterValues("numbers");
  			if(messages==null || messages.length==0) {
  				throw new JwmaException(
  					"Missing message number(s)."
  				);
  			} else {
  				try {	
						//check if it's about the active message
  					if(messages[0].equals("active")) {
  						doDeleteActiveMessage(session);
  					} else {
  			
  					//make ints
  					int[] msgnum=new int[messages.length];
  					for (int i=0;i<msgnum.length;i++) {
  						msgnum[i]=Integer.parseInt(messages[i].trim());
  					}
  					doDeleteMessages(session,msgnum);
				}//end else intry
  				} catch (Exception ex) {
  					JwmaKernel.getReference().debugLog()
  						.writeStackTrace(ex);
  					throw new JwmaException(
  						"Invalid message numbers format."
  					);
  				}
  				
  			}
  		} else {//end elseif
  			throw new JwmaException(
  				"Unknown message action requested."
  			);
  		}		
  	}//doDispatchMessageActions

	private void doDispatchPreferencesActions(
				JwmaSession session,String dome) 
  			throws JwmaException {
  			
  		if(dome.equals("update")) {
  			doUpdatePreferences(session);		
  		} else {
  			throw new JwmaException(
  				"Unknown preferences action requested."
  			);
  		}	
  	}//doDispatchPreferencesActions

	private void doDispatchAddressbookActions(
				JwmaSession session,String dome) 
  			throws JwmaException {
  		
  		if(dome.equals("add") || dome.equals("update")) {
  			doAddAddress(session);
  		} else if (dome.equals("remove")) {
  			String[] nicknames=
  				session.getRequest().getParameterValues("nicknames");
  				doRemoveAddresses(session,nicknames);
  		} else {
  			throw new JwmaException(
  				"Unknown preferences action requested."
  			);
  		}		
  	}//doDispatchAddressbookActions

/*** End Dispatchers *************************************************/  
   
/*** Session Actions  ************************************************/
 
	 private void doLogin(String host, String user, String passwd,
	 		HttpServletRequest req, HttpServletResponse res) 
 			throws JwmaException {

		//create a JwmaSession
		JwmaSession session=
			JwmaSession.createJwmaSession(host,user,passwd,req,res); 
  		//now we have an authenticated user, with loaded preferences
  		//and a valid mailsession
  		
  		
  		//get Preferences
  		JwmaPreferencesImpl prefs=session.getPreferences();
  		
  		try 
                {
			//Prepare root folder
			Folder rootfolder=session.getStore().getFolder(prefs.getRootFolder());
			if (!rootfolder.exists()) 
                        {
			  rootfolder.create(Folder.HOLDS_FOLDERS);
			}
			session.setActualFolder(rootfolder);
			
			//Prepare trash mailbox and store trashinfobean
                        //=====================================================================
                        //    Modify 14/3/2001 12:06PM
                        
                        if (JwmaKernel.getReference().getMailClientProtocol().equals("imap"))
                        {
			  //Folder trashbox=session.getStore().getFolder(prefs.getTrashFolder());
                          Folder trashbox = rootfolder.getFolder(prefs.getTrashFolder());
			  if (!trashbox.exists()) 
                          {
			    trashbox.create(Folder.HOLDS_MESSAGES);
                            
                            
			  }
                        
			  session.setTrashFolder(trashbox);
			  session.storeBean("jwma.trashinfo",JwmaTrashInfoImpl.createJwmaTrashInfo(trashbox));
                        }
                        //=====================================================================
			session.storeBean("jwma.folder",JwmaFolderImpl.createJwmaFolderImpl(rootfolder));
			session.storeBean("jwma.storeinfo",JwmaStoreInfoImpl.createJwmaStoreInfo(rootfolder));
                        
			
			//prepare and store inboxinfo bean
			session.storeBean("jwma.inboxinfo",JwmaInboxInfoImpl.createJwmaInboxInfo(session.getStore().getFolder(prefs.getInbox())));	
 	 		//prepare and store a HtmlHelper bean
 	 		session.storeBean("jwma.htmlhelper",new JwmaHtmlHelperImpl());
                        //=====================================================================
                        //    Modify 14/3/2001 12:06PM
                        session.storeBean("jwma.mailclientprotocol",JwmaKernel.getReference().getMailClientProtocol());
                        //  You can create Bean for Security by Cryptology library.
                        session.storeBean("jwma.password",passwd);
                        //=====================================================================
		
						
 		} 
                catch (Exception ex) 
                {
 		  JwmaKernel.getReference().debugLog().writeStackTrace(ex);
 		  throw new JwmaException("Failed to prepare storage:" + ex.getMessage());	
 		}
 			
		//forward to start folder view
                if (JwmaKernel.getReference().getMailClientProtocol().equals("imap")) 
                {
                  session.redirect(JwmaKernel.FOLDER_VIEW);			
                }
                else if (JwmaKernel.getReference().getMailClientProtocol().equals("pop3")) 
                {
                  doDisplayMailbox(session,"Inbox");
                }

	 }//doLogin

	/**
	 * Logs a user out of a jwma system, ending the session.
	 * 
     * @param session a <code>JwmaSession</code> instance.
	 *
	 * @throws JwmaException if it fails to execute properly.
	 */
	 private void doLogout(JwmaSession session) throws JwmaException 
         {
          try
          {
            //perform auto features like set in users prefs
            JwmaPreferencesImpl prefs=session.getPreferences();
		
            //1. automove read from Inbox to readmessagesfolder if set
            if (prefs.isAutoMoveRead() && JwmaKernel.getReference().getMailClientProtocol().equals("imap")) 
            {
              JwmaInboxInfoImpl inboxinfo=(JwmaInboxInfoImpl)
              session.retrieveBean("jwma.inboxinfo");
					
              //move the read messages
              Folder ReadMail = session.getActualFolder().getFolder(prefs.getReadMailArchive());
              if (!ReadMail.exists()) 
              {
                ReadMail.create(Folder.HOLDS_MESSAGES);
              }
              //======================================================
              //    Modify  19/4/2001 11:03PM
              //moveMessages(inboxinfo.getInbox(),session.getStore().getFolder(prefs.getReadMailArchive()),inboxinfo.getReadMessages());
              moveMessages(inboxinfo.getInbox(),ReadMail,inboxinfo.getReadMessages());
				
            }
            //2. autoempty trash if set
            if (prefs.isAutoEmpty() && JwmaKernel.getReference().getMailClientProtocol().equals("imap")) 
            {	
              Folder trashbox=session.getTrashFolder();
              if(trashbox.getMessageCount()>0) 
              {
                //delete them all
                deleteMessages(trashbox,null,
                getAllMessageNumbers(trashbox));
              }
            }
			
            //end session
            JwmaKernel.getReference().debugLog().write("In JwmaController before session.end(session)");
            session.end(session);
			
          } 
          catch (Exception ex) 
          {
            JwmaKernel.getReference().debugLog().writeStackTrace(ex);
          }
	}//doLogout

	 private void doRedirect(JwmaSession session, String view) {
		try {
			String url="";
			if(view!=null) {
				//clean whitespace
				view.trim();
				if(view.equals("last")) {
					session.redirectToLast();
					return;
				} else if(view.equals("folder")) {
					//redirect to folder display
					doDisplayFolder(session,session.getActualFolder().getFullName());	
					return;
				} else if(view.equals("mailbox")) {
					//redirect to mailbox display
					doDisplayMailbox(session,session.getActualMailbox().getFullName());
					return;
				} else if(view.equals("message")) {
					//redirect to message display
					doDisplayMessage(session,session.getMessage());
				}
			}
			//if fall through here display root folder	
			doDisplayFolder(session,session.getPreferences().getRootFolder());
			return;
		} catch (Exception ex) {
			JwmaKernel.getReference().debugLog().writeStackTrace(ex);
		}		
	}//doRedirect 

 
/*** End Session Actions  ***********************************************/

 
/*** Folder Actions  ****************************************************/ 	 

	 private void doDisplayFolder(JwmaSession session, String foldername) 
	 		throws JwmaException {
 		
 		try {
 			Folder f=session.getStore().getFolder(foldername);
 			
 			if(f.getType()==Folder.HOLDS_MESSAGES) {
 				throw new JwmaException(
 					"Cannot display mailboxes, just folders."
 				);
 			}
 			session.setActualFolder(f);
 			session.storeBean("jwma.folder",
 				JwmaFolderImpl.
 					createJwmaFolderImpl(session.getActualFolder())
 			);
 			session.redirect(JwmaKernel.FOLDER_VIEW);		
	 	
	 	} catch (MessagingException mex) {
	 		throw new JwmaException("Could not prepare folder.");
	 	}
	 }//doDisplayFolder

	 private void doDeleteFolders(JwmaSession session, String[] foldernames) 
	 		throws JwmaException {
	 	
	 	int errcount=0;	 	
	 	try {
	 		StringBuffer src=new StringBuffer();
			for(int i=0;i<foldernames.length;i++) {
				src.append(foldernames[i]);
				src.append(";");
			}
			JwmaKernel.getReference().debugLog()
 				.write("Deleting folder(s) "+src);
	 		Folder[] folders=getFolders(session,foldernames);
	 		for (int i=0; i< folders.length; i++) {
	 			folders[i].delete(true);
				errcount++;
			} 
			//update folder bean
 			session.storeBean("jwma.folder",
 				JwmaFolderImpl.
 					createJwmaFolderImpl(session.getActualFolder())
 			);
 			//update storage info
			((JwmaStoreInfoImpl)session
				.retrieveBean("jwma.storeinfo")).rebuildInfo();
					
			session.redirect(JwmaKernel.FOLDER_VIEW);
	 	} catch (MessagingException mex) {
	 		throw new JwmaException(
	 			"Could not delete folder or mailbox "+
	 			foldernames[errcount]
	 		);
	 	}
	 	
	 }//doDeleteFolders

	 private void doCreateFolder(JwmaSession session, String foldername) 
	 			throws JwmaException {
 		
 		try {
 			
 			//check name here, no special characters, no spaces
			if(foldername.indexOf(47,0)!=-1) {
				throw new JwmaException(
					"You can only create a folder in the actual folder."
				);
			}
			
			Folder parent=session.getActualFolder();
			Folder newfolder=session.getStore()
				.getFolder(parent.getFullName()
				+ "/" + foldername);
			
			if(newfolder.exists()) {
				throw new JwmaException(
					"A folder with this name already exists"+
					" in the actual folder."
				);
			} else {
			
				newfolder.create(Folder.HOLDS_FOLDERS);	
 				
 				//update folder bean
 				session.storeBean("jwma.folder",
 					JwmaFolderImpl.
 						createJwmaFolderImpl(session.getActualFolder())
 				);
  				//update storage info
				((JwmaStoreInfoImpl)session
					.retrieveBean("jwma.storeinfo")).rebuildInfo();
					
			}	
			session.redirect(JwmaKernel.FOLDER_VIEW);
		} catch(MessagingException mex) {
			throw new JwmaException(
					"Could not create folder "+foldername+" ."
			);
		}
	 }//doCreateFolder

	 private void doMoveFolders(JwmaSession session, String[] foldernames,
	 						   String destname) 
	 		throws JwmaException {

		try {
			StringBuffer src=new StringBuffer();
			for(int i=0;i<foldernames.length;i++) {
				src.append(foldernames[i]);
				src.append(";");
			}
			JwmaKernel.getReference().debugLog()
 				.write("Moving folder(s) "+src+" to "+destname);
			//check dest existance
			Folder dest=session.getStore().getFolder(destname);
			if(!dest.exists() && dest.getType()!=Folder.HOLDS_FOLDERS) {
				throw new JwmaException(
					"Destination folder ("+ 
					dest.getFullName()+
					") does not exist or is a mailbox."
				);
			}
			Folder[] folders=getFolders(session,foldernames);
			
			for (int i=0; i< folders.length;i++) {
				dest=session.getStore()
					.getFolder(destname + "/" + 
						folders[i].getName()
					);
				if(dest.exists()) {
					throw new JwmaException(
						"A folder with the destination folder name ("+ 
						dest.getFullName()+
						") already exists."
					);
				}
				//move but ensure a parent is not moved into
				// one of its childs
				if (!dest.getFullName().regionMatches(
						0,folders[i].getFullName(),
						0,folders[i].getFullName().length())) {          
				
					folders[i].renameTo(dest);
 				} else {
					throw new JwmaException(
						"Destination folder cannot be a subfolder of"+
						"the folder you want to move."
					);
				}
			}
			//update folder bean
			session.storeBean("jwma.folder",
 				JwmaFolderImpl.
 					createJwmaFolderImpl(session.getActualFolder())
 			);
			session.redirect(JwmaKernel.FOLDER_VIEW);
		} catch(MessagingException mex) {
				throw new JwmaException(
					"Failed to move folder(s) to destination." 
				);
 		}
 	 }//doMoveFolders
 
/*** End Folder Actions ***********************************************************/
 
 /*** Mailbox Actions  ************************************************************/ 	 

	 private void doDisplayMailbox(JwmaSession session, String mailboxname) 
	 		throws JwmaException {
 		
 		try {
 			Folder f=session.getStore().getFolder(mailboxname);
 			
 			if(f.getType()==Folder.HOLDS_FOLDERS) {
 				throw new JwmaException(
 					"Cannot display folders, just mailboxes."
 				);
 			}
 			session.setActualMailbox(f);
 			session.storeBean("jwma.mailbox",
 				JwmaMailboxImpl.createJwmaMailboxImpl(
 					session.getActualMailbox(),session.getSenderAddress()
 				)
 			);

 			session.redirect(JwmaKernel.MAILBOX_VIEW);		

	 	} catch (MessagingException mex) {
	 		throw new JwmaException("Could not prepare mailbox.");
	 	}
	  }//doDisplayMailbox

	 private void doCreateMailbox(JwmaSession session, String mailboxname) 
	 			throws JwmaException {
 		
 		try {
 			//check name here, no special characters, no spaces
			if(mailboxname.indexOf(47,0)!=-1) {
				throw new JwmaException(
					"You can only create a mailbox in the actual folder."
				);
			}
			
			Folder parent=session.getActualFolder();
			Folder newmailbox=
				session.getStore().getFolder(parent.getFullName()+
				"/" + mailboxname);
			
			if(newmailbox.exists()) {
				throw new JwmaException(
					"A mailbox with this name already"+
					"exists in the actual folder."
				);	
			} else {
				newmailbox.create(Folder.HOLDS_MESSAGES);
				
				
				//update folder bean
				session.storeBean("jwma.folder",
 					JwmaFolderImpl.
 						createJwmaFolderImpl(session.getActualFolder())
 				);
	 			//update storage info
				((JwmaStoreInfoImpl)session
					.retrieveBean("jwma.storeinfo")).rebuildInfo();			
				
			}	
			session.redirect(JwmaKernel.FOLDER_VIEW);
		} catch(MessagingException mex) {
			throw new JwmaException(
					"Could not create folder "+mailboxname+" ."
			);
		}
	 }//doCreateMailbox
 
/*** End Mailbox Actions *************************************************/

/*** Message Actions *****************************************************/

	 private void doDisplayMessage(JwmaSession session, int number) 
			throws JwmaException {
		
		Folder box=null;
		try {
			//store actual message
			session.setMessage(number);
			//get box, and open it
			box=session.getActualMailbox();
			box.open(Folder.READ_WRITE);
			//create jwmamessage
			JwmaDisplayMessage msg=
				JwmaDisplayMessage.createJwmaDisplayMessage(
					box.getMessage(number),session.getSenderAddress()
				);
			//close the folder		
			if (box.isOpen()) {
				box.close(false);		
			}
				
			//process urlsensitive
			if(session.getPreferences().isUrlSensitive()) {
				Pattern pattern=	
					JwmaKernel.getReference().getUrlMatchPattern();	
				msg.setBody(
					processPlainText(msg.getBody(),pattern)
				);
			}
			session.storeBean("jwma.message",msg);
			
			
			
			session.redirect(JwmaKernel.MESSAGE_VIEW);
		} catch(MessagingException mex) {
			throw new JwmaException(
				"Could not prepare message."	
			);
		} finally {
			
		}
	}//doDisplayMessage
	/**
	 * Deletes the active message and redirects either
	 * to the next mail (if exists) or to the mailbox view.
	 * 
     * @param session a <code>JwmaSession</code> instance.
	 *
	 * @throws JwmaException if it fails to execute properly.
	 */  
	 private void doDeleteActiveMessage(JwmaSession session) 
			throws JwmaException {
		
		try {
			int[] numbers={session.getMessage()};
//เพิ่มเข้ามาเอง
			if (JwmaKernel.getReference().getMailClientProtocol().equals("pop3"))
                        {
                          deleteMessages(session.getActualMailbox(),null,numbers);
 			   			if(numbers[0]==
						((JwmaMailbox)session.retrieveBean("jwma.mailbox")).getMessageCount()+1) {
						session.redirect(JwmaKernel.MAILBOX_VIEW);
					} else {
					//same number will be next, because of renumbering
					doDisplayMessage(session,numbers[0]);	
					}	

			}else {
//จบเพิ่ม
			if(session.getActualMailbox().getFullName()
				.equals(session.getTrashFolder().getFullName())) {
				//actual mailbox is trash, delete only
				deleteMessages(session.getActualMailbox(),null,numbers);
			} else {
				//actual mailbox is not trash, move to trash,
				//delete in place
				deleteMessages(session.getActualMailbox(),
					session.getTrashFolder(),numbers
				);
			}
			//update mailbox bean!!!!
			session.storeBean("jwma.mailbox",
 				JwmaMailboxImpl.createJwmaMailboxImpl(
 					session.getActualMailbox(),session.getSenderAddress()
 				)
 			);
 			if(numbers[0]==
 				((JwmaMailbox)session.retrieveBean("jwma.mailbox")).getMessageCount()+1) {
				session.redirect(JwmaKernel.MAILBOX_VIEW);
			} else {
				//same number will be next, because of renumbering
				doDisplayMessage(session,numbers[0]);	
			}	
			}//end if pop3
		} catch(MessagingException mex) {
			throw new JwmaException("delete message fail");
		}
	 }//doDeleteActiveMessage

	 private void doDeleteMessages(JwmaSession session, int[] numbers) 
			throws JwmaException {
		
		try {
			if (JwmaKernel.getReference().getMailClientProtocol().equals("pop3"))
                        {
                          //=============================================================
                          //    Modify  15/3/2001 4:24PM
                          //  check for POP3 Protocol
                          deleteMessages(session.getActualMailbox(),null,numbers);
                          //=============================================================
                        }
                        else if(session.getActualMailbox().getFullName()
				.equals(session.getTrashFolder().getFullName())) {
				//actual mailbox is trash, delete only
				deleteMessages(session.getActualMailbox(),null,numbers);
			} else {
				//actual mailbox is not trash, move to trash,
				//delete in place
				deleteMessages(session.getActualMailbox(),
					session.getTrashFolder(),numbers
				);
			}
			//update mailbox bean!!!!
			session.storeBean("jwma.mailbox",
 				JwmaMailboxImpl.createJwmaMailboxImpl(
 					session.getActualMailbox(),session.getSenderAddress()
 				)
 			);

			session.redirect(JwmaKernel.MAILBOX_VIEW);
		} catch(MessagingException mex) {
			throw new JwmaException(
				"Something went wrong deleting messages."	
			);
		}
	 }//doDeleteMessages

	 	/**
	 * Moves the active message to a given destination and 
	 * redirects either to the next message or to the mailbox view.
	 * 
     * @param session a <code>JwmaSession</code> instance.
	 * @param destination the full path of a valid mailbox of the 
	 *        actual store as <code>String</code>.
	 *
	 * @throws JwmaException if it fails to execute properly.
	 */  
	 private void doMoveActiveMessage(JwmaSession session,String destination) 
			throws JwmaException {
		
		try {
			int[] numbers={session.getMessage()};
			Folder dest=session.getStore().getFolder(destination);
			JwmaKernel.getReference().debugLog().write("Moving msgs to:"+destination);
			if(!dest.exists()) {
				throw new JwmaException("message move non existant destination");
			}
			if(dest.getType()!=Folder.HOLDS_MESSAGES) {
				throw new JwmaException("message move fail deatination");
			} else {		
				moveMessages(session.getActualMailbox(), dest,numbers);
				//update mailbox bean
				session.storeBean("jwma.mailbox",
 					JwmaMailboxImpl.createJwmaMailboxImpl(
 						session.getActualMailbox(),
 						session.getSenderAddress()
 					)
 				);

			}
			if(numbers[0]==
				((JwmaMailbox)session.retrieveBean("jwma.mailbox")).getMessageCount()+1) {
				session.redirect(JwmaKernel.MAILBOX_VIEW);
			} else {
				//same number will be next, because of renumbering
				doDisplayMessage(session,numbers[0]);	
			}			
		} catch(MessagingException mex) {
			throw new JwmaException("message move failed");
		}
	 }//doMoveActiveMessage


	 private void doMoveMessages(JwmaSession session,
			 String destination,int[] numbers) 
			throws JwmaException {
		
		try {
			Folder dest=session.getStore().getFolder(destination);
			JwmaKernel.getReference().debugLog().write("Moving msgs to:"+destination);
			if(!dest.exists()) {
				throw new JwmaException(
					"Destination mailbox does not exist."
				); 
			}
			if(dest.getType()!=Folder.HOLDS_MESSAGES) {
				throw new JwmaException(
					"Destination is not a mailbox."
				);
			} else {		
				moveMessages(session.getActualMailbox(), dest,numbers);
				//update mailbox bean
				session.storeBean("jwma.mailbox",
 					JwmaMailboxImpl.createJwmaMailboxImpl(
 						session.getActualMailbox(),
 						session.getSenderAddress()
 					)
 				);

			}			
			session.redirect(JwmaKernel.MAILBOX_VIEW);
		} catch(MessagingException mex) {
			throw new JwmaException(
				"Failed to move messages."	
			);
		}
	 }//doMoveMessages

	 private void doComposeMessage(JwmaSession session,String to,
			 boolean forward, boolean reply,
			 boolean toall, boolean togglequote) 
			throws JwmaException {
		
		Folder mailbox=null;
		JwmaComposeMessage message=null;
		
		try {
			
			//distinct compose message creation
			if(reply) {
                        JwmaKernel.getReference().debugLog().write("In Reply");
				try {
					//get mailbox
					mailbox=session.getActualMailbox();
					//open it 
					mailbox.open(Folder.READ_ONLY);
					message=JwmaComposeMessage.createJwmaComposeMessage(
						session.getActualMailbox()
							.getMessage(session.getMessage()),toall
					);
				} catch (Exception ex){
					throw new JwmaException("message compose reply failed");
				} finally {
					try {
						if (mailbox.isOpen()) {
							mailbox.close(false);
						}
					} catch (Exception ex) {
						JwmaKernel.getReference().debugLog().writeStackTrace(ex);
					}
				}
			} else {
                        JwmaKernel.getReference().debugLog().write("Else Reply");
				message=JwmaComposeMessage.createJwmaComposeMessage(
					session.getMailSession()
				);
				//set receiver
				message.setTo(to);	
			}
			
			JwmaMessage mailmessage=null;
			if(reply || forward) {
                        JwmaKernel.getReference().debugLog().write("In Reply || Forward");
				mailmessage=(JwmaMessage)session.retrieveBean("jwma.message");
			}
			
			if(reply) {
				//set the subject:
				message.setSubject("Re: "+mailmessage.getSubject());
			} else if(forward) {
				message.setSubject("Fwd: "+mailmessage.getSubject());
			}
			
			
			//transfer quoted text if applicable
			//there is a little bit of logic in the if ;)
			if( (reply && (session.getPreferences().isAutoQuote()!=togglequote))
				|| forward) {	
					
				//get the message to be answered or forwarded
				mailmessage=
					(JwmaMessage)session.retrieveBean("jwma.message");
					
				//retrieve the quotechar
				String quotechar=session.getPreferences().getQuoteChar();
					
				//ensure we only quote plain-text
				//everything else is pretty senseless
				if (mailmessage.isSinglepart()) {
					String messtr=mailmessage.getBody();
					StringBuffer rbodybuf=new StringBuffer(messtr.length()+10);
					rbodybuf.append("\n\n");
					rbodybuf.append(quotechar);
					boolean done=false;
					int pos=0;
					int foundpos=0;
					while (!done) {
						foundpos=messtr.indexOf(10,pos);
						if (foundpos!=-1) {
							rbodybuf.append(messtr.substring(pos,foundpos+1));
							rbodybuf.append(quotechar);
							pos=foundpos+1;
						} else {
							rbodybuf.append(messtr.substring(pos,messtr.length()));
							done=true;
						}
					}
					message.setBody(rbodybuf.toString());
					rbodybuf=null;
					messtr=null;
				}
			} 
			
			//set sender to ensure there is just one sender
                        JwmaKernel.getReference().debugLog().write("before message.setFrom(session.getSenderIdentity())");
			message.setFrom(session.getSenderIdentity());
			
			//store bean and redirect to compose view
			session.storeBean("jwma.message",message);
			session.redirect(JwmaKernel.COMPOSE_VIEW);
		/*	
		} catch(MessagingException mex) {
			throw new JwmaException("message compose failed");
		*/
		}catch(Exception ex){
			throw new JwmaException("message is fucking");
		}
		
	}//doComposeMessage

/*
	 private void doComposeMessage(JwmaSession session, String to) 
			throws JwmaException {
	
		try {
			JwmaComposeMessage message=JwmaComposeMessage.createJwmaComposeMessage(
				session.getMailSession()
			);
			//set sender to ensure there is just one sender
			message.setFrom(session.getSenderIdentity());
			//set receiver 
			message.setTo(to);
			JwmaKernel.getReference().debugLog().write("rest for compose message");
			//store bean and redirect to compose view
			session.storeBean("jwma.message",message);
			session.redirect(JwmaKernel.COMPOSE_VIEW);
			
		} catch(MessagingException mex) {
			throw new JwmaException(
				"Could not prepare message for compose."	
			);
		}
	 }//doComposeMessage

	 private void doComposeMessage(JwmaSession session,
			 boolean reply, boolean toall) 
			throws JwmaException {
		
			Folder mailbox=null;

		try {
			JwmaComposeMessage message=null;
			
			if(reply) {
				//get mailbox
				mailbox=session.getActualMailbox();
				//open it 
				mailbox.open(Folder.READ_ONLY);
				message=JwmaComposeMessage.createJwmaComposeMessage(
					session.getActualMailbox()
						.getMessage(session.getMessage()),toall
				);
				//transfer quoted text if applicable
				if(session.getPreferences().isAutoQuote()) {
					
					//get the message
					Message mailmessage=mailbox.getMessage(session.getMessage());
					//we retrieve the quotechar
					String quotechar=session.getPreferences().getQuoteChar();
					
					//ensure we only quote plain-text
					//everything else is pretty senseless
					if (mailmessage.isMimeType("text/plain")) {
						String messtr=(String) mailmessage.getContent();
						StringBuffer rbodybuf=new StringBuffer(messtr.length()+10);
						rbodybuf.append("\n\n");
						rbodybuf.append(quotechar);
						boolean done=false;
						int pos=0;
						int foundpos=0;
						while (!done) {
							foundpos=messtr.indexOf(10,pos);
							if (foundpos!=-1) {
								rbodybuf.append(messtr.substring(pos,foundpos+1));
								rbodybuf.append(quotechar);
								pos=foundpos+1;
							} else {
								rbodybuf.append(messtr.substring(pos,messtr.length()));
								done=true;
							}
						}
						message.setBody(rbodybuf.toString());
						rbodybuf=null;
						messtr=null;
						mailbox.close(false);
					}
				}
			} else {
				message=JwmaComposeMessage.createJwmaComposeMessage(
					session.getMailSession()
				);
			}
			//set sender to ensure there is just one sender
			message.setFrom(session.getSenderIdentity());
			
			//store bean and redirect to compose view
			session.storeBean("jwma.message",message);
			session.redirect(JwmaKernel.COMPOSE_VIEW);
			
		} catch(MessagingException mex) {
			throw new JwmaException(
				"Could not prepare message for compose."	
			);
		} catch (IOException ex) {
			throw new JwmaException(
				"Could not prepare message for compose."	
			);
		} finally {
			try {
                        JwmaKernel.getReference().debugLog().write("before mailbox.isOpen() in doComposeMessage");
				if (mailbox.isOpen()) {
					mailbox.close(false);
				}
			}catch (Exception ex) {
				JwmaKernel.getReference().debugLog().writeStackTrace(ex);
			}
		}	
		
	}//doComposeMessage
*/
	 private void doDisplayMessagePart(JwmaSession session, int number) 
			throws JwmaException {


		Folder mailbox=null;
		try {
		
			mailbox=session.getActualMailbox();
			mailbox.open(Folder.READ_ONLY);
			Message msg=mailbox.getMessage(session.getMessage());		
	    	Multipart mp=(Multipart)msg.getContent();
	    	Part part=mp.getBodyPart(number);
	    //set type to help you download
	    	HttpServletResponse res=session.getResponse();
	    	
	    	String type=new ContentType(part.getContentType()).getBaseType();
	    	String fname=part.getFileName();
	    	//we do it all for fun or not?
	    	if ( fname==null) {
				fname="pnp.webmail";
			}
	    	res.setContentType(type);
	    	res.setHeader("Content-Disposition","filename="+fname);
			//จบตรงเพิ่มเข้าไปใหม่
	    	//output bytes
    		ServletOutputStream out=
    			session.getResponse().getOutputStream();
	    	InputStream in=part.getInputStream();
	    	
	    	int i;
	    	while ((i=in.read())!=-1) {
	    		//this is not very efficient, should
	    		//write in blocks (byte[]'s)
	    		out.write(i);
	    	}
	    	out.flush();
	    	out.close();
	    
		} catch (IOException anex) {
 			JwmaKernel.getReference().debugLog().writeStackTrace(anex);
 		} catch (MessagingException mex) {
 			 JwmaKernel.getReference().debugLog().writeStackTrace(mex);
 		}finally {
 			try {
				if (mailbox.isOpen()) {
					mailbox.close(false);
				}
			}catch (Exception ex) {
				JwmaKernel.getReference().debugLog().writeStackTrace(ex);
			}
 		}	
	}//doDisplayMessagePart
	/**
	 * Scan message part of actual message.
	 * @param sessioon a <code>JwmaSession</code> instance.
	 * @param number of the message part to be displayed as <code>int</code>
	 * @throws JwmaException if it fails to execute properly.
	 */
	 private void doScanMessagePart(JwmaSession session,int number)
	 throws JwmaException{
		 Folder mailbox=null;
		 try{
			 mailbox=session.getActualMailbox();
			 mailbox.open(Folder.READ_ONLY);
			 Message msg=mailbox.getMessage(session.getMessage());
			 Multipart mp=(Multipart)msg.getContent();
			 Part part=mp.getBodyPart(number);
			 String type=part.getContentType();
			 if(type==null){
				 throw new JwmaException("Failed to scan part.");
			 }
			 ContentType ct = new ContentType(type);
			 //redirect to scan output
			 String tmp = JwmaKernel.getReference().getAntiviruspath();//"/home/pom/program/antivirus";
			 String file = tmp+File.separator+Long.toString(System.currentTimeMillis());
			 FileOutputStream out = new FileOutputStream(file);
			 InputStream in=part.getInputStream();
			 int i;
			 while((i=in.read())!=-1){
				 out.write(i);
			 }
			 out.flush();
			 out.close();
			 try{
				//System.out.println(scan(file));
                                session.storeBean("jwma.scanresult",scan(file));
                               	session.redirect(JwmaKernel.SCAN_VIEW);
			}catch(Exception ex){
				ex.printStackTrace();
			}finally{
					new File(file).delete();
			}
		}catch(IOException anex){
			JwmaKernel.getReference().debugLog().writeStackTrace(anex);
		}catch(MessagingException mex){
			JwmaKernel.getReference().debugLog().writeStackTrace(mex);
		}finally{
			try{
				if(mailbox.isOpen()){
					mailbox.close(false);
				}
			}catch(Exception ex){
				JwmaKernel.getReference().debugLog().writeStackTrace(ex);
			}
		}
	}//doScanMessagePart
        

/*** End Message Actions ************************************************/

/*** Preferences Actions ************************************************/

	 private void doUpdatePreferences(JwmaSession session) 
			throws JwmaException {
		
		HttpServletRequest req=session.getRequest();
		JwmaPreferencesImpl prefs=session.getPreferences();
		
		if(session.isFirstTime()) {
			//reset on save automatically
			String firstname=req.getParameter("firstname");
			String lastname=req.getParameter("lastname");
			
			if(valid(firstname) && valid(lastname)) {
				prefs.setFirstname(firstname);
				prefs.setLastname(lastname);
				session.savePreferences();
				session.redirect(JwmaKernel.FOLDER_VIEW);
				return;
			} else {
				throw new JwmaException("Please return and enter a valid first- and lastname.");	
			}
						
		} else {
		
		//update whatever is adequate/changed
			String signature=req.getParameter("signature");
			String altsignature=req.getParameter("altsignature");
			String quotechar=req.getParameter("quotechar");
			String sentmailarchive=req.getParameter("sentmailarchive");
			String readmailarchive=req.getParameter("readmailarchive");
                        String fullname=req.getParameter("fullname");
		
		
			boolean autosigning=new Boolean(
				req.getParameter("autosigning")).booleanValue();
			boolean autoquote=new Boolean(
				req.getParameter("autoquote")).booleanValue();
			boolean autoempty=new Boolean(
				req.getParameter("autoempty")).booleanValue();
			boolean automoveread=new Boolean(
				req.getParameter("automoveread")).booleanValue();
			boolean autoarchivesent=new Boolean(
				req.getParameter("autoarchivesent")).booleanValue();
			boolean urlsensitive=new Boolean(
				req.getParameter("urlsensitive")).booleanValue();
			
			if (!fullname.trim().equals("") && fullname != null)
                        {
                          prefs.setFullname(fullname);
                        }
                        else
                        {
                          prefs.setFullname("");
                        }
	
			if(valid(signature)) {
				prefs.setSignature(signature);
			}
			if(valid(altsignature)) {
				prefs.setAltSignature(altsignature);
			}
			if(valid(quotechar)) {
				prefs.setQuoteChar(quotechar);
			}
			if(valid(sentmailarchive)) {
				prefs.setSentMailArchive(sentmailarchive);
			}
			if(valid(readmailarchive)) {
				prefs.setReadMailArchive(readmailarchive);
			}
		
			prefs.setAutoSigning(autosigning);
			prefs.setAutoQuote(autoquote);
			prefs.setAutoEmpty(autoempty);
			prefs.setAutoMoveRead(automoveread);
			prefs.setAutoArchiveSent(autoarchivesent);
			prefs.setUrlSensitive(urlsensitive);
		
                        //=============================================================
                        //    Modify  16/3/2001 12:57PM
			//session.savePreferences();
                        //=============================================================
			session.redirect(JwmaKernel.PREFERENCES_VIEW);
		}
	}//doUpdatePreferences

	 private void doAddAddress(JwmaSession session) 
			throws JwmaException {
		//try to parse out an address
		HttpServletRequest req=session.getRequest();
		
                //====================================================================
                //    Modify  15/3/2001 09:15PM
                String fullname=req.getParameter("fullname");
                String fcc = req.getParameter("fcc");
                //====================================================================
		String nickname=req.getParameter("nickname");
		String firstname=req.getParameter("firstname");
		String lastname=req.getParameter("lastname");
		String email=req.getParameter("email");
		String comment=req.getParameter("comment");
		/*boolean frequent=new Boolean(
			req.getParameter("frequent")).booleanValue();
		boolean shared=new Boolean(
			req.getParameter("shared")).booleanValue();*/
		
		JwmaAddressImpl add=new JwmaAddressImpl();
		
		if(valid(nickname) && !nickname.trim().equals("")) {
			add.setNickname(nickname);
		} else {
			session.redirect(JwmaKernel.ADDRESSBOOK_VIEW);
			return;
		}
                //====================================================================
                //    Modify  15/3/2001 09:15PM
                if (fullname != null && !fullname.trim().equals(""))
                {
                  add.setFullname(fullname.trim());
                }
                if (fcc != null && !fcc.trim().equals(""))
                {
                  add.setFcc(fcc.trim());
                }
                //====================================================================
		/*if(valid(firstname)) {
			add.setFirstname(firstname);
		}
		if(valid(lastname)) {
			add.setLastname(lastname);
		}*/
		if(valid(email)) {
			add.setEmail(email);
		} 
		if(valid(comment)) {
			add.setComment(comment);
		}
		
		//add.setFrequentRecipient(frequent);
		//add.setShared(shared);
		
		session.getPreferences().getAddressBook().addAddress(add);
		
		session.redirect(JwmaKernel.ADDRESSBOOK_VIEW);
		return;
	}//doAddAddress

	 private void doRemoveAddresses(JwmaSession session, String[] nicknames)
			throws JwmaException {
		
		for(int i=0;i<nicknames.length;i++) {	
			session.getPreferences().getAddressBook().removeAddress(nicknames[i].trim());
		}
		session.redirect(JwmaKernel.ADDRESSBOOK_VIEW);
		return;
	 }//doRemoveAddress
	

/*** End Preferences Actions *******************************************/
 
/*** Helper methods ****************************************************/

	private boolean valid(String str) {
		if(str==null) {
			return false;
		} else {
			//IE 5: remove whitespace, else error's
			//occur that give you the opportunity to get gray
            //hair ;)
            //Its done here because I pass many incoming 
            //params through this methods			
			str.trim();
			return true;
		}
	}//valid

	private Folder[] getFolders(JwmaSession session,String[] foldernames) 
			throws MessagingException {
			
		Vector folders=new Vector(foldernames.length);
		Folder f=null;
		for (int i=0; i< foldernames.length; i++) {
	 		f=session.getStore().getFolder(foldernames[i]);
	 		//add if existant and NOT the trash mailbox
	 		if(f.exists() && !f.getFullName().equals(session.getTrashFolder().getFullName())) {
	 			folders.addElement(f);
			}
		}
		//unroll vector
		Folder[] retfolders=new Folder[folders.size()];
		for(int i=0;i<retfolders.length;i++) {
			retfolders[i]=(Folder) folders.elementAt(i);
		}
		return retfolders;
		 
	}//getFolders
	
	private int[] getAllMessageNumbers(Folder box) 
			throws MessagingException {
		
		//prepare all messages
		int[] numbers=new int[box.getMessageCount()];
		for (int i=0;i<numbers.length;i++) {
			numbers[i]=i+1;
		}
		return numbers;
	}//getAllMessageNumbers
 	
 	/**
 	 * Actually does the job of moving messages.
 	 */
	 private void moveMessages(Folder src,Folder dst,
							  int[] numbers)
			throws MessagingException {
		
		try{
			//Note that apidocs state that only source
			//has to be opened
		
			src.open(Folder.READ_WRITE);
			//prepare messages
	 		Message[] msgs = src.getMessages(numbers);
	 		if (msgs.length!=0) {
     			src.copyMessages(msgs, dst);
        		src.setFlags(msgs,new Flags(Flags.Flag.DELETED), true);
			}
     	
		} finally {
			if (src.isOpen()){
				//close it expunging deleted messages	
				src.close(true);
			}
		}
	 }//moveMessages
	
	/**
	 * Actually does the job of deleting messages.
	 */
 	 private void deleteMessages(Folder box, Folder trashbox, int[] numbers) 
 			throws MessagingException {
 			
 		if(trashbox!=null) {
 			moveMessages(box,trashbox,numbers);		
 		} else {
 			try{
				//Note that apidocs state that only source
				//has to be opened
		
				box.open(Folder.READ_WRITE);
				//flag messages deleted
	 			Message[] msgs = box.getMessages(numbers);
	 			if (msgs.length!=0) {
        			box.setFlags(msgs,new Flags(Flags.Flag.DELETED), true);
				}
     	
			} finally {
				if (box.isOpen()){
					//close it expunging deleted messages	
					box.close(true);
				}
			}
 		}
 	}//deleteMessages
 
 	 private String processPlainText(String ptcontent,Pattern pattern) {
 
 		if(ptcontent==null) {
 			return "";
 		}
	 	StringBuffer mesbuf=new StringBuffer(ptcontent);			
		//parse for urls and make them clickable
		int relinsertend=0;
		int relinsertbegin=0;
		int corr=0;
	
		PatternMatcher matcher=JwmaKernel.getReference().getMatcher();
	
		try {
			PatternMatcherInput input=
					new PatternMatcherInput(ptcontent);
						
			// Loop until there are no more matches left.
   			while(matcher.contains(input, pattern)) {
   				// Since we're still in the loop, 
   				//fetch match that was found.
     			MatchResult result = matcher.getMatch();
     			//extracted url
     			String url=result.toString();
     			//now we got to work on the buffer
     			relinsertend=(result.endOffset(0)) + corr;	
     			relinsertbegin= (result.beginOffset(0)) + corr;
     			corr=corr+4+25+url.length();	
     			mesbuf.insert(relinsertend,"</a>");
     			mesbuf.insert(relinsertbegin,
     				"<a href='"+ url +"' target='_top'>");
			}
			
		}catch (Exception ex) {
			JwmaKernel.getReference().debugLog().writeStackTrace(ex);
			return ptcontent;	
		} finally {
			JwmaKernel.getReference().releaseMatcher(matcher);
		}
		return mesbuf.toString();
 	}//processPlainText
 
/*** End Helper methods ************************************************/
	private synchronized Integer scan(String file)
	throws Exception
	{
		//scanvirus
	    int ret=0;
		String[] command = new String[3];
		command[0] = JwmaKernel.getReference().getAntiviruspath() + "/" 
                              + JwmaKernel.getReference().getAntivirusName();
                              //"/home/pom/program/antivirus/inocucmd";
		command[1] = JwmaKernel.getReference().getAntivirusParameter(); //"-SEC";
		command[2] = file;//"Scan.class";
		Runtime runtime = Runtime.getRuntime();
		Process process = null;
        process = runtime.exec(command);
		ret = process.waitFor();
		//End Scan
		return new Integer(ret);
	}


     public String getServletInfo() {
        return "jwma (Java WebMail) Controller Servlet";
	 }//getServletInfo()
    
}//class JwmaController


	
