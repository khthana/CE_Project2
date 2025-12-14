/*
 * ProductGroupL1Table.java
 */

package retailShop.tableClass;

/**
 * @author Nopphol Noikaew
 */

public class ProductGroupL1Table extends RetailShopTable {
	/**
		* class attribute
		*/	
	private String query = "CREATE TABLE productGroupL1 (" +
		"id INT(3) DEFAULT '000' NOT NULL AUTO_INCREMENT, " +		   					   
		"name VARCHAR(40) DEFAULT '' NOT NULL, " +					   
		"PRIMARY KEY(id));";
			
	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public ProductGroupL1Table(
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

