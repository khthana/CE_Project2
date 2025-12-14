package dtw.webmail;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;
import dtw.webmail.model.*;
import dtw.webmail.util.*;

 public class JwmaSendMail extends HttpServlet {
	
	 public void init(ServletConfig config) 
	 		throws ServletException {
	 	
	 	super.init(config);
	 }//init
	
	 private JwmaSession getJwmaSession(HttpServletRequest req,
	 		HttpServletResponse res) {
	 	
	 	HttpSession websession = req.getSession(false);
	 	if(websession==null) {
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
	 		Object o=websession.getValue("jwma.session");
	 		if(o==null) {
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
	 				JwmaKernel.getReference().
	 					debugLog().writeStackTrace(ex);
	 			}
	 		} else {
	 			JwmaSession session=(JwmaSession) o;
	 			session.setRequest(req);
				session.setResponse(res);
				session.setWebSession(websession);
				return session;
			}
		}
		return null;
 	 }//getJwmaSession

	 public void service(HttpServletRequest req,HttpServletResponse res) 
		throws ServletException,IOException { 	
		
		JwmaSession session=getJwmaSession(req,res);
		if(session==null) {
			JwmaKernel.getReference().debugLog().write("session was null");
			return;
		}
		try {	
			doSendMessage(session);		
		} catch (JwmaException ex) {
	 		session.storeBean("jwma.error",ex);
	 		session.redirect(JwmaKernel.ERROR_VIEW);
	 	}
	 }//service
	
	 private void doSendMessage(JwmaSession session) 
			throws JwmaException {
			JwmaKernel.getReference().debugLog().write("doSendMessage");
		try {
			MultipartRequest multi=new MultipartRequest(session.getRequest());
			JwmaKernel.getReference().debugLog().write("multi prepared");
			//and we get the preferences from the userdata
			JwmaPreferences prefs=session.getPreferences();
			JwmaKernel.getReference().debugLog().write("got prefs");
			//check the message itself
			JwmaComposeMessage message=(JwmaComposeMessage)
				session.retrieveBean("jwma.message");
			
			JwmaKernel.getReference().debugLog().write("got message");
			
			if(!message.isReply()) {		
				//gather and set recipients
				String to=multi.getParameter("to");
				String cc=multi.getParameter("ccto");
				String bcc=multi.getParameter("bccto");
				
				if(to==null) {
					session.storeBean("jwma.error",
						new JwmaException("Recipient not specified.")
					);
					session.redirect(JwmaKernel.ERROR_VIEW);
					return;
				} else {
					try {
						message.setTo(to);
						if(cc!=null) {
							message.setCCTo(cc);
						}
						if(bcc!=null) {
							message.setBCCTo(bcc);
						}	
					} catch (MessagingException mex) {
						session.storeBean("jwma.error",
							new JwmaException(
								"Recipients (cc,bcc) not specified correctly."
							)
						);
						session.redirect(JwmaKernel.ERROR_VIEW);
						return;
					}
				}
				
			}
			JwmaKernel.getReference().debugLog().write("handled receivers");

			//now gather and set subject + body	
			String subject=multi.getParameter("subject");
			if(subject!=null) {
				message.setSubject(subject);
			} else {
				session.storeBean("jwma.error",
					new JwmaException(
						"Subject not specified (correctly)."
					)
				);
				session.redirect(JwmaKernel.ERROR_VIEW);
				return;
			}
			JwmaKernel.getReference().debugLog().write("set subject");
			
			message.setBody(multi.getParameter("body"));
			JwmaKernel.getReference().debugLog().write("set body");
				
			//figure out about signature
			String sign=multi.getParameter("signature");
 				
 				if (sign!=null){
 				if (sign.equals("std")) {
 					sign="\n" + prefs.getSignature();
 				} else if (sign.equals("alt")) {
 					sign="\n"+ prefs.getAltSignature();
 				} else {
 					sign="";
 				}
 			} else {
 				if(prefs.isAutoSigning()) {
 					sign="\n" + prefs.getSignature();
 				}
 			}
			message.appendBody(sign);
                        
                        message.appendBody("\n\n====================================================\n");
                        message.appendBody("JAVA WebMail By\n");
                        message.appendBody("    Mr.Peerapong Charoenpong & Mr.Yuttana Pongpradit\n");
                        message.appendBody("Advisor\n");
                        message.appendBody("    Mr.Kietkul Jearanaitanakij\n");
                        message.appendBody("Computer Engineering Department KMITL\n");
                        
                        /*
                        message.appendBody("<br><br><center>====================================================</center><br>");
                        message.appendBody("                   JAVA WebMail\n");
                        message.appendBody("                       By\n");
                        message.appendBody("              Mr.Peerapong Charoenpong\n");
                        message.appendBody("                Mr.Yuttana Pongpradit\n");
                        message.appendBody("                    Advisor\n");
                        message.appendBody("             Mr.Kietkul Jearanaitanakij\n");
                        message.appendBody("           Computer Engineering Department\n");
                        message.appendBody(" King Mongkut's Institute of Technology Ladkrabang\n");
                        */
			
                        JwmaKernel.getReference().debugLog().write("set signature");
			
			if(multi.hasAttachments()) {
				message.setAttachments(multi.getAttachments());
				JwmaKernel.getReference().debugLog().write("set attachments");
			}
			message.send();
				JwmaKernel.getReference().debugLog().write("sent mail");
				
			if (prefs.isAutoArchiveSent() && JwmaKernel.getReference().getMailClientProtocol().equals("imap")) {
				//get the folder
				Folder archive= null;
				try {
					//open it read write
                                        //archive = session.getStore().getFolder(prefs.getSentMailArchive());
                                        archive = session.getActualFolder().getFolder(prefs.getSentMailArchive());
                                        if (!archive.exists()) 
                                        {
                                          archive.create(Folder.HOLDS_MESSAGES);
                                        }
                                        
                                        archive.open(Folder.READ_WRITE);
					
					//save the message in archive, append only works as array
 					Message[] tosave=new Message[1];
 					tosave[0]=message.getMessage();
					archive.appendMessages(tosave);
					//maybe we need to state that one who knows
					tosave[0].saveChanges();
					//and close the folder
 				} finally {
 					if(archive.isOpen()) {
 						archive.close(false);
 					}
 				}
 				JwmaKernel.getReference().debugLog().write("archived sent");
			} 
			
			if(message.isReply() && JwmaKernel.getReference().getMailClientProtocol().equals("imap")) {
				Folder mailfolder=session.getActualMailbox();
				try {
					mailfolder.open(Folder.READ_WRITE);
					//retrieve the message we are replying to
					Message mailmessage=mailfolder.getMessage(session.getMessage());
 					//and lets ensure we set the Answered flag if the reply didnt do yet
 					if (!mailmessage.isSet(Flags.Flag.ANSWERED)) {
						mailmessage.setFlag(Flags.Flag.ANSWERED,true);	
					}
					//and that our little redirect magic works:
					//the right message to be displayed (could be optimized, by
					//keeping a reference, but well....)
					session.storeBean("jwma.message",
						JwmaDisplayMessage.createJwmaDisplayMessage(
							mailmessage,session.getSenderAddress()
						)
					);
					JwmaKernel.getReference().debugLog().write("marked reply");
				} finally {
					//close the folder		
					if (mailfolder.isOpen()) {
						mailfolder.close(false);		
					}
				}
			} 
			//a little bit of magic :)
			//session.redirectToLast();
                        session.redirect(JwmaKernel.SUCCESSFUL_VIEW);
			
		} catch (IOException ioex) {
			JwmaKernel.getReference().debugLog().writeStackTrace(ioex);
			throw new JwmaException("Failed to gather attached files.");
		} catch (MessagingException mex) {
			JwmaKernel.getReference().debugLog().writeStackTrace(mex);
			throw new JwmaException("Failed to send mail.");
		} catch (Exception ex){
			JwmaKernel.getReference().debugLog().writeStackTrace(ex);
  		} finally{
  			//schedule a gc, this could have been heavy food
  			System.gc();
  		}
		
	}//doSendMessage
	
     public String getServletInfo() {
        return "jwma (Java WebMail) SendMail Servlet";
	 }//getServletInfo()

}//JwmaSendMail