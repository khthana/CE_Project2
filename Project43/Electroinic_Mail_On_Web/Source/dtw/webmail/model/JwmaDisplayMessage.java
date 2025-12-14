package dtw.webmail.model;

import dtw.webmail.JwmaKernel;
import java.util.*;
import java.io.IOException;
import javax.mail.*;
import javax.mail.internet.*;

public class JwmaDisplayMessage implements JwmaMessage {

	//instance attributes
	private boolean received;
	private int myNumber;
	private Date myDate;
	private String myFrom;
	private String myTo;
	private String mySubject;
	private String myBody;
	private boolean singlepart;
	private String myCC;
	private String myBCC;
	private JwmaMessagePart[] myMessageParts;
	
	
	 protected JwmaDisplayMessage(int number) {
		myNumber=number;
	 }//constructor

	 public int getMessageNumber(){
		return myNumber;
	 }//getMessageNumber
		
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
	
	 public String getCCTo() {
		return myCC;
	 }//getCC

	 private void setCCTo(String cc) {
		myCC=cc;
	 }//setCC
	
	 public String getBCCTo(){
		return myBCC;
	 }//getBCCTo

	 private void setBCCTo(String bcc) {
		myBCC=bcc;
	 }//setBCC
	
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
	
	 private void setSinglepart(boolean b) {
		singlepart=b;
	 }//setSinglepart
	
	 public boolean isMultipart() {
		return !singlepart;
	 }//isMultipart
	
	 public String getBody() {
		return myBody;
	 }//getBody

	 public void setBody(String body) {
		myBody=body;
	 }//setBody;
	
	 public JwmaMessagePart[] getMessageParts() {
		return myMessageParts;
	 }//getMessageParts

	 private void setMessageParts(JwmaMessagePart[] parts) {
		myMessageParts=parts;
	 }//setMessageParts
	
	
	 public static JwmaDisplayMessage createJwmaDisplayMessage(Message msg, String owner) {
		
		JwmaDisplayMessage message=null;
		
		try {
		
			//create instance with number
			message=new JwmaDisplayMessage(msg.getMessageNumber());
        	
			//senders and receivers
			message.setFrom(InternetAddress.toString(msg.getFrom()));
			message.setTo(InternetAddress.toString(msg.getRecipients(Message.RecipientType.TO)));
			message.setCCTo(InternetAddress.toString(msg.getRecipients(Message.RecipientType.CC)));
			message.setBCCTo(InternetAddress.toString(msg.getRecipients(Message.RecipientType.BCC)));
        	
        	//Only one date is actually important, we should know first which
			//we want.
			//so set properly the flag
			//that a view programmer can know what to place in the who :) 
        	if(message.getFrom().indexOf(owner)!=-1) {
        		message.setReceived(false);
        	} else {
        		message.setReceived(true);
        	}
        	
        	if(message.isReceived()) {
				message.setDate(msg.getReceivedDate());
        	}else {
    			message.setDate(msg.getSentDate());
        	}

        	
        	//subject
        	message.setSubject(msg.getSubject());
        	
        	//content
			if (msg.isMimeType("text/plain")) {
				//set singlepart 
				message.setSinglepart(true);
				//set textbody
				try {
					message.setBody((String) msg.getContent());
				} catch (IOException ex) {
					//handle!?
                                        JwmaKernel.getReference().debugLog().write(" mail puzzle in first if");
					message.setBody("System puzzled by corrupt singlepart message.");
                                        
				}
			} else if (msg.isMimeType("multipart/*")){
				try {
					//iterate over parts to create the infos
					Multipart mp=(Multipart)msg.getContent();
					
					//set multipart
					message.setSinglepart(false);
				
					JwmaMessagePart[] parts=new JwmaMessagePart[mp.getCount()];
					for (int i = 0; i < mp.getCount(); i++) {
						parts[i]=
						JwmaMessagePartImpl.createJwmaMessagePartImpl(mp.getBodyPart(i),i);
		   			}
		   			message.setMessageParts(parts);
				} catch (IOException ex) {
					//handle!?
					message.setSinglepart(true);
                                        JwmaKernel.getReference().debugLog().write(" mail puzzle in second if");
					message.setBody("System puzzled by corrupt multipart message.");
				}
	  		} else {
	  			message.setSinglepart(true);
                                JwmaKernel.getReference().debugLog().write(" mail puzzle in third if");
				message.setBody("System puzzled by corrupt format of message.");
	  		}
		
			//this means that the message was read, 
			//IMPORTANT: the folder has to be still open in R/W before entering here!!!!
			if (!msg.isSet(Flags.Flag.SEEN)) {
				msg.setFlag(Flags.Flag.SEEN,true);
				msg.saveChanges();
			}
			
			
        } catch (MessagingException ex) {
        	//handle properly
        }	
      	
		return message;
		
	}//createJwmaDisplayMessage
		
}//class JwmaDisplayMessage