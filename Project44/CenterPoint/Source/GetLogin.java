import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.io.*;
import java.net.*;

	
public class GetLogin extends JFrame implements ActionListener {
	private native void sendmyname(String prompt);
	
	protected String host,my_name;
	protected int port;
	
	protected JTextField name;
	protected JPasswordField pass;
	protected JButton submit, signnew;
	protected JLabel label,l1,l2;
	
	public GetLogin (String host, int port){
		super ("++3D Chat++");
		this.host = host;
		this.port = port;
		
		Container c = getContentPane ();
		c.setLayout (null);
		
		Icon picture = new ImageIcon ("mashi.GIF");
		label = new JLabel();
		label.setIcon (picture);
		c.add (label);
		
		l1 = new JLabel ("User Name");
		c.add (l1);
		name = new JTextField (20);
		name.setText ("");
		c.add (name);
		
		l2 = new JLabel ("Password");
		c.add (l2);
		pass = new JPasswordField (8);
		c.add (pass);
		
		submit = new JButton ("Login");
		c.add (submit);
		submit.addActionListener (this);
						
		signnew = new JButton ("Sign New");
		c.add (signnew);
		signnew.addActionListener (this);
		
		label.setBounds (45,10,180,140);
		l1.setBounds (20,180,70,18);
		l2.setBounds (20,215,70,18);
		name.setBounds (100,180,100,25);
		pass.setBounds (100,215,80,25);
		submit.setBounds (20,250,75,25);
		signnew.setBounds (110,250,90,25);
		
		setSize (230,320);
		show();	
	}

	public void actionPerformed (ActionEvent e)
		{
			try {
				if ((e.getActionCommand() == "Login") && !(name.getText().equals(""))
					&& !(pass.getText().equals(""))) {
					my_name = name.getText ();
					connect (host, port);
					logon (name.getText ());
				}
				else if (e.getActionCommand() == "Sign New")
				{
					Signnew sign = new Signnew (host, port);
					sign.addWindowListener (new WindowAdapter () {
					public void windowClosing (WindowEvent e)
						{ System.exit (0); }
					});
					dispose ();
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
	
	protected void logon (String user) throws IOException {
		try {
			DataOutputStream dataOut = new DataOutputStream (out);
			dataOut.writeInt (0);
			dataOut.writeUTF (user);
			dataOut.writeUTF (pass.getText());
			DataInputStream dataIn = new DataInputStream (in);
			boolean registered = dataIn.readBoolean ();
			if (!registered) {
				name.setText ("");
				pass.setText ("");
			} else {
				System.out.println ("Login Complete!");	
				System.out.println (my_name);
				sendmyname (my_name);
				Skin skin = new Skin (in, out);
				skin.addWindowListener (new WindowAdapter () {
					public void windowClosing (WindowEvent e)
						{ System.exit (0); }
					});
				skin.setName (my_name);
				dispose ();	
			}
		} catch (IOException ex) {
			try {
				out.close ();
			} catch (IOException ignored) {
			}
			throw ex;
		}
	}
		
	public static void main (String[] args) throws IOException {
		String host = "161.246.6.144";
		int port = 6667;
		
		GetLogin login = new GetLogin (host, port);
		
		login.addWindowListener (new WindowAdapter () {
			public void windowClosing (WindowEvent e)
				{ System.exit (0); }
			});
	}
	
	static {
    	System.loadLibrary("MyImpOfCallMain");
  	}
}