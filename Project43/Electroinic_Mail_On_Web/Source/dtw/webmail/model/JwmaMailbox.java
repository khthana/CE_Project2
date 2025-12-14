package dtw.webmail.model;

 public interface JwmaMailbox {
	
	 public String getName();
	
	 public String getPath();
	
	 public boolean hasMessages();
	 
	 public int getMessageCount();
	
	 public JwmaMessageInfo[] getMessageInfoList();
	
 }//JwmaMailbox