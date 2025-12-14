import java.io.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class ColorSkin extends JFrame implements ActionListener {
	private native void sendskin(int arr[]);
	
	protected JButton col1, col2, col3, col4;
	protected JLabel label;
	
	protected int skin;
	protected InputStream in;
	protected OutputStream out;
	
	public ColorSkin (InputStream in, OutputStream out, int skin) {
		super ("++Select Color++");
		this.in = in;
		this.out = out;
		this.skin = skin;
		
		Container c = getContentPane ();
		c.setLayout (null);

		label = new JLabel ("Please Select Your Skin Color!");
		label.setFont (new Font("TimesRoman", Font.PLAIN, 18));
		c.add (label);
		
		col1 = new JButton ("Original");
		c.add (col1);
		col2 = new JButton ("Blue");
		c.add (col2);
		col3 = new JButton ("Green");
		c.add (col3);
		col4 = new JButton ("Red");
		c.add (col4);
		
		col1.addActionListener (this);
		col2.addActionListener (this);
		col3.addActionListener (this);
		col4.addActionListener (this);
		
		label.setBounds (95,10,230,50);
		col1.setBounds (30,70,80,25);
		col2.setBounds (120,70,80,25);
		col3.setBounds (210,70,80,25);
		col4.setBounds (300,70,80,25);
		
		setSize (420,150);
		show ();
	}
	
	protected String name;
	
	public void setName (String name) 
	{
		this.name = name;
	}
	
	protected int col;
	
	public void actionPerformed (ActionEvent e) 
	{
		try {
			if (e.getActionCommand() == "Original") {
				col = 1;
			}
			else if (e.getActionCommand() == "Blue")
			{
				col = 2;	
			}
			else if (e.getActionCommand() == "Green")
			{
				col = 3;	
			}
			else if (e.getActionCommand() == "Red")
			{
				col = 4;
			}
			startChat ();
		}
		catch (IOException ex) {
			ex.printStackTrace ();
		}
	}
	
	public void startChat () throws IOException {
		try {
			int arr[] = new int [2];
			arr[0] = skin;
			arr[1] = col;
			sendskin(arr);
			GenericChat chat = new GenericChat (in, out, name);				
			dispose ();
			chat.start ();	
		} catch (IOException ex) {
			try {
				out.close ();
			} catch (IOException ignored) {
			}
			throw ex;
		}
	}
	
	static {
    	System.loadLibrary("MyImpOfCallMain");
  	}
}