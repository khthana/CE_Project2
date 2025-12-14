
//Title:        TextEditor
//Version:      
//Copyright:    Copyright (c) 1999
//Author:       T.KOMSANT
//Company:      ICL
//Description:  TextEditor

package Texteditor;

import java.awt.*;
import javax.swing.*;

public class table extends JDialog {
  JPanel panel1 = new JPanel();
  JLabel jLabel1 = new JLabel();
  JLabel jLabel2 = new JLabel();
  JTextField jTextField1 = new JTextField();
  JTextField jTextField2 = new JTextField();

  public table(Frame frame, String title, boolean modal) {
    super(frame, title, modal);
    try  {
      jbInit();
      pack();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }

  public table() {
    this(null, "", false);
  }

  void jbInit() throws Exception {
    panel1.setLayout(null);
    jLabel1.setText("Columns");
    jLabel1.setBounds(new Rectangle(40, 55, 58, 39));
    jLabel2.setText("Rows");
    jLabel2.setBounds(new Rectangle(41, 109, 58, 41));
    jTextField1.setBounds(new Rectangle(111, 56, 59, 35));
    jTextField2.setBounds(new Rectangle(111, 109, 61, 36));
    getContentPane().add(panel1);
    panel1.add(jLabel1, null);
    panel1.add(jLabel2, null);
    panel1.add(jTextField1, null);
    panel1.add(jTextField2, null);
  }
}
                      
