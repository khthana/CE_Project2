/*
 * Employee.java
 */
 
package retailShop.businessClass;

import java.util.Date;

import retailShop.accessClass.EmployeeDB;

/**
 * @author Nopphol Noikaew
 */

public class Employee
{
	/**
	 * class attributes
	 */
	private int id;
	private String firstName;
	private String lastName;
	private boolean sex;
	private Date dateOfBirth;
	private String address;
	private String telephone;
	private String mobile;	
	private int nowSalary;
	private int lastSalary;
	private Date dateOfLastAdj;
	private String username;
		
	/**
	 * class objects
	 */
	private Position[] positions;	
	private EmployeeDB employeeDB;
		
	/**
	 * class constructor
	 */
	public Employee() 
	{
		setFirstName("");
		setLastName("");
		setSex(true);		
		setDateOfBirth(new Date());
		setAddress("");
		setTelephone("");
		setMobile("");		
		setNowSalary(0);
		setLastSalary(0);
		setDateOfLastAdj(new Date());		
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/retailshop";
		String username = "root";
		String password = "root";
				
		employeeDB = new EmployeeDB(driver,url,username,password);
	}	
	
	/**
	 * get id method
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
	 * get first name method
	 * @return firstName
	 */
	public String getFirstName() { 
		return firstName; 
	}
	
	/**
	 * set first name method
	 * @param firstName
	 */
	public void setFirstName(String firstName) { 
		this.firstName = firstName; 
	}
	
	/**
	 * get last name method
	 * @return lastName
	 */ 
	public String getLastName() { 
		return lastName; 
	}
	
	/**
	 * set last name method
	 * @param lastName
	 */
	public void setLastName(String lastName) { this.lastName = lastName; }
	
	/**
	 * get sex method
	 * @return sex
	 */
	public boolean getSex() { 
		return sex; 
	}
	
	/**
	 * set sex method
	 * @param sex
	 */
	public void setSex(boolean sex) { 
		this.sex = sex; 
	}
	
	/**
	 * get date of birth method
	 * @return dateOfBirth
	 */
	public Date getDateOfBirth() { 
		return dateOfBirth; 
	}
	
	/**
	 * set date of birth method
	 * @param dateOfBirth
	 */
	public void setDateOfBirth(Date dateOfBirth) { 
		this.dateOfBirth = dateOfBirth; 
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
	 * get positions method
	 * @return positions
	 */
	public Position[] getPosition() { 
		return positions; 
	}
	
	/**
	 * set positions method
	 * @param positions
	 */
	public void setPosition(Position[] positions) { 
		this.positions = positions; 
	}
	
	/**
	 * get now salary method
	 * @return nowSalary
	 */
	public int getNowSalary() { 
		return nowSalary; 
	}
	
	/**
	 * set now salary method
	 * @param nowSalary
	 */
	public void setNowSalary(int nowSalary) { 
		this.nowSalary = nowSalary; 
	}
	
	/**
	 * get last salary method
	 * @return lastSalary
	 */
	public int getLastSalary() { 
		return lastSalary; 
	}
	
	/**
	 * set last salary method
	 * @param lastSalary
	 */
	public void setLastSalary(int lastSalary) { 
		this.lastSalary = lastSalary; 
	}
	
	/**
	 * get last adjust salary date method
	 * @return dateOfLastAdj
	 */
	public Date getDateOfLastAdj() { 
		return dateOfLastAdj; 
	}
	
	/**
	 * set last adjust salary date method
	 * @param dateOfLastAdj
	 */
	public void setDateOfLastAdj(Date dateOfLastAdj) { 
		this.dateOfLastAdj = dateOfLastAdj; 
	}
	
	/**
	 * get username method
	 * @return username
	 */
	public String getUsername() { 
		return username; 
	}	
	
	/**
	 * set username method
	 * @param username
	 */
	public void setUsername(String username) { 
		this.username = username; 
	}			
	
	/**
	 * change password method
	 * @param newPassword
	 */
	public void changePassword(String newPassword)
	{
		employeeDB.changePassword(id,newPassword);	
	}
	
	/**
	 * insert employee method
	 * @param username
	 * @param password
	 */
	public void insertEmployee(String username,String password)
	{
		employeeDB.insertEmployee(username,password);
	}
	
	/**
	 * delete employee method
	 */
	public void deleteEmployee()
	{
		employeeDB.deleteEmployee(id);
	}
	
	/**
	 * retrieve employees method
	 * @return Employee[]
	 */
	public Employee[] retrieveEmployees()
	{
		return employeeDB.retrieveEmployees();
	}
	
	/**
	 * retrieve employee method
	 * @param username
	 * @param password
	 * @return Employee
	 */
	public Employee retrieveEmployee(String username,String password)
	{
		return employeeDB.retrieveEmployee(username,password);
	}
	
	/**
	 * search positions method
	 * @param name
	 * @return boolean
	 */
	public boolean searchPosition(String name)
	{			
		for(int i=0; i < getPosition().length; i++)		
			if(getPosition()[i].getName().equals(name))			
				return true;			
		return false;
	}	

	/**
	 * search retail shop system method
	 * @param name
	 * @return boolean
	 */
	public boolean searchRetailShopSystem(String name)
	{		
		for(int i=0; i < getPosition().length; i++)
			for(int j=0; j < getPosition()[i].getRetailShopSystem().length; j++)
				if(getPosition()[i].getRetailShopSystem()[j].getName().equals(name))
					return true;			
		return false;
	}
	
	/**
	 * update employee method
	 */
	public void updateEmployee() {
		employeeDB.updateEmployee(this);	
	}
	
	/**
	 * verify password method
	 * @param username
	 * @param password
	 * @return boolean
	 */
	public boolean verifyPassword(String username,String password) 
	{						
		return employeeDB.verifyPassword(username,password);	 		
	}
}