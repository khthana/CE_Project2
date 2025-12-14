package dtw.webmail.model;

import javax.mail.*;

public class JwmaTrashInfoImpl implements JwmaTrashInfo {

	private Folder myTrashbox;
	
	private JwmaTrashInfoImpl(Folder trashbox) {
		myTrashbox=trashbox;
	}//constructor

	public boolean isEmpty() {
		try {
			return (myTrashbox.getMessageCount()==0);
		} catch (MessagingException mex) {
			return true;
		}
	}//isEmpty
	
	public String getName() {
		return myTrashbox.getName();
	}//getName
	
	public String getPath() {
		return myTrashbox.getFullName();
	}//getPath
	
	public static JwmaTrashInfo createJwmaTrashInfo(Folder trash) {
		return new JwmaTrashInfoImpl(trash);
	}//createJwmaInboxInfo
	
}//interface JwmaTrashInfoImpl