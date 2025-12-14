/*
 * ProductGrouopL2DB.java
 */
 
package retailShop.accessClass;

import java.sql.ResultSet;
import java.sql.SQLException;

import retailShop.businessClass.Product;
import retailShop.businessClass.ProductGroupL2;

/**
 * @author Nopphol Noikaew
 */

public class ProductGroupL2DB extends RetailShopDB {

	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public ProductGroupL2DB(
		String driver,
		String url,
		String username,
		String password) {
		super(driver,url,username,password);
	}
	
	/**
	 * insert product group level 2 method
	 * @param idProductGroupL1
	 * @param nameProductGroupL2
	 */
	public void insertProductGroupL2(
		int idProductGroupL1,String nameProductGroupL2) {
		int count = 0;
		String query = queryCountProductGroupL2(idProductGroupL1);
		ResultSet rs = queryDB(query);
		
		try {
			while(rs.next())
				count = rs.getInt("num");
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		query = queryInsertProductGroupL2(
			idProductGroupL1,++count,nameProductGroupL2);
		updateDB(query);
	}
	
	/**
	 * retrieve id product group level 2 method
	 * @param idProductGroupL1
	 * @param name
	 * @return int
	 */
	public int retrieveIdProductGroupL2(int idProductGroupL1,String name) {
		int idProductGroupL2 = 0;
		String query = queryRetrieveIdProductGroupL2(idProductGroupL1,name);
		ResultSet rs = queryDB(query);
		
		try {
			while(rs.next())
				idProductGroupL2 = rs.getInt("idProductGroupL2");
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		return idProductGroupL2;	
	}

	/**
	 * retrieve product group level 2s method
	 * @param idProductGroupL1
	 * @return ProductGroupL2[]
	 */
	public ProductGroupL2[] retrieveProductGroupL2s(int idProductGroupL1)	{	
		int count = 0;		
		String query = queryCountProductGroupL2(idProductGroupL1);
		ResultSet rs = queryDB(query);
		
		try {
			while(rs.next())
				count = rs.getInt("num");
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		ProductGroupL2[] productGroupL2s = new ProductGroupL2[count];		
		query = queryRetrieveProductGroupL2(idProductGroupL1);
		rs = queryDB(query);
		
		try {
			rs.first(); // กำหนดให้ resultset กลับไปที่ตำแหน่งแรก			
			for(int i=0; i < count; i++ , rs.next()) {
				ProductGroupL2 productGroupL2 = new ProductGroupL2();				
				productGroupL2.setId(rs.getInt("idProductGroupL2"));
				productGroupL2.setName(rs.getString("name"));
				productGroupL2.setProducts(
					new Product().retrieveProducts(idProductGroupL1,rs.getInt("idProductGroupL2")));								
				productGroupL2s[i] = productGroupL2;
			}				
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
						
		return productGroupL2s;
	}
	
	/**
	 * retrieve name product group level 2 method
	 * @param idProductGroupL1
	 * @param idProductGroupL2
	 * @return String
	 */
	public String retrieveNameProductGroupL2(
		int idProductGroupL1,int idProductGroupL2) {
		String nameProductGroupL2 = null;		
		String query = queryRetrieveNameProductGroupL2(
			idProductGroupL1,idProductGroupL2);
		ResultSet rs = queryDB(query);
		
		try  {
			while(rs.next())
				nameProductGroupL2 = rs.getString("name");
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		return nameProductGroupL2;
	}
	
	/**
	 * update product group level 2 method
	 * @param oldName
	 * @param newName
	 */
	public void updateProductGroupL2(
		int idProductGroupL1,int idProductGroupL2,String name) {
		String query = queryUpdateProductGroupL2(
			idProductGroupL1,idProductGroupL2,name);
		updateDB(query);
	}
	
	/**
	 * query insert product group level 2 method
	 * @param idProductGroupL1
	 * @param idProductGroupL2
	 * @param nameProductGroupL2
	 * @return String
	 */
	private String queryInsertProductGroupL2(
		int idProductGroupL1,int idProductGroupL2,String nameProductGroupL2) {
		return "INSERT INTO productgroupl2 (" +			"idproductGroupL1,idproductGroupL2,name) VALUES (" +			idProductGroupL1 + ", " + idProductGroupL2 + ", '" + 
			nameProductGroupL2 + "')";
	}
	
	/**
	 * query count product group level 2 method
	 * @param idProductGroupL1
	 * @return String
	 */
	private String queryCountProductGroupL2(int idProductGroupL1) {
		return "SELECT COUNT(*) AS num FROM productGroupL2 WHERE idProductGroupL1=" 
			+ idProductGroupL1;
	}
	
	/**
	 * query retrieve id product group level 2 method
	 * @param idProductGroupL1
	 * @param name
	 * @return String
	 */
	private String queryRetrieveIdProductGroupL2(int idProductGroupL1, String name) {
		return "SELECT idProductGroupL2 FROM productGroupL2 WHERE " +			"idProductGroupL1=" + idProductGroupL1 + " AND name='" +
			name + "'";
	}
	
	/**
	 * query retrieve name product group level 2 method
	 * @param idProductGroupL1
	 * @param idProductGroupL2
	 * @return String
	 */
	private String queryRetrieveNameProductGroupL2(
		int idProductGroupL1, int idProductGroupL2) {
		return "SELECT name FROM productGroupL2 WHERE idProductGroupL1=" 
			+ idProductGroupL1 + " AND idProductGroupL2=" + idProductGroupL2;
	}

	/**
	 * query retrieve product group level 2 method
	 * @param idProductGroupL1
	 * @return String
	 */
	private String queryRetrieveProductGroupL2(int idProductGroupL1) {
		return "SELECT idProductGroupL2,name FROM productGroupL2 WHERE " +			"idProductGroupL1="	+ idProductGroupL1;
	}
	
	/**
	 * query update product group level 2 method
	 * @param oldName
	 * @param newName
	 * @return String
	 */
	private String queryUpdateProductGroupL2(
		int idProductGroupL1,int idProductGroupL2,String name) {
		return "UPDATE productgroupl2 SET name= '" + name + 
			"' WHERE idProductGroupL1=" + idProductGroupL1 + 
			" AND idProductGroupL2=" + idProductGroupL2;
	}
}
