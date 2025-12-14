/*
 * PersonDB.java
 */
 
package retailShop.accessClass;

import java.sql.ResultSet;
import java.sql.SQLException;

import retailShop.businessClass.Contactor;

/**
 * @author Nopphol Noikaew
 */

public class ContactorDB extends RetailShopDB {

	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public ContactorDB(String driver,String url,String username,String password) {
		super(driver, url, username, password);
	}
	
	/**
	 * delete contactor method
	 * @param firstName
	 * @param lastName
	 */
	public void deleteContactor(String firstName,String lastName) {
	}
	
	/**
	 * insert contactor method
	 * @param firstName
	 * @param lastName
	 */
	public void insertContactor(String firstName,String lastName) {
	}
	
	/**
	 * retrieve contactor method
	 * @param firstName
	 * @param lastName
	 * @return Contactor
	 */
	public Contactor retrieveContactor(String firstName,String lastName) {
		return null;
	}
	
	public Contactor[] retrieveContactors(int idSupplier)	{
		int count = 0;		
		String query = queryCountContactor(idSupplier);
		ResultSet rs = queryDB(query);
		
		try {
			while(rs.next())
				count = rs.getInt("num");
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		Contactor[] contactors = new Contactor[count];		
		query = queryRetrieveContactor(idSupplier);
		rs = queryDB(query);
		
		try {
			rs.first(); // กำหนดให้ resultset กลับไปที่ตำแหน่งแรก			
			for(int i=0; i < count; i++ , rs.next())
			{
				Contactor contactor = new Contactor();				
				contactor.setFirstname(rs.getString("firstname"));
				contactor.setLastname(rs.getString("lastname"));
				contactor.setMobile(rs.getString("mobile"));				
				contactors[i] = contactor;
			}				
		} catch(SQLException ex) {
		// print error message
			System.out.println(ex.getMessage());
		}
		
		return contactors;
	}
	
	/**
	 * update contactor method
	 * @param contactor
	 */
	public void updateContactor(Contactor contactor) {
	}	
	
	// query count contactor method
	private String queryCountContactor(int idSupplier)
	{
		return new String("SELECT COUNT(*) AS num FROM contactor WHERE idsupplier=" 
			+ idSupplier);
	}
	
	/**
	 * query retrieve contactor method
	 * @param idSupplier
	 * @return String
	 */
	private String queryRetrieveContactor(int idSupplier)
	{
		return new String("SELECT id,firstname,lastname,mobile " +
			"FROM contactor WHERE idsupplier=" + idSupplier);
	}
}
