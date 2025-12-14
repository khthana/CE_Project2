package routersim;

import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import java.rmi.*;
import java.rmi.server.*;
import com.borland.jbcl.layout.*;
import javax.crypto.*;
import javax.crypto.spec.*;
import java.security.spec.*;
import java.security.*;
import java.math.*;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */

public class PasswordDialog extends JDialog {
  private JPanel panel1 = new JPanel();
  private JTextField jadminpwd = new JTextField();
  private JTextField juserpwd = new JTextField();
  private JLabel jLabelAdmin = new JLabel();
  private JLabel jLabeluser = new JLabel();
  private JButton jok = new JButton();
  private JButton jcancel = new JButton();
  //------
  private String admin_pwd="";
  static byte[] password = new byte[16];
  private String user_pwd="";
  static boolean admin_press = false;
  static boolean user_press = false;
  static String key="71543260";
  static String output="";
  static String serverName="";
  private XYLayout xYLayout1 = new XYLayout();
  private XYLayout xYLayout2 = new XYLayout();


  public PasswordDialog(Frame frame, String title, boolean modal) {
    super(frame, title, modal);
    try {
      jbInit();
      pack();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }

  public PasswordDialog() {
    this(null, "Asign Password", false);
  }
  private void jbInit() throws Exception {
    panel1.setLayout(xYLayout1);
    this.getContentPane().setLayout(xYLayout2);
    //jadminpwd.setText("jTextField1");
    jadminpwd.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jadminpwd_actionPerformed(e);
      }
    });
    juserpwd.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        juserpwd_actionPerformed(e);
      }
    });
    //juserpwd.setText("jTextField1");
    jLabelAdmin.setFont(new java.awt.Font("Dialog", 1, 15));
    jLabelAdmin.setText("Administrator\'s password");
    jLabeluser.setText("User\'s password");
    jLabeluser.setFont(new java.awt.Font("Dialog", 1, 15));
    jok.setText("OK");
    jok.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jok_actionPerformed(e);
      }
    });
    jcancel.setText("Cancel");
    jcancel.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jcancel_actionPerformed(e);
      }
    });
    getContentPane().add(panel1,  new XYConstraints(10, 10, 253, 256));
    panel1.add(jLabelAdmin,  new XYConstraints(31, 18, 188, 26));
    panel1.add(jadminpwd,  new XYConstraints(30, 50, 152, 26));
    panel1.add(jLabeluser,  new XYConstraints(29, 96, 188, 26));
    panel1.add(juserpwd,  new XYConstraints(30, 129, 152, 26));
    panel1.add(jok,  new XYConstraints(28, 197, 73, 33));
    panel1.add(jcancel,  new XYConstraints(134, 198, -1, 33));
    //-- set display position
   Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
   Dimension frameSize = this.getSize();
   if (frameSize.height > screenSize.height) {
     frameSize.height = screenSize.height;
   }
   if (frameSize.width > screenSize.width) {
     frameSize.width = screenSize.width;
   }
   this.setLocation((screenSize.width - frameSize.width) / 4, (screenSize.height - frameSize.height) / 4);
   this.setVisible(true);
  }

  void jadminpwd_actionPerformed(ActionEvent e) {
    admin_press = true;
    if(user_press)
    {
      jok_actionPerformed(e);
      admin_press = false;
    }
    admin_press = false;
  }

  void juserpwd_actionPerformed(ActionEvent e) {
    user_press = true;
    if(admin_press)
    {
      jok_actionPerformed(e);
      admin_press = false;
    }
    admin_press = false;
  }
  void jok_actionPerformed(ActionEvent e) {
    String u_pwd =   juserpwd.getText();
    String a_pwd =   jadminpwd.getText();
    if((Check_Lenght(a_pwd.length())) && (Check_Lenght(u_pwd.length())))
    {
        Encoder(a_pwd,u_pwd);
    }
    else
    {
      output="";
      JOptionPane.showMessageDialog(null,"Password is more than 8 charactor..","Warning Message",JOptionPane.INFORMATION_MESSAGE);

    }
    this.hide();
  }

  void jcancel_actionPerformed(ActionEvent e) {
     this.hide();
  }

  public void Encoder(String admin,String user)
  {
    try {
      serverName = Frame3.serverName;
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
    try{
      PassengerInt pas = (PassengerInt)Naming.lookup("//"+serverName+"/PassengerService");
     //pas.Generatekey();
      KeyManager k = new KeyManager();
      //.........(1).....get parameter p ,g and l
      String params = k.genDhParams();
      //.........(2).....Generate publickey and privatekey
      k.GenerateKey(params);
      PrivateKey pri_key = k.GetPrivatekey();
      PublicKey pub_key_self  = k.GetPublicKey();
      //.........(3).... Receive publickey from other party and send params p ,g and l to server
      PublicKey pub_key_other = pas.ReceivePublicKey(params);
      //.........(4).... Send publickey to other party
      pas.SendPublicKey(pub_key_self);
      //.........(5).... Generate Secretkry by other publickey
      k.GenerateSecretKey(pub_key_other,pri_key);
      SecretKey sec_key = k.GetSecretKey();
      // Encrypt password
      DesEncrypter des = new DesEncrypter(sec_key);
      String ciphertext1 = des.encrypt(admin);
      // Send ciphertext to server
      pas.SendCiphertext(ciphertext1);
      // Encrypt user_password
      String ciphertext2 = des.encrypt(user);
      // Send ciphertext to server
      pas.SendCiphertext(ciphertext2);
    }
    catch(Exception ex1)
    {
      ex1.printStackTrace();
    }
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