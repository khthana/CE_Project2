/*
 * SaleList.java
 */ 

package retailShop.businessClass;

import retailShop.accessClass.SaleListDB;

/**
  * @author Nopphol Noikaew
  */

public class SaleList extends List
{
	/**
	 * class attribute
	 */
	private double totalPrice;
	
	/**
	 * class object
	 */
	private SaleListDB saleListDB;
	
	/**
	 * class constructor
	 */
	public SaleList(String username,String password) {
		super(username,password);						
		setSaleListDB();
		setId(retrieveId());		
	}
	
	/**
	 * get total price method
	 * @return totalPrice
	 */
	public double getTotalPrice() {
		return totalPrice;		
	}
	
	/**
	 * set total price method
	 * @param totalPrice
	 */
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;	
	}
	
	/**
	 * insert sale list method
	 */
	public void insertSaleList() {
		saleListDB.insertSaleList(this);
	}
	
	/**
	 * retrieve new id method
	 * @return String
	 */
	public String retrieveId() {
		return saleListDB.retrieveId();
	}
	
	/**
	 * set sale list database method
	 */
	private void setSaleListDB() {
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/retailshop";
		String username = "root";
		String password = "root";
		
		saleListDB = new SaleListDB(driver,url,username,password);
	}
}
