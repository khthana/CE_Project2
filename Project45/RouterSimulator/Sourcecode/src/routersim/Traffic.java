package routersim;

import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import com.borland.jbcl.layout.*;
import javax.swing.border.*;
import java.util.*;
import java.rmi.Naming;
import javax.swing.ImageIcon;
import java.lang.*;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */

public class Traffic extends JDialog implements java.io.Serializable{
  private String Trafficshape = "";
  private int Value =0;
  private int t1=0;
  private int t2=0;
  private float BW1=0;
  private int Cost =0;
  private double numberof_time=0.0000000;
  private JPanel panel1 = new JPanel();
  private TitledBorder titledBorder1;
  private TitledBorder titledBorder2;
  private TitledBorder titledBorder3;
  private TitledBorder titledBorder4;
  private JPanel jPanel1 = new JPanel();
  private JLabel jLabel1 = new JLabel();
  private Choice shape = new Choice();
  private JPanel jPanel2 = new JPanel();
  private TitledBorder titledBorder5;
  private TitledBorder titledBorder6;
  private JPanel jPanel3 = new JPanel();
  private TitledBorder titledBorder7;
  private JPanel jPanel4 = new JPanel();
  private TitledBorder titledBorder8;
  private TitledBorder titledBorder9;
  private TitledBorder titledBorder10;
  private TitledBorder titledBorder11;
  private TitledBorder titledBorder12;
  private JButton jButton1 = new JButton();
  private JButton jButton2 = new JButton();
  private JLabel jLabel2 = new JLabel();
  private JLabel jLabel3 = new JLabel();
  private JTextField jConstant = new JTextField();
  private JLabel jLabel4 = new JLabel();
  private JTextField jt1 = new JTextField();
  private JTextField jt2 = new JTextField();
  private JLabel jLabel5 = new JLabel();
  private JLabel jLabel6 = new JLabel();
  private JLabel jLabel7 = new JLabel();
  private XYLayout xYLayout1 = new XYLayout();
  private XYLayout xYLayout2 = new XYLayout();
  private XYLayout xYLayout3 = new XYLayout();
  private XYLayout xYLayout4 = new XYLayout();
  private XYLayout xYLayout5 = new XYLayout();
  private JLabel jLabel8 = new JLabel();
  private JTextField jConstant1 = new JTextField();
  private JLabel jLabel9 = new JLabel();
  private JLabel jLabel10 = new JLabel();
  ImageIcon image1,image2;
  private JLabel jLabel11 = new JLabel();

  public Traffic(Frame frame, String title, boolean modal) {
    super(frame, title, modal);
    try {
      jbInit();
      pack();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }

  public Traffic() {
    this(null, "", false);
  }
  private void jbInit() throws Exception {
    //choice1.setSize(10,3);
    //choice2.setSize(10,3);//
    image1 = new ImageIcon(Traffic.class.getResource("pulse.jpg"));
    image2 = new ImageIcon(Traffic.class.getResource("traffic.gif"));
    titledBorder1 = new TitledBorder(BorderFactory.createEtchedBorder(Color.white,new Color(148, 145, 140)),"");
    titledBorder2 = new TitledBorder("");
    titledBorder3 = new TitledBorder(BorderFactory.createLineBorder(Color.white,1),"");
    titledBorder4 = new TitledBorder("");
    titledBorder5 = new TitledBorder("");
    titledBorder6 = new TitledBorder("");
    titledBorder7 = new TitledBorder("");
    titledBorder8 = new TitledBorder("");
    titledBorder9 = new TitledBorder("");
    titledBorder10 = new TitledBorder(BorderFactory.createEtchedBorder(Color.white,new Color(148, 145, 140)),"Random");
    titledBorder11 = new TitledBorder(BorderFactory.createEtchedBorder(Color.white,new Color(148, 145, 140)),"Constants");
    titledBorder12 = new TitledBorder(BorderFactory.createEtchedBorder(Color.white,new Color(148, 145, 140)),"Pulse");
    panel1.setLayout(null);
    panel1.setBackground(Color.white);
    panel1.setMinimumSize(new Dimension(100, 70));
    panel1.setPreferredSize(new Dimension(100, 70));
    this.setTitle("Traffic Generator");
    this.getContentPane().setLayout(xYLayout1);

    shape.addItem("None");
    shape.addItem("Random");
    shape.addItem("Constants");
    shape.addItem("Pulse");



    jPanel1.setLayout(xYLayout2);
    jLabel1.setText("Traffic shape");
    shape.addItemListener(new java.awt.event.ItemListener() {
      public void itemStateChanged(ItemEvent e) {
        shape_itemStateChanged(e);
      }
    });
    jPanel2.setBorder(titledBorder10);
    jPanel2.addFocusListener(new java.awt.event.FocusAdapter() {

    });
    jPanel2.setLayout(xYLayout4);
    jPanel3.setBorder(titledBorder11);
    jPanel3.setMinimumSize(new Dimension(100, 70));
    jPanel3.setPreferredSize(new Dimension(100, 70));
    jPanel3.addFocusListener(new java.awt.event.FocusAdapter() {

    });
    jPanel3.setLayout(xYLayout3);
    jPanel4.setBorder(titledBorder12);
    jPanel4.addFocusListener(new java.awt.event.FocusAdapter() {

    });
    jPanel4.setLayout(xYLayout5);
    jButton1.setText("OK");
    jButton1.addMouseListener(new java.awt.event.MouseAdapter() {
      public void mouseClicked(MouseEvent e) {
        jOk_mouseClicked(e);
      }
    });
    jButton2.setText("Cancle");
    jButton2.addMouseListener(new java.awt.event.MouseAdapter() {
      public void mouseClicked(MouseEvent e) {
        jCancle_mouseClicked(e);
      }
    });
    jLabel2.setText("t1");
    jLabel3.setText("t2");
    jConstant.setText("None");
    jLabel4.setText("Value between 0 - 1000 ");
    jt1.setText("None");
    jt2.setText("None");
    jLabel5.setText("msec");
    jLabel6.setText("msec");
    jLabel7.setText("Value random between 0-1000 Mbps");
    jLabel8.setText("Mbps");
    jConstant1.setText("None");
    jLabel9.setText("Mbps");
    jLabel10.setText("Value between 0 - 1000 ");
    jLabel11.setText("");
    jLabel11.setIcon(image1);
    this.getContentPane().add(panel1,  new XYConstraints(0, 357, 1, 1));
    this.getContentPane().add(jPanel1,  new XYConstraints(-5, 0, 372, 78));
    jPanel1.add(jLabel1,  new XYConstraints(33, 18, 84, 39));
    jPanel1.add(shape,  new XYConstraints(131, 26, 142, -1));
    this.getContentPane().add(jPanel3,  new XYConstraints(8, 128, 351, 77));
    jPanel3.add(jConstant,  new XYConstraints(170, 4, 124, 24));
    jPanel3.add(jLabel4,         new XYConstraints(12, 7, 146, 23));
    jPanel3.add(jLabel8,   new XYConstraints(301, 6, 32, 23));
    this.getContentPane().add(jPanel2,  new XYConstraints(8, 81, 352, 48));
    jPanel2.add(jLabel7,   new XYConstraints(15, 0, 227, -1));
    this.getContentPane().add(jPanel4,   new XYConstraints(8, 202, 352, 141));
    jPanel4.add(jt2, new XYConstraints(170, 80, 126, 24));
    jPanel4.add(jt1, new XYConstraints(169, 43, 126, 24));
    jPanel4.add(jLabel2, new XYConstraints(153, 44, 20, 23));
    jPanel4.add(jLabel3,  new XYConstraints(154, 77, 21, 28));
    jPanel4.add(jLabel6, new XYConstraints(297, 82, 32, 23));
    jPanel4.add(jLabel5, new XYConstraints(296, 44, 32, 23));
    jPanel4.add(jConstant1, new XYConstraints(170, 8, 124, 24));
    jPanel4.add(jLabel9, new XYConstraints(296, 11, 32, 23));
    jPanel4.add(jLabel10,  new XYConstraints(15, 9, 151, 23));
    jPanel4.add(jLabel11,                       new XYConstraints(26, 31, 106, 79));
    this.getContentPane().add(jButton1, new XYConstraints(75, 347, 90, 29));
    this.getContentPane().add(jButton2, new XYConstraints(189, 347, 93, 29));
  }

  void jOk_mouseClicked(MouseEvent e) {
    String shape =getTrafficshape();
    if(shape.equals("None")){

    }
    else if(shape.equals("Random")){
      int constants = randomValue();
      Value = constants;  // kept value
      Calculate_Cost(Value);
      System.out.println("Random Value :"+constants);
    }
    else if(shape.equals("Constants")){
      String constants = jConstant.getText();
      Value =Integer.parseInt(constants);// kept value

      Calculate_Cost(Value);
      //System.out.println("Constants Value :"+constants);
    }
    else if(shape.equals("Pulse")){
      String constants = jConstant1.getText();
      Value =Integer.parseInt(constants);// kept value
      String constantst1 =jt1.getText();
      String constantst2 =jt2.getText();
      t1 =Integer.parseInt(constantst1);
      t2 =Integer.parseInt(constantst2);
      // calculate BW
      numberof_time = t1/1000;//seconds
      double BW_usedAll1 =(Value*numberof_time);
      int BW_usedAll =(int)BW_usedAll1;
      Calculate_Cost(BW_usedAll);

      System.out.println("Constants Value :"+constants);
      System.out.println("number of time :"+numberof_time);
      System.out.println("t1 Value :"+t1);
      System.out.println("t2 Value :"+t2);
      System.out.println("BW usedall:"+BW_usedAll);
      }
    this.dispose();
  }
  void jCancle_mouseClicked(MouseEvent e) {
     Trafficshape="None";
     if(shape.equals("None")){
       this.dispose();
     }
     this.dispose();
   }

  private int randomValue(){
    return ((int)(Math.random()*1001));
  }
  void shape_itemStateChanged(ItemEvent e) {
      jConstant.setEnabled(true);
      jConstant1.setEnabled(true);
      jt1.setEnabled(true);
      jt2.setEnabled(true);
    if(e.getItem().equals("None")){
      Trafficshape ="None";
      jConstant.setEnabled(false);
      jConstant1.setEnabled(false);
      jt1.setEnabled(false);
      jt2.setEnabled(false);

     }
    else if(e.getItem().equals("Random")){
      Trafficshape ="Random";
      jConstant.setEnabled(false);
      jConstant1.setEnabled(false);
      jt1.setEnabled(false);
      jt2.setEnabled(false);

    }
    else if(e.getItem().equals("Constants")){
      Trafficshape ="Constants";
      jConstant1.setEnabled(false);
      jt1.setEnabled(false);
      jt2.setEnabled(false);

      }
    else if(e.getItem().equals("Pulse")){
      Trafficshape ="Pulse";
      jConstant.setEnabled(false);

    }

  }
  public String getTrafficshape(){
    return Trafficshape;
  }
 private void Calculate_Cost(int BW_usedAll)
 {
   String serverName = "";

    try {
       serverName = Frame3.serverName;
     }
     catch(Exception ex) {
       ex.printStackTrace();
     }

    try {

     NewRouterInt   nr = (NewRouterInt)Naming.lookup("//"+serverName+"/NewRouterService");
     int BW_OfWire=1000;
     for (int i=0;i<ImageMotion.vWire.size();i++){
       Wire w=(Wire)ImageMotion.vWire.elementAt(i);
       BW_OfWire = w.getBW();
       System.out.print("BW_ofwire:  "+BW_OfWire+"\n");
       if( BW_OfWire < BW_usedAll)
       {
         BW1 =BW_OfWire;
       }
       else
       {
         BW1 = BW_OfWire - BW_usedAll;
         if(BW1==0)
         {
           BW1=1;
         }
       }
       float Cost1=100/BW1;
       Cost =(int)Cost1;
       int BW =(int)BW1;
       w.setBW(BW);
       System.out.print("BW_useall:  "+BW_usedAll+"\n");
       System.out.print("BW:  "+BW+"\n");
       w.setCost(Cost);
       System.out.print("Cost:  "+Cost+"\n");
       nr.setCost(w.getIndexRouter1(),w.getIndexRouter2(),w.getCost());
      }//end for
    }//end try
   catch(Exception ex){ex.printStackTrace();}
 }

 protected void processWindowEvent(WindowEvent e) {
   super.processWindowEvent(e);
   if (e.getID() == WindowEvent.WINDOW_CLOSING) {
     this.dispose();
   }
  }
}

