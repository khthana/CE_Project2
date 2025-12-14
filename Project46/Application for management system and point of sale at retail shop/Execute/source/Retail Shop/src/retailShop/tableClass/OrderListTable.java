/*
 * OrderListTable.java
 */
 
package retailShop.tableClass;

/**
 * @author Nopphol Noikaew
 */

public class OrderListTable extends RetailShopTable {
	/**
	 * class attribute
	 */
	private String query = "CREATE TABLE orderList (" +
		"id VARCHAR(6) DEFAULT '' NOT NULL, " +
		"idContactor INT(3) UNSIGNED DEFAULT '000' NOT NULL, " +
		"idEmployee INT(3) UNSIGNED DEFAULT '000' NOT NULL, " +
		"idSupplier INT(3) UNSIGNED DEFAULT '000' NOT NULL, " +
		"date DATE DEFAULT '0000-00-00' NOT NULL, " +
		"time TIME DEFAULT '00-00-00' NOT NULL, " +
		"totalPrice DOUBLE DEFAULT '0.0' NOT NULL, " +
		"PRIMARY KEY(id));";

	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public OrderListTable(
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
