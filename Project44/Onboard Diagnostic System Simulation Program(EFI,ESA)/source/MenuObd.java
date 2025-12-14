/**********Display Menu Window **********/

//package test;
import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import java.io.*;
import java.awt.Color.*;
import java.text.*;
import java.lang.*;
import java.util.*;
import java.util.Date.*;

import javax.swing.JTable;

import javax.swing.table.DefaultTableCellRenderer;

import javax.swing.table.TableColumn;
import javax.swing.JScrollPane;
import javax.swing.JPanel;
import javax.swing.JFrame;
import java.awt.*;
import java.awt.event.*;
import api.*;


public class MenuObd extends JFrame {
/* Start */
    private int ofc = 0;
	
	private boolean NON_STOP = true;
	/* Define Wait Time */
	
	public static  long WAIT_TIME = Long.MAX_VALUE;
	public static  long WAIT_FILE = Long.MAX_VALUE;
	
	public static  long WAIT = 200;


	/* Define Input Sensors To Use */
	static final int SENSOR_COUNT = 21; 
	
	/* Define Input Sensors Format */ 											 
	static final int sensortype [] = {	Sensor.PIM, Sensor.IDL, Sensor.VTA, Sensor.G1, 
									Sensor.G, Sensor.NE_PLUS, Sensor.NE_SUB, Sensor.KNK, 
									Sensor.THW, Sensor.THA, Sensor.OX, Sensor.SPD, 
									Sensor.SP2, Sensor.B, Sensor.STA, Sensor.NSW, 
									Sensor.AC1, Sensor.ACT, Sensor.TT, Sensor.IGF,
									Sensor.BK, Sensor.W
									};
	
	public static Obdii obd;
    
	public static String[] columnNames = {"Sensors", 
                                "Values",
                                "Units" };
	
	public static String[] col4 = {"OBD II Diagnostic Code", 
                                "Diagnostic Description",
                                "Diagnostic Time" };

	public File datfile = new File("signal.dat");

	public File file = null;

final Container c = getContentPane();

   public MenuObd()
   {

/************************************/
/**********start path menu **********/
/************************************/

      super( "Onboard Diagnostic System Simulation Program" );     

/* Test */
		final Sensor sen[] = new Sensor[sensortype.length];

		//File datfile = new File("input_signal.dat");
		File fuel = new File("fuel_rom.dat");
		File adv = new File("adv_rom.dat");
		
		obd = new Obdii();
		obd.loadRomCode(fuel, adv);
		obd.loadData();

		final CJTable table = new CJTable(obd.data, columnNames);
		final VJTable table2= new VJTable(obd.f_data, obd.mbarV_Col);
		final VJTable table3= new VJTable(obd.a_data, obd.mbarV_Col);
		final CJTable table4= new CJTable(obd.obdRows,col4);

		table.setDefaultRenderer(Object.class, new CenterRendererC());

		table2.setDefaultRenderer(Double.class, new CenterRenderer());
		table3.setDefaultRenderer(Double.class, new CenterRenderer());
		
		table2.setDefaultRenderer(Object.class, new CenterRendererC());
		table3.setDefaultRenderer(Object.class, new CenterRendererC());


		table4.setDefaultRenderer(Object.class, new CenterRendererC());
        
		table.setRowHeight(25);
		table.getColumnModel().getColumn(0).setPreferredWidth(150) ;

		table.getColumnModel().getColumn(1).setPreferredWidth(400) ;
		table.getColumnModel().getColumn(2).setPreferredWidth(100) ;

		table2.getColumnModel().getColumn(0).setPreferredWidth(120) ;
		table3.getColumnModel().getColumn(0).setPreferredWidth(120) ;

		table4.getColumnModel().getColumn(0).setPreferredWidth(100) ;
		table4.getColumnModel().getColumn(1).setPreferredWidth(400) ;
		table4.getColumnModel().getColumn(2).setPreferredWidth(100) ;

		JLabel rpmL = new JLabel("RPM");

		DashObd dash = new DashObd();

		TabbedObd tab = new TabbedObd(dash.AllMeter, table ,table2, table3,
									table4);

/* Test */

	  c.setLayout(new  BorderLayout());

      JMenuBar bar = new JMenuBar();  // create menubar
      setJMenuBar( bar );  // set the menubar for the JFrame

	  c.add(tab,BorderLayout.CENTER);

	
/***************** create File menu and Exit menu item ************************/
      JMenu fileMenu = new JMenu( "File" );
      fileMenu.setMnemonic( 'F' );
   	  final JMenuItem stopItem = new JMenuItem( "Stop" );
	  stopItem.setMnemonic( 'S' );
	  
	  final JMenuItem pauseItem = new JMenuItem( "Pause" );
	  pauseItem.setMnemonic( 'P' );

	  final JMenuItem runItem = new JMenuItem( "Run" );
	  runItem.setMnemonic( 'R' );
	  runItem.setEnabled(false);

	 /***** create submenu new file *****/
	  final JMenuItem newItem = new JMenuItem( "New" );
	  newItem.setMnemonic( 'N' );

	  newItem.addActionListener(
         new ActionListener() {
            public void actionPerformed( ActionEvent e )
            {

			}
         }
      );
	  newItem.setEnabled(false); // disable new option from file menu
      fileMenu.add( newItem );
	  
	  	 /***** create submenu open file *****/
	  JMenuItem openItem = new JMenuItem( "Open" );
	  openItem.setMnemonic( 'O' );
	  openItem.addActionListener(
         new ActionListener() {
            public void actionPerformed( ActionEvent e )
            {
				openFile();
   			    newItem.setEnabled(false); // disable new option from file menu
				WAIT_FILE = 0;
				WAIT_TIME = Long.MAX_VALUE;
				runItem.setEnabled(true);
			}
         }
      );
      fileMenu.add( openItem );

  	  fileMenu.addSeparator(); //draw separate line 

	  /***** create submenu save file *****/
	  JMenuItem saveItem = new JMenuItem( "Save" );
	  saveItem.setMnemonic( 'S' );
	  saveItem.addActionListener(
         new ActionListener() {
            public void actionPerformed( ActionEvent e )
            {

            }
         }
      );
	  saveItem.setEnabled(false); // disabel save option from file menu
      fileMenu.add( saveItem );
	
      /***** create submenu save as file *****/
	  JMenuItem saveAsItem = new JMenuItem( "Save As..." );
	  saveAsItem.setMnemonic( 'A' );
	  saveAsItem.addActionListener(
         new ActionListener() {
            public void actionPerformed( ActionEvent e )
            {

            }
         }
      );
	  		
	  saveAsItem.setEnabled(false); // disable save as option from file menu  
	
      fileMenu.add( saveAsItem ); // add save item 

	  fileMenu.addSeparator(); //draw separate line 

	  /***** create submenu exit program*****/
      JMenuItem exitItem = new JMenuItem( "Exit" );
      exitItem.setMnemonic( 'x' );
      exitItem.addActionListener(
         new ActionListener() {
            public void actionPerformed( ActionEvent e )
            {
               System.exit( 0 );
            }
         }
      );
      fileMenu.add( exitItem ); // add exit item

	  bar.add( fileMenu );    // add File menu

/************************* create View menu ***********************************/

      final JMenu runMenu = new JMenu( "Run" );
      runMenu.setMnemonic( 'R' );
   
	 /***** create submenu view dash *****/


	  runItem.addActionListener(
         new ActionListener() {
            public void actionPerformed( ActionEvent e )
            {
				/* Begin to Run */
				WAIT_TIME = WAIT;
				WAIT_FILE = 0;
				stopItem.setEnabled(true);
				pauseItem.setEnabled(true);
				runItem.setEnabled(false);
			}
         }
      );
      runMenu.add( runItem ); // add run item
	  
	  pauseItem.addActionListener(
         new ActionListener() {
            public void actionPerformed( ActionEvent e )
            {
				WAIT_TIME =Long.MAX_VALUE;
				pauseItem.setEnabled(false);
				stopItem.setEnabled(false);
				runItem.setEnabled(true);
			}

         }
      );
		runMenu.add( pauseItem ); // add sensors item
		pauseItem.setEnabled(false);

	  /***** create submenu view graphs *****/
	  stopItem.addActionListener(
         new ActionListener() {
            public void actionPerformed( ActionEvent e )
            {
				NON_STOP = false;
				WAIT_FILE = Long.MAX_VALUE;
				WAIT_TIME =Long.MAX_VALUE;			

				runItem.setEnabled(true);
				stopItem.setEnabled(false);
				pauseItem.setEnabled(false);
				
			}
         }
      );
      runMenu.add( stopItem ); // add graghs item
	 stopItem.setEnabled( false);
      /***** create submenu view errorcodes *****/
	  JMenuItem errorcodesItem = new JMenuItem( "Errorcodes" );
	  errorcodesItem.setMnemonic( 'E' );
	  errorcodesItem.addActionListener(
         new ActionListener() {
            public void actionPerformed( ActionEvent e )
            {

            }
         }
      );
      	  
	  bar.add( runMenu );    // add view menu
    
/************** create Help menu ***********************************/

	  JMenu HelpMenu = new JMenu( "Help" );
	  HelpMenu.setMnemonic( 'H' );

	  JMenuItem helpItem = new JMenuItem( "Help" );
	  helpItem.setMnemonic( 'A' );
	  helpItem.addActionListener(
         new ActionListener() {
            public void actionPerformed( ActionEvent e )
            {
	            
            }
         }
      );
	    helpItem.setEnabled(false); // disable help option from help menu
		HelpMenu.add( helpItem ); //add about item

		HelpMenu.addSeparator();

	  JMenuItem aboutItem = new JMenuItem( "About..." );
	  aboutItem.setMnemonic( 'A' );
	  aboutItem.addActionListener(
         new ActionListener() {
            public void actionPerformed( ActionEvent e )
            {
	            helpDisplay();
            }
         }
      );
		HelpMenu.add( aboutItem ); //add about item

		bar.add( HelpMenu ); //add Help menu
		
		setResizable(false);
    	setSize(680, 460);
        setVisible(true);



		this.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) 
				{
				System.exit(0);
				}
        });


		WaitFile();

		while (true)
		{
		run(file,sen,table,table4,dash);
		WaitFile();

		}

   }
/*****************************************************************************/
/************************************** Method *******************************/
/*****************************************************************************/

/********************************Method Display about  ***********************/

public void helpDisplay()
	{
	 JOptionPane.showMessageDialog( MenuObd.this,
				  "Onboard Diagnostic System Simulation Program\n"+
				  "Developed by\n"+
				  "MR.WEERAWAT POOMPATANAPONG\n"+
				  "MR.EAKSIN SINSOMANAS\n"+
				  "(C) Copyright 2002 by Eaksin & Weerawat\n"+
				  "All Rights Reserved.\n",
                  "About", JOptionPane.PLAIN_MESSAGE );				  
	}

/*******************************Method open file *****************************/

public void openFile()
	{
		JFileChooser fileChooser = new JFileChooser();
		fileChooser.setFileSelectionMode(JFileChooser.FILES_ONLY );
		int result = fileChooser.showOpenDialog( this );

		if (result == JFileChooser.CANCEL_OPTION)
		{
			file = null;
		}
		else file = fileChooser.getSelectedFile();
	}

/*****************************************************************************/
/*****************************Main Method ************************************/
/*****************************************************************************/
	public void updateTable(CJTable table, Object[][] data,int row,int col)
	{
		for(int r = 0 ; r < row ; r++)
				for(int c = 0 ; c < col ; c++)
		table.setValueAt(data[r][c],r,c);
		table.repaint();
	}

	public void updateTable2(CJTable table, Object[][] data,int row,int col,int begin, int end)
	{
		for(int r = begin ; r < end ; r++)
				for(int c = 0 ; c < col ; c++)
		table.setValueAt(data[r][c],r,c);
		table.repaint();
	}

  public void run(File datfile, Sensor [] sen, CJTable table,CJTable table4, DashObd dash)
  {

		long begin_t = System.currentTimeMillis();
		long differ;

		try
		{
			String [][] obdRows = new String  [30][3];

			FileInputStream fin = new FileInputStream(datfile);
			BufferedReader din = new BufferedReader( new InputStreamReader(fin)) ;
			FileOutputStream fout = new FileOutputStream("result.dat"); 
			PrintWriter result = new PrintWriter(fout);

			while (din.ready() && NON_STOP)
			
				{
				int ofc_temp;
				long end_t = System.currentTimeMillis();

				while(( differ = (end_t - begin_t)) < WAIT_TIME)
				{
					end_t = System.currentTimeMillis(); 
				}

				begin_t = System.currentTimeMillis();

					int i = 0;
					String ss ="";

					String s = din.readLine();
					StringTokenizer st = new StringTokenizer(s);
					while ( st.hasMoreTokens() ){
						i++;
						String temp = st.nextToken();
						double a = Double.parseDouble(temp);
						sen[i-1] = new Sensor(a,sensortype[i-1]);
						ss=ss+sen[i-1].printString();
					}

				obd = new Obdii(sen);
				obd.checkFaultCode();
				
				ofc_temp = ofc ;
				ofc = obd.getFaultCode(ofc);
				
				obd.loadData();

				updateTable(table, obd.data, 22, 3);
				updateTable2(table4, obd.obdRows,30,3,ofc_temp,ofc);

				dash.update( obd.dashData , obd.dashDataB);

				System.out.println("\n\nWaiting...");
				}
			
			result.print("");
			result.close();
			fin.close();
			
			System.out.println("Congratulation File Found : ");
			
			obd = new Obdii();
			obd.loadData();

			NON_STOP = true;
			updateTable(table, obd.data, 22, 3);

			dash.update( obd.dashData , obd.dashDataB);
			 WAIT_TIME = Long.MAX_VALUE;
		}
		
		catch (FileNotFoundException fnex) 
		{
			System.out.println("File not Found");
			fnex.printStackTrace();
		}

		catch (IOException ioex) 
		{
			System.out.println("IOException");
			ioex.printStackTrace();
		}
  
  }
  
public void WaitFile()
	{
		long begin_t = System.currentTimeMillis();
		long differ;
		long end_t = System.currentTimeMillis();
				while( (end_t - begin_t) < WAIT_FILE)
				{
					end_t = System.currentTimeMillis(); 
				}

	}

}

