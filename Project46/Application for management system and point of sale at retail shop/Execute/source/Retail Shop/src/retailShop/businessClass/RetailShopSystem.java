/*
 * RetailShopSystem.java
 */

package retailShop.businessClass;

import retailShop.accessClass.RetailShopSystemDB;

/**
 * @author Nopphol Noikaew
 */

public class RetailShopSystem {
	/**
	 * class attribute
	 */
	private String name;
	
	/**
	 * class object
	 */
	private RetailShopSystemDB retailShopSystemDB;
		
	/**
	 * class constructor
	 */
	public RetailShopSystem() { 
		setName("");
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/retailshop";
		String username = "root";
		String password = "root";
		
		retailShopSystemDB = new RetailShopSystemDB(driver,url,username,password);
	}
		
	/**
	 * get name method
	 * @return name
	 */
	public String getName() { 
		return name; 
	}
	
	/**
	 * set name method
	 * @param name
	 */
	public void setName(String name) { 
		this.name = name; 
	}
	
	/**
	 * delete retail shop system method
	 * @param idPosition
	 * @param idRetailShopSystem
	 */
	public void deleteRetailShopSystem(int idPosition,int idRetailShopSystem) {
	}
	
	/**
	 * insert retail shop system method
	 * @param idPosition
	 * @param idRetailShopSystem
	 */
	public void insertRetailShopSystem(int idPosition,int idRetailShopSystem) {
	}
	
	/**
	 * retrieve retail shop sytem method
	 * @param idPosition
	 * @param idRetailShopSystem
	 * @return
	 */
	public RetailShopSystem retrieveRetailShopSystem
		(int idPosition,int idRetailShopSystem) {
		return null;
	}
	
	/**
	 * retrieve retail shop systems method
	 * @return RetailShopSystem[]
	 */
	public RetailShopSystem[] retrieveRetailShopSystems(int idPosition) {
		return retailShopSystemDB.retrieveRetailShopSystems(idPosition);
	}
	
	/**
	 * update retail shop system method
	 * @param idPosition
	 * @param retailShopSystem
	 */
	public void updateRetailShopSystem
	(int idPosition,RetailShopSystem[] retailShopSystem) {
	}
}
