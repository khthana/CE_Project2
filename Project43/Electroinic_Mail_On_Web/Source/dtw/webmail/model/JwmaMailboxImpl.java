package dtw.webmail.model;

import java.util.*;
import javax.mail.*;

import dtw.webmail.JwmaKernel;

public class JwmaMailboxImpl implements JwmaMailbox {
	
	private String myName;
	private String myPath;
	private int myMessageCount;
	private JwmaMessageInfo[] myMessageInfoList;
	
	private JwmaMailboxImpl(String name) {
		myName=name;	
	}//constructor

	public String getName() {
		return myName;
	}//getName
	
	public String getPath() {
		return myPath;
	}//getPath
	
	private void setPath(String path) {
		myPath=path;
	}//setPath
	
	public boolean hasMessages() {
		return (myMessageCount>0);
	}//hasMessages

	public int getMessageCount(){
		return myMessageCount;
	}//return getMessageCount 
	
	private void setMessageCount(int number) {
		myMessageCount=number;
	}//setMessageCount

	public JwmaMessageInfo[] getMessageInfoList() {
		return myMessageInfoList;
	}//getMessageInfoList

	private void setMessageInfoList(JwmaMessageInfo[] infos) {
		myMessageInfoList=infos;
	}//setMessageInfoList

	public static JwmaMailboxImpl createJwmaMailboxImpl(Folder f,String owner) 
			throws JwmaException {
		
		JwmaMailboxImpl mailbox=null;
		
		try {
			if (f==null) {
				//fixme: thats definately wrong
			}
			if (f.getType()==Folder.HOLDS_FOLDERS) {
				//fixme: JwmaMailbox doesnt handle Folders or Folders that contain messages and
				//other folders
			}
			//create mailbox with fullname 
			mailbox=new JwmaMailboxImpl(f.getName());				
			mailbox.setPath(f.getFullName());
			
			//fetch message with a slim profile for listing only
			f.open(Folder.READ_ONLY);
			Message[] msgs = f.getMessages();
			FetchProfile fp = new FetchProfile();
			fp.add(FetchProfile.Item.ENVELOPE);		//contains the headers 
			fp.add(FetchProfile.Item.FLAGS);		//contains the flags
			f.fetch(msgs, fp);
			
			//set count
			mailbox.setMessageCount(msgs.length);
			
			//create JwmaMessageInfo Collection
			JwmaMessageInfo[] infos=new JwmaMessageInfo[msgs.length];
			for (int i=0; i<msgs.length; i++) {
            	infos[i]=JwmaMessageInfoImpl.createJwmaMessageInfo(msgs[i],owner);
			}
			mailbox.setMessageInfoList(infos);
			//JwmaKernel.getReference().debugLog().write("Prepared mailbox:"+mailbox.getPath());
			
		
		} catch (MessagingException mex) {
			JwmaKernel.getReference().debugLog().writeStackTrace(mex);
			return null;	
		} finally {
			try {
				//close the folder		
				if (f.isOpen()) {
					f.close(false);		
				}
			} catch (MessagingException mesx) {}
		}
		
		return mailbox;	
	}//createJwmaMailboxImpl
	
	
}//JwmaMailboxImpl