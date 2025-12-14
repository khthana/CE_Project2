/*
 * Product.java
 */

package retailShop.businessClass;

import retailShop.accessClass.ProductDB;

/**
 * @author Nopphol Noikaew
 */

public class Product
{
	/**
	 * class attributes
	 */
	private String barcode;
	private String name;
	private String unit;
	private int numMin;	
	private int numMax;	
	private int quantity;
	private double avgCost;
	private double salePrice;
	private double discount;	
	private String nameProductGroupL1;
	private String nameProductGroupL2;	
	private String nameSupplier;
	
	/**
	 * class object
	 */	
	private ProductDB productDB;
	
	/**
	 * class constructor
	 */
	public Product() 
	{
		setBarcode("");
		setName("");
		setUnit("");
		setNumMin(0);
		setNumMax(0);
		setQuantity(0);
		setAvgCost(0);
		setSalePrice(0);
		setDiscount(0);		
		setNameProductGroupL1("");
		setNameProductGroupL2("");
		setNameSupplier("");
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/retailshop";
		String username = "root";
		String password = "root";		
					   
		productDB = new ProductDB(driver,url,username,password);
	}
	
	/**
	 * get barcode method
	 * @return barcode
	 */
	public String getBarcode() { 
		return barcode; 
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
	 * set barcode method
	 * @param barcode
	 */
	public void setBarcode(String barcode) { 
		this.barcode = barcode; 
	}
	
	/**
	 * get unit method
	 * @return unit
	 */
	public String getUnit() { 
		return unit; 
	}
	
	/**
	 * set unit method
	 * @param unit
	 */
	public void setUnit(String unit) { 
		this.unit = unit; 
	}
	
	/**
	 * get number minimum method
	 * @return numMin
	 */
	public int getNumMin() { 
		return numMin; 
	}
	
	/**
	 * set number minimum method
	 * @param numMin
	 */
	public void setNumMin(int numMin) { 
		this.numMin = numMin; 
	}
	
	/**
	 * get number maximum method
	 * @return numMax
	 */
	public int getNumMax() { 
		return numMax; 
	}	
	
	/**
	 * set number maximum method
	 * @param numMax
	 */
	public void setNumMax(int numMax) { 
		this.numMax = numMax; 
	}
	
	/**
	 * get average cost method
	 * @return avgCost
	 */
	public double getAvgCost() { 
		return avgCost; 
	}
	
	/**
	 * set average cost method
	 * @param avgCost
	 */
	public void setAvgCost(double avgCost) { 
		this.avgCost = avgCost; 
	}
	
	/**
	 * get sales price method
	 * @return salePrice
	 */
	public double getSalePrice() { 
		return salePrice; 
	}
	
	/**
	 * set sales price method
	 * @param salePrice
	 */
	public void setSalePrice(double salePrice) { 
		this.salePrice = salePrice; 
	}
	
	/**
	 * get discount method
	 * @return discount
	 */
	public double getDiscount() { 
		return discount; 
	}
	
	/**
	 * set discount method
	 * @param discount
	 */
	public void setDiscount(double discount) { 
		this.discount = discount; 
	}	
		
	/**
	 * get name  product group level 1 method
	 * @return nameProductGroupL1
	 */
	public String getNameProductGroupL1() { 
		return nameProductGroupL1; 
	}
	
	/**
	 * set name product group level 1 method
	 * @param nameProductGroupL1
	 */
	public void setNameProductGroupL1(String nameProductGroupL1) { 
		this.nameProductGroupL1 = nameProductGroupL1; 
	}
	
	/**
	 * get name product group level 2 method
	 * @return nameProductGroupL2
	 */
	public String getNameProductGroupL2() { 
		return nameProductGroupL2; 
	}
	
	/**
	 * set name product group level 2 method
	 * @param nameProductGroupL2
	 */
	public void setNameProductGroupL2(String nameProductGroupL2) { 
		this.nameProductGroupL2 =nameProductGroupL2; 
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
	 * get name supplier method
	 * @return nameSupplier
	 */
	public String getNameSupplier() { 
		return nameSupplier; 
	}	
	
	/**
	 * set name supplier method
	 * @param nameSupplier
	 */
	public void setNameSupplier(String nameSupplier) { 
		this.nameSupplier = nameSupplier; 
	}
	
	/**
	 * delete product method
	 * @param name
	 */
	public void deleteProduct(String name) {
		productDB.deleteProduct(name);
	}

	/**
	 * insert product
	 * @param product
	 */
	public void insertProduct() {
		productDB.insertProduct(this);
	}
			
	/**
	 * retrieve name product method
	 * @param barcode
	 */
	public String retrieveNameProduct(String barcode)
	{
		return productDB.retrieveNameProduct(barcode);
	}
	
	/**
	 * retrieve product from barcode method
	 * @param barcode
	 * @return Product
	 */
	public Product retrieveProductFromBarcode(String barcode) {
		return productDB.retrieveProductFromBarcode(barcode);
	}
	
	/**
	 * retrieve product from name method
	 * @param name
	 */
	public Product retrieveProductFromName(String name)
	{
		return productDB.retrieveProductFromName(name);
	}
	
	/**
	 * retrieve products method
	 * @param idProductGroupL2
	 * @return Product[]
	 */
	public Product[] retrieveProducts(int idProductGroupL1,int idProductGroupL2) {
		return productDB.retrieveProducts(idProductGroupL1,idProductGroupL2);	
	}			
	
	/**
	 * search product from barcode method
	 * @param barcode
	 * @return boolean
	 */
	public boolean searchProductFromBarcode(String barcode) {
		return productDB.searchProductFromBarcode(barcode);
	}
	
	/**
	 * update product method
	 * @param product
	 */
	public void updateProduct() {
		productDB.updateProduct(this);
	}
}