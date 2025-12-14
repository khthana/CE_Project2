/*
 * SupplierTable.java
 */

package retailShop.tableClass;

/**
 * @author Nopphol Noikaew
 */

public class SupplierTable extends RetailShopTable {
	/**
	 * class attribute
	 */
	private String query = "CREATE TABLE supplier (" + 
		"id INT(3) UNSIGNED DEFAULT '000' NOT NULL AUTO_INCREMENT, " + 
		"name VARCHAR(80) DEFAULT '' NOT NULL, " +					   
		"address VARCHAR(255) DEFAULT '' NOT NULL, " +
		"telephone VARCHAR(11) DEFAULT '0-0000-0000' NOT NULL, " +
		"fax VARCHAR(11) DEFAULT '0-0000-0000' NOT NULL, " +					   					   
		"PRIMARY KEY(id));";	
		
	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public SupplierTable(
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
