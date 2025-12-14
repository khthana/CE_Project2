import java.io.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class Skin extends JFrame implements ActionListener {
	protected InputStream in;
	protected OutputStream out;
	
	protected JButton pic1, pic2, pic3, pic4;
	protected JLabel label;
	
	public Skin (InputStream in, OutputStream out) {
		super ("++Select Skin++");
		this.in = in;
		this.out = out;
		
		Container c = getContentPane ();
		c.setLayout (null);
		
		Icon picture1 = new ImageIcon ("pic1.jpg");
		Icon picture2 = new ImageIcon ("pic2.jpg");
		Icon picture3 = new ImageIcon ("pic3.jpg");
		Icon picture4 = new ImageIcon ("pic4.jpg");
		
		label = new JLabel ("Please Select Your Skin!");
		label.setFont (new Font("TimesRoman", Font.PLAIN, 18));
		c.add (label);
		
		pic1 = new JButton ("1", picture1);
		c.add (pic1);
		pic2 = new JButton ("2", picture2);
		c.add (pic2);
		pic3 = new JButton ("3", picture3);
		c.add (pic3);
		pic4 = new JButton ("4", picture4);
		c.add (pic4);
		
		pic1.addActionListener (this);
		pic2.addActionListener (this);
		pic3.addActionListener (this);
		pic4.addActionListener (this);
		
		label.setBounds (110,10,200,50);
		pic1.setBounds (30,70,150,150);
		pic2.setBounds (200,70,150,150);
		pic3.setBounds (30,240,150,150);
		pic4.setBounds (200,240,150,150);
		
		setSize (390,450);
		show ();
	}
	
	protected String name;
	
	public void setName (String name) 
	{
		this.name = name;
	}
	
	protected int skin;
	
	public void actionPerformed (ActionEvent e) {
		if (e.getActionCommand() == "1") {
			skin = 1;
		}
		else if (e.getActionCommand() == "2")
		{
			skin = 2;	
		}
		else if (e.getActionCommand() == "3")
		{
			skin = 3;	
		}
		else if (e.getActionCommand() == "4")
		{
			skin = 4;
		}
		ColorSkin colo = new ColorSkin (in, out, skin);
		colo.addWindowListener (new WindowAdapter () {
				public void windowClosing (WindowEvent e)
					{ System.exit (0); }
				});
		colo.setName (name);
		dispose ();
	}
	
}