/*
 * SaleUI.java
 */

package retailShop.viewClass;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Rectangle;
import java.awt.Toolkit;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

import javax.swing.BorderFactory;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.ListSelectionModel;
import javax.swing.SwingConstants;
import javax.swing.border.TitledBorder;

import retailShop.businessClass.Employee;
import retailShop.businessClass.Product;
import retailShop.businessClass.ProductSet;
import retailShop.businessClass.SaleList;
import retailShop.utilClass.RetailShopTableModel;
import retailShop.utilClass.ThaiUtilities;

/**
 * @author Nopphol Noikaew
 */

public class SaleUI extends JFrame {	
	/**
	 * class attributes
	 */
	private JPanel mainPanel = new JPanel();
	private JPanel totalPricePanel = new JPanel();
	private JPanel receiveMoneyPanel = new JPanel();
	private JPanel sendMoneyPanel = new JPanel();
	
	private JLabel nameEmployeeLabel = new JLabel();
	private JLabel idSaleListLabel = new JLabel();
	private JLabel totalPriceLabel = new JLabel("0.0");
	private JLabel receiveMoneyLabel = new JLabel("0.0");
	private JLabel sendMoneyLabel = new JLabel("0.0");
	
	private JTable productTable;
	private RetailShopTableModel productTableModel;	
		
	private int state = 0;
	private double totalPrice = 0;
	private String barcode;
	private StringBuffer buffer = new StringBuffer();
	
	/**
	 * class object
	 */
	private SaleList saleList;

	/**
	 * class constructor
	 * @param username
	 * @param password
	 */
	public SaleUI(String username,String password) {
		// Set name frame
		super("Sale");
		
		// Set resizeable is false
		setResizable(false);

		// Set layout main panel
		mainPanel.setLayout(null);

		// Attach panel to container
		getContentPane().add(mainPanel,BorderLayout.CENTER);			
						
		// Create personal info user interface
		createSaleUI(username,password);
				
		// Set frame size
		setSize(
			Toolkit.getDefaultToolkit().getScreenSize().width,
			Toolkit.getDefaultToolkit().getScreenSize().height);
		
		// Set frame location
		setLocation(
			(Toolkit.getDefaultToolkit().getScreenSize().width - getWidth())/2,
			(Toolkit.getDefaultToolkit().getScreenSize().height - getHeight())/2); 
					
		// Set default capacity buffer					
		buffer.ensureCapacity(13);
	}
	
	/**
	 * create sale user interface method
	 * @param username
	 * @param password
	 */
	private void createSaleUI(String username,String password) {		
		Employee employee = new Employee().retrieveEmployee(username,password);		
		saleList = new SaleList(username,password);
		
		// Set up name employee label
		nameEmployeeLabel.setBounds(new Rectangle(15,15,300,20));
		nameEmployeeLabel.setFont(new Font("SansSerif", Font.PLAIN,14));
		nameEmployeeLabel.setText(
			"พนักงานขาย : " + ThaiUtilities.ASCII2Unicode(employee.getFirstName())+ 
			" " + ThaiUtilities.ASCII2Unicode(employee.getLastName()));		
		mainPanel.add(nameEmployeeLabel);
		
		// Set up sale list number label
		idSaleListLabel.setBounds(new Rectangle(15,40,300,20));
		idSaleListLabel.setFont(new Font("SansSerif", Font.PLAIN,14));
		idSaleListLabel.setText("เลขที่รายการขายสินค้า : " + saleList.getId());
		mainPanel.add((idSaleListLabel));
		
		// row & column
		String[] row = { "","","","","","" };
		String[] column = { "รหัสสินค้า","ชื่อสินค้า","จำนวน","ราคาต่อหน่วย","ส่วนลด","คงเหลือ" };
		
		// Set up product table model
		productTableModel = new RetailShopTableModel(column);		
		productTableModel.addRow(row);
		
		// Set up product table		
		productTable = new JTable(productTableModel);        
		productTable.setPreferredScrollableViewportSize(new Dimension(350,150));	
		productTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);	
		productTable.addKeyListener(new KeyListener() {
			public void keyPressed(KeyEvent event) {
				productTable_keyPressed(event);
			}
			public void keyReleased(KeyEvent event) {
			}
			public void keyTyped(KeyEvent event) {				
			}			
		});		
		JScrollPane productScrollPane = new JScrollPane(productTable);
		productScrollPane.setBounds(new Rectangle
			(15,70,Toolkit.getDefaultToolkit().getScreenSize().width - 35,375));  
		mainPanel.add(productScrollPane,null);
		
		// Set up total price panel 
		totalPricePanel.setBackground(Color.GREEN);
		totalPricePanel.setBorder(BorderFactory.createTitledBorder(
			BorderFactory.createLineBorder(Color.black),"รวมราคา",
			TitledBorder.LEFT,TitledBorder.DEFAULT_POSITION,
			new Font("SansSerif", Font.PLAIN,24),Color.BLACK));
		totalPricePanel.setBounds(new Rectangle
			(15,460,Toolkit.getDefaultToolkit().getScreenSize().width - 35,150));		
		totalPricePanel.setLayout(null);
		mainPanel.add(totalPricePanel,null);
		
		// Set up total price label
		totalPriceLabel.setBounds(new Rectangle(15,0,
			Toolkit.getDefaultToolkit().getScreenSize().width - 65,150));
		totalPriceLabel.setHorizontalAlignment(SwingConstants.RIGHT);
		totalPriceLabel.setFont(new Font("SansSerif", Font.PLAIN,140));
		totalPricePanel.add(totalPriceLabel);
		
		// Set up receive money panel 
		receiveMoneyPanel.setBackground(Color.BLUE);
		receiveMoneyPanel.setBorder(BorderFactory.createTitledBorder(
			BorderFactory.createLineBorder(Color.black),"รับเงิน",
			TitledBorder.LEFT,TitledBorder.DEFAULT_POSITION,
			new Font("SansSerif", Font.PLAIN,18),Color.BLACK));
		receiveMoneyPanel.setBounds(new Rectangle
			(15,625,Toolkit.getDefaultToolkit().getScreenSize().width/2 - 20,100));		
		receiveMoneyPanel.setLayout(null);
		mainPanel.add(receiveMoneyPanel,null);
		
		// Set up receive money label
		receiveMoneyLabel.setBounds(new Rectangle(15,0,
		Toolkit.getDefaultToolkit().getScreenSize().width/2 - 50,100));
		receiveMoneyLabel.setHorizontalAlignment(SwingConstants.RIGHT);
		receiveMoneyLabel.setFont(new Font("SansSerif", Font.PLAIN,100));
		receiveMoneyPanel.add(receiveMoneyLabel);
		
		// Set up total price panel 
		sendMoneyPanel.setBackground(Color.GREEN);
		sendMoneyPanel.setBorder(BorderFactory.createTitledBorder(
			BorderFactory.createLineBorder(Color.black),"ทอนเงิน",
			TitledBorder.LEFT,TitledBorder.DEFAULT_POSITION,
			new Font("SansSerif", Font.PLAIN,18),Color.BLACK));
		sendMoneyPanel.setBounds(new Rectangle
			(Toolkit.getDefaultToolkit().getScreenSize().width/2,625,
			 Toolkit.getDefaultToolkit().getScreenSize().width/2 - 20,100));		
		sendMoneyPanel.setLayout(null);
		mainPanel.add(sendMoneyPanel,null);
		
		// Set up send money label
		sendMoneyLabel.setBounds(new Rectangle(15,0,
			Toolkit.getDefaultToolkit().getScreenSize().width/2 - 50,100));
		sendMoneyLabel.setHorizontalAlignment(SwingConstants.RIGHT);
		sendMoneyLabel.setFont(new Font("SansSerif", Font.PLAIN,100));
		sendMoneyPanel.add(sendMoneyLabel);
	}	
	
	/**
	 * handle press of any key
	 * @param event
	 */
	private void productTable_keyPressed(KeyEvent event) {						
		// ตรวจสอบว่าปุ่ม Enter ถูกกดหรือไม่
		if(KeyEvent.getKeyText(event.getKeyCode()).equals("Enter")) {			
			enter_keyPressed(event);				
		// ตรวจสอบว่าปุ่ม Backspace ถูกกดหรือไม่
		} else if(KeyEvent.getKeyText(event.getKeyCode()).equals("Backspace")) {
			backspace_keyPressed(event);
		// ตรวจสอบว่าปุ่ม . ถูกกดหรือไม่
		} else if(KeyEvent.getKeyText(event.getKeyCode()).equals(".") ||
							KeyEvent.getKeyText(event.getKeyCode()).equals("NumPad .")) {
			dot_keyPressed(event);
		// ตรวจสอบว่าปุ่ม * ถูกกดหรือไม่		
		} else if(KeyEvent.getKeyText(event.getKeyCode()).equals("NumPad *")) {
			star_keyPressed(event);	
		// กดคีย์ใด ๆ
		} else {
			anykey_keyPressed(event);
		}		
	}	
	
	/**
	 * any key key pressed method
	 * @param event
	 */
	private void anykey_keyPressed(KeyEvent event) {	
		// ปัจจุบันตำแหน่ง state เท่ากัับ 1 หรือไม่
		if(state == 1) {
			// ตรวจสอบว่าความยาวของ buffer <= 2 หรือไม่
			if(buffer.length() <= 2) {				
				receiveMoneyLabel.setText(buffer.append(event.getKeyChar()).toString());
			}			
		// ปัจจุบันตำแหน่ง state เท่ากัับ 2 หรือไม่
		} else if(state == 2) {				
			// ตรวจสอบว่าความยาวของ buffer <= 3 หรือไม่
			if(buffer.length() <= 3) {										
				receiveMoneyLabel.setText(buffer.append(event.getKeyChar()) + ".0");
			}				
		// ปัจจุบันตำแหน่ง state เท่ากัับ 3 หรือไม่
		} else if(state == 3) {
			if(KeyEvent.getKeyText(event.getKeyCode()).equals("2") ||
			KeyEvent.getKeyText(event.getKeyCode()).equals("NumPad-2")) {
				receiveMoneyLabel.setText(buffer + ".25");
			} else if(KeyEvent.getKeyText(event.getKeyCode()).equals("5") ||
			KeyEvent.getKeyText(event.getKeyCode()).equals("NumPad-5")) {
				receiveMoneyLabel.setText(buffer + ".50");
			} else if(KeyEvent.getKeyText(event.getKeyCode()).equals("7") ||
			KeyEvent.getKeyText(event.getKeyCode()).equals("NumPad-7")) {
				receiveMoneyLabel.setText(buffer + ".75");
			}
		} else {
			// append buffer
			buffer.append(event.getKeyChar());
		}
	}
	
	/**
	 * backspace key pressed method
	 * @param event
	 */
	private void backspace_keyPressed(KeyEvent event) {
		// ปัจจุบันตำแหน่ง state เท่ากัับ 1 หรือไม่
		if(state == 1) {
			// ตรวจสอบว่าความยาวของ buffer = 0 หรือไม่
			if(buffer.length() == 0) {
				receiveMoneyPanel.setBorder(BorderFactory.createTitledBorder(
					BorderFactory.createLineBorder(Color.black),"รับเงิน",
					TitledBorder.LEFT,TitledBorder.DEFAULT_POSITION,
					new Font("SansSerif", Font.PLAIN,18),Color.BLACK));
					
				receiveMoneyLabel.setText("0.0");
				
				// เปลี่ยน state 1 --> 0
				state = 0;
			// ตรวจสอบว่าความยาวของ buffer = 1 หรือไม่
			} else if(buffer.length() == 1) {
				receiveMoneyLabel.setText(buffer.deleteCharAt(0).toString() + "0");
			// ตรวจสอบว่าความยาวของ buffer > 1 หรือไม่	
			} else if(buffer.length() > 1){
				totalPriceLabel.setText(
					buffer.deleteCharAt(buffer.length()-1).toString());
			}
		// ปัจจุบันตำแหน่ง state เท่ากัับ 2 หรือไม่
		} else if(state == 2) {			
			// ตรวจสอบว่าความยาวของ buffer = 1 หรือไม่
			if(buffer.length() == 1) {					
				receiveMoneyLabel.setText(buffer.deleteCharAt(0).toString() + "0.0");
			// ตรวจสอบว่าความยาวของ buffer > 1 หรือไม่
			} else if(buffer.length() > 1){
				receiveMoneyLabel.setText(
					buffer.deleteCharAt(buffer.length()-1).toString() + ".0");
			}							
		// ปัจจุบันตำแหน่ง state เท่ากัับ 3 หรือไม่														
		} else if(state == 3) {
			receiveMoneyLabel.setText(buffer + ".0");
				
			// เปลี่ยน state 3 --> 2
			state = 2;	
	}
}
	
	/**
	 * dot key pressed method
	 * @param event
	 */	
	private void dot_keyPressed(KeyEvent event) {
		// ปัจจุบันตำแหน่ง state เท่ากัับ 2 หรือไม่
		if(state == 2) {				
			// เปลี่ยน state 2 --> 3
			state = 3;
		}
	}
	
	/**
	 * enter key pressed method
	 * @param event
	 */
	private void enter_keyPressed(KeyEvent event) {
		// ปัจจุบันตำแหน่ง state เท่ากัับ 0 หรือไม่
		if(state == 0) {				
			// ตรวจสอบจำนวนตัวอักษรเท่ากับ 0 หรือไม่
			if(buffer.length() == 0) {
				// ตรวจสอบว่ามีสินค้าหรือไม่ เพื่อป้องกันการกด Enter ครั้งแรกแล้วเปลี่ยน state
				if(!(productTableModel.getValueAt(0,0).equals(""))) {
					// เปลี่ยน state 0 --> 2
				state = 2;		
				}									
			}			
			// ตรวจสอบจำนวนตัวอักษรเท่ากับ 13 หรือไม่ 
			else if(buffer.length() == 13) {						
				Product product = new Product();
				ProductSet productSet = new ProductSet();
				
				// ค้นหาสินค้าจากฐานข้อมูล				
				if(! (product.searchProductFromBarcode(buffer.toString()) ||
					(productSet.searchProductSetFromBarcode(buffer.toString()))) ) {
					JOptionPane.showMessageDialog(null,"ไม่พบข้อมูลหรือยังไม่มีการกำหนดข้อมูล !",
					"Warning",JOptionPane.WARNING_MESSAGE);					
				} else if( (product.searchProductFromBarcode(buffer.toString())) ) {
					
					boolean found = false;
					int index = 0;
					
					for(int i=0; i < productTableModel.getRowCount(); i++) {		
						// ตรวจสอบรหัส  barcode ตรงกับรหัส  barcode เดิมในตารางหรือไม่	
						if(productTableModel.getValueAt(i,0).equals(buffer.toString())) {
							found = true;
							index = i;
						}
					}			
					
					if(found) {	
						// อ่านค่าจำนวนสินค้า														
						int quantity = Integer.parseInt(
							(String) productTableModel.getValueAt(index,2));		
										
						// เพิ่มจำนวนสินค้า									
						productTableModel.setValueAt(String.valueOf(++quantity),index,2);	
						
						// อ่านข้อมูลสินค้าจากฐานข้อมูล							
						product = product.retrieveProductFromBarcode(buffer.toString());
														
						// เพิ่มเงินคงเหลือ
						productTableModel.setValueAt(String.valueOf(
							(product.getSalePrice() - (product.getSalePrice() * 
							(product.getDiscount() / 100))) * quantity),index,5);	
							
						// รีเฟรชตาราง
						productTable.clearSelection();
							
						// รวมเงิน
						totalPrice += product.getSalePrice() -
							(product.getSalePrice() * (product.getDiscount() / 100));
																			
						// แสดงผล																					
						totalPriceLabel.setText(String.valueOf(totalPrice));	
						
						// เก็บค่า barcode
						barcode = new String(buffer.toString());				
					} else {
						// อ่านข้อมูลสินค้าจากฐานข้อมูล							
						product = product.retrieveProductFromBarcode(buffer.toString());
							
						// ข้อมูลสินค้าที่ต้องการเพิ่มในตาราง
						String[] row = { buffer.toString(),
							ThaiUtilities.ASCII2Unicode(product.getName()),"1",
							String.valueOf(product.getSalePrice()),
							String.valueOf(product.getDiscount()),
							String.valueOf(product.getSalePrice() -
							(product.getSalePrice() * (product.getDiscount() / 100)))
						};
							
						// product table model ว่างหรือไม่
						if(productTableModel.isEmpty())
							productTableModel.clearRow();
						
						// เพิ่ม row
						productTableModel.addRow(row);
							
						// รีเฟรชตาราง
						productTable.clearSelection();
							
						// รวมเงิน
						totalPrice += product.getSalePrice() -
							(product.getSalePrice() * (product.getDiscount() / 100));
																			
						// แสดงผล																					
						totalPriceLabel.setText(String.valueOf(totalPrice));
						
						// เก็บค่า barcode
						barcode = new String(buffer.toString());
					}					
				} else if((productSet.searchProductSetFromBarcode(buffer.toString()))) {
					boolean found = false;
					int index = 0;
					
					for(int i=0; i < productTableModel.getRowCount(); i++) {		
						// ตรวจสอบรหัส  barcode ตรงกับรหัส  barcode เดิมในตารางหรือไม่	
						if(productTableModel.getValueAt(i,0).equals(buffer.toString())) {
							found = true;
							index = i;
						}
					}
					
					if(found) {	
						// อ่านค่าจำนวนสินค้า														
						int quantity = Integer.parseInt(
							(String) productTableModel.getValueAt(index,2));		
										
						// เพิ่มจำนวนสินค้า									
						productTableModel.setValueAt(String.valueOf(++quantity),index,2);	
						
						// อ่านข้อมูลสินค้าจากฐานข้อมูล							
						productSet = productSet.retrieveProductSetFromBarcode(
							buffer.toString());
														
						// เพิ่มเงินคงเหลือ
						productTableModel.setValueAt(String.valueOf(
							productSet.getSalePrice() * quantity),index,5);	
							
						// รีเฟรชตาราง
						productTable.clearSelection();
							
						// รวมเงิน
						totalPrice += productSet.getSalePrice();
																			
						// แสดงผล																					
						totalPriceLabel.setText(String.valueOf(totalPrice));	
						
						// เก็บค่า barcode
						barcode = new String(buffer.toString());				
					} else {
						// อ่านข้อมูลสินค้าจากฐานข้อมูล							
						productSet = productSet.retrieveProductSetFromBarcode(
							buffer.toString());
							
						// ข้อมูลสินค้าที่ต้องการเพิ่มในตาราง
						String[] row = { buffer.toString(),
							ThaiUtilities.ASCII2Unicode(productSet.getName()),"1",
							String.valueOf(productSet.getSalePrice()),"0.0",
							String.valueOf(productSet.getSalePrice())
						};
							
						// product table model ว่างหรือไม่
						if(productTableModel.isEmpty())
							productTableModel.clearRow();
						
						// เพิ่ม row
						productTableModel.addRow(row);
							
						// รีเฟรชตาราง
						productTable.clearSelection();
							
						// รวมเงิน
						totalPrice += productSet.getSalePrice();
																			
						// แสดงผล																					
						totalPriceLabel.setText(String.valueOf(totalPrice));
						
						// เก็บค่า barcode
						barcode = new String(buffer.toString());
					}	
				}														
			}				
		// ปัจจุบันตำแหน่ง state เท่ากัับ 1 หรือไม่
		} else if(state == 1) {				
			receiveMoneyPanel.setBorder(BorderFactory.createTitledBorder(
				BorderFactory.createLineBorder(Color.black),"รับเงิน",
				TitledBorder.LEFT,TitledBorder.DEFAULT_POSITION,
				new Font("SansSerif", Font.PLAIN,18),Color.BLACK));
				
			receiveMoneyLabel.setText("0.0");
			
			for(int i=0; i < productTableModel.getRowCount(); i++) {						
				// ตรวจสอบรหัส  barcode ตรงกับรหัส  barcode เดิมในตารางหรือไม่						
				if(productTableModel.getValueAt(i,0).equals(barcode)) {
					productTableModel.setValueAt(buffer.toString(),i,2);
				}
										
				// อ่านข้อมูลสินค้าจากฐานข้อมูล 
				Product product = new Product();
				ProductSet productSet = new ProductSet();
					
				if(product.searchProductFromBarcode(barcode)) {
					product = product.retrieveProductFromBarcode(barcode);
					
					// อ่านค่าจำนวนสินค้า														
					int quantity = Integer.parseInt(buffer.toString());
																
					// เพิ่มเงินคงเหลือ
					productTableModel.setValueAt(String.valueOf(
						(product.getSalePrice() - (product.getSalePrice() * 
						(product.getDiscount() / 100))) * quantity),i,5);
						
				} else if(productSet.searchProductSetFromBarcode(barcode)) {
					productSet = productSet.retrieveProductSetFromBarcode(barcode);
					
					// อ่านค่าจำนวนสินค้า														
					int quantity = Integer.parseInt(buffer.toString());
																
					// เพิ่มเงินคงเหลือ
					productTableModel.setValueAt(String.valueOf(
						productSet.getSalePrice()* quantity),i,5);
				}
			}				
						
			// รีเฟรชตาราง
			productTable.clearSelection();
			
			// เคลียร์ total price
			totalPrice = 0;
							
			// รวมเงิน
			for(int i=0; i < productTableModel.getRowCount(); i++) {
				totalPrice += Double.parseDouble(
					(String) productTableModel.getValueAt(i,5));
			}
																						
			// แสดงผล																					
			totalPriceLabel.setText(String.valueOf(totalPrice));				
					
			// เปลี่ยน state 1 --> 0
			state = 0;
			
		// ปัจจุบันตำแหน่ง state เท่ากัับ 2 หรือไม่
		} else if(state == 2) {
			//	ตรวจสอบ 0 < จำนวนตัวอักษร <= 4 หรือไม่
			if((buffer.length() > 0) && (buffer.length() <= 4)) {
				if(Double.parseDouble(receiveMoneyLabel.getText()) >=
					Double.parseDouble(totalPriceLabel.getText())) {
						
					sendMoneyLabel.setText(String.valueOf(
						Double.parseDouble(receiveMoneyLabel.getText()) -
						Double.parseDouble(totalPriceLabel.getText())));
						
					Product[] products = new Product[productTableModel.getRowCount()];
				
					for(int i=0; i < productTableModel.getRowCount(); i++) {
						Product product = new Product().retrieveProductFromBarcode(
						(String) productTableModel.getValueAt(i,0));
						product.setQuantity(product.getQuantity() - 
							Integer.parseInt((String) productTableModel.getValueAt(i,2)));
						product.updateProduct();						
						
						product.setBarcode((String) productTableModel.getValueAt(i,0));
						product.setQuantity(Integer.parseInt(
							(String) productTableModel.getValueAt(i,2)));
						products[i] = product;
					}
				
					saleList.setProducts(products);
					saleList.setTotalPrice(Double.parseDouble(totalPriceLabel.getText()));
					saleList.insertSaleList();
						
					// เปลี่ยน state 2 --> 4
					state = 4;
				} else {
					JOptionPane.showMessageDialog(
						null,"จำนวนเงินที่รับน้อยกว่าจำนวนเงินรวม !","Warning",
						JOptionPane.WARNING_MESSAGE);
					
					receiveMoneyLabel.setText("0.0");
				}				
			}
		// ปัจจุบันตำแหน่ง state เท่ากัับ 3 หรือไม่
		} else if(state == 3) {						
			if(Double.parseDouble(receiveMoneyLabel.getText()) >=
				Double.parseDouble(totalPriceLabel.getText())) {
						
				sendMoneyLabel.setText(String.valueOf(
					Double.parseDouble(receiveMoneyLabel.getText()) -
					Double.parseDouble(totalPriceLabel.getText())));
						
				Product[] products = new Product[productTableModel.getRowCount()];
				
				for(int i=0; i < productTableModel.getRowCount(); i++) {
					Product product = new Product().retrieveProductFromBarcode(
						(String) productTableModel.getValueAt(i,0));
					product.setQuantity(product.getQuantity() - 
						Integer.parseInt((String) productTableModel.getValueAt(i,2)));
					product.updateProduct();						
						
					product.setBarcode((String) productTableModel.getValueAt(i,0));
					product.setQuantity(Integer.parseInt(
						(String) productTableModel.getValueAt(i,2)));
					products[i] = product;
				}
				
				saleList.setProducts(products);
				saleList.setTotalPrice(Double.parseDouble(totalPriceLabel.getText()));
				saleList.insertSaleList();
						
				// เปลี่ยน state 3 --> 4
				state = 4;
			} else {
				JOptionPane.showMessageDialog(
					null,"จำนวนเงินที่รับน้อยกว่าจำนวนเงินรวม !","Warning",
					JOptionPane.WARNING_MESSAGE);
					
				receiveMoneyLabel.setText("0.0");
			}								
		// ปัจจุบันตำแหน่ง state เท่ากัับ 4 หรือไม่
		} else if(state == 4) {
			// ตรวจสอบจำนวนตัวอักษรเท่ากับ 0 หรือไม่
			if(buffer.length() == 0) {								
				// ค่าเริ่มต้นของตาราง
				String[] row = { "","","","","","" };
					
				// เคลียร์ค่าต่าง ๆ เพื่อเข้าสู่ state 0 
				totalPrice = 0;
				productTableModel.clearRow();
				productTableModel.addRow(row);
				productTable.clearSelection();					
				totalPriceLabel.setText("0.0");
				receiveMoneyLabel.setText("0.0");
				sendMoneyLabel.setText("0.0");
				saleList.setId(saleList.retrieveId());
				idSaleListLabel.setText("เลขที่รายการขายสินค้า : " + saleList.getId());
				
				// เปลี่ยน state 4 --> 0
				state = 0;					
			}
		}		
			
		// clear buffer
		buffer.delete(0,buffer.length());
	}
	
	/**
	 * star key pressed method
	 * @param event
	 */
	private void star_keyPressed(KeyEvent event) {
		// ปัจจุบันตำแหน่ง state เท่ากัับ 0 หรือไม่
		if(state == 0) {			
			receiveMoneyPanel.setBorder(BorderFactory.createTitledBorder(
					BorderFactory.createLineBorder(Color.black),"จำนวน",
					TitledBorder.LEFT,TitledBorder.DEFAULT_POSITION,
					new Font("SansSerif", Font.PLAIN,18),Color.BLACK));
					
			receiveMoneyLabel.setText("0");
					
			// เปลี่ยน state 0 --> 1
			state = 1;
		}
	}
}
