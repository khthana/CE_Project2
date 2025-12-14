/*
 * RetailShopSystemDB.java
 */
 
package retailShop.accessClass;

import java.sql.ResultSet;
import java.sql.SQLException;

import retailShop.businessClass.RetailShopSystem;

/**
 * @author Nopphol Noikaew
 */

public class RetailShopSystemDB extends RetailShopDB {

	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public RetailShopSystemDB(String driver,String url,String username,String password) {
		super(driver, url, username, password);
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
		int[] idRetailShopSystems = retrieveSystemOfPosition(idPosition);	 	
		RetailShopSystem[] retailShopSystems = new RetailShopSystem
			[idRetailShopSystems.length];
	 	
			for(int i=0; i < idRetailShopSystems.length; i++)
			{
				RetailShopSystem retailShopSystem = new RetailShopSystem();	 	
				retailShopSystem.setName(
					retrieveNameRetailShopSystem(idRetailShopSystems[i]));				
				retailShopSystems[i] = retailShopSystem;				
			}
	 	
		return retailShopSystems;
	}		

	/**
	 * update retail shop system method
	 * @param idPosition
	 * @param retailShopSystem
	 */
	public void updateRetailShopSystem
	(int idPosition,RetailShopSystem[] retailShopSystem) {
	}
	
	/**
	 * retrieve system of position method
	 * @param idPosition
	 * @return int[]
	 */
	private int[] retrieveSystemOfPosition(int idPosition) {
		int count = 0;		
		String query = queryCountSystemOfPosition(idPosition);
		ResultSet rs = queryDB(query);
		
		try {
			while(rs.next())
				count = rs.getInt("num");
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
	
		int[] idRetailShopSystems = new int[count];	 	
		query = queryRetrieveSystemOfPosition(idPosition);
		rs = queryDB(query);
		
		try {					
			rs.first(); // กำหนดให้ resultset กลับไปที่ตำแหน่งแรก			
			for(int i=0; i < count; i++,rs.next())
				// กำหนดค่า idRetailShopSystems
				idRetailShopSystems[i] = rs.getInt("idRetailShopSystem");
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
				
		return idRetailShopSystems;
	}		

	/**
	 * @param id
	 * @return String
	 */
	private String retrieveNameRetailShopSystem(int id) {
		String name = null;	 	
		String query = queryRetrieveNameRetailShopSystem(id);
		ResultSet rs = queryDB(query);
	 	
		try {	 		
			while(rs.next())
				name = rs.getString("name");	 		
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
	 	
		return name;
	}	

	/**
	 * query count system of position method
	 * @param idPosition
	 * @return String
	 */
	private String queryCountSystemOfPosition(int idPosition) {
		return "SELECT COUNT(*) AS num FROM systemOfPosition WHERE idPosition=" 
		+ idPosition;
	}
	
	/**
	 * query retrieve system of position method
	 * @param idPosition
	 * @return String
	 */
	private String queryRetrieveSystemOfPosition(int idPosition) {
		return "SELECT idRetailShopSystem FROM systemOfPosition WHERE idPosition=" 
		+ idPosition;
	}
	
	/**
	 * query retrieve name retail shop system method
	 * @param id
	 * @return String
	 */
	private String queryRetrieveNameRetailShopSystem(int id) {
		return "SELECT name FROM retailShopSystem WHERE id=" + id;
	}
}
