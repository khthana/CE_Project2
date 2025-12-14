import java.awt.*;
import java.awt.event.*;
import java.util.*;
import java.io.*;
import java.awt.Window.*;

//Main Menu of Program
public class AgentMenu extends Frame implements WindowListener

{
	private MenuBar mbar;
	SwingBrowser a;
	int auto = 0;
	TextArea editor;
	String path;

//Constructure for creat Menu-form and add actions

	AgentMenu(String s)
	{
		super(s);
		mbar = new MenuBar();
		Menu fileMenu = new Menu("File",true);
		Menu functionMenu = new Menu("Function",true);
		Menu runMenu = new Menu("Run",true);
		Menu helpMenu = new Menu("Help",true);
		editor = new TextArea();

		editor.setEditable(true);
		add(editor);

		fileMenu.add("New");
		fileMenu.add("Open Browser");
		fileMenu.add("Load Script");
		fileMenu.add("Save");
		fileMenu.add("Save As");
		fileMenu.addSeparator();
		fileMenu.add("Exit");

		functionMenu.add("Open..");
		functionMenu.add("Close..");
		functionMenu.add("News..");

		runMenu.add("Run Script");

		helpMenu.add("About");

		mbar.add(fileMenu);
		mbar.add(functionMenu);
		mbar.add(runMenu);
		mbar.add(helpMenu);
		setMenuBar(mbar);

		MenuAction b = new MenuAction();
		fileMenu.addActionListener(b);
		functionMenu.addActionListener(b);
		runMenu.addActionListener(b);
		helpMenu.addActionListener(b);
		addWindowListener(this);		
	}

//Action exist when select Menu

	class MenuAction implements ActionListener
	{
		public void actionPerformed(ActionEvent e)
		{
			String args = e.getActionCommand();

			//select Open Browser
			if (args == "Open Browser")
			{
				try
				{

					TimerAgent agent = new TimerAgent();
					Calendar now = Calendar.getInstance();	
					int hour = now.get(Calendar.HOUR);
					int min = now.get(Calendar.MINUTE);
					int mid = now.get(Calendar.AM_PM);
					if (mid == 0)
					{
						agent.setMid(0);
					}
					else agent.setMid(1);
					now.set(Calendar.HOUR,hour);
					now.set(Calendar.MINUTE,min);

					agent.setTime(now.getTime());
					agent.process(1);
				}
				catch (Exception ex){}	
			}
			//select Exit
			if (args == "Exit")
			{
				dispose();
				System.exit(0);
			}
			//select Open.. => set time for open browser
			if (args == "Open..")
			{
				auto = 1;
				openAutomatic(e);
			}
			//select Close.. => set time for close browser
			else if (args == "Close..")
				 {
					auto = 2;
					closeAutomatic(e);
				 }
			//select Load Script
			if (args == "Load Script")
			{
				editor.setText("");
				loadScript(e);	
			}
			//select News.. => use NewsMenu
			if (args == "News..")
			{
				try
				{

					TimerAgent agent = new TimerAgent();
					Calendar now = Calendar.getInstance();	
					int hour = now.get(Calendar.HOUR);
					int min = now.get(Calendar.MINUTE);
					int mid = now.get(Calendar.AM_PM);
					if (mid == 0)
					{
						agent.setMid(0);
					}
					else agent.setMid(1);
					now.set(Calendar.HOUR,hour);
					now.set(Calendar.MINUTE,min);

					agent.setTime(now.getTime());
					agent.process(7);
				}
				catch (Exception ex){}	
			}
			if (args == "Run Script"){runScript(e);}	//select Run Script
			if (args == "Save As")	{saveAs(e);}		//select Save As
			if (args == "Save")		{save(e);}			//select Save
			if ( args == "New")		{new_(e);}			//select New
			if ( args == "About" )	{about(e);}			//select About
		}
	}

//load scriptFile for showing 
	void loadScript(ActionEvent ae)
	{
		boolean more=true;
		String line;
		try
		{			
				FileDialog load = new FileDialog((Frame)this,"Open",FileDialog.LOAD);		
				load.show();
				String dir = load.getDirectory();
				String fname = load.getFile();
				path = dir+fname;
				FileInputStream fin = new FileInputStream(path);
				BufferedReader in = new BufferedReader(new InputStreamReader(fin));
				while (more)
				{
					line = in.readLine();
					if (line == null)
					{
						more = false;
					}
					else editor.append(line + "\n");
				}
		}
		catch (FileNotFoundException fe){System.out.println(fe);}		
		catch (IOException ie)			{System.out.println(ie);}				
	}

//SaveAs scriptFile
	void saveAs(ActionEvent ae)
	{		
		try
		{			
				FileDialog saveAs = new FileDialog( (Frame)this,"Save As",FileDialog.SAVE );		
				saveAs.show();
				String dir = saveAs.getDirectory();
				String fname = saveAs.getFile();
				path = dir+fname;
				FileOutputStream fout = new FileOutputStream(path);	
				System.out.println(path);
				String file = editor.getText ();
				fout.write ( file.getBytes() );
				fout.close ();
		}
		catch (FileNotFoundException fe){System.out.println(fe);}		
		catch (IOException ie)			{System.out.println(ie);}				
	}

//Save scriptFile
	void save ( ActionEvent ae){
		try
		{
			if ( path != null)
			{
				FileOutputStream fout = new FileOutputStream ( path );
				String file = editor.getText();
				fout.write ( file.getBytes () );
				fout.close ();
			}
			else 
			{
				saveAs(ae);
			}
		}
		catch ( FileNotFoundException fnf )
		{ 
			System.out.println ("The file does not exist, is a directory rather than a regular file, or for some other reason cannot be opened for reading");
		}
		catch ( IOException ioe)
		{ System.out.println ("IOException occurs"); }	
	}//end save

//set New for AgentMenu
	void new_ ( ActionEvent ae ) {
		editor.setText ("");
	}//end new_

//see aboutDialog from AgentMenu
	void about (ActionEvent ae) {
		AboutFrame about = new AboutFrame ();
		about.show();
	}//end about

//Open Browser Automatic by OpenDialog(set time)
	void openAutomatic(ActionEvent ae)
	{
			OpenDialog odg = new OpenDialog(this,"Set Time..Open Browser",true);
			odg.setSize(330,100);
			odg.show();
			TimerAgent agent = odg.getAgent();
			agent.process(1);
	}

//Close Browser Automatic by CloseDialog(set time)
	void closeAutomatic(ActionEvent ae)
	{
			CloseDialog odg = new CloseDialog(this,"Set Time .. Close Browser",true);
			odg.setSize(330,100);
			odg.show();
			TimerAgent agent = odg.getAgent();
			agent.process(2);
	}

//run script
	void runScript(ActionEvent ae)
	{
		String script = editor.getText();
		Run run = new Run(script);
	}
	
	public static void main(String[] args) 
	{
		AgentMenu a = new AgentMenu("Browser Agent");
		a.setSize(300,300);
		a.setVisible(true);
		TelnetServer b = new TelnetServer();
	}

	public void windowClosed (WindowEvent e) {}
	public void windowClosing (WindowEvent e) 
	{
		dispose();
		System.exit(0);
	}
	public void windowOpened (WindowEvent e) {}
	public void windowIconified (WindowEvent e) {}
	public void windowDeiconified (WindowEvent e) {}
	public void windowActivated (WindowEvent e) {}
	public void windowDeactivated (WindowEvent e) {}

}