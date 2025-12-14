package temp;

import java.awt.*;
import javax.swing.*;

public class Dialog1 extends JDialog {
  JPanel panel1 = new JPanel();
  BorderLayout borderLayout1 = new BorderLayout();
  JFileChooser jFileChooser1 = new JFileChooser();

  public Dialog1(Frame frame, String title, boolean modal) {
    super(frame, title, modal);
    try {
      jbInit();
      pack();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }

  public Dialog1() {
    this(null, "", false);
  }
  void jbInit() throws Exception {
    panel1.setLayout(borderLayout1);
    getContentPane().add(panel1);
    panel1.add(jFileChooser1, BorderLayout.CENTER);
  }
}