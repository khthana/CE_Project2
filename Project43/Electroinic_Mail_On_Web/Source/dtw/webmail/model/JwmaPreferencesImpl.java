package dtw.webmail.model;

import java.util.*;
import java.text.SimpleDateFormat;
import dtw.webmail.JwmaKernel;
//=============================================================
import ConfigBean;
//=============================================================

public class JwmaPreferencesImpl implements JwmaPreferences, Cloneable {

	//class attribute
	private static SimpleDateFormat df=new SimpleDateFormat("E, dd.MMM yyyy hh:mm:ss (z)");
	

	//instance attributes
	private String firstname="";  //"firstname";
	private String lastname="";   //"lastname";

        
	private String lastlogin="Never.";

	private String signature= "";   //"-------------------\n";
	private String altSignature=""; //"-------------------\n";
	
	private String quotechar=">";
	
	private boolean autoquote=false;
	private boolean autosign=true;


	private String myRootFolder="mail";
	private String myInbox="Inbox";
	private String sentMailArchive="sent-mail";
	private String readMailArchive="read-mail";
	private String trashFolder="trash";	


	private boolean autoarchivesent=false;	
	private boolean automoveread=false;
	private boolean autoempty=false;

	
	private boolean UrlSensitive=true;
	private String language="en";

	//Associations
	private JwmaAddressBookImpl addressBook;
        
        //=============================================================
        //  Modify 6/3/2001 11:25PM
	private String fullname="";   //"fullname";        
        private ConfigBean pineconfig;
        private String MailProtocol;
        //=============================================================
        public void setPineConfig(ConfigBean pineConf)
        {
          pineconfig = pineConf;
        }
        public String[] getPineConfig(String key)
        {
          return pineconfig.getValue(key);
        }
        public String[] getAllkeyPineConfig()
        {
          return pineconfig.getAllkeys();
        }
        public void setMailClientProtocol(String protocol)
        {
          MailProtocol = protocol;
        }
        public String getMailClientProtocol()
        {
          return MailProtocol;
        }
        //=============================================================

	/**
	 * Constructs a JwmaPreferences instance.
	 */
 	 public JwmaPreferencesImpl(){
 	 }//constructor

/**** personal data part ***************************************/

	 public String getFirstname(){
		return firstname;
	 }//getFirstname

	 public void setFirstname(String fname){
		firstname=fname;
	 }//setFirstname

	 public String getLastname(){
		return lastname;
	 }//getLastname

	 public void setLastname(String lname){
		lastname=lname;
	 }//setLastname
         public String getFullname()
         {
          return fullname;
         }//getFullname
         public void setFullname(String fname)
         {
          fullname=fname;
         }//setFullname
        

/**** personal data part end ***********************************/


/**** Security additions ***************************************/

	 public void setLastLogin(String address){
	 	lastlogin=(df.format(new Date())+ " from " + address);
	 }//setLastLogin

	 public String  getLastLogin(){
		if (lastlogin==null) {
			return "";
		} else {
			return lastlogin;
		}
	 }//getLastLogin

/**** end Security additions ***********************************/


/**** Signatures part ******************************************/


	 public String getSignature(){
	 	return signature;
	 }//getSignature

	 public void setSignature(String sig){
		signature=sig;
	 }//setSignature 

	 public boolean isSignable(){
		if (getSignature()==null || getSignature().equals("")) { 
			return false;
		} else {
			return true;
		}
	 }//isSignable

	 public String getAltSignature(){
		return altSignature;
	 }//getAltSignature

	 public void setAltSignature(String sig){
		altSignature=sig;
	 }//setAltSignature 

	 public boolean isAltSignable(){
		if (getAltSignature()==null || getAltSignature().equals("")) {
			return false;
		} else {
			return true;
		}
	 }//isAltSignable

	 public void setAutoSigning(boolean b){
	 	autosign=b;
	 }//setAutoSigning

	 public boolean isAutoSigning(){
	 	return autosign;
	 }//isAutoSigning

/**** end Signatures part **************************************/


/**** Quoting part *********************************************/

	 public String getQuoteChar(){
		return quotechar;
	 }//getQuoteChars

	 public void setQuoteChar(String qc) {
		quotechar=""+qc.charAt(0);
	 }//setQuoteChars

	 public boolean isAutoQuote(){
		return autoquote;
	 }//isAutoQuote

	 public void setAutoQuote(boolean doquote){
		autoquote=doquote;
	 }//setAutoQuote

/**** end Quoting part *****************************************/


/**** Auto message handling part *******************************/

	 public String getRootFolder() {
	 	return myRootFolder;
	 }//getRootFolder

	 public void setRootFolder(String str) {
	 	myRootFolder=str;
	 }//setRootFolder
	 
	 public boolean isAutoArchiveSent(){
		return autoarchivesent;
	 }//isAutoArchiveSent

	 public void setAutoArchiveSent(boolean doarchive){
		autoarchivesent=doarchive;
	 }//setAutoArchiveSent

	 public String getSentMailArchive(){
		return sentMailArchive;
	 }//getSentMailArchive

	 public void setSentMailArchive(String foldername){
		sentMailArchive=foldername;
	 }//setSentMailArchive


	 public boolean isAutoMoveRead(){
		return automoveread;
	 }//isAutoMoveRead

	 public void setAutoMoveRead(boolean domoveread){
		automoveread=domoveread;
	 }//setAutoMoveRead

	 public String getReadMailArchive(){
		return readMailArchive;
	 }//getReadMailArchive

	 public void setReadMailArchive(String foldername){
		readMailArchive=foldername;
	 }//setReadMailArchive

	 public String getTrashFolder(){
		return trashFolder;
	 }//getTrashFolder

	 public void setTrashFolder(String foldername){
		trashFolder=foldername;
	 }//setTrashFolder

	 public String getInbox(){
		return myInbox;
	 }//getInbox

	 public void setInbox(String foldername){
		myInbox=foldername;
	 }//setInbox

	 public void setAutoEmpty(boolean b) {
		autoempty=b;
		//JwmaKernel.getReference().debugLog().write("setAutoEmpty:"+b);
	 }//setAutoEmpty

	 public boolean isAutoEmpty(){
		//JwmaKernel.getReference().debugLog().write("isAutoEmpty:"+autoempty);
		return autoempty;
	 }//isAutoEmptying


	 public void setUrlSensitive(boolean b){
 		UrlSensitive=b;
	 }//setUrlSensitive

	 public boolean isUrlSensitive(){
 		return UrlSensitive;
	 }//isUrlSensitive
 
/**** end Auto message handling part ***************************/


/**** Addressbook Access ***************************************/

	 public JwmaAddressBookImpl getAddressBook(){
	 	return addressBook;
	 }//getAddressBook

	 public void setAddressBook(JwmaAddressBookImpl book) {
	 	book.fixCastorBug();
	 	addressBook=book;
	 }//setAddressBook
	 
/**** End Addressbook Access ***********************************/


/**** Language Settings ****************************************/

	public String getLanguage() {
		return language;
	}//getLanguage

	public void setLanguage(String str) {
		language=str;
	}//setLanguage
	
/**** end language Settings ************************************/

	public JwmaPreferencesImpl getClone() {
		try {
			return (JwmaPreferencesImpl)this.clone();
		} catch (Exception ex) {
			return null;
		}
	}//getClone 
	
}//class JwmaPreferencesImpl