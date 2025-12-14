/*
 * MainUI.java
 */

package retailShop.viewClass;

import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JDesktopPane;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;

import retailShop.businessClass.Employee;

public class MainUI extends JFrame
{
	/**
	 * class attributes
	 */
	private String username,password;
	private JDesktopPane desktopPane;
	
	/**
	 * class objects
	 */
	private AlertUI alertUI;
	private LoginUI loginUI;
	private OrderUI orderUI;
	private ProductGroupUI productGroupUI;
	private ProductInfoUI productInfoUI;	
	private ProductSetUI productSetUI;
	private ReportUI reportUI;
	private SaleUI saleUI;
	private SearchUI searchUI;
	private SuppliersUI suppliersUI;
	private TransferInUI transferInUI;
	private TransferOutUI transferOutUI;
	private UserAndPasswordUI userAndPasswordUI;		
	
	/**
	 * class constructor
	 * @param username
	 * @param password
	 */
	public MainUI(String username,String password) 
	{
		// Set frame name
		super("Retail Shop");
		
		// Set up username
		this.username = username;
		
		// Set up password
		this.password = password;
		
		// Make sure we have nice window decorations
		JFrame.setDefaultLookAndFeelDecorated(true);		
		
		// Set menubar
		setJMenuBar(createMenuBar(username,password));
		
		// instanciate desktopPane
		desktopPane = new JDesktopPane();
		
		// Attach desktopPane to container
		getContentPane().add(desktopPane);

		// Set frame size	        
		setSize(
			Toolkit.getDefaultToolkit().getScreenSize().width,
		  Toolkit.getDefaultToolkit().getScreenSize().height);
				
		// Set frame location
		setLocation(
			(Toolkit.getDefaultToolkit().getScreenSize().width - getWidth())/2,
			(Toolkit.getDefaultToolkit().getScreenSize().height - getHeight())/2);		
		
		//Make dragging a little faster but perhaps uglier.
    desktopPane.setDragMode(JDesktopPane.OUTLINE_DRAG_MODE);
		
		// Set default close operation
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);		
	}
		
	/**
	 * create menu bar
	 * @param username
	 * @param password
	 * @return JMenuBar
	 */
	private JMenuBar createMenuBar(String username,String password)
	{		
		// instanciate employee
		Employee employee = new Employee();
		
		// retrieve employee
		employee = employee.retrieveEmployee(username,password);
		
		// instanciate menuBar
		JMenuBar menuBar = new JMenuBar();
		
		/* Set up file menu */
    JMenu fileMenu = new JMenu("File");
    menuBar.add(fileMenu);
		
		/* Set up change password menu item */
		JMenuItem changePasswordItem = new JMenuItem("Change Password");
		changePasswordItem.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				changePasswordItem_actionPerformed(event);
			}
		});		
		fileMenu.add(changePasswordItem);
		
		/* Set up change user menu item */
    JMenuItem changeUserItem = new JMenuItem("Change User");   
		changeUserItem.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				changeUserItem_actionPerformed(event);
			}
		});
    fileMenu.add(changeUserItem);		
		
		// Add separator
		fileMenu.addSeparator();
		
		/* Set up quit menu item */
    JMenuItem quitItem = new JMenuItem("Quit");          
		quitItem.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				quitItem_actionPerformed(event);
			}
		});        
    fileMenu.add(quitItem);
		
		if(employee.searchRetailShopSystem("Alert"))
		{			
			/* Set up alert menu */
			JMenu alertMenu = new JMenu("Alert");			
			menuBar.add(alertMenu);
	
			/* Set up alert info menu item */
			JMenuItem alertInfoItem = new JMenuItem("Alert Info");        
			alertInfoItem.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent event) {
					alertInfoItem_actionPerformed(event);
				}
			});
			alertMenu.add(alertInfoItem);	
		}
		
		if(employee.searchRetailShopSystem("Warehouse"))
		{		
			/* Set up product menu */
			JMenu productMenu = new JMenu("Product");			
			menuBar.add(productMenu);
			
			/* Set up product info menu item */
			JMenuItem productInfoItem = new JMenuItem("Product Info");        
			productInfoItem.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent event) {
					productInfoItem_actionPerformed(event);
				}
			});
			productMenu.add(productInfoItem);
			
			/* Set up product group menu item */
			JMenuItem productGroupItem = new JMenuItem("Product Group");        
			productGroupItem.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent event) {
					productGroupItem_actionPerformed(event);
				}
			});
			productMenu.add(productGroupItem);
			
			/* Set up product set menu item */
			JMenuItem productSetItem = new JMenuItem("Product Set");        
			productSetItem.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent event) {
					productSetItem_actionPerformed(event);
				}
			});
			productMenu.add(productSetItem);
			
			// Add separator
			productMenu.addSeparator();
			
			/* Set up transfer in menu item */
			JMenuItem transferInItem = new JMenuItem("Transfer In");        
			transferInItem.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent event) {
					transferInItem_actionPerformed(event);
				}
			});
			productMenu.add(transferInItem);
			
			/* Set up transfer out menu item */
			JMenuItem transferOutItem = new JMenuItem("Transfer Out");        
			transferOutItem.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent event) {
					transferOutItem_actionPerformed(event);
				}
			});
			productMenu.add(transferOutItem);
		}
		
		if(employee.searchRetailShopSystem("Management"))
		{		
			/* Set up report menu */
			JMenu reportMenu = new JMenu("Report");			
			menuBar.add(reportMenu);
			
			/* Set up report  standard menu item */
			JMenuItem reportsItem = new JMenuItem("Reports");        
			reportsItem.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent event) {
					reportsItem_actionPerformed(event);
				}
			});
			reportMenu.add(reportsItem);
		}
		
		if(employee.searchRetailShopSystem("Sale"))
		{		
			/* Set up sales menu */
			JMenu saleMenu = new JMenu("Sale");			
			menuBar.add(saleMenu);
			
			/* Set up sales menu item */
			JMenuItem salesItem = new JMenuItem("Sale");        
			salesItem.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent event) {
					saleItem_actionPerformed(event);
				}
			});
			saleMenu.add(salesItem);
		}
		
		if(employee.searchRetailShopSystem("Warehouse"))
		{	
			/* Set up supplier menu */
			JMenu supplierMenu = new JMenu("Supplier");			
			menuBar.add(supplierMenu);		
			
			/* Set up supplier info menu item */
			JMenuItem suppliersItem = new JMenuItem("Suppliers");        
			suppliersItem.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent event) {
					suppliersItem_actionPerformed(event);
				}
			});
			supplierMenu.add(suppliersItem);
		}
		
		if(employee.searchRetailShopSystem("Administration"))
		{
			/* Set up user menu */
			JMenu userMenu = new JMenu("User");			
			menuBar.add(userMenu);
			
			/* Set up user and password menu item */
			JMenuItem userAndPasswordItem = new JMenuItem("User and Password");        
			userAndPasswordItem.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent event) {
					userAndPasswordItem_actionPerformed(event);
				}
			});
			userMenu.add(userAndPasswordItem);
		}
		
		/* Set up help menu */
    JMenu helpMenu = new JMenu("Help");        
    menuBar.add(helpMenu);
		
		/* Set up about menu item */
    JMenuItem aboutItem = new JMenuItem("About");        
    aboutItem.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				aboutItem_actionPerformed(event);
			}
		});
    helpMenu.add(aboutItem);

    return menuBar;
	}		
	
	/**
	 * action perform of change password menu item method
	 * @param event
	 */
	private void changePasswordItem_actionPerformed(ActionEvent event) 
	{
		
	}
	
	/**
	 * action perform of change user menu item method
	 * @param event
	 */
	private void changeUserItem_actionPerformed(ActionEvent event) 
	{
		
	}
	
	/**
	 * action perform of quit menu item method
	 * @param event
	 */
	private void quitItem_actionPerformed(ActionEvent event) 
	{
		System.exit(0);
	}
	
	/**
	 * action perform of alert menu item method
	 * @param event
	 */
	private void alertInfoItem_actionPerformed(ActionEvent event) 
	{
		
	}

	/**
	 * action perform of product info menu item method
	 * @param event
	 */
	private void productInfoItem_actionPerformed(ActionEvent event) 
	{
		// Create product info frame	        		
		productInfoUI = new ProductInfoUI();			
		
		// Attach user and password frame to desktop
		desktopPane.add(productInfoUI);		
		
		// Show user and password frame
    productInfoUI.show();
	}

	/**
	 * action perform of product group menu item method
	 * @param event
	 */
	private void productGroupItem_actionPerformed(ActionEvent event) 
	{
		// Create product group frame	        		
		productGroupUI = new ProductGroupUI();			
		
		// Attach product group frame to desktop
		desktopPane.add(productGroupUI);		
		
		// Show product group frame
    productGroupUI.show();
	}

	/**
	 * action perform of change password menu item method
	 * @param event
	 */
	private void productSetItem_actionPerformed(ActionEvent event) 
	{
		// Create product set frame	        		
		productSetUI = new ProductSetUI();			
		
		// Attach product set frame to desktop
		desktopPane.add(productSetUI);		
		
		// Show product set frame
    productSetUI.show();
	}

	/**
	 * action perform of transfer in menu item method
	 * @param event
	 */
	private void transferInItem_actionPerformed(ActionEvent event) 
	{
		// Create transfer in frame	        		
		transferInUI = new TransferInUI(username,password);			
		
		// Attach transfer in frame to desktop
		desktopPane.add(transferInUI);		
		
		// Show transfer in frame
    transferInUI.show();
	}

	/**
	 * action perform of transfer out menu item method
	 * @param event
	 */
	private void transferOutItem_actionPerformed(ActionEvent event) 
	{
		// Create transfer out frame	        		
		transferOutUI = new TransferOutUI();			
		
		// Attach transfer out frame to desktop
		desktopPane.add(transferOutUI);		
		
		// Show transfer out frame
    transferOutUI.show();
	}	
	
	/**
	 * action perform of reports menu item method
	 * @param event
	 */
	private void reportsItem_actionPerformed(ActionEvent event) 
	{
		// Create report frame	        		
		reportUI = new ReportUI();			
		
		// Attach report frame to desktop
		desktopPane.add(reportUI);		
		
		// Show report frame
    reportUI.show();
	}
	
	/**
	 * action perform of sales menu item method
	 * @param event
	 */
	private void saleItem_actionPerformed(ActionEvent event) 
	{
		// Create sale internal frame
		saleUI = new SaleUI(username,password);
		
		// Show sale internal frame
		saleUI.show();
	}
	
	/**
	 * action perform of supplier info menu item method
	 * @param event
	 */
	private void suppliersItem_actionPerformed(ActionEvent event) 
	{
		// Create supplier info frame	        		
		suppliersUI = new SuppliersUI();			
		
		// Attach supplier info frame to desktop
		desktopPane.add(suppliersUI);		
		
		// Show supplier info frame
    suppliersUI.show();
	}
	
	/**
	 * action perform of user and password menu item method
	 * @param event
	 */
	private void userAndPasswordItem_actionPerformed(ActionEvent event) 
	{	
		// Create user and password frame	        		
		userAndPasswordUI = new UserAndPasswordUI();			
		
		// Attach user and password frame to desktop
		desktopPane.add(userAndPasswordUI);		
		
		// Show user and password frame
    userAndPasswordUI.show();	        
	}
	
	/**
	 * action perform of about menu item method
	 * @param event
	 */
	private void aboutItem_actionPerformed(ActionEvent event) 
	{
		
	}	
}
