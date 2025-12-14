/*
 * SystemOfPositionTable.java
 */

package retailShop.tableClass;

/**
 * @author Nopphol Noikaew
 */

public class SystemOfPositionTable extends RetailShopTable {
	/**
		* class attribute
		*/	
	private String query = "CREATE TABLE systemOfPosition (" +
		"idPosition INT(3) UNSIGNED DEFAULT '000' NOT NULL, " + 
		"idRetailShopSystem INT(3) UNSIGNED DEFAULT '000' NOT NULL, " +					   				   
		"PRIMARY KEY(idPosition,idRetailShopSystem));";	
		
	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public SystemOfPositionTable(
		String driver,
		String url,
		String username,
		String password)	{
		super(driver,url,username,password);		
	}	
	
	/**
	 * create table method
	 */
	public void create() {
		updateDB(query);
	}
}
