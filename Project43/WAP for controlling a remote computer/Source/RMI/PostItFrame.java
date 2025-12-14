import java.awt.*;
class PostItFrame extends Frame 
{
	TextField from,subject,date_time;
	TextArea msg;
	public PostItFrame(String post_msg)	// post message appears in xml format
	{
		super("Post Message");
		resize(400,400);
		setup();
		setMessage(post_msg);
	}
	public PostItFrame(String from, String subject, String date, String message)	// post message appears in xml format
	{
		super("Post Message");
		resize(400,400);
		setup();
		pack();
		this.from.setText(from);
		this.subject.setText(subject);
		date_time.setText(date);
		msg.setText(message);
	}
	void setup()
	{
		setLayout(new GridBagLayout());
		GridBagConstraints gbc = new GridBagConstraints();
		setFont(new Font("System",Font.PLAIN,16)); 
		setBackground(Color.red);
		from = new TextField(20);
		subject = new TextField(20);
		date_time = new TextField(20);
		msg = new TextArea(5,20);
		from.setEditable(false);
		subject.setEditable(false);
		date_time.setEditable(false);
		msg.setEditable(false);

		gbc.gridx = 0; gbc.gridy = 0;
		gbc.gridwidth = 1; gbc.gridheight = 1;
		add(new Label("From: "),gbc);

		gbc.gridx = 1; gbc.gridy = 0;
		gbc.gridwidth = 4; gbc.gridheight = 1;
		add(from,gbc);

		gbc.gridx = 0; gbc.gridy = 2;
		gbc.gridwidth = 1; gbc.gridheight = 1;
		add(new Label("Subject: "),gbc);

		gbc.gridx = 1; gbc.gridy = 2;
		gbc.gridwidth = 4; gbc.gridheight = 1;
		add(subject,gbc);

		gbc.gridx = 0; gbc.gridy = 3;
		gbc.gridwidth = 1; gbc.gridheight = 1;
		add(new Label("Date & Time: "),gbc);

		gbc.gridx = 1; gbc.gridy = 3;
		gbc.gridwidth = 4; gbc.gridheight = 1;
		add(date_time,gbc);

		gbc.gridx = 0; gbc.gridy = 4;
		gbc.gridwidth = 1; gbc.gridheight = 1;
		add(new Label("Message"),gbc);

		gbc.gridx = 1; gbc.gridy = 4;
		gbc.gridwidth = 4; gbc.gridheight = 1;
		add(msg,gbc);

	}
	void setMessage(String post_msg)
	{
		MessageParser parser = new MessageParser(post_msg);
		from.setText(parser.get("from"));
		subject.setText(parser.get("subject"));
		date_time.setText(parser.get("date"));
		msg.setText(parser.get("message"));
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
}
