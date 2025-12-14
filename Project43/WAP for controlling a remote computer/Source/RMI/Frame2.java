import common.GlobalVariables;
import java.util.*;
import java.awt.*;
import java.awt.event.*;
import java.rmi.Naming;

class Frame2 extends Frame
{
	java.awt.List authorizedList, unauthorizedList;
	Button auth_bttn, unauth_bttn, exit_bttn;
	Button post_bttn;
	Label auth_lbl, unauth_lbl;
	Client main_client;
	static final String URL = GlobalVariables.RMI_URL;
	String username = "";
	Vector authorizedVector = new Vector();

	public Frame2(Client main_client, String username)
	{
		super("Computer Control # " + username.toUpperCase());
		this.main_client = main_client;
		this.username = username;
		setup();
		resize(600,400);
	}
	void setup()
	{
		setLayout(new GridBagLayout());
		GridBagConstraints gbc = new GridBagConstraints();
		setFont(new Font("System",Font.PLAIN,16));
		setBackground(Color.white);
		authorizedList = new java.awt.List(6);
		unauthorizedList = new java.awt.List(6);
		unauth_lbl = new Label("Unauthorized Users");
		auth_lbl = new Label("Authorized Users");
		auth_bttn = new Button("Authorize->");
		unauth_bttn = new Button("<-Unauthorize");
		exit_bttn = new Button("Exit");
		post_bttn = new Button("Post to Mobile");

		auth_bttn.setForeground(Color.green);
	    unauth_bttn.setForeground(Color.red);
		auth_lbl.setFont(new java.awt.Font("System", 1, 16));
	    auth_lbl.setForeground(new Color(0, 210, 0));
		unauth_lbl.setFont(new java.awt.Font("System", 1, 16));
	    unauth_lbl.setForeground(Color.red);

		add(unauth_lbl, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0));
	    add(auth_lbl, new GridBagConstraints(3, 0, 1, 3, 0.0, 0.0
            ,GridBagConstraints.NORTH, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0));
		add(unauthorizedList, new GridBagConstraints(0, 3, 2, -2, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 40, 80));
	    add(auth_bttn, new GridBagConstraints(2, 3, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 14, 0, 10), 13, -1));
	    add(authorizedList, new GridBagConstraints(3, 3, -2, 2, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 40, 80));
		add(unauth_bttn, new GridBagConstraints(2, 4, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 13, 0));
	    add(post_bttn, new GridBagConstraints(0, 6, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(8, 0, 13, 0), 0, 0));
		add(exit_bttn, new GridBagConstraints(3, 6, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), -8, 0));


		auth_bttn.addActionListener(new buttonHandler());
		unauth_bttn.addActionListener(new buttonHandler());
		exit_bttn.addActionListener(new buttonHandler());
		post_bttn.addActionListener(new buttonHandler());
	}
	public boolean handleEvent(Event event)
	{
		if(event.id==Event.WINDOW_DESTROY)
		{
			logout();
			System.exit(0);
			return true;
		}
		return false;
	}
	void logout()
	{
		try {
			ServerInterface server = (ServerInterface) Naming.lookup(URL);
			server.logout(username);
		}catch(Exception e){};
	}
	void updateList(Vector authorizedList, Vector unauthorizedList)
	{
		this.authorizedList.clear();
		authorizedVector = authorizedList;
		Enumeration e = authorizedList.elements();
		while (e.hasMoreElements())
		{
			this.authorizedList.addItem((String)e.nextElement());
		}
		this.unauthorizedList.clear();
		e = unauthorizedList.elements();
		while (e.hasMoreElements())
		{
			this.unauthorizedList.addItem((String)e.nextElement());
		}
	}
	void authorize()
	{
		String[] arr_str = unauthorizedList.getSelectedItems();
		if (arr_str.length > 0)
		{
			try {
				ServerInterface server = (ServerInterface) Naming.lookup(URL);
				server.authorize(arr_str, username);
			}catch(Exception e){};
		}
	}
	void unauthorize()
	{
		String[] arr_str = authorizedList.getSelectedItems();
		if (arr_str.length > 0)
		{
			try {
				ServerInterface server = (ServerInterface) Naming.lookup(URL);
				server.unauthorize(arr_str, username);
			}catch(Exception e){};		
		}
	}
	boolean isAuthorize(String name)
	{
		if (authorizedVector.contains(name))
		{
			return true;
		}
		return false;
	}

//--------------------Inner class----------------------

	class buttonHandler implements ActionListener
	{
		public void actionPerformed(ActionEvent e)
		{
			if (e.getActionCommand().equals("Authorize->"))
			{
				authorize();
			}else if (e.getActionCommand().equals("<-Unauthorize"))
			{
				unauthorize();
			}else if (e.getActionCommand().equals("Exit"))
			{
				logout();
				System.exit(0);
			}else if (e.getActionCommand().equals("Post to Mobile"))
			{
				SendPostItFrame sendFrame = new SendPostItFrame(username);
				sendFrame.show();
			}
		}
	}
}
