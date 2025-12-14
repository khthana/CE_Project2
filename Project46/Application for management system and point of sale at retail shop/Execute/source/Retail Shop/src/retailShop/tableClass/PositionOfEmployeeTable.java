/*
 * PositionOfEmployeeTable.java
 */

package retailShop.tableClass;

/**
 * @author Nopphol Noikaew
 */

public class PositionOfEmployeeTable extends RetailShopTable {	
	/**
		* class attribute
		*/	
	private String query = "CREATE TABLE positionOfEmployee (" +
		"idEmployee INT(3) UNSIGNED DEFAULT '000' NOT NULL, " + 
		"idPosition INT(3) UNSIGNED DEFAULT '000' NOT NULL, " +					   				   
		"PRIMARY KEY(idEmployee,idPosition));";
		
	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public PositionOfEmployeeTable(
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