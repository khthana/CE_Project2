package dtw.webmail.model;

import java.util.*;
import javax.mail.*;

import dtw.webmail.JwmaKernel;

public class JwmaFolderImpl implements JwmaFolder {
	
	private String myName;
	private String myPath;
	private String[] myFolderNames;
	private String[] myFolderPaths;
	private String[] myMailboxNames; 
	private String[] myMailboxPaths;
	private int[] myMessageCounts;
	
	private JwmaFolderImpl(String name) {
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

	
	public boolean hasFolders() {
		return (myFolderNames.length>0);
	}//hasFolders

	public String[] getFolderNames() {
		return myFolderNames;
	}//getFolderNames
		
	public String[] getFolderPaths() {
		return myFolderPaths;
	}//getFolderPaths

	private void setFolders(Vector v) {
		Folder folder=null;
		myFolderNames=new String[v.size()];
		myFolderPaths=new String[v.size()];
		
		for (int i=0;i<v.size();i++)
                {
		  folder=(Folder) v.elementAt(i);
		  //store out strings	
		  myFolderNames[i]=folder.getName();
		  myFolderPaths[i]=folder.getFullName();
		}
	}//setFolders

	public boolean hasMailboxes() {
		return (myMailboxNames.length>0);
	}//hasMailboxes

	public String[] getMailboxNames() {
		return myMailboxNames;
	}//getMailboxNames

	public String[] getMailboxPaths() {
		return myMailboxPaths;
	}//getMailboxPaths

	public int[] getMessageCounts(){
		return myMessageCounts;
	}//return getMessageCounts 

	private void setMailboxes(Vector v) throws MessagingException {
		Folder mailbox=null;
		myMailboxNames=new String[v.size()];
		myMailboxPaths=new String[v.size()];
		myMessageCounts=new int[v.size()];
		
		for (int i=0;i<v.size();i++){
			mailbox=(Folder) v.elementAt(i);
			//store out strings
			myMailboxNames[i]=mailbox.getName();
			myMailboxPaths[i]=mailbox.getFullName();
			myMessageCounts[i]=mailbox.getMessageCount();
		}
	}//setMailboxes
	
	public static JwmaFolderImpl createJwmaFolderImpl(Folder f) 
			throws JwmaException {
		
		JwmaFolderImpl folder=null;
		Vector folders=new Vector();
		Vector mailboxes=new Vector();
		
		try {
			//asserts	
			if (f==null) {
				//fixme: thats definately wrong
			}
			if (f.getType()==Folder.HOLDS_MESSAGES) {
				//fixme: JwmaFolder doesnt handle Mailboxes, or Folders that contain
				//messages also	
			}
		
			folder=new JwmaFolderImpl(f.getName());
			folder.setPath(f.getFullName());
                        //=========================================================================
                        //    Modify 12/3/2001 10:12AM
                        //check for client protocol imap or pop3
                        if (JwmaKernel.getReference().getMailClientProtocol().equals("imap"))
                        {
			  Folder[] storagefolders= f.list();
                        
			//unroll whats in this folder
			  for (int n=0; n<storagefolders.length;n++)
                          {
                            if (storagefolders[n].getType()==Folder.HOLDS_FOLDERS) 
                            {
                              folders.addElement(storagefolders[n]);
                            } 
                            else 
                            {
                              mailboxes.addElement(storagefolders[n]);
                            }
			  }
			  folder.setFolders(folders);
			  folder.setMailboxes(mailboxes);
                        }
                        //=========================================================================
		
			return folder;
			
		} catch (MessagingException mex) {
			JwmaKernel.getReference().debugLog().writeStackTrace(mex);
			throw new JwmaException("Failed to prepare folder bean: "+mex.getMessage()); 
		} 
	}//createJwmaFolderImpl
	
	
}//JwmaFolderImpl