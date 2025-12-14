/*
 * PersonalInfoUI.java
 */

package retailShop.viewClass;

import java.awt.BorderLayout;
import java.awt.Rectangle;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.Calendar;
import java.util.Date;
import java.util.Vector;

import javax.swing.BorderFactory;
import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.JToggleButton;

import retailShop.businessClass.Employee;
import retailShop.businessClass.Position;
import retailShop.utilClass.ThaiUtilities;

import com.toedter.calendar.JCalendar;

public class PersonalInfoUI extends JFrame {
	/**
	 * class attributes
	 */		
	private JPanel mainPanel = new JPanel();
	private JPanel personalPanel = new JPanel();
	private JPanel picturePanel = new JPanel();
	private JPanel positionPanel = new JPanel();
	private JPanel salaryPanel = new JPanel();	
	
	private JLabel usernameLabel = new JLabel("Username");
	private JLabel firstnameLabel = new JLabel("First name");
	private JLabel lastnameLabel = new JLabel("Last name");
	private JLabel sexLabel = new JLabel("Sex");
	private JLabel dateOfBirthLabel = new JLabel("Date of birth");
	private JLabel addressLabel = new JLabel("Address");
	private JLabel telephoneLabel = new JLabel("Telephone");
	private JLabel mobileLabel = new JLabel("Mobile");
	private JLabel positionLabel = new JLabel("Position");
	private JLabel nowSalaryLabel = new JLabel("Now salary");	
	private JLabel bathNowSalaryLabel = new JLabel("Bath");
	private JLabel lastSalaryLabel = new JLabel("Last salary");	
	private JLabel bathLastSalaryLabel = new JLabel("Bath");
	private JLabel dateOfLastAdjLabel = new JLabel("Last adjust salary");	
	
	private Calendar calendar = Calendar.getInstance();	
	private JCalendar dateOfBirthCalendar = new JCalendar();
	private JCalendar dateOfLastAdjCalendar = new JCalendar();	
	
	private JTextField usernameTxtFld = new JTextField();
	private JTextField firstnameTxtFld = new JTextField();		
	private JTextField lastnameTxtFld = new JTextField();
	private JTextField dateOfBirthTxtFld = new JTextField();
	private JTextField telephoneTxtFld = new JTextField();
	private JTextField mobileTxtFld = new JTextField();
	private JTextField nowSalaryTxtFld = new JTextField();
	private JTextField lastSalaryTxtFld = new JTextField();
	private JTextField dateOfLastAdjTxtFld = new JTextField();	
	
	private JTextArea addressTxtArea = new JTextArea();	
	
	private ButtonGroup sexButtonGroup = new ButtonGroup();	
	
	private JButton okButton = new JButton("OK");
	private JButton cancelButton = new JButton("Cancel");
	private JButton applyButton = new JButton("Apply");	
	
	private JToggleButton setDateOfBirthToggleBtn = new JToggleButton("Set");
	private JToggleButton setLastAdjSalaryToggleBtn = new JToggleButton("Set");	
	
	private JRadioButton maleRadioBtn = new JRadioButton("Male");
	private JRadioButton femaleRadioBtn = new JRadioButton("Female");	
	
	private JCheckBox adminCheckBox = new JCheckBox("Administrator");
	private JCheckBox managerCheckBox = new JCheckBox("Manager");
	private JCheckBox salesmanCheckBox = new JCheckBox("Salesman");
	private JCheckBox warehouseCheckBox = new JCheckBox("Warehouse officer");		
	
	private Employee employee;
				
	/**
	 * class constructor
	 * @param employee
	 */
	public PersonalInfoUI(Employee employee) {
		// Set name frame		
		super("Personal Info");

		// Set layout main panel
		mainPanel.setLayout(null);

		// Attach panel to container
		getContentPane().add(mainPanel,BorderLayout.CENTER);	
		
		// Create personal info user interface
		createPersonalInfoUI(employee);
				
		// Set frame size
		setSize(685,480);
		
		// Set frame location
		setLocation(
			(Toolkit.getDefaultToolkit().getScreenSize().width - getWidth())/2,
			(Toolkit.getDefaultToolkit().getScreenSize().height - getHeight())/2);
	}	
	
	/**
	 * create personal info user interface method
	 * @param employee
	 */
	private void createPersonalInfoUI(Employee employee) {		
		this.employee = employee;
				
		// Set up personal panel		
		personalPanel.setBorder(BorderFactory.createRaisedBevelBorder());
		personalPanel.setBounds(new Rectangle(20,20,380,355));
		personalPanel.setLayout(null);
		mainPanel.add(personalPanel,null);
		
		// Set up employee number label		
		usernameLabel.setBounds(new Rectangle(15,15,100,20));		
		personalPanel.add(usernameLabel, null);
		
		// Set up employee number text field		
		usernameTxtFld.setBounds(new Rectangle(15,40,100,20));		
		usernameTxtFld.setText(employee.getUsername());
		personalPanel.add(usernameTxtFld,null);
		
		// Set up first name label		
		firstnameLabel.setBounds(new Rectangle(15,65,100,20));	
		personalPanel.add(firstnameLabel, null);
		
		// Set up first name text field		
		firstnameTxtFld.setBounds(new Rectangle(15,90,100,20));
		firstnameTxtFld.setText(
			ThaiUtilities.ASCII2Unicode(employee.getFirstName()));						
		personalPanel.add(firstnameTxtFld,null);
		
		// Set up last name label		
		lastnameLabel.setBounds(new Rectangle(130,65,100,20));
		personalPanel.add(lastnameLabel, null);
		
		// Set up last name text field		
		lastnameTxtFld.setBounds(new Rectangle(130,90,100,20));
		lastnameTxtFld.setText(ThaiUtilities.ASCII2Unicode(employee.getLastName()));				
		personalPanel.add(lastnameTxtFld,null);
		
		// Set up sex label		
		sexLabel.setBounds(new Rectangle(15,115,100,20));
		personalPanel.add(sexLabel, null);		
		
		// Set up male radio button		
		maleRadioBtn.setBounds(new Rectangle(15,135,100,20));		
		sexButtonGroup.add(maleRadioBtn);
		personalPanel.add(maleRadioBtn, null);
		
		// Set up female radio button		
		femaleRadioBtn.setBounds(new Rectangle(130,135,100,20));		
		sexButtonGroup.add(femaleRadioBtn);
		personalPanel.add(femaleRadioBtn, null);
				
		// show sex of employee
		if(employee.getSex())
			maleRadioBtn.setSelected(true);
		else
			femaleRadioBtn.setSelected(true);			
					
		// Set up date of birth label		
		dateOfBirthLabel.setBounds(new Rectangle(15,160,100,20));
		personalPanel.add(dateOfBirthLabel, null);		
		
		// Set up date of birth text field			
		dateOfBirthTxtFld.setBounds(new Rectangle(15,185,100,20));	
		Date date = employee.getDateOfBirth();
		calendar.setTime(employee.getDateOfBirth());
		calendar.set(calendar.get(Calendar.YEAR)-543,calendar.get(Calendar.MONTH)+1,
		calendar.get(Calendar.DAY_OF_MONTH));
		dateOfBirthTxtFld.setText(new String(
			String.valueOf(calendar.get(Calendar.DAY_OF_MONTH)) + "/" +
			String.valueOf(calendar.get(Calendar.MONTH)+1) + "/" +
			String.valueOf(calendar.get(Calendar.YEAR)+543)));				
		personalPanel.add(dateOfBirthTxtFld,null);				
		
		// Set up set date of birth button		
		setDateOfBirthToggleBtn.setBounds(new Rectangle(130,180,100,30));	
		setDateOfBirthToggleBtn.addItemListener(new ItemListener() {
			public void itemStateChanged(ItemEvent e) {setDateOfBirthToggleBtn_itemStateChanged(e);}});
		personalPanel.add(setDateOfBirthToggleBtn,null);
		
		// Set up to date of birth calendar
		dateOfBirthCalendar.setBounds(new Rectangle(15,220,215,125));
		dateOfBirthCalendar.setCalendar(calendar);		
		personalPanel.add(dateOfBirthCalendar,null);
		dateOfBirthCalendar.setVisible(false);
		
		// Set up address label		
		addressLabel.setBounds(new Rectangle(15,215,100,20));
		personalPanel.add(addressLabel, null);
		
		// Set up address text area		
		addressTxtArea.setBorder(BorderFactory.createEtchedBorder());	
		addressTxtArea.setText(ThaiUtilities.ASCII2Unicode(employee.getAddress()));			
		JScrollPane txtAreaScrollPane = new JScrollPane(addressTxtArea); 
		txtAreaScrollPane.setBounds(new Rectangle(15,240,350,45));		
		personalPanel.add(txtAreaScrollPane,null);
		
		// Set up telephone label		
		telephoneLabel.setBounds(new Rectangle(15,290,100,20));
		personalPanel.add(telephoneLabel, null);
		
		// Set up telephone text field		
		telephoneTxtFld.setBounds(new Rectangle(15,315,100,20));
		telephoneTxtFld.setText(employee.getTelephone());		
		personalPanel.add(telephoneTxtFld,null);
		
		// Set up mobile label		
		mobileLabel.setBounds(new Rectangle(130,290,100,20));
		personalPanel.add(mobileLabel, null);
		
		// Set up mobile text field		
		mobileTxtFld.setBounds(new Rectangle(130,315,100,20));
		mobileTxtFld.setText(employee.getMobile());		
		personalPanel.add(mobileTxtFld,null);
		
		// Set up picture panel		
		picturePanel.setBorder(BorderFactory.createRaisedBevelBorder());
		picturePanel.setBounds(new Rectangle(255,20,100,120));
		picturePanel.setLayout(null);
		personalPanel.add(picturePanel,null);
		
		// Set up position panel		
		positionPanel.setBorder(BorderFactory.createRaisedBevelBorder());
		positionPanel.setBounds(new Rectangle(415,20,240,155));
		positionPanel.setLayout(null);
		mainPanel.add(positionPanel,null);
		
		// Set up position label		
		positionLabel.setBounds(new Rectangle(15,15,100,20));
		positionPanel.add(positionLabel, null);		
		
		// Set up administrator checkbox		
		adminCheckBox.setBounds(new Rectangle(15,40,120,20));
		adminCheckBox.setSelected(employee.searchPosition("Administrator"));	
		positionPanel.add(adminCheckBox, null);		

		// Set up manager checkbox		
		managerCheckBox.setBounds(new Rectangle(15,65,120,20));
		managerCheckBox.setSelected(employee.searchPosition("Manager"));
		positionPanel.add(managerCheckBox, null);

		// Set up salesman checkbox		
		salesmanCheckBox.setBounds(new Rectangle(15,90,120,20));
		salesmanCheckBox.setSelected(employee.searchPosition("Salesman"));
		positionPanel.add(salesmanCheckBox, null);		
		
		// Set up warehouse officer checkbox		
		warehouseCheckBox.setBounds(new Rectangle(15,115,140,20));
		warehouseCheckBox.setSelected(employee.searchPosition("Warehouse officer"));
		positionPanel.add(warehouseCheckBox, null);
				
		// Set up salary panel		
		salaryPanel.setBorder(BorderFactory.createRaisedBevelBorder());
		salaryPanel.setBounds(new Rectangle(415,190,240,185));
		salaryPanel.setLayout(null);
		mainPanel.add(salaryPanel,null);
		
		// Set up now salary label		
		nowSalaryLabel.setBounds(new Rectangle(15,15,100,20));
		salaryPanel.add(nowSalaryLabel, null);
		
		// Set up now salary text field		
		nowSalaryTxtFld.setBounds(new Rectangle(15,40,100,20));
		nowSalaryTxtFld.setText(new String(String.valueOf(
			employee.getNowSalary())));		
		salaryPanel.add(nowSalaryTxtFld,null);
		
		// Set up bath now salary label		
		bathNowSalaryLabel.setBounds(new Rectangle(120,40,50,20));
		salaryPanel.add(bathNowSalaryLabel, null);	
		
		// Set up last salary label		
		lastSalaryLabel.setBounds(new Rectangle(15,65,100,20));
		salaryPanel.add(lastSalaryLabel, null);
		
		// Set up last salary text field		
		lastSalaryTxtFld.setBounds(new Rectangle(15,90,100,20));
		lastSalaryTxtFld.setText(new String(String.valueOf(
			employee.getLastSalary())));		
		salaryPanel.add(lastSalaryTxtFld,null);
		
		// Set up bath last salary label		
		bathLastSalaryLabel.setBounds(new Rectangle(120,90,50,20));
		salaryPanel.add(bathLastSalaryLabel, null);
		
		// Set up last adjust salary label		
		dateOfLastAdjLabel.setBounds(new Rectangle(15,115,150,20));
		salaryPanel.add(dateOfLastAdjLabel, null);
		
		// Set up last adjust salary date text field			
		dateOfLastAdjTxtFld.setBounds(new Rectangle(15,145,100,20));
		calendar.setTime(employee.getDateOfLastAdj());
		calendar.set(calendar.get(Calendar.YEAR)-543,calendar.get(Calendar.MONTH)+1,
			calendar.get(Calendar.DAY_OF_MONTH));
		dateOfLastAdjTxtFld.setText(new String(
			String.valueOf(calendar.get(Calendar.DAY_OF_MONTH)) + "/" +
			String.valueOf(calendar.get(Calendar.MONTH)+1) + "/" +
			String.valueOf(calendar.get(Calendar.YEAR)+543)));		
		salaryPanel.add(dateOfLastAdjTxtFld,null);			

		// Set up set last adjust salary date button		
		setLastAdjSalaryToggleBtn.setBounds(new Rectangle(125,140,100,30));	
		setLastAdjSalaryToggleBtn.addItemListener(new ItemListener() {
			public void itemStateChanged(ItemEvent e) {
				setLastAdjSalaryToggleBtn_itemStateChanged(e);
			}
		});
		salaryPanel.add(setLastAdjSalaryToggleBtn,null);		
		
		// Set up to last adjust salary calendar
		dateOfLastAdjCalendar.setBounds(new Rectangle(15,15,210,125));
		dateOfLastAdjCalendar.setCalendar(calendar);
		salaryPanel.add(dateOfLastAdjCalendar,null);
		dateOfLastAdjCalendar.setVisible(false);
		
		// Set up ok button		
		okButton.setBounds(new Rectangle(335,395,100,30));	
		okButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				okButton_actionPerformed(event);
			}
		});
		mainPanel.add(okButton,null);
		
		// Set up cancel button		
		cancelButton.setBounds(new Rectangle(445,395,100,30));	
		cancelButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				cancelButton_actionPerformed(event);
			}
		});
		mainPanel.add(cancelButton,null);
		
		// Set up apply button		
		applyButton.setBounds(new Rectangle(555,395,100,30));	
		applyButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				applyButton_actionPerformed(event);
			}
		});
		mainPanel.add(applyButton,null);
	}
	
	/**
	 * action perform of set date of birth button method
	 * @param event
	 */
	private void setDateOfBirthToggleBtn_itemStateChanged(ItemEvent event) {
		if(event.getStateChange() == ItemEvent.SELECTED) {			
			dateOfBirthCalendar.setVisible(true);
		}	else {
			// change value of date
			calendar = dateOfBirthCalendar.getCalendar();
			dateOfBirthTxtFld.setText(new String(
				String.valueOf(calendar.get(Calendar.DAY_OF_MONTH)) + "/" +
				String.valueOf(calendar.get(Calendar.MONTH)+1) + "/" +
				String.valueOf(calendar.get(Calendar.YEAR)+543)));
				
			// not visible from date calendar
			dateOfBirthCalendar.setVisible(false);			
		}
	}
	
	/**
	 * action perform of set last adjust salary date button method
	 * @param event
	 */
	private void setLastAdjSalaryToggleBtn_itemStateChanged(ItemEvent event) {
		if(event.getStateChange() == ItemEvent.SELECTED) {
			nowSalaryLabel.setVisible(false);
			nowSalaryTxtFld.setVisible(false);
			bathNowSalaryLabel.setVisible(false);
			lastSalaryLabel.setVisible(false);
			lastSalaryTxtFld.setVisible(false);
			bathLastSalaryLabel.setVisible(false);
			dateOfLastAdjLabel.setVisible(false);
			dateOfLastAdjCalendar.setVisible(true);
		}	else {
			// change value of date
			calendar = dateOfLastAdjCalendar.getCalendar();
			dateOfLastAdjTxtFld.setText(new String(
				String.valueOf(calendar.get(Calendar.DAY_OF_MONTH)) + "/" +
				String.valueOf(calendar.get(Calendar.MONTH)+1) + "/" +
				String.valueOf(calendar.get(Calendar.YEAR)+543)));
				
			// not visible from date calendar
			dateOfLastAdjCalendar.setVisible(false);
			nowSalaryLabel.setVisible(true);
			nowSalaryTxtFld.setVisible(true);
			bathNowSalaryLabel.setVisible(true);
			lastSalaryTxtFld.setVisible(true);
			lastSalaryLabel.setVisible(true);	
			bathLastSalaryLabel.setVisible(true);
			dateOfLastAdjLabel.setVisible(true);
		}
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
		employee.setFirstName(
			ThaiUtilities.Unicode2ASCII(firstnameTxtFld.getText()));
		employee.setLastName(
			ThaiUtilities.Unicode2ASCII(lastnameTxtFld.getText()));	
		employee.setUsername(usernameTxtFld.getText());			
		
		if(maleRadioBtn.isSelected()) 
			employee.setSex(true);
		else 
			employee.setSex(false);				
		
		employee.setDateOfBirth(dateOfBirthCalendar.getCalendar().getTime());		
		employee.setDateOfLastAdj(dateOfLastAdjCalendar.getCalendar().getTime());		
		employee.setAddress(ThaiUtilities.Unicode2ASCII(addressTxtArea.getText()));		
		employee.setTelephone(telephoneTxtFld.getText());
		employee.setMobile(mobileTxtFld.getText());		
		employee.setNowSalary(Integer.parseInt(nowSalaryTxtFld.getText()));
		employee.setLastSalary(Integer.parseInt(lastSalaryTxtFld.getText()));
				
		Vector temp = new Vector();
		
		if(adminCheckBox.isSelected())
			temp.addElement(adminCheckBox.getText());
		if(managerCheckBox.isSelected())
			temp.addElement(managerCheckBox.getText());
		if(salesmanCheckBox.isSelected())
			temp.addElement(salesmanCheckBox.getText());
		if(warehouseCheckBox.isSelected())
			temp.addElement(warehouseCheckBox.getText());
			
		Position[] positions = new Position[temp.size()];						
		
		for(int i=0; i < positions.length; i++) {	
			Position position = new Position();
			position.setName((String) temp.elementAt(i));
			positions[i] = position;
		}
						
		employee.setPosition(positions);				
		employee.updateEmployee();			
				
		setVisible(false);
		dispose();
	}
}