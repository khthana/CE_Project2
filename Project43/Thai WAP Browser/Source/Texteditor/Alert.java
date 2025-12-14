
//Title:        Your Product Name
//Version:      
//Copyright:    Copyright (c) 1999
//Author:       Your Name
//Company:      Your Company
//Description:  Your description

//package untitled5;
package Texteditor;
import java.awt.*;
import javax.swing.*;
import java.awt.event.*;

public class Alert extends JFrame {
  JLabel jLabel1 = new JLabel();
  JButton jButton1 = new JButton();
  String messages;

   Alert(String message) {
    try  {
	  messages = message;
      jbInit();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }

  private void jbInit() throws Exception {
    jLabel1.setFont(new Font("dialog",Font.PLAIN,15));

    jLabel1.setText(messages);
    jLabel1.setBounds(new Rectangle(19, 6, 360, 149));
    this.getContentPane().setLayout(null);
    this.setTitle("Error message");
    jButton1.setText("OK");
    jButton1.setBounds(new Rectangle(143, 197, 104, 43));
    jButton1.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        jButton1_actionPerformed(e);
      }
    });
    this.getContentPane().add(jLabel1, null);
    this.getContentPane().add(jButton1, null);
  }

  void jButton1_actionPerformed(ActionEvent e) {
    this.dispose();
  }
}                
