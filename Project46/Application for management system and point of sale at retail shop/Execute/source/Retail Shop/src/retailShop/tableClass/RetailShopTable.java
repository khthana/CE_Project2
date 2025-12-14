/*
 * RetailShopTable.java
 */

package retailShop.tableClass;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author Nopphol Noikaew
 */

public class RetailShopTable
{
	/**
	 * class attributes
	 */
	protected String driver = null;	
	protected String url = null;
	protected String username = null;	
	protected String password = null;
	
	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public RetailShopTable(String driver,String url,String username,String password) 
	{
		setDriver(driver);
		setURL(url);
		setUsername(username);
		setPassword(password);	
	}
	
	/**
	 * Get driver method
	 * @return driver
	 */
	public String getDriver() { 
		return driver; 
	}	    	
	
	/**
	 * Set driver method
	 * @param driver
	 */
	public void setDriver(String driver) { 
		this.driver = driver; 
	}
    
	/**
	 * Get url method 
	 * @return url
	 */
	public String getURL() { 
		return url; 
	}
	
	/**
	 * Set url method
	 * @param url
	 */
	public void setURL(String url) { 
		this.url = url; 
	}
    
	/**
	 * Get username method
	 * @return username
	 */
	public String getUsername() { 
		return username; 
	}
	
	/**
	 * Set username method
	 * @param username
	 */
	public void setUsername(String username) { 
		this.username = username; 
	}
	
	/**
	 * Get password method
	 * @return password
	 */
	public String getPassword() { 
		return password; 
	}	
       	
	/**
	 * Set password method
	 * @param password
	 */
	public void setPassword(String password) { 
		this.password = password; 
	}	
	
	/**
	 * Load JDBC driver method
	 */
	protected void loadJDBCDriver() {        
		try {
			//	load JDBC driver
			Class.forName(driver);
		} catch (ClassNotFoundException ex){
			// print error message
			System.out.println(ex.getMessage());
		}
	}
        	
	/**
	 * Update datebase method
	 * @param query
	 */
	protected void updateDB(String query){
		Connection con = null;
		Statement stmt = null;			
				
		//	load jdbc driver
		loadJDBCDriver();
		
		try {
			//	create connection
			con = DriverManager.getConnection(url,username,password);
		
			//	create statement
			stmt = con.createStatement();

			//	execute query
			stmt.executeUpdate(query);			
		} catch(SQLException ex) {				
			// print error message
			System.out.println(ex.getMessage());			
		}
	}
}
