/*
 * ProductGrouopUI.java
 */

package retailShop.viewClass;

import java.awt.BorderLayout;
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
import javax.swing.JTextField;
import javax.swing.JTree;
import javax.swing.event.TreeModelEvent;
import javax.swing.event.TreeModelListener;
import javax.swing.event.TreeSelectionEvent;
import javax.swing.event.TreeSelectionListener;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeModel;
import javax.swing.tree.MutableTreeNode;
import javax.swing.tree.TreePath;
import javax.swing.tree.TreeSelectionModel;

import retailShop.businessClass.ProductGroupL1;
import retailShop.businessClass.ProductGroupL2;
import retailShop.utilClass.ThaiUtilities;

/**
 * @author Nopphol Noikaew
 */

public class ProductGroupUI extends JInternalFrame {
	/**
	 * class attributes
	 */
	private JPanel mainPanel = new JPanel();
	private JPanel productGroupPanel = new JPanel();
		
	private JLabel productGroupL1Label = new JLabel("Product group level 1");
	private JLabel productGroupL2Label = new JLabel("Product group level 2");
		
	private JTextField productGroupL1TxtFld = new JTextField();
	private JTextField productGroupL2TxtFld = new JTextField();
		
	private JTree productGroupTree = new JTree();
	
	private JButton newButton = new JButton("New");	
	private JButton deleteButton = new JButton("Delete");
	private JButton okButton = new JButton("OK");
	private JButton cancelButton = new JButton("Cancel");
	private JButton applyButton = new JButton("Apply");		
	
	private DefaultMutableTreeNode rootNode;
	
	private DefaultTreeModel treeModel;
	
	private ProductGroupL1[] productGroupL1s;
	
	/**
	 * class constructor
	 */
	public ProductGroupUI()	{
		// Set name frame
		super("Product group",false,true,false,true);	

		// Set layout main panel
		mainPanel.setLayout(null);

		// Attach panel to container
		getContentPane().add(mainPanel,BorderLayout.CENTER);				
				
		// Create product group user interface
		createProductgroupUI();
				
		// Set frame size
		setSize(590,450);
		
		// Set frame location
		setLocation(
			(Toolkit.getDefaultToolkit().getScreenSize().width - getWidth())/2,
			(Toolkit.getDefaultToolkit().getScreenSize().height - getHeight())/2);	
	}	
	
	/**
	 * create product group user interface method
	 */
	private void createProductgroupUI() {				
		// Set up product group panel		
		productGroupPanel.setBorder(BorderFactory.createRaisedBevelBorder());
		productGroupPanel.setBounds(new Rectangle(20,20,540,330));
		productGroupPanel.setLayout(null);
		mainPanel.add(productGroupPanel,null);
		
		// Set up tree model
		rootNode = new DefaultMutableTreeNode("Product Group");	
		treeModel = new DefaultTreeModel(rootNode);
		treeModel.addTreeModelListener(new TreeModelListener() {
			public void treeNodesChanged(TreeModelEvent event) {
				treeModel_treeModelListener(event);
			}
			public void treeNodesInserted(TreeModelEvent event) {}
			public void treeNodesRemoved(TreeModelEvent event) {}
			public void treeStructureChanged(TreeModelEvent event) {}});
			
		// create node			
		createNodes(rootNode);	
		
		// Set up product tree
		productGroupTree = new JTree(treeModel);
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
		JScrollPane scrollPane = new JScrollPane(productGroupTree); 
		scrollPane.setBounds(new Rectangle(15,15,250,300));		
		productGroupPanel.add(scrollPane,null);								
						
		// Set up product group level 1 label		
		productGroupL1Label.setBounds(new Rectangle(275,15,250,20));
		productGroupPanel.add(productGroupL1Label,null);
		
		// Set up product group level 1 text field		
		productGroupL1TxtFld.setBounds(new Rectangle(275,40,250,20));
		productGroupPanel.add(productGroupL1TxtFld,null);
		
		// Set up product group level 2 label		
		productGroupL2Label.setBounds(new Rectangle(275,65,250,20));
		productGroupPanel.add(productGroupL2Label,null);
		
		// Set up product group level 2 text field		
		productGroupL2TxtFld.setBounds(new Rectangle(275,90,250,20));
		productGroupPanel.add(productGroupL2TxtFld,null);
				
		// Set up new group button		
		newButton.setBounds(new Rectangle(310,285,100,30));	
		newButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				newButton_actionPerformed(event);
			}
		});
		productGroupPanel.add(newButton,null);		
		
		// Set up delete button		
		deleteButton.setBounds(new Rectangle(425,285,100,30));	
		deleteButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				deleteButton_actionPerformed(event);
			}
		});
		productGroupPanel.add(deleteButton,null);		
				
		// Set up ok button		
		okButton.setBounds(new Rectangle(215,370,100,30));	
		okButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				okButton_actionPerformed(event);
			}
		});
		mainPanel.add(okButton,null);
		
		// Set up cancel button		
		cancelButton.setBounds(new Rectangle(330,370,100,30));	
		cancelButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				cancelButton_actionPerformed(event);
			}
		});
		mainPanel.add(cancelButton,null);
		
		// Set up apply button		
		applyButton.setBounds(new Rectangle(445,370,100,30));	
		applyButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				applyButton_actionPerformed(event);
			}
		});
		mainPanel.add(applyButton,null);
	}
	
	/**
	 * action perform of new group button method
	 * @param event
	 */
	private void newButton_actionPerformed(ActionEvent event) {
		DefaultMutableTreeNode parentNode = null;
		TreePath parentPath = productGroupTree.getSelectionPath();

		if(parentPath == null) 
			parentNode = rootNode;
		else 
			parentNode = (DefaultMutableTreeNode) parentPath.getLastPathComponent();
					
		if(parentNode.getLevel() == 0)			
			addObject("New product group level 1");
		else if(parentNode.getLevel() == 1)
			addObject("New product group level 2");
	}	
	
	/**
	 * action perform of delete button method
	 * @param event
	 */
	private void deleteButton_actionPerformed(ActionEvent event)	{
		removeCurrentNode();
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
	 * action perform of cancel button
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
		DefaultMutableTreeNode currentNode = null;
		TreePath currentPath = productGroupTree.getSelectionPath();

		if(currentPath == null) 
			return;
		else 
			currentNode = (DefaultMutableTreeNode) currentPath.getLastPathComponent();
		
		if(currentNode.getUserObject().toString().
			equals("New product group level 1")) {
			if(productGroupL1TxtFld.getText().equals("New product group level 1") ||
				productGroupL1TxtFld.getText().equals("")) {
				JOptionPane.showMessageDialog(
					null,"Name of product group level 1 not correct !","Warning",
					JOptionPane.WARNING_MESSAGE);
				return;
			} else {
				new ProductGroupL1().insertProductGroupL1(
					ThaiUtilities.Unicode2ASCII(productGroupL1TxtFld.getText()));
			}			
		} else if(currentNode.getUserObject().toString().
			equals("New product group level 2")) {
			if(currentNode.getParent().toString().
				equals("New product group level 1")) {
					JOptionPane.showMessageDialog(
						null,"Can not to insert product group level 2.\n" +						"Because product group level 1 not to insert !","Warning",
						JOptionPane.WARNING_MESSAGE);
					removeCurrentNode();
					productGroupL1TxtFld.setText("");
					productGroupL2TxtFld.setText("");
					return;
			} else if(productGroupL2TxtFld.getText().
				equals("New product group level 2") ||
				productGroupL2TxtFld.getText().equals("")) {
					JOptionPane.showMessageDialog(
						null,"Name of product group level 2 not correct !","Warning",
						JOptionPane.WARNING_MESSAGE);
					return;
			} else {
				new ProductGroupL2().insertProductGroupL2(
					new ProductGroupL1().retrieveIdProductGroupL1(
					ThaiUtilities.Unicode2ASCII(currentNode.getParent().toString())),
					ThaiUtilities.Unicode2ASCII(productGroupL2TxtFld.getText()));
			}
		} else if(currentNode.getLevel() == 1 && 
			!(currentNode.getUserObject().toString().
			equals(productGroupL1TxtFld.getText()))) {	
			new ProductGroupL1().updateProductGroupL1(
				currentNode.getUserObject().toString(),
				ThaiUtilities.Unicode2ASCII(productGroupL1TxtFld.getText()));
		} else if(currentNode.getLevel() == 2 && 
			!(currentNode.getUserObject().toString().
			equals(productGroupL2TxtFld.getText()))) {	
			new ProductGroupL2().updateProductGroupL2(
				new ProductGroupL1().retrieveIdProductGroupL1(
				ThaiUtilities.Unicode2ASCII(currentNode.getParent().toString())),
				new ProductGroupL2().retrieveIdProductGroupL2(
				new ProductGroupL1().retrieveIdProductGroupL1(
				ThaiUtilities.Unicode2ASCII(currentNode.getParent().toString())),
				ThaiUtilities.Unicode2ASCII(currentNode.getUserObject().toString())),
				ThaiUtilities.Unicode2ASCII(productGroupL2TxtFld.getText()));
		}
			
		setVisible(false);
		dispose();
	}
	
	/**
	 * create nodes
	 * @param rootNode
	 */ 	
	private void createNodes(DefaultMutableTreeNode rootNode) {		
		productGroupL1s = new ProductGroupL1().retrieveProductGroupL1s();
		
		DefaultMutableTreeNode productGroupL1TreeNode = null;
		DefaultMutableTreeNode productGroupL2TreeNode = null;
		DefaultMutableTreeNode productTreeNode = null;
		
		for(int i=0; i < productGroupL1s.length; i++)	{
			productGroupL1TreeNode = new DefaultMutableTreeNode(
				ThaiUtilities.ASCII2Unicode(productGroupL1s[i].getName()));
			rootNode.add(productGroupL1TreeNode);
			for(int j=0; j < productGroupL1s[i].getProductGroupL2s().length; j++)	{
				productGroupL2TreeNode = new DefaultMutableTreeNode(
					ThaiUtilities.ASCII2Unicode(
					productGroupL1s[i].getProductGroupL2s()[j].getName()));
				productGroupL1TreeNode.add(productGroupL2TreeNode);
				for(int k=0; k < productGroupL1s[i].getProductGroupL2s()[j].
					getProducts().length; k++) {
					productTreeNode = new DefaultMutableTreeNode(
						ThaiUtilities.ASCII2Unicode(
						productGroupL1s[i].getProductGroupL2s()[j].
						getProducts()[k].getName()));
					productGroupL2TreeNode.add(productTreeNode);
				}
			}
		}
	}
	
	/**
	 * tree selection of product tree method
	 * @param event
	 */
	private void productGroupTree_treeSelection(TreeSelectionEvent event)	{
		DefaultMutableTreeNode node = 
			(DefaultMutableTreeNode) productGroupTree.getLastSelectedPathComponent();

		if(node == null) return;	
		
		if(node.getLevel() == 0) {
			productGroupL1TxtFld.setText("");
			productGroupL2TxtFld.setText("");
		} else if(node.getLevel() == 1) {
			productGroupL1TxtFld.setText(node.getUserObject().toString());	
			productGroupL2TxtFld.setText("");	
		} else if(node.getLevel() == 2) {
			productGroupL1TxtFld.setText(node.getParent().toString());
			productGroupL2TxtFld.setText(node.getUserObject().toString());
		}
	}
	
	/**
	 * tree model listener of tree model method
	 * @param event
	 */
	private void treeModel_treeModelListener(TreeModelEvent event) {
		DefaultMutableTreeNode node = 
			(DefaultMutableTreeNode) (event.getTreePath().getLastPathComponent());

		/*
		 * If the event lists children, 
		 * then the changed node is the child of the node we've already gotten.  
		 * Otherwise, the changed node and the specified node are the same.
		 */
		try {
			int index = event.getChildIndices()[0];
			node = (DefaultMutableTreeNode) node.getChildAt(index);
		} catch (NullPointerException ex) {
			// print error message
			ex.getMessage();
		}
	}	
	
	/**
	 * Add child to the currently selected node
	 * @param child
	 * @return DefaultMutableTreeNode
	 */
	private DefaultMutableTreeNode addObject(Object child) {
		DefaultMutableTreeNode parentNode = null;
		TreePath parentPath = productGroupTree.getSelectionPath();

		if (parentPath == null) 
			parentNode = rootNode;
		else 
			parentNode = (DefaultMutableTreeNode) parentPath.getLastPathComponent();
		
		return addObject(parentNode,child,true);
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
			parent = rootNode;		

		treeModel.insertNodeInto(childNode,parent,parent.getChildCount());

		// Make sure the user can see the lovely new node.
		if (shouldBeVisible) 
			productGroupTree.scrollPathToVisible(new TreePath(childNode.getPath()));
		
		return childNode;
	}
	
	/**
	 * Remove the currently selected node method
	 */
	private void removeCurrentNode() {
		TreePath currentSelection = productGroupTree.getSelectionPath();
		
		if (currentSelection != null) {
			DefaultMutableTreeNode currentNode = 
				(DefaultMutableTreeNode) currentSelection.getLastPathComponent();
			MutableTreeNode parent = (MutableTreeNode) currentNode.getParent();
			
			if (parent != null)				
				treeModel.removeNodeFromParent(currentNode);							
		} 		
	}
}
