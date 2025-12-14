/*
 * TransferInListDB.java
 */
 
package retailShop.accessClass;

import java.sql.ResultSet;
import java.sql.SQLException;

import retailShop.businessClass.TransferInList;

/**
 * @author Nopphol Noikaew
 */

public class TransferInListDB extends RetailShopDB {
	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public TransferInListDB(
		String driver,
		String url,
		String username,
		String password) {
		super(driver, url, username, password);
	}
	
	/**
	 * insert sale list method
	 * @param list
	 */
	public void insertTransferInList(TransferInList transferInList) {
		String query = queryInsertTransferInList(transferInList);
		updateDB(query);
		
		for(int i=0; i < transferInList.getProducts().length; i++) {
			query = queryInsertProductInTransferInList(
				transferInList.getId(),transferInList.getProducts()[i].getBarcode(),
				transferInList.getProducts()[i].getQuantity());
			updateDB(query);
		}
	}

	/**
	 * retrieve id method
	 * @return String
	 */
	public String retrieveId() {
		String id = null;
		int i = Integer.parseInt(retrieveMaximumId()) + 1;
		
		if(i > 10000)
			id = "0" + String.valueOf(i);
		else if(i > 1000)
			id = "00" + String.valueOf(i);
		else if(i > 100)
			id = "000" + String.valueOf(i);
		else if(i > 10)
			id = "0000" + String.valueOf(i);
		else
			id = "00000" + String.valueOf(i);
		
		return id;
	}
	
	/**
	 * retrieve maximum id method
	 */
	private String retrieveMaximumId() {
		int count = 0;
		String query = queryCountTransferInList();
		ResultSet rs = queryDB(query); 	 	
	 	
		try {
			while(rs.next())
				count = rs.getInt("num");
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		if(count == 0)
			return "000000";
		
		String maximumId = "";
		query = queryRetrieveMaximumId();
		rs = queryDB(query);
		
		try {
			while(rs.next())				
				maximumId = rs.getString("id");
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}			
							
		return maximumId;
	}
	
	/**
	 * query count transfer in list method
	 * @return String
	 */
	private String queryCountTransferInList() {
		return "SELECT COUNT(*) AS num FROM transferInList";
	}
	
	/**
	 * query insert product in sale list method
	 * @param idTransferList
	 * @param barcode
	 * @param quantity
	 * @return String
	 */
	private String queryInsertProductInTransferInList(
		String idTransferInList, String barcode, int quantity) {
		return "INSERT INTO productInTransferInList (idTransferInList,barcode," +			"quantity) VALUES ('" + idTransferInList + "', '" + barcode + "', " + 
			quantity + ")";
	}

	/**
	 * query insert sale list method
	 * @param transferInList
	 * @return String
	 */
	private String queryInsertTransferInList(TransferInList transferInList) {
		return "INSERT INTO transferInList (id,idEmployee,date,time) " +			"VALUES ('" +	transferInList.getId() + "', " + 
			transferInList.getEmployee().getId() +	", '" + 
			transferInList.getCurrentDate() + "', '" + 
			transferInList.getCurrentTime() + "')";
	}
	
	/**
	 * query search id max method
	 * @return String
	 */
	private String queryRetrieveMaximumId() {		
		return "SELECT MAX(id) AS id FROM transferInList";
	}	
}
