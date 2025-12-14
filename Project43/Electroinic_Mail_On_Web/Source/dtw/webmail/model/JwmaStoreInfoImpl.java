package dtw.webmail.model;

import java.util.*;
import javax.mail.*;
import dtw.webmail.*;

public class JwmaStoreInfoImpl implements JwmaStoreInfo{

	private Folder myRoot;
	private Vector myFolders;
	private Vector myMailboxes;
		
	private JwmaStoreInfoImpl(Folder root) {
		myRoot=root;
		myFolders=new Vector();
		myMailboxes=new Vector();
	}//constructor

	public String[] listFolders(){
		return toStringArray(myFolders);
	}//listFolders
	
	public String[] listFolders(JwmaFolder folder) {
		return toStringArray(myFolders,folder.getPath());
	}//listFolders
	
	public String[] listMailboxes(){
		return toStringArray(myMailboxes);
	}//listMailboxes
	
	public String[] listMailboxes(JwmaMailbox mailbox){
		return toStringArray(myMailboxes,mailbox.getPath());
	}//listMailboxes
	 
	
	
	public void rebuildInfo()
			throws MessagingException {
			
		myFolders.removeAllElements();
		myMailboxes.removeAllElements();
		buildFolderList(myRoot);
		buildMailboxList(myRoot);
	}//prepare
	
	private void buildFolderList(Folder f) 
			throws MessagingException {
		
		myFolders.addElement(f.getFullName());
                if (JwmaKernel.getReference().getMailClientProtocol().equals("imap"))
                {
                  Folder[] subfolders=f.list();
  		  for (int n=0; n<subfolders.length;n++)
                  {
                    if (subfolders[n].getType()==Folder.HOLDS_FOLDERS) 
                    {
                      buildFolderList(subfolders[n]);
                    }	
		  }
                }
	}//buildFolderList
	
	private void buildMailboxList(Folder f) 
			throws MessagingException {
                if (JwmaKernel.getReference().getMailClientProtocol().equals("imap"))
                {
		  Folder[] subfolders=f.list();
  		  for (int m=0; m<subfolders.length;m++){
			  if (subfolders[m].getType()==Folder.HOLDS_FOLDERS) {
				buildMailboxList(subfolders[m]);
			  } else {
				  myMailboxes.addElement(subfolders[m].getFullName());
			  }	
                  }
		}
	}//buildMailboxList  
	
	private String[] toStringArray(Vector v) {
		String[] ret=new String[v.size()];
		for (int i=0;i<ret.length;i++){
			ret[i]=(String) v.elementAt(i);	
		}
		return ret;
	}//toStringArray
	
	private String[] toStringArray(Vector v, String filter) {
		//remove if found first
		v.removeElement(filter);
		//unroll into array
		String[] ret=toStringArray(v);
		//re-add filtered
		v.addElement(filter);
		return ret;
	}//toStringArray
	
	
	public static JwmaStoreInfoImpl createJwmaStoreInfo(Folder root)
			throws MessagingException {
		 
		 JwmaStoreInfoImpl storeinfo=new JwmaStoreInfoImpl(root);
		 storeinfo.rebuildInfo();
		 return storeinfo;
	}//createJwmaStoreInfoImpl

	
}//interface JwmaStoreInfo