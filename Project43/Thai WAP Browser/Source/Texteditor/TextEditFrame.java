//Title:      TextEditor
//Version:
//Copyright:  Copyright (c) 1999
//Author:     T.KOMSANT
//Company:    ICL
//Description:TextEditor
package Texteditor;
import java.io.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import javax.swing.text.*;
import javax.swing.border.*;
import javax.swing.colorchooser.*;
import javax.swing.filechooser.*;
import com.borland.dbswing.*;
import javax.swing.text.html.*;
import javax.swing.event.*;
import java.net.*;
import java.io.OutputStreamWriter;
import java.lang.*;
import java.util.*;
import java.lang.Object;
import java.awt.font.*;
import java.awt.geom.*;
import java.awt.print.*;
import java.text.*;
import java.util.zip.*;
import java.util.jar.*;
import javax.servlet.*;
import javax.servlet.http.*;


//-------------


import com.borland.jbcl.control.DecoratedFrame;
import com.borland.jbcl.layout.*;

//-------------

public class TextEditFrame extends  JFrame  implements WindowListener     { //   ,   DecoratedFrame
  int i=0,error=0,check_close_tag=0,no_card=-1,card=0,open_tag=0,hist=-1;
	int tag_wml=0;
	int tag_head=0;
	int tag_template=0,tag_td=0,tag_tr=0,tag_table=0;
	int tag_card=0;
	int tag_p=0,tag_postfield=0,tag_prev=0;
	int tag_a=0,tag_anchor=0,has_tag_a=0;
	int tag_b=0,tag_big=0,tag_br=0;
	int tag_do=0;
	int tag_em=0;
	int tag_fieldset=0;
	int tag_go=0;
	int tag_i=0,tag_img=0;
	int tag_refresh=0;
	int tag_onevent=0,tag_optgroup=0,tag_option=0;
	int tag_select=0,tag_small=0,tag_strong=0;
  int tag_u=0,special=0,set_back=0,set_prev=0;
  int go_down,go_up,load_pic=0;
  int intp;
  String Temp_str="",Str_www="",host="",Tmp_url,Home_url="";
  String Label_do,Href_go,Method_go;
  URL u;
  static String get_str;
  public int num_card=0,num_card1=0;
  public int num_link=0,num_link1=0;
  private final static int POINTS_PER_INCH = 72;

  Process process;
  FileOutputStream Pics;
  FileReader HomeFile;
  HttpServletResponse Res;
  HttpServletRequest Req;

  FileOutputStream FileLink[] = new FileOutputStream[10];
  String  StrFile[] = {"C:/temph/tmp0.html","C:/temph/tmp1.html",
                       "C:/temph/tmp2.html","C:/temph/tmp3.html",
                       "C:/temph/tmp4.html","C:/temph/tmp5.html",
                       "C:/temph/tmp6.html","C:/temph/tmp7.html",
                       "C:/temph/tmp8.html","C:/temph/tmp9.html"};
  String History[];
  String Card[][]=new String[10][3];      // keep neat card to go
  int Link_pos[][][]=new int[10][20][4]; //  keep position of Link to drag
  String Link_a[][]=new String[10][20];
  int count_char,count_link,count_down,count_input;
  String Input_value[][]=new String[10][10];

  JMenuBar menuBar1 = new JMenuBar();
  JMenu menuFile = new JMenu();
  JMenuItem menuFileExit = new JMenuItem();
  JMenu menuHelp = new JMenu();
  JMenuItem menuHelpAbout = new JMenuItem();
  JToolBar toolBar = new JToolBar();
  JButton jButton2 = new JButton();
  JButton jButton3 = new JButton();
  ImageIcon image1;
  ImageIcon image2;
  ImageIcon image3;
  JLabel statusBar = new JLabel();
  JScrollPane jScrollPane1 = new JScrollPane();
  JTextArea jTextArea1 = new JTextArea();
  JMenuItem jMenuItem1 = new JMenuItem();
  JMenuItem jMenuItem2 = new JMenuItem();
  JMenuItem jMenuItem3 = new JMenuItem();
  JMenuItem jMenuItem4 = new JMenuItem();
  JMenu jMenu1 = new JMenu();
  FontChooser fontChooser1 = new FontChooser();
  JColorChooser jColorChooser1 = new JColorChooser();
  JFileChooser jFileChooser1 = new JFileChooser();
  String currFileName = null;
  boolean dirty = false;
  JOptionPane jOptionPane1 = new JOptionPane();
  Document document1;
  DBTextDataBinder dBTextDataBinder1 = new DBTextDataBinder();
  JButton jButton1 = new JButton();
  JToolBar jToolBar1 = new JToolBar();
  JButton jButton4 = new JButton();
  JButton jButton5 = new JButton();
  JLabel jLabel1 = new JLabel();
  JTextField jTextField1 = new JTextField();
  JButton jButton6 = new JButton();
  JButton jButton7 = new JButton();
  JButton jButton8 = new JButton();
  JButton jButton9 = new JButton();
  JButton jButton10 = new JButton();
  JButton jButton11 = new JButton();
  JButton jButton12 = new JButton();
  JButton jButton13 = new JButton();
  JButton jButton14 = new JButton();
  JButton jButton15 = new JButton();
  JButton jButton17 = new JButton();
  JButton jButton18 = new JButton();
  JButton jButton19 = new JButton();
  JButton jButton20 = new JButton();
  JButton jButton21 = new JButton();
  JButton jButton16 = new JButton();
  JLabel jLabel2 = new JLabel();
  JButton jButton23 = new JButton();
  JButton jButton25 = new JButton();
  JButton jButton26 = new JButton();
  JButton jButton27 = new JButton();
  JButton jButton28 = new JButton();
  JButton jButton29 = new JButton();
  JButton jButton30 = new JButton();
  JButton jButton31 = new JButton();
  JButton jButton32 = new JButton();
  JButton jButton33 = new JButton();
  JButton jButton34 = new JButton();
  JButton jButton35 = new JButton();
  JButton jButton36 = new JButton();
  JButton jButton37 = new JButton();
  JButton jButton38 = new JButton();
  JButton jButton39 = new JButton();
  JButton jButton40 = new JButton();
  JButton jButton22 = new JButton();
  JButton jButton24 = new JButton();
  JTextArea jTextArea4 = new JTextArea();
  JButton jButton42 = new JButton();
  JButton jButton43 = new JButton();
  JButton jButton44 = new JButton();
  JScrollPane jScrollPane2 = new JScrollPane();
  JEditorPane jEditorPane1 = new JEditorPane();
  JTextArea left = new JTextArea();
  JTextArea right = new JTextArea();
  //----------script
  Process processes;
	int state = 0;
	int loopCount=0;
	//String loopCommand = "";
	boolean swap = false;
	String script;
//	TimerAgent agent;
	int count;
	int countIf = 0;
	boolean ifFact = false;
	Hashtable variable = new Hashtable();
	Vector statementDone = new Vector();
	Vector statementNotDone = new Vector();
	Vector commandInLoop = new Vector();

	Vector tmpStatementDone = new Vector();
	Vector tmpCommandInLoop = new Vector();

	//boolean repeatDone = false;
	boolean whileFact=false;
	boolean repeatInLoop = false;
	boolean repeatFact = false;
	int countWhile = 0;
	boolean ifNotDone = false;
	String getStatement = "";
  JButton jButton46 = new JButton();
  JButton jButton47 = new JButton();
  JMenuItem jMenuItem8 = new JMenuItem();
  JMenuItem jMenuItem10 = new JMenuItem();
  JMenuItem jMenuItem11 = new JMenuItem();
  JMenuItem jMenuItem12 = new JMenuItem();
  JMenu jMenu2 = new JMenu();
  JMenuItem jMenuItem9 = new JMenuItem();
  JMenuItem jMenuItem5 = new JMenuItem();
  JMenuItem jMenuItem6 = new JMenuItem();
  JMenuItem jMenuItem7 = new JMenuItem();
  JButton jButton41 = new JButton();
  JTextArea Input = new JTextArea();
  //--------------
  //Construct the frame
  public TextEditFrame() {
    enableEvents(AWTEvent.WINDOW_EVENT_MASK);
    try  {
      jbInit();
      updateCaption();

    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }

  //Component initialization
  private void jbInit() throws Exception  {
    //jEditorPane1.setBounds(new Rectangle(28, 39, 511, 399));
    image1 = new ImageIcon(Texteditor.TextEditFrame.class.getResource("openFile.gif"));
    image2 = new ImageIcon(Texteditor.TextEditFrame.class.getResource("closeFile.gif"));
    image3 = new ImageIcon(Texteditor.TextEditFrame.class.getResource("help.gif"));
    document1 = jTextArea1.getDocument();
    try {
      process = Runtime.getRuntime().exec("command.com /c "+"md C:\\temph" +"\n");
    }catch (IOException errc){System.out.println(errc+"Errcommand");}
    this.getContentPane().setLayout(null);
    //this.setLayout(null);
    this.setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE);
    //this.setDisposeOnClose(true);
    addWindowListener(this);
    this.setSize(new Dimension(1008, 734));
    this.setTitle("·«Áæ∫√“«‡´Õ√Ï¿“…“‰∑¬");
    statusBar.setText(" ");
    statusBar.setBounds(new Rectangle(30, 663, 392, 17));
    menuFile.setText("File");
    menuFile.addActionListener(new TextEditFrame_menuFile_actionAdapter(this));
    menuFileExit.setText("Exit");
    menuFileExit.addActionListener(new TextEditFrame_menuFileExit_ActionAdapter(this));
    menuHelp.setText("Help");
    menuHelp.addActionListener(new TextEditFrame_menuHelp_actionAdapter(this));
    menuHelpAbout.setText("About");
    menuHelpAbout.addActionListener(new TextEditFrame_menuHelpAbout_ActionAdapter(this));
    jButton2.setIcon(image2);
    jButton2.addActionListener(new TextEditFrame_jButton2_actionAdapter(this));
    jButton2.setToolTipText("Save File");
    jButton3.setIcon(image3);
    jButton3.addActionListener(new TextEditFrame_jButton3_actionAdapter(this));
    jButton3.setToolTipText("Help");
    jTextArea1.setLineWrap(true);
    jTextArea1.setWrapStyleWord(true);
    jMenuItem1.setText("New");
    jMenuItem1.addActionListener(new TextEditFrame_jMenuItem1_actionAdapter(this));
    jMenuItem2.setText("Open");
    jMenuItem2.addActionListener(new TextEditFrame_jMenuItem2_actionAdapter(this));
    jMenuItem3.setText("Save");
    jMenuItem3.addActionListener(new TextEditFrame_jMenuItem3_actionAdapter(this));
    jMenuItem4.setText("Save AS");
    jMenuItem4.addActionListener(new TextEditFrame_jMenuItem4_actionAdapter(this));
    jMenu1.setText("Edit");
    jMenu1.addActionListener(new TextEditFrame_jMenu1_actionAdapter(this));
    fontChooser1.setFrame(this);
    fontChooser1.setTitle("Font");
    fontChooser1.setAvailableFontSizes(new String[] {"18"});

    document1.addDocumentListener(new TextEditFrame_document1_documentAdapter(this));
    dBTextDataBinder1.setJTextComponent(jTextArea1);
    dBTextDataBinder1.setEnableFileLoading(false);
    dBTextDataBinder1.setEnableFileSaving(false);
    jButton1.setToolTipText("Open File");
    jButton1.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("openFile.gif")));
    jButton1.addActionListener(new TextEditFrame_jButton1_actionAdapter(this));
    jScrollPane1.setBounds(new Rectangle(40, 90, 598, 572));
    toolBar.setBounds(new Rectangle(17, 4, 659, 26));
    jToolBar1.setBounds(new Rectangle(15, 30, 661, 27));
    jButton4.setToolTipText("<br/>");
    jButton4.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("br.gif")));
    jButton4.addActionListener(new TextEditFrame_jButton4_actionAdapter(this));
    jButton5.setToolTipText("comment");
    jButton5.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("comment.gif")));
    jButton5.addActionListener(new TextEditFrame_jButton5_actionAdapter(this));
    jLabel1.setText("Address");
    jLabel1.setBounds(new Rectangle(6, 56, 83, 22));
    jTextField1.setText("http://161.246.5.99:8080/test21.wml");
    jTextField1.setBounds(new Rectangle(98, 60, 282, 21));
    jTextField1.addActionListener(new TextEditFrame_jTextField1_actionAdapter(this));
    jButton6.setToolTipText("card");
    jButton6.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("card.gif")));
    jButton6.addActionListener(new TextEditFrame_jButton6_actionAdapter(this));
    jButton18.setToolTipText("<strong>");
    jButton18.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("strong.gif")));
    jButton18.addActionListener(new TextEditFrame_jButton18_actionAdapter(this));
    jButton7.setToolTipText("<prev/>");
    jButton7.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("prev.gif")));
    jButton7.addActionListener(new TextEditFrame_jButton7_actionAdapter(this));
    jButton21.setToolTipText("<input>");
    jButton21.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("input.gif")));
    jButton21.addActionListener(new TextEditFrame_jButton21_actionAdapter(this));
    jButton20.setToolTipText("<select>");
    jButton20.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("select.gif")));
    jButton20.addActionListener(new TextEditFrame_jButton20_actionAdapter(this));
    jButton19.setToolTipText("<img>");
    jButton19.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("img.gif")));
    jButton19.addActionListener(new TextEditFrame_jButton19_actionAdapter(this));
    jButton17.setToolTipText("<i>");
    jButton17.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("italic.gif")));
    jButton17.addActionListener(new TextEditFrame_jButton17_actionAdapter(this));
    jButton15.setToolTipText("<u>");
    jButton15.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("underline.gif")));
    jButton15.addActionListener(new TextEditFrame_jButton15_actionAdapter(this));
    jButton14.setToolTipText("<big>");
    jButton14.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("big.gif")));
    jButton14.addActionListener(new TextEditFrame_jButton14_actionAdapter(this));
    jButton13.setToolTipText("<small>");
    jButton13.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("small.gif")));
    jButton13.addActionListener(new TextEditFrame_jButton13_actionAdapter(this));
    jButton8.setToolTipText("<table>");
    jButton8.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("table.gif")));
    jButton8.addActionListener(new TextEditFrame_jButton8_actionAdapter(this));
    jButton9.setToolTipText("<timer>");
    jButton9.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("timer.gif")));
    jButton9.addActionListener(new TextEditFrame_jButton9_actionAdapter(this));
    jButton10.setToolTipText("<do>");
    jButton10.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("do.gif")));
    jButton10.addActionListener(new TextEditFrame_jButton10_actionAdapter(this));
    jButton11.setToolTipText("<template>");
    jButton11.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("template.gif")));
    jButton11.addActionListener(new TextEditFrame_jButton11_actionAdapter(this));
    jButton12.setToolTipText("<go>");
    jButton12.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("go.gif")));
    jButton12.addActionListener(new TextEditFrame_jButton12_actionAdapter(this));
    jButton16.setToolTipText("<b>");
    jButton16.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("bold.gif")));
    jButton16.addActionListener(new TextEditFrame_jButton16_actionAdapter(this));


    jLabel2.setHorizontalTextPosition(SwingConstants.CENTER);
    jLabel2.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("gen_on1.gif")));
    jLabel2.setBounds(new Rectangle(709, 99, 272, 568));
    jButton23.setBorderPainted(false);
    jButton23.setContentAreaFilled(false);
    jButton23.setFocusPainted(false);
    jButton23.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("1n.gif")));
    jButton23.setRolloverEnabled(true);
    jButton23.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("1nr.gif")));
    jButton23.setBounds(new Rectangle(746, 484, 52, 30));
    jButton23.addActionListener(new TextEditFrame_jButton23_actionAdapter(this));
    jButton25.setBorderPainted(false);
    jButton25.setContentAreaFilled(false);
    jButton25.setFocusPainted(false);
    jButton25.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("3n.gif")));
    jButton25.setRolloverEnabled(true);
    jButton25.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("3nr.gif")));
    jButton25.setBounds(new Rectangle(871, 485, 49, 30));
    jButton25.addActionListener(new TextEditFrame_jButton25_actionAdapter(this));
    jButton26.setBorderPainted(false);
    jButton26.setContentAreaFilled(false);
    jButton26.setFocusPainted(false);
    jButton26.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("4n.gif")));
    jButton26.setRolloverEnabled(true);
    jButton26.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("4nr.gif")));
    jButton26.setBounds(new Rectangle(745, 522, 50, 28));
    jButton26.addActionListener(new TextEditFrame_jButton26_actionAdapter(this));
    jButton27.setBorderPainted(false);
    jButton27.setContentAreaFilled(false);
    jButton27.setFocusPainted(false);
    jButton27.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("5n.gif")));
    jButton27.setRolloverEnabled(true);
    jButton27.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("5nr.gif")));
    jButton27.setBounds(new Rectangle(808, 521, 50, 28));
    jButton27.addActionListener(new TextEditFrame_jButton27_actionAdapter(this));
    jButton28.setBorderPainted(false);
    jButton28.setContentAreaFilled(false);
    jButton28.setFocusPainted(false);
    jButton28.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("6n.gif")));
    jButton28.setRolloverEnabled(true);
    jButton28.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("6nr.gif")));
    jButton28.setBounds(new Rectangle(871, 521, 50, 29));
    jButton28.addActionListener(new TextEditFrame_jButton28_actionAdapter(this));
    jButton29.setBorderPainted(false);
    jButton29.setContentAreaFilled(false);
    jButton29.setFocusPainted(false);
    jButton29.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("7n.gif")));
    jButton29.setRolloverEnabled(true);
    jButton29.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("7nr.gif")));
    jButton29.setBounds(new Rectangle(743, 557, 53, 28));
    jButton29.addActionListener(new TextEditFrame_jButton29_actionAdapter(this));
    jButton30.setBorderPainted(false);
    jButton30.setContentAreaFilled(false);
    jButton30.setFocusPainted(false);
    jButton30.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("8n.gif")));
    jButton30.setRolloverEnabled(true);
    jButton30.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("8nr.gif")));
    jButton30.setBounds(new Rectangle(807, 555, 50, 32));
    jButton30.addActionListener(new TextEditFrame_jButton30_actionAdapter(this));
    jButton31.setBorderPainted(false);
    jButton31.setContentAreaFilled(false);
    jButton31.setFocusPainted(false);
    jButton31.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("9n.gif")));
    jButton31.setRolloverEnabled(true);
    jButton31.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("9nr.gif")));
    jButton31.setBounds(new Rectangle(871, 554, 52, 32));
    jButton31.addActionListener(new TextEditFrame_jButton31_actionAdapter(this));
    jButton32.setBorderPainted(false);
    jButton32.setContentAreaFilled(false);
    jButton32.setFocusPainted(false);
    jButton32.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("star-n.gif")));
    jButton32.setRolloverEnabled(true);
    jButton32.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("star-nr.gif")));
    jButton32.setBounds(new Rectangle(744, 590, 52, 31));
    jButton32.addActionListener(new TextEditFrame_jButton32_actionAdapter(this));
    jButton33.setBorderPainted(false);
    jButton33.setContentAreaFilled(false);
    jButton33.setFocusPainted(false);
    jButton33.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("home1.gif")));
    jButton33.setRolloverEnabled(true);
    jButton33.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("homer.gif")));
    jButton33.setBounds(new Rectangle(736, 446, 43, 28));
    jButton33.addActionListener(new TextEditFrame_jButton33_actionAdapter(this));
    jButton34.setBorderPainted(false);
    jButton34.setContentAreaFilled(false);
    jButton34.setFocusPainted(false);
    jButton34.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("menu1.gif")));
    jButton34.setRolloverEnabled(true);
    jButton34.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("menur.gif")));
    jButton34.setBounds(new Rectangle(786, 445, 46, 28));
    jButton35.setBorderPainted(false);
    jButton35.setContentAreaFilled(false);
    jButton35.setFocusPainted(false);
    jButton35.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("clr1.gif")));
    jButton35.setRolloverEnabled(true);
    jButton35.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("clrr.gif")));
    jButton35.setBounds(new Rectangle(837, 446, 41, 26));
    jButton35.addActionListener(new TextEditFrame_jButton35_actionAdapter(this));
    jButton36.setBorderPainted(false);
    jButton36.setContentAreaFilled(false);
    jButton36.setFocusPainted(false);
    jButton36.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("back1.gif")));
    jButton36.setRolloverEnabled(true);
    jButton36.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("backr.gif")));
    jButton36.setBounds(new Rectangle(888, 445, 41, 29));
    jButton36.addActionListener(new TextEditFrame_jButton36_actionAdapter(this));
    jButton37.setBorderPainted(false);
    jButton37.setContentAreaFilled(false);
    jButton37.setFocusPainted(false);
    jButton37.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("send1.gif")));
    jButton37.setRolloverEnabled(true);
    jButton37.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("sendr.gif")));
    jButton37.setBounds(new Rectangle(729, 397, 49, 37));
    jButton37.addActionListener(new TextEditFrame_jButton37_actionAdapter(this));
    jButton38.setBorderPainted(false);
    jButton38.setContentAreaFilled(false);
    jButton38.setFocusPainted(false);
    jButton38.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("end1.gif")));
    jButton38.setRolloverEnabled(true);
    jButton38.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("endr.gif")));
    jButton38.setBounds(new Rectangle(887, 397, 49, 37));
    jButton39.setBorderPainted(false);
    jButton39.setContentAreaFilled(false);
    jButton39.setFocusPainted(false);
    jButton39.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("emp1.gif")));
    jButton39.setRolloverEnabled(true);
    jButton39.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("empr.gif")));
    jButton39.setBounds(new Rectangle(741, 359, 46, 36));
    jButton39.addActionListener(new TextEditFrame_jButton39_actionAdapter(this));
    jButton40.setBorderPainted(false);
    jButton40.setContentAreaFilled(false);
    jButton40.setFocusPainted(false);
    jButton40.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("emp2.gif")));
    jButton40.setRolloverEnabled(true);
    jButton40.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("empr.gif")));
    jButton40.setBounds(new Rectangle(878, 363, 47, 28));
    jButton40.addActionListener(new TextEditFrame_jButton40_actionAdapter(this));
    jButton22.setBorderPainted(false);
    jButton22.setContentAreaFilled(false);
    jButton22.setFocusPainted(false);
    jButton22.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("2n.gif")));
    jButton22.setRolloverEnabled(true);
    jButton22.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("2nr.gif")));
    jButton22.setBounds(new Rectangle(810, 487, 51, 30));
    jButton22.addActionListener(new TextEditFrame_jButton22_actionAdapter(this));
    jButton24.setBorderPainted(false);
    jButton24.setContentAreaFilled(false);
    jButton24.setFocusPainted(false);
    jButton24.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("0n.gif")));
    jButton24.setRolloverEnabled(true);
    jButton24.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("0nr.gif")));
    jButton24.setBounds(new Rectangle(809, 592, 46, 29));
    jButton24.addActionListener(new TextEditFrame_jButton24_actionAdapter(this));
    jTextArea4.setText("");
    jTextArea4.setBounds(new Rectangle(484, 682, 70, 17));
    jButton42.setBorderPainted(false);
    jButton42.setContentAreaFilled(false);
    jButton42.setFocusPainted(false);
    jButton42.setRolloverEnabled(true);
    jButton42.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("up.gif")));
    jButton42.setBounds(new Rectangle(824, 384, 15, 14));
    jButton42.addActionListener(new TextEditFrame_jButton42_actionAdapter(this));
    jButton43.setBorderPainted(false);
    jButton43.setContentAreaFilled(false);
    jButton43.setFocusPainted(false);
    jButton43.setRolloverEnabled(true);
    jButton43.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("down.gif")));
    jButton43.setBounds(new Rectangle(827, 418, 11, 11));
    jButton43.addActionListener(new TextEditFrame_jButton43_actionAdapter(this));
    //jEditorPane1.addHyperlinkListener(createHyperLinkListener());
    jButton44.setText("Compile");
    jButton44.addActionListener(new TextEditFrame_jButton44_actionAdapter(this));
    jScrollPane2.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    jScrollPane2.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_NEVER);
    jScrollPane2.setBounds(new Rectangle(746, 207, 176, 117));
    jEditorPane1.setEditable(false);
    left.setEditable(false);
    left.setBounds(new Rectangle(746, 323, 114, 24));
    right.setEditable(false);
    right.setBounds(new Rectangle(860, 324, 64, 22));
    jButton46.setBorderPainted(false);
    jButton46.setContentAreaFilled(false);
    jButton46.setFocusPainted(false);
    jButton46.setRolloverEnabled(true);
    jButton46.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("left.gif")));
    jButton46.setBounds(new Rectangle(787, 401, 10, 14));
    jButton46.addActionListener(new TextEditFrame_jButton46_actionAdapter(this));
    jButton47.setBorderPainted(false);
    jButton47.setContentAreaFilled(false);
    jButton47.setFocusPainted(false);
    jButton47.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("upsima1.gif")));
    jButton47.setRolloverEnabled(true);
    jButton47.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("right.gif")));
    jButton47.setBounds(new Rectangle(866, 401, 10, 12));
    jButton47.addActionListener(new TextEditFrame_jButton47_actionAdapter(this));
    jMenuItem8.setText("Print");
    jMenuItem8.addActionListener(new TextEditFrame_jMenuItem8_actionAdapter(this));
    jMenuItem10.setText("Cut Ctrl-x");
    jMenuItem10.addActionListener(new TextEditFrame_jMenuItem10_actionAdapter(this));
    jMenuItem11.setText("Copy Ctrl-c");
    jMenuItem11.addActionListener(new TextEditFrame_jMenuItem11_actionAdapter(this));
    jMenuItem12.setText("Paste Ctrl-v");
    jMenuItem12.addActionListener(new TextEditFrame_jMenuItem12_actionAdapter(this));
    jMenu2.setText("Settings");
    jMenu2.addActionListener(new TextEditFrame_jMenu2_actionAdapter(this));
    jMenuItem9.setText(" Default Page");
    jMenuItem9.addActionListener(new TextEditFrame_jMenuItem9_actionAdapter(this));
    jMenuItem5.setText("Font");
    jMenuItem5.addActionListener(new TextEditFrame_jMenuItem5_actionAdapter(this));
    jMenuItem6.setText("Foreground Color");
    jMenuItem6.addActionListener(new TextEditFrame_jMenuItem6_actionAdapter(this));
    jMenuItem7.setText("Background Color");
    jMenuItem7.addActionListener(new TextEditFrame_jMenuItem7_actionAdapter(this));
    jButton41.setBorderPainted(false);
    jButton41.setContentAreaFilled(false);
    jButton41.setIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("nsp.gif")));
    jButton41.setRolloverEnabled(true);
    jButton41.setRolloverIcon(new ImageIcon(Texteditor.TextEditFrame.class.getResource("nspr.gif")));
    jButton41.setBounds(new Rectangle(870, 590, 53, 32));
    jButton41.addActionListener(new TextEditFrame_jButton41_actionAdapter(this));
    Input.setBounds(new Rectangle(752, 213, 164, 102));
    //Input.setColumns(23);
    Input.setText("");
    Input.setBackground(Color.lightGray);
    Input.addAncestorListener(new TextEditFrame_Input_ancestorAdapter(this));
    menuFile.add(jMenuItem1);
    menuFile.add(jMenuItem2);
    menuFile.add(jMenuItem3);
    menuFile.add(jMenuItem4);
    menuFile.add(jMenuItem8);
    menuFile.add(menuFileExit);
    menuHelp.add(menuHelpAbout);
    menuBar1.add(menuFile);
    menuBar1.add(jMenu1);
    menuBar1.add(jMenu2);
    menuBar1.add(menuHelp);
   this.setJMenuBar(menuBar1);
    // this.setMenuBar();
   // this.setMenuBar(menuBar1);
  // this.add(menuBar1);
    this.getContentPane().add(jLabel1, null);
    //this.add(jLabel1,null);
    this.getContentPane().add(toolBar, null);
   // this.add(toolBar,null);
    toolBar.add(jButton1, null);
    toolBar.add(jButton2);
    toolBar.add(jButton3);
    toolBar.add(jButton44, null);
    this.getContentPane().add(jTextField1, null);
    //this.add(jTextField1,null);
  // this.add(jScrollPane1,null);
    this.getContentPane().add(jToolBar1, null);
    //this.add(jToolBar1,null);
    jToolBar1.add(jButton4, null);
    jToolBar1.add(jButton5, null);
    jToolBar1.add(jButton6, null);
    jToolBar1.add(jButton7, null);
    jToolBar1.add(jButton21, null);
    jToolBar1.add(jButton20, null);
    jToolBar1.add(jButton19, null);
    jToolBar1.add(jButton18, null);
    jToolBar1.add(jButton17, null);
    jToolBar1.add(jButton16, null);
    jToolBar1.add(jButton15, null);
    jToolBar1.add(jButton14, null);
    jToolBar1.add(jButton13, null);
    jToolBar1.add(jButton8, null);
    jToolBar1.add(jButton9, null);
    jToolBar1.add(jButton10, null);
    jToolBar1.add(jButton11, null);
    jToolBar1.add(jButton12, null);
    this.getContentPane().add(statusBar, null);
    this.getContentPane().add(jLabel2, null);
    this.getContentPane().add(jButton22, null);
    this.getContentPane().add(jButton25, null);
    this.getContentPane().add(jButton26, null);
    this.getContentPane().add(jButton27, null);
    this.getContentPane().add(jButton28, null);
    this.getContentPane().add(jButton29, null);
    this.getContentPane().add(jButton30, null);
    this.getContentPane().add(jButton31, null);
    this.getContentPane().add(jButton32, null);
    this.getContentPane().add(jButton24, null);
    this.getContentPane().add(jButton23, null);
    this.getContentPane().add(jButton33, null);
    this.getContentPane().add(jButton34, null);
    this.getContentPane().add(jButton35, null);
    this.getContentPane().add(jButton36, null);
    this.getContentPane().add(jButton37, null);
    this.getContentPane().add(jButton38, null);
    this.getContentPane().add(jButton39, null);
    this.getContentPane().add(jButton40, null);
    this.getContentPane().add(jButton42, null);
    this.getContentPane().add(jButton43, null);
    this.getContentPane().add(jScrollPane2, null);
    this.getContentPane().add(left, null);
    this.getContentPane().add(right, null);
    this.getContentPane().add(jButton46, null);
    this.getContentPane().add(jButton47, null);
    this.getContentPane().add(jScrollPane1, null);
    this.getContentPane().add(jButton41, null);
    this.getContentPane().add(Input, null);
    jScrollPane1.getViewport().add(jTextArea1, null);
    jScrollPane2.getViewport().add(jEditorPane1, null);
    jMenu1.add(jMenuItem10);
    jMenu1.add(jMenuItem11);
    jMenu1.add(jMenuItem12);
    jMenu2.add(jMenuItem5);
    jMenu2.add(jMenuItem6);
    jMenu2.add(jMenuItem7);
    jMenu2.add(jMenuItem9);
    jTextArea1.setForeground(Color.black);
    jTextArea1.append("<?xml version=\"1.0\"?>");
    jTextArea1.append("\n<!DOCTYPE WML PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\"");
    jTextArea1.append("\n  \"http://www.wapforum.org/DTD/wml_1.1.xml\">");
    jTextArea1.append("\n<wml>");
    jTextArea1.append("\n<template>");
    jTextArea1.append("\n<do type=\"accept\" label=\"Back\"><prev/></do>");
    jTextArea1.append("\n</template>");
    jTextArea1.append("\n<card id=\"card1\">");
    jTextArea1.append("\n<do type=\"accept\" label=\"Next\"><go href=\"#card2\"/></do>");
    jTextArea1.append("\n<p>");
    jTextArea1.append("\n<b>First Card</b>");
    jTextArea1.append("\n<!--Your information is in here.-->");
    jTextArea1.append("\n</p>");
    jTextArea1.append("\n</card>");
    jTextArea1.append("\n<card id=\"card2\">");
    jTextArea1.append("\n<p>");
    jTextArea1.append("\n<b>Second Card</b>");
    jTextArea1.append("\n<!--Your information is in here.-->");
    jTextArea1.append("\n</p>");
    jTextArea1.append("\n</card>");
    jTextArea1.append("\n</wml>");
    Home_url="";
    HomeFile=new FileReader("Home.txt");
    int n=0;
    while((n=HomeFile.read())!=-1)
    {
      Home_url=Home_url+((char)n);
    }
    HomeFile.close();

    jTextArea1.setFont(new Font("dialog",Font.PLAIN,14));
   // this.add(jEditorPane1, null);
   // this.add(jButton1, null);
    ExampleFileFilter WMLFilter = new ExampleFileFilter("wml", "WML Phones Files");
    jFileChooser1.addChoosableFileFilter(WMLFilter);

  }

  boolean openFile(String fileName)
  {
    try
      {
        File file = new File(fileName);
        int size = (int) file.length();
        int chars_read=0;
        FileReader in = new FileReader(file);
        char[] data = new char[size];
        while(in.ready()) {
        chars_read += in.read(data,chars_read,size-chars_read);
        }
        in.close();
        jTextArea1.setText(new String(data,0,chars_read));
        this.currFileName = fileName;
        this.dirty = false;
        updateCaption();
        statusBar.setText("Opened"+fileName);
        return true;
        }
        catch(IOException e)
        {
          statusBar.setText("Error openning"+fileName);

          }
           return false;

          }
  boolean saveFile() {
      if(currFileName == null) {
      return saveAsFile();
      }
      try
      {
        File file = new File(currFileName);
        FileOutputStream out = new FileOutputStream(file);
        String text = jTextArea1.getText();
        byte bytes[] = text.getBytes();
        out.write(bytes);
        out.close();
        this.dirty = false ;
        updateCaption();
        jTextField1.setText(jFileChooser1.getSelectedFile().getPath());
        return true;
        }
        catch(IOException e) {
        statusBar.setText("Error saving"+currFileName);
        }
        return false;
        }
    boolean saveAsFile() {
      if(jFileChooser1.APPROVE_OPTION == jFileChooser1.showSaveDialog(this)){
      currFileName = jFileChooser1.getSelectedFile().getPath();
      this.repaint();
      return saveFile();
    }
    else
      this.repaint(); return false ;}
    boolean okToAbandon() {
      if (!dirty) {
      return true;
    }
    int value = JOptionPane.showConfirmDialog(this,"Save changes?","·«Íæ∫√“«‡´Õ√Ï¿“…“‰∑¬",JOptionPane.YES_NO_CANCEL_OPTION);
    switch(value) {
    case JOptionPane.YES_OPTION:
    return saveFile();
    case JOptionPane.NO_OPTION:
    return true;
    case JOptionPane.CANCEL_OPTION:
    default:
    return false;
    }
  }


  void jMenuItem3_actionPerformed(ActionEvent e) {
    saveFile();
  }

  void jMenuItem4_actionPerformed(ActionEvent e) {
    saveAsFile();
  }

    // Update the caption of the application to show the filename and its dirty state.
     void updateCaption() {
       String caption;

       if (currFileName == null) {
          // synthesize the "Untitled" name if no name yet.
          caption = "Untitled";
       }
       else {
         caption = currFileName;
       }

       // add a "*" in the caption if the file is dirty.
       if (dirty) {
         caption = "* " + caption;
       }
       caption = "·«Íæ∫√“«‡´Õ√Ï¿“…“‰∑¬ - " + caption;
       this.setTitle(caption);
     }

  //File | Exit action performed
  public void fileExit_actionPerformed(ActionEvent e) {
    if(okToAbandon()) {
      try {
      process = Runtime.getRuntime().exec("command.com /c "+"deltree /y c:\\temph " +"\n");
      }catch(IOException errcommand) {System.out.println(errcommand+"command error");}
      System.exit(0);
    }
  }

  //Help | About action performed
  public void helpAbout_actionPerformed(ActionEvent e) {
    TextEditFrame_AboutBox dlg = new TextEditFrame_AboutBox(this);
    Dimension dlgSize = dlg.getPreferredSize();
    Dimension frmSize = getSize();
    Point loc = getLocation();
    dlg.setLocation((frmSize.width - dlgSize.width) / 2 + loc.x, (frmSize.height - dlgSize.height) / 2 + loc.y);
    dlg.setModal(true);
    dlg.show();
  }

  //Overridden so we can exit on System Close
  protected void processWindowEvent(WindowEvent e) {
    super.processWindowEvent(e);
    if(e.getID() == WindowEvent.WINDOW_CLOSING) {
      fileExit_actionPerformed(null);
    }
  }

  

  void jMenuItem1_actionPerformed(ActionEvent e) {
    if(okToAbandon()){
    jTextArea1.setText("");
    jTextArea1.setForeground(Color.magenta);
    jTextArea1.append("<?xml version=\"1.0\"?>");
    jTextArea1.append("\n<!DOCTYPE WML PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\"");
    jTextArea1.append("\n  \"http://www.wapforum.org/DTD/wml_1.1.xml\">");
    jTextArea1.append("\n<wml>");
    jTextArea1.append("\n<template>");
    jTextArea1.append("\n<do type=\"accept\" label=\"Back\"><prev/></do>");
    jTextArea1.append("\n</template>");
    jTextArea1.append("\n<card id=\"card1\">");
    jTextArea1.append("\n<do type=\"accept\" label=\"Next\"><go href=\"#card2\"/></do>");
    jTextArea1.append("\n<p>");
    jTextArea1.append("\n<b>First Card</b>");
    jTextArea1.append("\n<!--Your information is in here.-->");
    jTextArea1.append("\n</p>");
    jTextArea1.append("\n</card>");
    jTextArea1.append("\n<card id=\"card2\">");
    jTextArea1.append("\n<p>");
    jTextArea1.append("\n<b>Second Card</b>");
    jTextArea1.append("\n<!--Your information is in here.-->");
    jTextArea1.append("\n</p>");
    jTextArea1.append("\n</card>");
    jTextArea1.append("\n</wml>");
    currFileName= null;
    dirty = false;
    updateCaption();
    }
    //}
  }

  void jMenuItem2_actionPerformed(ActionEvent e) {
    if (!okToAbandon()) {
    return;
    }
    if(jFileChooser1.APPROVE_OPTION == jFileChooser1.showOpenDialog(this))
    {
    statusBar.setText("Opened"+jFileChooser1.getSelectedFile().getPath());
    jTextField1.setText(jFileChooser1.getSelectedFile().getPath());
    openFile(jFileChooser1.getSelectedFile().getPath());
     //repaints menu after item is selected
     this.repaint();
    }
  }
void  fileOpen()
 {
    if (!okToAbandon()) {
    return;
    }
    if(jFileChooser1.APPROVE_OPTION == jFileChooser1.showOpenDialog(this))
    {
    statusBar.setText("Opened"+jFileChooser1.getSelectedFile().getPath());
    jTextField1.setText(jFileChooser1.getSelectedFile().getPath());
    openFile(jFileChooser1.getSelectedFile().getPath());

     //repaints menu after item is selected
     this.repaint();
    }
 }


  void jButton2_actionPerformed(ActionEvent e) {
    saveFile();
  }

  void jButton3_actionPerformed(ActionEvent e) {
    helpAbout();
  }


  void helpAbout()
  {
     TextEditFrame_AboutBox dlg = new TextEditFrame_AboutBox(this);
    Dimension dlgSize = dlg.getPreferredSize();
    Dimension frmSize = getSize();
    Point loc = getLocation();
    dlg.setLocation((frmSize.width - dlgSize.width) / 2 + loc.x, (frmSize.height - dlgSize.height) / 2 + loc.y);
    dlg.setModal(true);
    dlg.show();
  }

  void document1_changedUpdate(DocumentEvent e) {
    dirty = true;
    updateCaption();
  }

  void document1_insertUpdate(DocumentEvent e) {
    dirty = true;
    updateCaption();
  }

  void document1_removeUpdate(DocumentEvent e) {
    dirty = true;
    updateCaption();
  }

  void jButton1_actionPerformed(ActionEvent e) {
    fileOpen();
  }

  void jButton4_actionPerformed(ActionEvent e) {
   jTextArea1.insert("<br/>",jTextArea1.getCaretPosition());
  }

  void jButton5_actionPerformed(ActionEvent e) {
   jTextArea1.insert("<!-- Your comment is here. -->",jTextArea1.getCaretPosition());
  }

  void jButton6_actionPerformed(ActionEvent e) {
  jTextArea1.insert("<card  id=\"card_1\"  title=\"Your title\">    <!--Fill on > id and >title--> \n",jTextArea1.getCaretPosition());
  jTextArea1.insert("     <p>\n",jTextArea1.getCaretPosition());
  jTextArea1.insert("     <!-- Your information is here. -->\n",jTextArea1.getCaretPosition());
  jTextArea1.insert("     </p>\n",jTextArea1.getCaretPosition());
  jTextArea1.insert("</card>",jTextArea1.getCaretPosition());
  }

  void jButton7_actionPerformed(ActionEvent e) {
    jTextArea1.insert("<prev/>",jTextArea1.getCaretPosition());
  }

  void jButton21_actionPerformed(ActionEvent e) {
    //i am going to change it after , everything it commplete.
    jTextArea1.insert("<input name=\"name\" type=\"text\" maxlength=\"32\"/>\n",jTextArea1.getCaretPosition());
  }

  void jButton20_actionPerformed(ActionEvent e) {
    jTextArea1.insert("<select name=\"name\" iname=\"I\"  ivalue=\"1;2\" multiple=\"true\">\n",jTextArea1.getCaretPosition());
    jTextArea1.insert("option value=\"D\">Dog</option>\n",jTextArea1.getCaretPosition());
    jTextArea1.insert("option value=\"D\">Dog</option>\n",jTextArea1.getCaretPosition());
    jTextArea1.insert("</select>",jTextArea1.getCaretPosition());
  }

  void jButton19_actionPerformed(ActionEvent e) {
  //i fill option about wbmp convertor
    jTextArea1.insert("<img src=\"image.wbmp\" alt=\"moon\" src=\"default.wbmp\" hspace=\"1\" vspace=\"1\"/>",jTextArea1.getCaretPosition());
  }

  void jButton18_actionPerformed(ActionEvent e) {
    jTextArea1.insert("<strong>information change to strong </strong>\n",jTextArea1.getCaretPosition());
  }

  void jButton17_actionPerformed(ActionEvent e) {
    jTextArea1.insert("<i>information</i>\n",jTextArea1.getCaretPosition());
  }

  void jButton16_actionPerformed(ActionEvent e) {
    jTextArea1.insert("<b>information</b>\n",jTextArea1.getCaretPosition());
  }

  void jButton15_actionPerformed(ActionEvent e) {
    jTextArea1.insert("<u>information</u>\n",jTextArea1.getCaretPosition());
  }

  void jButton13_actionPerformed(ActionEvent e) {
    jTextArea1.insert("<small>information</small>",jTextArea1.getCaretPosition());
  }

  void jButton8_actionPerformed(ActionEvent e) {
    jTextArea1.insert("<table column=\"3\">\n",jTextArea1.getCaretPosition());
    jTextArea1.insert("<tr><td>info</td></tr>",jTextArea1.getCaretPosition());
    jTextArea1.insert("<tr><td>info</td></tr>",jTextArea1.getCaretPosition());
    jTextArea1.insert("<tr><td>info</td></tr>",jTextArea1.getCaretPosition());
    jTextArea1.insert("</table>\n",jTextArea1.getCaretPosition());
  }

  void jButton9_actionPerformed(ActionEvent e) {
    jTextArea1.insert("<timer value=\"100\"/>",jTextArea1.getCaretPosition());
  }

  void jButton10_actionPerformed(ActionEvent e) {
    //desing after that.
    jTextArea1.insert("<do type=\"options\" name=\"do1\" label=\"default\">\n",jTextArea1.getCaretPosition());
    jTextArea1.insert("<prev/>\n",jTextArea1.getCaretPosition());
    jTextArea1.insert("</do>",jTextArea1.getCaretPosition());

  }

  void jButton11_actionPerformed(ActionEvent e) {
    jTextArea1.insert("<template>\n",jTextArea1.getCaretPosition());
    jTextArea1.insert("<!-- your template-->\n",jTextArea1.getCaretPosition());
    jTextArea1.insert("</template>",jTextArea1.getCaretPosition());
  }

  void jButton12_actionPerformed(ActionEvent e) {
    jTextArea1.insert("<go href=\"/<!--your link-->/>",jTextArea1.getCaretPosition());
  }
  //------windowlistener
  public void windowClosed(WindowEvent e) {
System.out.println("Closed");
}
public void windowClosing(WindowEvent e)
{
System.out.println("Closing");
try
{
 String StrLink="File:"+StrFile[card];
 System.out.println(card+" card");
 URL url1 = new URL(StrLink);
 jEditorPane1.setPage(url1);
 jEditorPane1.show();
}
catch(Exception ex) {System.out.println("error");}

jEditorPane1.repaint();
}
public void windowOpened(WindowEvent e)
{
System.out.println("Opened");
}
public void windowIconified(WindowEvent e)
{
System.out.println("Iconified");
}
public void windowDeiconified(WindowEvent e)
{
  System.out.println("Deiconified");
  //if (no_card != -1)
  //{
   // show(card);
    //left.setText(Card[card][2]);
  //}
}

public void update(Graphics g)
{
  paint(g);
  jEditorPane1.repaint();
}

public void windowActivated(WindowEvent e)
{
  System.out.println("Activated");
  //if (no_card != -1)
  //{
  //  show(card);
    //left.setText(Card[card][2]);
  //}
}
public void windowDeactivated(WindowEvent e)
{
System.out.println("Deactivated");
}

public void Parser(String urls)
{
try {
  i=0;error=0;check_close_tag=0;no_card=-1;card=0;open_tag=0;hist=-1;count_char=0;
	tag_wml=0;
	tag_head=0;
	tag_template=0;tag_td=0;tag_tr=0;tag_table=0;
	tag_card=0;
	tag_p=0;tag_postfield=0;tag_prev=0;
	tag_a=0;tag_anchor=0;has_tag_a=0;
	tag_b=0;tag_big=0;tag_br=0;
	tag_do=0;
	tag_em=0;
	tag_fieldset=0;
	tag_go=0;
	tag_i=0;tag_img=0;
	tag_refresh=0;
	tag_onevent=0;tag_optgroup=0;tag_option=0;
	tag_select=0;tag_small=0;tag_strong=0;
  tag_u=0;special=0;set_back=0;set_prev=0;intp=0;
  Temp_str="";Str_www="";host="";count_link=-1;count_down=-1;count_input=-1;load_pic=0;
  int j,k;
  for (i=0;i<10;i++)
  {
    Card[i][0]="#";
    Card[i][1]="";
    Card[i][2]="";
    Input_value[i][0]="";
    Input_value[i][1]="";
    Input_value[i][2]="";
    Input_value[i][3]="";
    Input_value[i][4]="";
    Input_value[i][5]="";
    Input_value[i][6]="";
    Input_value[i][7]="";
    Input_value[i][8]="";
    Input_value[i][9]="";
    for (j=0;j<20;j++)
    {

      Link_pos[i][j][0]=0;
      Link_pos[i][j][1]=0;
      Link_pos[i][j][2]=0;
      Link_pos[i][j][3]=0;
      Link_a[i][j]="";
    }

  }
  String Str_pic="";
  jTextArea1.setText("");
  left.setText("");
  right.setText("");
  jTextArea4.setText("");// 22
  num_card=0;
  num_card1=0;
  num_link=0;
  num_link1=0;
  FileLink[0] = new FileOutputStream("C:/temph/tmp0.html");
  FileLink[1] = new FileOutputStream("C:/temph/tmp1.html");
  FileLink[2] = new FileOutputStream("C:/temph/tmp2.html");
  FileLink[3] = new FileOutputStream("C:/temph/tmp3.html");
  FileLink[4] = new FileOutputStream("C:/temph/tmp4.html");
  FileLink[5] = new FileOutputStream("C:/temph/tmp5.html");
  FileLink[6] = new FileOutputStream("C:/temph/tmp6.html");
  FileLink[7] = new FileOutputStream("C:/temph/tmp7.html");
  FileLink[8] = new FileOutputStream("C:/temph/tmp8.html");
  FileLink[9] = new FileOutputStream("C:/temph/tmp9.html");
  int a;
  a=urls.lastIndexOf("/");
  if((urls.indexOf("/"))!=(a-1))
  {
    host=urls.substring(0,urls.lastIndexOf("/")+1);
    System.out.println(host+"host");
  }
  else
  {
    host=urls;
    System.out.println(host+"host");
    urls=urls+"/index.wml";
  }
  URL url = new URL(urls);
  jTextField1.setText(urls);
  InputStream in = url.openStream();
  DataInputStream dis = new DataInputStream(url.openConnection().getInputStream());
  Reader reader = new InputStreamReader (in);
  BufferedReader bufferedReader = new BufferedReader(reader);
  String line;
  jTextArea1.setFont(new Font("dialog",Font.PLAIN,14));
  while ((line = bufferedReader.readLine()) != null)

                 jTextArea1.append(line+"\n");
                 bufferedReader.close();
  int s,l=0;
	while ((s = dis.read()) != -1)
		{
      special=0;
			switch(s) {
        case '<' : {
						open_tag=1;
						break;
				}
        case '/' :  {
						if (open_tag ==1)
						{
							check_close_tag = 1;
							s = dis.read();
							if (s == 'a') //close tag a....
							{
								s = dis.read();
								if (s=='>') //close tag </a>
								{
									tag_a--;
                  //System.out.println(count_char+"end1");
                  //if(count_link>0)
                  //  count_char++;
                  if(count_link!=-1)
                    Link_pos[no_card][count_link][1]=count_char+5;
                  //System.out.println(Link_pos[no_card][count_link][1]+"end2");
                  FileLink[no_card].write('<');
                  FileLink[no_card].write('/');
                  FileLink[no_card].write('a');
                  FileLink[no_card].write('>');
								}
								else if (s == 'n') // close tag </anchor>
								{
									tag_anchor--;
                  //System.out.println("</anchor>");
									while((s=dis.read())!='>') ;
								}
							}
							else if (s == 'b')  //close tag b....
							{
								s=dis.read();
								if (s == '>') //close tag </b>
								{
									tag_b--;
                  FileLink[no_card].write('<');
                  FileLink[no_card].write('/');
                  FileLink[no_card].write('b');
                  FileLink[no_card].write('>');
								}
								else if (s == 'r') //close tag </br>
								{
									tag_br--;
								}
								else if (s == 'i') //close tag </big>
								{
									tag_big--;
                  FileLink[no_card].write('<');
                  FileLink[no_card].write('/');
                  FileLink[no_card].write('b');
                  FileLink[no_card].write('i');
                  FileLink[no_card].write('g');
                  FileLink[no_card].write('>');
									while((s=dis.read())!='>');
				                                     				}
							}
							else if (s == 'd') //close tag </do>
							{
								tag_do--;
                while ((s = dis.read())!='>');
							}
							else if (s == 'e') //close tag </em>
							{
								tag_em--;
                FileLink[no_card].write('<');
                  FileLink[no_card].write('/');
                  FileLink[no_card].write('e');
                  FileLink[no_card].write('m');
                  FileLink[no_card].write('>');
                while ((s = dis.read())!='>');
							}
							else if (s == 'f') //close tag </fieldset>
							{
								tag_fieldset--;
                FileLink[no_card].write('<');
                FileLink[no_card].write('/');
                FileLink[no_card].write('f');
                FileLink[no_card].write('i');
                FileLink[no_card].write('e');
                FileLink[no_card].write('l');
                FileLink[no_card].write('d');
                FileLink[no_card].write('s');
                FileLink[no_card].write('e');
                FileLink[no_card].write('t');
                FileLink[no_card].write('>');
								while ((s = dis.read())!='>');
							}
							else if (s  == 'g') // close tag </go>
							{
								while ((s = dis.read())!='>');
								tag_go--;
                //System.out.println("</go>");
							}
							else if (s == 'h') //close tag </head>
							{
								while ((s = dis.read())!='>');
								tag_head--;
                for (i=0;i<10;i++)
                {
                  FileLink[i].write('<');
                  FileLink[i].write('/');
                  FileLink[i].write('h');
                  FileLink[i].write('e');
                  FileLink[i].write('a');
                  FileLink[i].write('d');
                  FileLink[i].write('>');
                }
							}
							else if (s == 'i') //close tag i...
							{
								s = dis.read();
								if (s == '>') // close tag </i>
								{
									tag_i--;
                  FileLink[no_card].write('<');
                  FileLink[no_card].write('/');
                  FileLink[no_card].write('i');
                  FileLink[no_card].write('>');
								}
							}
							else if (s == 'o')	//close tag o....
							{
								s = dis.read();
								if (s =='n') // close tag </onevent>
                {
									tag_onevent--;
                  //System.out.println("</onevent>");
									while ((s= dis.read())!='>');
								}
								else if (s == 'p')
								{
									while ((s= dis.read())!='t');
									s=dis.read();
									if (s=='g')	//close tag </optgroup>
									{
										tag_optgroup--;
                    //System.out.println("</optgroup>");
										while ((s= dis.read())!='>');
									}
									else if (s == 'i') // close tag </option>
									{
										tag_option--;
										while ((s= dis.read())!='>') ;
									}
								}
							}
							else if (s == 'p') //close tag </p>
							{
								s = dis.read();
								if (s == '>')
								{
									tag_p=0;
                  //System.out.println(count_char+"words");
                  FileLink[no_card].write('<');
                  FileLink[no_card].write('/');
                  FileLink[no_card].write('p');
                  FileLink[no_card].write('>');
								}
								else if (s == 'r') //close tag </prev>
								{
									tag_prev--;
                  //System.out.println("</prev>");
									while((s=dis.read())!='>');
								}
								else if (s=='o') //close tag </postfield>
								{
									tag_postfield--;
                 // System.out.println("</postfield>");
									while((s=dis.read())!='>');
								}
							}
							else if (s == 'r') // close tag </refresh>
							{
								tag_refresh--;
               // System.out.println("</refresh>");
								while((s=dis.read())!='>');
							}
							else if (s == 's') //close tag s...
							{
								s = dis.read();
								if (s == 'm') //close tag </small>
								{
									tag_small--;
                  FileLink[no_card].write('<');
                  FileLink[no_card].write('/');
                  FileLink[no_card].write('s');
                  FileLink[no_card].write('m');
                  FileLink[no_card].write('a');
                  FileLink[no_card].write('l');
                  FileLink[no_card].write('l');
                  FileLink[no_card].write('>');
									while((s=dis.read())!='>');
								}
								else if (s == 't') // close tag </strong>
								{
									tag_strong--;
                  FileLink[no_card].write('<');
                  FileLink[no_card].write('/');
                  FileLink[no_card].write('b');
                  FileLink[no_card].write('>');
									while((s=dis.read())!='>');
								}
								else if (s == 'e') //close tag </select>
								{
									tag_select--;
                  //System.out.println("</select>");
									while((s=dis.read())!='>');
								}
							}
							else if (s=='c')// close tag card
							{
								while((s=dis.read())!='>');
								tag_card--;
                for(i=0;i<20;i++){
                  Link_pos[no_card][i][2]=count_link;
                }
                if (count_link!=-1)
                  System.out.println(Link_pos[no_card][count_link][2]+"links1");
                System.out.println(count_link+"links2");
							}
              else if (s == 't') //close tag t...
							{
								s = dis.read();
								if (s == 'd') //close tag </td>
								{
									tag_td--;
                  FileLink[no_card].write('<');
                  FileLink[no_card].write('/');
                  FileLink[no_card].write('t');
                  FileLink[no_card].write('d');
                  FileLink[no_card].write('>');
									s = dis.read();
								}
								else if (s == 'r') //close tag </tr>
								{
									tag_tr--;
                  FileLink[no_card].write('<');
                  FileLink[no_card].write('/');
                  FileLink[no_card].write('t');
                  FileLink[no_card].write('r');
                  FileLink[no_card].write('>');
									s=dis.read();
								}
								else if (s == 'a') // close tag </table>
								{
									tag_table--;
                  FileLink[no_card].write('<');
                  FileLink[no_card].write('/');
                  FileLink[no_card].write('t');
                  FileLink[no_card].write('a');
                  FileLink[no_card].write('b');
                  FileLink[no_card].write('l');
                  FileLink[no_card].write('e');
                  FileLink[no_card].write('>');
									while((s=dis.read())!='>');
								}
								else if (s == 'e') // close tag </template>
								{
									tag_template--;
									while ((s= dis.read())!='>') ;
								}
							}
              else if (s == 'u')
              {
                tag_u--;
                FileLink[no_card].write('<');
                FileLink[no_card].write('/');
                FileLink[no_card].write('u');
                FileLink[no_card].write('>');
                while((s=dis.read())!='>');
              }
							else if (s == 'w') // close tag </wml>
							{
								tag_wml--;
                for (i=0;i<10;i++)
                {
                  FileLink[i].write('<');
                  FileLink[i].write('/');
                  FileLink[i].write('b');
                  FileLink[i].write('o');
                  FileLink[i].write('d');
                  FileLink[i].write('y');
                  FileLink[i].write('>');
                  FileLink[i].write('<');
                  FileLink[i].write('/');
                  FileLink[i].write('h');
                  FileLink[i].write('t');
                  FileLink[i].write('m');
                  FileLink[i].write('l');
                  FileLink[i].write('>');
                }
								while((s=dis.read())!='>');
							}
						}
						if ((tag_p!=0)&&(open_tag!=1))
						{
              count_char++;
              FileLink[no_card].write(s);
						}
						open_tag=0;
						break;
					}
					case '!' :  {
						if (open_tag ==1)
						{
							while ((s = dis.read()) != '>') ;
							if (s == '>')
							{
								error=0;
							}
							else error=1;
						}
						if ((tag_p!=0)&&(open_tag!=1))
            {
              count_char++;
              FileLink[no_card].write(s);
						}
						open_tag=0;
						break;
					}
					case '?' :  {
						if (open_tag ==1)
						{
							while ((s=dis.read())!='>') ;
							if (s == '>')
							{
								error=0;
							}
							else error=1;
						}
						if ((tag_p!=0)&&(open_tag!=1))
 						{
              count_char++;
              FileLink[no_card].write(s);
						}
						open_tag=0;
						break;
					}
					case 'W' ://tag <wml>
					case 'w' :{
						if (open_tag ==1)
						{
							s = dis.read();
							if (s == 'm')
							{
								s = dis.read();
								if (s == 'l')
								{
									s = dis.read();
									if (s == '>')
									{
										tag_wml++;
                    for (i=0;i<10;i++)
                    {
                      FileLink[i].write('<');
                      FileLink[i].write('h');
                      FileLink[i].write('t');
                      FileLink[i].write('m');
                      FileLink[i].write('l');
                      FileLink[i].write('>');
						}	}	}	} }
						if ((tag_p!=0)&&(open_tag!=1))
						{
              count_char++;
              FileLink[no_card].write(s);
						}
						open_tag=0;
						break;
					}
					case 'H' :	//tag <head>
					case 'h' :	{
						if (open_tag ==1)
						{
							s = dis.read();
							if (s == 'e')
							{
								s = dis.read();
								if (s == 'a')
								{
									s = dis.read();
									if (s == 'd')
									{
										s = dis.read();
										if (s == '>')
										{
											tag_head++;
                      for (i=0;i<10;i++)
                      {
                        FileLink[i].write('<');
                        FileLink[i].write('h');
                        FileLink[i].write('e');
                        FileLink[i].write('a');
                        FileLink[i].write('d');
                        FileLink[i].write('>');
						}	}	}	}	} }
						if ((tag_p!=0)&&(open_tag!=1))
						{
             count_char++;
             FileLink[no_card].write(s);
						}
						open_tag=0;
						break;
					}
					case 'T' :	//tag <template>
					case 't' :	{
						if (open_tag ==1)
						{
							s = dis.read();
							if (s == 'e')
							{
								s = dis.read();
								if (s == 'm')
								{
									s = dis.read();
									if (s == 'p')
									{
										s = dis.read();
										if (s == 'l')
										{
											s = dis.read();
											if (s == 'a')
											{
												s = dis.read();
												if (s == 't')
												{
													s = dis.read();
													if (s == 'e')
													{
														s = dis.read();
														if (s == '>')
														{
															tag_template++;
                            }
                            else if(s==' ')
                            {
                              tag_template++;
                              while((s = dis.read())!='>') ;
                              //System.out.print("<template ");
							}	}	}	}	}	}	}	}
							else if (s == 'd') // tag <td>
							{
							s = dis.read();
								if (s == '>')
								{
									tag_td++;
                  FileLink[no_card].write('<');
                  FileLink[no_card].write('t');
                  FileLink[no_card].write('d');
                  FileLink[no_card].write('>');
								}	}
							else if (s == 'r')	//tag <tr>
							{
								s = dis.read();
								if (s == '>')
								{
									tag_tr++;
                  FileLink[no_card].write('<');
                  FileLink[no_card].write('t');
                  FileLink[no_card].write('r');
                  FileLink[no_card].write('>');
							}	}
							else if (s == 'a')	//tag <table>
							{
								s = dis.read();
								if (s == 'b')
								{
									s = dis.read();
									if (s == 'l')
									{
										s = dis.read();
										if (s == 'e')
										{
											s = dis.read();
											if (s == '>')
											{
												tag_table++;
                        System.out.println("<table>");
                        FileLink[no_card].write('<');
                        FileLink[no_card].write('t');
                        FileLink[no_card].write('a');
                        FileLink[no_card].write('b');
                        FileLink[no_card].write('l');
                        FileLink[no_card].write('e');
                        FileLink[no_card].write('>');
                      }
                      else if (s == ' ')
                      {
                        tag_table++;

                        FileLink[no_card].write('<');
                        FileLink[no_card].write('t');
                        FileLink[no_card].write('a');
                        FileLink[no_card].write('b');
                        FileLink[no_card].write('l');
                        FileLink[no_card].write('e');
                        FileLink[no_card].write(' ');
                        while ((s=dis.read())!='>')
                        {
                          if (s == 'c')
                          {
                            FileLink[no_card].write(s);
                            s=dis.read();
                            if (s == 'o')
                            {
                              FileLink[no_card].write(s);
                              FileLink[no_card].write('l');
                              FileLink[no_card].write('s');
                              while((s=dis.read())!='"');
                              FileLink[no_card].write('=');
                              FileLink[no_card].write('"');
                              while((s=dis.read())!='"')
                              {
                                FileLink[no_card].write(s);
                              }
                            }
                          }
                          FileLink[no_card].write(s);
                        }
                        FileLink[no_card].write('>');
                        FileLink[no_card].write('\n');
							}	}	}	}	}
							else if (s == 'i') //tg <timer>
							{
								s = dis.read();
								if (s == 'm')
								{
									s = dis.read();
									if (s == 'e')
									{
										s = dis.read();
										if (s == 'r')
										{
											s = dis.read();
											if (s == ' ')
											{
                        //System.out.print("<timer ");
                        while ((dis.read())!='>');//System.out.print((char)s);
                        //System.out.println(">");
						}	}	}	}	}	}
						if ((tag_p!=0)&&(open_tag!=1))
						{
              count_char++;
              FileLink[no_card].write(s);
						}
						open_tag=0;
						break;
					}
					case 'C' :	// tag <card>
					case 'c' :	{
						if (open_tag ==1)
						{
							s = dis.read();
							if (s == 'a')
							{
								s = dis.read();
								if (s == 'r')
								{
									s = dis.read();
									if (s == 'd')
									{
                    no_card++;
                    count_char=-1;
                    count_link=-1;
                    count_input=-1;
										while((s=dis.read())!='>')
                    {
                      if (s ==' ')
										  {
                        s=dis.read();
                        if(s=='i')
                        {
                          s=dis.read();
                          if(s=='d')
                          {
                            while((s=dis.read())!='"');
                            while((s=dis.read())!='"')
                            {
                              Card[no_card][0]=Card[no_card][0]+((char)s);
						}	}	}	}	} } } } }
            //System.out.println(Card[no_card][0]+"478");
            if (s == '>')
            {
              FileLink[no_card].write('<');
              FileLink[no_card].write('b');
              FileLink[no_card].write('o');
              FileLink[no_card].write('d');
              FileLink[no_card].write('y');
              FileLink[no_card].write('>');
              tag_card++;
              num_card++;
              num_card1++;
            }
						if ((tag_p!=0)&&(open_tag!=1))
						{
              count_char++;
              FileLink[no_card].write(s);
						}
						open_tag=0;
						break;
					}
					case 'P' :	// tag <p>
					case 'p' :	{
						if (open_tag ==1)
						{
							s = dis.read();
							if (s == '>')
							{
								tag_p++;
                FileLink[no_card].write('<');
                FileLink[no_card].write('p');
                FileLink[no_card].write('>');
              }
							else if (s == ' ') //tag <p ...>
							{
								tag_p++;
                FileLink[no_card].write('<');
                FileLink[no_card].write('p');
                FileLink[no_card].write(' ');
								s = dis.read();
                FileLink[no_card].write(s);
								while ((s=dis.read())!='>')
                {
                  FileLink[no_card].write(s);
                }
                FileLink[no_card].write('>');
                FileLink[no_card].write('\n');
							}
							else if (s == 'r')	// tag <prev/>
							{
								s = dis.read();
								if (s == 'e')
								{
									s = dis.read();
									if (s == 'v')
									{
										s = dis.read();
                    if (s == '>')
                    {
                      tag_prev++;
                      if(tag_do!=0)
                      //if ((tag_template !=0)&&(tag_do!=0))
                      {
                        set_back=1;
                        right.setText("   "+Label_do);
                      }
                    }
										else if (s == '/')
										{
											s = dis.read();
											if (s == '>')
											{
                        if ((tag_template !=0)&&(tag_do!=0))
                        {
                          set_back=1;
                          right.setText("   "+Label_do);
                        }
								}	}	}	}
								//open_tag=0;
							}
							else if (s == 'o')	// tag <postfield>
							{
								s = dis.read();
								if (s == 's')
								{
									s = dis.read();
									if (s == 't')
									{
										s = dis.read();
										if (s == 'f')
										{
											s = dis.read();
											if (s == 'i')
											{
												s = dis.read();
												if (s == 'e')
												{
													s = dis.read();
													if (s == 'l')
													{
														s = dis.read();
														if (s == 'd')
														{
															s = dis.read();
															if (s == ' ')
															{
																tag_postfield++;
                                while((s=dis.read())!='>');
								}	}	}	}	}	}	}	}
								//open_tag=0;
							}
						}
						if ((tag_p!=0)&&(open_tag!=1))
						{
             count_char++;
             FileLink[no_card].write(s);
						}
            open_tag=0;
						break;
					}
					case 'A' :
					case 'a' :	{                           ////tag <access>
						if (open_tag ==1)
						{
							s = dis.read();
							if (s == 'c')
							{
								s = dis.read();
								if (s == 'c')
								{
									s = dis.read();
									if (s == 'e')
									{
										s = dis.read();
										if (s == 's')
										{
											s = dis.read();
											if (s == 's')
											{
                        while ((dis.read())!='>');
							}	}	}	}	}
							else if (s == 'n')		// tag <anchor>
							{
								s = dis.read();
								if (s == 'c')
								{
									s = dis.read();
									if (s == 'h')
									{
										s = dis.read();
										if (s == 'o')
										{
											s = dis.read();
											if (s == 'r')
											{
												while((s=dis.read())!='>');
												tag_anchor++;
							}	}	}	}	}
							else if (s ==' ')            ///tag <a href>
							{
                tag_a++;
                has_tag_a++;
                count_link++;
                Link_pos[no_card][count_link][3]=1;
                FileLink[no_card].write('<');
                FileLink[no_card].write('a');
                FileLink[no_card].write(' ');
                while ((s=dis.read())!='>')
                {
                  if (s=='t'){
                    FileLink[no_card].write(s);
                    while ((s=dis.read())!=' ')FileLink[no_card].write(s);
                  }
                  else if(s=='h')
                  {
                    FileLink[no_card].write(s);
                    s=dis.read();
                    if(s=='r')
                    {
                      FileLink[no_card].write(s);
                      s=dis.read();
                      if(s=='e')
                      {
                        FileLink[no_card].write(s);
                        s=dis.read();
                        if(s=='f')
                        {
                          FileLink[no_card].write(s);
                          while ((s=dis.read())!='"')
                            FileLink[no_card].write(s);
                          FileLink[no_card].write(s);
                          while ((s=dis.read())!='"')
                          {
                            FileLink[no_card].write(s);
                            Link_a[no_card][count_link]=Link_a[no_card][count_link]+((char)s);
                  } } } } }
                  FileLink[no_card].write(s);
                }
                FileLink[no_card].write('>');
                FileLink[no_card].write('\n');
                //System.out.println(count_char+"start1");
                //if(count_link>0)
                //    count_char++;
                Link_pos[no_card][count_link][0]=count_char+5;
                //System.out.println(Link_pos[no_card][count_link][0]+"start2");
                System.out.println(Link_a[no_card][count_link]+"link name");
							}
						}
						if ((tag_p!=0)&&(open_tag!=1))
						{
              count_char++;
              FileLink[no_card].write(s);
						}
						open_tag=0;
						break;
					}
					case 'B' :	//tag <big>
					case 'b' :	{
						if (open_tag == 1)
						{
							s = dis.read();
							if (s == 'i')
							{
								s = dis.read();
								if (s == 'g')
								{
									s = dis.read();
									if (s == '>')
									{
										tag_big++;
                    FileLink[no_card].write('<');
                    FileLink[no_card].write('b');
                    FileLink[no_card].write('i');
                    FileLink[no_card].write('g');
                    FileLink[no_card].write('>');
							}	}	}
							if (s == '>')	// tag <b>
							{
								tag_b++;
                FileLink[no_card].write('<');
                FileLink[no_card].write('b');
                FileLink[no_card].write('>');
							}
							else if (s == 'r')	// tag <br>
							{
								s = dis.read();
                if (s == '>')
                {
                  tag_br++;
                  count_char++;
                  FileLink[no_card].write('<');
                  FileLink[no_card].write('b');
                  FileLink[no_card].write('r');
                  FileLink[no_card].write('>');
                }
								else if (s == '/')
								{
									s = dis.read();
									if (s == '>')
									{
                    count_char++;
                    FileLink[no_card].write('<');
                    FileLink[no_card].write('b');
                    FileLink[no_card].write('r');
                    FileLink[no_card].write('>');
						}	}	}	}
						if ((tag_p!=0)&&(open_tag!=1))
						{
              count_char++;
              FileLink[no_card].write(s);
						}
						open_tag =0;
						break;
					}
					case 'D' :	//tag <do>
					case 'd' :	{
						if (open_tag ==1)
						{
							s = dis.read();
							if (s == 'o')
							{
                tag_do++;
                Label_do=" ";
                while((s=dis.read())!='>')
                {
                  if(s==' ')
                  {
                    s=dis.read();
                    if (s =='l')
                    {
                      s=dis.read();
                      if(s=='a')
                      {
                        s=dis.read();
                        if(s=='b')
                        {
                          while((s=dis.read())!='"');
                          while((s=dis.read())!='"')
                          {
                            if(tag_card!=0)
                              Card[no_card][2]=Card[no_card][2]+((char)s);
                            else Label_do=Label_do+((char)s);
            } } } } } } } }
            //System.out.println(Label_do+"12");
            //System.out.println(Card[no_card][2]+"34");
						if ((tag_p!=0)&&(open_tag!=1))
						{
              count_char++;
              FileLink[no_card].write(s);
						}
						open_tag =0;
						break;
					}
					case 'E' :	// tag <em>
					case 'e' :	{
						if (open_tag == 1)
						{
							s = dis.read();
							if (s == 'm')
							{
								s = dis.read();
								if (s == '>')
								{
									tag_em++;
                  FileLink[no_card].write('<');
                  FileLink[no_card].write('e');
                  FileLink[no_card].write('m');
                  FileLink[no_card].write('>');
						}	}	}
						if ((tag_p!=0)&&(open_tag!=1))
						{
              count_char++;
              FileLink[no_card].write(s);
						}
						open_tag = 0;
						break;
					}
					case 'F' :	// tag <fieldset>
					case 'f' : {
						if(open_tag==1){
						
							if (s == 'i')
							{
								s = dis.read();
								if (s == 'e')
								{
									s = dis.read();
									if (s == 'l')
									{
										s = dis.read();
										if (s == 'd')
										{
											s = dis.read();
											if (s == 's')
											{
												s = dis.read();
												if (s == 'e')
												{
													s = dis.read();
													if (s == 't')
													{
														s = dis.read();
														if (s == ' ')
														{
															tag_postfield++;
	                            FileLink[no_card].write('<');
		                        FileLink[no_card].write('f');
			                    FileLink[no_card].write('i');
				                FileLink[no_card].write('e');
					            FileLink[no_card].write('l');
						        FileLink[no_card].write('d');
							    FileLink[no_card].write('s');
								FileLink[no_card].write('e');
	                            FileLink[no_card].write('t');
		                        FileLink[no_card].write(' ');
			                    while ((s = dis.read())!='>')
				                {
					              FileLink[no_card].write(s);
						        }
							    FileLink[no_card].write('>');
								FileLink[no_card].write('\n');
			}	}	}	}	}	}	}	}	}
            if ((tag_p!=0)&&(open_tag!=1))
						{
              count_char++;
              FileLink[no_card].write(s);
						}
						open_tag=0;
						break;
					}
					case 'G' :	//tag <go>
					case 'g' :	{
						if (open_tag == 1)
						{
              Href_go="";
              Method_go="";
							s = dis.read();
							if (s == 'o')
							{
                while((s = dis.read())!='>')
								{
                  if(s==' ')
                  {
                    s = dis.read();
									  if (s == 'h')
									  {
                      s = dis.read();
							        if (s == 'r')
										  {
												s = dis.read();
												if (s == 'e')
												{
  								        s = dis.read();
									        if (s == 'f')
					                {
                            while((s = dis.read())!='"');
                            while((s = dis.read())!='"')
                            {
                              Href_go=Href_go+((char)s);
                              if(tag_card!=0)
                                Card[no_card][1]=Card[no_card][1]+((char)s);
									  } } } } }
                    else if(s=='m')
                    {
                      s=dis.read();
                      if(s=='e')
                      {
                        s=dis.read();
                        if(s=='t')
                        {
                          s=dis.read();
                          if(s=='h')
                          {
                            s=dis.read();
                            if(s=='o')
                            {
                              s=dis.read();
                              if(s=='d')
                              {
                                while((s = dis.read())!='"');
                                while((s = dis.read())!='"')
                                {
                                  Method_go=Method_go+((char)s);
                } } } } } } } } }
                tag_go++;
							}
						}
						if ((tag_p!=0)&&(open_tag!=1))
						{
              count_char++;
              FileLink[no_card].write(s);
						}
						open_tag =0;
						break;
					}
					case 'I' :	// tag <input>
					case 'i' :	{
						if (open_tag == 1)
						{
							s = dis.read();
							if (s == 'n')
							{
								s = dis.read();
								if (s == 'p')
								{
									s = dis.read();
									if (s == 'u')
									{
										s = dis.read();
										if (s == 't')
										{
                      count_link++;
                      count_input++;
                      Link_pos[no_card][count_link][3]=2;
                      FileLink[no_card].write('[');
                      count_char++;
                      Link_pos[no_card][count_link][0]=count_char+4;
                      FileLink[no_card].write(' ');
                      count_char++;
                      Link_pos[no_card][count_link][1]=count_char+4;
                      FileLink[no_card].write(']');
                      count_char++;
                      //Link_pos[no_card][count_link][1]=count_char+3;
                      //FileLink[no_card].write('p');
                      //FileLink[no_card].write('u');
                      //FileLink[no_card].write('t');
                      while ((s=dis.read())!='>');
                      //{
                      //  if(s!='/')
                      //    FileLink[no_card].write(s);
                      //}
                      //FileLink[no_card].write('>');
							}	}	}	}
							else if (s == '>')	//tag <i>
							{
								tag_i++;
                FileLink[no_card].write('<');
                FileLink[no_card].write('i');
                FileLink[no_card].write('>');
							}
							else if (s == 'm')	// tag <img>
							{
								s = dis.read();
								if (s == 'g')
								{
                  Str_pic="";
                  load_pic=0;
                  //count_char++;
                  FileLink[no_card].write('<');
                  FileLink[no_card].write('i');
                  FileLink[no_card].write('m');
                  FileLink[no_card].write('g');
                  FileLink[no_card].write(' ');
                  while ((s=dis.read())!='>')
                  {
                    if(s!='/')
                      FileLink[no_card].write(s);
                    if(s=='s')
                    {
                      s=dis.read();
                      FileLink[no_card].write(s);
                      if(s=='r')
                      {
                        s=dis.read();
                        FileLink[no_card].write(s);
                        if(s=='c')
                        {
                          while ((s=dis.read())!='"')FileLink[no_card].write(s);
                          FileLink[no_card].write(s);
                          while ((s=dis.read())!='"')
                          {
                            FileLink[no_card].write(s);
                            Str_pic=Str_pic+((char)s);

                          }
                          FileLink[no_card].write(s);
                  } } } }
                  FileLink[no_card].write('>');
                }
                Load_Pics(Str_pic);
							  tag_img++;
						} }
						if ((tag_p!=0)&&(open_tag!=1))
						{
              count_char++;
              FileLink[no_card].write(s);
						}
						open_tag =0;
						break;
					}
					case 'M' :	//tag <meta>
					case 'm' :	{
						if (open_tag == 1)
						{
							s = dis.read();
							if (s == 'e')
							{
								s = dis.read();
								if (s == 't')
								{
									s = dis.read();
									if (s == 'a')
									{
										s = dis.read();
										if (s == ' ')
										{
                      for (i=0;i<10;i++)
                      {
                        FileLink[i].write('<');
                        FileLink[i].write('m');
                        FileLink[i].write('e');
                        FileLink[i].write('t');
                        FileLink[i].write('a');
                        FileLink[i].write(' ');
                      }
                      while ((s=dis.read())!='>'){
                        for (i=0;i<10;i++)FileLink[i].write(s);
                      }
                      for (i=0;i<10;i++)FileLink[i].write('>');
						}	}	}	}	}
						if ((tag_p!=0)&&(open_tag!=1))
						{
              count_char++;
              FileLink[no_card].write(s);
						}
						open_tag =0;
						break;
					}
					case 'N' :	//tag <noop>
					case 'n' :	{
						if (open_tag ==1)
						{
							s = dis.read();
							if (s == 'o')
							{
								s = dis.read();
								if (s == 'o')
								{
									s = dis.read();
									if (s == 'p')
									{
										s = dis.read();
										if (s == '/')
										{
                      s = dis.read();
                      if (s=='>')
                      {
                        ;
						}	}	}	}	} }
						if ((tag_p!=0)&&(open_tag!=1))
						{
              count_char++;
              FileLink[no_card].write(s);
						}
						open_tag =0;
						break;
					}
					case 'R' :	// tag <refresh>
					case 'r' :	{
						if (open_tag ==1)
						{
							s = dis.read();
							if (s == 'e')
							{
								s = dis.read();
								if (s == 'f')
								{
									s = dis.read();
									if (s == 'r')
									{
										s = dis.read();
										if (s == 'e')
										{
											s = dis.read();
											if (s == 's')
											{
												s = dis.read();
												if (s == 'h')
												{
													s = dis.read();
													if (s == '>')
													{
														tag_refresh++;
                            if(tag_do!=0)
                              show(card);
                              left.setText(Card[card][2]);
						}	}	}	}	}	}	}	}
						if ((tag_p!=0)&&(open_tag!=1))
						{
              count_char++;
              FileLink[no_card].write(s);
						}
						open_tag =0;
						break;
					}
					case 'O' :	// tag <optgroup>
					case 'o' :	{
						if (open_tag ==1)
						{
							s = dis.read();
							if (s == 'p')
							{
								s = dis.read();
								if (s == 't')
								{
									s = dis.read();
									if (s == 'g')
									{
										s = dis.read();
										if (s == 'r')
										{
											s = dis.read();
											if (s == 'o')
											{
												s = dis.read();
												if (s == 'u')
												{
													s = dis.read();
													if (s == 'p')
													{
														s = dis.read();
														if (s == ' ')
														{
															tag_optgroup++;
                              while ((s = dis.read())!='>');
									}	}	}	}	}	}
									else if (s == 'i') //tag <option>
									{
										s = dis.read();
										if (s == 'o')
										{
											s = dis.read();
											if (s == 'n')
											{
												s = dis.read();
												if (s == ' ')
												{
													tag_option++;
                          while ((s = dis.read())!='>');
							}	}	}	}	}	}
							else if (s == 'n') // tag <onevent>
							{
								s = dis.read();
								if (s == 'e')
								{
									s = dis.read();
									if (s == 'v')
									{
										s = dis.read();
										if (s == 'e')
										{
											s = dis.read();
											if (s == 'n')
											{
												s = dis.read();
												if (s == 't')
												{
													s = dis.read();
													if (s == ' ')
													{
														tag_onevent++;
                            while ((s = dis.read())!='>');
						}	}	}	}	}	}	}	}
						if ((tag_p!=0)&&(open_tag!=1))
						{
              count_char++;
              FileLink[no_card].write(s);
						}
						open_tag =0;
						break;
					}
					case 'S' :	//tag <select>
					case 's' :	{
						if (open_tag ==1)
						{
							s = dis.read();
							if (s == 'e')
							{
								s = dis.read();
								if (s == 'l')
								{
									s = dis.read();
									if (s == 'e')
									{
										s = dis.read();
										if (s == 'c')
										{
											s = dis.read();
											if (s == 't')
											{
												s = dis.read();
												if (s == ' ')
												{
													tag_select++;
                          while ((s = dis.read())!='>');
							}	}	}	}	}	}
							else if (s == 'm')		//tag <small>
							{
								s = dis.read();
								if (s == 'a')
								{
									s = dis.read();
									if (s == 'l')
									{
										if (s == 'l')
										{
                      while ((s = dis.read())!='>');
											tag_small++;
                      FileLink[no_card].write('<');
                      FileLink[no_card].write('s');
                      FileLink[no_card].write('m');
                      FileLink[no_card].write('a');
                      FileLink[no_card].write('l');
                      FileLink[no_card].write('l');
                      FileLink[no_card].write('>');
							}	}	}	}
							else if (s == 't')		//tag <strong>
							{
								s = dis.read();
								if (s == 'r')
								{
									s = dis.read();
									if (s == 'o')
									{
										s = dis.read();
										if (s == 'n')
										{
											s = dis.read();
											if (s == 'g')
											{
												s = dis.read();
												if (s == '>')
												{
													tag_strong++;
                          FileLink[no_card].write('<');
                          FileLink[no_card].write('b');
                          FileLink[no_card].write('>');
							}	}	}	}	}	}
							else if (s == 'e')		//tag <setvar>
							{
								s = dis.read();
								if (s == 't')
								{
									s = dis.read();
									if (s == 'v')
									{
										s = dis.read();
										if (s == 'a')
										{
											s = dis.read();
											if (s == 'r')
											{
                        while((s=dis.read())!='>') ;
						}	}	}	}	}	}
						if ((tag_p!=0)&&(open_tag!=1))
						{
              count_char++;
              FileLink[no_card].write(s);
						}
						open_tag =0;
						break;
					}
          case 'U' :
          case 'u' :
          {
            if (open_tag==1)
            {
              s=dis.read();
              if (s=='>')
              {
                FileLink[no_card].write('<');
                FileLink[no_card].write('u');
                FileLink[no_card].write('>');
                tag_u++;
            } }
            if ((tag_p!=0)&&(open_tag!=1))
						{
              count_char++;
              FileLink[no_card].write(s);
						}
            open_tag=0;
            break;
          }
          case ' ':
          {
            if ((tag_p!=0)&&(open_tag!=1))
						{
              s=dis.read();
              if(s!=' ')
              {
                count_char++;
                FileLink[no_card].write(' ');
                count_char++;
                FileLink[no_card].write(s);
              }
              else if(s=='<')
              {
                open_tag=1;
              }
              else {
                FileLink[no_card].write(' ');
                count_char++;
                FileLink[no_card].write(s);
              }
						}
						break;
          }
          case '&':
          {
            s = dis.read();
            if (s == 'a')
            {
              s = dis.read();
              if (s == 'm') // &amp
              {
                FileLink[no_card].write('&');
                while((s=dis.read())!=';');
              }
              else if (s == 'p')   // &apos
              {
                FileLink[no_card].write('\'');
                while((s=dis.read())!=';');
              }
            }
            else if (s == 's')   // &shy
            {
              FileLink[no_card].write('-');
              while((s=dis.read())!=';');
            }
            else if (s == 'g')// &gt
            {
              FileLink[no_card].write('&');
              FileLink[no_card].write(s);
              while((s=dis.read())!=';')FileLink[no_card].write(s);
            }
            else if (s == 'l')   // &lt
            {
              FileLink[no_card].write('&');
              FileLink[no_card].write(s);
              while((s=dis.read())!=';')FileLink[no_card].write(s);
            }
            else if (s == 'n')   // &nbsp
            {
              FileLink[no_card].write(' ');
              while((s=dis.read())!=';');
            }
            else if (s == 'q')   // &quot
            {
              FileLink[no_card].write('"');
              while((s=dis.read())!=';');
            }
            special=1;
          }
          default : {
            if ((tag_p!=0)&&(open_tag!=1)&&(special==0))
						{
            // p tag -----------------
            //------------------------
            //if(num_card==1)
              if (s!='\n')
              {
                count_char++;
                FileLink[no_card].write(s);
              }
              //else count_char--;
						}
						break;
          }
				}
			}
        for (i=0;i<10;i++){
          FileLink[i].close();
        }
        dis.close();
        card=0;
        show(card);
        left.setText(Card[card][2]);
        System.out.println(count_char+"words");
      }
        catch (IOException event){
          if(load_pic!=1){
            System.out.println("error get url");
            Alert a = new Alert(" URL Error at "+jTextField1.getText());
            a.setSize(400,300);
            a.show();
          }
        //jTextArea1.setText("error get url");
       }

}

  //--------------------

  void jTextField1_actionPerformed(ActionEvent e) {
  //function retrieve
  show(9);
  Parser(jTextField1.getText());

  }

  void jButton35_actionPerformed(ActionEvent e) {    // clear
    Input.setText("");
    intp=0;
  }

  void jButton39_actionPerformed(ActionEvent e) {
    String edit =left.getText();
    int c=0;
    Input.setText("");
    System.out.println(edit+"edit");
    if(edit.equals("Edit"))
    {
       //jEditorPane1.hide();
       left.setText("OK");
       Input.append("");
       jEditorPane1.hide();
       Input.show();
    }
    else if(edit.equals("OK"))
    {
       if(c<count_input)
       {
        Input_value[card][c]=Input.getText();
        System.out.println(Input_value[card][c]);
        c++;
       }
       intp=0;
       show(card);
    }
    else
    {
      int go=0;
      i=0;
      count_down=-1;
      String str_www;
      if(Card[card][1].charAt(0)=='#')
      {
        while(i<=no_card)
        {
          System.out.print(Card[i][0]);System.out.print(Card[i][0].length());
          System.out.print(Card[card][1]);System.out.println(Card[card][1].length());
          if(Card[card][1].equals(Card[i][0]))
          {
            go=i;
            System.out.println(go+"go");
          }
          i++;
        }
        card=go;
        show(card);
        left.setText(Card[card][2]);
      }
      else {
        Str_www=host+Card[card][1];
        System.out.print(Card[card][1]);System.out.println(Card[card][1].length());
        System.out.println(Str_www);
        show(9);
        Parser(Str_www);
      }
    }
  }

  void jButton40_actionPerformed(ActionEvent e) {
    if (set_back!=0)
    {
      count_down=-1;
      card--;
      if(card<0)
      {
        card=0;
      }
    }
    //System.out.println(card+" %");
    show(card);
    left.setText(Card[card][2]);
  }

  void jButton42_actionPerformed(ActionEvent e) {

    count_down--;
    JScrollBar vsb = new JScrollBar();
    vsb = jScrollPane2.getVerticalScrollBar();
    go_up= vsb.getValue();
    System.out.println(go_up+"go up");
    vsb.setValue(go_up-10);
    jScrollPane2.setVerticalScrollBar(vsb);
    this.repaint();
    if(count_down<0)
       count_down=0;
    if(Link_pos[card][count_down][3]==1) // Link
    {
      left.setText(Card[card][2]);
    }
    else if(Link_pos[card][count_down][3]==2) // Input
    {
      left.setText("Edit");
    }
    if(Link_pos[card][count_down][2]!=-1)
    {
      jEditorPane1.setSelectionStart(Link_pos[card][count_down][0]);
      jEditorPane1.setSelectionEnd(Link_pos[card][count_down][1]);
    }
  }

  void jButton43_actionPerformed(ActionEvent e) {
  count_down++;
    JScrollBar vsb = new JScrollBar();
   vsb = jScrollPane2.getVerticalScrollBar();
   go_down= vsb.getValue();
   System.out.println(go_down+"go down");
   vsb.setValue(go_down+10);
   jScrollPane2.setVerticalScrollBar(vsb);
   this.repaint();
   if(count_down>Link_pos[card][count_down][2])
      count_down=Link_pos[card][count_down][2];
   if(Link_pos[card][count_down][3]==1) // Link
   {
     left.setText(Card[card][2]);
   }
   else if(Link_pos[card][count_down][3]==2) // Input
   {
     left.setText("Edit");
   }
   if(Link_pos[card][count_down][2]!=-1)
   {
      jEditorPane1.setSelectionStart(Link_pos[card][count_down][0]);
      jEditorPane1.setSelectionEnd(Link_pos[card][count_down][1]);
   }
    //-------------
  }

  void jButton46_actionPerformed(ActionEvent e) { //left
    JScrollBar vsb = new JScrollBar();
    vsb = jScrollPane2.getHorizontalScrollBar();
    go_down= vsb.getValue();
    //System.out.println(go_down+"go down");
    vsb.setValue(go_down-10);
    jScrollPane2.setHorizontalScrollBar(vsb);
    this.repaint();
    System.out.println("ok left");
  }

  void jButton47_actionPerformed(ActionEvent e) {         //right
    JScrollBar vsb = new JScrollBar();
    vsb = jScrollPane2.getHorizontalScrollBar();
    go_down= vsb.getValue();
    //System.out.println(go_down+"go down");
    vsb.setValue(go_down+10);
    jScrollPane2.setHorizontalScrollBar(vsb);
    this.repaint();
    System.out.println("ok right");
  }
  void Load_Pics(String Str_pic){
    try {
      int p;
      //System.out.println(Str_pic+"pics1");
      //System.out.println("C:/temph/"+Str_pic+"pics2");
      load_pic=1;
      System.out.println(host+Str_pic+"pics3");
      Pics = new FileOutputStream("C:/temph/"+Str_pic);
      URL url_P = new URL(host+Str_pic);
      InputStream Pic_in = url_P.openStream();
      DataInputStream Pic_dis = new DataInputStream(url_P.openConnection().getInputStream());
      while((p=Pic_dis.read())!=-1)
      {
        Pics.write(p);
      }
      Pics.close();
      Pic_dis.close();
      int pic;
      pic=Str_pic.lastIndexOf(".");
    }catch(IOException ep){System.out.println("Can't load this picture.");}
  }
  void show(int card_number)
  {
      try
      {
        intp=0;
        String StrLink="File:"+StrFile[card_number];
        System.out.println(card_number+" card");
        System.out.println(StrFile[card_number]+" Name");
        //String str_show;
        /*if(Card[card_number][2]==null)
           str_show=" ";
        else str_show=Card[card_number][2];
        left.setText(" "+str_show);*/
        URL url1 = new URL(StrLink);
        jEditorPane1.setPage(url1);
        Input.hide();
        jEditorPane1.show();
        this.repaint();
        System.out.println("ok in");
        }
        catch(IOException ex)
        {
          System.out.println("Error openning");

          }
  }

  void jButton37_actionPerformed(ActionEvent e) { //send
    Str_www="";
    String s = Link_a[card][count_down];
    if(((s.charAt(0))=='h')&&((s.charAt(1))=='t')&&((s.charAt(2))=='t')&&((s.charAt(3))=='p'))
    {
      Str_www=s;
      show(9);
      Parser(Str_www);
    }
    else if((s.charAt(0))=='/')
    {
       Str_www=s.substring(1,s.length());
       show(9);
       Parser(Str_www);
    }
    else if((s.charAt(0))=='#')
    {
      i=0;
      int go=card;
      while(i<=no_card)
      {
        System.out.print(Card[i][0]);System.out.print(Card[i][0].length());
        System.out.print(s);System.out.println(s.length());
        if(s.equals(Card[i][0]))
        {
          go=i;
          System.out.println(go+"go");
        }
        i++;
      }
      card=go;
      show(card);
      left.setText(Card[card][2]);
    }
    else
    {
		  Str_www=host+Link_a[card][count_down];
      show(9);
      Parser(Str_www);
    }
  }

  void jButton33_actionPerformed(ActionEvent e) {       //home
  try
  {
    Home_url="";
    HomeFile=new FileReader("Home.txt");
    int n=0;
    while((n=HomeFile.read())!=-1)
    {
      Home_url=Home_url+((char)n);
    }
    HomeFile.close();
    show(9);
    Parser(Home_url);
    }
    catch(Exception ex) {System.out.println("error on editpane");}
  }

  void menuFile_actionPerformed(ActionEvent e) {
    jEditorPane1.show();
jEditorPane1.repaint();
this.repaint();
  }

  void jMenu1_actionPerformed(ActionEvent e) {
    jEditorPane1.show();
jEditorPane1.repaint();
this.repaint();
  }

  void menuHelp_actionPerformed(ActionEvent e) {
    jEditorPane1.show();
jEditorPane1.repaint();
this.repaint();
  }

  void jButton44_actionPerformed(ActionEvent e) {
    //get from file  ------------------------

    saveFile();
    show(9);
    Parser("File:"+jTextField1.getText());
    this.repaint();
  }

  void jButton14_actionPerformed(ActionEvent e) {
    //big
     jTextArea1.insert("<big>information</big>",jTextArea1.getCaretPosition());
  }

  void jMenuItem8_actionPerformed(ActionEvent e) {
    //printer
    System.out.println("print");
     Example2  ex= new Example2();
     ex.go(jTextArea1.getText());
 }                             

  void jMenuItem10_actionPerformed(ActionEvent e) {
    //cut
    jTextArea1.cut();
  }

  void jMenuItem11_actionPerformed(ActionEvent e) {
    //copy
    jTextArea1.copy();
  }

  void jMenuItem12_actionPerformed(ActionEvent e) {
    //pastle
    jTextArea1.paste();
  }

  void jMenu2_actionPerformed(ActionEvent e) {

  }

  void jMenuItem9_actionPerformed(ActionEvent e) {    //set Home page
    Home_url="";
    try {
      HomeFile=new FileReader("Home.txt");
      int n=0;
      while((n=HomeFile.read())!=-1)
      {
        Home_url=Home_url+((char)n);
      }
      HomeFile.close();
    }catch(IOException ef){System.out.println("File Error");}
    Home h=new Home(Home_url);
    h.setSize(600,350);
    h.show();

  }

  void jMenuItem5_actionPerformed(ActionEvent e) {
    fontChooser1.showDialog();
    fontChooser1.setSelectedFont(jTextArea1.getFont());
    if(fontChooser1.showDialog()) {
      jTextArea1.setFont(fontChooser1.getSelectedFont());
    }
    this.repaint();
    jTextArea1.repaint();
  }

  void jMenuItem6_actionPerformed(ActionEvent e) {
    Color color = jColorChooser1.showDialog(this,"Foreground color",jTextArea1.getForeground());
    if(color != null) {
      jTextArea1.setForeground(color);
    }
    this.repaint();
  }

  void jMenuItem7_actionPerformed(ActionEvent e) {
    Color color = jColorChooser1.showDialog(this,"Background color",jTextArea1.getBackground());
    if(color != null) {
      jTextArea1.setBackground(color);
    }
    this.repaint();
  }

  void Input_ancestorAdded(AncestorEvent e) {

  }

  void jButton22_actionPerformed(ActionEvent e) {   // 2
    intp++;
    Input.append("2");
    if((intp%23)==0)
    {
      intp=0;
      Input.append("\n");
    }
  }

  void jButton25_actionPerformed(ActionEvent e) {   // 3
    intp++;
    Input.append("3");
    if((intp%23)==0)
    {
      intp=0;
      Input.append("\n");
    }
  }

  void jButton26_actionPerformed(ActionEvent e) {   // 4
    intp++;
    Input.append("4");
    if((intp%23)==0)
    {
      intp=0;
      Input.append("\n");
    }
  }

  void jButton27_actionPerformed(ActionEvent e) {    // 5
    intp++;
    Input.append("5");
    if((intp%23)==0)
    {
      intp=0;
      Input.append("\n");
    }
  }

  void jButton28_actionPerformed(ActionEvent e) {   // 6
    intp++;
    Input.append("6");
    if((intp%23)==0)
    {
      intp=0;
      Input.append("\n");
    }
  }

  void jButton29_actionPerformed(ActionEvent e) {    // 7
    intp++;
    Input.append("7");
    if((intp%23)==0)
    {
      intp=0;
      Input.append("\n");
    }
  }

  void jButton30_actionPerformed(ActionEvent e) {  // 8
    intp++;
    Input.append("8");
    if((intp%23)==0)
    {
      intp=0;
      Input.append("\n");
    }
  }

  void jButton31_actionPerformed(ActionEvent e) { // 9
    intp++;
    Input.append("9");
    if((intp%23)==0)
    {
      intp=0;
      Input.append("\n");
    }
  }

  void jButton32_actionPerformed(ActionEvent e) {                // *
    intp++;
    Input.append("*");
    if((intp%23)==0)
    {
      intp=0;
      Input.append("\n");
    }
  }

   void jButton23_actionPerformed(ActionEvent e) {           // 1
    intp++;
    Input.append("1");
    if((intp%23)==0)
    {
      intp=0;
      Input.append("\n");
    }
  }

  void jButton24_actionPerformed(ActionEvent e) {        // 0
    intp++;
    Input.append("0");
    if((intp%23)==0)
    {
      intp=0;
      Input.append("\n");
    }
  }

  void jButton41_actionPerformed(ActionEvent e) {    // #
    intp++;
    Input.append("#");
    if((intp%23)==0)
    {
      intp=0;
      Input.append("\n");
    }
  }

  void jButton36_actionPerformed(ActionEvent e) {
    String Intp=Input.getText();
    System.out.println(Intp.charAt(Intp.length()-1));
    if(Intp.charAt(Intp.length()-1)!='\n')
    {
      Intp=Intp.substring(0,Intp.length()-1);
      intp=Intp.length();
    }
    else
    {
      Intp=Intp.substring(0,Intp.length()-2);
      intp=Intp.length();
    }
    Input.setText(Intp);
  }
}

class TextEditFrame_menuFileExit_ActionAdapter implements ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_menuFileExit_ActionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.fileExit_actionPerformed(e);
  }
}

class TextEditFrame_menuHelpAbout_ActionAdapter implements ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_menuHelpAbout_ActionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.helpAbout_actionPerformed(e);
  }
}




class TextEditFrame_jMenuItem1_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jMenuItem1_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuItem1_actionPerformed(e);
  }
}

class TextEditFrame_jMenuItem2_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jMenuItem2_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuItem2_actionPerformed(e);
  }
}

class TextEditFrame_jMenuItem3_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jMenuItem3_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuItem3_actionPerformed(e);
  }
}

class TextEditFrame_jMenuItem4_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jMenuItem4_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuItem4_actionPerformed(e);
  }

}

/*class TextEditFrame_jButton1_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton1_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }




}  */

class TextEditFrame_jButton2_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton2_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton2_actionPerformed(e);
  }
}

class TextEditFrame_jButton3_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton3_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton3_actionPerformed(e);
  }
}

class TextEditFrame_document1_documentAdapter implements javax.swing.event.DocumentListener {
  TextEditFrame adaptee;

  TextEditFrame_document1_documentAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void changedUpdate(DocumentEvent e) {
    adaptee.document1_changedUpdate(e);
  }

  public void insertUpdate(DocumentEvent e) {
    adaptee.document1_insertUpdate(e);
  }

  public void removeUpdate(DocumentEvent e) {
    adaptee.document1_removeUpdate(e);
  }
}

class TextEditFrame_jButton1_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton1_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton1_actionPerformed(e);
  }
}

class TextEditFrame_jButton4_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton4_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton4_actionPerformed(e);
  }
}

class TextEditFrame_jButton5_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton5_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton5_actionPerformed(e);
  }
}

class TextEditFrame_jButton6_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton6_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton6_actionPerformed(e);
  }
}

class TextEditFrame_jButton7_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton7_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton7_actionPerformed(e);
  }
}

class TextEditFrame_jButton21_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton21_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton21_actionPerformed(e);
  }
}

class TextEditFrame_jButton20_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton20_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton20_actionPerformed(e);
  }
}

class TextEditFrame_jButton19_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton19_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton19_actionPerformed(e);
  }
}

class TextEditFrame_jButton18_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton18_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton18_actionPerformed(e);
  }
}

class TextEditFrame_jButton17_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton17_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton17_actionPerformed(e);
  }
}

class TextEditFrame_jButton16_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton16_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton16_actionPerformed(e);
  }
}

class TextEditFrame_jButton15_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton15_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton15_actionPerformed(e);
  }
}

class TextEditFrame_jButton13_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton13_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton13_actionPerformed(e);
  }
}

class TextEditFrame_jButton8_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton8_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton8_actionPerformed(e);
  }
}

class TextEditFrame_jButton9_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton9_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton9_actionPerformed(e);
  }
}

class TextEditFrame_jButton10_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton10_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton10_actionPerformed(e);
  }
}

class TextEditFrame_jButton11_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton11_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton11_actionPerformed(e);
  }
}

class TextEditFrame_jButton12_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton12_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton12_actionPerformed(e);
  }
}

class TextEditFrame_jTextField1_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jTextField1_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jTextField1_actionPerformed(e);
  }
}

class TextEditFrame_jButton23_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton23_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton23_actionPerformed(e);
  }
}

class TextEditFrame_jButton35_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton35_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton35_actionPerformed(e);
  }
}

class TextEditFrame_jButton39_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton39_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton39_actionPerformed(e);
  }
}

class TextEditFrame_jButton40_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton40_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton40_actionPerformed(e);
  }
}

class TextEditFrame_jButton42_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton42_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton42_actionPerformed(e);
  }
}

class TextEditFrame_jButton43_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton43_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton43_actionPerformed(e);
  }
}

class TextEditFrame_jButton37_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton37_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton37_actionPerformed(e);
  }
}

class TextEditFrame_jButton33_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton33_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton33_actionPerformed(e);
  }
}

class TextEditFrame_menuFile_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_menuFile_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.menuFile_actionPerformed(e);
  }
}

class TextEditFrame_jMenu1_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jMenu1_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jMenu1_actionPerformed(e);
  }
}

class TextEditFrame_menuHelp_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_menuHelp_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.menuHelp_actionPerformed(e);
  }
}

class TextEditFrame_jButton44_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton44_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton44_actionPerformed(e);
  }
}

class TextEditFrame_jButton14_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton14_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton14_actionPerformed(e);
  }
}



class TextEditFrame_jButton46_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton46_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton46_actionPerformed(e);
  }
}

class TextEditFrame_jButton47_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton47_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton47_actionPerformed(e);
  }
}

class TextEditFrame_jMenuItem8_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jMenuItem8_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuItem8_actionPerformed(e);
  }
}

class TextEditFrame_jMenuItem10_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jMenuItem10_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuItem10_actionPerformed(e);
  }
}

class TextEditFrame_jMenuItem11_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jMenuItem11_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuItem11_actionPerformed(e);
  }
}

class TextEditFrame_jMenuItem12_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jMenuItem12_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuItem12_actionPerformed(e);
  }
  //---------------------

}
//----------------------------------------


        //------------

class TextEditFrame_jMenu2_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jMenu2_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jMenu2_actionPerformed(e);
  }
}

class TextEditFrame_jMenuItem9_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jMenuItem9_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuItem9_actionPerformed(e);
  }
}

class TextEditFrame_jMenuItem5_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jMenuItem5_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuItem5_actionPerformed(e);
  }
}

class TextEditFrame_jMenuItem6_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jMenuItem6_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuItem6_actionPerformed(e);
  }
}

class TextEditFrame_jMenuItem7_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jMenuItem7_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuItem7_actionPerformed(e);
  }
}

class TextEditFrame_Input_ancestorAdapter implements javax.swing.event.AncestorListener {
  TextEditFrame adaptee;

  TextEditFrame_Input_ancestorAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void ancestorAdded(AncestorEvent e) {
    adaptee.Input_ancestorAdded(e);
  }

  public void ancestorMoved(AncestorEvent e) {
  }

  public void ancestorRemoved(AncestorEvent e) {
  }
}

class TextEditFrame_jButton22_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton22_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton22_actionPerformed(e);
  }
}

class TextEditFrame_jButton25_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton25_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton25_actionPerformed(e);
  }
}

class TextEditFrame_jButton26_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton26_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton26_actionPerformed(e);
  }
}

class TextEditFrame_jButton27_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton27_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton27_actionPerformed(e);
  }
}

class TextEditFrame_jButton28_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton28_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton28_actionPerformed(e);
  }
}

class TextEditFrame_jButton29_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton29_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton29_actionPerformed(e);
  }
}

class TextEditFrame_jButton30_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton30_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton30_actionPerformed(e);
  }
}

class TextEditFrame_jButton31_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton31_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton31_actionPerformed(e);
  }
}

class TextEditFrame_jButton32_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton32_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton32_actionPerformed(e);
  }
}

class TextEditFrame_jButton24_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton24_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton24_actionPerformed(e);
  }
}

class TextEditFrame_jButton41_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton41_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton41_actionPerformed(e);
  }
}

class TextEditFrame_jButton36_actionAdapter implements java.awt.event.ActionListener {
  TextEditFrame adaptee;

  TextEditFrame_jButton36_actionAdapter(TextEditFrame adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.jButton36_actionPerformed(e);
  }
}

