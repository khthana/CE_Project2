/*
 * ProductInSupplierTable.java
 */

package retailShop.tableClass;

/**
 * @author Nopphol Noikaew
 */

public class ProductInSupplierTable extends RetailShopTable {
	/**
	 * class attribute
	 */
	private String query = "CREATE TABLE productInSupplier (" + 
		"idSupplier INT(3) UNSIGNED DEFAULT '000' NOT NULL, " +
		"barcode VARCHAR(13) DEFAULT '' NOT NULL, " + 							   			   					   
		"quantity INT(5) DEFAULT '00000' NOT NULL, " +					   					   
		"PRIMARY KEY(idsupplier,barcode));";
		
	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public ProductInSupplierTable(
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
