import java.awt.*;
import java.awt.event.*;
import java.awt.image.*;
import java.applet.*;

class AboutFrame extends Frame implements WindowListener
{
	AboutFrame () {
		setSize (500,150);
		setFont( new Font("Serif",Font.PLAIN,30) );
		setTitle ("About Programmable Browser");
		setLayout (null);
		setResizable (false);
		setBackground (Color.lightGray);
		addWindowListener(this);
		show();
		Label label1 = new Label ();
		label1.setText ("Programmable Browser 3.0");
		label1.setBounds (100,50,300,50);
		label1.setAlignment (Label.CENTER);
		this.add (label1);
	}
	public void windowOpened		( WindowEvent we ) {}
	public void windowClosed		( WindowEvent we ) {}
	public void windowIconified		( WindowEvent we ) {}
	public void windowDeiconified	( WindowEvent we ) {}
	public void	windowActivated		( WindowEvent we ) {}
	public void	windowDeactivated	( WindowEvent we ) {}
	public void windowClosing		( WindowEvent we ) {	
		dispose();
	}

	public static void main			(String[] args) 
	{
		AboutFrame about = new AboutFrame ();
	}//end main

}//end class AboutFrame
