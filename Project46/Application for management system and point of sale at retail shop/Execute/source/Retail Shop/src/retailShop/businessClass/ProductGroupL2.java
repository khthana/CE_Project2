/*
 * ProductGroupL2.java
 */

package retailShop.businessClass;

import retailShop.accessClass.ProductGroupL2DB;

/**
 * @author Nopphol Noikaew
 */

public class ProductGroupL2
{
	/**
	 * class attributes
	 */
	private int id;
	private String name;
	
	/**
	 * class objects
	 */
	private Product[] products;
	private ProductGroupL2DB productGroupL2DB;
		
	/**
	 * class constructor
	 */
	public ProductGroupL2() 
	{
		setName("");		
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/retailshop";
		String username = "root";
		String password = "root";							   
		
		productGroupL2DB = new ProductGroupL2DB(driver,url,username,password);
	}	
	
	/**
	 * get id product group level 1 method
	 * @return id
	 */
	public int getId() { 
		return id; 
	}
	
	/**
	 * set id method
	 * @param id
	 */
	public void setId(int id) {
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
	 * get products method
	 * @return products
	 */
	public Product[] getProducts() { 
		return products; 
	}
	
	/**
	 * set products method
	 * @param products
	 */
	public void setProducts(Product[] products) {
		this.products = products;	
	}		
	
	/**
	 * insert product group level 2 method
	 * @param nameProductGroupL1
	 * @param nameProductGroupL2
	 */
	public void insertProductGroupL2(
		int idProductGroupL1,String nameProductGroupL2) {
		productGroupL2DB.insertProductGroupL2(idProductGroupL1,nameProductGroupL2);
	}
	
	/**
	 * retrieve id product group level 2 method
	 * @param idProductGroupL1
	 * @param name
	 * @return int
	 */
	public int retrieveIdProductGroupL2(int idProductGroupL1,String name) {
		return productGroupL2DB.retrieveIdProductGroupL2(idProductGroupL1,name);	
	}
	
	/**
	 * retrieve name product group level 2 method
	 * @param idProductGroupL1
	 * @param idProductGroupL2
	 * @return String
	 */
	public String retrieveNameProductGroupL2(
		int idProductGroupL1,int idProductGroupL2) {
		return productGroupL2DB.retrieveNameProductGroupL2(
			idProductGroupL1,idProductGroupL2);
	}
	
	/**
	 * retrieve product group level 2s method
	 * @param idProductGroupL1
	 * @return ProductGroupL2[]
	 */
	public ProductGroupL2[] retrieveProductGroupL2s(int idProductGroupL1)	{	
		return productGroupL2DB.retrieveProductGroupL2s(idProductGroupL1);
	}
	
	/**
	 * update product group level 2 method
	 * @param oldName
	 * @param newName
	 */
	public void updateProductGroupL2(
		int idProductGroupL1,int idProductGroupL2,String name) {
		productGroupL2DB.updateProductGroupL2(
			idProductGroupL1,idProductGroupL2,name);
	}
}