package dtw.webmail.model;

import javax.mail.internet.InternetAddress;

public interface JwmaAddress {

	 public String getNickname();

	 public String getFirstname();

	 public String getLastname();

	 public String getEmail();

	 public String getComment();

	 public boolean isShared();
	 
	 public boolean isFrequentRecipient();
         
         //===================================================
         //   Modify 7/3/2001 01:05AM
         public String getFullname();
         public String getFcc();
	
}//JwmaAddress