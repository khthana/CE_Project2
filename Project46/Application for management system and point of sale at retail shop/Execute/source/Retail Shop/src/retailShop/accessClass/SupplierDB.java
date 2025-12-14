/*
 * SupplierDB.java
 */

package retailShop.accessClass;

import java.sql.ResultSet;
import java.sql.SQLException;

import retailShop.businessClass.Contactor;
import retailShop.businessClass.Supplier;

/**
 * @author Nopphol Noikaew
 */

public class SupplierDB extends RetailShopDB
{
	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public SupplierDB(String driver,String url,String username,String password) 
	{
		super(driver,url,username,password);
	}
	
	/**
	 * retrieve all supplier method
	 * @return Supplier[]
	 */
	public Supplier[] retrieveSuppliers()	{
		int count = 0;	 	
		String query = queryCountSuppliers();
		ResultSet rs = queryDB(query);
		
		try {
			while(rs.next())
				count = rs.getInt("num");
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		Supplier[] suppliers = new Supplier[count];
		query = queryRetrieveSuppliers();
		rs = queryDB(query);
		
		try {
			rs.first(); // กำหนดให้ resultset กลับไปที่ตำแหน่งแรก			
			for(int i=0; i < count; i++ , rs.next())
			{
				Supplier supplier = new Supplier();					
				supplier.setID(rs.getInt("id"));
				supplier.setName(rs.getString("name"));
				supplier.setAddress(rs.getString("address"));
				supplier.setTelephone(rs.getString("telephone"));
				supplier.setFax(rs.getString("fax"));					
				supplier.setContactor(
					new Contactor().retrieveContactors(rs.getInt("id")));					
				suppliers[i] = supplier;
			}							
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		return suppliers;
	}		
	
	/**
	 * retrieve id supplier from barcode method
	 * @param barcode
	 * @return int
	 */
	public int retrieveIdSupplierFromBarcode(String barcode) {
		int id = 0;		
		String query = queryRetrieveIdSupplierFromBarcode(barcode);
		ResultSet rs = queryDB(query);
		
		try {
			while(rs.next())
				id = rs.getInt("idSupplier");
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		return id;
	}	
	
	/**
	 * retrieve id supplier from name method
	 * @param name
	 * @return int
	 */
	public int retrieveIdSupplierFromName(String name) {
		int id = 0;
		String query = queryRetrieveIdSupplierFromName(name);
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
	 * retrieve name supplier method
	 * @param id
	 * @return String
	 */
	public String retrieveNameSupplier(int id) {
		String name = null;		
		String query = queryRetrieveNameSupplier(id);
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
	 * query search count supplier table method
	 * @return String
	 */
	private String queryCountSuppliers() {
		return "SELECT COUNT(*) AS num FROM supplier";
	}
	
	/**
	 * query retrieve id supplier method
	 * @param barcode
	 * @return String
	 */
	private String queryRetrieveIdSupplierFromBarcode(String barcode) {
		return "SELECT idSupplier FROM productInSupplier WHERE barcode='"
			+ barcode + "'";
	}
	
	/**
	 * query retrieve id supplier from name method
	 * @param name
	 * @return String
	 */
	private String queryRetrieveIdSupplierFromName(String name) {
		return "SELECT id FROM supplier WHERE name='" + name + "'";
	}
	
	/**
	 * query retrieve name supplier method
	 * @param id
	 * @return String
	 */
	private String queryRetrieveNameSupplier(int id) {
		return "SELECT name FROM supplier WHERE id=" + id;
	}	
	
	/**
	 * query retrieve all supplier method
	 * @return String
	 */
	private String queryRetrieveSuppliers() {
		return "SELECT id,name,address,telephone,fax FROM supplier";
	}
}
