/*
 * EmployeeTable.java
 */

package retailShop.tableClass;

/**
 * @author Nopphol Noikaew
 */

public class EmployeeTable extends RetailShopTable {	
	/**
		* class attribute
		*/	
	private String query = "CREATE TABLE employee (" + 
		"id INT(3) UNSIGNED DEFAULT '000' NOT NULL AUTO_INCREMENT, " + 
		"firstname VARCHAR(40) DEFAULT '' NOT NULL, " +
		"lastname VARCHAR(40) DEFAULT '' NOT NULL, " + 
		"sex BOOL DEFAULT '1' NOT NULL, " +
		"dateOfBirth DATE DEFAULT '0000-00-00' NOT NULL, " +
		"address VARCHAR(255) DEFAULT '' NOT NULL, " +
		"telephone VARCHAR(11) DEFAULT '0-0000-0000' NOT NULL, " +
		"mobile VARCHAR(11) DEFAULT '0-0000-0000' NOT NULL, " +					   
		"nowSalary INT(5) DEFAULT '00000' NOT NULL, " +
		"lastSalary INT(5) DEFAULT '00000' NOT NULL, " +
		"dateOfLastAdj DATE DEFAULT '0000-00-00' NOT NULL, " +
		"username VARCHAR(20) DEFAULT '' NOT NULL, " +
		"password VARCHAR(20) DEFAULT '' NOT NULL, " +					   
		"PRIMARY KEY(id));";
		
	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public EmployeeTable(String driver,String url,String username,String password) 
	{
		super(driver,url,username,password);		
	}	
	
	/**
	 * create table method
	 */
	public void create() {
		updateDB(query);
	}
}
