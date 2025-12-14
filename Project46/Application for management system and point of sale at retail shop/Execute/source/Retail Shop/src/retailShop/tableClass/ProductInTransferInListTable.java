/*
 * ProductInTransferInListTable.java
 */
 
package retailShop.tableClass;

/**
 * @author Nopphol Noikaew
 */

public class ProductInTransferInListTable extends RetailShopTable {
	/**
	 * class attribute
	 */
	private String query = "CREATE TABLE productInTransferInList (" +
		"idTransferInList VARCHAR(6) DEFAULT '' NOT NULL, " +	
		"barcode VARCHAR(13) DEFAULT '' NOT NULL, " +		
		"quantity INT(3) UNSIGNED DEFAULT '000' NOT NULL, " +		
		"PRIMARY KEY(idTransferInList,barcode));";

	/**
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public ProductInTransferInListTable(
		String driver,
		String url,
		String username,
		String password) {
		super(driver, url, username, password);
	}

	/**
	 * create table method
	 */
	public void create() {
		updateDB(query);
	}
}
