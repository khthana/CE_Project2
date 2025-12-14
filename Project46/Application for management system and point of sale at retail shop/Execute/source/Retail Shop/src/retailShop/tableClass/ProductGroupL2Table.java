/*
 * ProductGroupL2Table.java
 */

package retailShop.tableClass;

/**
 * @author Nopphol Noikaew
 */

public class ProductGroupL2Table extends RetailShopTable {
	/**
		* class attribute
		*/	
	private String query = "CREATE TABLE productGroupL2 (" +
		"idproductGroupL1 INT(3) DEFAULT '000' NOT NULL, " +
		"idproductGroupL2 INT(3) DEFAULT '000' NOT NULL, " +							   
		"name VARCHAR(40) DEFAULT '' NOT NULL, " +					   
		"PRIMARY KEY(idproductGroupL1,idproductGroupL2));";	
		
	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public ProductGroupL2Table(
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
