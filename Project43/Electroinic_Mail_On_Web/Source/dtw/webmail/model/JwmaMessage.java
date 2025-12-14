package dtw.webmail.model;

import java.util.Date;

public interface JwmaMessage {

	 public int getMessageNumber();

	 public boolean isReceived();

	 public boolean isSent();
	 
	 public String getFrom();

	 public String getTo();

	 public String getCCTo();

	 public String getBCCTo();
	
	 public Date getDate();

	 public String getSubject();

	 public String getBody();

	 public JwmaMessagePart[] getMessageParts();

	 public boolean isSinglepart();
	 
	 public boolean isMultipart();
		
}//interface JwmaMessage