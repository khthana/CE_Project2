package dtw.webmail.model;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class JwmaMessageInfoImpl implements JwmaMessageInfo { 
	
	//Member
	private boolean read;
	private boolean answered;
	private boolean recent;
	private boolean deleted;
	
	private boolean received;
	private Date myDate;
	
	private String myFrom;
	private String myTo;
	
	private String mySubject;
	
	private int messageNumber;
	private boolean singlepart;
	
	private JwmaMessageInfoImpl(int number) {
		messageNumber=number;
	}//constructor
	
	public int getMessageNumber(){
		return messageNumber;
	}//getMessageNumber
	
	public boolean isRead() {
		return read;	
	}//isRead
	
	private void setRead(boolean b) {
		read=b;
	}//setRead
	
	public boolean isAnswered() {
		return answered;
	}//isAnswered
	
	private void setAnswered(boolean b) {
		answered=b;
	}//setAnswered
	
	public boolean isDeleted() {
		return deleted;
	}//isDeleted
	
	private void setDeleted(boolean b) {
		deleted=b;
	}//setDeleted
	
	public boolean isNew() {
		return recent;
	}//isNew
	
	private void setNew(boolean b) {
		recent=b;
	}//setNew
	
	public boolean isReceived() {
		return received;
	}//isReceived
	
	private void setReceived(boolean b) {
		received=b;
	}//setReceived
	
	public boolean isSent() {
		return !received;
	}//isSent
	
	public Date getDate() {
		return myDate;
	}//getDate
	
	private void setDate(Date d) {
		myDate=d;
	}//setDate
	
	public String getFrom() {
		return myFrom;
	}//getFrom
	
	private void setFrom(String from) {
		myFrom=from;
	}//setFrom
	
	public String getTo() {
		return myTo;
	}//getTo
	
	private void setTo(String to) {
		myTo=to;
	}//setTo
	
	public String getSubject() {
		return mySubject;
	}//getSubject 

	private void setSubject(String subject) {
		try {
			if(subject==null) {
				mySubject="";
			} else {
				mySubject=MimeUtility.decodeText(subject);
			}
		} catch (Exception ex) {
			mySubject="";
		}
	}//setSubject

	public boolean isSinglepart() {
		return singlepart;
	}//isSinglepart
	
	public boolean isMultipart() {
		return !singlepart;
	}//isMultipart
	
	private void setSinglepart(boolean b) {
		singlepart=b;
	}//setSinglepart
	
	public static JwmaMessageInfo createJwmaMessageInfo(Message msg,String owner) {
	
		JwmaMessageInfoImpl messageinfo=null;
		
		try {
			//create instance with number
			messageinfo=new JwmaMessageInfoImpl(msg.getMessageNumber());
			
			//set flags
			messageinfo.setNew(msg.isSet(Flags.Flag.RECENT));
			messageinfo.setRead(msg.isSet(Flags.Flag.SEEN));
			messageinfo.setAnswered(msg.isSet(Flags.Flag.ANSWERED));
			messageinfo.setDeleted(msg.isSet(Flags.Flag.DELETED));
			        	
			//senders and receivers
			messageinfo.setFrom(InternetAddress.toString(msg.getFrom()));
			messageinfo.setTo(InternetAddress.toString(msg.getRecipients(Message.RecipientType.TO)));
			
			//Only one date is actually important, we should know first which
			//we want.
			//so set properly the flag
			//that a view programmer can know what to place in the who :) 
        	if(messageinfo.getFrom().indexOf(owner)!=-1) {
        		messageinfo.setReceived(false);
        	} else {
        		messageinfo.setReceived(true);
        	}
        	
        	
        	if(messageinfo.isReceived()) {
				messageinfo.setDate(msg.getReceivedDate());
        	}else {
    			messageinfo.setDate(msg.getSentDate());
        	}

			
        	//subject
        	messageinfo.setSubject(msg.getSubject());
        	
        	//singlepart=no attachment, all other=has attachment
        	messageinfo.setSinglepart(msg.isMimeType("text/plain"));
        	
        } catch (MessagingException ex) {
        	//handle properly
        }	
      
		
		return messageinfo;
	}//createJwmaMessageInfo

}//class JwmaMessageInfoImpl