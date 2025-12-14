package WapBrowser;

import javax.swing.border.*;

import java.awt.*;
import javax.swing.*;
import com.borland.jbcl.layout.*;

import java.awt.*;
import java.awt.event.*;

import javax.swing.JFrame;
import javax.swing.*;

import java.lang.* ;

import java.io.* ;
import java.io.File;
import org.jdom.*;
import org.jdom.input.SAXBuilder;

import java.util.*;
import javax.swing.event.*;

import java.net.URL;
import java.net.MalformedURLException;


public class Frame1 extends JFrame {
  Frame2 f2 = new Frame2();
  JPanel contentPane;
  ImageIcon image1;
  ImageIcon image2;
  ImageIcon image3;
  ImageIcon image4;
  XYLayout xYLayout1 = new XYLayout();
  JMenuBar jMenuBar2 = new JMenuBar();
  JMenu jMenu = new JMenu();
  JMenuItem jMenuOpenU = new JMenuItem();
  JMenuItem jMenuSource = new JMenuItem();
  JButton jButtonPower = new JButton();
  JButton jButtonOpt = new JButton();
  JButton jButtonEnd = new JButton();
  JMenuItem jMenuBack = new JMenuItem();
  JMenuItem jMenuStop = new JMenuItem();
  JMenuItem jMenuRefresh = new JMenuItem();
  JMenuItem jMenuHome = new JMenuItem();
  JMenuItem jMenuSearch = new JMenuItem();
  JMenuItem jMenuFav = new JMenuItem();
  JMenuItem jMenuPrint = new JMenuItem();
  JMenuItem jMenuAbout = new JMenuItem();
  JMenuItem jMenuExit = new JMenuItem();
  JButton jButtonGreen = new JButton();
  JButton jButtonRed = new JButton();
  JButton jButtonO = new JButton();
  JButton jButtonUp = new JButton();
  JButton jButtonDown = new JButton();
  JButton jButtonLeft = new JButton();
  JButton jButtonRight = new JButton();
  //----- tuk variable
static public int x=5;
static public int y=0;
static public int j=0;
static public int containerWidth;
static public int containerHeight;
static public int height;
public int numallnode=1;
static public ElementInfo elem[] = new ElementInfo[100];
static public Stack history = new Stack();
private  Font myFont = new Font("AngsanaUPC",1,14);
private GridBagLayout gbLayout;
private GridBagConstraints gbConstraints;
private Container c;
private Element e;
private String des;
private String hostname;
private String port;
private String path;
private String file;
private String anchor;
private String protocol;
private String attrbname;
private String attrbvalue;
private boolean IsInput= true;
  JPanel jPanelConsole = new JPanel();
  JTextField jTextField1 = new JTextField();
  XYLayout xYLayout2 = new XYLayout();
  JTextArea jTextAreaTitle = new JTextArea();
  JTextArea jTextAreaLeft = new JTextArea();
  JTextArea jTextAreaRight = new JTextArea();
  JScrollPane jScrollPane1 = new JScrollPane();
static  JTextArea InputArea = new JTextArea();
static  JEditorPane jEditorPane1 = new JEditorPane();
  JLabel jLabel1 = new JLabel();
  //JPopupMenu jpmu = new JPopupMenu(); //will define in line 1104
  //----- end tuk variable

  /**Construct the frame*/
  public Frame1() {
    enableEvents(AWTEvent.WINDOW_EVENT_MASK);
    try {
      jbInit();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }
  /**Component initialization*/
  private void jbInit() throws Exception  {
  // -- tuk

  //-- end tuk
    image1 = new ImageIcon(WapBrowser.Frame1.class.getResource("openFile.gif"));
    image2 = new ImageIcon(WapBrowser.Frame1.class.getResource("closeFile.gif"));
    image3 = new ImageIcon(WapBrowser.Frame1.class.getResource("help.gif"));
    image4 = new ImageIcon(WapBrowser.Frame1.class.getResource("3gl.jpg"));
    jButtonOpt.setIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("ok.jpg")));
    jButtonOpt.setRolloverIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("okonm.jpg")));
    //jButton6.setIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("card.gif")));
    jButtonOpt.setToolTipText("Softkey Left");
    jButtonOpt.setBorderPainted(false);
    //setIconImage(Toolkit.getDefaultToolkit().createImage(Frame1.class.getResource("[Your Icon]")));
    contentPane = (JPanel) this.getContentPane();
    contentPane.setLayout(xYLayout1);
    contentPane.addMouseListener(new java.awt.event.MouseAdapter() {
      public void mouseClicked(MouseEvent e) {
        contentPane_mouseClicked(e);
      }
    });
    this.getContentPane().setBackground(Color.white);
    this.setForeground(Color.black);
    this.setResizable(false);
    this.setSize(new Dimension(259, 513));
    this.setTitle("Thai WAP Browser");
    jMenuBar2.setToolTipText("");
//    jScrollPane1.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_NEVER);
//    jScrollPane1.HORIZONTAL_SCROLLBAR_NEVER;
//    jScrollPane1.setLayout(xYLayout1);
    jMenu.setText("Open");

    try{
      FileReader fin = new FileReader("home.txt");
      BufferedReader bin = new BufferedReader(fin);
      this.des = bin.readLine();
      bin.close();
      }
    catch(IOException ex){
      this.jEditorPane1.setText(ex.getMessage());
    }
//del this.
    jMenuOpenU.setText("Open URL...");
    jMenuOpenU.addActionListener(new Frame1_jMenuOpenU_actionAdapter(this));
    jMenuSource.setText("View Source");
    jMenuSource.addActionListener(new Frame1_jMenuSource_actionAdapter(this));
    jMenuBack.addActionListener(new Frame1_jMenuBack_actionAdapter(this));
 //   jButtonOpt.addActionListener(new Frame1_jButtonOpt_actionAdapter(this));
    jButtonEnd.setToolTipText("Softkey Right");
    jButtonEnd.setBorderPainted(false);
    jButtonEnd.setIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("no.jpg")));
    jButtonEnd.setRolloverIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("noonm.jpg")));
//    jButtonEnd.addActionListener(new ActionListener(this));
    jButtonPower.setBorder(null);
    jButtonPower.setToolTipText("Close");
    jButtonPower.setBorderPainted(false);
    jButtonPower.setIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("power.jpg")));
    jButtonPower.setRolloverIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("poweronm.jpg")));
    jButtonGreen.setToolTipText("Home");
    jButtonGreen.setBorderPainted(false);
    jButtonGreen.setIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("green.jpg")));
    jButtonGreen.setRolloverIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("greenonm.jpg")));
    jMenuBack.setIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("Back.gif")));
    jMenuBack.setText("Back");
    jMenuBack.setAccelerator(javax.swing.KeyStroke.getKeyStroke(8, 0, false));
    jMenuStop.setIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("stop.gif")));
    jMenuStop.setText("Stop");
    jMenuStop.setAccelerator(javax.swing.KeyStroke.getKeyStroke(27, 0, false));
    jMenuRefresh.setText("Refresh");
    jMenuRefresh.setAccelerator(javax.swing.KeyStroke.getKeyStroke(116, 0, false));
    jMenuHome.setText("Home");
    jMenuSearch.setText("Search");
    jMenuFav.setText("Favorites");
    jMenuPrint.setText("Print");
    jMenuAbout.setText("About");
    jMenuExit.setText("Exit");
    jButtonRed.setToolTipText("Stop");
    jButtonRed.setBorderPainted(false);
    jButtonRed.setIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("red.jpg")));
    jButtonRed.setRolloverIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("redonm.jpg")));
    jButtonO.setToolTipText("Go");
    jButtonO.setBorderPainted(false);
    jButtonO.setIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("o.jpg")));
    jButtonO.setRolloverIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("oonm.jpg")));
    jButtonUp.setToolTipText("Up");
    jButtonUp.setBorderPainted(false);
    jButtonUp.setIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("up.jpg")));
    jButtonUp.setRolloverIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("uponm.jpg")));
    jButtonDown.setToolTipText("Down");
    jButtonDown.setBorderPainted(false);
    jButtonDown.setIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("down.jpg")));
    jButtonDown.setRolloverIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("downonm.jpg")));
    jButtonLeft.setToolTipText("Left");
    jButtonLeft.setBorderPainted(false);
    jButtonLeft.setIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("left.jpg")));
    jButtonLeft.setRolloverIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("leftonm.jpg")));
    jButtonRight.setToolTipText("Right");
    jButtonRight.setBorderPainted(false);
    jButtonRight.setIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("right.jpg")));
    jButtonRight.setRolloverIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("rightonm.jpg")));
    jTextField1.setText("jTextField1");
    jPanelConsole.setLayout(xYLayout2);
    jTextAreaTitle.setBackground(new Color(231, 234, 235));
    jTextAreaTitle.setEnabled(false);
    jTextAreaTitle.setEditable(false);
    jTextAreaLeft.setBackground(new Color(231, 234, 235));
    jTextAreaLeft.setEditable(false);
    jTextAreaRight.setBackground(new Color(231, 234, 235));
    jTextAreaRight.setEditable(false);
    jScrollPane1.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    jScrollPane1.getViewport().setBackground(UIManager.getColor("Button.focus"));
    jScrollPane1.setFont(new java.awt.Font("AngsanaUPC", 0, 14));
    jScrollPane1.setForeground(Color.lightGray);
    jScrollPane1.setBorder(null);
    jScrollPane1.setOpaque(false);
    InputArea.setBackground(new Color(231, 234, 235));
    InputArea.setBorder(null);
    InputArea.setDisabledTextColor(Color.lightGray);
    InputArea.setText(des);
    jEditorPane1.addMouseListener(new java.awt.event.MouseAdapter() {
      public void mouseClicked(MouseEvent e) {
        contentPane_mouseClicked(e);
      }///-----------------------2nd define for jEditorPane1
    });
    jEditorPane1.setBackground(new Color(231, 234, 235));
    jEditorPane1.setBorder(null);
    jEditorPane1.setCaretColor(Color.pink);
    jEditorPane1.setEditable(false);
    jEditorPane1.setLayout(new BorderLayout());
    jEditorPane1.setFont(new java.awt.Font("AngsanaUPC", 0, 15));
    jEditorPane1.setFont(myFont);
    jEditorPane1.setForeground(Color.pink);
    jEditorPane1.setEditable(false);
    jLabel1.setIcon(image4);
    contentPane.add(jButtonOpt, new XYConstraints(45, 305, 42, 21));
    contentPane.add(jButtonEnd, new XYConstraints(167, 331, 36, 17));
    contentPane.add(jButtonPower,                         new XYConstraints(185, 20, 30, 30));
    contentPane.add(jButtonGreen,     new XYConstraints(43, 335, 18, 13));
    contentPane.add(jButtonRed, new XYConstraints(64, 342, 13, 13));
    contentPane.add(jButtonO, new XYConstraints(114, 325, 23, 22));
    contentPane.add(jButtonUp,    new XYConstraints(118, 314, 16, 13));
    contentPane.add(jButtonDown,    new XYConstraints(119, 349, 13, 11));
    contentPane.add(jButtonLeft, new XYConstraints(102, 330, 13, 14));
    contentPane.add(jButtonRight,     new XYConstraints(137, 331, 11, 12));

    contentPane.add(jPanelConsole,     new XYConstraints(45, 102, 175, 185));
    jPanelConsole.add(jTextAreaTitle,  new XYConstraints(0, 0, 175, 30));
    jPanelConsole.add(jTextAreaLeft,    new XYConstraints(0, 159, 84, 25));
    jPanelConsole.add(jTextAreaRight,     new XYConstraints(84, 159, 91, 25));
    jPanelConsole.add(jScrollPane1,  new XYConstraints(0, 30, 175, 129));
    jPanelConsole.add(InputArea,  new XYConstraints(0, 31, 175, 129));
    jScrollPane1.add(jEditorPane1, null);
    contentPane.add(jTextField1,   new XYConstraints(22, 433, 200, -1));
    contentPane.add(jLabel1,            new XYConstraints(1, -12, 259, 513));
    jMenuBar2.add(jMenu);
    jMenu.add(jMenuBack);
    jMenu.add(jMenuStop);
    jMenu.add(jMenuRefresh);
    jMenu.addSeparator();
    jMenu.add(jMenuOpenU);
    jMenu.add(jMenuHome);
    jMenu.add(jMenuSearch);
    jMenu.addSeparator();
    jMenu.add(jMenuSource);
    jMenu.addSeparator();
    jMenu.add(jMenuFav);
    jMenu.add(jMenuPrint);
    jMenu.add(jMenuAbout);
    jMenu.addSeparator();
    jMenu.add(jMenuExit);
// ---- tuk jbinit
    Border border1;//del this.
    JTextField l = new JTextField();
    l.setFont(this.myFont);
    FontMetrics fm=l.getFontMetrics(myFont);
    this.height = fm.getHeight();
    this.history.push(this.des);
    Font font = new Font("MsSanserif",1,20);
    l.setFont(font);
    FontMetrics fm1=l.getFontMetrics(font);
    JLabel l1 = new JLabel("Welcome to");
    JLabel l2 = new JLabel("          Thai W@P Browser");
    System.out.println(this.findWidth("Welcome to",fm1));
    System.out.println(fm1.getHeight());
    l1.setBounds(50,20,100,20);
    l2.setBounds(80,50,50,20);
    // ---- end tuk jbinit
   jButtonOpt.addActionListener(new java.awt.event.ActionListener() {
     public void actionPerformed(ActionEvent e) {
        jButtonOpt_actionPerformed(e);
      }
    });
    jButtonEnd.addActionListener(new java.awt.event.ActionListener() {
     public void actionPerformed(ActionEvent e) {
        jButtonEnd_actionPerformed(e);
      }
    });
    jButtonGreen.addActionListener(new java.awt.event.ActionListener() {
     public void actionPerformed(ActionEvent e) {
        jButtonGreen_actionPerformed(e);
      }
    });
    jButtonRed.addActionListener(new java.awt.event.ActionListener() {
     public void actionPerformed(ActionEvent e) {
        jButtonRed_actionPerformed(e);
      }
    });
    jButtonUp.addActionListener(new java.awt.event.ActionListener() {
     public void actionPerformed(ActionEvent e) {
        jButtonUp_actionPerformed(e);
      }
    });
    jButtonDown.addActionListener(new java.awt.event.ActionListener() {
     public void actionPerformed(ActionEvent e) {
        jButtonDown_actionPerformed(e);
      }
    });
    jButtonLeft.addActionListener(new java.awt.event.ActionListener() {
     public void actionPerformed(ActionEvent e) {
        jButtonLeft_actionPerformed(e);
      }
    });
    jButtonRight.addActionListener(new java.awt.event.ActionListener() {
     public void actionPerformed(ActionEvent e) {
        jButtonRight_actionPerformed(e);
      }
    });
    jButtonO.addActionListener(new java.awt.event.ActionListener() {
     public void actionPerformed(ActionEvent e) {
        jButtonO_actionPerformed(e);
      }
    });
    jButtonPower.addActionListener(new java.awt.event.ActionListener() {
     public void actionPerformed(ActionEvent e) {
        jButtonPower_actionPerformed(e);
      }
    });

//        this.showall();
    jEditorPane1.add(l1);
    jEditorPane1.add(l2);
  }// end jbinit
  // -- method
//--------------------------------------------------- method
public void UrlInfo(String st1){
    try{
    String st;
    URL url = new URL(st1);
    this.protocol = url.getProtocol().trim();
    this.hostname = url.getHost().trim();
    st = url.getFile();
    if (st1.lastIndexOf('#') != -1){
    this.anchor = st1.substring(st1.lastIndexOf('#')+1,st1.length()).trim();
    }
    else this.anchor="";
      if (st.lastIndexOf('/') != -1){
        this.file = st.substring(st.lastIndexOf('/'),st.length()).trim();
        this.path = st.substring(0,st.lastIndexOf('/')).trim();
      }
      System.out.println(this.protocol);
      System.out.println(this.hostname);
      System.out.println(this.path);
      System.out.println(this.file);
    }
     catch (MalformedURLException e){
      this.jEditorPane1.setText(e.getMessage());
    }

}

String attrbname(int i,int j){
    String[] st = new String[this.numallnode];
    st = this.elem[i].getAttrbName();
    return st[j];
}
String attrbvalue(int i,int j){
    String[] st = new String[this.numallnode];
    st = this.elem[i].getAttrbValue();
    return st[j];
}

public void getnumallnode(Element e){	//get number of all node in the tree
  for (Iterator i=e.getChildren().iterator(); i.hasNext(); ) {
    this.numallnode=++this.numallnode;
    Element child = (Element)i.next();
    getnumallnode(child);
  }
}                                                       //end getnumallnode

void getAttrb(String st){
    this.attrbname=st.substring(12,st.indexOf("=")).trim();
    this.attrbvalue=st.substring(st.indexOf('"')+1,st.length()-2).trim();
}

void getRoot() throws JDOMException,NullPointerException{
    SAXBuilder builder= new SAXBuilder();
    Document doc = builder.build(this.des);
    this.e = doc.getRootElement();
}// end getRoot

void par(Element e) throws IOException, JDOMException {
    String st = new String();
    st =e.getName();  //element name
                              this.elem[this.j] =new ElementInfo(st,e.getAttributes().size(),e.getTextTrim());
                                    String[] tmp1 = new String[e.getAttributes().size()];
                                    String[] tmp2 = new String[e.getAttributes().size()];
                               for (int i=0; i<=e.getAttributes().size()-1;++i){
                                          Object[] ob = e.getAttributes().toArray();
                                          getAttrb(ob[i].toString());
                                            tmp1[i]=this.attrbname;
                                            tmp2[i]=this.attrbvalue;
                                            this.elem[this.j].setnumchild(e.getChildren().size());
                                };                        //end for
                              this.elem[this.j].setAttrbName(tmp1);
                              this.elem[this.j].setAttrbValue(tmp2);
                              if(!e.isRootElement()){
                              this.elem[this.j].setParent(e.getParent().getName());
                              }
                              else {this.elem[this.j].setIsRoot(true);}
                              for (Iterator i=e.getChildren().iterator(); i.hasNext(); ) {
                              Element child = (Element)i.next();
                              this.j++;
                              par(child);		 //Recursive

                      }                           //end for

  }   //end par()


private int findWidth(String st,FontMetrics  fm)  {
    int i = 0;
    for (int j=0;j < st.length();j++){
        i = i + fm.charWidth(st.charAt(j));
    }
    return i;
}


private void copyStyle(ElementInfo[] elem,int i,int j){
      elem[j].setI(elem[i].getI());
      elem[j].setB(elem[i].getB());
      elem[j].setPosition(elem[i].getPosition());
      elem[j].setCanshow(elem[i].getCanshow());
      elem[j].setIsLink(elem[i].getIsLink());
      elem[j].setIsAnchor(elem[i].getIsAnchor());
  }   //end copyStyle


void setStyle(){
      boolean bol=false;
      boolean bol2 = false;
      String st="";
      JTextField l = new JTextField();
      l.setFont(this.myFont);
      FontMetrics fm=l.getFontMetrics(myFont);

      for(int i=0;i<this.numallnode;i++){
      // ----Copy From Parent
      this.elem[i].setWidth(this.findWidth(this.elem[i].getContent(),fm));
//      if (!this.elem[i].getContent().equals("")){
//        this.elem[i].setContent(this.speacialChar(this.elem[i].getContent()));
//      }
      if  (!this.elem[i].getIsRoot()){
      int k=i-1;
        while (!this.elem[i].getParent().equalsIgnoreCase(this.elem[k].getName())){
         k--;
        } // end while
        copyStyle(this.elem,k,i);
      }   // end if

      //------- Set Element by itselff
      String[] name1 = new String[this.elem[i].getNumattr()];
      String[] value = new String[this.elem[i].getNumattr()];
      name1 = this.elem[i].getAttrbName();
      value = this.elem[i].getAttrbValue();
      if (this.elem[i].getName().equalsIgnoreCase("card")){
        if (this.anchor.equals("")){
          if (bol2 == false){
            this.elem[i].setCanshow(true);
            bol2 = true;
          }
       }
        else {
           for (int j = 0;j < this.elem[i].getNumattr();j++)
           {
            if (name1[j].equalsIgnoreCase("id"))
            st = value[j];
           } // end for
            if (this.anchor.equals(st)){
            this.elem[i].setCanshow(true);

            }
        }// end else
      }

      if ((this.elem[i].getName().equalsIgnoreCase("a")) | (this.elem[i].getName().equalsIgnoreCase("anchor"))){
          this.elem[i].setIsLink(true);
          if(this.elem[i].getName().equalsIgnoreCase("anchor")){
            this.elem[i].setIsAnchor(true);
          }
          if ((bol == false) & (!this.elem[i].getContent().equals(""))){
          this.elem[i].setIsHighlight(true);
          bol = true;
          }
      }// TAG A

      if (this.elem[i].getName().equalsIgnoreCase("p")){
            if (this.elem[i].getNumattr() != 0){
                for(int k=0;k<this.elem[i].getNumattr();k++){
                      if (name1[k].equalsIgnoreCase("align")){
                        this.elem[i].setPosition(value[k]);
                      };
                };
            }
      }     //TAG P


        if (this.elem[i].getName().equalsIgnoreCase("b")){
            this.elem[i].setB(true);
        }   //TAG B

        if (this.elem[i].getName().equalsIgnoreCase("i")){
            this.elem[i].setI(true);
        }   //TAG I


       }     // end for
  }   //end setStyle


void setCo(){
        int inity = 5;int x=0;int y=0;
        for (int i =0 ; i < this.numallnode ; i++){
    if (this.elem[i].getCanshow()){
         if ((this.elem[i].getName().equalsIgnoreCase("p")) | (this.elem[i].getName().equalsIgnoreCase("br"))){
                  int z=0;int  w=0;
                  y=i+1;
                  if (y<this.numallnode){
                   while (!(this.elem[y].getName().equalsIgnoreCase("p")) & !(this.elem[y].getName().equalsIgnoreCase("br"))){
                    z++;
                    w = w + this.elem[y].getWidth();
                    y++;
                    if (y == this.numallnode)
                    break;
                   }// end while
                 }

                  if (this.elem[i].getPosition().equalsIgnoreCase("center")){
                  x=(176-w)/2;
                      if (x<5) x=5;
                  }
                  else if (this.elem[i].getPosition().equalsIgnoreCase("right")){
                  x=(176-w);
                    if (x<5) x=5;
                  }
                  else if (this.elem[i].getPosition().equalsIgnoreCase("left")){
                  x=5;
                  }
                    y=i+1;
                   this.elem[y].setCo_x(x);
                   this.elem[y].setCo_y(inity);

                  for (int j=0;j<z-1;j++){
                    y++;
                      if (y == this.numallnode)
                    break;
                    x = x + elem[y-1].getWidth();
                    this.elem[y].setCo_x(x);
                    this.elem[y].setCo_y(inity);
                  }
                  inity = inity + this.height;
              } // end if P
          }
        }
} // end setCo

void initFrame(){
  this.x=5;
  this.y=0;
  this.j=0;

 }  // end initFrame

void show1(){
    JTextField[] label = new JTextField[this.numallnode];
    for (int i=0;i < this.numallnode;i++){
          Border border1;
        label[i] = new JTextField(this.elem[i].getContent());
        String style = new String();
        int x;int  font;
        if ((this.elem[i].getName().equalsIgnoreCase("card")) & (this.elem[i].getCanshow())){  // TAG CARD
                String[] st1=this.elem[i].getAttrbName();
                String[] st2=this.elem[i].getAttrbValue();
                String st=new String();
            for(int j=0;j<this.elem[i].getNumattr();j++){
                if (st1[j].equalsIgnoreCase("title")){
                st = st2[j];
                }// end if
            }// end for
         JTextField  label1 = new JTextField(st);
         label1.setText("-- "+st+" --");
         Font myFont = new Font("AngsanaUPC",3,20);
         FontMetrics fm1=label1.getFontMetrics(myFont);
         label1.setFont(myFont);
         border1 = BorderFactory.createEmptyBorder();
         label1.setBorder(border1);
         label1.setEditable(false);
         label1.setBackground(Color.lightGray);
         this.jTextAreaTitle.removeAll();
         this.jTextAreaTitle.repaint();
         this.jTextAreaTitle.add(label1);
         label1.setBounds((176-this.findWidth("-- "+st+" --",fm1))/2,2,this.findWidth("-- "+st+" --",fm1),this.height);
        }// end TITLE
        if  (!(this.elem[i].getContent().equals(""))   &  !(this.elem[i].getContent().equals(null))){
           if (this.elem[i].getCanshow()){

               if ((this.elem[i].getB()) & (this.elem[i].getI())){
                    font = 3;
               }
               else if (this.elem[i].getB()){
                      font = 1;
               }
               else if (this.elem[i].getI()){
                    font = 2;
               }
               else{
                    font = 0;
               }

                      label[i].setFont(this.myFont);
                      Font myFont1 = new Font("AngsanaUPC",font,14);
                      FontMetrics fm1=label[i].getFontMetrics(this.myFont);
                      label[i].setFont(myFont1);
                      border1 = BorderFactory.createEmptyBorder();
                       label[i].setBorder(border1);
                      label[i].setEditable(false);
            // check highlight
                        if (this.elem[i].getIsHighlight())
                          label[i].setBackground(Color.gray);
                        else label[i].setBackground(new Color(231,234,235));
            // tool tip and link
                       if (this.elem[i].getIsLink()){
            // Anchor
                          if (this.elem[i].getIsAnchor()){
                            int k=i;

                            if (this.elem[i].getName().equalsIgnoreCase("anchor")){
                              while((!this.elem[k].getName().equalsIgnoreCase("go")) & (!this.elem[k].getName().equalsIgnoreCase("prev"))){
                               if (k==this.numallnode-1)
                               break;
                               k++;
                              }
                            }
                            else{
                              while(!this.elem[k].getName().equalsIgnoreCase("anchor") ){
                               if (k<0)
                               break;
                               k--;
                              }
                              while((!this.elem[k].getName().equalsIgnoreCase("go")) & (!this.elem[k].getName().equalsIgnoreCase("prev"))){
                               if (k==this.numallnode-1)
                               break;
                               k++;
                              }
                            }
//Anchor Go
                              if (this.elem[k].getName().equalsIgnoreCase("go")){
                                for (int j=0;j<this.elem[k].getNumattr();j++){
                                  if (this.attrbname(k,j).equalsIgnoreCase("href")){
                                    label[i].setToolTipText(this.attrbvalue(k,j));
                                    this.elem[i].setLinkTo(this.attrbvalue(k,j));
                                  }
                                } //end for
                              }// end if
//Anchor PREV
                              if (this.elem[k].getName().equalsIgnoreCase("prev")){
                                    label[i].setToolTipText(this.history.peek().toString());
                                    this.elem[i].setLinkTo(this.history.peek().toString());
                              }
                          }// Anchor
// A
                          else if (this.elem[i].getName().equalsIgnoreCase("a")){
                              for (int j=0;j<this.elem[i].getNumattr();j++){
                                if (this.attrbname(i,j).equalsIgnoreCase("href")){
                                  label[i].setToolTipText(this.attrbvalue(i,j));
                                  this.elem[i].setLinkTo(this.attrbvalue(i,j));
                                }
                              }
                          }// tag A
                          else{// is not tag A tag anchor but is link
                            int k=i;
                            while (!this.elem[k].getName().equalsIgnoreCase("a")){
                              k--;
                            }
                            String[] name = new String[this.elem[i].getNumattr()];
                            String[] value = new String[this.elem[i].getNumattr()];
                            name = this.elem[k].getAttrbName();
                            value = this.elem[k].getAttrbValue();
                              for (int j=0;j<this.elem[k].getNumattr();j++){
                                if (name[j].equalsIgnoreCase("href")){
                                  label[i].setToolTipText(value[j]);
                                  this.elem[i].setLinkTo(value[j]);
                                }
                              }
                          }
                       }
                       // end tool tip
                        this.jEditorPane1.add(label[i]);
                        System.out.println(this.elem[i].getContent());
                        System.out.println(this.elem[i].getCo_x());
                        System.out.println(this.elem[i].getCo_y());
                        label[i].setBounds(this.elem[i].getCo_x(),this.elem[i].getCo_y(),this.findWidth(this.elem[i].getContent(),fm1),this.height);
           }//end if can show
      } // end content <> null
    }   // end for
 }    // end show1
void showall(){
     try{
     this.initFrame();
     this.numallnode = 1;
     this.jEditorPane1.removeAll();
     this.jEditorPane1.repaint();
     this.jEditorPane1.setText("");
     this.UrlInfo(this.des);
     this.getRoot();
     this.getnumallnode(this.e);
     this.par(this.e);
     this.setStyle();
     this.setCo();
     this.show1();
//      this.jTextField1.setText(this.des);
     }
      catch (JDOMException ex){
      this.jEditorPane1.removeAll();
      this.jEditorPane1.repaint();
      this.jEditorPane1.setText(ex.getMessage());
      }
      catch (IOException ex){
      this.jEditorPane1.removeAll();
      this.jEditorPane1.repaint();
      this.jEditorPane1.setText(ex.getMessage());
      }
}
String speacialChar(String st){
    String st2,st3="";
    for (int i = 0 ;i < st.length() ;i++){
        int j=0;
        if (st.charAt(i)== '&'){
          st2 = st.substring(i+1);
          if (st2.indexOf(";") != -1){
            st2.substring(0,st2.indexOf(";")-1);
              if (st2.equals("#34")){
               while(j < st.length()){
                  st3 = st3+st.charAt(j);
                   if(j==i){
                    j=j+5;
                    st3 = st3+'"';
                  }
                }
              } // end #34
             else if (st2.equals("quot")){
               while(j < st.length()){
                  st3 = st3+st.charAt(j);
                   if(j==i){
                    j=j+6;
                    st3 = st3+'"';
                  }
                }
              }// #quot

            else if ( (st2.equals("#38")) | (st2.equals("amp")) ){
               while(j < st.length()){
                  st3 = st3+st.charAt(j);
                   if(j==i){
                    j=j+5;
                    st3 = st3+'&';
                  }
                }
            }// #38 amp
            else if (st2.equals("#39")){
               while(j < st.length()){
                  st3 = st3+st.charAt(j);
                   if(j==i){
                    j=j+5;
                    st3 = st3+"'";
                  }
                }
              }// #39
            else if (st2.equals("apos")){
               while(j < st.length()){
                  st3 = st3+st.charAt(j);
                   if(j==i){
                    j=j+6;
                    st3 = st3+"'";
                  }
                }
              }// #apos
            else if (st2.equals("#60")){
               while(j < st.length()){
                  st3 = st3+st.charAt(j);
                   if(j==i){
                    j=j+5;
                    st3 = st3+'<';
                  }
                }
              }// #60
            else if (st2.equals("lt")){
               while(j < st.length()){
                  st3 = st3+st.charAt(j);
                   if(j==i){
                    j=j+4;
                    st3 = st3+'<';
                  }
                }
              }// #lt

            else if (st2.equals("#62")){
               while(j < st.length()){
                  st3 = st3+st.charAt(j);
                   if(j==i){
                    j=j+5;
                    st3 = st3+'>';
                  }
                }
              }// #62
            else if (st2.equals("gt")){
               while(j < st.length()){
                  st3 = st3+st.charAt(j);
                   if(j==i){
                    j=j+4;
                    st3 = st3+'>';
                  }
                }
              }// #gt
            else if ((st2.equals("#160")) | (st2.equals("nbsp"))){
               while(j < st.length()){
                  st3 = st3+st.charAt(j);
                   if(j==i){
                    j=j+6;
                    st3 = st3+' ';
                  }

              }// #160 nbsp
            st= st3;
            }
          }
        }
    }
    return st;
}// end special char
void up_press(){
  int j=0;int i =0;boolean bol=false;
             this.initFrame();
        for ( i=0;i < this.numallnode ;i++){
              if ( i > this.numallnode)
              break;
              if (this.elem[i].getIsHighlight()){
              j = i;
              }
        }

      i = j-1;
        while ((i >= 0) & (bol == false)){
            if ((this.elem[i].getIsLink()) & !(this.elem[i].getContent().equals(""))){
            this.elem[i].setIsHighlight(true);
            this.elem[j].setIsHighlight(false);
            bol = true;
            }
            i--;
        }
             this.jEditorPane1.removeAll();
             this.jEditorPane1.repaint();
             this.jEditorPane1.setText("");
             this.show1();
  }
  // DOWN
  void down_press(){
          int j=0;int i =0;boolean bol=false;
       this.initFrame();
        for ( i=0;i < this.numallnode ;i++){
              if ( i > this.numallnode)
              break;
              if (this.elem[i].getIsHighlight()){
              j = i;
              }
        }
      i = j+1;
        while ((i < this.numallnode) & (bol == false)){
            if ((this.elem[i].getIsLink()) & !(this.elem[i].getContent().equals(""))){
            this.elem[i].setIsHighlight(true);
            this.elem[j].setIsHighlight(false);
            bol = true;
            }
            i++;
        }
             this.jEditorPane1.removeAll();
             this.jEditorPane1.repaint();
             this.jEditorPane1.setText("");
             this.show1();
}
//enter
void enter_press(){
      boolean bol = false;
//  if (this.des.charAt(0) != '#'){     // link to another card another file
//       this.showall();
      if (!this.history.empty()){
       if (!this.history.peek().toString().equals(this.des))
       this.history.push(this.des);
      }

     for (int i = 0 ; i < this.numallnode ; i++){ // Find link to
          if (this.elem[i].getIsHighlight()){
 //           if((!this.elem[i].getLinkTo().equals(null))){
                this.des = this.elem[i].getLinkTo();
                bol = true;
 //           }
            String[] name = new String[elem[i].getNumattr()];
            String[] value = new String[elem[i].getNumattr()];
            name = this.elem[i].getAttrbName();
            value = this.elem[i].getAttrbValue();
            /*     for(int j = 0 ; j < this.elem[i].getNumattr();j++){
                        if (name[j].equalsIgnoreCase("href")){
                            this.des = value[j];
                            bol = true;
                        }
                  }*/
                  int k=i;

                if (!bol){

                    while ((!this.elem[k].getName().equalsIgnoreCase("a")) & (!this.elem[k].getName().equalsIgnoreCase("anchor")) ){
                      k--;
                    }
                    if(this.elem[i].getName().equalsIgnoreCase("a")){
                          name = this.elem[k].getAttrbName();
                          value = this.elem[k].getAttrbValue();
                      for(int j = 0 ; j < this.elem[k].getNumattr();j++){
                           if (name[j].equalsIgnoreCase("href")){
                               this.des = value[j];
                                bol = true;
                            }
                        }
                    }// end if a
                    else if (this.elem[k].getName().equalsIgnoreCase("anchor")){
                      int l = k;
                      while((!this.elem[l].getName().equalsIgnoreCase("go")) & (!this.elem[l].getName().equalsIgnoreCase("prev")) & ( l < this.numallnode) & (elem[l].getCanshow())){
                        l++;
                      }// end while
                      if (this.elem[l].getName().equalsIgnoreCase("go")){
                        for (int m = 0 ;m < this.elem[l].getNumattr() ; m++){
                          if (this.attrbname(l,m).equalsIgnoreCase("href")){
                            this.des = this.attrbvalue(l,m);
                          }
                        }
                      }
                      else if (this.elem[l].getName().equalsIgnoreCase("prev")){

                          this.des = this.history.peek().toString();
                           System.out.println(this.des);
                          if (this.history.empty()){
                            this.history.push(this.des);
                          }
                      }
                    }
                }// end if !bol
            }
      } // end for
    if (this.des.charAt(0) != '#'){
      this.UrlInfo(this.des);
      this.showall();
    }// end if char <> #
    else {          // link to same file but another card
        String[] name = new String[this.numallnode];
        String[] value = new String[this.numallnode];
        String st = this.des.substring(1,this.des.length());
        this.anchor = st;
        this.des = this.protocol+"://"+this.hostname+this.path+this.file+'#'+this.anchor;
        this.UrlInfo(this.des);
        for (int i =0 ; i < this.numallnode ; i++ ){
           name = this.elem[i].getAttrbName();
           value = this.elem[i].getAttrbValue();
          if((this.elem[i].getName().equalsIgnoreCase("card")) & (!this.elem[i].getCanshow())){
              for ( j = 0 ;j< this.elem[i].getNumattr() ; j++){
                if ((name[j].equalsIgnoreCase("id")) & (value[j].equals(st))){
                  this.elem[i].setCanshow(true);   // enable new card
                }
              }
            }
            else if (this.elem[i].getCanshow()){
                  this.elem[i].setCanshow(false);   // disable old card
               }
        }// end for
        this.x=5;
        this.y=0;
        this.setStyle();
        this.setCo();
        this.jEditorPane1.removeAll();
        this.jEditorPane1.repaint();
        this.jEditorPane1.setText("");
        this.show1();
        this.jTextField1.setText(this.des);
        this.UrlInfo(this.des);
    }// link same deck but another card

}
//----------------------- end method
// end enter
  // -- end method


  void jButtonOpt_actionPerformed(ActionEvent e) { // ------- Softkey Left

  }
  void jButtonEnd_actionPerformed(ActionEvent e) { // ------- Softkey Right
    this.showall();
    InputArea.setVisible(false);
    jEditorPane1.setVisible(true);
  }
  void jButtonGreen_actionPerformed(ActionEvent e) {// ------- Home
    try{
      FileReader fin = new FileReader("home.txt");
      BufferedReader bin = new BufferedReader(fin);
      this.des = bin.readLine();
      bin.close();
      this.showall();
      if (!this.history.empty()){
       if (!this.history.peek().toString().equalsIgnoreCase(this.des))
        this.history.push(this.des);
      }
    }
      catch(IOException ex){
      this.jEditorPane1.setText(ex.getMessage());
      }
      catch(EmptyStackException ex){
      this.jEditorPane1.setText(ex.getMessage());
      }
  }
  void jButtonRed_actionPerformed(ActionEvent e) { // ------- Stop

  }
  void jButtonUp_actionPerformed(ActionEvent e) { // --------- UP
    this.up_press();
  }
  void jButtonDown_actionPerformed(ActionEvent e) {// --------- Down
    this.down_press();
  }
  void jButtonLeft_actionPerformed(ActionEvent e) { // -------- Left

  }
  void jButtonRight_actionPerformed(ActionEvent e) { // -------- Right

  }
  void jButtonO_actionPerformed(ActionEvent e) { //------------- Go
    if (IsInput){
      if (InputArea.getText().substring(0,7).compareTo("http://")==0){}
        if (!this.history.empty()){
          if (!this.history.peek().toString().equals(this.des))
            this.history.push(this.des);
          }
        this.des=InputArea.getText();
        this.showall();
      InputArea.setVisible(false);
      jEditorPane1.setVisible(true);
      IsInput = false;
      f2.jTextField1.setText(InputArea.getText());
    }
    else{
    this.enter_press();
    }
  }
  void jButtonPower_actionPerformed(ActionEvent e) { //------------- Close
    System.exit(0);
  }

  void jMenuOpenU_actionPerformed(ActionEvent e) {
    InputArea.setText("");
    InputArea.append(this.des);
    jEditorPane1.setVisible(false);
    IsInput = true;
    InputArea.setVisible(true);
    f2.jTextField1.setText(InputArea.getText());
  }
  /**File | Exit action performed*/
  public void jMenuFileExit_actionPerformed(ActionEvent e) {
    System.exit(0);

  }
  /**Help | About action performed*/
  public void jMenuHelpAbout_actionPerformed(ActionEvent e) {
  }
  /**Overridden so we can exit when window is closed*/
  protected void processWindowEvent(WindowEvent e) {
    super.processWindowEvent(e);
    if (e.getID() == WindowEvent.WINDOW_CLOSING) {
      jMenuFileExit_actionPerformed(null);
    }
  }

  void contentPane_mouseClicked(MouseEvent e) {
    if (e.getModifiers()==4) {
          JPopupMenu jpmu = new JPopupMenu () ;//already define at line 95
          jpmu.add(jMenuBack) ;
          jpmu.add(jMenuStop) ;
          jpmu.add(jMenuRefresh) ;
          jpmu.addSeparator();
          jpmu.add(jMenuOpenU) ;
          jpmu.add(jMenuHome) ;
          jpmu.add(jMenuSearch) ;
          jpmu.addSeparator();
          jpmu.add(jMenuFav) ;
          jpmu.add(jMenuPrint) ;
          jpmu.add(jMenuAbout) ;
          jpmu.addSeparator();
          jpmu.add(jMenuSource) ;
          jpmu.addSeparator();
          jpmu.add(jMenuExit) ;
          jpmu.show(contentPane,e.getX(),e.getY()) ;
          }
  }



  void jMenuSource_actionPerformed(ActionEvent e) {
    f2.show();
  }

  void jMenuBack_actionPerformed(ActionEvent e) { // ----------- Back
    String st = new String();
      if (!this.history.empty()){
        st = this.history.pop().toString();
        if ((st==this.des) & (!this.history.empty())){
          st = this.history.pop().toString();
        }
      }
      if (this.history.empty()){
          this.history.push(st);
      }
      this.des = st;
      this.showall();
  }


class Frame1_jMenuOpenU_actionAdapter implements java.awt.event.ActionListener {
  Frame1 adaptee;

  Frame1_jMenuOpenU_actionAdapter(Frame1 adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuOpenU_actionPerformed(e);
  }
}

class Frame1_jMenuSource_actionAdapter implements java.awt.event.ActionListener {
  Frame1 adaptee;

  Frame1_jMenuSource_actionAdapter(Frame1 adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuSource_actionPerformed(e);
  }
}

class Frame1_jMenuBack_actionAdapter implements java.awt.event.ActionListener {
  Frame1 adaptee;

  Frame1_jMenuBack_actionAdapter(Frame1 adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuBack_actionPerformed(e);
  }
}
}

/*class ActionListener implements java.awt.event.ActionListener {
  Frame1 adaptee;

  ActionListener(Frame1 adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jButtonEnd_actionPerformed(e);
  }
}
*/


