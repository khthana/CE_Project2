import java.io.*;
import java.net.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class Signnew extends JFrame implements ActionListener{
	protected String host, username;
	protected int port;
	
	protected JLabel l1,l2,l3,l4,l5,l6;
	protected JTextField first,last,email,user,pass;
	protected JTextArea address;
	protected JButton submit, cancel;
	
	public Signnew (String host, int port) {
		super ("++User Sign new++");
		this.host = host;
		this.port = port;
		
		Container c = getContentPane ();	 
    	c.setLayout (null);
    	
    	l1 = new JLabel ("First Name **");
    	l2 = new JLabel ("Last Name");
    	l3 = new JLabel ("Address");
    	l4 = new JLabel ("E-mail Address");
    	l5 = new JLabel ("User Name **");
    	l6 = new JLabel ("Password **");
    	
    	first = new JTextField (20);
    	first.setText ("");
    	last = new JTextField (20);
    	last.setText ("");
    	address = new JTextArea (5,20);
    	address.setText ("");
    	email = new JTextField (20);
    	email.setText ("");
    	user = new JTextField (20);
    	user.setText ("");
    	pass = new JTextField (8);
    	pass.setText ("");
    	submit = new JButton ("OK");
    	cancel = new JButton ("Cancel");
    	
    	submit.addActionListener (this);
    	cancel.addActionListener (this);
    	
    	c.add (l1);
    	c.add (first);	
    	c.add (l2);
    	c.add (last);
    	c.add (l3);
    	c.add (address);
    	c.add (l4);
    	c.add (email);
    	c.add (l5);
    	c.add (user);
    	c.add (l6);
    	c.add (pass);
		c.add (submit);
    	c.add (cancel);
    
		l1.setBounds (30,10,90,18);
		l2.setBounds (30,45,90,18);
		l3.setBounds (30,80,90,18);
		l4.setBounds (30,180,90,18);
		l5.setBounds (30,215,90,18);
		l6.setBounds (30,250,90,18);
		
		first.setBounds (130,10,150,25);
		last.setBounds (130,45,150,25);
		address.setBounds (130,80,150,90);
		email.setBounds (130,180,150,25);
		user.setBounds (130,215,150,25);
		pass.setBounds (130,250,150,25);
		
		submit.setBounds (60,290,80,20);
		cancel.setBounds (150,290,80,20);
		
		setSize (330,350);
		show ();
	}
	
	public void actionPerformed (ActionEvent e) 
	{
		try {
			if ((e.getActionCommand() == "OK") && !(first.getText().equals(""))
				&& !(user.getText().equals("")) && !(pass.getText().equals(""))
				&& (pass.getText().length() <= 8))		
			{
				username = user.getText ();
				connect (host,port);
				logon (username);
			}
			else if (e.getActionCommand() == "Cancel") {
				GetLogin login = new GetLogin (host, port);
				dispose ();
			}
			else {
				first.setText ("");
    			last.setText ("");
    			address.setText ("");
    			email.setText ("");
    			user.setText ("");
    			pass.setText ("");
    		}
		}
		catch (IOException ex) {
			ex.printStackTrace ();
		}
	}
	
	protected InputStream in;
	protected OutputStream out;
	
	protected void connect (String host, int port) throws IOException {
		Socket socket = new Socket (host, port);
		in = socket.getInputStream ();
		out = socket.getOutputStream ();
	}
	
	protected void logon (String username) throws IOException {
		try {
			DataOutputStream dataOut = new DataOutputStream (out);
			dataOut.writeInt (1);
			dataOut.writeUTF (username);
			DataInputStream dataIn = new DataInputStream (in);
			boolean registered = dataIn.readBoolean ();
			if (!registered) {
				System.out.println ("Name in use");
				first.setText ("");
    			last.setText ("");
    			address.setText ("");
    			email.setText ("");
    			user.setText ("");
    			pass.setText ("");
    		} else {					
				System.out.println ("Sing new Complete!");
				dataOut.writeUTF (pass.getText());
				dataOut.writeUTF (first.getText());
				dataOut.writeUTF (last.getText());
				dataOut.writeUTF (address.getText());	
				dataOut.writeUTF (email.getText());
				GetLogin login = new GetLogin (host, port);
				dispose ();	
				out.close ();
			}
		} catch (IOException ex) {
			try {
				out.close ();
			} catch (IOException ignored) {
			}
			throw ex;
		}
	}
	
}