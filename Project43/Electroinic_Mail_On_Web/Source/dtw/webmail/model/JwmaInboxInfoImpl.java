package dtw.webmail.model;

import java.util.*;
import javax.mail.*;

public class JwmaInboxInfoImpl implements JwmaInboxInfo {
	
	private Folder myInbox;
	private int myMessageCount;
	private int myNewMessageCount;
	
	private JwmaInboxInfoImpl(Folder inbox) {
		myInbox=inbox;
	}//constructor
	
	public String getName() {
		return myInbox.getFullName();
	}//getName

	
	public int getMessageCount() {
		try {
			return myInbox.getMessageCount();
		} catch (MessagingException ex) {
			//handle?!
		}
		
		return -1;
	}//getMessageCount
	
	public boolean hasNewMessages() {
		return (getNewMessageCount()>0);
	}//hasNewMessages
	
	public int getNewMessageCount() {
		try {
			return myInbox.getNewMessageCount();
		} catch (MessagingException ex) {
			//handle?!
		}
		
		return -1;
	}//getNewMessageCount
	
	public Folder getInbox() {
		return myInbox;
	}//getInbox
	
	public int[] getReadMessages() 
			throws MessagingException {
		
		myInbox.open(Folder.READ_ONLY);
		Message[] messages=myInbox.getMessages();
		Vector readmes=new Vector(messages.length);
		
		for (int i=0;i<messages.length;i++) {
			if (messages[i].isSet(Flags.Flag.SEEN)) {
				readmes.addElement(
					new Integer(messages[i].getMessageNumber())
				);
			}				
		}
		myInbox.close(false);
			
		int[] readmsg=new int[readmes.size()];
		int c=0;
		for(Enumeration e=readmes.elements();e.hasMoreElements();c++) {
			readmsg[c]=((Integer)e.nextElement()).intValue();
		}
		
		return readmsg;
	}//getReadMessages
	
	public static JwmaInboxInfo createJwmaInboxInfo(Folder inbox) {
		return new JwmaInboxInfoImpl(inbox);
	}//createJwmaInboxInfo

}//class JwmaInboxInfoImpl