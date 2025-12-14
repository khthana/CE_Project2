package stocktrade;

import java.awt.*;
import java.awt.event.*;
import java.applet.*;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */

public class Applet1 extends Applet {
  private boolean isStandalone = false;
  private Label label1 = new Label();
  //Get a parameter value
  public String getParameter(String key, String def) {
    return isStandalone ? System.getProperty(key, def) :
      (getParameter(key) != null ? getParameter(key) : def);
  }

  //Construct the applet
  public Applet1() {
  }
  //Initialize the applet
  public void init() {
    try {
      jbInit();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }
  //Component initialization
  private void jbInit() throws Exception {
    label1.setFont(new java.awt.Font("Dialog", 0, 60));
    label1.setText("FUCK U");
    label1.setBounds(new Rectangle(43, 21, 335, 62));
    this.setLayout(null);
    this.add(label1, null);
  }
  //Get Applet information
  public String getAppletInfo() {
    return "Applet Information";
  }
  //Get parameter info
  public String[][] getParameterInfo() {
    return null;
  }
}