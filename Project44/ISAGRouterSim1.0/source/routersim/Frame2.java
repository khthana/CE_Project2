package routersim;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.ImageIcon;
import com.borland.jbcl.layout.*;

public class Frame2 extends JFrame {
  JPanel contentPane;
  XYLayout xYLayout1 = new XYLayout();
  /**Construct the frame*/
  public Frame2() {
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
//    setIconImage(Toolkit.getDefaultToolkit().createImage(Frame1.class.getResource("openfile.gif")));
    contentPane = (JPanel) this.getContentPane();
    contentPane.setLayout(xYLayout1);
    this.setSize(new Dimension(690, 379));
    this.setTitle("Network View");
    this.setResizable(false);
    contentPane.add(new Panel2());
  }
  /**Overridden so we can exit when window is closed*/
  protected void processWindowEvent(WindowEvent e) {
    super.processWindowEvent(e);
    if (e.getID() == WindowEvent.WINDOW_CLOSING) {
//      System.exit(0);
    }
  }
}