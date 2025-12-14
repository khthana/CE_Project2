package routersim;

import java.awt.*;
import javax.swing.*;
import com.borland.jbcl.layout.*;
import java.awt.event.*;

// select mode between Administrator and User

public class DialogMode extends JDialog {
  JPanel panel1 = new JPanel();
  JRadioButton jRadioButton1 = new JRadioButton();
  JRadioButton jRadioButton2 = new JRadioButton();
  JButton jButton1 = new JButton();
  ButtonGroup myGroup = new ButtonGroup();
  int selection = 0;
  JButton jButton2 = new JButton();
  private JLabel jLabel1 = new JLabel();
  private XYLayout xYLayout1 = new XYLayout();
  private XYLayout xYLayout2 = new XYLayout();

  public DialogMode(Frame frame, String title, boolean modal)
  {
    super(frame, title, modal);
    try {
      jbInit();
      pack();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }

  public DialogMode() {
    this(null, " R o u t e r  S i m u l a t o r ", true);
  }
  void jbInit() throws Exception {
    panel1.setLayout(xYLayout2);
    jRadioButton1.setSelected(true);
    jRadioButton1.setText("Administrator Mode");
    jRadioButton2.setText("User Mode");
    jButton1.setText("OK");
    jButton1.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jButton1_actionPerformed(e);
      }
    });
    jButton2.setText("CANCLE");
    jButton2.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jButton2_actionPerformed(e);
      }
    });
    panel1.setMinimumSize(new Dimension(200, 100));
    panel1.setPreferredSize(new Dimension(200, 100));
    this.setResizable(false);
    this.getContentPane().setLayout(xYLayout1);
    jLabel1.setText("Please select Mode");
    myGroup.add(jRadioButton1);
    myGroup.add(jRadioButton2);

    this.getContentPane().add(jLabel1,  new XYConstraints(40, 10, 151, 20)); //-- text label
    this.getContentPane().add(panel1,  new XYConstraints(0, 40, 200, -1));
    panel1.add(jRadioButton1,  new XYConstraints(40, 10, 145, 20));
    panel1.add(jRadioButton2,  new XYConstraints(40, 30, 90, 20));
    jButton1.setFocusable(true);
    panel1.add(jButton1, new XYConstraints(20, 70, 70, 25));  //-- ok
    panel1.add(jButton2, new XYConstraints(95, 70, 90, 25)); //-- cancle

  }

  void jButton1_actionPerformed(ActionEvent e) {
    if (jRadioButton1.isSelected()){
      selection = 1;
      this.dispose();
    }
    else if (jRadioButton2.isSelected()){
      selection = 2;
      this.dispose();
    }

    else {
      //error not select anyone
    }
  }
  public int getSelectChoice(){
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
//    System.out.println("selection="+selection);
    return selection;
  }

  void jButton2_actionPerformed(ActionEvent e) {
    selection = 0;
    this.dispose();
  }
  /**Overridden so we can exit when window is closed*/
  protected void processWindowEvent(WindowEvent e) {
    super.processWindowEvent(e);
    if (e.getID() == WindowEvent.WINDOW_CLOSING) {
      selection = 0;
      this.dispose();
    }
  }
}