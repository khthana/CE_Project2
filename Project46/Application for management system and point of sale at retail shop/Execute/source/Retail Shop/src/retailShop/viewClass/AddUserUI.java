/*
 * AddUserUI.java 
 */

package retailShop.viewClass;

import java.awt.BorderLayout;
import java.awt.Rectangle;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

import retailShop.businessClass.Employee;

/**
 * @author Nopphol Noikaew
 */

public class AddUserUI extends JFrame {
	/**
	 * class attributes
	 */
	private JPanel mainPanel = new JPanel();
	
	private JLabel usernameLabel = new JLabel("User name");
	private JLabel password1Label = new JLabel("Password (not over 20 character)");
	private JLabel password2Label = new JLabel("Re-Password (not over 20 character)");
	
	private JTextField usernameTxtFld = new JTextField();
	private JPasswordField passwordFld1 = new JPasswordField();
	private JPasswordField passwordFld2 = new JPasswordField();
	
	private JButton okButton = new JButton("OK");
	private JButton cancelButton = new JButton("Cancel");	
	
	private String username,password1,password2;
		
	/**
	 * class constructor
	 */
	public AddUserUI() {
		// Set name frame
		super("Add User");

		// Set layout main panel
		mainPanel.setLayout(null);

		// Attach panel to container
		getContentPane().add(mainPanel,BorderLayout.CENTER);						
				
		// Create add user user interface
		addUserUI();
				
		// Set frame size
		setSize(260,255);
		
		// Set frame location
		setLocation(
			(Toolkit.getDefaultToolkit().getScreenSize().width - getWidth())/2,
			(Toolkit.getDefaultToolkit().getScreenSize().height - getHeight())/2);
	}
		
	/**
	 * add user user interface method
	 */
	private void addUserUI() {
		// Set up user name label		
		usernameLabel.setBounds(new Rectangle(15,15,200,20));
		mainPanel.add(usernameLabel,null);
		
		// Set up user name text field		
		usernameTxtFld.setBounds(new Rectangle(15,40,220,20));
		mainPanel.add(usernameTxtFld,null);
		
		// Set up password1 label		
		password1Label.setBounds(new Rectangle(15,65,200,20));
		mainPanel.add(password1Label,null);
		
		// Set up password1 text field		
		passwordFld1.setBounds(new Rectangle(15,90,220,20));
		mainPanel.add(passwordFld1,null);
		
		// Set up password2 label		
		password2Label.setBounds(new Rectangle(15,115,200,20));
		mainPanel.add(password2Label,null);
		
		// Set up password2 text field		
		passwordFld2.setBounds(new Rectangle(15,140,220,20));
		mainPanel.add(passwordFld2,null);
		
		// Set up ok button		
		okButton.setBounds(new Rectangle(15,180,100,30));	
		okButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				okButton_actionPerformed(event);
			}
		});
		mainPanel.add(okButton,null);
		
		// Set up cancel button		
		cancelButton.setBounds(new Rectangle(135,180,100,30));	
		cancelButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				cancelButton_actionPerformed(event);
			}
		});
		mainPanel.add(cancelButton,null);
	}
		
	/**
	 * action perform of ok button method
	 * @param event
	 */
	private void okButton_actionPerformed(ActionEvent event){			
		//	รับค่าจาก user name text field
		username = usernameTxtFld.getText();
		
		//	รับค่าจาก password1 password field		
		password1 = new String(passwordFld1.getPassword());
		
		//	รับค่าจาก password2 password field		
		password2 = new String(passwordFld2.getPassword());
		
		// ตรวจสอบว่า username ถูกกรอกรายละเอียดหรือไม่
		if(username.equals(""))		
			JOptionPane.showMessageDialog(
				null,"Username blank","Warning",JOptionPane.WARNING_MESSAGE);				
		// ตรวจสอบว่า username มากกว่า 20 ตัวอักษรหรือไม่
		else if(username.length() > 20)	{
			JOptionPane.showMessageDialog(
				null,"Username over 20 characters","Warning",JOptionPane.WARNING_MESSAGE);
			usernameTxtFld.setText("");
		//	ตรวจสอบว่า password1 ถูกกรอกรายละเอียดหรือไม่
		} else if((password1.equals("")) || (password2.equals("")))
			JOptionPane.showMessageDialog(
				null,"Password blank","Warning",JOptionPane.WARNING_MESSAGE);
		// ตรวจสอบว่า password1 = password2 หรือไม่
		else if(!password1.equals(password2))	{
			JOptionPane.showMessageDialog(
				null,"Password incorrect !","Warning",JOptionPane.WARNING_MESSAGE);
			passwordFld1.setText("");
			passwordFld2.setText("");
		}	else {			
			new Employee().insertEmployee(username,password1);
			setVisible(false);
			dispose();			
		}						
	}
	
	/**
	 * action perform of cancel button method
	 * @param event
	 */
	private void cancelButton_actionPerformed(ActionEvent event) {
		setVisible(false);
    dispose();
	}
}