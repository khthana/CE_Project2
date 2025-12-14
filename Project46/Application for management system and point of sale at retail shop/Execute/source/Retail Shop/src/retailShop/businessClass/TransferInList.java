/*
 * TransferInList.java
 */ 

package retailShop.businessClass;

import retailShop.accessClass.TransferInListDB;

/**
  * @author Nopphol Noikaew
  */

public class TransferInList extends List
{	
	/**
	 * class object
	 */
	private TransferInListDB transferInListDB;
	
	/**
	 * class constructor
	 */
	public TransferInList(String username,String password) {
		super(username,password);							
		setTransferInListDB();
		setId(retrieveId());
	}
	
	/**
	 * insert transfer in list method
	 */
	public void insertTransferInList() {
		transferInListDB.insertTransferInList(this);
	}	

	/**
	 * retrieve transfer in list method
	 * @return TransferInList
	 */
	public TransferInList retrieveTransferInList() {
		return null;
	}
	
	/**
	 * retrieve new id method
	 * @return String
	 */
	public String retrieveId() {
		return transferInListDB.retrieveId();
	}
	
	/**
	 * set sale list database method
	 */
	private void setTransferInListDB() {
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/retailshop";
		String username = "root";
		String password = "root";
		
		transferInListDB = new TransferInListDB(driver,url,username,password);
	}
}