//package DBAService;

import java.awt.*;
import java.awt.event.*;
import java.applet.*;
import java.io.*;
import java.util.*;
import java.net.*;
import java.net.URL;
import java.lang.*;
//import com.borland.jbcl.layout.*;
//import com.borland.jbcl.control.*;

public class RestandSale extends Applet {
  boolean isStandalone = false;
  int x, y,Col,Row,len,colon,sami,j;
  int posX=0;
  int posY=0;
  double C,R;
  String pic="";
  String PicTmp="";
  String[][] PicHp = new String[8][10];        //Display Image map
  String[][] BackUp = new String[8][10];       //Back up Image map
  String Home[] = {"home","Condo","HomeF","HomeType2","HomeType3"};
  String Imagetmp="";
  int initX=94;
  int initY=20;
  int selectX=0;
  int selectY=0;
  int oldX=0;
  int oldY=0;
  int semi;
  int leng;
  String Name="";
  InputStream file = null;
 	URL url;
 	byte[] bytestream;

  Image gif,gif2,gif3,gif4,PicReserv;
  Button button1 = new Button();
  boolean SelectHome = false;
  boolean ImageHome = false;
  Button button2 = new Button();
  Label s4 = new Label();
  Label s2 = new Label();
  Label s3 = new Label();
  Label s5 = new Label();


  //Construct the applet
  public RestandSale() {
  }

  //Initialize the applet
  public void init() {
    try  {

      jbInit();
    }
    catch(Exception e)  {
      e.printStackTrace();
    }
  }

  //Component initialization
   void jbInit() throws Exception {


    this.setLayout(null);
    this.setBackground(Color.white);
    this.addMouseMotionListener(new java.awt.event.MouseMotionAdapter() {

      public void mouseMoved(MouseEvent e) {
        this_mouseMoved(e);
      }
    });
    this.addMouseListener(new java.awt.event.MouseAdapter() {

      public void mousePressed(MouseEvent e) {
        this_mousePressed(e);
      }
    });

    button1.setBounds(new Rectangle(137, 290, 82, 26));
    button1.setFont(new java.awt.Font("Monospaced", 1, 12));
    Imagetmp = getImageCus();

      Row=0;
      Col=0;
      int i;
      for(Row=0;Row<8;Row++)
      {
        for(Col=0;Col<10;Col++)
        {
           leng = Imagetmp.length();
           semi = Imagetmp.indexOf(';');
           pic  = Imagetmp.substring(0,semi);
           PicHp[Row][Col] = pic;
           BackUp[Row][Col] = pic;
           Imagetmp = Imagetmp.substring(semi+1,leng);
         }
       }

     /*    for(Row=0;Row<8;Row++)
         {
          for(Col=0;Col<10;Col++)
           {
             display.appendText(PicHp[Row][Col]+"\n");

           }//for
         }//for     */


    button1.setLabel("จอง");
    button1.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        button1_actionPerformed(e);
      }
    });
    button2.setBounds(new Rectangle(273, 289, 88, 26));
    button2.setFont(new java.awt.Font("Monospaced", 1, 12));
    button2.setLabel("ยกเลิกการจอง");
    button2.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        button2_actionPerformed(e);
      }
    });
    button2.addMouseMotionListener(new java.awt.event.MouseMotionAdapter() {

      public void mouseMoved(MouseEvent e) {
        button2_mouseMoved(e);
      }
    });
    s4.setText("การจองสมบูรณ์");
    s4.setForeground(Color.lightGray);
    s4.setName("s4");
    s4.setFont(new java.awt.Font("Dialog", 1, 14));
    s4.setBounds(new Rectangle(403, 126, 85, 28));
    s4.setBackground(new java.awt.Color(0, 172, 169));
    s2.setBackground(new java.awt.Color(0, 172, 169));
    s2.setBounds(new Rectangle(419, 72, 69, 31));
    s2.setFont(new java.awt.Font("Dialog", 1, 14));
    s2.setForeground(Color.red);
    s2.setName("s2");
    s2.setText("เริ่มจอง");
    s3.setText("Load ภาพ");
    s3.setForeground(Color.lightGray);
    s3.setName("s3");
    s3.setFont(new java.awt.Font("Dialog", 1, 14));
    s3.setBounds(new Rectangle(413, 99, 79, 28));
    s3.setBackground(new java.awt.Color(0, 172, 169));
    s5.setBackground(new java.awt.Color(0, 172, 169));
    s5.setBounds(new Rectangle(401, 154, 91, 28));
    s5.setFont(new java.awt.Font("Dialog", 1, 14));
    s5.setForeground(Color.lightGray);
    s5.setName("s5");
    s5.setText("ไม่สามารถจองได้");
    this.add(button1, null);
    this.add(button2, null);
    this.add(s3, null);
    this.add(s5, null);
    this.add(s4, null);
    this.add(s2, null);
    String tmp = neverReserv();
    tmp = tmp.trim();
    if(tmp.equals("true"))
    {
      s2.setForeground(Color.lightGray);
      s5.setForeground(Color.red);
      button1.disable();
      button2.disable();

    }
  }

  public void update(Graphics g) {paint (g);}

  public void paint(Graphics g) {
      g.setColor(Color.cyan);
      g.fill3DRect(0,0,500,280,false);
      g.setColor(Color.white);
     // g.fill3DRect(13,20,60,40,false);
     // g.fill3DRect(400,20,98,40,false);
      g.setColor(Color.black);
      g.drawLine(93,18,395,18);       //Side up
      g.drawLine(93,19,395,19);
      g.drawLine(93,260,395,260);     //Side below
      g.drawLine(93,261,395,261);
      g.drawLine(92,18,92,260);       //Side left
      g.drawLine(93,18,93,260);
      g.drawLine(394,18,394,260);     //Side right
      g.drawLine(395,18,395,260);
      if (SelectHome)
      {
        g.drawImage(PicReserv,selectX,selectY,30,30,this);
        g.setColor(Color.yellow);
        g.drawLine(selectX,selectY,selectX+30,selectY);           //Side up
        g.drawLine(selectX,selectY+1,selectX+30,selectY+1);
        g.drawLine(selectX,selectY+30,selectX+30,selectY+30);     //Side below
        g.drawLine(selectX,selectY+30+1,selectX+30,selectY+30+1);
        g.drawLine(selectX-1,selectY,selectX-1,selectY+30);       //Side left
        g.drawLine(selectX,selectY,selectX,selectY+30);
        g.drawLine(selectX+30,selectY,selectX+30,selectY+30);     //Side right
        g.drawLine(selectX+30+1,selectY,selectX+30+1,selectY+30);
       }

        for(Row=0;Row<8;Row++)
         {
          for(Col=0;Col<10;Col++)
           {
              PicTmp = PicHp[Row][Col];
              gif4 = getImage(getCodeBase(),"images/"+PicTmp+".gif");
              posX = initX+(Col*30);
              posY = initY+(Row*30);
              g.drawImage(gif4,posX,posY,30,30,this);
           }//for
         }//for

      if (SelectHome)
      {
        g.drawImage(PicReserv,selectX,selectY,30,30,this);
        g.setColor(Color.yellow);
        g.drawLine(selectX,selectY,selectX+30,selectY);           //Side up
        g.drawLine(selectX,selectY+1,selectX+30,selectY+1);
        g.drawLine(selectX,selectY+30,selectX+30,selectY+30);     //Side below
        g.drawLine(selectX,selectY+30+1,selectX+30,selectY+30+1);
        g.drawLine(selectX-1,selectY,selectX-1,selectY+30);       //Side left
        g.drawLine(selectX,selectY,selectX,selectY+30);
        g.drawLine(selectX+30,selectY,selectX+30,selectY+30);     //Side right
        g.drawLine(selectX+30+1,selectY,selectX+30+1,selectY+30);
      }

    g.dispose();
   }

  void button1_actionPerformed(ActionEvent e) {
     if (e.getActionCommand()=="จอง")
     {
       s2.setForeground(Color.lightGray);
       oldX = selectX;
       oldY = selectY;
       double z1 =(selectX-initX)/30.0D;
       C =Math.ceil(z1);
       double z2 =(selectY-initY)/30.0D;
		   R =Math.ceil(z2);
       PicHp[(int) R][(int) C]="home_Rest";
       insertReserv();
       updateImage();
       s4.setForeground(Color.red);
       button1.disable();
     }
  }

//---------------------------- geImage ------------------------//

   void button2_actionPerformed(ActionEvent e) {
     if (e.getActionCommand()=="ยกเลิกการจอง")
     {
       s2.setForeground(Color.lightGray);
       s4.setForeground(Color.lightGray);
       //Imagetmp = getImageCus();
       Row=0;
       Col=0;
       int i;
       for(Row=0;Row<8;Row++)
       {
         for(Col=0;Col<10;Col++)
         {
           PicHp[Row][Col] = BackUp[Row][Col];
          }
        }

/*         for(Row=0;Row<8;Row++)
         {
          for(Col=0;Col<10;Col++)
           {
             display.appendText(PicHp[Row][Col]+"\n");

           }//for
         }//for   */
     }
     repaint();
     s3.setForeground(Color.red);
     updateImage();
     deleteReserv();
     s2.setForeground(Color.red);
     s3.setForeground(Color.lightGray);
     button1.enable();
    // button2.disable();
  }

  void this_mousePressed(MouseEvent e) {
      x = e.getX(); y = e.getY();
      showStatus(x + "," + y);

	 //------ Row 1 -------
	 if ((x>=93) && (x<=123) && (y>=18) && (y<=48))
      {
        selectX=93; selectY=18;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }

      }
	 if ((x>=123) && (x<=153) && (y>=18) && (y<=48))
      {
        selectX=123; selectY=18;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }

      }
	if ((x>=153) && (x<=183) && (y>=18) && (y<=48))
      {
        selectX=153; selectY=18;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }

      }
	 if ((x>=183) && (x<=213) && (y>=18) && (y<=48))
      {
        selectX=183; selectY=18;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }

      }
	if ((x>=213) && (x<=243) && (y>=18) && (y<=48))
      {
        selectX=213; selectY=18;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }

      }
	 if ((x>=243) && (x<=273) && (y>=18) && (y<=48))
      {
        selectX=243; selectY=18;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }

      }
	if ((x>=273) && (x<=303) && (y>=18) && (y<=48))
      {
        selectX=273; selectY=18;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }

      }
	 if ((x>=303) && (x<=333) && (y>=18) && (y<=48))
      {
        selectX=303; selectY=18;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }

      }
	if ((x>=333) && (x<=363) && (y>=18) && (y<=48))
      {
        selectX=333; selectY=18;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }

      }
	 if ((x>=363) && (x<=393) && (y>=18) && (y<=48))
      {
        selectX=363; selectY=18;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
   //------ Row 2 -------
	 if ((x>=93) && (x<=123) && (y>=48) && (y<=78))
      {
        selectX=93; selectY=48;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=123) && (x<=153) && (y>=48) && (y<=78))
      {
        selectX=123; selectY=48;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=153) && (x<=183) && (y>=48) && (y<=78))
      {
        selectX=153; selectY=48;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=183) && (x<=213) && (y>=48) && (y<=78))
      {
        selectX=183; selectY=48;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=213) && (x<=243) && (y>=48) && (y<=78))
      {
        selectX=213; selectY=48;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=243) && (x<=273) && (y>=48) && (y<=78))
      {
        selectX=243; selectY=48;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=273) && (x<=303) && (y>=48) && (y<=78))
      {
        selectX=273; selectY=48;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=303) && (x<=333) && (y>=48) && (y<=78))
      {
        selectX=303; selectY=48;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }

      }
	if ((x>=333) && (x<=363) && (y>=48) && (y<=78))
      {
        selectX=333; selectY=48;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=363) && (x<=393) && (y>=48) && (y<=78))
      {
        selectX=363; selectY=48;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
   //------ Row 3 -------
	 if ((x>=93) && (x<=123) && (y>=78) && (y<=108))
      {
        selectX=93; selectY=78;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=123) && (x<=153) && (y>=78) && (y<=108))
      {
        selectX=123; selectY=78;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=153) && (x<=183) && (y>=78) && (y<=108))
      {
        selectX=153; selectY=78;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=183) && (x<=213) && (y>=78) && (y<=108))
      {
        selectX=183; selectY=78;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=213) && (x<=243) && (y>=78) && (y<=108))
      {
        selectX=213; selectY=78;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=243) && (x<=273) && (y>=78) && (y<=108))
      {
        selectX=243; selectY=78;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=273) && (x<=303) && (y>=78) && (y<=108))
      {
        selectX=273; selectY=78;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=303) && (x<=333) && (y>=78) && (y<=108))
      {
        selectX=303; selectY=78;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=333) && (x<=363) && (y>=78) && (y<=108))
      {
        selectX=333; selectY=78;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=363) && (x<=393) && (y>=78) && (y<=108))
      {
        selectX=363; selectY=78;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
   //------ Row 4 -------
	 if ((x>=93) && (x<=123) && (y>=108) && (y<=138))
      {
        selectX=93; selectY=108;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=123) && (x<=153) && (y>=108) && (y<=138))
      {
        selectX=123; selectY=108;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=153) && (x<=183) && (y>=108) && (y<=138))
      {
        selectX=153; selectY=108;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=183) && (x<=213) && (y>=108) && (y<=138))
      {
        selectX=183; selectY=108;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=213) && (x<=243) && (y>=108) && (y<=138))
      {
        selectX=213; selectY=108;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=243) && (x<=273) && (y>=108) && (y<=138))
      {
        selectX=243; selectY=108;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=273) && (x<=303) && (y>=108) && (y<=138))
      {
        selectX=273; selectY=108;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=303) && (x<=333) && (y>=108) && (y<=138))
      {
        selectX=303; selectY=108;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=333) && (x<=363) && (y>=108) && (y<=138))
      {
        selectX=333; selectY=108;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=363) && (x<=393) && (y>=108) && (y<=138))
      {
        selectX=363; selectY=108;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
   //------ Row 5 -------
	 if ((x>=93) && (x<=123) && (y>=138) && (y<=168))
      {
        selectX=93; selectY=138;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=123) && (x<=153) && (y>=138) && (y<=168))
      {
        selectX=123; selectY=138;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=153) && (x<=183) && (y>=138) && (y<=168))
      {
        selectX=153; selectY=138;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=183) && (x<=213) && (y>=138) && (y<=168))
      {
        selectX=183; selectY=138;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=213) && (x<=243) && (y>=138) && (y<=168))
      {
        selectX=213; selectY=138;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=243) && (x<=273) && (y>=138) && (y<=168))
      {
        selectX=243; selectY=138;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=273) && (x<=303) && (y>=138) && (y<=168))
      {
        selectX=273; selectY=138;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=303) && (x<=333) && (y>=138) && (y<=168))
      {
        selectX=303; selectY=138;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=333) && (x<=363) && (y>=138) && (y<=168))
      {
        selectX=333; selectY=138;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=363) && (x<=393) && (y>=138) && (y<=168))
      {
        selectX=363; selectY=138;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
   //------ Row 6 -------
	 if ((x>=93) && (x<=123) && (y>=168) && (y<=198))
      {
        selectX=93; selectY=168;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=123) && (x<=153) && (y>=168) && (y<=198))
      {
        selectX=123; selectY=168;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=153) && (x<=183) && (y>=168) && (y<=198))
      {
        selectX=153; selectY=168;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=183) && (x<=213) && (y>=168) && (y<=198))
      {
        selectX=183; selectY=168;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=213) && (x<=243) && (y>=168) && (y<=198))
      {
        selectX=213; selectY=168;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=243) && (x<=273) && (y>=168) && (y<=198))
      {
        selectX=243; selectY=168;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=273) && (x<=303) && (y>=168) && (y<=198))
      {
        selectX=273; selectY=168;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=303) && (x<=333) && (y>=168) && (y<=198))
      {
        selectX=303; selectY=168;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=333) && (x<=363) && (y>=168) && (y<=198))
      {
        selectX=333; selectY=168;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=363) && (x<=393) && (y>=168) && (y<=198))
      {
        selectX=363; selectY=168;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
   //------ Row 7 -------
	 if ((x>=93) && (x<=123) && (y>=198) && (y<=228))
      {
        selectX=93; selectY=198;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=123) && (x<=153) && (y>=198) && (y<=228))
      {
        selectX=123; selectY=198;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=153) && (x<=183) && (y>=198) && (y<=228))
      {
        selectX=153; selectY=198;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=183) && (x<=213) && (y>=198) && (y<=228))
      {
        selectX=183; selectY=198;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=213) && (x<=243) && (y>=198) && (y<=228))
      {
        selectX=213; selectY=198;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=243) && (x<=273) && (y>=198) && (y<=228))
      {
        selectX=243; selectY=198;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=273) && (x<=303) && (y>=198) && (y<=228))
      {
        selectX=273; selectY=198;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=303) && (x<=333) && (y>=198) && (y<=228))
      {
        selectX=303; selectY=198;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=333) && (x<=363) && (y>=198) && (y<=228))
      {
        selectX=333; selectY=198;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=363) && (x<=393) && (y>=198) && (y<=228))
      {
        selectX=363; selectY=198;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }

   //------ Row 8 -------
	 if ((x>=93) && (x<=123) && (y>=228) && (y<=258))
      {
        selectX=93; selectY=228;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=123) && (x<=153) && (y>=228) && (y<=258))
      {
        selectX=123; selectY=228;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=153) && (x<=183) && (y>=228) && (y<=258))
      {
        selectX=153; selectY=228;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=183) && (x<=213) && (y>=228) && (y<=258))
      {
        selectX=183; selectY=228;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=213) && (x<=243) && (y>=228) && (y<=258))
      {
        selectX=213; selectY=228;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=243) && (x<=273) && (y>=228) && (y<=258))
      {
        selectX=243; selectY=228;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=273) && (x<=303) && (y>=228) && (y<=258))
      {
        selectX=273; selectY=228;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=303) && (x<=333) && (y>=228) && (y<=258))
      {
        selectX=303; selectY=228;

        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	if ((x>=333) && (x<=363) && (y>=228) && (y<=258))
      {
        selectX=333; selectY=228;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }
	 if ((x>=363) && (x<=393) && (y>=228) && (y<=258))
      {
        selectX=363; selectY=228;
        if (checkHome(selectX,selectY))
        {
           SelectHome = true;
           PicReserv = getImage(getCodeBase(),"images/home_Rest.gif");
           repaint();
           ImageHome = false;
        }
      }

  }

  public boolean checkHome(int selectX,int selectY) {
    double z1 =(selectX-initX)/30.0D;
		C =Math.ceil(z1);
    double z2 =(selectY-initY)/30.0D;
		R =Math.ceil(z2);
    pic =PicHp[(int) R][(int) C];
   for(int i=0;i<6;i++)
   {
     if(pic.equals(Home[i]))
     {
       ImageHome =true;
       i=6;
      }
   }
    return ImageHome;
  }
//---------------------------- geImage ------------------------//
    public String getImageCus()
  {
    String Name="";
    InputStream file1 = null;

 	  byte[] bytestream;
    String ProImage="";

    try	{
          s3.setForeground(Color.red);
          URL url = new URL("http://kling/test/GetImageCusS");
          file1 = url.openStream();
			  }//try
			  catch (IOException ioe) {

        }
        catch (Exception e) {
          e.printStackTrace();
          return null;
        }

	 	try	{
				  bytestream = new byte[2000];
				  //code.setText("");
				  for (int i = 0; i < 2000; i++ )
				  {
					   bytestream[i] = 0;
				  }
          while (file1.read(bytestream) > 0) {

					   ProImage+=new String(bytestream);
				    }
			   }
			   catch (IOException ioe) { }
    //if(Test>1)
      // return getProjectName();
    return ProImage;
  }

//-------------------------Insert Image to DataBase ---------------------------//
public String insertReserv()
	{
    String inp="";
    String ImageStr="";
    String Temp="";
 		try	{
         
          //--- Define URL link to servlet file is insert image to DB -----
         url = new URL("http://kling/test/InsertReservS?SELECTx="+selectX+"&SELECTy="+selectY);
     		 file = url.openStream();
			 }
			catch (MalformedURLException mfURLe) {
				/*code.setText("File \"");
				code.append(check.getSelectedCheckbox().getLabel());
				code.append("\"not found");*/
			}
			catch (IOException ioe) {
				//code.setText("I/O ERROR");
			}

	 		try	{
				bytestream = new byte[2000];
				//code.setText("");
				for (int i = 0; i < 2000; i++ )
				{
					bytestream[i] = 0;
				}
				while (file.read(bytestream) > 0) {
					inp+=new String(bytestream);
				}
			}
			catch (IOException ioe) {
				//code.setText("I/O ERROR");
			}
      return inp;
	}

//-------------------------UpDate Image to DataBase ---------------------------//
public String updateImage()
	{
    String inp="";
    String ImageStr="";
    String Temp="";
 		try	{
          for(Row=0;Row<8;Row++)
          {
           for(Col=0;Col<10;Col++)
           {
             Temp = PicHp[Row][Col]+";";
             ImageStr = ImageStr+Temp;
           }//for
          }//for
          //--- Define URL link to servlet file is insert image to DB -----
         url = new URL("http://kling/test/UpdateImageS?IMAGE="+ImageStr);
     		 file = url.openStream();
			 }
			catch (MalformedURLException mfURLe) {
				/*code.setText("File \"");
				code.append(check.getSelectedCheckbox().getLabel());
				code.append("\"not found");*/
			}
			catch (IOException ioe) {
				//code.setText("I/O ERROR");
			}

	 		try	{
				bytestream = new byte[2000];
				//code.setText("");
				for (int i = 0; i < 2000; i++ )
				{
					bytestream[i] = 0;
				}
				while (file.read(bytestream) > 0) {
					inp+=new String(bytestream);
				}
			}
			catch (IOException ioe) {
				//code.setText("I/O ERROR");
			}
      return inp;
	}
//-------------------------Delete Data Reservaion in table ---------------------------//
public String deleteReserv()
	{
    String inp="";
    String ImageStr="";
    String Temp="";
 		try	{
          //--- Define URL link to servlet file is insert image to DB -----
         url = new URL("http://kling/test/DeleteReservS?SELECTx="+oldX+"&SELECTy="+oldY);
     		 file = url.openStream();
			 }
			catch (MalformedURLException mfURLe) {
				/*code.setText("File \"");
				code.append(check.getSelectedCheckbox().getLabel());
				code.append("\"not found");*/
			}
			catch (IOException ioe) {
				//code.setText("I/O ERROR");
			}

	 		try	{
				bytestream = new byte[2000];
				//code.setText("");
				for (int i = 0; i < 2000; i++ )
				{
					bytestream[i] = 0;
				}
				while (file.read(bytestream) > 0) {
					inp+=new String(bytestream);
				}
			}
			catch (IOException ioe) {
				//code.setText("I/O ERROR");
			}
      return inp;
	}

 //---------------------------Check login session Customer ------------------------//
 public String checkUserSession()
  {
    InputStream file1 = null;
 	  byte[] bytestream;
    String CheckNull="";
    try	{

          URL url = new URL("http://kling/test/CheckUserSession");
          file1 = url.openStream();

			  }//try
			  catch (IOException ioe) {

        }
        catch (Exception e) {
          e.printStackTrace();
          return null;
        }

	 	try	{
				  bytestream = new byte[2000];
				  //code.setText("");
				  for (int i = 0; i < 2000; i++ )
				  {
					   bytestream[i] = 0;
				  }
          while (file1.read(bytestream) > 0) {

					   CheckNull+=new String(bytestream);
				    }
			   }
			   catch (IOException ioe) { }
    return CheckNull;
  }

 public String neverReserv()
	{
    String inp="";
    String ImageStr="";
    String Temp="";
 		try	{
          //--- Define URL link to servlet file is insert image to DB -----
         url = new URL("http://kling/test/NeverReserv");
     		 file = url.openStream();
			 }
			catch (MalformedURLException mfURLe) {
				/*code.setText("File \"");
				code.append(check.getSelectedCheckbox().getLabel());
				code.append("\"not found");*/
			}
			catch (IOException ioe) {
				//code.setText("I/O ERROR");
			}

	 		try	{
				bytestream = new byte[2000];
				//code.setText("");
				for (int i = 0; i < 2000; i++ )
				{
					bytestream[i] = 0;
				}
				while (file.read(bytestream) > 0) {
					inp+=new String(bytestream);
				}
			}
			catch (IOException ioe) {
				//code.setText("I/O ERROR");
			}
      return inp;
	}


  void button2_mouseMoved(MouseEvent e) {

  }

  void this_mouseMoved(MouseEvent e) {



   }

  void button3_actionPerformed(ActionEvent e) {
     }
}//RestandSale



//<applet code= "RestandSale.class" width=100% height=100%></applet>

