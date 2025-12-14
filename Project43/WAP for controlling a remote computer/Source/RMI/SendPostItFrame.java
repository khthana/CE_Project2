import common.GlobalVariables;
import java.awt.*;
import java.awt.event.*;
import java.rmi.Naming;
class SendPostItFrame extends Frame 
{
	static final String url = GlobalVariables.RMI_URL;
	TextField to,subject;
	TextArea msg;
	Button send_bttn,close_bttn;
	Label status;
	String username;
	public SendPostItFrame(String username)
	{
		super("Send Post It to Mobile");
		this.username = username;
		resize(400,400);
		setup();
	}
	void setup()
	{
		setLayout(new GridBagLayout());
		GridBagConstraints gbc = new GridBagConstraints();
		setFont(new Font("System",Font.PLAIN,16)); 
		setBackground(Color.green);
		to = new TextField(20);
		subject = new TextField(20);
		msg = new TextArea(5,20);
		status = new Label("                                     ");
		send_bttn = new Button("Send");
		close_bttn = new Button("Close");

		gbc.gridx = 0; gbc.gridy = 0;
		gbc.gridwidth = 1; gbc.gridheight = 1;
		add(new Label("To: "),gbc);

		gbc.gridx = 1; gbc.gridy = 0;
		gbc.gridwidth = 4; gbc.gridheight = 1;
		add(to,gbc);

		gbc.gridx = 0; gbc.gridy = 2;
		gbc.gridwidth = 1; gbc.gridheight = 1;
		add(new Label("Subject: "),gbc);

		gbc.gridx = 1; gbc.gridy = 2;
		gbc.gridwidth = 4; gbc.gridheight = 1;
		add(subject,gbc);

		gbc.gridx = 0; gbc.gridy = 4;
		gbc.gridwidth = 1; gbc.gridheight = 1;
		add(new Label("Message"),gbc);

		gbc.gridx = 1; gbc.gridy = 4;
		gbc.gridwidth = 4; gbc.gridheight = 3;
		add(msg,gbc);

		gbc.gridx = 1; gbc.gridy = 8;
		gbc.gridwidth = 1; gbc.gridheight = 1;
		add(send_bttn,gbc);

		gbc.gridx = 3; gbc.gridy = 8;
		gbc.gridwidth = 1; gbc.gridheight = 1;
		add(close_bttn,gbc);

		gbc.gridx = 1; gbc.gridy = 9;
		gbc.gridwidth = 4; gbc.gridheight = 1;
		add(status,gbc);

		send_bttn.addActionListener(new buttonHandler());
		close_bttn.addActionListener(new buttonHandler());
	}
	public boolean handleEvent(Event event)
	{
		if(event.id==Event.WINDOW_DESTROY)
		{
			hide();
			return true;
		}
		return false;
	}
	void send()
	{
		try{
			ServerInterface server = (ServerInterface)Naming.lookup(url);
			status.setText("Sending...");
			if (server.getPostIt(to.getText(), username, subject.getText(), msg.getText())){
				status.setText("Message has been sent.");
				hide();
			}else{
				status.setText(to.getText() + " does not exists.");
			}
		}catch(Exception e){e.printStackTrace();}
	}

//--------------------Inner class----------------------

	class buttonHandler implements ActionListener
	{
		public void actionPerformed(ActionEvent e)
		{
			if (e.getActionCommand().equals("Send"))
			{
				send();
			}else if (e.getActionCommand().equals("Close"))
			{
				hide();
			}
		}
	}
}
