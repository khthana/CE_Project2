import java.awt.*;
import java.awt.event.*;

public class UserProfile extends Dialog implements WindowListener 
{
	Label userNameLabel = new Label();
	Label userInterestLabel = new Label();
	Label userFriendLabel = new Label();

	TextField userNameTxt = new TextField();
	TextField userInterestTxt = new TextField();
	TextField userFriendTxt = new TextField();

	Button okButton = new Button("OK");
	Button cancelButton = new Button("Cancel");

	String userName,userInterest,userFriend;

	UserProfile(Frame parent,String title,boolean modal)
	{
		this(parent,modal);
		setTitle(title);
	}

	UserProfile(Frame parent,boolean modal)
	{
		super(parent,modal);
		setLayout(null);
		userNameLabel.setText("Name : ");
		userNameLabel.setBounds(16, 38, 49, 17);

		userInterestLabel.setText("Interest : ");
		userInterestLabel.setBounds(16, 71, 58, 23);

		userFriendLabel.setText("Friend Name : ");
		userFriendLabel.setBounds(16, 107, 85, 15);

		userNameTxt.setBounds(105, 35, 134, 20);
		userInterestTxt.setBounds(105, 70, 134, 20);
		userFriendTxt.setBounds(105, 102, 134, 20);
	
		okButton.setBounds(new Rectangle(42, 141, 66, 21));	
		cancelButton.setBounds(154, 141, 80, 21);

		add(userNameLabel);
		add(userInterestLabel);
		add(userFriendLabel);
		add(userNameTxt);
		add(userInterestTxt);
		add(userFriendTxt);
		add(okButton);
		add(cancelButton);
		
		UserAction a = new UserAction();

		okButton.addActionListener(a);
		cancelButton.addActionListener(a);
	
		addWindowListener(this);

	}

	class UserAction implements ActionListener
	{
		public void actionPerformed(ActionEvent e)
		{
			String arg = e.getActionCommand();
			if (arg == "OK") { ok_click(e);	}
			else if (arg == "Cancel") { cancel_click(e); }
		}
	};

	void ok_click(ActionEvent e)
	{
		userName = userNameTxt.getText();
		userInterest = userInterestTxt.getText();
		userFriend = userFriendTxt.getText();
		dispose();
	}

	void cancel_click(ActionEvent e)				{ dispose(); }

	public void windowClosed (WindowEvent e)		{}
	public void windowClosing (WindowEvent e)		{ dispose(); }
	public void windowOpened (WindowEvent e)		{}
	public void windowIconified (WindowEvent e)		{}
	public void windowDeiconified (WindowEvent e)	{}
	public void windowActivated (WindowEvent e)		{}
	public void windowDeactivated (WindowEvent e)	{}
}
