import common.GlobalVariables;
import java.awt.*;
import java.awt.event.*;
import java.rmi.Naming;
class Frame1 extends Frame 
{
	TextField regis_name, regis_pswd, login_name, login_pswd;
	Button regis_bttn, login_bttn;
	Label regis_lbl, login_lbl;
	Client main_client;
	static final String URL = GlobalVariables.RMI_URL;
	public Frame1(Client main_client)
	{
		super("Register & Login");
		this.main_client = main_client;
		setup();
		resize(400,400);
	}
	void setup()
	{
		setLayout(new GridBagLayout());
		GridBagConstraints gbc = new GridBagConstraints();
		setFont(new Font("System",Font.PLAIN,16)); 
		setBackground(Color.white);
		regis_name = new TextField(15);
		regis_pswd = new TextField(15);
		login_name = new TextField(15);
		login_pswd = new TextField(15);
		regis_bttn = new Button("Register");
		login_bttn = new Button("Login");
		regis_lbl = new Label("Register");
		login_lbl = new Label("Login");
		regis_pswd.setEchoCharacter('*');
		login_pswd.setEchoCharacter('*');
	    regis_lbl.setFont(new java.awt.Font("System", 1, 16));
		regis_lbl.setForeground(Color.blue);
	    login_lbl.setFont(new java.awt.Font("System", 1, 16));
		login_lbl.setForeground(Color.blue);

	    add(regis_lbl, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0));
	    add(new Label("Login name"), new GridBagConstraints(0, 1, 2, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0));
		add(regis_name, new GridBagConstraints(2, 1, 1, 2, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0));
	    add(new Label("Password"), new GridBagConstraints(0, 2, 1, 2, 0.0, 0.0
            ,GridBagConstraints.SOUTH, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0));
		add(regis_pswd, new GridBagConstraints(2, 3, 2, 2, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0));
	    add(new Label("Login name"), new GridBagConstraints(0, 7, 2, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0));
	    add(regis_bttn, new GridBagConstraints(2, 5, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0));
		add(new Label("Password"), new GridBagConstraints(0, 8, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0));
	    add(login_lbl, new GridBagConstraints(0, 6, 1, 1, 0.0, 0.0
            ,GridBagConstraints.SOUTHWEST, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0));
		add(login_name, new GridBagConstraints(2, 7, 1, 1, 0.0, 0.0
            ,GridBagConstraints.NORTH, GridBagConstraints.NONE, new Insets(-1, 0, 0, 0), 0, 0));
	    add(login_pswd, new GridBagConstraints(2, 8, 1, 2, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0));
		add(login_bttn, new GridBagConstraints(2, 10, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0));


		regis_bttn.addActionListener(new buttonHandler());
		login_bttn.addActionListener(new buttonHandler());
	}
	public boolean handleEvent(Event event)
	{
		if(event.id==Event.WINDOW_DESTROY)
		{
			System.exit(0);
			return true;
		}
		return false;
	}
	void register()
	{
		try {
			ServerInterface server = (ServerInterface) Naming.lookup(URL);
			server.register(regis_name.getText(), regis_pswd.getText(), main_client);
			regis_name.setText("");
			regis_pswd.setText("");
		}catch(Exception e){};
	}
	void login()
	{
		try {
			ServerInterface server = (ServerInterface) Naming.lookup(URL);
			server.login(login_name.getText(), login_pswd.getText(), main_client);
		}catch(Exception e){};
	}

//--------------------Inner class----------------------

	class buttonHandler implements ActionListener
	{
		public void actionPerformed(ActionEvent e)
		{
			if (e.getActionCommand().equals("Register"))
			{
				register();
			}else if (e.getActionCommand().equals("Login"))
			{
				login();
			}
		}
	}
}
