/*
 * ProductTable.java
 */

package retailShop.tableClass;

/**
 * @author Nopphol Noikaew
 */

public class ProductTable extends RetailShopTable {	
	/**
	 * class attribute
	 */
	private String query = "CREATE TABLE product (" +					   
		"barcode VARCHAR(13) DEFAULT '' NOT NULL, " +
		"name VARCHAR(40) DEFAULT '' NOT NULL, " + 					   
		"unit VARCHAR(20) DEFAULT '' NOT NULL, " +					   					   
		"nummin INT(5) DEFAULT '00000' NOT NULL, " +
		"nummax INT(5) DEFAULT '00000' NOT NULL, " +
		"avgCost DOUBLE DEFAULT '0.0' NOT NULL, " +
		"salePrice DOUBLE DEFAULT '0.0' NOT NULL, " + 
		"discount DOUBLE DEFAULT '0.0' NOT NULL, " + 
		"idProductGroupL1 INT(3) DEFAULT '000' NOT NULL, " +
		"idProductGroupL2 INT(3) DEFAULT '000' NOT NULL, " + 
		"PRIMARY KEY(barcode));";
	
	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public ProductTable(
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
