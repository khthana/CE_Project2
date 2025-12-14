/*
 * RetailShopSystemTable.java
 */

package retailShop.tableClass;

/**
 * @author Nopphol Noikaew
 */

public class RetailShopSystemTable extends RetailShopTable {	
	/**
	 * class attribute
	 */
	private String query = "CREATE TABLE retailShopSystem (" +
		"id INT(3) UNSIGNED DEFAULT '000' NOT NULL AUTO_INCREMENT, " + 
		"name VARCHAR(40) DEFAULT '' NOT NULL, " +					   				   
		"PRIMARY KEY(id));";
	
	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public RetailShopSystemTable(
		String driver,
		String url,
		String username,
		String password) {
		super(driver,url,username,password);		
	}	
	
	/**
	 * create table method
	 */
	public void create() {
		updateDB(query);
	}
}
