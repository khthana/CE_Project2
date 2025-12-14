/*
 * SuppliersUI.java
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
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.ListSelectionModel;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

import retailShop.businessClass.Supplier;
import retailShop.utilClass.RetailShopTableModel;
import retailShop.utilClass.ThaiUtilities;

/**
 * @author Nopphol Noikaew
 */

public class SuppliersUI extends JInternalFrame
{
	/**
	 * class attributes
	 */
	private JPanel mainPanel = new JPanel();
	private JPanel supplierPanel = new JPanel();	
						   
	private JTable supplierTable;
	private RetailShopTableModel supplierTableModel;				   
						   					   
	private JButton addButton = new JButton("Add");
	private JButton deleteButton = new JButton("Delete");
	private JButton propertiesButton = new JButton("Properties");	
	private JButton okButton = new JButton("OK");
	private JButton cancelButton = new JButton("Cancel");	
	
	private int selectedRow = 0;
	
	/**
	 * class objects
	 */
	private Supplier[] suppliers;	
	private SupplierInfoUI supplierInfoUI;	
	
	/**
	 * class constructor
	 */
	public SuppliersUI() {
		// Set name frame 
		super("Suppliers",false,true,false,true);	

		// Set layout main panel
		mainPanel.setLayout(null);

		// Attach panel to container
		getContentPane().add(mainPanel,BorderLayout.CENTER);			
				
		// Create user and password user interface
		createSuppliersUI();
				
		// Set frame size
		setSize(400,475);			
		
		// Set frame location
		setLocation(
			(Toolkit.getDefaultToolkit().getScreenSize().width - getWidth())/2,
			(Toolkit.getDefaultToolkit().getScreenSize().height - getHeight())/2);		
	}
	
	/**
	 * create user and password user interface method
	 */
	private void createSuppliersUI() {	
		//	Set up supplier panel				
		supplierPanel.setBorder(BorderFactory.createEtchedBorder());
		supplierPanel.setBounds(new Rectangle(20,20,350,360));
		supplierPanel.setLayout(null);		
		mainPanel.add(supplierPanel,null);
		
		suppliers = new Supplier().retrieveSuppliers();
		
		// column		
		String[] column = { "Supplier name" };
		
		// Set up supplier table medel
		supplierTableModel = new RetailShopTableModel(column);
		
		// Add row to supplier table model
		for(int i=0; i < suppliers.length; i++)	{			
			String[] row = { ThaiUtilities.ASCII2Unicode(suppliers[i].getName()) };				
			supplierTableModel.addRow(row);
		}
		
		// Set up supplier table		
		supplierTable = new JTable(supplierTableModel);
		supplierTable.setPreferredScrollableViewportSize(new Dimension(320,255));
		supplierTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		ListSelectionModel rowSM = supplierTable.getSelectionModel();
		rowSM.addListSelectionListener(new ListSelectionListener() {
			public void valueChanged(ListSelectionEvent event) {
				supplierTable_listSelection(event);
			}
		});
		JScrollPane tableScrollPane = new JScrollPane(supplierTable); 
		tableScrollPane.setBounds(new Rectangle(15,15,320,285));				
		supplierPanel.add(tableScrollPane,null);
				
		// Set up add button		
		addButton.setBounds(new Rectangle(15,315,100,30));	
		addButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				addButton_actionPerformed(event);
			}
		});
		supplierPanel.add(addButton,null);
		
		// Set up delete button		
		deleteButton.setBounds(new Rectangle(125,315,100,30));
		deleteButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				deleteButton_actionPerformed(event);
			}
		});
		supplierPanel.add(deleteButton,null);
		
		// Set up properties button		
		propertiesButton.setBounds(new Rectangle(235,315,100,30));	
		propertiesButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				propertiesButton_actionPerformed(event);
			}
		});
		supplierPanel.add(propertiesButton,null);		
		
		// Set up ok button		
		okButton.setBounds(new Rectangle(145,400,100,30));	
		okButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				okButton_actionPerformed(event);
			}
		});
		mainPanel.add(okButton,null);
		
		// Set up cancel button		
		cancelButton.setBounds(new Rectangle(255,400,100,30));	
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
		String[] row = { "New supplier" };		
		supplierTableModel.addRow(row);
	}
	
	/**
	 * action perform of delete button method
	 * @param event
	 */
	private void deleteButton_actionPerformed(ActionEvent event) {
		/*if(JOptionPane.showConfirmDialog(null,"Do you delete user " + Supplier[selectedRow].getUsername() + "?",
			"Warning",JOptionPane.YES_NO_OPTION)== 0)
		{
			Supplier[selectedRow].deleteSupplier();
			createSuppliersUI();
		}*/
	}
	
	/**
	 * action perform of properties button method
	 * @param event
	 */
	private void propertiesButton_actionPerformed(ActionEvent event) {	
		if((selectedRow+1) > suppliers.length) {
			supplierInfoUI = new SupplierInfoUI(new Supplier());
		} else {
			supplierInfoUI = new SupplierInfoUI(suppliers[selectedRow]);
		}
					
		supplierInfoUI.show();
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
	private void supplierTable_listSelection(ListSelectionEvent event) {
		selectedRow = supplierTable.getSelectedRow();	
	}
}
