package switchsim;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import com.borland.jbcl.layout.*;

public class View extends JFrame {
  JPanel contentPane;
//  Panel1 panel = new Panel1();
  private XYLayout xYLayout1 = new XYLayout();

  /**Construct the frame*/
  public View() {
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
    //setIconImage(Toolkit.getDefaultToolkit().createImage(View.class.getResource("[Your Icon]")));
    contentPane = (JPanel) this.getContentPane();
    contentPane.setLayout(xYLayout1);
    this.setSize(new Dimension(690, 379));
    this.setTitle("Network View");
    contentPane.add(new Panel2(), new XYConstraints(0, 0, 690, 379));
//    this.getContentPane().setLayout(xYLayout1);
//    this.getContentPane().add(panel,  new XYConstraints(0, 0, 690, 379));
  }
  /**Overridden so we can exit when window is closed*/
  protected void processWindowEvent(WindowEvent e) {
    super.processWindowEvent(e);
    if (e.getID() == WindowEvent.WINDOW_CLOSING) {
//      System.exit(0);
    }
  }
}