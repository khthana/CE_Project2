/*
 * ProductSetUI.java 
 */

package retailShop.viewClass;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Rectangle;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JInternalFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.JTree;
import javax.swing.ListSelectionModel;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.event.TreeModelEvent;
import javax.swing.event.TreeModelListener;
import javax.swing.event.TreeSelectionEvent;
import javax.swing.event.TreeSelectionListener;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeModel;
import javax.swing.tree.MutableTreeNode;
import javax.swing.tree.TreePath;
import javax.swing.tree.TreeSelectionModel;

import retailShop.businessClass.Product;
import retailShop.businessClass.ProductGroupL1;
import retailShop.businessClass.ProductSet;
import retailShop.utilClass.RetailShopTableModel;
import retailShop.utilClass.ThaiUtilities;



public class ProductSetUI extends JInternalFrame {	
	/**
	 * class attributes
	 */	
	private JPanel mainPanel = new JPanel();
	private JPanel prdAndPrdSetPanel = new JPanel();
	private JPanel productSetPanel = new JPanel();
	private JPanel productPanel = new JPanel();

	private JLabel barcodeProductSetLabel = new JLabel("Barcode");
	private JLabel nameLabel = new JLabel("Name");
	private JLabel quantityProductSetLabel = new JLabel("Quantity");
	private JLabel salePriceLabel = new JLabel("Sale price");
	private JLabel barcodeProductLabel = new JLabel("Barcode");
	private JLabel quantityProductLabel = new JLabel("Quantity");

	private JTextField barcodeProductSetTxtFld = new JTextField();	
	private JTextField nameProductSetTxtFld = new JTextField();
	private JTextField quantityProductSetTxtFld = new JTextField();
	private JTextField salePriceProductSetTxtFld = new JTextField();
	private JTextField barcodeProductTxtFld = new JTextField();
	private JTextField quantityProductTxtFld = new JTextField();	

	private JTable productTable;
	private RetailShopTableModel productTableModel;	

	private JTree productSetTree = new JTree();
	private JTree productGroupTree = new JTree();

	private JButton newSetButton = new JButton("New");
	private JButton deleteSetButton = new JButton("Delete");
	private JButton productsetSetButton = new JButton("Set");
	private JButton addButton = new JButton("Add");
	private JButton deleteButton = new JButton("Delete");
	private JButton productSetButton = new JButton("Set");
	private JButton okButton = new JButton("OK");
	private JButton cancelButton = new JButton("Cancel");
	private JButton applyButton = new JButton("Apply");			

	private JScrollPane productSetScrollPane;
	private JScrollPane productGroupScrollPane;

	private int selectedRow = 0;

	private DefaultMutableTreeNode productSetRootNode;
	private DefaultMutableTreeNode productGroupL1RootNode;

	private DefaultTreeModel productSetTreeModel;
	private DefaultTreeModel productGroupTreeModel;
		
	/**
	 * class objects
	 */
	private ProductSet[] productSets;
	private ProductGroupL1[] productGroupL1s;
	
	/**
	 * class constructor
	 */
	public ProductSetUI()	{
		// Set name frame
		super("Product set",false,true,false,true);	

		// Set layout main panel
		mainPanel.setLayout(null);

		// Attach panel to container
		getContentPane().add(mainPanel,BorderLayout.CENTER);				
				
		// Create personal info user interface
		createProductSetUI();
				
		// Set frame size
		setSize(615,575);
		
		// Set frame location
		setLocation(
			(Toolkit.getDefaultToolkit().getScreenSize().width - getWidth())/2,
			(Toolkit.getDefaultToolkit().getScreenSize().height - getHeight())/2);
	}
		
	/**
	 * create product set user interface method
	 */
	public void createProductSetUI() {				
		// Set up product and product set panel		
		prdAndPrdSetPanel.setBorder(BorderFactory.createRaisedBevelBorder());
		prdAndPrdSetPanel.setBounds(new Rectangle(20,20,565,450));
		prdAndPrdSetPanel.setLayout(null);		
		mainPanel.add(prdAndPrdSetPanel,null);
		
		// Set up product set tree model
		productSetRootNode = new DefaultMutableTreeNode("Product Set");	
		productSetTreeModel = new DefaultTreeModel(productSetRootNode);
		productSetTreeModel.addTreeModelListener(new TreeModelListener() {
			public void treeNodesChanged(TreeModelEvent e) {
				productSetTreeModel_treeModelListener(e);
			}
			public void treeNodesInserted(TreeModelEvent e) {}
			public void treeNodesRemoved(TreeModelEvent e) {}
			public void treeStructureChanged(TreeModelEvent e) {}});
			
		// create node product set			
		createNodesProductSet(productSetRootNode);			
				
		// Set up product set tree
		productSetTree = new JTree(productSetTreeModel);
		productSetTree.setEditable(true);
		productSetTree.getSelectionModel().setSelectionMode(TreeSelectionModel.SINGLE_TREE_SELECTION);
		productSetTree.setShowsRootHandles(true);
		productSetTree.setBorder(BorderFactory.createEtchedBorder());
		productSetTree.addTreeSelectionListener(new TreeSelectionListener() {
			public void valueChanged(TreeSelectionEvent e) {productSetTree_treeSelection(e);}});			
		productSetScrollPane = new JScrollPane(productSetTree); 
		productSetScrollPane.setBounds(new Rectangle(15,15,175,420));		
		prdAndPrdSetPanel.add(productSetScrollPane,null);
		
		// Set up product tree model
		productGroupL1RootNode = new DefaultMutableTreeNode("Product Group");	
		productGroupTreeModel = new DefaultTreeModel(productGroupL1RootNode);
					
		// create node product set			
		createNodesProductGroupL1(productGroupL1RootNode);			
				
		// Set up product set tree
		productGroupTree = new JTree(productGroupTreeModel);
		productGroupTree.setEditable(true);
		productGroupTree.getSelectionModel().setSelectionMode(
			TreeSelectionModel.SINGLE_TREE_SELECTION);
		productGroupTree.setShowsRootHandles(true);
		productGroupTree.setBorder(BorderFactory.createEtchedBorder());
		productGroupTree.addTreeSelectionListener(new TreeSelectionListener() {
			public void valueChanged(TreeSelectionEvent e) {
				productGroupTree_treeSelection(e);
			}
		});			
		productGroupScrollPane = new JScrollPane(productGroupTree); 
		productGroupScrollPane.setBounds(new Rectangle(15,15,175,420));		
		prdAndPrdSetPanel.add(productGroupScrollPane,null);
		productGroupScrollPane.setVisible(false);
		
		// Set up product set panel
		productSetPanel.setBorder(BorderFactory.createTitledBorder("Product set"));
		productSetPanel.setBounds(new Rectangle(200,10,350,175));		
		productSetPanel.setLayout(null);
		prdAndPrdSetPanel.add(productSetPanel,null);
				
		// Set up product set number label		
		barcodeProductSetLabel.setBounds(new Rectangle(15,15,100,20));
		productSetPanel.add(barcodeProductSetLabel,null);
		
		// Set up product set number text field		
		barcodeProductSetTxtFld.setBounds(new Rectangle(15,40,100,20));
		barcodeProductSetTxtFld.addKeyListener(new KeyListener() {
			public void keyPressed(KeyEvent event) {
				barcodeProductSetTxtFld_keyPressed(event);
			}			
			public void keyReleased(KeyEvent event) {}
			public void keyTyped(KeyEvent event) {}
		});
		productSetPanel.add(barcodeProductSetTxtFld,null);
		
		// Set up name label		
		nameLabel.setBounds(new Rectangle(125,15,100,20));
		productSetPanel.add(nameLabel,null);
		
		// Set up name text field		
		nameProductSetTxtFld.setBounds(new Rectangle(125,40,210,20));
		productSetPanel.add(nameProductSetTxtFld,null);		
		
		// Set up quantity label
		quantityProductSetLabel.setBounds(new Rectangle(15,65,100,20));
		productSetPanel.add(quantityProductSetLabel,null);
		
		// Set up quantity text field
		quantityProductSetTxtFld.setBounds(new Rectangle(15,90,100,20));
		productSetPanel.add(quantityProductSetTxtFld,null);
		
		// Set up sale price label
		salePriceLabel.setBounds(new Rectangle(125,65,100,20));
		productSetPanel.add(salePriceLabel,null);
		
		// Set up sale price text field
		salePriceProductSetTxtFld.setBounds(new Rectangle(125,90,100,20));
		productSetPanel.add(salePriceProductSetTxtFld,null);		
		
		// Set up newGroup button		
		newSetButton.setBounds(new Rectangle(15,125,100,30));	
		newSetButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				newSetButton_actionPerformed(e);
			}
		});
		productSetPanel.add(newSetButton,null);
		
		// Set up deleteGroup button		
		deleteSetButton.setBounds(new Rectangle(125,125,100,30));	
		deleteSetButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				deleteSetButton_actionPerformed(e);
			}
		});
		productSetPanel.add(deleteSetButton,null);
		
		// Set up product set set button
		productsetSetButton.setBounds(new Rectangle(235,125,100,30));
		productsetSetButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				productsetSetButton_actionPerformed(e);
			}			
		});
		productSetPanel.add(productsetSetButton,null);
		
		// Set up product panel
		productPanel.setBorder(BorderFactory.createTitledBorder("Product"));
		productPanel.setBounds(new Rectangle(200,195,350,240));
		productPanel.setOpaque(true); // content panes must be opaque
		productPanel.setLayout(null);
		prdAndPrdSetPanel.add(productPanel,null);		
		
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
			public void valueChanged(ListSelectionEvent e) {
				productTable_listSelection(e);
			}
		});
		JScrollPane tableScrollPane = new JScrollPane(productTable);
		tableScrollPane.setBounds(new Rectangle(15,25,320,100));  
		productPanel.add(tableScrollPane,null);
		
		// Set up barcode label		
		barcodeProductLabel.setBounds(new Rectangle(15,130,100,20));
		productPanel.add(barcodeProductLabel,null);
		
		// Set up barcode text field		
		barcodeProductTxtFld.setBounds(new Rectangle(15,155,100,20));
		barcodeProductTxtFld.addKeyListener(new KeyListener() {
			public void keyPressed(KeyEvent event) {
				barcodeProductTxtFld_keyPressed(event);
			}			
			public void keyReleased(KeyEvent event) {}
			public void keyTyped(KeyEvent event) {}
		});
		productPanel.add(barcodeProductTxtFld,null);
		
		// Set up quantity label
		quantityProductLabel.setBounds(new Rectangle(125,130,100,20));
		productPanel.add(quantityProductLabel,null);
		
		// Set up quantity text field
		quantityProductTxtFld.setBounds(new Rectangle(125,155,100,20));
		productPanel.add(quantityProductTxtFld,null);		
		
		// Set up add button		
		addButton.setBounds(new Rectangle(15,190,100,30));	
		addButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				addButton_actionPerformed(e);
			}
		});
		productPanel.add(addButton,null);
		
		// Set up delete button		
		deleteButton.setBounds(new Rectangle(125,190,100,30));	
		deleteButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				deleteButton_actionPerformed(e);
			}
		});
		productPanel.add(deleteButton,null);
		
		// Set up product set button
		productSetButton.setBounds(new Rectangle(235,190,100,30));
		productSetButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				productSetButton_actionPerformed(e); 
			}			
		});
		productPanel.add(productSetButton,null);
		
		// Set up ok button		
		okButton.setBounds(new Rectangle(235,495,100,30));	
		okButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				okButton_actionPerformed(e);
			}
		});
		mainPanel.add(okButton,null);
		
		// Set up cancel button		
		cancelButton.setBounds(new Rectangle(345,495,100,30));	
		cancelButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				cancelButton_actionPerformed(e);
			}
		});
		mainPanel.add(cancelButton,null);
		
		// Set up apply button		
		applyButton.setBounds(new Rectangle(455,495,100,30));	
		applyButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				applyButton_actionPerformed(e);
			}
		});
		mainPanel.add(applyButton,null);
	}	
	
	/**
	 * key pressed of barcode product set text field method
	 * @param event
	 */
	private void barcodeProductSetTxtFld_keyPressed(KeyEvent event) {
		if(KeyEvent.getKeyText(event.getKeyCode()).equals("Enter")) {			
		}
	}
		
	/**
	 * key pressed of barcode product text field method
	 * @param event
	 */
	private void barcodeProductTxtFld_keyPressed(KeyEvent event) {
		if(KeyEvent.getKeyText(event.getKeyCode()).equals("Enter")) {			
		}
	}

	/**
	 * action perform of new group button method
	 * @param event
	 */
	private void newSetButton_actionPerformed(ActionEvent event) {
		addObject("New product set");
	}
	
	/**
	 * action perform of delete group button
	 * @param event
	 */
	private void deleteSetButton_actionPerformed(ActionEvent event)	{
		String nameProductSet = 
			((DefaultMutableTreeNode)	productSetTree.getLastSelectedPathComponent()).
			getUserObject().toString();
															
		if(JOptionPane.showConfirmDialog(null,
			"Do you want to delete product set " + nameProductSet + " ?",
			"Warning",JOptionPane.YES_NO_OPTION)== 0)	{
			removeCurrentNode();		
			barcodeProductSetTxtFld.setText("");
			nameProductSetTxtFld.setText("");
			quantityProductSetTxtFld.setText("");
			salePriceProductSetTxtFld.setText("");
			String[] row = { "","","" };
			productTableModel.clearRow();
			productTableModel.addRow(row);
						
			ProductSet productSet = new ProductSet();
			productSet.deleteProductSet(ThaiUtilities.Unicode2ASCII(nameProductSet));
		}	
	}
	
	/**
	 * action perform of product set set button method
	 * @param event
	 */
	private void productsetSetButton_actionPerformed(ActionEvent event) {
		productSetScrollPane.setVisible(true);
		productGroupScrollPane.setVisible(false);
	}
	
	/**
	 * action perform of add button
	 * @param event
	 */
	private void addButton_actionPerformed(ActionEvent event)	{
		String barcode = new String(barcodeProductTxtFld.getText());
		String name = null;
		String quantity = new String(quantityProductTxtFld.getText());
		
		Product p =new Product();
		name = ThaiUtilities.ASCII2Unicode(p.retrieveNameProduct(
			ThaiUtilities.Unicode2ASCII(barcode)));
		
		String[] row = { barcode,name,quantity };
		
		if(productTableModel.isEmpty())
			productTableModel.clearRow();
		
		productTableModel.addRow(row);		
		
		barcodeProductTxtFld.setText("");
		quantityProductTxtFld.setText("");
	}
	
	/**
	 * action perform of delete button method
	 * @param event
	 */
	private void deleteButton_actionPerformed(ActionEvent event) {
		productTableModel.deleteRow(selectedRow);
	}
	
	/**
	 * action perform of product set button method
	 * @param event
	 */
	private void productSetButton_actionPerformed(ActionEvent event) {
		productSetScrollPane.setVisible(false);
		productGroupScrollPane.setVisible(true);
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
	private void applyButton_actionPerformed(ActionEvent eevent) {		
		ProductSet productSet = new ProductSet();
		productSet.setBarcode(barcodeProductSetTxtFld.getText());
		productSet.setName(ThaiUtilities.Unicode2ASCII(
			nameProductSetTxtFld.getText()));
		productSet.setQuantity(Integer.parseInt(
			quantityProductSetTxtFld.getText()));
		productSet.setSalePrice(Float.parseFloat(
			salePriceProductSetTxtFld.getText()));
		if(productTableModel.isEmpty()) {
			JOptionPane.showMessageDialog(
				null,"Product set should be have products","Warning",
				JOptionPane.WARNING_MESSAGE);
			return;
		} else {
			int rowCount = productTable.getRowCount();			
			Product[] product = new Product[rowCount];
			
			for(int i=0; i < rowCount; i++) {
				Product p = new Product();
				p.setBarcode((String) productTableModel.getValueAt(i,0));
				p.setQuantity(Integer.parseInt((String) productTableModel.getValueAt(i,2)));		
				product[i] = p;						
			}
			
			productSet.setProduct(product);
			productSet.insertProductSet();
			
			setVisible(false);
			dispose();
		}		
	}
	
	/**
	 * create nodes method
	 * @param productSetRootNode
	 */ 	
	private void createNodesProductSet(
		DefaultMutableTreeNode productSetRootNode) {
		ProductSet productSet = new ProductSet();
		productSets = productSet.retrieveProductSets();
		
		DefaultMutableTreeNode productSetTreeNode = null;		
				
		for(int i=0; i < productSets.length; i++)	{
			productSetTreeNode = new DefaultMutableTreeNode(
				ThaiUtilities.ASCII2Unicode(productSets[i].getName()));
			productSetRootNode.add(productSetTreeNode);
		}
	}	
	
	/**
	 * tree selection of product tree method
	 * @param event
	 */
	private void productSetTree_treeSelection(TreeSelectionEvent event)
	{
		DefaultMutableTreeNode node = 
			(DefaultMutableTreeNode) productSetTree.getLastSelectedPathComponent();

		if(node == null) return;
				
		if (node.getLevel() == 1)	{
			ProductSet productSet = new ProductSet();
			
			productSet = productSet.retrieveProductSet(
				ThaiUtilities.Unicode2ASCII(node.getUserObject().toString()));	
			
			barcodeProductSetTxtFld.setText(productSet.getBarcode());
			nameProductSetTxtFld.setText(
				ThaiUtilities.ASCII2Unicode(productSet.getName()));	
			quantityProductSetTxtFld.setText(new String(
				String.valueOf(productSet.getQuantity())));		
			salePriceProductSetTxtFld.setText(new String(
				String.valueOf(productSet.getSalePrice())));		
							
			if(node.getUserObject().toString().equals("New product set")) {
				String[] row = { "","","" };
				productTableModel.clearRow();
				productTableModel.addRow(row);						
			} else {
				Object[][] data = new String[productSet.getProduct().length][3];
			
				productTableModel.clearRow();
			
				for(int i=0; i < productSet.getProduct().length; i++)	{
					data[i][0] = ThaiUtilities.ASCII2Unicode(
						productSet.getProduct()[i].getBarcode());
					data[i][1] = ThaiUtilities.ASCII2Unicode(
						productSet.getProduct()[i].getName());
					data[i][2] = ThaiUtilities.ASCII2Unicode(
						new String(String.valueOf(productSet.getProduct()[i].
						getQuantity())));
					productTableModel.addRow(data[i]);				
				}			
			}						 							
		}
	}
	
	/**
	 * tree model listener of tree model method
	 * @param event
	 */
	private void productSetTreeModel_treeModelListener(TreeModelEvent event)
	{
		DefaultMutableTreeNode node = (DefaultMutableTreeNode) (event.getTreePath().getLastPathComponent());

		/*
		 * If the event lists children, then the changed node is the child of the node we've already gotten.  
		 * Otherwise, the changed node and the specified node are the same.
		 */
		try {			
			node = (DefaultMutableTreeNode) node.getChildAt(event.getChildIndices()[0]);
		} catch (NullPointerException ex) {
			// print error message
			ex.getMessage();
		}
	}
	
	/**
	 * create nodes product method
	 * @param productGroupL1RootNode
	 */
	private void createNodesProductGroupL1(
		DefaultMutableTreeNode productGroupL1RootNode) {
		ProductGroupL1 pgL1 = new ProductGroupL1();
		productGroupL1s = pgL1.retrieveProductGroupL1s();
		
		DefaultMutableTreeNode level1 = null;
		DefaultMutableTreeNode level2 = null;
		DefaultMutableTreeNode product = null;
		
		for(int i=0; i < productGroupL1s.length; i++)
		{
			level1 = new DefaultMutableTreeNode(
				ThaiUtilities.ASCII2Unicode(productGroupL1s[i].getName()));
			productGroupL1RootNode.add(level1);
			for(int j=0; j < productGroupL1s[i].getProductGroupL2s().length; j++)	{
				level2 = new DefaultMutableTreeNode(ThaiUtilities.ASCII2Unicode(
								productGroupL1s[i].getProductGroupL2s()[j].getName()));
				level1.add(level2);
				for(int k=0; k < productGroupL1s[i].getProductGroupL2s()[j].
					getProducts().length; k++) {
					product = new DefaultMutableTreeNode(ThaiUtilities.ASCII2Unicode(
						productGroupL1s[i].getProductGroupL2s()[j].getProducts()[k].
						getName()));
					level2.add(product);
				}
			}
		}
	}
	
	/**
	 * tree selection of product tree method
	 * @param event
	 */
	private void productGroupTree_treeSelection(TreeSelectionEvent event) {
		DefaultMutableTreeNode node = 
			(DefaultMutableTreeNode) productGroupTree.getLastSelectedPathComponent();
		
		if(node == null) return;
		
		if (node.getLevel() == 3)	{
			Product p = new Product();
			p = p.retrieveProductFromName(ThaiUtilities.Unicode2ASCII(node.getUserObject().toString()));
			barcodeProductTxtFld.setText(p.getBarcode());
		}
	}		
	
	/**
	 * add child to the currently selected node method
	 * @param child
	 * @return DefaultMutableTreeNode
	 */
	private DefaultMutableTreeNode addObject(Object child) {
		DefaultMutableTreeNode parentNode = null;
		TreePath parentPath = productSetTree.getSelectionPath();

		if (parentPath == null) 
			parentNode = productSetRootNode;
				
		return addObject(parentNode, child, true);
	}
	
	/**
	 * add object method
	 * @param parent
	 * @param child
	 * @param shouldBeVisible
	 * @return DefaultMutableTreeNode
	 */
	private DefaultMutableTreeNode addObject(
		DefaultMutableTreeNode parent,Object child,boolean shouldBeVisible)	{
		DefaultMutableTreeNode childNode = new DefaultMutableTreeNode(child);

		if (parent == null)	
			parent = productSetRootNode;		

		productSetTreeModel.insertNodeInto(childNode, parent, parent.getChildCount());
		
		// Make sure the user can see the lovely new node.
		if (shouldBeVisible) 
			productSetTree.scrollPathToVisible(new TreePath(childNode.getPath()));
		
		return childNode;
	}

	/**
	 * remove the currently selected node method
	 */
	private void removeCurrentNode() {
		TreePath currentSelection = productSetTree.getSelectionPath();
		
		if (currentSelection != null)	{
			DefaultMutableTreeNode currentNode = (DefaultMutableTreeNode) currentSelection.getLastPathComponent();
			MutableTreeNode parent = (MutableTreeNode) currentNode.getParent();
			
			if (parent != null)				
				productSetTreeModel.removeNodeFromParent(currentNode);							
		} 		
	}	
	
	/**
	 * list selection of user table method
	 * @param event
	 */
	private void productTable_listSelection(ListSelectionEvent event)	{		
		selectedRow = productTable.getSelectedRow();
	}
}