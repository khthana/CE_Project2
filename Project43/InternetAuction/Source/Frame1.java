

import oracle.sql.*;
import oracle.jdbc.driver.*;
import  java.sql.*;
import  java.io.*;
import  java.util.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import com.borland.dbswing.*;
import com.borland.jbcl.control.*;
import com.borland.jbcl.layout.*;

public class Frame1 extends JFrame {
  XYLayout xYLayout1 = new XYLayout();
  Button button1 = new Button();
  Label label1 = new Label();
  FindBestSpec findbestspec ;
  Label label2 = new Label();
  //Construct the frame
  public Frame1(FindBestSpec findbestspec) {
    this.findbestspec = findbestspec ;
    enableEvents(AWTEvent.WINDOW_EVENT_MASK);
    try  {
      jbInit();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }

  //Component initialization
  private void jbInit() throws Exception  {
    this.getContentPane().setLayout(xYLayout1);
    this.getContentPane().setBackground(Color.blue);
    this.setEnabled(true);
    this.setTitle("Internet Auction Server");
    button1.setLabel("Start Server");
    button1.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        button1_actionPerformed(e);
      }
    });
    label1.setBackground(Color.blue);
    label1.setFont(new java.awt.Font("Dialog", 0, 35));
    label1.setForeground(Color.green);
    label1.setText("Internet Auction Server");
    xYLayout1.setHeight(128);
    xYLayout1.setWidth(368);
    label2.setFont(new java.awt.Font("Dialog", 1, 12));
    label2.setForeground(Color.green);
    label2.setText("This program use for close auction");
    this.getContentPane().add(label1, new XYConstraints(8, 3, 349, 40));
    this.getContentPane().add(label2, new XYConstraints(7, 50, 227, 22));
    this.getContentPane().add(button1, new XYConstraints(272, 50, 64, 30));
  }

  //Overridden so we can exit on System Close
  protected void processWindowEvent(WindowEvent e) {
    super.processWindowEvent(e);
    if(e.getID() == WindowEvent.WINDOW_CLOSING) {
      System.exit(0);
    }
  }


  void button1_actionPerformed(ActionEvent e)
   {
      findbestspec.query();
   }

}

