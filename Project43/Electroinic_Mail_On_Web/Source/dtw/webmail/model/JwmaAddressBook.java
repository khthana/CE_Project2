package dtw.webmail.model;

public interface JwmaAddressBook {

	 public String[] listNicknames();

	 public String[] listNicknames(boolean frequent);
	
	 public JwmaAddress getAddress(String nickname);

	 public int getAddressCount();

}//interface JwmaAddressBook