package routersim;

import java.awt.*;
import java.awt.Frame;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import javax.swing.ImageIcon;
import java.rmi.server.*;
import java.util.Vector;
import java.rmi.Naming;
import com.borland.jbcl.layout.*;

public class FrameR extends JFrame  {
  JPanel contentPane;
  static String defaultTitle;
  static String serverName="";
  static RouterConsole rcon1 = new RouterConsole();
  ImageIcon image1;
  XYLayout xYLayout1 = new XYLayout();
  static boolean focus = false;
  public FrameR(Router r1,String name)
  {
    enableEvents(AWTEvent.WINDOW_EVENT_MASK);
   try {
    jbInit(r1,name);
   }
   catch(Exception e) {
     e.printStackTrace();
    }
  }
  /**Component initialization*/
  private void jbInit(Router r,String name) throws Exception  {

    this.getContentPane().setBackground(UIManager.getColor("ToolTip.background"));
    contentPane = (JPanel) this.getContentPane();
    contentPane.setLayout(xYLayout1);
    this.setSize(new Dimension(623, 494));
    this.setTitle(name);
    defaultTitle= getTitle();
    this.setResizable(false);
    RouterConsole rcon = new RouterConsole(r);
    contentPane.add(rcon);
    Frame3.vConsole.addElement(rcon);
  }
  static RouterConsole getrcon1(){
    return rcon1;
  }
  // check for change Router name
  public void settitle(String title){
     setTitle(title);
  }
  /**Overridden so we can exit when window is closed*/
  protected void processWindowEvent(WindowEvent e) {
    super.processWindowEvent(e);
    if (e.getID() == WindowEvent.WINDOW_CLOSING) {
         this.dispose();
    }
  }
  void this_focusGained(FocusEvent e) {
    focus= true;
  }
  static boolean getfocus(){
    return focus;
  }
  void rcon1_mouseEntered(MouseEvent e) {
  }
  void this_mouseClicked(MouseEvent e) {
  }
}