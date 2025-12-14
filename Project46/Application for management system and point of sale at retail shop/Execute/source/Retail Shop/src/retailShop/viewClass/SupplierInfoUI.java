/*
 * SupplierInfoUI.java
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
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.ListSelectionModel;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

import retailShop.businessClass.Supplier;
import retailShop.utilClass.RetailShopTableModel;
import retailShop.utilClass.ThaiUtilities;

/**
 * @author Nopphol Noikaew
 */

public class SupplierInfoUI extends JFrame {
	/**
	 * class attributes
	 */
	private JPanel mainPanel = new JPanel();
	private JPanel supplierPanel = new JPanel();	
	
	private JLabel nameLabel = new JLabel("Name");
	private JLabel addressLabel = new JLabel("Address");
	private JLabel telephoneLabel = new JLabel("Telephone");
	private JLabel faxLabel = new JLabel("Fax");
	private JLabel contactorLabel = new JLabel("Contactor");
	
	private JTextField nameTxtFld = new JTextField();	
	private JTextField telephoneTxtFld = new JTextField();	
	private JTextField faxTxtFld = new JTextField();		
	
	private JTextArea addressTxtArea = new JTextArea();	
	
	private JTable contactorTable;
	private RetailShopTableModel contactorTableModel;
	
	private JButton addButton = new JButton("Add");
	private JButton deleteButton = new JButton("Delete");
	private JButton propertiesButton = new JButton("Properties");
	private JButton okButton = new JButton("OK");
	private JButton cancelButton = new JButton("Cancel");
	private JButton applyButton = new JButton("Apply");	
	
	private int selectedRow = 0;
		
	/**
	 * class constructor
	 * @param supplier
	 */
	public SupplierInfoUI(Supplier supplier) {
		// Set name frame
		super("Supplier info");	

		// Set layout main panel
		mainPanel.setLayout(null);

		// Attach panel to container
		getContentPane().add(mainPanel,BorderLayout.CENTER);			
						
		// Create transfer in user interface
		createSupplierInfoUI(supplier);
				
		// Set frame size
		setSize(400,475);
		
		// Set frame location
		setLocation(
			(Toolkit.getDefaultToolkit().getScreenSize().width - getWidth())/2,
			(Toolkit.getDefaultToolkit().getScreenSize().height - getHeight())/2);
	}
		
	/**
	 * create supplier info user interface method
	 */
	public void createSupplierInfoUI(Supplier supplier) {				
		// Set up supplier panel		
		supplierPanel.setBorder(BorderFactory.createRaisedBevelBorder());
		supplierPanel.setBounds(new Rectangle(20,20,350,360));
		supplierPanel.setLayout(null);
		mainPanel.add(supplierPanel);		
		
		// Set up name label		
		nameLabel.setBounds(new Rectangle(15,15,100,20));
		supplierPanel.add(nameLabel, null);
		
		// Set up name text field		
		nameTxtFld.setBounds(new Rectangle(15,40,320,20));
		nameTxtFld.setText(ThaiUtilities.ASCII2Unicode(supplier.getName()));
		supplierPanel.add(nameTxtFld);
		
		// Set up address label		
		addressLabel.setBounds(new Rectangle(15,65,100,20));
		supplierPanel.add(addressLabel, null);
		
		// Set up address text area		
		addressTxtArea.setBorder(BorderFactory.createEtchedBorder());
		addressTxtArea.setText(ThaiUtilities.ASCII2Unicode(supplier.getAddress()));
		JScrollPane txtAreaScrollPane = new JScrollPane(addressTxtArea); 
		txtAreaScrollPane.setBounds(new Rectangle(15,90,320,45));		
		supplierPanel.add(txtAreaScrollPane);
		
		// Set up telephone label		
		telephoneLabel.setBounds(new Rectangle(15,140,100,20));
		supplierPanel.add(telephoneLabel, null);
		
		// Set up telephone text field		
		telephoneTxtFld.setBounds(new Rectangle(15,165,100,20));
		telephoneTxtFld.setText(
			ThaiUtilities.ASCII2Unicode(supplier.getTelephone()));
		supplierPanel.add(telephoneTxtFld);
		
		// Set up fax label		
		faxLabel.setBounds(new Rectangle(130,140,100,20));
		supplierPanel.add(faxLabel, null);
		
		// Set up name text field		
		faxTxtFld.setBounds(new Rectangle(130,165,100,20));
		faxTxtFld.setText(ThaiUtilities.ASCII2Unicode(supplier.getFax()));
		supplierPanel.add(faxTxtFld);
		
		// Set up contactor label		
		contactorLabel.setBounds(new Rectangle(15,190,100,20));
		supplierPanel.add(contactorLabel, null);
		
		// column
		String[] column = { "firstname","lastname","mobile" };
		
		// Set up contactor table medel
		contactorTableModel = new RetailShopTableModel(column);
		
		if(supplier.getContactor() == null) {
			String[] row = { "","","" };
			contactorTableModel.addRow(row);
		} else {
			// Add row to supplier table model
			for(int i=0; i < supplier.getContactor().length; i++)	{			
				String[] row = { 
					ThaiUtilities.ASCII2Unicode(
						supplier.getContactor()[i].getFirstname()), 
					ThaiUtilities.ASCII2Unicode(
						supplier.getContactor()[i].getLastname()),
					ThaiUtilities.ASCII2Unicode(
						supplier.getContactor()[i].getMobile())
					};				
				contactorTableModel.addRow(row);
			}
		}
				
		// Set up contacotr table		
		contactorTable = new JTable(contactorTableModel);
		contactorTable.setPreferredScrollableViewportSize(new Dimension(350,150));
		contactorTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		ListSelectionModel rowSM = contactorTable.getSelectionModel();
		rowSM.addListSelectionListener(new ListSelectionListener() {
			public void valueChanged(ListSelectionEvent event) {
				contactorTable_listSelection(event);
			}
		});
		JScrollPane tableScrollPane = new JScrollPane(contactorTable); 
		tableScrollPane.setBounds(new Rectangle(15,215,320,80));				
		supplierPanel.add(tableScrollPane,null);
		
		/*contactorTable = new JTable(row,column);			
		contactorTable.setPreferredScrollableViewportSize(new Dimension(350,150));
		contactorTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		ListSelectionModel rowSM = contactorTable.getSelectionModel();
		rowSM.addListSelectionListener(new ListSelectionListener() {
			public void valueChanged(ListSelectionEvent event) {
				contactorTable_listSelection(event);
			}
		});
		JScrollPane tableScrollPane = new JScrollPane(contactorTable);
		tableScrollPane.setBounds(new Rectangle(15,215,320,80));        
    supplierPanel.add(tableScrollPane);*/
        
		//	Set up add button		
		addButton.setBounds(new Rectangle(125,310,100,30));	
		addButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				addButton_actionPerformed(event);
			}
		});
		supplierPanel.add(addButton);
		
		// Set up delete button		
		deleteButton.setBounds(new Rectangle(235,310,100,30));	
		deleteButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				deleteButton_actionPerformed(event);
			}
		});
		supplierPanel.add(deleteButton);		
		
		// Set up ok button		
		okButton.setBounds(new Rectangle(35,400,100,30));	
		okButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				okButton_actionPerformed(event);
			}
		});
		mainPanel.add(okButton);
		
		// Set up cancel button		
		cancelButton.setBounds(new Rectangle(145,400,100,30));	
		cancelButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				cancelButton_actionPerformed(event);
			}
		});
		mainPanel.add(cancelButton);
		
		// Set up apply button		
		applyButton.setBounds(new Rectangle(255,400,100,30));	
		applyButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				applyButton_actionPerformed(event);
			}
		});
		mainPanel.add(applyButton);
	}	
	
	/**
	 * action perform of add button method
	 * @param event
	 */
	private void addButton_actionPerformed(ActionEvent event)	{
		setVisible(false);
		dispose();
	}
	
	/**
	 * action perform of delete button method
	 * @param event
	 */
	private void deleteButton_actionPerformed(ActionEvent event) {
		setVisible(false);
		dispose();
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
	 * action perform of apply button method
	 * @param event
	 */
	private void applyButton_actionPerformed(ActionEvent event)	{
		setVisible(false);
		dispose();
	}
	
	/**
	 * list selection of user table method
	 * @param event
	 */
	private void contactorTable_listSelection(ListSelectionEvent event) {
		selectedRow = contactorTable.getSelectedRow();		
	}
}
