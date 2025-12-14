package routersim;

import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import java.rmi.Naming;
import com.borland.jbcl.layout.*;

public class WarningDialog extends JDialog {
  private JPanel panel1 = new JPanel();
  private JLabel jLabel1 = new JLabel();
  private JButton jOK_button = new JButton();
  private XYLayout xYLayout1 = new XYLayout();
  private XYLayout xYLayout2 = new XYLayout();
  static String Host="";
  static int mode=0;

  public WarningDialog(Frame frame, String title, boolean modal) {
    super(frame, title, modal);
    try {
      jbInit();
      pack();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }

  public WarningDialog() {
    this(null, "Warnnig", false);
  }
  private void jbInit() throws Exception {
    panel1.setLayout(xYLayout1);


    jLabel1.setText("                Password incorrect....");
    jOK_button.setText("OK");
    jOK_button.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jOK_button_actionPerformed(e);
      }
    });
    this.getContentPane().setLayout(xYLayout2);
    xYLayout2.setWidth(217);
    xYLayout2.setHeight(124);
    panel1.add(jLabel1,     new XYConstraints(13, 27, 203, 25));
    panel1.add(jOK_button,  new XYConstraints(80, 76, 66, 30));
    this.getContentPane().add(panel1,   new XYConstraints(-4, 0, 232, 113));

    //-- set display position
    Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
    Dimension frameSize = this.getSize();
    if (frameSize.height > screenSize.height) {
      frameSize.height = screenSize.height;
    }
    if (frameSize.width > screenSize.width) {
      frameSize.width = screenSize.width;
    }
    this.setLocation((screenSize.width - frameSize.width) / 4, (screenSize.height - frameSize.height) / 4);
    this.setVisible(true);

  }

  void jOK_button_actionPerformed(ActionEvent e) {
   ModeDialog d = new ModeDialog();
   this.hide();
  }
   protected void processWindowEvent(WindowEvent e) {
   super.processWindowEvent(e);
   if (e.getID() == WindowEvent.WINDOW_CLOSING) {
     this.dispose();
   }
  }
}