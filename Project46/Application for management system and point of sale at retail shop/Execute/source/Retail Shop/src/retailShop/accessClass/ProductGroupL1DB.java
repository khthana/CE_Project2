/*
 * ProductGroupL1DB.java
 */
 
package retailShop.accessClass;

import java.sql.ResultSet;
import java.sql.SQLException;

import retailShop.businessClass.ProductGroupL1;
import retailShop.businessClass.ProductGroupL2;

/**
 * @author Nopphol Noikaew
 */

public class ProductGroupL1DB extends RetailShopDB {

	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public ProductGroupL1DB(
		String driver,
		String url,
		String username,
		String password) {
		super(driver, url, username, password);
	}
	
	/**
	 * insert product group level 1 method
	 * @param name
	 */
	public void insertProductGroupL1(String name) {
		String query = queryInsertProductGroupL1(name);
		updateDB(query);
	}
	
	/**
	 * retrieve id product group level 1 method
	 * @param name
	 * @return int
	 */
	public int retrieveIdProductGroupL1(String name) {
		int id = 0;
		String query = queryRetrieveIdProductGroupL1(name);
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
	 * retrieve name product group level 1 method
	 * @param id
	 * @return String
	 */
	public String retrieveNameProductGroupL1(int id) {
		String nameProductGroupL1 = null;		
		String query = queryRetrieveNameProductGroupL1(id);
		ResultSet rs = queryDB(query);
		
		try  {
			while(rs.next())
				nameProductGroupL1 = rs.getString("name");
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		return nameProductGroupL1;
	}

	/**
	 * retrieve product group level 1s method
	 * @return ProductGroupL1[]
	 */
	public ProductGroupL1[] retrieveProductGroupL1s()	{
		int count = 0;	 	
		String query = queryCountProductGroupL1();
		ResultSet rs = queryDB(query);
		
		try {
			while(rs.next())
				count = rs.getInt("num");
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		ProductGroupL1[] productGroupL1s = new ProductGroupL1[count];
		query = queryRetrieveProductGroupL1s();
		rs = queryDB(query);
		
		try {
			rs.first(); // กำหนดให้ resultset กลับไปที่ตำแหน่งแรก			
			for(int i=0; i < count; i++ , rs.next()) {
				ProductGroupL1 productGroupL1 = new ProductGroupL1();					
				productGroupL1.setId(rs.getInt("id"));
				productGroupL1.setName(rs.getString("name"));
				productGroupL1.setProductGroupL2s(
					new ProductGroupL2().retrieveProductGroupL2s(rs.getInt("id")));															
				productGroupL1s[i] = productGroupL1;
			}							
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		return productGroupL1s;
	}
	
	/**
	 * update product group level 1 method
	 * @param oldName
	 * @param newName
	 */
	public void updateProductGroupL1(String oldName,String newName) {
		String query = queryUpdateProductGroupL1(oldName,newName);
		updateDB(query);
	}

	/**
	 * query count product grouop level 1 method
	 * @return String
	 */
	private String queryCountProductGroupL1() {
		return "SELECT COUNT(*) AS num FROM productGroupL1";
	}
	
	/**
	 * query insert product group level 1 method
	 * @param name
	 * @return String
	 */
	private String queryInsertProductGroupL1(String name) {
		return "INSERT INTO productgroupl1 (id, name) VALUES (NULL, '" + 
			name + "')";
	}
	
	/**
	 * query retrieve id product group level 1 method
	 * @param name
	 * @return String
	 */
	private String queryRetrieveIdProductGroupL1(String name) {
		return "SELECT id FROM productGroupL1 WHERE name='" + name + "'";
	}
	
	/**
	 * query retrieve name product group level 1 method
	 * @param id
	 * @return String
	 */
	private String queryRetrieveNameProductGroupL1(int id) {
		return "SELECT name FROM productGroupL1 WHERE id=" + id;
	}
	
	/**
	 * query retrieve product grouop level 1s method
	 * @return String
	 */
	private String queryRetrieveProductGroupL1s() {
		return "SELECT * FROM productGroupL1";
	}	
	
	/**
	 * query update product group level 1 method
	 * @param oldName
	 * @param newName
	 * @return String
	 */
	private String queryUpdateProductGroupL1(String oldName, String newName) {
		return "UPDATE productgroupl1 SET name= '" + newName + 
			"' WHERE name='" + oldName + "'";
	}
}
