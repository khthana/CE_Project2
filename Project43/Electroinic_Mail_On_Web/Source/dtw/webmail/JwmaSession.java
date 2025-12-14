package dtw.webmail;

import java.io.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.http.*;

import dtw.webmail.model.*;
import dtw.webmail.util.*;
import ftp.*;
import AddressBookBean;
import ConfigBean;

 public class JwmaSession {

	//instance attributes
	
	//http session state related
	private Vector myBeanNames;
	private HttpServletRequest myRequest;
	private HttpServletResponse myResponse;
	private HttpSession myWebSession;
	private String[] myViewHistory;
	
	//mail session state related
	private Session myMailSession;
	private Store myStore;
	private Folder myActualFolder;
	private Folder myActualMailbox;
	private Folder myTrashFolder;		//beware its a mailbox
	private int myMessage;
	
	//utility attributes
	private JwmaPreferencesImpl myPreferences;
	private String myUsername;
	private String myHostname;
	private String myLastLogin;
	private boolean died=false;
	private boolean firsttime=false;
        
        //Modify Tue Feb 06 @ 02:32
        private FtpBean ftp;
        private AddressBookBean myAddressbook;
        private ConfigBean myConfig;
	

	 private JwmaSession(String username, String hostname){
	 	myUsername=username;
	 	myHostname=hostname;
	 	myBeanNames=new Vector(15);
	 	myViewHistory=new String[2];
	 }//constructor


/*** Web session related part ***********************************************************/
	 public void setRequest(HttpServletRequest request) {
	 	myRequest=request;	
	 }//setRequest

	 public HttpServletRequest getRequest() {
	 	return myRequest;
	 }//getRequest
	
	 public void setResponse(HttpServletResponse response) {
	 	myResponse=response;	
	 }//setResponse

	 public HttpServletResponse getResponse() {
	 	return myResponse;
	 }//getResponse

	 public HttpSession getWebSession() {
	 	return myWebSession;
	 }//getWebSession

	 public void setWebSession(HttpSession websession) {
	 	myWebSession=websession;
	 }//setWebSession
	 
	 public void redirect(String view) {
	 	//update history
	 	myViewHistory[1]=myViewHistory[0];
	 	myViewHistory[0]=view;
	 	
	 	//retrieve URL from Kernel
	 	view=JwmaKernel.getReference().getViewUrl(view);
	 	
	 	try {
	 		myResponse.sendRedirect(myResponse.encodeRedirectUrl(view));
	 	} catch (IOException ex) {
	 		JwmaKernel.getReference().debugLog().writeStackTrace(ex);
	 	}
	 }//redirect
 
	 public void redirectToLast() {
	 	redirect(myViewHistory[1]);
	 }//redirectToLast
	 
	 
	 public void storeBean(String name, Object bean) {
	 	myBeanNames.addElement(name);
	 	myWebSession.putValue(name,bean);
	 }//storeBean
	 
	 public Object retrieveBean(String name) {
	 	return myWebSession.getValue(name);
	 }//retrieveBean

	 private void removeBeans() {
	 	try {
	 		for (int i=0; i< myBeanNames.size();i++) {
	 			myWebSession.removeValue((String)myBeanNames.elementAt(i));
	 		}
	 	} catch (IllegalStateException ex) {
	 		return;
	 	} catch (Exception ex) {
	 		JwmaKernel.getReference().debugLog().writeStackTrace(ex);
	 	}
	 }//removeBeans

	 private void storeLogin() {
	 	myLastLogin=getRequest().getRemoteHost();
	 }//setLastLogin
	 	 
/*** End web session related part *************************************************/
	 
/*** Mail session related part ****************************************************/

private void initMailSession(String password) throws JwmaException 
{
  try
  {
    //get session instance
    myMailSession = Session.getInstance(System.getProperties(), null);
    //setup store and connect to it
    myStore = myMailSession.getStore(JwmaKernel.getReference().getMailClientProtocol());
    myStore.connect(myHostname,myUsername,password);
			
    //log login
    JwmaKernel.getReference().sysLog().write(myUsername+"@"+myHostname+" logged in.");
  }
  catch(AuthenticationFailedException afe) //fail because myStore.connect or Store.connect
  {
    //cleanup
    myMailSession=null;
    myStore=null;
    //log
    JwmaKernel.getReference().sysLog().write(myUsername+"@"+myHostname+" authentication failed.");
    //throw JwmaException
    throw new JwmaException("Authentication failed.");		
  }
  catch (Exception e) 
  {
    //cleanup
    myMailSession=null;
    myStore=null;
    //log
    JwmaKernel.getReference().debugLog().write("Starting mailsession failed: ");
    JwmaKernel.getReference().debugLog().writeStackTrace(e);
    //throw JwmaException
    throw new JwmaException("Starting mailsession failed: "+e.getMessage());			
  }
}//initMailSession

	 private void endMailSession() {
	 	try {
			//close & disconnect
			myStore.close();
			//null all mailsession refs
			myMailSession=null;
			myStore=null;
			myActualFolder=null;
			myActualMailbox=null;
			myTrashFolder=null;
			myMessage=0;
	 	} catch (Exception ex) {
	 		JwmaKernel.getReference().debugLog().writeStackTrace(ex);
	 	}	
	 }//endMailSession
	 
	 public Session getMailSession(){
		return myMailSession;
	 }//getSession;
 
	 public Store getStore(){
		return myStore;
	 }//getStore;
	
	 public Folder getActualFolder(){
		return myActualFolder;
	 }//getActualFolder

	 public void setActualFolder(Folder f){
		myActualFolder = f;
	 }//setActualFolder
	
	 public void setActualMailbox(Folder f){
		myActualMailbox = f;
	 }//setActualMailbox
  
	 public Folder getActualMailbox(){
		return myActualMailbox;
	 }//getActualMailbox
  
	 public Folder getTrashFolder() {
		return myTrashFolder;
	 }//getTrashFolder
 
	 public void setTrashFolder(Folder f) {
		myTrashFolder = f;
	 }//setTrashFolder
  
  
	 public int getMessage() {
		return myMessage;
	 }//getMessage

	 public void setMessage(int m) {
		myMessage = m;
	 }//setMessage

/*** End mail session related part ********************************************/

	 public boolean isFirstTime() {
	 	return firsttime;
	 }//isFirstTime

 	
	 public JwmaPreferencesImpl getPreferences() {
    	return myPreferences;
	 }//getPreferences
 
	 public boolean savePreferences() {
		try {
			JwmaKernel.getReference().savePreferences(getFileName(),myPreferences);
			firsttime=false;
		} catch (Exception e) {
    		JwmaKernel.getReference().debugLog().writeStackTrace(e);
    		return false;
    	}
		return true;
	 }//savePreferences
         
         public void savePreferences(JwmaSession session)
         {
            FtpBean ftp = new FtpBean();
            try
            {
              ftp.ftpConnect(myHostname,myUsername,(String)session.retrieveBean("jwma.password"));
              JwmaPreferencesImpl myPreferences = session.getPreferences();
              String webmailconf = "#Java WEb Mail Project Configuration\n#2001 Pjung & Pommy All rights reserved.\n\n";
              //  1. set Alternative Signature
              //  Fix Bug here
              webmailconf = webmailconf + "altsignature=" + replacenewline(myPreferences.getAltSignature()) + "\n";
              //  2. set autosigning
              webmailconf = webmailconf + "autosigning=" + new Boolean(myPreferences.isAutoSigning()).toString() + "\n";
              //  3. set quotechar
              //  Fix Bug here
              webmailconf = webmailconf + "quotechar=" + myPreferences.getQuoteChar() + "\n";
              //  4. set autoquote
              webmailconf = webmailconf + "autoquote=" + new Boolean(myPreferences.isAutoQuote()).toString() + "\n";
              //  5. set rootfolder
              webmailconf = webmailconf + "rootfolder=" + myPreferences.getRootFolder() + "\n";
              //  6. set inbox
              webmailconf = webmailconf + "inbox=" + myPreferences.getInbox() + "\n";
              //  7. set sentmailarchive
              webmailconf = webmailconf + "sentmailarchive=" + myPreferences.getSentMailArchive() + "\n";
              //  8. set autoarchivesent
              webmailconf = webmailconf + "autoarchivesent=" + new Boolean(myPreferences.isAutoArchiveSent()).toString() + "\n";
              //  9. set readmailarchive
              webmailconf = webmailconf + "readmailarchive=" + myPreferences.getReadMailArchive() + "\n";
              //  10. set automoveread
              webmailconf = webmailconf + "automoveread=" + new Boolean(myPreferences.isAutoMoveRead()).toString() + "\n";
              //  11. set trashfolder
              webmailconf = webmailconf + "trashfolder=" + myPreferences.getTrashFolder() + "\n";
              //  12. set autoempty
              webmailconf = webmailconf + "autoempty=" + new Boolean(myPreferences.isAutoEmpty()).toString() + "\n";
              //  13. set urlensitive
              webmailconf = webmailconf + "urlensitive=" + new Boolean(myPreferences.isUrlSensitive()).toString() + "\n";
              //  14. set language
              webmailconf = webmailconf + "language=" + myPreferences.getLanguage() + "\n";
              
              //  now data for file .webmail is ready for transfer
              
              //  Check for .webmail.bak
              try
              {
                ftp.fileRename(".webmail.bak",".webmail.bak");
                //  Have .webmail.bak yet.
                ftp.putAsciiFile(".webmail",webmailconf,"\r\n");
              }
              catch (FtpException webmailbaknotfound)
              {
                //  Haven't .webmail.bak.
                try
                {
                  ftp.fileRename(".webmail",".webmail.bak");
                  ftp.putAsciiFile(".webmail",webmailconf,"\r\n");
                }
                catch (FtpException filewebmailnotfound)
                {
                  ftp.putAsciiFile(".webmail",webmailconf,"\r\n");
                }
              }// end save file .webmail
              
              //=============================================================================
              //  Prepare data for Signature file
              String signaturefile;
              if ((myPreferences.getPineConfig("signature-file") == null) || (myPreferences.getAllkeyPineConfig().length < 5))
              {
                signaturefile = ".signature";
              }
              else 
              {
                signaturefile = myPreferences.getPineConfig("signature-file")[0];
              }
              if (!myPreferences.getSignature().trim().equals(""))
              {
                try
                {
                  ftp.putAsciiFile(signaturefile,myPreferences.getSignature(),"\r\n");
                }
                catch (FtpException signatureerror)
                {
                  JwmaKernel.getReference().debugLog().write(myUsername + " Error to transfer signature file when logout");
                  JwmaKernel.getReference().debugLog().writeStackTrace(signatureerror);
                } //  end save signature file.
              }
              //=============================================================================
              //  Prepare data for addressbook file
              JwmaAddressBookImpl addressbook = myPreferences.getAddressBook();
              String[] allnickname = addressbook.listNicknames();
              String addbook = "";
              for (int i = 0; i < allnickname.length; i++) 
              {
                JwmaAddress addressdata = addressbook.getAddress(allnickname[i]);
                addbook = addbook + ToRightPattern(addressdata.getNickname(),addressdata.getFullname(),addressdata.getEmail(),addressdata.getFcc(),addressdata.getComment());
                if (i != allnickname.length - 1)
                {
                  addbook = addbook + "\n";
                }
              }
              String addressbookfile;
              if ((myPreferences.getPineConfig("address-book") == null) || (myPreferences.getAllkeyPineConfig().length < 5))
              {
                addressbookfile = ".addressbook";
              }
              else 
              {
                addressbookfile = myPreferences.getPineConfig("address-book")[0];
              }
              if (!addbook.equals(""))
              {
                try
                {
                  ftp.putAsciiFile(addressbookfile,addbook,"\r\n");
                }
                catch (FtpException addressbookerror)
                {
                  JwmaKernel.getReference().debugLog().write(myUsername + " transfer addressbook error when logout");
                  JwmaKernel.getReference().debugLog().writeStackTrace(addressbookerror);
                }
              }
              
              
              //=============================================================================
              //    Prepare Data for .pinerc
              if (myPreferences.getAllkeyPineConfig().length > 5)
              {
              String[] Allkeypinerc = myPreferences.getAllkeyPineConfig();
              String pinercdata = "";
              for (int i = 0; i < Allkeypinerc.length; i++) 
              {
                if (Allkeypinerc[i].equals("personal-name"))
                {
                    pinercdata = pinercdata + Allkeypinerc[i] + "=" + myPreferences.getFullname() + "\n";
                    JwmaKernel.getReference().debugLog().write("rename fullname");
                }
                else  if (myPreferences.getPineConfig(Allkeypinerc[i]) == null)
                {
                  pinercdata = pinercdata + Allkeypinerc[i] + "=\n";
                }
                else
                {
                    pinercdata = pinercdata + ConfigPattern(Allkeypinerc[i],myPreferences.getPineConfig(Allkeypinerc[i])) + "\n";
                }
              }
              try
              {
                ftp.fileRename(".pinerc.bak",".pinerc.bak");
                ftp.putAsciiFile(".pinerc",pinercdata,"\r\n");
                JwmaKernel.getReference().debugLog().write(myUsername + " write .pinerc without backup");
              }
              catch (FtpException pinercbackup)
              {
                try
                {
                  ftp.fileRename(".pinerc",".pinerc.bak");
                  ftp.putAsciiFile(".pinerc",pinercdata,"\r\n");
                  JwmaKernel.getReference().debugLog().write(myUsername + " write .pinerc with backup");
                }
                catch (FtpException pinercnotfound)
                {
                  ftp.putAsciiFile(".pinerc",pinercdata,"\r\n");
                  JwmaKernel.getReference().debugLog().write(myUsername + " webmail initialize  .pinerc with backup");
                }
              }
              }
              
              
              //=============================================================================
              
              
              ftp.close();
            }
            catch (FtpException ftpconnecterror)
            {
              JwmaKernel.getReference().debugLog().write(myUsername + " can't connect ftp when logout!");
              JwmaKernel.getReference().debugLog().writeStackTrace(ftpconnecterror);
            }
            catch (IOException ioex)
            {
              JwmaKernel.getReference().debugLog().write(myUsername + " can't connect ftp when logout! because IO error");
              JwmaKernel.getReference().debugLog().writeStackTrace(ioex);
            }
         }
 
	/**
	 * Loads this session instance's user's preferences.
	 */   
	 private void loadPreferences(String hostname,String username,String password) throws JwmaException 
         {
          ConfigBean pineConfig;
          try 
          {
            //use kernel function to load
            //myPreferences= JwmaKernel.getReference().loadPreferences(getFileName());
            myPreferences=JwmaKernel.getReference().getPreferencesTemplate();
            myPreferences.setMailClientProtocol(JwmaKernel.getReference().getMailClientProtocol());
            try
            {
              FtpBean ftp = new FtpBean();
              ftp.ftpConnect(hostname,username,password);
              try
              {
                try
                {
                  //==============================================================================================
                  //    Modify  16/3/2001 12:15PM
                  String webmailconf = ftp.getAsciiFile(".webmail","\r\n");
                  Properties props=new Properties();
                  StringBufferInputStream sb = new StringBufferInputStream(webmailconf);
                  props.load(sb);
                  //  1. Set Alternative Signature
                  if (props.getProperty("altsignature") != null && !props.getProperty("altsignature").equals("")) 
                  {
                    myPreferences.setAltSignature(props.getProperty("altsignature"));
                  }
                  //  2. Set AutoSign
                  if (props.getProperty("autosigning") != null && !props.getProperty("autosigning").equals("")) 
                  {
                    myPreferences.setAutoSigning(new Boolean(props.getProperty("autosigning")).booleanValue());
                  }
                  //  3. Set Quotechar
                  if (props.getProperty("quotechar") != null && !props.getProperty("quotechar").equals("")) 
                  {
                    myPreferences.setQuoteChar(props.getProperty("quotechar"));
                  }
                  //  4. Set AutoQuote
                  if (props.getProperty("autoquote") != null && !props.getProperty("autoquote").equals(""))
                  {
                    myPreferences.setAutoQuote(new Boolean(props.getProperty("autoquote")).booleanValue());
                  }
                  //  5. Set Root Folder
                  if (props.getProperty("rootfolder") != null && !props.getProperty("rootfolder").equals(""))
                  {
                    myPreferences.setRootFolder(props.getProperty("rootfolder"));
                  }
                  //  6. Set Inbox
                  if (props.getProperty("inbox") != null && !props.getProperty("inbox").equals(""))
                  {
                    myPreferences.setInbox(props.getProperty("inbox"));
                  }
                  //  7. Set sentmailarchive
                  if (props.getProperty("sentmailarchive") != null && !props.getProperty("sentmailarchive").equals(""))
                  {
                    myPreferences.setSentMailArchive(props.getProperty("sentmailarchive"));
                  }
                  //  8. Set autoarchivesent
                  if (props.getProperty("autoarchivesent") != null && !props.getProperty("autoarchivesent").equals(""))
                  {
                    myPreferences.setAutoArchiveSent(new Boolean(props.getProperty("autoarchivesent")).booleanValue());
                  }
                  //  9. Set readmailarchive
                  if (props.getProperty("readmailarchive") != null && !props.getProperty("readmailarchive").equals(""))
                  {
                    myPreferences.setReadMailArchive(props.getProperty("readmailarchive"));
                  }
                  //  10. Set automoveread
                  if (props.getProperty("automoveread") != null && !props.getProperty("automoveread").equals(""))
                  {
                    myPreferences.setAutoMoveRead(new Boolean(props.getProperty("automoveread")).booleanValue());
                  }
                  //  11. Set trashfolder
                  if (props.getProperty("trashfolder") != null && !props.getProperty("trashfolder").equals(""))
                  {
                    myPreferences.setTrashFolder(props.getProperty("trashfolder"));
                  }
                  //  12. Set autoempty
                  if (props.getProperty("autoempty") != null && !props.getProperty("autoempty").equals(""))
                  {
                    myPreferences.setAutoEmpty(new Boolean(props.getProperty("autoempty")).booleanValue());
                  }
                  //  13. Set urlensitive
                  if (props.getProperty("urlensitive") != null && !props.getProperty("urlensitive").equals(""))
                  {
                    myPreferences.setUrlSensitive(new Boolean(props.getProperty("urlensitive")).booleanValue());
                  }
                  //  14. Set language
                  if (props.getProperty("language") != null && !props.getProperty("language").equals(""))
                  {
                    myPreferences.setLanguage(props.getProperty("language"));
                  }
                }
                catch (FtpException webmailconfex)
                {
                  JwmaKernel.getReference().debugLog().write(myUsername + " .webmail not found");
                }
                //    End Get & Set Preferences from file .webmail
                //==============================================================================================
                
                String pineconfig = ftp.getAsciiFile(".pinerc","\r\n");
                JwmaKernel.getReference().debugLog().write(myUsername + " .pinerc OK");
                pineConfig = new ConfigBean(pineconfig);
                myPreferences.setPineConfig(pineConfig);
                JwmaKernel.getReference().debugLog().write(myUsername + " ConfigBean OK");
                if (myPreferences.getPineConfig("personal-name") != null)
                {
                  myPreferences.setFullname(myPreferences.getPineConfig("personal-name")[0]);
                  JwmaKernel.getReference().debugLog().write(myUsername + " : Fullname = " + myPreferences.getPineConfig("personal-name")[0]);
                }
                else
                {
                  //Call Finger class to get Fullname
                  //if fail Fullname use default from JwmaPreferencesImpl -> "  "(Space)
                }
                
                //====================================================================================
                //    Get and Set Signature File
                //    Modify 7/3/2001 00:05AM
                //
                String signaturefile;
                if (myPreferences.getPineConfig("signature-file") == null)
                {
                  signaturefile = ".signature";
                }
                else
                {
                  signaturefile = myPreferences.getPineConfig("signature-file")[0];
                }
                try
                {
                  String signature = ftp.getAsciiFile(signaturefile,"\r\n");
                  myPreferences.setSignature(signature);
                  JwmaKernel.getReference().debugLog().write(myUsername + " Signature OK");
                }
                catch (FtpException no_signaturefile)
                {
                  JwmaKernel.getReference().debugLog().write(myUsername + " no signature file");
                }
                //====================================================================================
                //  Get and set AddressBook
                //  Modify 7/3/2001 00:06AM
                String addressbookfile;
                if (myPreferences.getPineConfig("address-book") == null)
                {
                  addressbookfile = ".addressbook";
                }
                else
                {
                  addressbookfile = myPreferences.getPineConfig("address-book")[0];
                }
                try
                {
                  JwmaKernel.getReference().debugLog().write(myUsername + " before get addressbook");
                  String addressbookdata = ftp.getAsciiFile(addressbookfile,"\r\n");
                  JwmaKernel.getReference().debugLog().write(myUsername + " after get addressbook");
                  AddressBookBean adb = new AddressBookBean(addressbookdata);
                  Hashtable testadb = new Hashtable();
                  String[] allnicknames = adb.listNicknames();
                  for (int i =0; i < allnicknames.length ; i++) 
                  {
                    testadb.put(allnicknames[i],new JwmaAddressImpl(allnicknames[i],adb.getFullname(allnicknames[i]),adb.getEmailAddress(allnicknames[i]),adb.getFCC(allnicknames[i]),adb.getComment(allnicknames[i])));
                  }
                  myPreferences.getAddressBook().setAddresses(testadb);
                  JwmaKernel.getReference().debugLog().write(myUsername + " AddressBook OK");
                }
                catch (FtpException no_addressbookfile)
                {
                  JwmaKernel.getReference().debugLog().write(myUsername + " no AddressBook file");
                }
                catch (Exception ex)
                {
                  JwmaKernel.getReference().debugLog().write(myUsername + " error when parse addressbook file");
                  JwmaKernel.getReference().debugLog().writeStackTrace(ex);
                }
                //====================================================================================
              }
              catch (FtpException no_pinerc)
              {
                JwmaKernel.getReference().debugLog().write(myUsername + " no .pinerc");
              }
            }
            catch (FtpException ftpex)
            {
              JwmaKernel.getReference().debugLog().write(myUsername + " Login Fail");
            }
          } 
          catch (Exception ex) 
          {
            JwmaKernel.getReference().debugLog().write("Failed to load preferences:");
            JwmaKernel.getReference().debugLog().writeStackTrace(ex);
          } 
          finally 
          {
            //store jwmapreferences information
            storeBean("jwma.preferences",getPreferences());
          }
          JwmaKernel.getReference().debugLog().write(myUsername + " end load Preferences");
	 }//loadPreferences
         
	 private String getFileName() {
	 	return (myUsername+"@"+myHostname+".xml");
	 }//getFileName
 
 	 public String getSenderIdentity() {
	 	return (myPreferences.getFirstname()+" "+myPreferences.getLastname()+" <"+myUsername+"@"+myHostname+">");
	 }//getSenderIdentity
	
	 public String getSenderAddress() {
	 	return myUsername+"@"+myHostname;
	 }//getSenderAddress
	
	 public void end(JwmaSession session){
	 	try {
	 		//store new last login
	 		myPreferences.setLastLogin(myLastLogin);
	 		
                        
	 		//for safety, make actual prefs persistent
                        //========================================================================
                        //      Modify  16/3/2001 10:10AM
			savePreferences(session);
                        //========================================================================
                        
			//end mailsession
			endMailSession();
	 
	 		//end websession
	 		removeBeans();
	 		redirect(JwmaKernel.LOGGEDOUT_VIEW);
		
	 		//log
	 		JwmaKernel.getReference().sysLog().write(myUsername+"@"+myHostname+"'s session ended.");
	 	} finally {
	 		myWebSession=null;
                        //myWebSession.invalidate();
	 		died=true;
                        JwmaKernel.getReference().sysLog().write(myUsername+"@"+myHostname+" died");
	 	}
	 }//end
	 public void end(){
	 	try {
	 		//store new last login
	 		myPreferences.setLastLogin(myLastLogin);
	 		
                        
	 		//for safety, make actual prefs persistent
                        //========================================================================
                        //      Modify  16/3/2001 10:10AM
			//savePreferences();
                        //========================================================================
                        
			//end mailsession
			endMailSession();
	 
	 		//end websession
	 		removeBeans();
	 		redirect(JwmaKernel.LOGGEDOUT_VIEW);
		
	 		//log
	 		JwmaKernel.getReference().sysLog().write(myUsername+"@"+myHostname+"'s session ended.");
	 	} finally {
	 		myWebSession=null;
	 		died=true;
	 	}
	 }//end
 
 	 public void finalize() {
 	 	if(!died) {
 	 		end();
 	 	}
 	 }//finalize
 
 	 public static JwmaSession createJwmaSession(String hostname,String username,String password,HttpServletRequest req,HttpServletResponse res) 
 	 		throws JwmaException {
 	 		
 	 	JwmaSession session=new JwmaSession(username,hostname);
 	 	session.setRequest(req);
		session.setResponse(res);
		session.setWebSession(req.getSession(false));
 	 	//init the mailsession
 	 	session.initMailSession(password);
 	 	
 	 	//store jwmasession information
 	 	session.storeBean("jwma.session",session);
 	 	
 	 	//load the preferences
 	 	//session.loadPreferences();
                session.loadPreferences(hostname,username,password);
 	 	
 	 	session.storeLogin();
 	 	
 	 	return session;
 	 }//createJwmaSession

  public String ToRightPattern(String nickname,String fullname,String email,String fcc,String comment)
  {
    String tmp;
    tmp = nickname.trim() + "\t";         //nickname<TAB>
    if (fullname.trim().equals("")) 
    {
      tmp = tmp + "\t";
    }
    else
    {
      tmp = tmp + fullname.trim() + "\t";
    }//end of nickname<TAB>fullname<TAB>
    //==================================================================================
    //    Special Case for E-mail Address
    if (email.trim().equals(""))
    {
      tmp = tmp;
    }
    else 
    {
      if (email.indexOf(",") == -1) 
      {
        tmp = tmp + email.trim();
      }
      else 
      {
        tmp = tmp + "(" + email.trim() + ")";
      }
    }//end of nickname<TAB>fullname<TAB>email
    //==================================================================================
    if (!fcc.trim().equals("") && !comment.trim().equals(""))
    {
      if (fcc.trim().equals("")) 
      {
        tmp = tmp + "\t";
      }
      else 
      {
        tmp = tmp + "\t" + fcc.trim();
      }//end of nickname<TAB>fullname<TAB>email<TAB>FCC
      if (comment.trim().equals("")) 
      {
        tmp = tmp + "\t";
      }
      else 
      {
        tmp = tmp + "\t" + comment.trim();
      }//end of nickname<TAB>fullname<TAB>email<TAB>FCC<TAB>Comment
    }
    return tmp;
  } 
  public String ConfigPattern(String key,String[] value)
  {
    String temp = "";
    temp = key + "=";   //  key=
    if (value.length == 1) 
    {
      temp = temp + value[0];   // key=value
    }
    else 
    {
      for (int i = 0; i < value.length; i++) 
      {
        if (i == 0)
        {
          temp = temp + value[i] + ",\n"; //  key=value,<newline>
        }
        else if (i != value.length - 1)
        {
          temp = temp + "\t" + value[i] + ",\n";
        }
        else if (i == value.length - 1)
        {
          temp = temp + "\t" + value[i];
        }
      }
    }
    return temp;
  }
  public String replacenewline(String text)
  {
    String temp = "";
    while (text.indexOf("\n") != -1)
    {
      temp = text;
      String temp1 = text.substring(0,text.indexOf("\n"));
      String temp2 = text.substring(text.indexOf("\n"));
      
      //temp1.replace('\n','<');
      temp1 = temp1 + "\\n";  // abc\n --> abc<br>
      
      if (temp2.indexOf("\n") != temp2.length()-1) 
      {
        temp2 = temp2.substring(temp2.indexOf("\n") + 1,temp2.length());  // \nabc --> abc
      }
      else
      {
        temp2 = temp2.trim(); //  abc\n --> abc
      }
      text = temp1 + temp2;
    }
    
    while (text.indexOf("\r") != -1)
    {
      temp = text;
      String temp1 = text.substring(0,text.indexOf("\r"));
      String temp2 = text.substring(text.indexOf("\r"));
      
      //temp1.replace('\n','<');
      temp1 = temp1 + "\\r";  // abc\n --> abc<br>
      
      if (temp2.indexOf("\r") != temp2.length()-1) 
      {
        temp2 = temp2.substring(temp2.indexOf("\r") + 1,temp2.length());  // \nabc --> abc
      }
      else
      {
        temp2 = temp2.trim(); //  abc\n --> abc
      }
      text = temp1 + temp2;
    }
    
    
    temp = text;
    return temp;
  }
  
}//class JwmaSession
