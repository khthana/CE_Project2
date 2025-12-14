/*
 * PositionDB.java
 */
 
package retailShop.accessClass;

import java.sql.ResultSet;
import java.sql.SQLException;

import retailShop.businessClass.Position;
import retailShop.businessClass.RetailShopSystem;

/**
 * @author Nopphol Noikaew
 */

public class PositionDB extends RetailShopDB {

	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public PositionDB(String driver,String url,String username,String password) {
		super(driver, url, username, password);
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
		int id = 0;
	 	
		String query = queryRetrieveIDPosition(name);
		ResultSet rs = queryDB(query);
	 	
		try {
			while(rs.next())
				id = rs.getInt("id");	
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		return id;
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
		int[] idPositions = retrievePositionOfEmployee(idEmployee);
	 	
		Position[] positions = new Position[idPositions.length];
	 	
		for(int i=0; i < idPositions.length; i++)
		{
			Position position = new Position();	 		
			position.setName(retrieveNamePosition(idPositions[i]));
			
			RetailShopSystem retailShopSystem = new RetailShopSystem();
			RetailShopSystem[] retailShopSystems 
				= retailShopSystem.retrieveRetailShopSystems(idPositions[i]);		 	 		
			position.setRetailShopSystem(retailShopSystems);
	 		
			positions[i] = position;
		}
	 	
		return positions;		
	}	

	/**
	 * update position method
	 * @param idEmployee
	 * @param positions
	 */
	public void updatePosition(int idEmployee,Position[] positions) {
	}
		
	/**
	 * retrieve name position method
	 * @param id
	 * @return String
	 */
	private String retrieveNamePosition(int id) {
		String name = null;	 	
		String query = queryRetrieveNamePosition(id);
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
	 * retrieve position of employee method
	 * @param idEmployee
	 * @return int[]
	 */
	private int[] retrievePositionOfEmployee(int idEmployee) {
		int count = 0;	 	
		String query = queryCountPositionOfEmployee(idEmployee);
		ResultSet rs = queryDB(query);
	 	
		try {
			while(rs.next())
				count = rs.getInt("num");
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
	 	
		int[] idPositions = new int[count];	 	
		query = queryRetrievePositionOfEmployee(idEmployee);
		rs = queryDB(query);		
		
		try {					
			rs.first(); // กำหนดให้ resultset กลับไปที่ตำแหน่งแรก			
			for(int i=0; i < count; i++,rs.next())
				idPositions[i] = rs.getInt("idPosition"); // กำหนดค่า idPositions
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
				
		return idPositions;
	}				

	/**
	 * query count position of employee method
	 * @param idEmployee
	 * @return String
	 */
	private String queryCountPositionOfEmployee(int idEmployee) {
		return new String("SELECT COUNT(*) AS num FROM positionOfEmployee WHERE idEmployee=" 
			+	idEmployee);
	}
	
	/**
	 * query retrieve id position method
	 * @param name
	 * @return String
	 */
	private String queryRetrieveIDPosition(String name) {
		return "SELECT id FROM position WHERE name='" + name + "'";
	}
	
	/**
	 * query retrieve name position method
	 * @param id
	 * @return String
	 */
	private String queryRetrieveNamePosition(int id) {
		return new String("SELECT name FROM position WHERE id=" + id);
	}
	
	/**
	 * query retrieve position of employee method
	 * @param idEmployee
	 * @return String
	 */
	private String queryRetrievePositionOfEmployee(int idEmployee) {
		return new String("SELECT idPosition FROM positionOfEmployee WHERE idEmployee=" 
		+ idEmployee);
	}		
}
