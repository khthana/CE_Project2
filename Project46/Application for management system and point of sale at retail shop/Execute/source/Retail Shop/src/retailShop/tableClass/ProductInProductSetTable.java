/*
 * ProductInProductSetTable.java
 */

package retailShop.tableClass;

/**
 * @author Nopphol Noikaew
 */

public class ProductInProductSetTable extends RetailShopTable {	
	/**
		* class attribute
		*/	
	private String query = "CREATE TABLE productInProductSet (" + 
		"barcodeProductSet VARCHAR(13) DEFAULT '' NOT NULL, " +
		"barcodeProduct VARCHAR(13) DEFAULT '' NOT NULL, " + 					   					   
		"quantity INT(3) DEFAULT '000' NOT NULL, " +					   					   					   
		"PRIMARY KEY(barcodeProductSet,barcodeProduct));";
		
	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public ProductInProductSetTable(
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
