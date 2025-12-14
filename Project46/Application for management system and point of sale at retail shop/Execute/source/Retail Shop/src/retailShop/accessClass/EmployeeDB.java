/*
 * EmployeeDB.java
 */
 
package retailShop.accessClass;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;

import retailShop.businessClass.Employee;
import retailShop.businessClass.Position;

/**
 * @author Nopphol Noikaew
 */

public class EmployeeDB extends RetailShopDB {

	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */	
	public EmployeeDB(String driver,String url,String username,String password) {
		super(driver, url, username, password);
	}
	
	/**
	 * change password method
	 * @param id
	 * @param password
	 */
	public void changePassword(int id,String password) {
		String query = queryChangePassword(id,password);
		updateDB(query);
	}	

	/**
	 * delete employee method
	 * @param username
	 */
	public void deleteEmployee(int id) {		
		String query = queryDeleteEmployee(id);
		updateDB(query);
	}

	/**
	 * insert employee method
	 * @param username
	 * @param password
	 */
	public void insertEmployee(String username,String password) {
		String query = queryInsertEmployee(username,password);
		updateDB(query);
	}
	
	/**
	 * retrieve employee method
	 * @param username
	 * @param password
	 * @return Employee
	 */
	public Employee retrieveEmployee(String username,String password) {
		Employee employee = new Employee();
						
		String query = queryRetrieveEmployee(username,password);
		ResultSet rs = queryDB(query);
			
		try {
			while(rs.next())
			{						
				employee.setId(rs.getInt("id"));
				employee.setFirstName(rs.getString("firstname"));
				employee.setLastName(rs.getString("lastname"));
				employee.setUsername(rs.getString("username"));
				employee.setSex(rs.getBoolean("sex"));
				employee.setDateOfBirth(rs.getDate("dateOfBirth"));
				employee.setAddress(rs.getString("address"));
				employee.setTelephone(rs.getString("telephone"));
				employee.setMobile(rs.getString("mobile"));
				employee.setNowSalary(rs.getInt("nowSalary"));
				employee.setLastSalary(rs.getInt("lastSalary"));
				employee.setDateOfLastAdj(rs.getDate("dateOfLastAdj"));
				
				Position position = new Position();
				Position[] positions = position.retrievePositions(rs.getInt("id"));								
				employee.setPosition(positions);
			}							
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}								
		
		return employee;
	}
	
	/**
	 * retrieve employees method
	 * @return Employee[]
	 */
	public Employee[] retrieveEmployees() {
		int count = 0;	 	
		String query = queryCountEmployee();
		ResultSet rs = queryDB(query); 	 	
	 	
		try {
			while(rs.next())
				count = rs.getInt("num");
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
	 	
		Employee[] employees = new Employee[count];	 	
		query = queryRetrieveEmployees();
		rs = queryDB(query);		
		
		try {
			rs.first(); // กำหนดให้ resultset กลับไปที่ตำแหน่งแรก
			
			for(int i=0; i < count; i++ , rs.next())
			{
				Employee employee = new Employee();				
					
				employee.setId(rs.getInt("id"));
				employee.setFirstName(rs.getString("firstname"));
				employee.setLastName(rs.getString("lastname"));
				employee.setUsername(rs.getString("username"));
				employee.setSex(rs.getBoolean("sex"));				
				employee.setAddress(rs.getString("address"));
				employee.setTelephone(rs.getString("telephone"));
				employee.setMobile(rs.getString("mobile"));
				employee.setNowSalary(rs.getInt("nowSalary"));
				employee.setLastSalary(rs.getInt("lastSalary"));
				
				if(rs.getDate("dateOfBirth") == null)
					employee.setDateOfBirth(new Date());
				else
					employee.setDateOfBirth(rs.getDate("dateOfBirth"));
					
				if(rs.getDate("dateOfLastAdj") == null)
					employee.setDateOfLastAdj(new Date());
				else
					employee.setDateOfLastAdj(rs.getDate("dateOfLastAdj"));
					
				Position position = new Position();
				Position[] positions = position.retrievePositions(rs.getInt("id"));								
				employee.setPosition(positions);
				
				employees[i] = employee;
			}			
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		return employees;
	}	

	/**
	 * update employee method
	 * @param employee
	 */
	public void updateEmployee(Employee employee) {
		String query = queryUpdateEmployee(employee);
		updateDB(query);	 	
		
		updatePositionOfEmployee(employee);
	}	
		
	/**
	 * verify password method
	 * @param username
	 * @param password
	 * @return boolean
	 */
	public boolean verifyPassword(String username,String password) {
		boolean correct = false;	 	
		String query = queryVerifyPassword(username,password);		
		ResultSet rs = queryDB(query);
			
		try {
			while(rs.next())				
				if(rs.getInt("num") != 0) // ถ้า username และ password ถูกต้อง
					correct = true;
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		return correct;
	}		
	
	/**
	 * boolean to int method
	 * @param bool
	 * @return int
	 */ 
	private int booleanToInt(boolean bool) {
		if(bool)
			return 1;
		else
			return 0;
	}
	
	/**
	 * date to string method
	 * @param date
	 * @return String
	 */
	private String dateToString(Date date) {	 		 	
		Calendar calendar = Calendar.getInstance();	 	
		calendar.setTime(date);
	 	
		return calendar.get(Calendar.YEAR) + "-" + calendar.get(Calendar.MONTH) 
			+ "-" + calendar.get(Calendar.DAY_OF_MONTH);
	}
	
	/**
	 * query change password method
	 * @param id
	 * @param password
	 * @return String
	 */
	private String queryChangePassword(int id, String password) {
		return "UPDATE employee SET password='" + password + "' WHERE id=" + id;
	}
	
	/**
	 * query count employee method
	 * @return String
	 */
	private String queryCountEmployee() {
		return "SELECT COUNT(*) AS num FROM employee";
	}
	
	/**
	 * query delete employee method
	 * @param id
	 * @return String
	 */
	private String queryDeleteEmployee(int id) {
		return "DELETE FROM employee WHERE id=" + id;
	}
	
	/**
	 * query delete position of employee method
	 * @param id
	 * @return String
	 */
	private String queryDeletePositionOfEmployee(int id) {
		return "DELETE FROM positionOfEmployee WHERE idEmployee=" + id;
	}
	
	/**
	 * query insert employee method
	 * @param username
	 * @param password
	 * @return String
	 */
	private String queryInsertEmployee(String username, String password) {
		return "INSERT INTO employee(username, password) VALUES ('" 
			+ username + "','" + password + "')";
	}
	
	/**
	 * query insert position of employee method
	 * @param idEmployee
	 * @param idPosition
	 * @return String
	 */
	private String queryInsertPositionOfEmployee(int idEmployee,int idPosition) {
		return "INSERT INTO positionOfEmployee (idEmployee, idPosition) VALUES (" + 
			idEmployee + "," + idPosition + ")";
	}
	
	/**
	 * query retrieve employee method
	 * @param username
	 * @param password
	 * @return String
	 */
	private String queryRetrieveEmployee(String username,String password)
	{
		return "SELECT id,firstname,lastname,sex,dateOfBirth,address," +
			"telephone,mobile,nowSalary,lastSalary,dateOfLastAdj,username " +
			"FROM employee WHERE username='" + username + 
			"' AND password='" + password + "'";
	}
	
	/**
	 * query retrieve employees method
	 * @return String
	 */
	private String queryRetrieveEmployees() {
		return "SELECT id,firstname,lastname,sex,dateOfBirth,address,telephone," +			"mobile,nowSalary,lastSalary,dateOfLastAdj,username FROM employee";
	}
	
	/**
	 * query update employee method
	 * @param employee
	 * @return String
	 */
	private String queryUpdateEmployee(Employee employee) {
		return "UPDATE employee SET firstname= '"	+	employee.getFirstName() 
			+ "', lastname= '" + employee.getLastName() + "', sex=" 
			+ booleanToInt(employee.getSex()) +	", dateOfBirth= '" 
			+ dateToString(employee.getDateOfBirth()) + "', address= '" 
			+ employee.getAddress() +	"' , telephone='" + employee.getTelephone() 
			+ "' , mobile='" + employee.getMobile() +	"' , nowSalary=" 
			+ employee.getNowSalary() + ", lastSalary= " + employee.getLastSalary() 
			+ ", dateOfLastAdj= '" + dateToString(employee.getDateOfLastAdj()) 
			+ "' , username='" + employee.getUsername() +	"' WHERE id=" 
			+ employee.getId();
	}	
	
	/**
	 * query verify password method
	 * @param username
	 * @param password
	 * @return String
	 */
	private String queryVerifyPassword(String username, String password) {
		return "SELECT COUNT(*) AS num FROM employee WHERE username='" 
			+	username + "' AND password='" + password + "'";
	}	
	
	/**
	 * update position of employee method
	 * @param employee
	 */
	private void updatePositionOfEmployee(Employee employee) {
		String query = queryDeletePositionOfEmployee(employee.getId());
		updateDB(query);
	 	
		for(int i=0; i < employee.getPosition().length; i++) {
			query = queryInsertPositionOfEmployee(employee.getId(),
				new Position().retrieveIdFromName(employee.getPosition()[i].getName()));
			updateDB(query);
		}
	}
}
