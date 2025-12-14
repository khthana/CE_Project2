package dtw.webmail.model;

 public interface JwmaFolder {
	
	 public String getName();
	
	 public String getPath();
	
	 public boolean hasFolders();
	 
	 public String[] getFolderNames();
	
	 public String[] getFolderPaths();
	

	 public boolean hasMailboxes();

	 public String[] getMailboxNames();

	 public String[] getMailboxPaths();
	
	 public int[] getMessageCounts();


 }//JwmaFolder