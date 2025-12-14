/*
 * ProductGroupL1.java
 */

package retailShop.businessClass;

/**
 * @author Nopphol Noikaew
 */

import retailShop.accessClass.ProductGroupL1DB;

public class ProductGroupL1
{
	/**
	 * class attributes
	 */
	private int id;
	private String name;
	
	/**
	 * class objects
	 */	
	private ProductGroupL2[] productGroupL2s;
	private ProductGroupL1DB productGroupL1DB;
		
	/**
	 * class constructor
	 */
	public ProductGroupL1() 
	{
		setName("");
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/retailshop";
		String username = "root";
		String password = "root";		
					   		
		productGroupL1DB = new ProductGroupL1DB(driver,url,username,password);
	}	
	
	/**
	 * get id product group level 1 method
	 * @return id
	 */
	public int getId() { 
		return id; 
	}
	
	/**
	 * set id product group level 1 method
	 * @param id
	 */
	public void setId(int id) { 
		this.id = id; 
	}
	
	/**
	 * get name method
	 * @return
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
	 * get product group level 2 method
	 * @return productGroupL2s
	 */
	public ProductGroupL2[] getProductGroupL2s() { 
		return productGroupL2s; 
	}	
	
	/**
	 * set product group level 2 method
	 * @param productGroupL2s
	 */
	public void setProductGroupL2s(ProductGroupL2[] productGroupL2s) { 
		this.productGroupL2s = productGroupL2s; 
	}
	
	/**
	 * insert product group level 1 method
	 * @param name
	 */
	public void insertProductGroupL1(String name) {
		productGroupL1DB.insertProductGroupL1(name);
	} 
	
	/**
	 * retrieve id product group level 1 method
	 * @param name
	 * @return int
	 */
	public int retrieveIdProductGroupL1(String name) {
		return productGroupL1DB.retrieveIdProductGroupL1(name);
	}
	
	/**
	 * retrieve name product group level 1 method
	 * @param id
	 * @return String
	 */
	public String retrieveNameProductGroupL1(int id) {
		return productGroupL1DB.retrieveNameProductGroupL1(id);
	}
	
	/**
	 * retrieve product group level 1s method
	 * @return ProductGroupL1[]
	 */
	public ProductGroupL1[] retrieveProductGroupL1s()
	{		
		return productGroupL1DB.retrieveProductGroupL1s();
	}
	
	/**
	 * update product group level 1 method
	 * @param oldName
	 * @param newName
	 */
	public void updateProductGroupL1(String oldName,String newName) {
		productGroupL1DB.updateProductGroupL1(oldName,newName);
	}
}