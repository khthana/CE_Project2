import java.awt.*;
import java.awt.event.*;
import java.util.*;


public class CloseDialog extends Dialog implements WindowListener 
{
	TextField time = new TextField();
	Label close = new Label();
	Label hour = new Label();
	Button cancel = new Button("Cancel");
	Button ok = new Button("OK");
	int auto=0;
	protected TimerAgent agent;
	TimerAgent getAgent(){return agent;}
	
	CloseDialog(Frame parent,String title,boolean modal)
	{
		this(parent,modal);
		this.setTitle(title);
	}
	
	CloseDialog(Frame parent,boolean modal)
	{
		super(parent,modal);
		setLayout(null);
	
		time.setBounds(63, 22+20, 96, 21);
		close.setText("CLOSE :");
		close.setBounds(14, 25+20, 41, 17);
		hour.setText("hh:mm");
		hour.setBounds(166, 25+20, 41, 17);
		
		cancel.setBounds(226, 46+20, 74, 23);
		ok.setBounds(226, 14+20, 74, 23);
		
		add(time);
		add(close);
		add(hour);
		add(cancel);
		add(ok);

		ActionCloseDialog a = new ActionCloseDialog();
		ok.addActionListener(a);
		cancel.addActionListener(a);

		addWindowListener(this);
	}


	void cancel_click(ActionEvent e)
	{
		dispose();
	}

	void ok_click(ActionEvent e)
	{
		agent = new TimerAgent();
		String close = time.getText();
		
		//get time to open Browser
		StringTokenizer tokClose = new StringTokenizer(close,":");
		int hourClose = new Integer(tokClose.nextToken()).intValue();
		int minClose = new Integer(tokClose.nextToken()).intValue();
		Calendar closeTime = Calendar.getInstance();
		if (hourClose>=12)
			{
				agent.setMid(1);
				System.out.println("At PM!!");
				hourClose = hourClose - 12;
			}
			else 	agent.setMid(0);
		closeTime.set(Calendar.HOUR,hourClose);
		closeTime.set(Calendar.MINUTE,minClose);
		
		try
		{
			agent.setTime(closeTime.getTime());
			dispose();
		}
		catch (NullPointerException ne)
		{
			System.out.println("Catch Exception in ok_click!!");
		}
		
	}
	
	
	class ActionCloseDialog implements ActionListener
	{
		public void actionPerformed(ActionEvent e)
		{
			String arg = e.getActionCommand();
			if (arg == "OK")
			{
				ok_click(e);
			}
			else if (arg == "Cancel")
				{
					cancel_click(e);
				}
		}
	}

	public void windowClosed (WindowEvent e) {}
	public void windowClosing (WindowEvent e) 
	{
		dispose();
	}
	public void windowOpened (WindowEvent e) {}
	public void windowIconified (WindowEvent e) {}
	public void windowDeiconified (WindowEvent e) {}
	public void windowActivated (WindowEvent e) {}
	public void windowDeactivated (WindowEvent e) {}
}
