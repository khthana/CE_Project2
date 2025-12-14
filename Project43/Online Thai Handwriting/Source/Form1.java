import java.awt.*;
import java.awt.event.*;
import java.io.*;

public class Form1 {
	public static void main(String arg[]) {
		Program P = new Program();
	}
}

class Program extends Windows implements Runnable, ItemListener, ActionListener {
	int i = 0, i1 = 0, i2 = 0;
	double i3 = 0;
	int mouse_array = 0;
	int old_mouseX = 0, old_mouseY = 0;
	int mouseX[] = new int[400];
	int mouseY[] = new int[400]; 
	boolean exit = false;
	boolean clear = true;
	boolean open = false;
	boolean pp = false;
	String s = "", sg = "";
	String ochain = "";
	String input_filename = "";
	String input_filedata = "";
	String open_file = "", f = "";
	String tt = "";
	TextField textfield_inputname, textfield_rectime, textfield_recgroup, textfield_recchar, textfield_recchain, textfield_name, textfield_file, txxx;
	Label label_input, label_rec, label_chain, label_group, label_char, label_time;
	Button button_inputclear, button_inputinput, button_recclear, button_recsubmit, button_browse, button_next, bxxx, button_learn, button_change;
	MenuBar menubar;
	Menu menu1, menu2;
	Open_File openfile;
	Choice choice = new Choice();
	Mouse mouse = new Mouse();
	Thread T = new Thread();
	Chain chain = new Chain();
	Program() {
		setLayout(null);
//////////  Menu Bar
		menubar = new MenuBar();
		setMenuBar(menubar);
		menu1 = new Menu("File");
		menubar.add(menu1);
		menu1.add(new MenuItem("Exit"));
		menu1.addActionListener(this);
		menu2 = new Menu("Help");
		menubar.add(menu2);
		menu2.add(new MenuItem("Help"));
		menu2.addActionListener(this);
///////////  Button Rec Clear
		button_recclear = new Button( "Clear" );
		button_recclear.setBounds( 600, 515, 160, 30 );
		add( button_recclear );
		button_recclear.addActionListener(this);
//////////  Button Rec Submit
		button_recsubmit = new Button( "Submit" );
		button_recsubmit.setBounds( 420, 515, 160, 30 );
		add( button_recsubmit );
		button_recsubmit.addActionListener(this);
//////////  Button Learn
		button_learn = new Button( "Learn" );
		button_learn.setBounds( 420, 470, 340, 30 );
		add( button_learn );
		button_learn.addActionListener(this);
		button_learn.enable(false);
//////////  Button Change		
		button_change = new Button( "Change" );
		button_change.setBounds( 600, 430, 160, 30 );
		add( button_change );
		button_change.addActionListener(this);
//////////  Choice
		choice.addItem("Change Charactor");
		choice.setBounds( 420, 435, 160, 30 );
		choice.addItemListener(this);
		add(choice);
//////////  Window
		Windows(0,0,800,570,"Ver. 1.9");
		addMouseMotionListener(mouse);
		addMouseListener(mouse);
		start();
	}
//////////  Window Action 
	public void windowClosing(WindowEvent e) { exit = true; dispose(); System.exit(0); }
//////////  Thread
	public void start() { 
		T.start(); 
		run(); 
	}
	public void run() {
		while ( exit == false ) {
			try { T.sleep(1); } catch ( Exception e ) {}
			repaint();
		}
		T.stop();
	}
////////// Draw Picture
	public void update(Graphics g) {
		///// Clear Screen
		Dimension dimension = getSize();
		if (clear) {
			g.setColor(Color.white);
			g.fillRect(0,0,dimension.width,dimension.height);
			clear = false;
		}
		///// Draw Rec Line
		g.drawLine( 420, 73, 420, 413 );
		g.drawLine( 420, 73, 760, 73 );
		g.drawLine( 420, 413, 760, 413 );
		g.drawLine( 760, 73, 760, 413 );
		///// Draw Output
		if ( pp ) {
			g.setColor( Color.white );
			g.fillRect( 421, 74, 338, 338 );
			g.setColor( Color.black );
			pp = false;
		}
		if ( s.equals("") ) {
			g.setColor( Color.white );
			g.fillRect( 421, 74, 338, 338 );
			g.setColor( Color.black );
		} else {
			g.setFont(new Font( "Dialog", Font.PLAIN, 190 ));
			g.drawString( s, 550, 300 );
		}
		///// Draw Write Line
		g.drawRect( 50, 73, 350, 472 );
		if (open == false) {
		if ( mouse.getmouseEnable() ) {			
			if (mouse.getRelease()) {
///////// When Mouse Release
				mouseX[mouse_array] = mouseY[mouse_array] = 999;
				mouse_array ++;
				mouse.setRelease();
			} else {
///////// When Mouse Press
				if ((old_mouseX != mouse.getX()) || (old_mouseY != mouse.getY())) {
//					g.fillOval( mouse.getX(), mouse.getY(), 3, 3 );
					if (mouse_array > 0) {
						if (mouseX[mouse_array-1] != 0 && mouseX[mouse_array-1] != 999) {
							g.drawLine(mouseX[mouse_array-1],mouseY[mouse_array-1],mouse.getX(),mouse.getY());
						}
					}
					mouseX[mouse_array] = mouse.getX();
					mouseY[mouse_array] = mouse.getY();
					mouse_array ++;
					old_mouseX = mouse.getX();
					old_mouseY = mouse.getY();
				}
			}
		}
		} else {
			for (i = 0; i < 400; i++) {
//				g.fillOval( mouseX[i], mouseY[i], 3, 3 );
				if (i > 0) { 
					if ( mouseX[i-1] != 0 && mouseX[i] != 0 ) {
					g.drawLine(mouseX[i-1],mouseY[i-1],mouseX[i],mouseY[i]); 
					}}
			}
			open = false;
		}
	}
////////// ItemListener
	public void itemStateChanged(ItemEvent e) {
		tt = e.getItem() + "";
	}
////////// ActionListener
	public void actionPerformed(ActionEvent e) {
	////// Button Browse
		if (e.getActionCommand() == "Exit") {
			exit = true; 
			dispose(); 
			System.exit(0);
		} else {
		if (e.getActionCommand() == "Add") {
			Dialog dialog = new Dialog(300,200,200,100,"Add",ochain);
		} else {
		if (e.getActionCommand() == "Browse") {
			FileDialog filedialog = new FileDialog(new Frame(), "Open File", FileDialog.LOAD );
			filedialog.setDirectory(".");
			filedialog.setVisible(true);
			open_file = filedialog.getFile();
			textfield_file.setText(open_file);
			if (open_file.equals("") == false) {
				openfile = new Open_File(open_file);
			}
			if ( open_file.substring(0,1).equals("Í") ) {
				if ( open_file.substring(1,2).equals(".") ) {
					f = open_file.substring(0,1);
				} else {
					f = open_file.substring(1,2);
				}
			} else {
				f = open_file.substring(0,1);
			}
			i1 = i2 = 0;
		} else {
	////// Button Next
		if (e.getActionCommand() == "Change") {
			s = tt;
			pp = true;
		} else {
	////// Button Submit
		if (e.getActionCommand() == "Submit") {
			i = 0;
			while (i < 400) {
				if (i >= 4) {
					if ((mouseX[i-3] == 0) && (mouseX[i-4] == 0)) {} else {
						chain.Create(mouseX[i],mouseY[i]);
					}
				} else {
					chain.Create(mouseX[i],mouseY[i]);
				}
				i++;
			}
			ochain = chain.getChain();
			if ( chain.getGroup().equals("") ) { sg = "?"; }
			s = chain.getChar();
			if ( s.equals("?") && sg.equals("?") ) {
				button_learn.enable(true);
			} else {
				button_learn.enable(false);
			}
			choice.removeAll();
			String m = chain.getGroup();
			if ( m.length() < 4 ) {
				int l = ochain.length();
				if ( ochain.substring(l-1).equals("1") ) {
					chain.setChain( ochain.substring(0,l-1) );
				} else {
					chain.setChain( ochain + "1" );
				}
				m = m + chain.getGroup();
				if ( ochain.substring(l-1).equals("2") ) {
					chain.setChain( ochain.substring(0,l-1) );
				} else {
					chain.setChain( ochain + "2" );
				}
				m = m + chain.getGroup();
				if ( ochain.substring(l-1).equals("3") ) {
					chain.setChain( ochain.substring(0,l-1) );
				} else {
					chain.setChain( ochain + "3" );
				}
				m = m + chain.getGroup();
				if ( ochain.substring(l-1).equals("4") ) {
					chain.setChain( ochain.substring(0,l-1) );
				} else {
					chain.setChain( ochain + "4" );
				}
				m = m + chain.getGroup();
				if ( ochain.substring(0,1).equals("s") ) {
					if ( ochain.substring(1,2).equals("1") ) {
						chain.setChain( "s" + ochain.substring(2) );
					} else {
						chain.setChain( "s1" + ochain.substring(1) );
					}
					m = m + chain.getGroup();
					if ( ochain.substring(1,2).equals("2") ) {
						chain.setChain( "s" + ochain.substring(2) );
					} else {
						chain.setChain( "s2" + ochain.substring(1) );
					}
					m = m + chain.getGroup();
					if ( ochain.substring(1,2).equals("3") ) {
						chain.setChain( "s" + ochain.substring(2) );
					} else {
						chain.setChain( "s3" + ochain.substring(1) );
					}
					m = m + chain.getGroup();
					if ( ochain.substring(1,2).equals("4") ) {
						chain.setChain( "s" + ochain.substring(2) );
					} else {
						chain.setChain( "s4" + ochain.substring(1) );
					}
					m = m + chain.getGroup();
				} else {
					if ( ochain.substring(0,1).equals("1") ) {
						chain.setChain( ochain.substring(1) );
					} else {
						chain.setChain( "1" + ochain );
					}
					m = m + chain.getGroup();
					if ( ochain.substring(0,1).equals("2") ) {
						chain.setChain( ochain.substring(1) );
					} else {
						chain.setChain( "2" + ochain );
					}
					m = m + chain.getGroup();
					if ( ochain.substring(0,1).equals("3") ) {
						chain.setChain( ochain.substring(1) );
					} else {
						chain.setChain( "3" + ochain );
					}
					m = m + chain.getGroup();
					if ( ochain.substring(0,1).equals("4") ) {
						chain.setChain( ochain.substring(1) );
					} else {
						chain.setChain( "4" + ochain );
					}
					m = m + chain.getGroup();
				}
			}
			if ( m.length() >= 4 ) {
				String ssss = "";
				int fff = 0, ttt = 0;
				boolean bbb = true;
				for ( fff = 0; fff < m.length(); fff ++) {
					ttt = fff + 2;
					while ( ttt < m.length() ) {
						if ( m.substring(fff, fff+1).equals(m.substring(ttt, ttt+1)) ) { bbb = false; }
						ttt = ttt + 2;
					}
					if ( bbb ) {
						ssss = ssss + m.substring(fff, fff+1) + " ";
					} else { 
						bbb = true;
					}
					fff ++;
				}
				m = ssss;
			}
			choice.addItem( "-- " + m + "--" );
			int o = 0;
			for (o = 0; o < m.length(); o++) {
				choice.addItem( m.substring(o,o+1) );
				o++;
			}
		} else {
	///// Button Clear
		if (e.getActionCommand() == "Clear") {
			Clear();
			chain.Clear();
		} else {
	///// Button Input
/*		if ( e.getActionCommand() == "Input" ) {
			File_Manage file_manage = new File_Manage(input_filename);
			input_filedata = "";
			for ( i = 0; i < 100; i++ ) {
				input_filedata = input_filedata + "[" + mouseX[i] + "/" + mouseY[i] + "],";
			}
			file_manage.InputData(input_filedata);
			input_filedata = "";
			for ( i = 100; i < 200; i++ ) {
				input_filedata = input_filedata + "[" + mouseX[i] + "/" + mouseY[i] + "],";
			}
			file_manage.InputData(input_filedata);
			input_filedata = "";
			for ( i = 200; i < 300; i++ ) {
				input_filedata = input_filedata + "[" + mouseX[i] + "/" + mouseY[i] + "],";
			}
			file_manage.InputData(input_filedata);
			input_filedata = "";
			for ( i = 300; i < 400; i++ ) {
				input_filedata = input_filedata + "[" + mouseX[i] + "/" + mouseY[i] + "],";
			}
			file_manage.InputData(input_filedata);
			file_manage.InputData(textfield_inputname.getText());
			file_manage.InputData("<<<<>>>>");
			file_manage.CloseFile();
			Clear();
		} else {*/
		if ( e.getActionCommand() == "Learn" ) {
			Dialog dialog = new Dialog(300,200,200,100,"Add",ochain);
		} else {
		if ( e.getActionCommand() == "Help" ) {
		}
//		}
		}
		}
		}
		}
		}
		}
		}
	}
	public void Clear() {
		clear = true;
		mouse_array = 0;
		for (i = 0; i < 400; i++) {
			mouseX[i] = mouseY[i] = 0;
		}
		old_mouseX = old_mouseY = 0;
		s = "";
		sg = "";
		button_learn.enable(false);
	}
}
