package dtw.webmail.model;

public interface JwmaStoreInfo {

	 public String[] listFolders();

	 public String[] listFolders(JwmaFolder folder);
	
	 public String[] listMailboxes();

	public String[] listMailboxes(JwmaMailbox mailbox); 
	
}//interface JwmaStoreInfo