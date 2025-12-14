/*
 * ContactorTable.java
 */

package retailShop.tableClass;

/**
 * @author Nopphol Noikaew
 */

public class ContactorTable extends RetailShopTable {
	/**
	 * class attribute
	 */	
	private String query = "CREATE TABLE contactor (" + 
		"id INT(3) UNSIGNED DEFAULT '000' NOT NULL AUTO_INCREMENT, " + 
		"firstname VARCHAR(40) DEFAULT '' NOT NULL, " +
		"lastname VARCHAR(40) DEFAULT '' NOT NULL, " +					   				   
		"mobile VARCHAR(11) DEFAULT '0-0000-0000' NOT NULL, " +
		"idsupplier INT(3) UNSIGNED DEFAULT '000' NOT NULL, " +					   					   
		"PRIMARY KEY(id));";
		
	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public ContactorTable(
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