/*
 * TransferOutList.java
 */ 

package retailShop.businessClass;

import retailShop.accessClass.TransferOutListDB;

/**
  * @author Nopphol Noikaew
  */

public class TransferOutList extends List
{
	/**
	 * class object
	 */
	private TransferOutListDB transferOutListDB;
	
	/**
	 * class constructor
	 */
	public TransferOutList(String username,String password) {
		super(username,password);								
		setTransferOutListDB();
		setId(retrieveId());
	}	

	/**
	 * retrieve transfer in list method
	 * @return TransferOutList
	 */
	public TransferOutList retrieveTransferOutList() {
		return null;
	}
	
	/**
	 * retrieve new id method
	 * @return String
	 */
	public String retrieveId() {
		return transferOutListDB.retrieveId();
	}
	
	/**
	 * set sale list database method
	 */
	private void setTransferOutListDB() {
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/retailshop";
		String username = "root";
		String password = "root";
		
		transferOutListDB = new TransferOutListDB(driver,url,username,password);
	}
}