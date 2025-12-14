/*
 * SaleListDB.java
 */

package retailShop.accessClass;

import java.sql.ResultSet;
import java.sql.SQLException;

import retailShop.businessClass.SaleList;

/**
 * @author Nopphol Noikaew
 */

public class SaleListDB extends RetailShopDB {
	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public SaleListDB(
		String driver,
		String url,
		String username,
		String password) {
		super(driver, url, username, password);
	}
	
	/**
	 * insert sale list method
	 * @param saleList
	 */
	public void insertSaleList(SaleList saleList) {
		String query = queryInsertSaleList(saleList);
		updateDB(query);
		
		for(int i=0; i < saleList.getProducts().length; i++) {
			query = queryInsertProductInSaleList(
				saleList.getId(),saleList.getProducts()[i].getBarcode(),
				saleList.getProducts()[i].getQuantity());
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
		String query = queryCountSaleList();
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
	 * query count sale list method
	 * @return String
	 */
	private String queryCountSaleList() {
		return "SELECT COUNT(*) AS num FROM salelist";
	}
	
	/**
	 * query insert product in salelist method
	 * @param idSaleList
	 * @param product
	 * @return String
	 */
	private String queryInsertProductInSaleList(
		String idSaleList,String barcode,int quantity) {
		return "INSERT INTO productinsalelist (idSaleList,barcode,quantity) " +			"VALUES ('" + idSaleList + "', '" + barcode + "', " + quantity + ")";
	}

	/**
	 * query insert sale list method
	 * @param saleList
	 * @return String
	 */
	private String queryInsertSaleList(SaleList saleList) {
		return "INSERT INTO salelist (id,idEmployee,date,time,totalPrice) VALUES ('" +			saleList.getId() + "', " + saleList.getEmployee().getId() +	", '" + 
			saleList.getCurrentDate() + "', '" + saleList.getCurrentTime() + "', " + 
			saleList.getTotalPrice() + ")";
	}

	/**
	 * query search id max method
	 * @return String
	 */
	private String queryRetrieveMaximumId() {		
		return "SELECT MAX(id) AS id FROM saleList";
	}
}
