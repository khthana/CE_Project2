/*
 * ChangePasswordUI.java
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

import retailShop.businessClass.Employee;

/**
 * @author Nopphol Noikaew
 */

public class ChangePasswordUI extends JFrame {
	/**
	 * class attributes
	 */
	private JPanel mainPanel = new JPanel();

	private JLabel newPasswordLabel = new JLabel("New password");
	private JLabel confirmNewPasswordLabel = new JLabel("Confirm new password");

	private JPasswordField passwordFldNew = new JPasswordField();
	private JPasswordField passwordFldConfirm = new JPasswordField();
	
	private JButton okButton = new JButton("OK");
	private JButton cancelButton = new JButton("Cancel");	
	
	private String newPassword,oldPassword;
	 
	/**
	 * class object
	 */
	private Employee employee;
	
	/**
	 * class constructor
	 * @param employee
	 */
	public ChangePasswordUI(Employee employee) {
		// Set name frame
		super("Change password");

		// Set layout main panel
		mainPanel.setLayout(null);

		// Attach panel to container
		getContentPane().add(mainPanel,BorderLayout.CENTER);					
				
		this.employee = employee;		
				
		// Create change password user interface
		createChangePasswordUI();
				
		// Set frame size
		setSize(260,195);
		
		// Set frame location
		setLocation(
			(Toolkit.getDefaultToolkit().getScreenSize().width - getWidth())/2,
			(Toolkit.getDefaultToolkit().getScreenSize().height - getHeight())/2);
	}
		
	/**
	 * create change password user interface method
	 */
	public void createChangePasswordUI() {
		//		Set up user name label		
		newPasswordLabel.setBounds(new Rectangle(15,15,200,20));
		mainPanel.add(newPasswordLabel,null);
		
		// Set up user name text field		
		passwordFldNew.setBounds(new Rectangle(15,40,220,20));
		mainPanel.add(passwordFldNew,null);
		
		// Set up password1 label		
		confirmNewPasswordLabel.setBounds(new Rectangle(15,65,200,20));
		mainPanel.add(confirmNewPasswordLabel,null);
		
		// Set up password1 text field		
		passwordFldConfirm.setBounds(new Rectangle(15,90,220,20));
		mainPanel.add(passwordFldConfirm,null);
		
		//	Set up ok button		
		okButton.setBounds(new Rectangle(15,125,100,30));	
		okButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				okButton_actionPerformed(event);
			}
		});
		mainPanel.add(okButton,null);
		
		// Set up cancel button		
		cancelButton.setBounds(new Rectangle(135,125,100,30));	
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
	private void okButton_actionPerformed(ActionEvent event) 
	{
		//	get new password frome password field new field		
		newPassword = new String(passwordFldNew.getPassword());
		
		//	get old password frome password field old field		
		oldPassword = new String(passwordFldConfirm.getPassword());
		
		//	ตรวจสอบว่า password ถูกกรอกรายละเอียดหรือไม่
		if((newPassword.equals("")) || (oldPassword.equals("")))
			JOptionPane.showMessageDialog(
				null,"Password blank","Warning",JOptionPane.WARNING_MESSAGE);
		//	ตรวจสอบว่า password 1 = password2 หรือไม่
		else if(!newPassword.equals(oldPassword))	{
			JOptionPane.showMessageDialog(
				null,"Password incorrect !","Warning",JOptionPane.WARNING_MESSAGE);
			passwordFldNew.setText("");
			passwordFldConfirm.setText("");
		}	else	{			
			employee.changePassword(newPassword);
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