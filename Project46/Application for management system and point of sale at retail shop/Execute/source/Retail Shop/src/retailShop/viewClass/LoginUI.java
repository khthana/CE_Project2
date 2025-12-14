/*
 * LoginUI.java
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
import javax.swing.SwingUtilities;
import javax.swing.UIManager;

import retailShop.businessClass.Employee;

/**
 * @author Nopphol Noikaew
 */

public class LoginUI extends JFrame
{
	/**
	 * class attributes
	 */			
	private JPanel mainPanel = new JPanel();
	
	private JLabel usernameLabel = new JLabel("Username");
	private JLabel passwordLabel = new JLabel("Password");
	
	private JTextField usernameTxtFld = new JTextField();
	
	private JPasswordField passwordFld = new JPasswordField(20);
	
	private JButton okButton = new JButton("OK");
	private JButton cancelButton = new JButton("Cancel");	
	
	/**
	 * class constructor
	 */
	public LoginUI() 
	{
		// Set name frame		
		super("Login");

		// Set layout main panel		
		mainPanel.setLayout(null);
		
		// attach panel to internal frame content pane
		getContentPane().add(mainPanel,BorderLayout.CENTER);		
		
		// Create personal info user interface
		createLoginUI();
				
		// Set frame size
		setSize(210,195);
		
		// Set frame location
		setLocation(
			(Toolkit.getDefaultToolkit().getScreenSize().width - getWidth())/2,
			(Toolkit.getDefaultToolkit().getScreenSize().height - getHeight())/2);
					
		// Set default close operation
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);	

		// set Window look and feel
		try {
			UIManager.setLookAndFeel(
				"com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
			SwingUtilities.updateComponentTreeUI(this);
		} catch (Exception ex) {
			System.err.println("Could not load LookAndFeel");
		}
	}
	
	/**
	 * create login user interface method
	 */
	private void createLoginUI()
	{
		/*/ Set up user name label */		
		usernameLabel.setBounds(new Rectangle(15,15,100,20));		
		mainPanel.add(usernameLabel, null);
		
		/* Set up user name text field */		
		usernameTxtFld.setBounds(new Rectangle(15,40,170,20));				
		mainPanel.add(usernameTxtFld,null);
		
		/* Set up password label */		
		passwordLabel.setBounds(new Rectangle(15,65,100,20));		
		mainPanel.add(passwordLabel, null);
		
		/* Set up password password field */		
		passwordFld.setBounds(new Rectangle(15,90,170,20));			
		mainPanel.add(passwordFld,null);
		
		/* Set up ok button */		
		okButton.setBounds(new Rectangle(15,125,80,25));		
		okButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				okButton_actionPerformed(event);
			}
		});		
		mainPanel.add(okButton,null);
		
		/* Set up cancel button */		
		cancelButton.setBounds(new Rectangle(105,125,80,25));	
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
		// get text from user name textfield
		String username = usernameTxtFld.getText();	
				
		// get password frome password field		
		String password = new String(passwordFld.getPassword());
		
		// instanciate object employee
		Employee employee = new Employee();
		
		if(employee.verifyPassword(username,password))
			try {
				// instanciate object mainUIFrame
				MainUI mainUIFrame = new MainUI(username,password);			
	
				// Display main window
				mainUIFrame.show();						
			}
			catch (Exception ex) {
				ex.printStackTrace();
				System.exit(0);		
			}
			finally {
				setVisible(false);
				dispose();
			}
		else {
			JOptionPane.showMessageDialog(
				null,"Username or password incorrect !","Warning",
				JOptionPane.WARNING_MESSAGE);
			passwordFld.setText("");						
		}				
	}
	
	/**
	 * action perform of cancel button method
	 * @param event
	 */
	private void cancelButton_actionPerformed(ActionEvent event) 
	{
		if(JOptionPane.showConfirmDialog(null,"Do you want to exit ?",
										"Warning",JOptionPane.YES_NO_OPTION)== 0)
			System.exit(0);		
	}
}
