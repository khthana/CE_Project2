package routersim;

import java.awt.*;
import java.awt.event.*;
import java.rmi.*;
import java.rmi.server.*;
import java.util.*;
import java.io.*;

import javax.swing.*;
import javax.swing.border.*;
import com.borland.jbcl.layout.*;
import com.incors.plaf.alloy.*;

public class Frame3 extends JFrame implements ChangeStatus {

  //-- static variable
  static Vector vConsole = new Vector();
  static Vector vFrame = new Vector();
  static int SelectMode = 1;
  static int Series;
  static int check = 0;
  static int opened = 0;
  static  JScrollPane jScrollPane1 = new JScrollPane();

  private boolean pressin = false;
  private JPanel contentPane;
  private JPanel jPanel1 = new JPanel();
  private Image img;
  private int indexOfRouter;
  private JMenuBar jMenuBar1 = new JMenuBar();
  private JMenu jMenu1 = new JMenu();
  private JMenu jMenu2 = new JMenu();
  private JMenu jMenu4 = new JMenu();
  private JMenu jMenu5 = new JMenu();
  private JMenuItem jMenu_Open = new JMenuItem();
  private JMenuItem jMenu_Traffic = new JMenuItem();
  private JMenuItem jMenu_adduser = new JMenuItem();
  private JMenuItem jMenu_DelRouter = new JMenuItem();
  private JToolBar tb = new JToolBar();
  static String serverName = "";

  //-- Image for icon
  ImageIcon image1;
  ImageIcon image2;
  ImageIcon image3;
  ImageIcon image4;
  ImageIcon image5;
  ImageIcon image6;
  ImageIcon image7;
  ImageIcon image8;
  ImageIcon image9;
  ImageIcon image10;
  ImageIcon image11;
  ImageIcon image12;
  ImageIcon image13;
  ImageIcon image14;
  ImageIcon image15;
  ImageIcon image16;
  ImageIcon image17;
  ImageIcon image18;

  //-- Status bar
  static JScrollPane jScrollPane2 = new JScrollPane();
  static JTextArea   textarea[];
  static  JPanel jPanel2 = new JPanel();

  //-- Other variable
  static TitledBorder titledBorder1;
  private TitledBorder titledBorder2;
  static TitledBorder titledBorder10;
  static JLabel jLabel8 = new JLabel();
  private JLabel jLabel14 = new JLabel();
  private TitledBorder titledBorder3;
  private TitledBorder titledBorder4;
  private FlowLayout flowLayout1 = new FlowLayout();
  private VerticalFlowLayout verticalFlowLayout1 = new VerticalFlowLayout();
  static String name ;
  static  JPanel jPanel4 = new JPanel();
  private XYLayout xYLayout1 = new XYLayout();
  private JButton jC01 = new JButton();
  private Border border1;
  private JButton jC02 = new JButton();
  private JButton jC13 = new JButton();
  private JButton jC14 = new JButton();
  private JButton jC15 = new JButton();
  private JButton jopen = new JButton();
  private JButton jsave = new JButton();
  private TitledBorder titledBorder5;
  private JButton jDelete = new JButton();
  private TitledBorder titledBorder6;
  private TitledBorder titledBorder7;
  private JButton jFeature = new JButton();
  private TitledBorder titledBorder8;
  private JButton jLesson = new JButton();
  private JButton jHelp = new JButton();
  private JButton jWire = new JButton();
  private JButton jIdeal = new JButton();
  private JButton jLogo = new JButton();
  private JButton jload = new JButton();
  private TitledBorder titledBorder9;
  private XYLayout xYLayout3 = new XYLayout();
  private PaneLayout paneLayout1 = new PaneLayout();
  private XYLayout xYLayout2 = new XYLayout();
  static JPanel jPanel5 = new JPanel();
  private ImageMotion im = null ;
  private XYLayout xYLayout4 = new XYLayout();
  private XYLayout xYLayout5 = new XYLayout();
  Border  b1 = new MatteBorder( 10 , 5 , 10 , 5 , Color.lightGray );
  Border  b2 = new TitledBorder("Network Design");
  Border  networkBorder = new CompoundBorder( b1 , b2 );
  private JButton jWire1 = new JButton();
  private JButton jWire2 = new JButton();
  private TitledBorder titledBorder11;

  //-- RMI call back from server
  ClientCallbackInt call = new ClientCallbackImpl();

  private JMenuItem jMenu_Feature = new JMenuItem();
  private JButton jButton1 = new JButton();
  private Border border2;
  private TitledBorder titledBorder12;
  private JMenuItem jMenu_Aboutus = new JMenuItem();
  private JMenuItem jMenu_License = new JMenuItem();
  private JMenuItem jMenu_Command = new JMenuItem();
  private JButton jDelCable = new JButton();
  private JButton jDelHost = new JButton();
  private JMenuItem jMenu_DelInt = new JMenuItem();
  private JMenuItem jMenu_DelHost = new JMenuItem();
  private JMenuItem jMenuItem1 = new JMenuItem();
  private JMenuItem jMenu_SaveDiagram = new JMenuItem();
  private JMenuItem jMenu_SingleMode = new JMenuItem();
  private JMenuItem jMenu_NormalMode = new JMenuItem();
  private JMenuItem jMenu_Logo = new JMenuItem();
  private JToggleButton jToggle_NextStep = new JToggleButton();

  JFileChooser fc = new JFileChooser();
  JTextArea log = new JTextArea(5,20);
  String newline = "\n";
  FileIO d =new FileIO();
  private JPanel jPanel3 = new JPanel();
  private TitledBorder titledBorder13;
  private XYLayout xYLayout6 = new XYLayout();
  private XYLayout xYLayout7 = new XYLayout();
  private XYLayout xYLayout8 = new XYLayout();
  private JButton jLogo1 = new JButton();

 //-- Construct the frame for admin mode
  public Frame3() {

    enableEvents(AWTEvent.WINDOW_EVENT_MASK);
    try {
      jbInit();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }

  //Construct the frame for user mode
  public Frame3(int mode,String hostname) {

    enableEvents(AWTEvent.WINDOW_EVENT_MASK);
    try {
      setSelectMode(mode);
      setHostname(hostname);
      im = new ImageMotion();//test
      jbInit();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }

  //-- Component initialization
  private void jbInit() throws Exception  {
    titledBorder13 = new TitledBorder(BorderFactory.createEtchedBorder(Color.white,new Color(178, 178, 178)),"");
    fc.addChoosableFileFilter(new FileFiltering());

    //-- Get image to iamge icon
    image1 = new ImageIcon(Frame3.class.getResource("open.png"));
    image2 = new ImageIcon(Frame3.class.getResource("delete.png"));
    image3 = new ImageIcon(Frame3.class.getResource("feature.png"));
    image4 = new ImageIcon(Frame3.class.getResource("delhost.gif"));
    image5 = new ImageIcon(Frame3.class.getResource("lesson.png"));
    image6 = new ImageIcon(Frame3.class.getResource("Help.png"));
    image7 = new ImageIcon(Frame3.class.getResource("bluerouter.gif"));
    image8 = new ImageIcon(Frame3.class.getResource("grayrouter.gif"));
    image9 = new ImageIcon(Frame3.class.getResource("greenrouter.gif"));
    image10 = new ImageIcon(Frame3.class.getResource("pupilrouter.gif"));
    image11= new ImageIcon(Frame3.class.getResource("redrouter.gif"));
    image12 = new ImageIcon(Frame3.class.getResource("delcable.gif"));
    image13 = new ImageIcon(Frame3.class.getResource("Help.png"));
    image14 = new ImageIcon(Frame3.class.getResource("pinkrouter.gif"));
    image15 = new ImageIcon(Frame3.class.getResource("ser.gif"));
    image16 = new ImageIcon(Frame3.class.getResource("eth.gif"));
    image17 = new ImageIcon(Frame3.class.getResource("tok.gif"));
    image18 = new ImageIcon(Frame3.class.getResource("pc.png"));
    ImageIcon imageStep = new ImageIcon(Frame3.class.getResource("run.png"));
    ImageIcon imageSave = new ImageIcon(Frame3.class.getResource("save.png"));
    ImageIcon imageLogo = new ImageIcon(Frame3.class.getResource("logo.png"));
    ImageIcon imageLoad = new ImageIcon(Frame3.class.getResource("load.png"));
    ImageIcon imageDelHost = new ImageIcon(Frame3.class.getResource(("delhost.png")));
    ImageIcon imageDelWire = new ImageIcon(Frame3.class.getResource(("delwire.png")));
    ImageIcon open = new ImageIcon(Frame3.class.getResource(("sopen.png")));
    ImageIcon exit = new ImageIcon(Frame3.class.getResource(("exit.png")));
    ImageIcon load = new ImageIcon(Frame3.class.getResource(("sload.png")));
    ImageIcon saved = new ImageIcon(Frame3.class.getResource(("ssave.png")));
    ImageIcon newd = new ImageIcon(Frame3.class.getResource(("new.png")));
    ImageIcon home = new ImageIcon(Frame3.class.getResource(("home.png")));
    ImageIcon key = new ImageIcon(Frame3.class.getResource(("key.png")));
    ImageIcon imageIcon = new ImageIcon(Frame3.class.getResource("icon.png"));

    //-- set components
    titledBorder1 = new TitledBorder(BorderFactory.createEtchedBorder(Color.white,new Color(178, 178, 157)),"Help");
    titledBorder2 = new TitledBorder(BorderFactory.createEtchedBorder(Color.white,new Color(148, 145, 140))," = D e v i c e s =");
    titledBorder3 = new TitledBorder(BorderFactory.createEtchedBorder(Color.white,new Color(148, 145, 140))," = R o u t e r s  S t a t u s =");
    titledBorder4 = new TitledBorder(BorderFactory.createEtchedBorder(Color.white,new Color(148, 145, 140))," = N e t w o r k  D e s i g n =");

    border1 = BorderFactory.createEmptyBorder();
    border2 = new EtchedBorder(EtchedBorder.RAISED,Color.white,new Color(148, 145, 140));

    //-- set program logo
    contentPane = (JPanel) this.getContentPane();
    contentPane.setLayout(xYLayout5);

    this.setDefaultCloseOperation(EXIT_ON_CLOSE); //-- close operation
    this.setSize(new Dimension(1024, 747));       //-- size of application
    this.setTitle(" I S A G  : R o u t e r  S i m u l a t o r   C o m m u n i t y   E d i t i o n  : ");

    //-- Export object
    try {

      UnicastRemoteObject.exportObject(this);
    }
    catch(java.rmi.RemoteException re){
      re.printStackTrace();
    }

    this.setVisible(true);

    this.addKeyListener(new java.awt.event.KeyAdapter() {
      public void keyPressed(KeyEvent e) {
      }
    });

    jPanel1.setBorder(titledBorder2);
    jPanel1.setToolTipText("Select device on this pane to create .");
    jPanel1.setLayout(xYLayout8);

    //-- Connect to server
    String serverName = "";
    try {

      serverName = java.net.InetAddress.getLocalHost().getHostName();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }

    try {

      //-- invoke method on server object
      UnicastRemoteObject.exportObject(call);
    }
    catch(Exception ex1) {
      System.out.println("Exception occured: " + ex1);
      System.exit(0);
    }

    //-- Pane setting
    contentPane.setBackground(UIManager.getColor("ToolBar.floatingBackground"));
    contentPane.setEnabled(true);
    contentPane.setPreferredSize(new Dimension(1024, 768));

    jScrollPane1.getViewport().setBackground(Color.white);
    jScrollPane1.setBorder(titledBorder4);
    jScrollPane1.setPreferredSize(new Dimension(24, 24));
    jScrollPane1.setToolTipText("Network Diagram Plan");

    //-- Menu setting
    jMenu2.setText("File");
    jMenu2.setMnemonic( KeyEvent.VK_F );

    jMenu1.setText("Edit");
    jMenu1.setMnemonic( KeyEvent.VK_D);

    jMenu4.setText("Mode");
    jMenu4.setMnemonic( KeyEvent.VK_M );

    jMenu5.setText("Help");
    jMenu5.setMnemonic( KeyEvent.VK_H );

    jMenu_Open.setText("Load ");
    jMenu_Open.setIcon( open );
    jMenu_Open.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jMenu_Open_actionPerformed(e);
      }
    });

    jMenu_Traffic.setText("  Traffic ");
    //jMenu_Traffic.setIcon( open );
    jMenu_Traffic.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jMenu_Traffic_actionPerformed(e);
      }
    });



    jMenu_DelRouter.setText("Delete router");
    jMenu_DelRouter.setIcon( imageIcon );
    jMenu_DelRouter.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jMenu_DelRouter_actionPerformed(e);
      }
    });

    jMenu_Feature.setText("Feature");
    jMenu_Feature.setIcon( imageIcon );
    jMenu_Feature.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jMenu_Feature_actionPerformed(e);
      }
    });

    jMenu_SingleMode.setText("Single Mode");
    jMenu_SingleMode.setIcon( imageIcon );
    jMenu_SingleMode.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jMenu_SingleMode_actionPerformed(e);
      }
    });

    jMenu_NormalMode.setText("Normal Mode");
    jMenu_NormalMode.setIcon( imageIcon );
    jMenu_NormalMode.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jMenu_NormalMode_actionPerformed(e);
      }
    });

    jMenu_Aboutus.setText("About ROUTER SIMULATOR");
    jMenu_Aboutus.setIcon( home );
    jMenu_Aboutus.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jMenu_Aboutus_actionPerformed(e);
      }
    });

    jMenu_License.setText("License Agreement");
    jMenu_License.setIcon( imageIcon );
    jMenu_License.addActionListener( new java.awt.event.ActionListener() {
     public void actionPerformed( ActionEvent e ){
      jMenu_License_actionPerformed( e );
     }
    });


    jMenu_Command.setText("Command Reference ");
    jMenu_Command.setIcon( key );
    jMenu_Command.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jMenu_Command_actionPerformed(e);
      }
    });

    jMenu_DelInt.setText("Delete Wire");
    jMenu_DelInt.setIcon( imageIcon );
    jMenu_DelInt.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jMenu_DelInt_actionPerformed(e);
      }
    });

    jMenu_DelHost.setText("Delete Host");
    jMenu_DelHost.setIcon( imageIcon );
    jMenu_DelHost.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jMenu_DelHost_actionPerformed(e);
      }
    });

    jMenu_SaveDiagram.setText("Save As .. ");
    jMenu_SaveDiagram.setIcon( saved );
    jMenu_SaveDiagram.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        saveAsFile(e);
      }
    });

    //-- Status pane setting
    jScrollPane2.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_NEVER);
    jScrollPane2.getViewport().setBackground(UIManager.getColor("Tree.background"));
    jScrollPane2.setBorder(titledBorder3);
    jScrollPane2.setMinimumSize(new Dimension(300, 300));
    jScrollPane2.setPreferredSize(new Dimension(300, 300));
    jPanel2.setLayout(xYLayout2);

    //-- Device pane --------------------------------------------------------------------------- begin ------
    jLabel8.setFont(new java.awt.Font("Tahoma", 1, 14));
    jLabel8.setForeground( Color.blue );
    jLabel8.setText(" Router Series ");
    jLabel14.setFont(new java.awt.Font("Tahoma", 1, 14));
    jLabel14.setForeground( Color.blue );
    jLabel14.setText(" Wire Type ");
    jPanel4.setMinimumSize(new Dimension(100, 100));
    jPanel4.setPreferredSize(new Dimension(100, 100));
    jPanel4.setLayout(xYLayout1);

    //-- check mode for admin or user
    int mode = getSelectMode();

    //-- Router button setting
    //-- router 2501
    jC01.setBorder(border1);
    jC01.setToolTipText("Cisco Router series 2501");
    jC01.setFocusPainted(true);
    jC01.setFont(new Font("Tahoma", Font.PLAIN, 10));
    jC01.setContentAreaFilled(false);
    jC01.setVerticalTextPosition(AbstractButton.BOTTOM);
    jC01.setHorizontalTextPosition(AbstractButton.CENTER);
    jC01.setText(" Cisco 2501");
    jC01.setIcon(image7);
    jC01.setCursor( new Cursor( Cursor.HAND_CURSOR ) );
    jC01.setMnemonic(KeyEvent.VK_1);

    //-- Disable button if in user mode
    if (mode==2){

      jC01.setEnabled(false);
    }
    else
    jC01.addActionListener(new java.awt.event.ActionListener() {
     public void actionPerformed(ActionEvent e) {
       jC01_actionPerformed(e);
     }
    });

    //-- router 2502
    jC02.setToolTipText("Cisco Router series 2502");
    jC02.setFont(new Font("Tahoma", Font.PLAIN, 10));
    jC02.setFocusPainted(true);
    jC02.setIcon(image8);
    jC02.setBorder(border1);
    jC02.setContentAreaFilled(false);
    jC02.setVerticalTextPosition(AbstractButton.BOTTOM);
    jC02.setHorizontalTextPosition(AbstractButton.CENTER);
    jC02.setText(" Cisco 2502");
    jC02.setCursor( new Cursor( Cursor.HAND_CURSOR ) );
    jC02.setMnemonic(KeyEvent.VK_2);

    //-- check user Mode
    if (mode==2){
      jC02.setEnabled(false);
    }
    else
    jC02.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jC02_actionPerformed(e);
      }
    });

    //-- router 2513
    jC13.setToolTipText("Cisco Router series 2513");
    jC13.setFont(new Font("Tahoma", Font.PLAIN, 10));
    jC13.setFocusPainted(true);
    jC13.setIcon(image9);
    jC13.setBorder(border1);
    jC13.setContentAreaFilled(false);
    jC13.setVerticalTextPosition(AbstractButton.BOTTOM);
    jC13.setHorizontalTextPosition(AbstractButton.CENTER);
    jC13.setText(" Cisco 2513");
    jC13.setCursor( new Cursor( Cursor.HAND_CURSOR ) );
    jC13.setMnemonic(KeyEvent.VK_3);

    //-- check user Mode
     if (mode==2){
     jC13.setEnabled(false);
      }
      else
      jC13.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jC13_actionPerformed(e);
      }
    });

    //-- router 2514
    jC14.setToolTipText("Cisco Router series 2514");
    jC14.setFont(new Font("Tahoma", Font.PLAIN, 10));
    jC14.setFocusPainted(true);
    jC14.setIcon(image10);
    jC14.setBorder(border1);
    jC14.setContentAreaFilled(false);
    jC14.setVerticalTextPosition(AbstractButton.BOTTOM);
    jC14.setHorizontalTextPosition(AbstractButton.CENTER);
    jC14.setText(" Cisco 2514");
    jC14.setCursor( new Cursor( Cursor.HAND_CURSOR ) );
    jC14.setMnemonic(KeyEvent.VK_4);

    //-- check user Mode
    if (mode==2){
      jC14.setEnabled(false);
     }
     else
     jC14.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jC14_actionPerformed(e);
      }
    });

    //-- router 2515
    jC15.setToolTipText("Cisco Router series 2515");
    jC15.setFont(new Font("Tahoma", Font.PLAIN, 10));
    jC15.setFocusPainted(true);
    jC15.setIcon(image11);
    jC15.setBorder(border1);
    jC15.setContentAreaFilled(false);
    jC15.setVerticalTextPosition(AbstractButton.BOTTOM);
    jC15.setHorizontalTextPosition(AbstractButton.CENTER);
    jC15.setText(" Cisco 2515");
    jC15.setCursor( new Cursor( Cursor.HAND_CURSOR ) );
    jC15.setMnemonic(KeyEvent.VK_5);

    //-- check user Mode
    jMenu_adduser.setText("   Asign Password");
    if(mode==2)
    {
      jMenu_adduser.setEnabled(false);
    }
    else{
    //jMenu_Traffic.setIcon( open );
    jMenu_adduser.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jMenu_adduser_actionPerformed(e);
      }
    });
    }
    if (mode==2){
      jC15.setEnabled(false);
     }
     else
    jC15.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jC15_actionPerformed(e);
      }
    });

    //-- Ideal router
    jIdeal.setToolTipText("Ideall Router");
    jIdeal.setFont(new Font("Tahoma", Font.PLAIN, 10));
    jIdeal.setFocusPainted(true);
    jIdeal.setIcon(image14);
    jIdeal.setBorder(border1);
    jIdeal.setContentAreaFilled(false);
    jIdeal.setVerticalTextPosition(AbstractButton.BOTTOM);
    jIdeal.setHorizontalTextPosition(AbstractButton.CENTER);
    jIdeal.setText(" Ideall Router");
    jIdeal.setCursor( new Cursor( Cursor.HAND_CURSOR ) );
    jIdeal.setMnemonic(KeyEvent.VK_I);

    //-- check user Mode
    if (mode==2){
      jIdeal.setEnabled(false);
    }
    else
    jIdeal.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jIdeal_actionPerformed(e);
      }
    });

    //-- Device Pane ------------------------------------------------------------------------------------- END --

    //-- Quick Toolbar ----------------------------------------------------------------------------------- BEGIN-
    //-- Open diagram
    jopen.setBorder(border1);
    jopen.setToolTipText("open Diagram");
    jopen.setIcon(image1);
    jopen.setFont(new Font("Tahoma", Font.PLAIN, 10));
    jopen.setVerticalTextPosition(AbstractButton.BOTTOM);
    jopen.setHorizontalTextPosition(AbstractButton.CENTER);
    jopen.setText("open");
    jopen.setCursor( new Cursor( Cursor.HAND_CURSOR ) );
    jopen.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        //-- File Choose
        JScrollPane logScrollPane = new JScrollPane(log);

        int returnVal = fc.showOpenDialog(Frame3.this);

        if (returnVal == JFileChooser.APPROVE_OPTION) {
          File file = fc.getSelectedFile();



          d.openFile( file );

          //this is where a real application would open the file.
        } else {
        }
      }
    });

    //-- save diagram
    jsave.setBorder(border1);
    jsave.setIcon(imageSave);
    jsave.setFont(new Font("Tahoma", Font.PLAIN, 10));
    jsave.setVerticalTextPosition(AbstractButton.BOTTOM);
    jsave.setHorizontalTextPosition(AbstractButton.CENTER);
    jsave.setText("save");
    jsave.setCursor( new Cursor( Cursor.HAND_CURSOR ) );
    if ( mode == 2 ) jsave.setEnabled(false);
    jsave.addActionListener( new java.awt.event.ActionListener() {
      public void actionPerformed( ActionEvent e ) {
        jMenu_SaveDiagram_actionPerformed(e);
      }
    });

    //-- load diagram
    jload.setBorder(border1);
    jload.setToolTipText("Load network diagram from server ");
    jload.setIcon(imageLoad);
    jload.setFont(new Font("Tahoma", Font.PLAIN, 10));
    jload.setVerticalTextPosition(AbstractButton.BOTTOM);
    jload.setHorizontalTextPosition(AbstractButton.CENTER);
    jload.setText("load");
    jload.setCursor( new Cursor( Cursor.HAND_CURSOR ) );
    jload.addActionListener( new java.awt.event.ActionListener() {
      public void actionPerformed( ActionEvent e ) {
        jopen_actionPerformed(e);
      }
    });

    //-- Delete router
    jDelete.setBorder(border1);
    jDelete.setToolTipText("Delete Router");
    jDelete.setIcon(image2);
    jDelete.setFont(new Font("Tahoma", Font.PLAIN, 10));
    jDelete.setVerticalTextPosition(AbstractButton.BOTTOM);
    jDelete.setHorizontalTextPosition(AbstractButton.CENTER);
    jDelete.setText("delete router");
    jDelete.setCursor( new Cursor( Cursor.HAND_CURSOR ) );
    //-- check user Mode
    if (mode==2){
      jDelete.setEnabled(false);
      }
      else
      jDelete.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jDelete_actionPerformed(e);

      }
    });

    //-- delete wire
    jDelCable.setBorder(border1);
    jDelCable.setToolTipText("Delete Wire");
    jDelCable.setIcon(imageDelWire);
    jDelCable.setFont(new Font("Tahoma", Font.PLAIN, 10));
    jDelCable.setVerticalTextPosition(AbstractButton.BOTTOM);
    jDelCable.setHorizontalTextPosition(AbstractButton.CENTER);
    jDelCable.setText("delete wire");
    jDelCable.setCursor( new Cursor( Cursor.HAND_CURSOR ) );
     if ( mode == 2 ) jDelCable.setEnabled(false);
    jDelCable.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jDelCable_actionPerformed(e);
      }
    });

    //-- delete host
    jDelHost.setBorder(border1);
    jDelHost.setToolTipText("Delete Host");
    jDelHost.setIcon(imageDelHost);
    jDelHost.setFont(new Font("Tahoma", Font.PLAIN, 10));
    jDelHost.setVerticalTextPosition(AbstractButton.BOTTOM);
    jDelHost.setHorizontalTextPosition(AbstractButton.CENTER);
    jDelHost.setText("delete host");
    jDelHost.setCursor( new Cursor( Cursor.HAND_CURSOR ) );
     if ( mode == 2 ) jDelHost.setEnabled(false);
    jDelHost.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jDelHost_actionPerformed(e);
      }
    });

    //-- Feature of series
    jFeature.setBorder(border1);
    jFeature.setToolTipText("Router Feature");
    jFeature.setIcon(image3);
    jFeature.setFont(new Font("Tahoma", Font.PLAIN, 10));
    jFeature.setVerticalTextPosition(AbstractButton.BOTTOM);
    jFeature.setHorizontalTextPosition(AbstractButton.CENTER);
    jFeature.setText("feature");
    jFeature.setCursor( new Cursor( Cursor.HAND_CURSOR ) );
    jFeature.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jFeature_actionPerformed(e);
      }
    });

    //-- Step button
    jToggle_NextStep.setBorder(border1);
    jToggle_NextStep.setIcon( imageStep );
    jToggle_NextStep.setFont(new Font("Tahoma", Font.PLAIN, 10));
    jToggle_NextStep.setVerticalTextPosition(AbstractButton.BOTTOM);
    jToggle_NextStep.setHorizontalTextPosition(AbstractButton.CENTER);
    jToggle_NextStep.setText("run step");
    jToggle_NextStep.setCursor( new Cursor( Cursor.HAND_CURSOR ) );
    jToggle_NextStep.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jToggle_NextStep_actionPerformed(e);
      }
    });

    //-- Lesson button
    jLesson.setBorder(border1);
    jLesson.setToolTipText("learn with lessons");
    jLesson.setIcon(image5);
    jLesson.setFont(new Font("Tahoma", Font.PLAIN, 10));
    jLesson.setVerticalTextPosition(AbstractButton.BOTTOM);
    jLesson.setHorizontalTextPosition(AbstractButton.CENTER);
    jLesson.setText("lesson");
    jLesson.setCursor( new Cursor( Cursor.HAND_CURSOR ) );
    jLesson.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jLesson_actionPerformed(e);
      }
    });

    //-- Help button
    jHelp.setBorder(border1);
    jHelp.setToolTipText("Help");
    jHelp.setIcon(image6);
    jHelp.setFont(new Font("Tahoma", Font.PLAIN, 10));
    jHelp.setVerticalTextPosition(AbstractButton.BOTTOM);
    jHelp.setHorizontalTextPosition(AbstractButton.CENTER);
    jHelp.setText("manual");
    jHelp.setCursor( new Cursor( Cursor.HAND_CURSOR ) );
    jHelp.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jHelp_actionPerformed(e);
      }
    });

    jLogo.setBorder(border1);
    jLogo.setToolTipText("go to ISAG online");
    jLogo.setIcon(imageLogo);
    jLogo.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        Runtime ed = Runtime.getRuntime();
        try{
          ed.exec("explorer http://isag.ce.kmitl.ac.th");
        }
        catch(Exception e1){
          System.out.println("Error : "+e1);
     }
      }
    });

    //-- create Wire button ---------------------------------------------------------------------------
    //-- Serial button
    jWire.setBorder(border1);
    jWire.setToolTipText(" Serial wire ");
    jWire.setFont(new Font("Tahoma", Font.PLAIN, 10));
    jWire.setContentAreaFilled(false);
    jWire.setVerticalTextPosition(AbstractButton.BOTTOM);
    jWire.setHorizontalTextPosition(AbstractButton.CENTER);
    jWire.setText(" Serial ");
    jWire.setCursor( new Cursor( Cursor.HAND_CURSOR ) );
    jWire.setMnemonic(KeyEvent.VK_S);
    jWire.setFocusPainted(false);
    jWire.setIcon(image15);
     if ( mode == 2 ) jWire.setEnabled(false);
    jWire.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jWire_actionPerformed(e);
      }
    });

    //-- Ethernet
    jWire1.setIcon(image16);
    jWire1.setFocusPainted(false);
    jWire1.setToolTipText(" Ethernet wire ");
    jWire1.setBorder(border1);
    jWire1.setFont(new Font("Tahoma", Font.PLAIN, 10));
    jWire1.setContentAreaFilled(false);
    jWire1.setVerticalTextPosition(AbstractButton.BOTTOM);
    jWire1.setHorizontalTextPosition(AbstractButton.CENTER);
    jWire1.setText(" Ethernet ");
    jWire1.setCursor( new Cursor( Cursor.HAND_CURSOR ) );
    jWire1.setMnemonic(KeyEvent.VK_E);
     if ( mode == 2 ) jWire1.setEnabled(false);
    jWire1.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jWire1_actionPerformed(e);
      }
    });

    //-- Token ring
    jWire2.setFocusPainted(false);
    jWire2.setToolTipText(" Token Ring ");
    jWire2.setBorder(border1);
    jWire2.setFont(new Font("Tahoma", Font.PLAIN, 10));
    jWire2.setContentAreaFilled(false);
    jWire2.setVerticalTextPosition(AbstractButton.BOTTOM);
    jWire2.setHorizontalTextPosition(AbstractButton.CENTER);
    jWire2.setText(" Token Ring ");
    jWire2.setCursor( new Cursor( Cursor.HAND_CURSOR ) );
    jWire2.setMnemonic(KeyEvent.VK_T);
    jWire2.setIcon(image17);
    jWire2.setFocusPainted(false);
     if ( mode == 2 ) jWire2.setEnabled(false);
    jWire2.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jWire2_actionPerformed(e);
      }
    });

    //-- setting host button
    jButton1.setFont(new Font("Tahoma", Font.PLAIN, 10));
    jButton1.setContentAreaFilled(false);
    jButton1.setVerticalTextPosition(AbstractButton.BOTTOM);
    jButton1.setHorizontalTextPosition(AbstractButton.CENTER);
    jButton1.setCursor( new Cursor( Cursor.HAND_CURSOR ) );
    jButton1.setMnemonic(KeyEvent.VK_I);
    jButton1.setBorder(BorderFactory.createRaisedBevelBorder());
    jButton1.setIcon(image18);
    jButton1.setBorder(border1);
    jButton1.setText(" Host ");
    if( mode ==2 ) jButton1.setEnabled(false);
    jButton1.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jButton1_actionPerformed(e);
      }
    });

    //-- setting panel
    jPanel2.setBackground(Color.white);
    jPanel2.addMouseListener(new java.awt.event.MouseAdapter() {
      public void mouseClicked(MouseEvent e) {
      }
    });

    jPanel5.setBackground(Color.white);
    jPanel5.setLayout(xYLayout4);
    im.setLayout(xYLayout7);

    im.setFont(new java.awt.Font("Serif", 0, 13));  //-- im is Network diagram
    jPanel1.setBackground( Color.white );

    if ( mode == 2 ){
      jMenu1.setEnabled(false);
      jMenu_SaveDiagram.setEnabled(false);
      jopen.setEnabled(false);
    }

    //-- ToolBar
    jPanel3.setBackground(Color.white);
    jPanel3.setBorder(titledBorder13);
    jPanel3.setLayout(xYLayout6);
    jLogo1.setToolTipText("go to ISAG online");
    jLogo1.setBorder(border1);
    tb.add( Box.createRigidArea( new Dimension(5,5) ));tb.add( Box.createRigidArea( new Dimension(5,5) ));
    tb.add(jopen);
    tb.add(jload);
    tb.add(jsave);
    tb.addSeparator();
    tb.add(jDelete);
    tb.add(jDelCable);
    tb.add(jDelHost);
    tb.addSeparator();
    tb.add(jFeature);
    tb.add(jLesson);
    tb.add(jHelp);

    tb.add( Box.createRigidArea( new Dimension(5,5) ));tb.add( Box.createRigidArea( new Dimension(5,5) ));
    tb.add( Box.createRigidArea( new Dimension(5,5) ));tb.add( Box.createRigidArea( new Dimension(5,5) ));tb.add( Box.createRigidArea( new Dimension(5,5) ));tb.add( Box.createRigidArea( new Dimension(5,5) ));
    tb.add( Box.createRigidArea( new Dimension(5,5) ));
    //tb.add(jToggle_NextStep); tb.add( Box.createRigidArea( new Dimension(5,5) )); skiptb.add( Box.createRigidArea( new Dimension(5,5) ));tb.add( Box.createRigidArea( new Dimension(5,5) ));
    //tb.add(jLogo, null);

    if(check==0){

      jScrollPane2.getViewport().add(jPanel2, null);
    }
    contentPane.add(jPanel1,    new XYConstraints(2, 55, 130, 401)); //-- Device Panel
    contentPane.add(jScrollPane1, new XYConstraints(132, 55, 890, 445));
    jScrollPane1.getViewport().add(im, null); //-- network pane
    contentPane.add(jScrollPane2,  new XYConstraints(133, 500, 889, 195));
    contentPane.add(jPanel3,           new XYConstraints(5, 456, 127, 238));
    jPanel3.add(jLabel14,  new XYConstraints(10, 6, -1, 26));
    jPanel3.add(jWire2, new XYConstraints(0, 117, 95, 40));
    jPanel3.add(jButton1, new XYConstraints(-3, 165, 95, 54));
    jPanel3.add(jWire, new XYConstraints(7, 35, -1, 38));
    jPanel3.add(jWire1, new XYConstraints(9, 73, -1, 40));
    contentPane.add(tb,      new XYConstraints(-2, 1, 1021, -1)); //-- status pane


    //-- add menubar
    jMenuBar1.add(jMenu2);
    jMenuBar1.add(jMenu1);
    //jMenuBar1.add(jMenu4);
    jMenuBar1.add(jMenu5);
    jMenu2.add(jMenu_Open);
    jMenu2.add(jMenu_SaveDiagram);
    jMenu2.add(jMenu_adduser);
    jMenu2.add(jMenu_Traffic);

    jMenu1.add(jMenu_DelRouter);
    jMenu1.add(jMenu_DelInt);
    jMenu1.add(jMenu_DelHost);
    //-- add device pane
    jPanel1.add(jLabel8,  new XYConstraints(17, 0, 125, 30));
    jPanel1.add(jC13,  new XYConstraints(4, 138, 80, 55));
    jPanel1.add(jC02,  new XYConstraints(4, 83, 80, 55));
    jPanel1.add(jC01,  new XYConstraints(4, 28, 80, 55));
    jPanel1.add(jC15,  new XYConstraints(4, 248, 80, 55));
    jPanel1.add(jC14,  new XYConstraints(4, 193, 80, 55));
    jPanel1.add(jIdeal,  new XYConstraints(4, 303, 80, 55));
    //-- setting network pane
    im.setSize(new Dimension(600,500));
    im.setBackground(Color.white );
    im.setVisible(true);
    jMenu4.add(jMenu_SingleMode);
    jMenu4.add(jMenu_NormalMode);
    jMenu5.add(jMenu_Command);
    jMenu5.addSeparator();
    jMenu5.add(jMenu_License);
    jMenu5.add(jMenu_Aboutus);
    this.setJMenuBar(jMenuBar1);
    this.setIconImage(Toolkit.getDefaultToolkit().createImage(Frame3.class.getResource("bar.png")));
    this.setResizable(true);
    jMenu_SaveDiagram.add(jMenuItem1);
   }

   //-- Implement action listener -------------------------------------------------------------------------

   //-- Overridden so we can exit when window is closed
   protected void processWindowEvent(WindowEvent e) {
     super.processWindowEvent(e);
     if (e.getID() == WindowEvent.WINDOW_CLOSING) {
       // System.exit(0);
     }
   }

   //-- new router
   void jC01_actionPerformed(ActionEvent e) {
    Series= 1;
    CreateRouter(Series);
   }

   void jC02_actionPerformed(ActionEvent e) {
     Series= 2;
     CreateRouter(Series);
   }

   void jC13_actionPerformed(ActionEvent e) {
     Series = 3;
     CreateRouter(Series);

   }

   void jC14_actionPerformed(ActionEvent e) {
     Series= 4;
     CreateRouter(Series);
   }

   void jC15_actionPerformed(ActionEvent e) {
     Series= 5;
     CreateRouter(Series);
   }

   void jIdeal_actionPerformed(ActionEvent e) {
     Series= 6;
     CreateRouter(Series);
   }

   //-- Create new router ------------------------------------------------------------------------
   public void CreateRouter(int series){
   try {
   FileIO.load=1;
   NewRouterInt nr = (NewRouterInt)Naming.lookup("//"+serverName+"/NewRouterService");
   System.out.println("NewRoutercomplete0....");
   nr.constructor(series);

   RouterImg rimg = new RouterImg(series);
   ImageMotion.routerImg.addElement(rimg);
   int size = nr.getvRouter().size();
   Vector vR = new Vector();
   vR = nr.getvRouter();
   nr.setvRouter();;
   int type = nr.gettype();
   RouterImg rimg1 = new RouterImg(type);
   String rname = nr.getrname();
   Router r = new Router();
   r = nr.getRouter();
   FrameR fr = new FrameR(r,rname);
   fr.setIconImage(rimg1.getImge());
   Frame3.vFrame.addElement(fr);
   System.out.println("Routersize:"+NewRouter.vRouter.size());
   // new status
   StatusPanelInt st = (StatusPanelInt)Naming.lookup("//"+serverName+"/SPservice");
   st.NewStatus();
   repaint();
   System.out.println("rImgsize_2:"+im.routerImg.size());
   //Vector vs = new Vector();
  // vs = st.getStatus();
   jScrollPane2.getViewport().add(st.getPanel1(),BorderLayout.SOUTH);
   System.out.println("NewRoutercomplete2....");
  }
  catch(java.rmi.UnmarshalException ex1) {
   System.out.println("Exception occured: " + ex1);
   System.exit(0);
    }

   catch(java.lang.NullPointerException  ex2) {
   System.out.println("Exception occured: " + ex2);
   System.exit(0);
    }
    catch(Exception   ex3) {
   System.out.println("Exception occured: " + ex3);
   System.exit(0);
    }
  }
   //-- implement action listener
   void jopen_actionPerformed(ActionEvent e) {
     Open_Diagram();

   }
   public void Open_Diagram()
   {
    // if( opened ==0)
    // {
      try {
        // read startup
       NewRouterInt nr = (NewRouterInt)Naming.lookup("//"+serverName+"/NewRouterService");
       CommandInt c1 = (CommandInt)Naming.lookup("//"+serverName+"/CommandService");
       StatusPanelInt st = (StatusPanelInt)Naming.lookup("//"+serverName+"/SPservice");
       System.out.print("RSIZE****"+nr.getvRouter().size());
       if((nr.getvRouter().size()== 0)){

       System.out.print("Hostname:------"+serverName);
       //c1.constructor();

       }
       FileIO d = new FileIO();
       d.loadFile();
       repaint();


      System.out.println("VRouter:"+nr.getvRouter().size());
     // if(!st.getshow()){
       if(nr.getvRouter().size() != 0)
       {
         int size = nr.getvRouter().size();

         for(int i=0;i<nr.getvRouter().size();i++)
         {
           //nr.setvFrame(size);// show frameR

           jScrollPane2.getViewport().add(st.getPanel1(),BorderLayout.SOUTH);
           check = 1;
         }
       }

       System.out.println("Commandcomplete....");
  }
    catch(Exception ex1) {
    System.out.println("Exception occured: " + ex1);
      }
     if(getSelectMode()==2){
       ImageMotion.routerImg.removeAllElements();
       ImageMotion.vWire.removeAllElements();
       ImageMotion.wireImg.removeAllElements();
       Host.vHost.removeAllElements();
       d.loadFile();
       repaint();

     }//end if
  }

   // delete Router
   void jDelete_actionPerformed(ActionEvent e) {

     ImageMotion im = new ImageMotion();
     im.Delete_Router();
     repaint();

   }

   void jFeature_actionPerformed(ActionEvent e) {
     DialogProperty d = new DialogProperty();
     d.setVisible(true);
   }

   void jNetstep_actionPerformed(ActionEvent e) {
     NewRouter.Next_Step();

   }

   void jLesson_actionPerformed(ActionEvent e) {

     Runtime ed = Runtime.getRuntime();
     try{
       ed.exec("explorer .\\tutorials\\index.html");
     }
     catch(Exception e1){
       System.out.println("Error : "+e1);
     }
   }

   void jHelp_actionPerformed(ActionEvent e) {
     Runtime ed = Runtime.getRuntime();
     try{
       ed.exec("explorer .\\tutorials\\manual.pdf");
     }
     catch(Exception e1){
       System.out.println("Error : "+e1);
     }
   }
   // show new status that remove
   static void ShowNewStatus(JPanel panel)
   {
     System.out.println("Show Status");
     jScrollPane2.getViewport().add(panel,BorderLayout.SOUTH);
     new ImageMotion();
   }
   public void setFrameTitle(String name,int index) throws java.rmi.RemoteException{
   FrameR fr =(FrameR)Frame3.vFrame.elementAt(index);
   fr.setTitle(name);
  }
   // set select mode
   static void setSelectMode(int mode){
     SelectMode=mode;
   }
   // get select mode
   static int getSelectMode(){
     return SelectMode;
   }
   static JScrollPane getScrollpane()
   {
     return jScrollPane2;
   }

   // ethernet
   void jWire1_actionPerformed(ActionEvent e) {
     Create_Wire(1);
   }
   // serial
   void jWire_actionPerformed(ActionEvent e) {
     Create_Wire(2);
   }
   // token
   void jWire2_actionPerformed(ActionEvent e) {
     Create_Wire(3);
   }
   public void setStatus(JPanel jp)throws java.rmi.RemoteException
   {
     System.out.println("setstatus");
     jScrollPane2.getViewport().add(jp,BorderLayout.SOUTH);
   }
   public void setIndex(int index)throws java.rmi.RemoteException
   {
       RouterConsole rcon =(RouterConsole)Frame3.vConsole.elementAt(index);
       FrameR fr = (FrameR)Frame3.vFrame.elementAt(index);
       fr.dispose();

   }
   public void setCost(int  s_index,int  d_index,int cost)throws java.rmi.RemoteException
  {
     //-- Set wire cost
        for(int j=0; j < ImageMotion.vWire.size() ; j++ )
        {
          //-- get each wire
          Wire w = (Wire)ImageMotion.vWire.elementAt(j);
          //-- get router connected wire
          int r1 = w.getIndexRouter1();
          int r2 = w.getIndexRouter2();
          if((r1==s_index) || (r2==s_index))
          {
            if((r1==d_index) || (r2==d_index))
            {
              System.out.print("Cost*******:"+w.getCost()+"\n");
              w.setCost(cost);
              repaint();
            }//end if
          }//end if
        }//end for
   }
   public void showdebugrip(String output,int index) throws java.rmi.RemoteException
   {
     try {
       NewRouterInt nr = (NewRouterInt)Naming.lookup("//"+serverName+"/NewRouterService");
       RouterConsole rcon =(RouterConsole)Frame3.vConsole.elementAt(index);
       Router r = (Router)nr.getvRouter().elementAt(index);
       rcon.getJTextArea().append("\n"+output);
       //rcon.enterKey(r);
      }
     catch(Exception e)
     {
       e.printStackTrace();
     }
   }
   public void stopdebugrip(int index) throws java.rmi.RemoteException
   {

     try {
       NewRouterInt nr = (NewRouterInt)Naming.lookup("//"+serverName+"/NewRouterService");
       RouterConsole rcon =(RouterConsole)Frame3.vConsole.elementAt(index);
       Router r = (Router)nr.getvRouter().elementAt(index);
       rcon.getJTextArea().append("\n");
       rcon.enterKey(r);
      }
     catch(Exception e)
     {
       e.printStackTrace();
     }
   }
   public void showprompt(int index) throws java.rmi.RemoteException
   {

     try {
       NewRouterInt nr = (NewRouterInt)Naming.lookup("//"+serverName+"/NewRouterService");
       RouterConsole rcon =(RouterConsole)Frame3.vConsole.elementAt(index);
       Router r = (Router)nr.getvRouter().elementAt(index);
       rcon.getJTextArea().append("\n");
      rcon.enterKey(r);
     }
     catch(Exception e)
     {
       e.printStackTrace();
     }
   }
   static void setHostname(String hostname){

     serverName= hostname;
   }

   static String getHostname(){

     return serverName;
   }

   public void Create_Wire(int type)
   {
     if (ImageMotion.vWire.size() < 80){
       boolean dup = true;
       boolean found = false;
       String name="";
       int i=1;
       while(dup){
         name = "Wire" + i;
         found = false;
         for(int a=0; a < ImageMotion.vWire.size(); a++){
           String alreadyName = ((Wire)ImageMotion.vWire.elementAt(a)).getWirename();
           if (alreadyName.equalsIgnoreCase(name)){
             found = true;
           }//end if
         }//end for
         i++;
         dup = found;
       }//end while
       Wire w = new Wire(name);
       w.setType(type);
       WireImage wimg = new WireImage(type);
       ImageMotion.wireImg.addElement(wimg);
       ImageMotion.vWire.addElement(w);
       repaint();
     }
   }
   void jMenu_Open_actionPerformed(ActionEvent e) {
     Open_Diagram();
   }

   void jMenu_Traffic_actionPerformed(ActionEvent e) {
     Traffic t = new Traffic();
     t.setVisible(true);
   }

   void jMenu_adduser_actionPerformed(ActionEvent e) {
     PasswordDialog d = new PasswordDialog();
     d.setVisible(true);

   }

   void jMenu_Feature_actionPerformed(ActionEvent e) {
     DialogProperty d = new DialogProperty();
     d.setVisible(true);
   }
   void jMenu_SingleMode_actionPerformed(ActionEvent e) {
     String serverName = "";
     try {
       serverName = java.net.InetAddress.getLocalHost().getHostName();
     }
     catch(Exception ex) { ex.printStackTrace();  }

     try {
       NewRouterInt nr = (NewRouterInt)Naming.lookup("//"+serverName+"/NewRouterService");
       nr.setsingleMode(true);
     }
     catch(Exception ex2)
     {
       ex2.printStackTrace();
     }
   }
   void jMenu_NormalMode_actionPerformed(ActionEvent e) {
     String serverName = "";
     try {
       serverName = java.net.InetAddress.getLocalHost().getHostName();
     }
     catch(Exception ex) { ex.printStackTrace();  }

     try {
       NewRouterInt nr = (NewRouterInt)Naming.lookup("//"+serverName+"/NewRouterService");
       nr.setsingleMode(false);
     }
     catch(Exception ex2)
     {
       ex2.printStackTrace();
     }
   }
   // new host
   void jButton1_actionPerformed(ActionEvent e) {
     if (Host.vHost.size() < 60){
       boolean dup = true;
       boolean found = false;
       String name="";
       int i=1;
       while(dup){
         name = "Host" + i;
         found = false;
         for(int a=0; a < Host.vHost.size(); a++){
           String alreadyName = ((Host)Host.vHost.elementAt(a)).getHostName();

           if (alreadyName.equalsIgnoreCase(name)){
             found = true;
           }//end if
         }//end for
         i++;
         dup = found;
       }//end while
       Host host = new Host(name);

       Host.vHost.addElement(host);

       repaint();
     }

   }

   void jMenu_Aboutus_actionPerformed(ActionEvent e) {
     Runtime ed = Runtime.getRuntime();
          try{
            ed.exec("explorer .\\tutorials\\main.html");
          }
          catch(Exception e1){
            System.out.println("Error : "+e1);
     }
   }

   void jMenu_Command_actionPerformed(ActionEvent e) {
     Runtime ed = Runtime.getRuntime();
     try{
       ed.exec("explorer .\\tutorials\\command.html");
     }
     catch(Exception e1){
       System.out.println("Error : "+e1);
     }
   }

   void jMenu_License_actionPerformed( ActionEvent e ) {
     Runtime ed = Runtime.getRuntime();
     try{
       ed.exec("explorer .\\tutorials\\license.html");
     }
     catch(Exception e1){
       System.out.println("Error : "+e1);
     }
   }

   void jDelCable_actionPerformed(ActionEvent e) {
     ImageMotion im = new ImageMotion();
     im.Delete_Wire();
     repaint();

   }

   void jDelHost_actionPerformed(ActionEvent e) {
     ImageMotion im = new ImageMotion();
     im.Delete_Host();
     repaint();
   }

   void jMenu_DelRouter_actionPerformed(ActionEvent e) {
     ImageMotion im = new ImageMotion();
     im.Delete_Router();
     repaint();

   }

   void jMenu_DelInt_actionPerformed(ActionEvent e) {
     ImageMotion im = new ImageMotion();
     im.Delete_Wire();
     repaint();
   }

   void jMenu_DelHost_actionPerformed(ActionEvent e) {
     ImageMotion im = new ImageMotion();
     im.Delete_Host();
     repaint();

   }

   //-- save in the same name
   void jMenu_SaveDiagram_actionPerformed(ActionEvent e) {
     System.out.println("save File : " + FileIO.fileName + " Path " + FileIO.filePath );
     if(FileIO.fileName.equalsIgnoreCase("")){
       saveAsFile(e);
     }
     else d.saveFile();
   }
   void saveAsFile( ActionEvent e ){

     final JFileChooser fc = new JFileChooser();
     int returnVal = fc.showSaveDialog(Frame3.this);
     File file ;

     if (returnVal == JFileChooser.APPROVE_OPTION) {

       file = fc.getSelectedFile();

       d.saveAsFile( file.getParent() , file.getName() );
       System.out.println( "saveAs File " + file.getName() +  " Path " + file.getParent() );
     } else {
     }
   }

   void jToggle_NextStep_actionPerformed(ActionEvent e) {
     String serverName = "";
     try {
       serverName = java.net.InetAddress.getLocalHost().getHostName();
     }
     catch(Exception ex) { ex.printStackTrace();  }

     try {
       NewRouterInt nr = (NewRouterInt)Naming.lookup("//"+serverName+"/NewRouterService");
       nr.nextstep();
     }
     catch(Exception ex2)
     {
       ex2.printStackTrace();
     }
   }
}