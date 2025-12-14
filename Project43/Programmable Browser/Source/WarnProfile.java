import java.awt.*;
import java.awt.event.*;


public class WarnProfile extends Frame implements WindowListener
  
{
	Label message = new Label();

	WarnProfile(String warn)
	{
		setLayout(null);
		setTitle("Warning..");
		message.setText(warn);
		message.setBounds(30,50,390,15);
		add(message);
		addWindowListener(this);		
	}

	public void windowClosed (WindowEvent e)		{}
	public void windowClosing (WindowEvent e)		{ dispose(); }
	public void windowOpened (WindowEvent e)		{}
	public void windowIconified (WindowEvent e)		{}
	public void windowDeiconified (WindowEvent e)	{}
	public void windowActivated (WindowEvent e)		{}
	public void windowDeactivated (WindowEvent e)	{}

}
