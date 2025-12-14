import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class Advertise extends JFrame implements ActionListener {		
	protected JButton pic1, pic2;
	protected JLabel label;
	protected Passpos pp;
	
	public Advertise (Passpos pp) {
		super ("++Select Advertisement++");
		this.pp = pp;
		
		Container c = getContentPane ();
		c.setLayout (null);
		
		Icon picture1 = new ImageIcon ("pic5.jpg");
		Icon picture2 = new ImageIcon ("pic6.jpg");
		
		label = new JLabel ("Please Select Your Advertisement!");
		label.setFont (new Font("TimesRoman", Font.PLAIN, 18));
		c.add (label);
		
		pic1 = new JButton ("1", picture1);
		c.add (pic1);
		pic2 = new JButton ("2", picture2);
		c.add (pic2);
		
		pic1.addActionListener (this);
		pic2.addActionListener (this);
		
		label.setBounds (145,10,260,50);
		pic1.setBounds (30,70,220,150);
		pic2.setBounds (270,70,220,150);
		
		setSize (535,280);
		show ();
	}
	
	protected int ad;
	
	public void actionPerformed (ActionEvent e) {
		if (e.getActionCommand() == "1") {
			ad = 1;
		}
		else if (e.getActionCommand() == "2")
		{
			ad = 2;	
		}
		pp.send_adver (ad);
		dispose ();
	}
	
}