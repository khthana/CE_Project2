package routersim;

import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import java.rmi.Naming;
import com.borland.jbcl.layout.*;

public class BWDialog extends JDialog {

  private JLabel jLabel1 = new JLabel();
  private JLabel jLabel2 = new JLabel();
  private JLabel jLabel3 = new JLabel();
  private JButton jOk_Button = new JButton();
  private int index=0;
  private JButton jCancel_Button = new JButton();
  private int BwOfwire=10;
 //private XYLayout  xYLayout2;
  private Choice BW = new Choice();
  private JPanel jPanel1 = new JPanel();
  private XYLayout xYLayout1 = new XYLayout();
  private XYLayout xYLayout2 = new XYLayout();

  public BWDialog(Frame frame, String title, boolean modal,int id) {
    super(frame, title, modal);
    try {
      jbInit();
      pack();
      index=id;
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }

  public BWDialog(int id) {
    this(null, "Bandwidth ", false,id);
  }

  private void jbInit() throws Exception {


    BW.addItem("10");
    BW.addItem("100");
    BW.addItem("1000");
   // BW.addItem("1500");
    jLabel1.setText("Select Bandwidth");
    jLabel2.setText("BW");
    jLabel3.setText("Mb");

    jOk_Button.setText("OK");
    jOk_Button.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jOk_Button_actionPerformed(e);
      }
    });

    jCancel_Button.setText("Cancel");
    jCancel_Button.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jCancel_Button_actionPerformed(e);
      }
    });

    //panel1.setBounds(new Rectangle(10, 10, 263, 128));
    this.setResizable(false);
    this.setTitle("");
    jPanel1.setLayout(xYLayout1);
    this.getContentPane().setLayout(xYLayout2);
    jPanel1.add(BW,  new XYConstraints(57, 49, -1, -1));
    jPanel1.add(jLabel1,  new XYConstraints(59, 25, -1, -1));
    jPanel1.add(jLabel2,  new XYConstraints(29, 51, -1, -1));
    jPanel1.add(jLabel3,  new XYConstraints(194, 51, -1, -1));
    jPanel1.add(jCancel_Button,  new XYConstraints(130, 99, -1, -1));
    jPanel1.add(jOk_Button,  new XYConstraints(49, 99, 70, -1));
    this.getContentPane().add(jPanel1,    new XYConstraints(3, 3, 249, 157));


    //this.setSize(new Dimension(278, 147)  );


    Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
    Dimension frameSize = this.getSize();
    if (frameSize.height > screenSize.height) {
      frameSize.height = screenSize.height;
    }
    if (frameSize.width > screenSize.width) {
      frameSize.width = screenSize.width;
    }
    this.setLocation((screenSize.width - frameSize.width) / 2, (screenSize.height - frameSize.height) / 2);
    this.setVisible(true);

  }

  void jOk_Button_actionPerformed(ActionEvent e) {
    String serverName = "";

   try {
      serverName = Frame3.serverName;
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }

   try {

     NewRouterInt   nr = (NewRouterInt)Naming.lookup("//"+serverName+"/NewRouterService");

     if(BW.getSelectedItem().equals("10")) {
       BwOfwire = 10;
     }
     if(BW.getSelectedItem().equals("100")) {
       BwOfwire = 100;
     }
     if(BW.getSelectedItem().equals("1000")) {
       BwOfwire = 1000;
     }
     Wire w = (Wire)ImageMotion.vWire.elementAt(index);
     System.out.print("Index og wire" +index+"\n");
     w.setBW(BwOfwire);
     int cost = 100/BwOfwire;
     w.setCost(cost);
     repaint();
     nr.setCost(w.getIndexRouter1(),w.getIndexRouter2(),cost);
     System.out.print("Cost:  "+w.getCost());
     this.hide();
   }
   catch(Exception e1){
     e1.printStackTrace();
   }
  }

  public void setBW(int bw) {
    BwOfwire = bw;
  }

  public int getBW() {
   return BwOfwire;
  }

  void jCancel_Button_actionPerformed(ActionEvent e) {
    this.dispose();
  }

  //-- Overridden so we can exit when window is closed
  protected void processWindowEvent(WindowEvent e) {

    super.processWindowEvent(e);
    if (e.getID() == WindowEvent.WINDOW_CLOSING) {
      this.dispose();
    }
  }
}