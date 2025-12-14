package dtw.webmail.model;

import java.util.Date;

public interface JwmaMessageInfo {

	 public int getMessageNumber();

	 public boolean isRead();

	 public boolean isAnswered();

	 public boolean isDeleted();

	 public boolean isNew();
	
	 public boolean isReceived();

	 public boolean isSent();

	 public String getFrom();

	 public String getTo();

	 public Date getDate();

	 public String getSubject();
	
	 public boolean isSinglepart();
	 
	 public boolean isMultipart();
	
}//class JwmaMessageInfo