/*
 * TransferOutListDB.java
 */
 
package retailShop.accessClass;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author Nopphol Noikaew
 */

public class TransferOutListDB extends RetailShopDB {
	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public TransferOutListDB(
		String driver,
		String url,
		String username,
		String password) {
		super(driver, url, username, password);
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
		String maximumId = null;
		String query = queryRetrieveMaximumId();
		ResultSet rs = queryDB(query);
		
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
	 * query search id max method
	 * @return String
	 */
	private String queryRetrieveMaximumId() {		
		return "SELECT MAX(id) AS id FROM transferOutList";
	}
}
