package dtw.webmail.model;

import java.util.*;
import java.io.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import dtw.webmail.JwmaKernel;

public class JwmaComposeMessage implements JwmaMessage {

	//instance attributes
	private boolean reply;
	private StringBuffer myBody;
	private MimeMessage myMessage;
	private MimeMultipart myAttachments;
	private boolean singlepart=true;
	
	 private JwmaComposeMessage() {
	 }//constructor

	 private JwmaComposeMessage(MimeMessage msg) {
		myMessage=msg;
		myAttachments=new MimeMultipart();
		try {
			myMessage.setHeader("X-Mailer", MimeUtility.encodeText(xcredit));
		} catch (Exception ex) {
		}
	 }//constructor
	
	 public int getMessageNumber(){
		return -1;
	 }//getMessageNumber
	
	 public Date getDate() {
		return new Date();
	 }//getDate

	 public boolean isSent() {
		return false;
	 }//isSent

	 public boolean isReceived() {
		return false;
	 }//isReceived
	
	 public boolean isReply() {
		return reply;
	 }//isReply

	 private void setReply(boolean b) {
		reply=b;
	 }//setReply

	 public String getFrom() {
		try {
			return InternetAddress.toString(myMessage.getFrom());
		} catch (Exception ex) {
			return "";
		}
	 }//getFrom
	
	 public void setFrom(String from) {
		try {
			myMessage.setFrom(new InternetAddress(from));
		} catch (Exception ex) {
			
		}
	 }//setFrom
	
	 public String getTo() {
		String str="";
		try {
			str=InternetAddress.toString(myMessage.getRecipients(Message.RecipientType.TO));
			if(str==null) {
				str="";
			}
		} catch (Exception ex) {
			return str;
		} 
		return str;
	 }//getTo
	
	 public void setTo(String to) 
			throws MessagingException {
			
		myMessage.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
	 }//setTo
	
	 public String getCCTo() {
		String str="";
		try {
			str=InternetAddress.toString(myMessage.getRecipients(Message.RecipientType.CC));
			if(str==null) {
				str="";
			}
		} catch (Exception ex) {
			return str;
		}
		return str;
	 }//getCCTo

	 public void setCCTo(String ccto) 
			throws MessagingException {
		myMessage.setRecipients(Message.RecipientType.CC,InternetAddress.parse(ccto));	
	 }//setCCTo;

	 public String getBCCTo() {
		String str="";
		try {
			str=InternetAddress.toString(myMessage.getRecipients(Message.RecipientType.BCC));
			if(str==null) {
				str="";
			}
		} catch (Exception ex) {
			return str;
		}
		return str;
	 }//getBCCTo

	 public void setBCCTo(String bccto) 
			throws MessagingException {
			
			myMessage.setRecipients(Message.RecipientType.BCC,InternetAddress.parse(bccto));		
	 }//setBCCTo;

	 public String getSubject() {
		String str="";
		try {
			str=MimeUtility.decodeText(myMessage.getSubject());
			if(str==null) {
				str="";
			}
		} catch (Exception ex) {
			return str;
		}
		return str;
	 }//getSubject

	 public void setSubject(String subject) 
			throws Exception {
			
		if(subject!=null) {
			myMessage.setSubject(MimeUtility.encodeText(subject));
		} else {
			throw new MessagingException("Cannot set null subject.");
		}
	 }//setSubject
	
	 public String getBody() {
		if(myBody==null || myBody.length()==0) {
			return "";
		} else {
			return myBody.toString();
		}
	 }//getBody

	 public void setBody(String body) {
		if(body!=null) {
			myBody=new StringBuffer(body);
		} else {
			myBody=new StringBuffer();
		}
	 }//setBody

	 public void appendBody(String str) {
		if(myBody==null) {
			myBody=new StringBuffer(str);
		} else {
			myBody.append(str);
		}
	 }//appendBody
	 
	  public void setAttachments(MimeMultipart mmp) {
		myAttachments=mmp;
		singlepart=false;
	  }//addAttachment 
	 
	 public boolean isSinglepart() {
		return singlepart;
	 }//isSinglepart
	
	 public boolean isMultipart() {
		return !singlepart;
	 }//isMultipart
	 
	 public JwmaMessagePart[] getMessageParts() {
		return new JwmaMessagePart[0];
	 }//getMessageParts
	
	 public Message getMessage() {
		return myMessage;	
	 }//getMessage
	 
	 public void send() throws MessagingException {
		
		//Assert from to is automatically
		if (getFrom()==null || getFrom().equals("")) {
			throw new SendFailedException("Sender not specified.");
		}
		
		//set content either single or multipart
		if(isMultipart()) {
			
			//body represents the first part
			if(getBody()!=null && getBody().length()>0) {
				MimeBodyPart bodypart=new MimeBodyPart();
    			bodypart.setText(getBody());
    			myAttachments.addBodyPart(bodypart,0);
    		}
   			
   			//lets set the content
			myMessage.setContent(myAttachments);
			
			//debug output
			/* Debug output, would write the message to the
			   debuglog
			try {
				
				ByteArrayOutputStream bout=new ByteArrayOutputStream();
     			myMessage.writeTo(bout);
     			JwmaKernel.getReference().debugLog().write(bout.toString());
     				
			} catch (Exception ex) {
				JwmaKernel.getReference().debugLog().writeStackTrace(ex);
			}
			*/
		} else {
			myMessage.setText(getBody());
		}
		
		Transport.send(myMessage);
	 }//prepareMessage
	 
	 public static JwmaComposeMessage createJwmaComposeMessage(Session ses) {
	 	
		JwmaComposeMessage message=null;
	
		message=new JwmaComposeMessage(new MimeMessage(ses));
		message.setReply(false);
		
		return message;
	 }//createJwmaComposeMessage
	
	 public static JwmaComposeMessage createJwmaComposeMessage(Message msg, boolean toall) {
	
		JwmaComposeMessage message=null;
		try {
			message=new JwmaComposeMessage((MimeMessage)msg.reply(toall));
			message.setReply(true);
			
		} catch (MessagingException ex) {
			//handle!?
		}
		return message;
		
	 }//createJwmaComposeMessage
	

 	private static String xcredit = "jwma";
	
	
}//class JwmaMessage