/*
 * ProductSet.java
 */

package retailShop.businessClass;

import retailShop.accessClass.ProductSetDB;

/**
 * @author Nopphol Noikaew
 */

public class ProductSet
{
	/**
	 * class attributes
	 */
	private String barcode;
	private String name;
	private int quantity;
	private double salePrice;
	
	/**
	 * class objects
	 */
	private Product[] products;	
	private ProductSetDB productSetDB;
	
	/**
	 * class constructor
	 */
	public ProductSet() 
	{
		setBarcode("");
		setName("");
		setQuantity(0);
		setSalePrice(0);
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/retailshop";
		String username = "root";
		String password = "root"; 
				
		productSetDB = new ProductSetDB(driver,url,username,password);
	}
		
	/**
	 * get barcode method
	 * @return barcode
	 */
	public String getBarcode() { 
		return barcode; 
	}
	
	/**
	 * set barcode method
	 * @param barcode
	 */
	public void setBarcode(String barcode) { 
		this.barcode = barcode; 
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
	 * get quantity method
	 * @return quantity
	 */
	public int getQuantity() { 
		return quantity; 
	}
	
	/**
	 * set quantity method
	 * @param quantity
	 */
	public void setQuantity(int quantity) { 
		this.quantity = quantity; 
	}
	
	/**
	 * get sale price method
	 * @return salePrice
	 */
	public double getSalePrice() { 
		return salePrice; 
	}
	
	/**
	 * set sale price method
	 * @param salePrice
	 */
	public void setSalePrice(double salePrice) { 
		this.salePrice = salePrice; 
	}
	
	/**
	 * get product method
	 * @return product
	 */
	public Product[] getProduct() { 
		return products; 
	}	
	
	/**
	 * set product method
	 * @param products
	 */
	public void setProduct(Product[] products) { 
		this.products = products; 
	}
	
	/**
	 * delete product set method
	 * @param name
	 */
	public void deleteProductSet(String name) {
		productSetDB.deleteProductSet(name);
	}
	
	/**
	 * insert product set method
	 */
	public void insertProductSet() {
		productSetDB.insertProductSet(this);
	}	
	
	/**
	 * retrieve product set from name method
	 * @param name
	 * @return ProductSet
	 */
	public ProductSet retrieveProductSet(String name)
	{
		return productSetDB.retrieveProductSet(name);	
	}
	
	/**
	 * retrieve product set from barcode method
	 * @param barcode
	 * @return ProductSet
	 */
	public ProductSet retrieveProductSetFromBarcode(String barcode) {
		return productSetDB.retrieveProductSetFromBarcode(barcode);
	}
	
	/**
	 * retrieve  product sets method
	 * @return ProductSet[]
	 */
	public 	ProductSet[] retrieveProductSets()
	{
		return productSetDB.retrieveProductSets();	
	}	
	
	/**
	 * search product set from barcode method
	 * @param barcode
	 * @return boolean
	 */
	public boolean searchProductSetFromBarcode(String barcode) {
		return productSetDB.searchProductFromBarcode(barcode);
	}
}