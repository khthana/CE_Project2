/*
 * ProductInfoUI.java
 */

package retailShop.viewClass;

import java.awt.BorderLayout;
import java.awt.Rectangle;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JInternalFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.swing.JTree;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeModel;
import javax.swing.tree.MutableTreeNode;
import javax.swing.tree.TreePath;
import javax.swing.tree.TreeSelectionModel;
import javax.swing.event.TreeSelectionEvent;
import javax.swing.event.TreeSelectionListener;

import retailShop.businessClass.Product;
import retailShop.businessClass.ProductGroupL1;
import retailShop.businessClass.Supplier;
import retailShop.utilClass.ThaiUtilities;

/**
 * @author Nopphol Noikaew
 */

public class ProductInfoUI extends JInternalFrame {
	/**
	 * class attributes
	 */	
	private JPanel mainPanel = new JPanel();
	private JPanel productInfoPanel = new JPanel();
	private JPanel picturePanel = new JPanel();
	
	private JLabel barcodeLabel = new JLabel("Barcode");
	private JLabel nameLabel = new JLabel("Name");
	private JLabel unitLabel = new JLabel("Unit");
	private JLabel quantityLabel = new JLabel("Quantity");
	private JLabel numMinLabel = new JLabel("Minimum");
	private JLabel numMaxLabel = new JLabel("Maximum");
	private JLabel avgCostLabel = new JLabel("Average cost");
	private JLabel salePriceLabel = new JLabel("Sale price");
	private JLabel discountLabel = new JLabel("Discount (%)");
	private JLabel productGroupLabel = new JLabel("Product group");
	private JLabel supplierLabel = new JLabel("Supplier");
	
	private JTextField barcodeTxtFld = new JTextField();
	private JTextField nameTxtFld = new JTextField();
	private JTextField quantityTxtFld = new JTextField();
	private JTextField numMinTxtFld = new JTextField();
	private JTextField numMaxTxtFld = new JTextField();
	private JTextField avgCostTxtFld = new JTextField();
	private JTextField salePriceTxtFld = new JTextField();
	private JTextField discountTxtFld = new JTextField();
	private JTextField productGroupTxtFld = new JTextField();
	private JTextField supplierTxtFld = new JTextField();
	
	private DefaultMutableTreeNode productGroupRootNode;
	private DefaultMutableTreeNode supplierRootNode;
	
	private DefaultTreeModel productGroupTreeModel;
	private DefaultTreeModel supplierTreeModel;
	
	private JTree productGroupTree = new JTree();	
	private JTree supplierTree = new JTree();
		
	private JButton setProductGroupButton = new JButton("Set");
	private JButton setSupplierButton = new JButton("Set");
	private JButton newProductButton = new JButton("New");
	private JButton deleteProductButton = new JButton("Delete");
	private JButton okButton = new JButton("OK");
	private JButton cancelButton = new JButton("Cancel");
	private JButton applyButton = new JButton("Apply");	
	
	private String units[] = {	"","ชิ้น","อัน","กล่อง","ลัง","หีบ","ตัว","แพ็ค","ถุง",
		"กระป๋อง","ขวด","เครื่อง","คู่","แก้ว","เล่ม" };
		
	private JComboBox unitCombo = new JComboBox(units);	
		
	private JScrollPane productGroupScrollPane;
	private JScrollPane supplierScrollPane;	
	
	/**
	 * class objects
	 */
	private ProductGroupL1[] productGroupL1s;
	private Supplier[] suppliers;
	
	/**
	 * class constructor
	 */
	public ProductInfoUI() {
		// Set name frame
		super("Product Info",false,true,false,true);

		// Set layout main panel
		mainPanel.setLayout(null);

		// Attach panel to container
		getContentPane().add(mainPanel,BorderLayout.CENTER);		
						
		// Create personal info user interface
		createProductInfoUI();
				
		// Set frame size
		setSize(590,535);
		
		// Set frame location
		setLocation(
			(Toolkit.getDefaultToolkit().getScreenSize().width - getWidth())/2,
			(Toolkit.getDefaultToolkit().getScreenSize().height - getHeight())/2);		
	}
	
	/**
	 * create product info user interface method
	 */
	private void createProductInfoUI() {				
		// Set up product info panel		
		productInfoPanel.setBorder(BorderFactory.createRaisedBevelBorder());
		productInfoPanel.setBounds(new Rectangle(20,20,545,420));
		productInfoPanel.setLayout(null);
		mainPanel.add(productInfoPanel);				
				
		// Set up product tree model
		productGroupRootNode = new DefaultMutableTreeNode("Product Group");	
		productGroupTreeModel = new DefaultTreeModel(productGroupRootNode);		
			
		// create node product set			
		createNodesProductGroup(productGroupRootNode);			
				
		// Set up product set tree
		productGroupTree = new JTree(productGroupTreeModel);
		productGroupTree.setEditable(true);
		productGroupTree.getSelectionModel().setSelectionMode(
			TreeSelectionModel.SINGLE_TREE_SELECTION);
		productGroupTree.setShowsRootHandles(true);
		productGroupTree.setBorder(BorderFactory.createEtchedBorder());
		productGroupTree.addTreeSelectionListener(new TreeSelectionListener() {
			public void valueChanged(TreeSelectionEvent event) {
				productGroupTree_treeSelection(event);
			}
		});			
		productGroupScrollPane = new JScrollPane(productGroupTree); 
		productGroupScrollPane.setBounds(new Rectangle(15,15,175,390));		
		productInfoPanel.add(productGroupScrollPane,null);		
		
		// Set up supplier tree		
		DefaultMutableTreeNode supplierTop = new DefaultMutableTreeNode("Supplier");
		createSupplierNodes(supplierTop);
		supplierTree = new JTree(supplierTop);
		supplierTree.getSelectionModel().setSelectionMode(
			TreeSelectionModel.SINGLE_TREE_SELECTION);
		supplierTree.setBorder(BorderFactory.createEtchedBorder());
		supplierTree.addTreeSelectionListener(new TreeSelectionListener() {
			public void valueChanged(TreeSelectionEvent e) {
				supplierTree_treeSelection(e);
			}
		});		
		supplierScrollPane = new JScrollPane(supplierTree); 
		supplierScrollPane.setBounds(new Rectangle(15,15,175,390));		
		productInfoPanel.add(supplierScrollPane);
		supplierScrollPane.setVisible(false);
		
		// Set up barcode label		
		barcodeLabel.setBounds(new Rectangle(200,15,100,20));
		productInfoPanel.add(barcodeLabel);
		
		// Set up barcode text field		
		barcodeTxtFld.setBounds(new Rectangle(200,40,100,20));
		barcodeTxtFld.addKeyListener(new KeyListener() {
			public void keyPressed(KeyEvent event) {
				barcodeTxtFld_keyPressed(event);
			}			
			public void keyReleased(KeyEvent event) {}
			public void keyTyped(KeyEvent event) {}
		});
		productInfoPanel.add(barcodeTxtFld);
		
		// Set up name label		
		nameLabel.setBounds(new Rectangle(200,65,100,20));
		productInfoPanel.add(nameLabel);
		
		// Set up name text field		
		nameTxtFld.setBounds(new Rectangle(200,90,215,20));
		productInfoPanel.add(nameTxtFld);
		
		// Set up unit label		
		unitLabel.setBounds(new Rectangle(200,115,100,20));
		productInfoPanel.add(unitLabel);
		
		// Set up unit combobox		
		unitCombo.setMaximumRowCount(5);		
		unitCombo.setBounds(new Rectangle(200,140,100,20));
		productInfoPanel.add(unitCombo);
		
		// Set up quantity label		
		quantityLabel.setBounds(new Rectangle(315,115,100,20));
		productInfoPanel.add(quantityLabel);
		
		// Set up quantity text field		
		quantityTxtFld.setBounds(new Rectangle(315,140,100,20));
		productInfoPanel.add(quantityTxtFld);
		
		// Set up minimum number label		
		numMinLabel.setBounds(new Rectangle(200,165,100,20));
		productInfoPanel.add(numMinLabel);
		
		// Set up minimum number text field		
		numMinTxtFld.setBounds(new Rectangle(200,190,100,20));
		productInfoPanel.add(numMinTxtFld);
		
		// Set up maximum number label		
		numMaxLabel.setBounds(new Rectangle(315,165,100,20));
		productInfoPanel.add(numMaxLabel);
		
		// Set up maximum number text field		
		numMaxTxtFld.setBounds(new Rectangle(315,190,100,20));
		productInfoPanel.add(numMaxTxtFld);
		
		// Set up average cost label		
		avgCostLabel.setBounds(new Rectangle(200,215,100,20));
		productInfoPanel.add(avgCostLabel);
		
		// Set up average cost text field		
		avgCostTxtFld.setBounds(new Rectangle(200,240,100,20));
		productInfoPanel.add(avgCostTxtFld);
		
		// Set up sale price label		
		salePriceLabel.setBounds(new Rectangle(315,215,100,20));
		productInfoPanel.add(salePriceLabel);
		
		// Set up sale price text field		
		salePriceTxtFld.setBounds(new Rectangle(315,240,100,20));
		productInfoPanel.add(salePriceTxtFld);
		
		// Set up discount label		
		discountLabel.setBounds(new Rectangle(430,215,100,20));
		productInfoPanel.add(discountLabel);
		
		// Set up discount text field		
		discountTxtFld.setBounds(new Rectangle(430,240,100,20));
		productInfoPanel.add(discountTxtFld);		
		
		// Set up product group label		
		productGroupLabel.setBounds(new Rectangle(200,265,100,20));
		productInfoPanel.add(productGroupLabel);
		
		// Set up product group text field		
		productGroupTxtFld.setBounds(new Rectangle(200,290,215,20));
		productInfoPanel.add(productGroupTxtFld);
		
		// Set up set product group button		
		setProductGroupButton.setBounds(new Rectangle(430,285,100,30));	
		setProductGroupButton.addActionListener(new ActionListener() {			
			public void actionPerformed(ActionEvent event) {
				setProductGroupButton_actionPerformed(event);
			}
		});
		productInfoPanel.add(setProductGroupButton);
		
		// Set up supplier label		
		supplierLabel.setBounds(new Rectangle(200,315,100,20));
		productInfoPanel.add(supplierLabel);
		
		// Set up supplier text field		
		supplierTxtFld.setBounds(new Rectangle(200,340,215,20));
		productInfoPanel.add(supplierTxtFld);
		
		// Set up set supplier button		
		setSupplierButton.setBounds(new Rectangle(430,335,100,30));	
		setSupplierButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				setSupplierButton_actionPerformed(event);
			}
		});
		productInfoPanel.add(setSupplierButton);
		
		// Set up new product button
		newProductButton.setBounds(new Rectangle(200,375,100,30));
		newProductButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				newProductButton_actionPerformed(event);
			}					
		});
		productInfoPanel.add(newProductButton);
		
		//	Set up delete product button
		deleteProductButton.setBounds(new Rectangle(315,375,100,30));
		deleteProductButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				deleteProductButton_actionPerformed(event);
			}					
		});				
		productInfoPanel.add(deleteProductButton);
		
		// Set up picture panel		
		picturePanel.setBorder(BorderFactory.createRaisedBevelBorder());
		picturePanel.setBounds(new Rectangle(430,20,100,120));
		picturePanel.setLayout(null);
		productInfoPanel.add(picturePanel);
		
		// Set up ok button		
		okButton.setBounds(new Rectangle(220,460,100,30));	
		okButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				okButton_actionPerformed(event);
			}
		});
		mainPanel.add(okButton);
		
		// Set up cancel button		
		cancelButton.setBounds(new Rectangle(335,460,100,30));	
		cancelButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				cancelButton_actionPerformed(event);
			}
		});
		mainPanel.add(cancelButton);
		
		// Set up apply button		
		applyButton.setBounds(new Rectangle(450,460,100,30));	
		applyButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				applyButton_actionPerformed(event);
			}
		});
		mainPanel.add(applyButton);		
	}		
				
	/**
	 * key event of barcode text field method
	 * @param event
	 */
	private void barcodeTxtFld_keyPressed(KeyEvent event) {				
		if(KeyEvent.getKeyText(event.getKeyCode()).equals("Enter")) {
			Product product = new Product().retrieveProductFromBarcode(
				barcodeTxtFld.getText());	
			
			barcodeTxtFld.setText(product.getBarcode());
			nameTxtFld.setText(ThaiUtilities.ASCII2Unicode(product.getName()));
			unitCombo.setSelectedItem(ThaiUtilities.ASCII2Unicode(product.getUnit()));
			quantityTxtFld.setText(String.valueOf(product.getQuantity()));
			numMinTxtFld.setText(String.valueOf(product.getNumMin()));		
			numMaxTxtFld.setText(String.valueOf(product.getNumMax()));
			avgCostTxtFld.setText(String.valueOf(product.getAvgCost()));
			salePriceTxtFld.setText(String.valueOf(product.getSalePrice()));
			discountTxtFld.setText(String.valueOf(product.getDiscount()));
						
			productGroupTxtFld.setText(
				ThaiUtilities.ASCII2Unicode(product.getNameProductGroupL1()) + "/"  +
				ThaiUtilities.ASCII2Unicode(product.getNameProductGroupL2()));
																	 	
			supplierTxtFld.setText(
				ThaiUtilities.ASCII2Unicode(product.getNameSupplier()));
		}
	}

	/**
	 * action performed of set product grouop button method
	 * @param event
	 */
	private void setProductGroupButton_actionPerformed(ActionEvent event)	{
		productGroupScrollPane.setVisible(true);
		supplierScrollPane.setVisible(false);
	}
		
	/**
	 * actio performed of set supplier button method
	 * @param event
	 */
	private void setSupplierButton_actionPerformed(ActionEvent event) {
		productGroupScrollPane.setVisible(false);
		supplierScrollPane.setVisible(true);
	}	
	
	/**
	 * action performed of new product button method
	 * @param event
	 */
	private void newProductButton_actionPerformed(ActionEvent event) {		
		if(productGroupScrollPane.isVisible()) {
			DefaultMutableTreeNode parentNode = null;
			TreePath parentPath = productGroupTree.getSelectionPath();
			
		if(parentPath == null) 
			return;
		else 
			parentNode = (DefaultMutableTreeNode) parentPath.getLastPathComponent();		
					
		if(parentNode.getLevel() == 2)			
			addObject("New product");
		}		
	}	
	
	/**
	 * action performed of delete product button method
	 * @param event
	 */
	private void deleteProductButton_actionPerformed(ActionEvent event) {
		String nameProduct = 
			((DefaultMutableTreeNode)	productGroupTree.
			getLastSelectedPathComponent()).getUserObject().toString();
													
		if(JOptionPane.showConfirmDialog(
			null,"Do you want to delete product " + nameProduct + " ?",
			"Warning",JOptionPane.YES_NO_OPTION)== 0)	{
			removeCurrentNode();
			barcodeTxtFld.setText("");
			nameTxtFld.setText("");
			quantityTxtFld.setText("");
			numMinTxtFld.setText("");
			numMaxTxtFld.setText("");
			avgCostTxtFld.setText("");
			salePriceTxtFld.setText("");
			discountTxtFld.setText("");
			productGroupTxtFld.setText("");
			supplierTxtFld.setText("");
			
			removeCurrentNode();
			
			new Product().deleteProduct(ThaiUtilities.Unicode2ASCII(nameProduct));
		}
	}	
			
	/**
	 * action performed of ok button method
	 * @param event
	 */
	private void okButton_actionPerformed(ActionEvent event) {
		setVisible(false);
		dispose();
	}
		
	/**
	 * action performed of cancel button method
	 * @param event
	 */
	private void cancelButton_actionPerformed(ActionEvent event) {
		setVisible(false);
    dispose();
	}	
		
	/**
	 * action performed of apply button method
	 * @param event
	 */
	private void applyButton_actionPerformed(ActionEvent event) {
		Product product = new Product();		
				
		product.setBarcode(barcodeTxtFld.getText());
		product.setName(
			ThaiUtilities.Unicode2ASCII(nameTxtFld.getText()));	
		product.setUnit(
			ThaiUtilities.Unicode2ASCII((String) unitCombo.getSelectedItem()));
		product.setQuantity(Integer.parseInt(quantityTxtFld.getText()));
		product.setNumMin(Integer.parseInt(numMinTxtFld.getText()));
		product.setNumMax(Integer.parseInt(numMaxTxtFld.getText()));
		product.setAvgCost(Double.parseDouble(avgCostTxtFld.getText()));
		product.setSalePrice(Double.parseDouble(salePriceTxtFld.getText()));
		product.setDiscount(Double.parseDouble(discountTxtFld.getText()));		
		product.setNameSupplier(
			ThaiUtilities.Unicode2ASCII(supplierTxtFld.getText()));
		
		String productGroup = productGroupTxtFld.getText();		
		int index = productGroup.indexOf("/");
		product.setNameProductGroupL1(
			ThaiUtilities.Unicode2ASCII(productGroup.substring(0,index)));
		product.setNameProductGroupL2(
			ThaiUtilities.Unicode2ASCII(
			productGroup.substring(index+1,productGroup.length())));
		
		DefaultMutableTreeNode node = 
			(DefaultMutableTreeNode) productGroupTree.getLastSelectedPathComponent();
			
		if(node.getUserObject().toString().equals("New product"))
			product.insertProduct();
		else
			product.updateProduct();
		
		setVisible(false);
		dispose();
	}
	
	/**
	 * create nodes product group method
	 * @param productGroupRootNode
	 */
	private void createNodesProductGroup(
		DefaultMutableTreeNode productGroupRootNode) {		
		productGroupL1s = new ProductGroupL1().retrieveProductGroupL1s();
		
		DefaultMutableTreeNode productGroupL1TreeNode = null;
		DefaultMutableTreeNode productGroupL2TreeNode = null;
		DefaultMutableTreeNode productTreeNode = null;
		
		for(int i=0; i < productGroupL1s.length; i++)	{
			productGroupL1TreeNode = new DefaultMutableTreeNode(
				ThaiUtilities.ASCII2Unicode(productGroupL1s[i].getName()));
			productGroupRootNode.add(productGroupL1TreeNode);
			for(int j=0; j < productGroupL1s[i].getProductGroupL2s().length; j++)
			{
				productGroupL2TreeNode = new DefaultMutableTreeNode(ThaiUtilities.ASCII2Unicode(
								productGroupL1s[i].getProductGroupL2s()[j].getName()));
				productGroupL1TreeNode.add(productGroupL2TreeNode);
				for(int k=0; k < productGroupL1s[i].getProductGroupL2s()[j].
					getProducts().length; k++) {
					productTreeNode = new DefaultMutableTreeNode(
						ThaiUtilities.ASCII2Unicode(productGroupL1s[i].
						getProductGroupL2s()[j].getProducts()[k].getName()));
					productGroupL2TreeNode.add(productTreeNode);
				}
			}
		}		
	}
		
	/**
	 * tree selection of product group tree method
	 * @param event
	 */
	private void productGroupTree_treeSelection(TreeSelectionEvent event)	{
		DefaultMutableTreeNode currentNode = null;
		TreePath currentPath = productGroupTree.getSelectionPath();
		
		if(currentPath == null) 
			return;
		else 
			currentNode = (DefaultMutableTreeNode) currentPath.getLastPathComponent();
		
		if(currentNode.getLevel() == 3 && 
			currentNode.getUserObject().toString().equals("New product")) {
			return;
		}		
		
		if(currentNode.getLevel() == 2)	{			
				productGroupTxtFld.setText(currentNode.getParent().toString() + "/" + 
				currentNode.getUserObject().toString());				
		} else if(currentNode.getLevel() == 3) {				
			Product product = new Product().retrieveProductFromName(
				ThaiUtilities.Unicode2ASCII(currentNode.getUserObject().toString()));	
			
			barcodeTxtFld.setText(product.getBarcode());
			nameTxtFld.setText(ThaiUtilities.ASCII2Unicode(product.getName()));
			unitCombo.setSelectedItem(ThaiUtilities.ASCII2Unicode(product.getUnit()));
			quantityTxtFld.setText(String.valueOf(product.getQuantity()));
			numMinTxtFld.setText(String.valueOf(product.getNumMin()));		
			numMaxTxtFld.setText(String.valueOf(product.getNumMax()));
			avgCostTxtFld.setText(String.valueOf(product.getAvgCost()));
			salePriceTxtFld.setText(String.valueOf(product.getSalePrice()));
			discountTxtFld.setText(String.valueOf(product.getDiscount()));
			
			if(product.getNameProductGroupL1().equals("") && 
				product.getNameProductGroupL2().equals(""))
				productGroupTxtFld.setText(currentNode.getParent().getParent().toString() + 
				"/" + currentNode.getParent().toString());
			else
				productGroupTxtFld.setText(
				ThaiUtilities.ASCII2Unicode(product.getNameProductGroupL1()) + "/"  +
				ThaiUtilities.ASCII2Unicode(product.getNameProductGroupL2()));
																	 	
			supplierTxtFld.setText(
				ThaiUtilities.ASCII2Unicode(product.getNameSupplier()));
		}
	}
	
	/**
	 * create supplier nodes method
	 * @param supplierRootNode
	 */
	private void createSupplierNodes(DefaultMutableTreeNode supplierRootNode) {
		Supplier supplier = new Supplier();		
		suppliers = supplier.retrieveSuppliers();		
		
		DefaultMutableTreeNode supplierTreeNode = null;
		
		for(int i=0; i < suppliers.length; i++) {
			supplierTreeNode = new DefaultMutableTreeNode(
				ThaiUtilities.ASCII2Unicode(suppliers[i].getName()));
			supplierRootNode.add(supplierTreeNode);
		}
	}
	
	/**
	 * tree selection of supplier tree method
	 * @param event
	 */
	private void supplierTree_treeSelection(TreeSelectionEvent event) {
		DefaultMutableTreeNode node = 
			(DefaultMutableTreeNode) supplierTree.getLastSelectedPathComponent();
		
		if(node == null) return;
		
		if (node.getLevel() == 1)	{
			supplierTxtFld.setText(node.getUserObject().toString());
		}
	}
	
	/**
	 * add child to the currently selected node
	 */
	private DefaultMutableTreeNode addObject(Object child) {
		DefaultMutableTreeNode parentNode = null;
		TreePath parentPath = productGroupTree.getSelectionPath();

		if (parentPath == null) 
			return null;
		else if( ! (parentPath.getPathCount() == 3))
			return null;
		else
		parentNode = (DefaultMutableTreeNode) parentPath.getLastPathComponent();
		
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

		productGroupTreeModel.insertNodeInto(
			childNode, parent, parent.getChildCount());
		
		// Make sure the user can see the lovely new node.
		if (shouldBeVisible) 
			productGroupTree.scrollPathToVisible(new TreePath(childNode.getPath()));
		
		return childNode;
	}

	/**
	 * remove the currently selected node
	 */
	private void removeCurrentNode() 
	{
		TreePath currentSelection = productGroupTree.getSelectionPath();
		
		if (currentSelection != null) 
		{
			DefaultMutableTreeNode currentNode = 
				(DefaultMutableTreeNode) currentSelection.getLastPathComponent();
			MutableTreeNode parent = (MutableTreeNode) currentNode.getParent();
			
			if (parent != null)				
				productGroupTreeModel.removeNodeFromParent(currentNode);							
		}
	}	
}
