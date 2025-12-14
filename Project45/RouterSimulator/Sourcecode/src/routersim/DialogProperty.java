package routersim;

import java.awt.*;
import javax.swing.*;
import javax.swing.border.*;
import java.awt.event.*;

import java.awt.*;
import javax.swing.*;
import com.borland.jbcl.layout.*;
import java.awt.event.*;
import java.util.*;
import java.lang.*;

public class DialogProperty extends JDialog {
  ImageIcon image1,image2;
  private TitledBorder titledBorder1;
  private Border border1;
  private XYLayout xYLayout1 = new XYLayout();
  private XYLayout xYLayout2 = new XYLayout();
  private JLabel jLabel1 = new JLabel();
  public DialogProperty(Frame frame, String title, boolean modal) {
    super(frame, title, modal);
    try {
      jbInit();
      pack();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }

  public DialogProperty() {
        this(null, "Detail of Serie", true);
  }
  void jbInit() throws Exception {
    image1 = new ImageIcon(routersim.Frame3.class.getResource("routerproperty.gif"));
    image2 = new ImageIcon(routersim.Frame3.class.getResource("traffic.gif"));
    titledBorder1 = new TitledBorder(BorderFactory.createLineBorder(Color.white,1),"");
    border1 = new EtchedBorder(EtchedBorder.RAISED,Color.white,new Color(148, 145, 140));

    xYLayout2.setWidth(587);
    xYLayout2.setHeight(278);
    this.setBounds(new Rectangle(1, 0, 617, 365));
    this.getContentPane().setLayout(xYLayout2);
    this.setTitle("Detail of Router");//, new XYConstraints(1, 5, 617, -1));
    jLabel1.setIcon(image1);
    this.getContentPane().add(jLabel1, new XYConstraints(0, 0, 589, 279));
  }
  protected void processWindowEvent(WindowEvent e) {
    super.processWindowEvent(e);
    if (e.getID() == WindowEvent.WINDOW_CLOSING) {
      this.dispose();
    }
  }

}