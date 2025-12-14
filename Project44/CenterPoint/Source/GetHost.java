import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
	
public class GetHost extends JFrame implements ActionListener {	
	protected JTextField name;
	protected JButton submit;
	protected JLabel label;
	
	public GetHost (){
		super ("++3D Chat++");
		
		Container c = getContentPane ();
		c.setLayout (null);
		
		label = new JLabel ("Host");
		c.add (label);
		name = new JTextField (20);
		name.setText ("");
		c.add (name);
		
		submit = new JButton ("OK");
		c.add (submit);
		submit.addActionListener (this);
		
		label.setBounds (20,180,70,18);
		name.setBounds (100,180,100,25);
		submit.setBounds (20,250,75,25);
		setSize (230,320);
		show();	
	}

	public void actionPerformed (ActionEvent e)
	{
		String host = name.getText ();
		int port = 6667;
		GetLogin login = new GetLogin (host, port);
		
		login.addWindowListener (new WindowAdapter () {
			public void windowClosing (WindowEvent e)
				{ System.exit (0); }
			});
	}
			
	public static void main (String[] args) {
		GetHost log = new GetHost ();
		
		log.addWindowListener (new WindowAdapter () {
			public void windowClosing (WindowEvent e)
				{ System.exit (0); }
			});
	}
	
}