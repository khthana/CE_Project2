package routersim;

import java.awt.*;
import javax.swing.*;
import javax.swing.border.*;
import java.awt.event.*;
import java.util.*;
import java.io.*;
import java.rmi.*;
import com.borland.jbcl.layout.*;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */

public class UserDialog extends JDialog {
  static String key="71543260";
  static String output="";
  static Vector vUsername = new Vector();
  static Vector vPassword = new Vector();
  static int counter =0;
  static String serverName="";
  private JPanel panel1 = new JPanel();
  private JLabel jLabel_username = new JLabel();
  private TitledBorder titledBorder1;
  private JLabel jLabel_password = new JLabel();
  private JTextField jUser1 = new JTextField();
  private JTextField jUser2 = new JTextField();
  private JTextField jUser3 = new JTextField();
  private JTextField jUser5 = new JTextField();
  private JTextField jUser4 = new JTextField();
  private JTextField jUser6 = new JTextField();
  private JTextField jUser7 = new JTextField();
  private JTextField jUser8 = new JTextField();
  private JTextField jUser9 = new JTextField();
  private JTextField jUser10 = new JTextField();
  private JTextField jpwd1 = new JTextField();
  private JTextField jpwd2 = new JTextField();
  private JTextField jpwd6 = new JTextField();
  private JTextField jpwd10 = new JTextField();
  private JTextField jpwd3 = new JTextField();
  private JTextField jpwd4 = new JTextField();
  private JTextField jpwd5 = new JTextField();
  private JTextField jpwd7 = new JTextField();
  private JTextField jpwd8 = new JTextField();
  private JTextField jpwd9 = new JTextField();
  private JButton jButton_reset = new JButton();
  private JButton jButton_cancel = new JButton();
  private JButton jButton_ok = new JButton();
  private XYLayout xYLayout1 = new XYLayout();
  private XYLayout xYLayout2 = new XYLayout();

  public UserDialog(Frame frame, String title, boolean modal) {
    super(frame, title, modal);
    try {
      jbInit();
      pack();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }

  public UserDialog() {
    this(null, "Add User", false);
  }
  private void jbInit() throws Exception {
    titledBorder1 = new TitledBorder("");
    panel1.setLayout(xYLayout2);
    jLabel_username.setBorder(BorderFactory.createRaisedBevelBorder());
    jLabel_username.setText("                  Username");
    this.getContentPane().setLayout(xYLayout1);
    jLabel_password.setText("                  Password");
    jLabel_password.setBorder(BorderFactory.createRaisedBevelBorder());
    jUser1.setBorder(BorderFactory.createLineBorder(Color.black));
    jUser1.setText("Admin");
    jUser1.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        //jUser1_actionPerformed(e);
      }
    });
    jUser2.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        //jUser2_actionPerformed(e);
      }
    });
    jUser2.setBorder(BorderFactory.createLineBorder(Color.black));
    jUser2.setText("User1");
    jUser3.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        //jUser3_actionPerformed(e);
      }
    });
    jUser3.setBorder(BorderFactory.createLineBorder(Color.black));
    jUser3.setText("User2");
    jUser5.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        //jUser5_actionPerformed(e);
      }
    });
    jUser5.setBorder(BorderFactory.createLineBorder(Color.black));
    jUser5.setText("User4");
    jUser4.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        //jUser4_actionPerformed(e);
      }
    });
    jUser4.setBorder(BorderFactory.createLineBorder(Color.black));
    jUser4.setText("User3");
    jUser6.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        //jUser6_actionPerformed(e);
      }
    });
    jUser6.setBorder(BorderFactory.createLineBorder(Color.black));
    jUser6.setText("User5");
    jUser7.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        //jUser7_actionPerformed(e);
      }
    });
    jUser7.setBorder(BorderFactory.createLineBorder(Color.black));
    jUser7.setText("User6");
    jUser8.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
       // jUser8_actionPerformed(e);
      }
    });
    jUser8.setBorder(BorderFactory.createLineBorder(Color.black));
    jUser8.setText("User7");
    jUser9.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
       // jUser9_actionPerformed(e);
      }
    });
    jUser9.setBorder(BorderFactory.createLineBorder(Color.black));
    jUser9.setText("User8");
    jUser10.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
       // jUser10_actionPerformed(e);
      }
    });
    jUser10.setBorder(BorderFactory.createLineBorder(Color.black));
    jUser10.setText("User9");
    jpwd1.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        //jpwd1_actionPerformed(e);
      }
    });
    jpwd1.setBorder(BorderFactory.createLineBorder(Color.black));
    jpwd2.setBorder(BorderFactory.createLineBorder(Color.black));
    jpwd2.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        //jpwd2_actionPerformed(e);
      }
    });
    jpwd6.setBorder(BorderFactory.createLineBorder(Color.black));
    jpwd6.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
       // jpwd6_actionPerformed(e);
      }
    });
    jpwd10.setBorder(BorderFactory.createLineBorder(Color.black));
    jpwd10.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
       /// jpwd10_actionPerformed(e);
      }
    });
    jpwd3.setBorder(BorderFactory.createLineBorder(Color.black));
    jpwd3.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
       // jpwd3_actionPerformed(e);
      }
    });
    jpwd4.setBorder(BorderFactory.createLineBorder(Color.black));
    jpwd4.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
       // jpwd4_actionPerformed(e);
      }
    });
    jpwd5.setBorder(BorderFactory.createLineBorder(Color.black));
    jpwd5.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
       // jpwd5_actionPerformed(e);
      }
    });
    jpwd7.setBorder(BorderFactory.createLineBorder(Color.black));
    jpwd7.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
       // jpwd7_actionPerformed(e);
      }
    });
    jpwd8.setBorder(BorderFactory.createLineBorder(Color.black));
    jpwd8.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
       // jpwd8_actionPerformed(e);
      }
    });
    jpwd9.setBorder(BorderFactory.createLineBorder(Color.black));
    jpwd9.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        //jpwd9_actionPerformed(e);
      }
    });
    jButton_reset.setText("Reset");
    jButton_reset.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jButton_reset_actionPerformed(e);
      }
    });
    jButton_cancel.setText("Cancel");
    jButton_cancel.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jButton_cancel_actionPerformed(e);
      }
    });
    jButton_ok.setText("OK");
    jButton_ok.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jButton_ok_actionPerformed(e);
      }
    });
    xYLayout1.setWidth(422);
    xYLayout1.setHeight(365);
    this.getContentPane().add(panel1,  new XYConstraints(0, 313, -1, -1));
    this.getContentPane().add(jLabel_password,  new XYConstraints(204, 11, 166, 37));
    this.getContentPane().add(jLabel_username,  new XYConstraints(27, 11, 178, 37));
    this.getContentPane().add(jUser1,  new XYConstraints(28, 48, 177, 24));
    this.getContentPane().add(jUser2,  new XYConstraints(28, 71, 177, 24));
    this.getContentPane().add(jUser3,  new XYConstraints(28, 94, 177, 24));
    this.getContentPane().add(jUser4,  new XYConstraints(28, 116, 177, 24));
    this.getContentPane().add(jUser5,  new XYConstraints(28, 139, 177, 24));
    this.getContentPane().add(jUser6,  new XYConstraints(28, 162, 177, 24));
    this.getContentPane().add(jUser7,  new XYConstraints(28, 185, 177, 24));
    this.getContentPane().add(jUser8,  new XYConstraints(28, 208, 177, 24));
    this.getContentPane().add(jUser9,  new XYConstraints(28, 231, 177, 24));
    this.getContentPane().add(jUser10,  new XYConstraints(28, 254, 177, 24));
    this.getContentPane().add(jpwd1,  new XYConstraints(204, 48, 166, 24));
    this.getContentPane().add(jpwd3,  new XYConstraints(204, 94, 166, 24));
    this.getContentPane().add(jpwd2,  new XYConstraints(204, 71, 166, 24));
    this.getContentPane().add(jpwd4,  new XYConstraints(204, 117, 166, 23));
    this.getContentPane().add(jpwd5,  new XYConstraints(204, 138, 166, 25));
    this.getContentPane().add(jpwd6,  new XYConstraints(204, 162, 166, 24));
    this.getContentPane().add(jpwd7,  new XYConstraints(204, 185, 166, 24));
    this.getContentPane().add(jpwd8,  new XYConstraints(204, 208, 166, 24));
    this.getContentPane().add(jpwd9,  new XYConstraints(204, 231, 166, 24));
    this.getContentPane().add(jpwd10,  new XYConstraints(204, 254, 166, 24));
    this.getContentPane().add(jButton_reset,  new XYConstraints(28, 289, 87, 34));
    this.getContentPane().add(jButton_ok,  new XYConstraints(175, 289, 87, 34));
    this.getContentPane().add(jButton_cancel,  new XYConstraints(284, 288, 87, 34));
  }

 /* void jUser1_actionPerformed(ActionEvent e) {
   //if(jUser1.gett
    if(Check_Lenght(jUser1.getText().length()))
    {
      Encoder(jUser1.getText());
      this.hide();
    }
    else
    {
      JOptionPane.showMessageDialog(null,"Username or Password is more than 8 charactor..","Warning Message",JOptionPane.INFORMATION_MESSAGE);
      this.hide();
    }
  }
  void jUser2_actionPerformed(ActionEvent e) {
    if(Check_Lenght(jUser2.getText().length()))
    {
      Encoder(jUser2.getText());
      this.hide();
    }
    else
    {
       JOptionPane.showMessageDialog(null,"Username or Password is more than 8 charactor..","Warning Message",JOptionPane.INFORMATION_MESSAGE);
       this.hide();
    }
  }
  void jUser3_actionPerformed(ActionEvent e) {
    if(Check_Lenght(jUser3.getText().length()))
    {
      Encoder(jUser3.getText());
      this.hide();
    }
    else
    {
       JOptionPane.showMessageDialog(null,"Username or Password is more than 8 charactor..","Warning Message",JOptionPane.INFORMATION_MESSAGE);
       this.hide();
    }
  }
  void jUser5_actionPerformed(ActionEvent e) {
    if(Check_Lenght(jUser5.getText().length()))
    {
      Encoder(jUser5.getText());
      this.hide();
    }
    else
    {
       JOptionPane.showMessageDialog(null,"Username or Password is more than 8 charactor..","Warning Message",JOptionPane.INFORMATION_MESSAGE);
       this.hide();
    }
  }
  void jUser4_actionPerformed(ActionEvent e) {
    if(Check_Lenght(jUser4.getText().length()))
    {
      Encoder(jUser4.getText());
      this.hide();
    }
    else
    {
       JOptionPane.showMessageDialog(null,"Username or Password is more than 8 charactor..","Warning Message",JOptionPane.INFORMATION_MESSAGE);
       this.hide();
    }
  }
  void jUser6_actionPerformed(ActionEvent e) {
    if(Check_Lenght(jUser6.getText().length()))
    {
      Encoder(jUser6.getText());
      this.hide();
    }
    else
    {
       JOptionPane.showMessageDialog(null,"Username or Password is more than 8 charactor..","Warning Message",JOptionPane.INFORMATION_MESSAGE);
       this.hide();
    }
  }
  void jUser7_actionPerformed(ActionEvent e) {
    if(Check_Lenght(jUser7.getText().length()))
    {
      Encoder(jUser7.getText());
      this.hide();
    }
    else
    {
       JOptionPane.showMessageDialog(null,"Username or Password is more than 8 charactor..","Warning Message",JOptionPane.INFORMATION_MESSAGE);
       this.hide();
    }
  }
  void jUser8_actionPerformed(ActionEvent e) {
    if(Check_Lenght(jUser8.getText().length()))
    {
      Encoder(jUser8.getText());
      this.hide();
    }
    else
    {
       JOptionPane.showMessageDialog(null,"Username or Password is more than 8 charactor..","Warning Message",JOptionPane.INFORMATION_MESSAGE);
       this.hide();
    }
  }
  void jUser9_actionPerformed(ActionEvent e) {
    if(Check_Lenght(jUser9.getText().length()))
    {
      Encoder(jUser9.getText());
      this.hide();
    }
    else
    {
       JOptionPane.showMessageDialog(null,"Username or Password is more than 8 charactor..","Warning Message",JOptionPane.INFORMATION_MESSAGE);
       this.hide();
    }
  }
  void jUser10_actionPerformed(ActionEvent e) {
    if(Check_Lenght(jUser10.getText().length()))
    {
      Encoder(jUser10.getText());
      this.hide();
    }
    else
    {
       JOptionPane.showMessageDialog(null,"Username or Password is more than 8 charactor..","Warning Message",JOptionPane.INFORMATION_MESSAGE);
       this.hide();
    }
  }
  void jpwd1_actionPerformed(ActionEvent e) {
    if(Check_Lenght(jpwd1.getText().length()))
    {
      Encoder(jpwd1.getText());
      this.hide();
    }
    else
    {
       JOptionPane.showMessageDialog(null,"Username or Password is more than 8 charactor..","Warning Message",JOptionPane.INFORMATION_MESSAGE);
       this.hide();
    }
  }
  void jpwd2_actionPerformed(ActionEvent e) {
    if(Check_Lenght(jpwd2.getText().length()))
    {
      Encoder(jpwd2.getText());
      this.hide();
    }
    else
    {
       JOptionPane.showMessageDialog(null,"Username or Password is more than 8 charactor..","Warning Message",JOptionPane.INFORMATION_MESSAGE);
       this.hide();
    }
  }
  void jpwd6_actionPerformed(ActionEvent e) {
    if(Check_Lenght(jpwd6.getText().length()))
    {
      Encoder(jpwd6.getText());
      this.hide();
    }
    else
    {
       JOptionPane.showMessageDialog(null,"Username or Password is more than 8 charactor..","Warning Message",JOptionPane.INFORMATION_MESSAGE);
       this.hide();
    }
  }
  void jpwd10_actionPerformed(ActionEvent e) {
    if(Check_Lenght(jpwd10.getText().length()))
    {
      Encoder(jpwd10.getText());
      this.hide();
    }
    else
    {
       JOptionPane.showMessageDialog(null,"Username or Password is more than 8 charactor..","Warning Message",JOptionPane.INFORMATION_MESSAGE);
       this.hide();
    }
  }
  void jpwd3_actionPerformed(ActionEvent e) {
    if(Check_Lenght(jpwd3.getText().length()))
    {
      Encoder(jpwd3.getText());
      this.hide();
    }
    else
    {
       JOptionPane.showMessageDialog(null,"Username or Password is more than 8 charactor..","Warning Message",JOptionPane.INFORMATION_MESSAGE);
       this.hide();
    }
  }
  void jpwd4_actionPerformed(ActionEvent e) {
    if(Check_Lenght(jpwd4.getText().length()))
    {
      Encoder(jpwd4.getText());
      this.hide();
    }
    else
    {
       JOptionPane.showMessageDialog(null,"Username or Password is more than 8 charactor..","Warning Message",JOptionPane.INFORMATION_MESSAGE);
       this.hide();
    }
  }
  void jpwd5_actionPerformed(ActionEvent e) {
    if(Check_Lenght(jpwd5.getText().length()))
    {
      Encoder(jpwd5.getText());
      this.hide();
    }
    else
    {
       JOptionPane.showMessageDialog(null,"Username or Password is more than 8 charactor..","Warning Message",JOptionPane.INFORMATION_MESSAGE);
       this.hide();
    }
  }
  void jpwd7_actionPerformed(ActionEvent e) {
    if(Check_Lenght(jpwd7.getText().length()))
    {
      Encoder(jpwd7.getText());
      this.hide();
    }
    else
    {
       JOptionPane.showMessageDialog(null,"Username or Password is more than 8 charactor..","Warning Message",JOptionPane.INFORMATION_MESSAGE);
       this.hide();
    }
  }
  void jpwd8_actionPerformed(ActionEvent e) {
    if(Check_Lenght(jpwd8.getText().length()))
    {
      Encoder(jpwd8.getText());
      this.hide();
    }
    else
    {
       JOptionPane.showMessageDialog(null,"Username or Password is more than 8 charactor..","Warning Message",JOptionPane.INFORMATION_MESSAGE);
       this.hide();
    }
  }
  void jpwd9_actionPerformed(ActionEvent e) {
    if(Check_Lenght(jpwd9.getText().length()))
    {
      Encoder(jpwd9.getText());
      this.hide();
    }
    else
    {
       JOptionPane.showMessageDialog(null,"Username or Password is more than 8 charactor..","Warning Message",JOptionPane.INFORMATION_MESSAGE);
       this.hide();
    }
  }*/

  void jButton_reset_actionPerformed(ActionEvent e) {
    jUser1.setText("");
    jUser2.setText("");
    jUser3.setText("");
    jUser5.setText("");
    jUser4.setText("");
    jUser6.setText("");
    jUser7.setText("");
    jUser8.setText("");
    jUser9.setText("");
    jUser10.setText("");
    jpwd1.setText("");
    jpwd2.setText("");
    jpwd3.setText("");
    jpwd4.setText("");
    jpwd5.setText("");
    jpwd6.setText("");
    jpwd8.setText("");
    jpwd9.setText("");
    jpwd10.setText("");

  }
  void jButton_ok_actionPerformed(ActionEvent e) {
    if(Check_Lenght(jUser1.getText().length()))
    {
      if(Check_Lenght(jpwd1.getText().length()))
      {
        Encoder(jUser1.getText(),jpwd1.getText());
      }
    }
    if(Check_Lenght(jUser2.getText().length()))
    {
      if(Check_Lenght(jpwd2.getText().length()))
      {
        Encoder(jUser2.getText(),jpwd2.getText());
      }
    }
    if(Check_Lenght(jUser3.getText().length()))
    {
      if(Check_Lenght(jpwd3.getText().length()))
      {
        Encoder(jUser3.getText(),jpwd3.getText());
      }
    }
    if(Check_Lenght(jUser4.getText().length()))
    {
      if(Check_Lenght(jpwd4.getText().length()))
      {
        Encoder(jUser4.getText(),jpwd4.getText());
      }
    }
    if(Check_Lenght(jUser5.getText().length()))
    {
      if(Check_Lenght(jpwd5.getText().length()))
      {
        Encoder(jUser5.getText(),jpwd5.getText());
      }
    }
    if(Check_Lenght(jUser6.getText().length()))
    {
      if(Check_Lenght(jpwd6.getText().length()))
      {
        Encoder(jUser6.getText(),jpwd6.getText());
      }
    }
    if(Check_Lenght(jUser7.getText().length()))
    {
      if(Check_Lenght(jpwd7.getText().length()))
      {
        Encoder(jUser7.getText(),jpwd7.getText());
      }
    }
    if(Check_Lenght(jUser8.getText().length()))
    {
      if(Check_Lenght(jpwd8.getText().length()))
      {
        Encoder(jUser8.getText(),jpwd8.getText());
      }
    }

    if(Check_Lenght(jUser9.getText().length()))
    {
      if(Check_Lenght(jpwd9.getText().length()))
      {
        Encoder(jUser9.getText(),jpwd9.getText());
      }
    }
    if(Check_Lenght(jUser10.getText().length()))
    {
      if(Check_Lenght(jpwd10.getText().length()))
      {
        Encoder(jUser10.getText(),jpwd10.getText());
      }
    }
    try {
      serverName = Frame3.serverName;
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
    try{
      CommandInt c1 = (CommandInt)Naming.lookup("//"+serverName+"/CommandService");
     // c1.copyFileusername(output);
    }
    catch(Exception ex1)
    {
      ex1.printStackTrace();
    }
    this.hide();
  }
  void jButton_cancel_actionPerformed(ActionEvent e) {
    this.hide();
  }
  public void Encoder(String username,String passwd)
  {
    output="";
    counter++;
    byte[] key_1 = key.getBytes();
    byte[] user_name =username.getBytes();
    byte[] password =passwd.getBytes();

    DESService des = new DESService();
    byte[] ciphertext1 =des.Encryption(key_1,user_name);
    byte[] ciphertext2 =des.Encryption(key_1,password);
    String key =ToString(key_1);
    String user = ToString(ciphertext1);
    String pwd = ToString(ciphertext2);
   // vUsername.adde
   // byte[] c=des.Decryption(ToByte(key),ToByte(user));//
    //---file format-----------
     output += " "+ToString(ciphertext1)+"                   "+ToString(ciphertext2)+"                        \n";
    //-------------------------
    //System.out.print("ciphertext"+ToString(ciphertext1)+"\n");
    // System.out.print("ciphertext"+ciphertext1+"\n");
    //System.out.print("data"+c+"\n");
  }
  public String ToString(byte[] text)
  {
    String str="";
    for(int i=0;i<text.length;i++)
    {
      str+=(char)text[i];
    }
    return str;
  }
  public byte[] ToByte(String str)
{
  byte cipher1[] = new byte[8];

  for (int i = 0; i < str.length(); i++) {
    cipher1[i] = (byte) str.charAt(i);
    System.out.print((char)cipher1[i]);
  }

  return cipher1;
  }
  private String randomValue(){
    int key;
    String output ="";
      for(int i=0;i<8;i++)
      {
        key = 0+(int)(Math.random()*9);
        output+=key;
      }
      return output;
  }

  public boolean Check_Lenght(int lenght)
  {
   if(lenght!=0)
   {
    if(lenght<9)
    {
       return true;
    }
   }
     return false;
  }
}