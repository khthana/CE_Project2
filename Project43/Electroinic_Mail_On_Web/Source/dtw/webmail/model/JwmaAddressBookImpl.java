package dtw.webmail.model;

import java.util.*;

public class JwmaAddressBookImpl implements JwmaAddressBook {
	
	//instance attributes
	private Hashtable myAddresses;
	private boolean bugfixed;
	

	 public JwmaAddressBookImpl(){
		myAddresses=new Hashtable();
		bugfixed=false;
	 }//constructor

	 public JwmaAddress getAddress(String nick) {
		Object o=myAddresses.get(nick);
		if(o!=null) {
			return (JwmaAddress)o;
		} else {
			return null;
		}
	 }//getAddress
	
	 public String[] listNicknames(){
		String[] nicks=new String[getAddressCount()];
		
		int i=0;
		for (Enumeration enum=myAddresses.keys();enum.hasMoreElements();i++) {
			nicks[i]=(String)enum.nextElement();
		}
		return nicks;
	 }//listNicknames
	
	 public String[] listNicknames(boolean frequent) {
		if(frequent==false) {
			return listNicknames();
		} else {
			Vector fns=new Vector(10);
			for (Enumeration enum=myAddresses.elements();enum.hasMoreElements();) {
				JwmaAddress add=(JwmaAddress) enum.nextElement();
				if(add.isFrequentRecipient()) {
					fns.addElement(add.getNickname());
				}
			}
			String[] fnicks=new String[fns.size()];
			for(int i=0;i<fnicks.length;i++){
				fnicks[i]=(String) fns.elementAt(i);
			}
			return fnicks;
		}
	 }//listNicknames

	
	 public int getAddressCount() {
		return myAddresses.size();
	 }//getAddressCount

	 public Hashtable getAddresses() {
		return myAddresses;
	 }//getAddresses
	
	 public void setAddresses(Hashtable ad) {
		myAddresses=ad;
	 }//setAddresses

	 public void addAddress(JwmaAddress add) {
		myAddresses.put(add.getNickname(),add);
	 }//addAddress

	 public void removeAddress(JwmaAddress add) {
		myAddresses.remove(add.getNickname());
	 }//removeAddress
	
	 public void removeAddress(String nickname) {
		myAddresses.remove(nickname);
	 }//removeAddress
	
		
	 public void fixCastorBug() {
		if(bugfixed) {
			return;
		} else {
			//BUGFIX for Castor problem
			for(Enumeration enum=myAddresses.elements();enum.hasMoreElements();) {
				JwmaAddressImpl address=(JwmaAddressImpl)enum.nextElement();
				//remove the address/address entry
				myAddresses.remove(address);
				//and put the nickname/address entry
				myAddresses.put(address.getNickname(),address);
			}
			bugfixed=true;
		}
	 }//fixCastorBug
	
}//class JwmaAddressBookImpl