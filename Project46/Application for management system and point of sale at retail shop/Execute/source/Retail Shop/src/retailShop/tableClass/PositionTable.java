/*
 * PositionTable.java
 */

package retailShop.tableClass;

/**
 * @author Nopphol Noikaew
 */

public class PositionTable extends RetailShopTable {
	/**
		* class attribute
		*/	
	private String query = "CREATE TABLE position (" + 
		"id INT(3) UNSIGNED DEFAULT '000' NOT NULL AUTO_INCREMENT, " + 					   
		"name VARCHAR(40) DEFAULT '' NOT NULL, " +					   				   				   				   
		"PRIMARY KEY (id)); ";
		
	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public PositionTable(
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
