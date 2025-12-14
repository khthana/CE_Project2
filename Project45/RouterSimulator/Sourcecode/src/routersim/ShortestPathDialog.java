package routersim;

import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import java.rmi.Naming;
import com.borland.jbcl.layout.*;


/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */

public class ShortestPathDialog extends JDialog {
  private JPanel panel1 = new JPanel();
  private JTextField jTextField1 = new JTextField();
  private JLabel jLabel1 = new JLabel();
  private JButton jOK_button = new JButton();
  private JButton jCancel_button = new JButton();
  private String Destaddress="";
  private int index=0;
  private XYLayout xYLayout1 = new XYLayout();
  private XYLayout xYLayout2 = new XYLayout();
  static  String serverName = "";

  public ShortestPathDialog(Frame frame, String title, boolean modal,int id) {
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

  public ShortestPathDialog(int id) {
    this(null, "Shortest Path", false,id);
  }
  private void jbInit() throws Exception {
    panel1.setLayout(xYLayout1);
        jTextField1.setToolTipText("Enter Destination Address");

        jLabel1.setText("Enter Destination Address");
        jOK_button.setText("OK");
        jOK_button.addActionListener(new java.awt.event.ActionListener() {
          public void actionPerformed(ActionEvent e) {
            jOK_button_actionPerformed(e);
          }
        });
        jCancel_button.setText("Cancel");
        jCancel_button.addActionListener(new java.awt.event.ActionListener() {
          public void actionPerformed(ActionEvent e) {
            jCancel_button_actionPerformed(e);
          }
        });
        this.getContentPane().setLayout(xYLayout2);
        panel1.add(jTextField1,  new XYConstraints(24, 32, 166, 24));
        panel1.add(jLabel1,  new XYConstraints(24, 5, 158, 25));
        panel1.add(jOK_button,  new XYConstraints(29, 66, 66, 20));
        panel1.add(jCancel_button,  new XYConstraints(113, 66, 74, 20));
        this.getContentPane().add(panel1,  new XYConstraints(-4, 0, 215, 104));

        //this.setSize(new Dimension(65,45 ));
        this.setVisible(true);
      }

      void jOK_button_actionPerformed(ActionEvent e) {
        Destaddress = jTextField1.getText();

        try {
          Frame3.serverName = java.net.InetAddress.getLocalHost().getHostName();
          serverName = Frame3.serverName;
        }
        catch(Exception ex) {
          ex.printStackTrace();
        }

           try {
             //bind server object to object in client
             CommandInt c1 = (CommandInt)Naming.lookup("//"+serverName+"/CommandService");
             NewRouterInt nr = (NewRouterInt)Naming.lookup("//"+serverName+"/NewRouterService");
             Router rt = (Router)nr.getvRouter().elementAt(index);
             c1.setShortestPath(rt,Destaddress);
           }
           catch(Exception e1){}
           this.hide();
      }

      void jCancel_button_actionPerformed(ActionEvent e) {
         this.dispose();

      }
      public String getNetAddress(){
        return Destaddress;
      }

      protected void processWindowEvent(WindowEvent e) {
       super.processWindowEvent(e);
       if (e.getID() == WindowEvent.WINDOW_CLOSING) {
         this.dispose();
       }
      }
}