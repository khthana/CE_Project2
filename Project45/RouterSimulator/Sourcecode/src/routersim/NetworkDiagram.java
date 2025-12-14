package routersim;

import java.awt.*;
import java.util.*;
import com.borland.jbcl.layout.*;
import javax.swing.*;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */

public class NetworkDiagram extends JPanel {
    public static Vector vImg = new Vector();
    RouterImg rimg;
    Image img;
  private XYLayout xYLayout1 = new XYLayout();
  private JPanel jPanel1 = new JPanel();
  private XYLayout xYLayout2 = new XYLayout();

  public NetworkDiagram() {
    try {
      jbInit();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }
  void jbInit() throws Exception {
    this.setBackground(Color.orange);
    this.setEnabled(true);
    this.setMinimumSize(new Dimension(50, 50));
    this.setPreferredSize(new Dimension(50, 50));
    this.setLayout(xYLayout1);
    jPanel1.setMinimumSize(new Dimension(50, 50));
    jPanel1.setPreferredSize(new Dimension(50, 50));
    jPanel1.setLayout(xYLayout2);
    xYLayout1.setWidth(447);
    xYLayout1.setHeight(453);
    this.add(jPanel1, new XYConstraints(13, 20, 424, 410));
  }
  public void paint(){
    repaint();///
    System.out.println("hello");
  }
 }
