package routersim;

import java.awt.*;
import javax.swing.*;
import java.rmi.Naming;
import java.awt.event.*;
import com.borland.jbcl.layout.*;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */

public class ServerHostnameDialog extends JDialog {
  private JPanel panel1 = new JPanel();
  private BorderLayout borderLayout1 = new BorderLayout();
  private JTextField jTextField1 = new JTextField();
  private JLabel jLabel1 = new JLabel();
  private JButton jOK_button = new JButton();
  private JButton jCancel_button = new JButton();
  static String hostname="";
  private int mode=0;
  private XYLayout xYLayout1 = new XYLayout();
  private XYLayout xYLayout2 = new XYLayout();

  private JRadioButton jRadioButton1 = new JRadioButton();
  private JRadioButton jRadioButton2 = new JRadioButton();
  private JLabel jLabel2 = new JLabel();
  private JLabel jLabel3 = new JLabel();
  private JLabel jLabel4 = new JLabel();
  private JLabel jLabel5 = new JLabel();
  private JLabel jLabel6 = new JLabel();
  private JLabel jLabel7 = new JLabel();
  private JLabel jLabel8 = new JLabel();
  private ButtonGroup buttonGroup1 = new ButtonGroup();

  public ServerHostnameDialog(Frame frame, String title, boolean modal,int mode) {

    super(frame, title, modal);
    try {
      jbInit();
      pack();
      this.mode = mode;
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }

  public ServerHostnameDialog(int mode) {
    this(null, " R o u t e r  S i m u l a t o r ", false,mode);
  }

  private void jbInit() throws Exception {

    panel1.setLayout(xYLayout1);
    jLabel1.setText("Select Application Mode .");
    jRadioButton1.setText("Administrator Mode ");
    jRadioButton2.setText("User Mode");
    jLabel2.setText("Note : Administrator Mode is editable mode which ");
    jLabel3.setText("can edit network design diagram and confi -");
    jLabel4.setText("gurate all of device .");
    jLabel5.setText("User Mode is configuration mode which only");
    jLabel6.setText(" can configurate router .");
    jLabel7.setText("Application server ip address .");
    jLabel8.setText("Note : If run server at local host you can leave it blank .");

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
    xYLayout2.setWidth(467);
    xYLayout2.setHeight(384);

    this.getContentPane().add(panel1,        new XYConstraints(-1, 0, 361, 383));
    panel1.add(jLabel1,   new XYConstraints(26, 27, 158, 25));
    panel1.add(jRadioButton1,      new XYConstraints(46, 62, -1, -1));
    panel1.add(jRadioButton2,      new XYConstraints(46, 87, 142, 24));
    panel1.add(jLabel2,             new XYConstraints(24, 123, 318, 20));
    panel1.add(jLabel3,      new XYConstraints(57, 143, 285, 20));
    panel1.add(jLabel4,  new XYConstraints(58, 167, 235, 20));
    panel1.add(jLabel5,  new XYConstraints(58, 193, 253, 18));
    panel1.add(jLabel6,     new XYConstraints(56, 212, 247, 22));
    panel1.add(jLabel7,  new XYConstraints(24, 249, 225, -1));
    panel1.add(jTextField1,     new XYConstraints(24, 273, 166, 23));
    panel1.add(jLabel8,      new XYConstraints(23, 301, 309, 43));
    panel1.add(jOK_button, new XYConstraints(20, 341, 66, 20));
    panel1.add(jCancel_button, new XYConstraints(234, 341, 74, 20));

    //-- set display position
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

  void jOK_button_actionPerformed(ActionEvent e) {

    //-- get host name from textbox
    hostname = jTextField1.getText();

    //-- get mode
    if (jRadioButton1.isSelected()){
      mode = 1;
      this.dispose();
    }
    else if (jRadioButton2.isSelected()){
      mode = 2;
      this.dispose();
    }

    //-- set ------------------------------------------------------------------------------------------------

    Frame3 app = new Frame3(mode,hostname);
    app.validate();
    Mainwindows.Clientlist.addElement(app);

    try{

      System.out.print("Servername2   "+ hostname);
      StatusPanelInt st = (StatusPanelInt)Naming.lookup("//"+hostname+"/SPservice");
      st.registerClient( app );
    }
    catch(Exception e1){
      e1.printStackTrace();
    }

    //-- set application show
    Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
    Dimension frameSize = app.getSize();

    if (frameSize.height > screenSize.height) {
      frameSize.height = screenSize.height;
    }

    if (frameSize.width > screenSize.width) {
     frameSize.width = screenSize.width;
    }

    app.setLocation((screenSize.width - frameSize.width) / 2, (screenSize.height - frameSize.height) / 2);
    app.setVisible(true);

    //-------------------------------------------------------------------------------------------------------

    this.hide();
  }

  void jCancel_button_actionPerformed(ActionEvent e) {

    this.dispose();
  }

  public String gethostname(){

    return hostname;
  }

  protected void processWindowEvent(WindowEvent e) {
    super.processWindowEvent(e);
    if (e.getID() == WindowEvent.WINDOW_CLOSING) {
      this.dispose();
    }
  }
}