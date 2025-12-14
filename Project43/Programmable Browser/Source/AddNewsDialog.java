import java.awt.*;
import java.awt.event.*;
import java.util.*;


class AddNewsDialog extends Dialog implements WindowListener 
{
	Label s_label,g_label;
	TextField s_tf,g_tf;
	Button ok,cancel;
	String server,group;
	AddNewsDialog (Frame parent, String title, boolean modal) {
		super ( parent, title, modal);
		setSize (400,150);
		setLayout (null);
		
		s_label = new Label ("Enter News Server :");
		g_label = new Label ("Enter News Group  :");
		s_tf = new TextField ();
		g_tf = new TextField ();
		ok = new Button ("OK");
		cancel = new Button ("Cancel");
		s_label.setBounds		( 15, 50,100, 20);
		g_label.setBounds		( 15,100,100, 20);
		s_tf.setBounds	(120, 50,200, 20);
		s_tf.setText("news.con2.com");
		g_tf.setBounds  (120,100,200, 20);
		g_tf.setText("comp.ai.fuzzy");
		ok.setBounds	(330, 50, 50, 20);
		cancel.setBounds(330, 100, 50, 20);

		add (s_label);	add	(g_label);
		add (s_tf);		add (g_tf);
		add (ok);		add (cancel);
		ActionNewsDialog action = new ActionNewsDialog ();
		s_tf.addActionListener  (action);
		g_tf.addActionListener  (action);
		ok.addActionListener    (action);
		cancel.addActionListener(action);
		addWindowListener(this);
	}//end 
	
	class ActionNewsDialog implements ActionListener
	{
		public void actionPerformed ( ActionEvent e ) {
			String arg = e.getActionCommand ();
			
			if ( arg == "Cancel" )
			{ cancel_click (e); }
			else { ok_click (e); }
		}//end actionPerformed
	}//end ActionNewsDialog

	void ok_click ( ActionEvent ae ) {
		server = s_tf.getText ();
		group  = g_tf.getText ();
		dispose ();
	}//end ok_click
	void cancel_click ( ActionEvent ae ) {
		dispose ();
	}//end cancel_click
	public void windowClosed	  (WindowEvent e) {}
	public void windowOpened	  (WindowEvent e) {}
	public void windowIconified	  (WindowEvent e) {}
	public void windowDeiconified (WindowEvent e) {}
	public void windowActivated   (WindowEvent e) {}
	public void windowDeactivated (WindowEvent e) {}
	public void windowClosing	  (WindowEvent e) 
	{
		dispose();
	}
}//end AddNewsDialog
