package dtw.webmail.model;

 public interface JwmaPreferences {

	 public String getFirstname();
	 
	 public String getLastname();

	 public String  getLastLogin();
	 
	 public String getSignature();

	 public boolean isSignable();

	 public String getAltSignature();

	 public boolean isAltSignable();

	 public boolean isAutoSigning();

	 public String getQuoteChar();
	 
	 public boolean isAutoQuote();

	 public String getRootFolder();
	 
	 public String getInbox();

	 public boolean isAutoArchiveSent();

	 public String getSentMailArchive();

	 public boolean isAutoMoveRead();

	 public String getReadMailArchive();

	 public boolean isAutoEmpty();

	 public String getTrashFolder();

	 public boolean isUrlSensitive();

	 public String getLanguage() ;

	 public JwmaAddressBookImpl getAddressBook();
         
         //=============================================================
         //   Modify 7/3/2001 01:17PM
         public String getFullname();
	
}//class JwmaPreferences