/*
 * TransferOutUI.java
 */

package retailShop.viewClass;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeModel;
import javax.swing.tree.TreeSelectionModel;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.event.TreeSelectionEvent;
import javax.swing.event.TreeSelectionListener;

import retailShop.businessClass.Product;
import retailShop.businessClass.ProductGroupL1;

import retailShop.utilClass.RetailShopTableModel;
import retailShop.utilClass.ThaiUtilities;

/**
 * @author Nopphol Noikaew
 */

public class TransferOutUI extends JInternalFrame
{
	/**
	 * class attributes
	 */	
	private Container container;	
	
	private JPanel mainPanel = new JPanel();
	private JPanel transferOutPanel = new JPanel();	
	
	private JLabel transferOutNoLabel = new JLabel("Transfer out NO.");
	private JLabel barcodeLabel = new JLabel("Barcode");
	private JLabel quantityLabel = new JLabel("Quantity");	
	
	private JTextField transferOutNoTxtFld = new JTextField();
	private JTextField barcodeTxtFld = new JTextField();
	private JTextField quantityTxtFld = new JTextField();				
	
	private JTable productTable;
	private RetailShopTableModel productTableModel;	
	
	private DefaultMutableTreeNode productGroupRootNode;	
	private DefaultTreeModel productGroupTreeModel;	
	private JTree productGroupTree = new JTree();
	
	private JButton addButton = new JButton("Add");
	private JButton deleteButton = new JButton("Delete");
	private JButton okButton = new JButton("OK");
	private JButton cancelButton = new JButton("Cancel");
	private JButton applyButton = new JButton("Apply");		
	
	private int selectedRow = 0;		
		
	/**
	 * class constructor
	 */
	public TransferOutUI() 
	{
		// Set name frame
		super("Transfers out",false,true,false,true);

		// attach panel to internal frame content pane
		container = this.getContentPane();
		mainPanel.setLayout(null);
		container.add(mainPanel,BorderLayout.CENTER);					
				
		// Create transfer in user interface
		createTransferOutUI();
				
		// Set frame size
		setSize(595,460);
		
		// Set frame location
		setLocation((Toolkit.getDefaultToolkit().getScreenSize().width - getWidth())/2,
					(Toolkit.getDefaultToolkit().getScreenSize().height - getHeight())/2);
	}
	
	/**
	 * show transfer in user interface method
	 */
	public void showTransferOutUI() 
	{
		// Set visible		
		setVisible(true);
	}
	
	/**
	 * create transfer in user interface method
	 */	
	public void createTransferOutUI()
	{		
		// Set up transfer in panel		
		transferOutPanel.setBorder(BorderFactory.createRaisedBevelBorder());
		transferOutPanel.setBounds(new Rectangle(20,20,545,335));
		transferOutPanel.setLayout(null);		
		mainPanel.add(transferOutPanel,null);
		
		// Set up product group tree model
		productGroupRootNode = new DefaultMutableTreeNode("Product Group");	
		productGroupTreeModel = new DefaultTreeModel(productGroupRootNode);
		
		// create node product group			
		createNodesProductGroup(productGroupRootNode);			
				
		// Set up product group tree
		productGroupTree = new JTree(productGroupTreeModel);
		productGroupTree.setEditable(true);
		productGroupTree.getSelectionModel().setSelectionMode(TreeSelectionModel.SINGLE_TREE_SELECTION);
		productGroupTree.setShowsRootHandles(true);
		productGroupTree.setBorder(BorderFactory.createEtchedBorder());
		productGroupTree.addTreeSelectionListener(new TreeSelectionListener() {
			public void valueChanged(TreeSelectionEvent e) {productGroupTree_treeSelection(e);}});			
		JScrollPane productGroupScrollPane = new JScrollPane(productGroupTree); 
		productGroupScrollPane.setBounds(new Rectangle(15,15,175,305));		
		transferOutPanel.add(productGroupScrollPane,null);			
				
		// Set up transfer in number label		
		transferOutNoLabel.setBounds(new Rectangle(200,15,100,20));		
		transferOutPanel.add(transferOutNoLabel,null);
		
		// Set up product in number text field		
		transferOutNoTxtFld.setBounds(new Rectangle(200,40,100,20));		
		transferOutPanel.add(transferOutNoTxtFld,null);		
		
		// row & column
		String[] row = { "","","" };
		String[] column = { "Barcode","Product","Quantity" };
		
		// Set up product table model
		productTableModel = new RetailShopTableModel(column);		
		productTableModel.addRow(row);		
		
		// Set up product table		
		productTable = new JTable(productTableModel);        
		productTable.setPreferredScrollableViewportSize(new Dimension(350,150));	
		productTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);	
		ListSelectionModel rowSM = productTable.getSelectionModel();
		rowSM.addListSelectionListener(new ListSelectionListener() {
			public void valueChanged(ListSelectionEvent event) {productTable_listSelection(event);}});
		JScrollPane productScrollPane = new JScrollPane(productTable);
		productScrollPane.setBounds(new Rectangle(200,75,330,150));  
		transferOutPanel.add(productScrollPane,null);		
		
		// Set up barcode label		
		barcodeLabel.setBounds(new Rectangle(200,230,100,20));
		transferOutPanel.add(barcodeLabel,null);
		
		// Set up barcode text field		
		barcodeTxtFld.setBounds(new Rectangle(200,255,100,20));
		transferOutPanel.add(barcodeTxtFld,null);
		
		// Set up quantity label
		quantityLabel.setBounds(new Rectangle(315,230,100,20));
		transferOutPanel.add(quantityLabel,null);
		
		// Set up quantity text field
		quantityTxtFld.setBounds(new Rectangle(315,255,100,20));
		transferOutPanel.add(quantityTxtFld,null);					
		
		// Set up add button		
		addButton.setBounds(new Rectangle(200,290,100,30));	
		addButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {addButton_actionPerformed(event);}});
		transferOutPanel.add(addButton,null);
		
		// Set up delete button		
		deleteButton.setBounds(new Rectangle(315,290,100,30));	
		deleteButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {deleteButton_actionPerformed(event);}});
		transferOutPanel.add(deleteButton,null);
		
		// Set up ok button		
		okButton.setBounds(new Rectangle(220,380,100,30));	
		okButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {okButton_actionPerformed(event);}});
		mainPanel.add(okButton,null);
		
		// Set up cancel button		
		cancelButton.setBounds(new Rectangle(335,380,100,30));	
		cancelButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {cancelButton_actionPerformed(event);}});
		mainPanel.add(cancelButton,null);
		
		// Set up apply button		
		applyButton.setBounds(new Rectangle(450,380,100,30));	
		applyButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {applyButton_actionPerformed(event);}});
		mainPanel.add(applyButton,null);
	}
		
	/**
	 * action perform of set supplier button method
	 * @param event
	 */
	private void setSupplierButton_actionPerformed(ActionEvent event) 
	{
		
	}	
		
	/**
	 * action perform of add button method
	 * @param event
	 */
	private void addButton_actionPerformed(ActionEvent event) 	{
		String barcode = new String(barcodeTxtFld.getText());
		String name = null;
		String quantity = new String(quantityTxtFld.getText());
		
		Product product =new Product();
		name = ThaiUtilities.ASCII2Unicode(product.retrieveNameProduct(ThaiUtilities.Unicode2ASCII(barcode)));
		
		String[] row = { barcode,name,quantity };
		
		if(productTableModel.isEmpty())
			productTableModel.clearRow();
		
		productTableModel.addRow(row);		
		
		barcodeTxtFld.setText("");
		quantityTxtFld.setText("");
	}	
	
	/**
	 * action perform of delete button method
	 * @param event
	 */
	private void deleteButton_actionPerformed(ActionEvent event) 
	{
		
	}
		
	/**
	 * action perform of ok button method
	 * @param event
	 */
	private void okButton_actionPerformed(ActionEvent event) 
	{
		setVisible(false);
		dispose();
	}
		
	/**
	 * action perform of cancel button method
	 * @param event
	 */
	private void cancelButton_actionPerformed(ActionEvent event) 
	{
		setVisible(false);
		dispose();
	}
		
	/**
	 * action perform of apply button
	 * @param event
	 */
	private void applyButton_actionPerformed(ActionEvent event) 
	{
		
	}
	
	/**
	 * create nodes product group method
	 * @param productGroupRootNode
	 */
	private void createNodesProductGroup(DefaultMutableTreeNode productGroupRootNode) {
		ProductGroupL1 pgL1 = new ProductGroupL1();
		ProductGroupL1[] productGroupL1 = pgL1.retrieveProductGroupL1s();
		
		DefaultMutableTreeNode level1 = null;
		DefaultMutableTreeNode level2 = null;
		DefaultMutableTreeNode product = null;
		
		for(int i=0; i < productGroupL1.length; i++)
		{
			level1 = new DefaultMutableTreeNode(ThaiUtilities.ASCII2Unicode(productGroupL1[i].getName()));
			productGroupRootNode.add(level1);
			for(int j=0; j < productGroupL1[i].getProductGroupL2s().length; j++)
			{
				level2 = new DefaultMutableTreeNode(ThaiUtilities.ASCII2Unicode(
								productGroupL1[i].getProductGroupL2s()[j].getName()));
				level1.add(level2);
				for(int k=0; k < productGroupL1[i].getProductGroupL2s()[j].getProducts().length; k++)
				{
					product = new DefaultMutableTreeNode(ThaiUtilities.ASCII2Unicode(
									   productGroupL1[i].getProductGroupL2s()[j].getProducts()[k].getName()));
					level2.add(product);
				}
			}
		}
	}
		
	/**
	 * tree selection of product group tree method
	 * @param event
	 */
	private void productGroupTree_treeSelection(TreeSelectionEvent event)
	{
		DefaultMutableTreeNode node = (DefaultMutableTreeNode) productGroupTree.getLastSelectedPathComponent();
		
		if(node == null) return;
		
		if (node.getLevel() == 3)	{
			Product p = new Product();
			p = p.retrieveProductFromName(ThaiUtilities.Unicode2ASCII(node.getUserObject().toString()));
			barcodeTxtFld.setText(p.getBarcode());
		}
	}		
	
	/**
	 * list selection of product table method
	 * @param event
	 */
	private void productTable_listSelection(ListSelectionEvent event) {
		
	}
}
