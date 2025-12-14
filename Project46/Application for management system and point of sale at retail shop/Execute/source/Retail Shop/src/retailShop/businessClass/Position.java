/*
 * Position.java
 */

package retailShop.businessClass;

import retailShop.accessClass.PositionDB;

/**
 * @author Nopphol Noikaew
 */

public class Position {
	/**
	 * class attribute
	 */
	private String name;
	
	/**
	 * class objects
	 */		
	private RetailShopSystem[] retailShopSystems;
	private PositionDB positionDB;
	
	/**
	 * class constructor
	 */
	public Position() {
		setName("");
		retailShopSystems = null;
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/retailshop";
		String username = "root";
		String password = "root";
		
		positionDB = new PositionDB(driver,url,username,password);
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
	 * get retail shop system method
	 * @return retailShopSystems
	 */
	public RetailShopSystem[] getRetailShopSystem() {
		return retailShopSystems; 
	}
	
	/**
	 * set retail shop system method
	 * @param retailShopSystems
	 */
	public void setRetailShopSystem(RetailShopSystem[] retailShopSystems) {
		this.retailShopSystems = retailShopSystems; 
	}	
	
	/**
	 * delete position method
	 * @param idEmployee
	 * @param idPosition
	 */
	public void deletePosition(int idEmployee,int idPosition) {
	}
	
	/**
	 * insert position method
	 * @param idEmployee
	 * @param idPosition
	 */
	public void insertPosition(int idEmployee,int idPosition) {
	}	
	
	/**
	 * retrieve id from name method
	 * @param name
	 * @return int
	 */
	public int retrieveIdFromName(String name) {
		return positionDB.retrieveIdFromName(name);
	}
	
	/**
	 * retrieve position method
	 * @param idEmployee
	 * @param idPosition
	 * @return Position
	 */
	public Position retrievePosition(int idEmployee,int idPosition) {
		return null;
	}
	
	/**
	 * retrieve positions method
	 * @param idEmployee
	 * @return Position[]
	 */
	public Position[] retrievePositions(int idEmployee) {
		return positionDB.retrievePositions(idEmployee);
	}
	
	/**
	 * update position method
	 * @param idEmployee
	 * @param positions
	 */
	public void updatePosition(int idEmployee,Position[] positions) {
	}
}
