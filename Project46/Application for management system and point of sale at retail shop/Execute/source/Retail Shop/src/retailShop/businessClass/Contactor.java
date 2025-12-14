/*
 * Contactor.java
 */

package retailShop.businessClass;

import retailShop.accessClass.ContactorDB;

/**
 * @author Nopphol Noikaew
 */

public class Contactor
{
	/**
	 * class attributes
	 */
	private int id;
	private String firstname;
	private String lastname;	
	private String mobile;
	
	/**
	 * class object
	 */
	private ContactorDB contactorDB;
	
	/**
	 * class constructor
	 */
	public Contactor() 
	{
		firstname = "";
		lastname = "";
		mobile = "";
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/retailshop";
		String username = "root";
		String password = "root";
		
		contactorDB = new ContactorDB(driver,url,username,password);
	}
	
	/**
	 * get firstname method
	 * @return firstname
	 */
	public String getFirstname() { 
		return firstname; 
	}
	
	/**
	 * set firstname method
	 * @param firstName
	 */
	public void setFirstname(String firstname) { 
		this.firstname = firstname; 
	}
	
	/**
	 * get lastname method
	 * @return lastname
	 */
	public String getLastname() { 
		return lastname; 
	}
	
	/**
	 * set lastname method
	 * @param lastname
	 */
	public void setLastname(String lastname) { 
		this.lastname = lastname; 
	}
	
	/**
	 * get mobile method
	 * @return mobile
	 */
	public String getMobile() { 
		return mobile; 
	}	
	
	/**
	 * set mobile method
	 * @param mobile
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile; 
	}
	
	/**
	 * retrieve contactors method
	 * @param idSupplier
	 * @return Contactor[]
	 */
	public Contactor[] retrieveContactors(int idSupplier)	{
		return contactorDB.retrieveContactors(idSupplier);
	}
}