/*
 * ClientComputer.java
 */

package retailShop.businessClass;

import retailShop.viewClass.LoginUI;

/**
 * @author Nopphol Noikaew
 */

public class ClientComputer {
	
	/**
	 * class attribute
	 */
	private int id;
	
	/**
	 * class object
	 */
	private LoginUI loginUI;
	
	/**
	 * class constructor
	 */
	public ClientComputer() {
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
	 * main method
	 * @param args
	 */
	public static void main(String[] args) {		
		
		try {
			// instanciate login user interface
			LoginUI loginUI = new LoginUI();
			
			// Display login user interface
			loginUI.show();						
		}
		catch (Exception exception) {
			// print error message
			exception.printStackTrace();					
		}		
		
	}
	
}