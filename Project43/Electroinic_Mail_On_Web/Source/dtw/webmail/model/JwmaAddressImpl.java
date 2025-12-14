package dtw.webmail.model;

import java.io.UnsupportedEncodingException;
import javax.mail.internet.InternetAddress;

 public class JwmaAddressImpl implements JwmaAddress {

	//instance attributes
	private String myFirstname;
	private String myLastname;
	private String myNickname;
	private String myEmail;
	private String myComment;
	private boolean shared;
	private boolean frequentRecipient;
        //=====================================================================
        //    Modify 7/3/2001 00:31AM
        private String myFullname;
        private String myFCC;
	
        public void setFullname(String fullname)
        {
          myFullname = fullname;
        }
        public String getFullname()
        {
          if (myFullname == null) 
          {
            return "";
          }
          else 
          {
            return myFullname;
          }
        }
        
        public void setFcc(String fcc)
        {
          myFCC = fcc;
        }
        public String getFcc()
        {
          if (myFCC == null)
          {
            return new String("");
          }
          else 
          {
            return myFCC;
          }
        }
        //new constructor
        public JwmaAddressImpl(String nickname,String fullname,String email,String fcc,String comment)
        {
          myNickname = nickname;
          myFullname = fullname;
          myEmail = email;
          myFCC = fcc;
          myComment = comment;
          shared=false;
          frequentRecipient=false;
        }
        //=====================================================================
        
        
	 public JwmaAddressImpl() {
		shared=false;
		frequentRecipient=false;
	 }//constructor
	
	 public String getFirstname() {
		return myFirstname;
	 }//getFirstname
	
	 public void setFirstname(String str) {
		myFirstname=str;
	 }//setFirstname
	
	 public String getLastname() {
		return myLastname;
	 }//getLastname

	 public void setLastname(String str) {
		myLastname=str;
	 }//setLastname
	
	 public String getNickname() {
		return myNickname;
	 }//getNickname

	 public void setNickname(String str) {
		myNickname=str;
	 }//setNickname
	
	public String getEmail() 
        {
          if (myEmail == null)
          {
            return "";
          }
          else 
          {
            return myEmail;
          }
	}//getEmail

	 public void setEmail(String str) {
		myEmail=str;
	 }//setEmail
	
	
	 public InternetAddress getInternetAddress() {
		try {
			return new InternetAddress(getEmail(),getFirstname()+" "+getLastname());
		} catch (UnsupportedEncodingException ucex) {
			return null;
		}
	 }//getInternetAddress
	
	 public String getComment() 
         {
          if (myComment == null)
          {
            return "";
          }
          else 
          {
            return myComment;
          }
	 }//getComment

	 public void setComment(String str) {
		if(str==null) {
			myComment="";
		} else {
			myComment=str;
		}
	 }//setComment
	
	 public boolean isShared() {
		return shared;
	 }//isShared

	 public void setShared(boolean b) {
		shared=b;	
	 }//setShared
	
	 public boolean isFrequentRecipient() {
		return frequentRecipient;
	 }//isFrequentRecipient

	 public void setFrequentRecipient(boolean b) {
		frequentRecipient=b;
	 }//setFrequentRecipient
	
}//JwmaAddressImpl