import java.io.*;
import java.awt.*;
import java.awt.event.*;

public class Admin extends Panel implements ActionListener {
	protected Button button;
	protected List output;
	protected Passpos pp;
	
	public Admin (Passpos pp) {
		this.pp = pp;
		
		setLayout (new BorderLayout ());
		add ("North", new Label ("Change Advertisement Clik Here..."));
		add ("Center", button = new Button ("Change"));
		add ("South", output = new List (0,false));
		button.addActionListener (this);
	}
	
	public void actionPerformed (ActionEvent event) {
		Advertise adver = new Advertise (pp);
		adver.addWindowListener (new WindowAdapter () {
				public void windowClosing (WindowEvent e)
					{ System.exit (0); }
				});
	}
} 