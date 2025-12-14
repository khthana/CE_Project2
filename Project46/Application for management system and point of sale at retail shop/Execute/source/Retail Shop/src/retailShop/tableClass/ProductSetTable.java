/*
 * ProductSetTable.java
 */

package retailShop.tableClass;

/**
 * @author Nopphol Noikaew
 */

public class ProductSetTable extends RetailShopTable {	
	/**
	 * class attribute
	 */
	private String query = "CREATE TABLE productSet (" + 
		"barcode VARCHAR(13) DEFAULT '' NOT NULL, " +
		"name VARCHAR(40) DEFAULT '' NOT NULL, " + 					   					   
		"quantity INT(3) DEFAULT '000' NOT NULL, " +
		"salePrice DOUBLE DEFAULT '0.0' NOT NULL, " +					   					   
		"PRIMARY KEY(barcode));";
	
	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public ProductSetTable(
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
