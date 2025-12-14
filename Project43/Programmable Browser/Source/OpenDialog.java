import java.awt.*;
import java.awt.event.*;
import java.util.*;


public class OpenDialog extends Dialog implements WindowListener 
{
	TextField time = new TextField();
	Label open = new Label();
	Label hour = new Label();
	Button cancel = new Button("Cancel");
	Button ok = new Button("OK");
	int auto=0;

	protected TimerAgent agent;
	TimerAgent getAgent(){return agent;}

	
	OpenDialog(Frame parent,String title,boolean modal)
	{
		this(parent,modal);
		this.setTitle(title);
	}
	
	OpenDialog(Frame parent,boolean modal)
	{
		super(parent,modal);
		setLayout(null);
	
		time.setBounds(63, 22+20, 96, 21);
		open.setText("OPEN :");
		open.setBounds(14, 25+20, 41, 17);
		hour.setText("hh:mm");
		hour.setBounds(166, 25+20, 41, 17);
		
		cancel.setBounds(226, 46+20, 74, 23);
		ok.setBounds(226, 14+20, 74, 23);
		
		add(time);
		add(open);
		add(hour);
		add(cancel);
		add(ok);

		ActionOpenDialog a = new ActionOpenDialog();
		ok.addActionListener(a);
		cancel.addActionListener(a);

		addWindowListener(this);
	}
	
	
	class ActionOpenDialog implements ActionListener
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
		}//end actionPerformed
	}


	void cancel_click(ActionEvent e)
	{
		dispose();
	}

	void ok_click(ActionEvent e)
	{
		agent = new TimerAgent();
		String open = time.getText();
		
		//get time to open Browser
		StringTokenizer tokOpen = new StringTokenizer(open,":");
		int hourOpen = new Integer(tokOpen.nextToken()).intValue();
		int minOpen = new Integer(tokOpen.nextToken()).intValue();
		Calendar openTime = Calendar.getInstance();
		if (hourOpen>=12)
			{			
				agent.setMid(1);
				System.out.println("At PM!!");
				hourOpen = hourOpen - 12;
			}
			else 	agent.setMid(0);
		openTime.set(Calendar.HOUR,hourOpen);
		openTime.set(Calendar.MINUTE,minOpen);
		
		try
		{
			agent.setTime(openTime.getTime());
			dispose();
		}
		catch (NullPointerException ne)
		{
			System.out.println("Catch Exception in ok_click!!");
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
