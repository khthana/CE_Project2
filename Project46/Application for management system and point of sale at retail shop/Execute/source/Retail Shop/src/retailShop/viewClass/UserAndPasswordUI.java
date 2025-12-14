/*
 * UserAndPasswordUI.java
 */

package retailShop.viewClass;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Rectangle;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JInternalFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.ListSelectionModel;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

import retailShop.businessClass.Employee;
import retailShop.utilClass.RetailShopTableModel;

/**
 * @author Nopphol Noikaew
 */

public class UserAndPasswordUI extends JInternalFrame {
	/**
	 * class attributes
	 */	
	private JPanel mainPanel = new JPanel();
	private JPanel setPasswordPanel = new JPanel();
	
	private JLabel setPasswordLabel = new JLabel("To change password , Click Set Password");

	private JTable userTable;
	private RetailShopTableModel userTableModel;						   
						   
	private JButton addButton = new JButton("Add");
	private JButton deleteButton = new JButton("Delete");
	private JButton propertiesButton = new JButton("Properties");
	private JButton setPasswordButton = new JButton("Set Password");
	private JButton okButton = new JButton("OK");
	private JButton cancelButton = new JButton("Cancel");	
	
	private int selectedRow = 0;
	
	/**
	 * class objects
	 */
	private Employee[] employees;		
	private AddUserUI addUserUI;
	private ChangePasswordUI changePasswordUI;
	private PersonalInfoUI personalInfoUI;	
	
	/**
	 * class constructor
	 */
	public UserAndPasswordUI() {
		// Set name frame 
		super("User and Password",false,true,false,true);	

		// Set layout main panel
		mainPanel.setLayout(null);

		// Attach panel to container
		getContentPane().add(mainPanel,BorderLayout.CENTER);				
				
		// Create user and password user interface
		createUserAndPasswordUI();
				
		// Set frame size
		setSize(390,440);			
		
		// Set frame location
		setLocation(
			(Toolkit.getDefaultToolkit().getScreenSize().width - getWidth())/2,
			(Toolkit.getDefaultToolkit().getScreenSize().height - getHeight())/2);		
	}
		
	/**
	 * create user and password user interface method
	 */
	private void createUserAndPasswordUI() {								
		employees = new Employee().retrieveEmployees();		
		
		// column		
		String[] column = { "Username" };
		
		// Set up user table medel
		userTableModel = new RetailShopTableModel(column);
					
		// Add row to user table model
		for(int i=0; i < employees.length; i++)	{			
			String[] row = { employees[i].getUsername() };				
			userTableModel.addRow(row);
		}									
							
		// Set up user table		
		userTable = new JTable(userTableModel);
		userTable.setPreferredScrollableViewportSize(new Dimension(350,150));
		userTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		ListSelectionModel rowSM = userTable.getSelectionModel();
		rowSM.addListSelectionListener(new ListSelectionListener() {
			public void valueChanged(ListSelectionEvent event) {
				userTable_listSelection(event);
			}
		});
		JScrollPane tableScrollPane = new JScrollPane(userTable); 
		tableScrollPane.setBounds(new Rectangle(15,20,350,150));				
    mainPanel.add(tableScrollPane,null);
		
		// Set up add button		
		addButton.setBounds(new Rectangle(30,190,100,30));	
		addButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				addButton_actionPerformed(event);
			}
		});
		mainPanel.add(addButton,null);
		
		// Set up delete button		
		deleteButton.setBounds(new Rectangle(140,190,100,30));
		deleteButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				deleteButton_actionPerformed(event);
			}
		});
		mainPanel.add(deleteButton,null);
		
		// Set up properties button		
		propertiesButton.setBounds(new Rectangle(250,190,100,30));	
		propertiesButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				propertiesButton_actionPerformed(event);
			}
		});
		mainPanel.add(propertiesButton,null);		
		
		// Set up set password panel				
		setPasswordPanel.setBorder(BorderFactory.createEtchedBorder());
		setPasswordPanel.setBounds(new Rectangle(15,240,350,100));
		setPasswordPanel.setLayout(null);		
		mainPanel.add(setPasswordPanel,null);
		
		// Set up set password label		
		setPasswordLabel.setBounds(new Rectangle(15,15,300,15));
		setPasswordPanel.add(setPasswordLabel,null);
		
		// Set up set password button		
		setPasswordButton.setBounds(new Rectangle(200,45,125,30));
		setPasswordButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				setPasswordButton_actionPerformed(event);
			}
		});
		setPasswordPanel.add(setPasswordButton,null);
		
		// Set up ok button		
		okButton.setBounds(new Rectangle(140,360,100,30));	
		okButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				okButton_actionPerformed(event);
			}
		});
		mainPanel.add(okButton,null);
		
		// Set up cancel button		
		cancelButton.setBounds(new Rectangle(250,360,100,30));	
		cancelButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				cancelButton_actionPerformed(event);
			}
		});
		mainPanel.add(cancelButton,null);		
	}		
	
	/**
	 * action perform of add button method
	 * @param event
	 */
	private void addButton_actionPerformed(ActionEvent event)	{
		addUserUI = new AddUserUI();
		addUserUI.show();	
		setVisible(false);
		dispose();			
	}
	
	/**
	 * action perform of delete button method
	 * @param event
	 */
	private void deleteButton_actionPerformed(ActionEvent event) {
		if(JOptionPane.showConfirmDialog(null,"Do you delete user " + 
			employees[selectedRow].getUsername() + "?",
			"Warning",JOptionPane.YES_NO_OPTION)== 0)	{
			employees[selectedRow].deleteEmployee();
			userTableModel.deleteRow(selectedRow);
		}
	}
	
	/**
	 * action perform of properties button method
	 * @param event
	 */
	private void propertiesButton_actionPerformed(ActionEvent event) {			
		personalInfoUI = new PersonalInfoUI(employees[selectedRow]);			
		personalInfoUI.show();
	}
	
	/**
	 * action perform of set password button method
	 * @param event
	 */
	private void setPasswordButton_actionPerformed(ActionEvent event)	{
		changePasswordUI = new ChangePasswordUI(employees[selectedRow]);
		changePasswordUI.show();
	}
	
	/**
	 * action perform of ok button method
	 * @param event
	 */
	private void okButton_actionPerformed(ActionEvent event) {
		setVisible(false);
		dispose();
	}
	
	/**
	 * action perform of cancel button method
	 * @param event
	 */
	private void cancelButton_actionPerformed(ActionEvent event) {
		setVisible(false);
    dispose();
	}		
	
	/**
	 * list selection of user table method
	 * @param event
	 */
	private void userTable_listSelection(ListSelectionEvent event) {				
		selectedRow = userTable.getSelectedRow();		
	}
}
