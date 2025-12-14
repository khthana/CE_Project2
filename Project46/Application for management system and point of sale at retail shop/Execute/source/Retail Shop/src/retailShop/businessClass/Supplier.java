/*
 * Supplier.java
 */

package retailShop.businessClass;

import retailShop.accessClass.SupplierDB;

/**
 * @author Nopphol Noikaew
 */

public class Supplier
{
	/**
	 * class attributes
	 */
	private int id;
	private String name;
	private String address;
	private String telephone;
	private String fax;
	
	/**
	 * class objects
	 */
	private Contactor[] contactors;
	private SupplierDB supplierDB;
	
	/**
	 * class constructor
	 */
	public Supplier() 
	{		
		setName("");
		setAddress("");
		setTelephone("");
		setFax("");
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/retailshop";
		String username = "root";
		String password = "root";		
					   
		supplierDB = new SupplierDB(driver,url,username,password);
	}
	
	/**
	 * get id method
	 * @return id
	 */
	public int getID() { 
		return id; 
	}
	
	/**
	 * set id method
	 * @param id
	 */
	public void setID(int id) { 
		this.id = id; 
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
	 * get address method
	 * @return address
	 */
	public String getAddress() { 
		return address; 
	}
	
	/**
	 * set address method
	 * @param address
	 */
	public void setAddress(String address) { 
		this.address = address; 
	}
	
	/**
	 * get telephone method
	 * @return telephone
	 */
	public String getTelephone() { 
		return telephone; 
	}
	
	/**
	 * set telephone method
	 * @param telephone
	 */
	public void setTelephone(String telephone) { 
		this.telephone = telephone; 
	}
		
	/**
	 * get fax method
	 * @return fax
	 */
	public String getFax() { 
		return fax; 
	}
	
	/**
	 * set fax method
	 * @param fax
	 */
	public void setFax(String fax) { 
		this.fax = fax; 
	}
	
	/**
	 * get contactors method
	 * @return contactors
	 */
	public Contactor[] getContactor() { 
		return contactors; 
	}
		
	/**
	 * set contactors method
	 * @param contactors
	 */
	public void setContactor(Contactor[] contactors) { 
		this.contactors = contactors; 
	}	
	
	/**
	 * retrieve id supplier method
	 * @param barcode
	 * @return int
	 */
	public int retrieveIdSupplierFromBarcode(String barcode) {
		return supplierDB.retrieveIdSupplierFromBarcode(barcode);
	}
	
	/**
	 * retrieve id supplier from name method
	 * @param name
	 * @return int
	 */
	public int retrieveIdSupplierFromName(String name) {
		return supplierDB.retrieveIdSupplierFromName(name);
	}
	
	/**
	 * retrieve name supplier method
	 * @param id
	 * @return String
	 */
	public String retrieveNameSupplier(int id) {
		return supplierDB.retrieveNameSupplier(id);
	}
	
	/**
	 * retrieve suppliers method
	 * @return Supplier[]
	 */
	public Supplier[] retrieveSuppliers()
	{
		return supplierDB.retrieveSuppliers();	
	}
}