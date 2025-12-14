/*
 * List.java
 */

package retailShop.businessClass;

import java.util.Calendar;

/**
 * @author Nopphol Noikaew
 */

public class List {
	/**
	 * class attribute
	 */	
	protected String id;		
	protected String date;
	protected String time;
				
	/**
	 * class objects
	 */	
	protected Employee employee;
	protected Product[] products;	
	
	/**
	 * class constructor
	 */
	public List(String username,String password) {		
		setDate("");
		setTime("");
		setEmployee(new Employee().retrieveEmployee(username,password));		
		setProducts(null);
	}	
	
	/**
	 * set id method
	 * @param id
	 */
	public void setId(String id) {
		this.id = id;
	}
	
	/**
	 * get id method
	 * @return id
	 */
	public String getId() {
		return id;
	}
	
	/**
	 * get date method
	 * @param date
	 */
	public String getDate() {
		return date;
	}
	
	/**
	 * set date method
	 * @param date
	 */
	public void setDate(String date) {
		this.date = date;
	}
	
	/**
	 * get time method
	 * @param time
	 */
	public String getTime() {
		return time;
	}
	
	/**
	 * set time method
	 * @param time
	 */
	public void setTime(String time) {
		this.time = time;
	}
			
	/**
	 * set employee method
	 * @param employee
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	/**
	 * get employee method
	 * @return employee
	 */
	public Employee getEmployee() {
		return employee;
	}
		
	/**
	 * set product method
	 * @param products
	 */
	public void setProducts(Product[] products) {
		this.products = products;
	}
	
	/**
	 * get product method
	 * @return products
	 */
	public Product[] getProducts() {
		return products;
	}
	
	/**
	 * get current date method
	 * @return String
	 */
	public String getCurrentDate() {
		Calendar calendar = Calendar.getInstance();
		return calendar.get(Calendar.YEAR) + "-" + calendar.get(Calendar.MONTH) 
			+ "-" + calendar.get(Calendar.DAY_OF_MONTH);
	}
	
	/**
	 * get current time method
	 * @return String
	 */
	public String getCurrentTime() {
		Calendar calendar = Calendar.getInstance();
		return calendar.get(Calendar.HOUR_OF_DAY) + ":" + calendar.get(Calendar.MINUTE)
			+ ":" + calendar.get(Calendar.SECOND);
	}
}