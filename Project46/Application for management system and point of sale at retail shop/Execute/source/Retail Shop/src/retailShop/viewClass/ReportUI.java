/*
 * ReportUI.java
 */

package retailShop.viewClass;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JInternalFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.swing.JToggleButton;
import javax.swing.JTree;
import javax.swing.event.TreeSelectionEvent;
import javax.swing.event.TreeSelectionListener;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeModel;
import javax.swing.tree.TreeSelectionModel;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.Rectangle;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.Calendar;

import com.toedter.calendar.JCalendar;

/**
 * @author Nopphol Noikaew
 */

public class ReportUI extends JInternalFrame
{	
	/**
	 * class attributes
	 */
	// container of internal frame
	private Container container;
	
	// panel of internal frame
	private JPanel mainPanel = new JPanel();
	private JPanel reportPanel = new JPanel();
	
	// label of internal frame
	private JLabel reportNameLabel = new JLabel("Report name");
	private JLabel fromDateLabel = new JLabel("From date");
	private JLabel toDateLabel = new JLabel("To date");
	
	// calendar of internal frame
	private Calendar c = Calendar.getInstance();	
	private JCalendar fromDateCalendar = new JCalendar();
	private JCalendar toDateCalendar = new JCalendar();
	
	// text field of internal frame
	private JTextField nameReportTxtFld = new JTextField();		
	private JTextField fromDateTxtFld = new JTextField(new String(
				String.valueOf(c.get(Calendar.DATE)) + "/" +
				String.valueOf(c.get(Calendar.MONTH)+1) + "/" +
				String.valueOf(c.get(Calendar.YEAR))));	
	private JTextField toDateTxtFld = new JTextField(new String(
				String.valueOf(c.get(Calendar.DATE)) + "/" +
				String.valueOf(c.get(Calendar.MONTH)+1) + "/" +
				String.valueOf(c.get(Calendar.YEAR))));
				
	private DefaultMutableTreeNode reportRootNode;		
	
	private DefaultTreeModel reportTreeModel;		
				
	// tree of internal frame
	private JTree reportTree = new JTree();			
	
	// button of internal frame	
	private JButton reportButton = new JButton("Report");
	private JButton cancelButton = new JButton("Cancel");
	
	// toggle button of internal frame
	private JToggleButton fromDateSetToggleBtn = new JToggleButton("Set");
	private JToggleButton toDateSetToggleBtn = new JToggleButton("Set");		
		
	/**
	 * class constructor
	 */
	public ReportUI() 
	{
		// Set name frame
		super("Reports",false,true,false,true);	

		// attach panel to internal frame content pane
		container = this.getContentPane();
		mainPanel.setLayout(null);
		container.add(mainPanel,BorderLayout.CENTER);						
				
		// Create transfer in user interface
		createReportUI();
				
		// Set frame size
		setSize(660,455);
		
		// Set frame location
		setLocation(
			(Toolkit.getDefaultToolkit().getScreenSize().width - getWidth())/2,
			(Toolkit.getDefaultToolkit().getScreenSize().height - getHeight())/2);				
	}
	
	/**
	 * create transfer out user interface
	 */
	public void createReportUI()
	{			
		// Set up report panel		
		reportPanel.setBorder(BorderFactory.createRaisedBevelBorder());
		reportPanel.setBounds(new Rectangle(20,20,615,330));
		reportPanel.setLayout(null);		
		mainPanel.add(reportPanel,null);
		
		// Set up product tree model
		reportRootNode = new DefaultMutableTreeNode("Report");	
		reportTreeModel = new DefaultTreeModel(reportRootNode);
		
		// create node product set
		createNodesReport(reportRootNode);
		
		// Set up report tree
		reportTree = new JTree(reportTreeModel);
		reportTree.setEditable(true);
		reportTree.getSelectionModel().setSelectionMode(
			TreeSelectionModel.SINGLE_TREE_SELECTION);
		reportTree.setShowsRootHandles(true);
		reportTree.setBorder(BorderFactory.createEtchedBorder());
		reportTree.addTreeSelectionListener(new TreeSelectionListener() {
			public void valueChanged(TreeSelectionEvent event) {
				reportTree_treeSelection(event);
			}
		});			
		JScrollPane reportScrollPane = new JScrollPane(reportTree); 
		reportScrollPane.setBounds(new Rectangle(15,15,320,300));		
		reportPanel.add(reportScrollPane);
				
		// Set up report name label		
		reportNameLabel.setBounds(new Rectangle(350,15,100,20));
		reportPanel.add(reportNameLabel);					
		
		// Set up report name text field			
		nameReportTxtFld.setBounds(new Rectangle(350,40,250,20));		
		reportPanel.add(nameReportTxtFld);
				
		// Set up from date label		
		fromDateLabel.setBounds(new Rectangle(350,65,100,20));
		reportPanel.add(fromDateLabel);		
		
		// Set up from date text field			
		fromDateTxtFld.setBounds(new Rectangle(350,90,100,20));		
		reportPanel.add(fromDateTxtFld);
		
		// Set up set from date button		
		fromDateSetToggleBtn.setBounds(new Rectangle(465,85,100,30));	
		fromDateSetToggleBtn.addItemListener(new ItemListener() {
			public void itemStateChanged(ItemEvent event) {
				fromDateSetToggleBtn_itemStateChanged(event);
			}
		});
		reportPanel.add(fromDateSetToggleBtn);
		
		// Set up to from date calendar
		fromDateCalendar.setBounds(new Rectangle(350,180,215,140));
		reportPanel.add(fromDateCalendar);
		fromDateCalendar.setVisible(false);
		
		// Set up to date label		
		toDateLabel.setBounds(new Rectangle(350,115,100,20));
		reportPanel.add(toDateLabel);	

		// Set up to date text field			
		toDateTxtFld.setBounds(new Rectangle(350,140,100,20));		
		reportPanel.add(toDateTxtFld);			

		// Set up set to date button		
		toDateSetToggleBtn.setBounds(new Rectangle(465,135,100,30));	
		toDateSetToggleBtn.addItemListener(new ItemListener() {
			public void itemStateChanged(ItemEvent event) {
				toDateSetToggleBtn_itemStateChanged(event);
			}
		});
		reportPanel.add(toDateSetToggleBtn);	

		// Set up to to date calendar
		toDateCalendar.setBounds(new Rectangle(350,180,215,140));
		reportPanel.add(toDateCalendar);
		toDateCalendar.setVisible(false);				
		
		// Set up print button		
		reportButton.setBounds(new Rectangle(420,370,100,30));	
		reportButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				reportButton_actionPerformed(event);
			}
		});
		mainPanel.add(reportButton);
		
		// Set up cancel button		
		cancelButton.setBounds(new Rectangle(535,370,100,30));	
		cancelButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				cancelButton_actionPerformed(event);
			}
		});
		mainPanel.add(cancelButton);		
	}		

	/**
	 * action perform of set from date button method
	 * @param event
	 */
	private void fromDateSetToggleBtn_itemStateChanged(ItemEvent event)
	{
		if(event.getStateChange() == ItemEvent.SELECTED)
			fromDateCalendar.setVisible(true);
		else {
			// change value of date
			c = fromDateCalendar.getCalendar();
			fromDateTxtFld.setText(new String(
				String.valueOf(c.get(Calendar.DATE)) + "/" +
				String.valueOf(c.get(Calendar.MONTH)+1) + "/" +
				String.valueOf(c.get(Calendar.YEAR))));
				
			// not visible from date calendar
			fromDateCalendar.setVisible(false);			
		}
	}
	 
	/**
	 * action perform of set to date button method
	 * @param event
	 */
	private void toDateSetToggleBtn_itemStateChanged(ItemEvent event)
	{
		if(event.getStateChange() == ItemEvent.SELECTED)
			toDateCalendar.setVisible(true);
		else {
			// change value of date
			c = toDateCalendar.getCalendar();
			toDateTxtFld.setText(new String(
				String.valueOf(c.get(Calendar.DATE)) + "/" +
				String.valueOf(c.get(Calendar.MONTH)+1) + "/" +
				String.valueOf(c.get(Calendar.YEAR))));
				
			// not visible to date calendar
			toDateCalendar.setVisible(false);			
		}
	}
		
	/** 
	 * action perform of print button method
	 * @param event
	 */
	private void reportButton_actionPerformed(ActionEvent event) {
		
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
	 * create nodes report method
	 * @param reportRootNode
	 */
	private void createNodesReport(DefaultMutableTreeNode reportRootNode) {
		String[] reports = {"รายงานสรุปยอดขายแยกตามแผนกหลัก" , 
												"รายงานสรุปยอดขายแยกตามแผนกย่อย" ,
												"รายงานสรุปยอดขายแยกตามรหัสสินค้า" ,
												"รายงานสรุปยอดขายแยกตามผู้ผลิตสินค้า" ,
												"รายงานสรุปยอดขายแยกตามเซตสินค้า" ,
												"รายงานสรุปยอดขายแยกตามรายชั่วโมง" ,
												"รายงานยอดขายประจำวัน" ,
												"รายงานสรุปยอดขาย" ,
												"รายงานสรุปยอดขายสนค้าขายดีที่สุด" ,
												"รายงานสินค้าต่ำกว่าสต็อก" ,
												"รายงานสินค้าสูงกว่าสต็อก" ,
												"รายงานความเคลื่อนไหวของสินค้า(รับเข้า-เบิกออก)" ,
												"รายงานสินค้าคงคลัง(ตามรหัสสินค้า)" ,
												"รายงานสินค้าคงคลัง(ตามผู้ผลิตสินค้า)" };
												
		DefaultMutableTreeNode reportTreeNode = null;												
												
		for(int i=0; i < reports.length; i++) {
			reportTreeNode = new DefaultMutableTreeNode(reports[i]);
			reportRootNode.add(reportTreeNode);															
		}
	}
	
	/**
	 * tree selection of report tree method
	 * @param event
	 */
	private void reportTree_treeSelection(TreeSelectionEvent event) {
		DefaultMutableTreeNode node = (DefaultMutableTreeNode) reportTree.getLastSelectedPathComponent();
		
		if(node == null) return;
		
		if (node.getLevel() == 1)	{
			nameReportTxtFld.setText(node.getUserObject().toString());
		}
	}	
}
