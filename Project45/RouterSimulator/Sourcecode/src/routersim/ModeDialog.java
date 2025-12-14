/* Welcome Dialog for select mode and input server ip address */

package routersim;

import java.awt.*;
import javax.swing.*;
import java.rmi.Naming;
import java.awt.event.*;
import java.rmi.*;
import java.rmi.server.*;
import javax.crypto.*;
import javax.crypto.spec.*;
import java.security.spec.*;
import java.security.*;
import java.math.*;
import com.borland.jbcl.layout.*;

public class ModeDialog extends JDialog {
  private JPanel panel1 = new JPanel();
  private BorderLayout borderLayout1 = new BorderLayout();
  private JTextField jTextField1 = new JTextField();
  private JLabel jLabel1 = new JLabel();
  private JButton jOK_button = new JButton();
  private JButton jCancel_button = new JButton();
  static String hostname="";
  static String key="71543260";
  private int mode=0;
  private XYLayout xYLayout1 = new XYLayout();
  private XYLayout xYLayout2 = new XYLayout();

  private JRadioButton jRadioButton1 = new JRadioButton();
  private JRadioButton jRadioButton2 = new JRadioButton();
  private ButtonGroup bg = new ButtonGroup();
  private JLabel jLabel7 = new JLabel();
  private ButtonGroup buttonGroup1 = new ButtonGroup();
  private JLabel jLabel_login = new JLabel();
  private JLabel jLabel_password = new JLabel();
  private JPasswordField jPassword = new JPasswordField();
  private String serverName="";

  public ModeDialog(Frame frame, String title, boolean modal) {

    super(frame, title, modal);
    try {
      jbInit();
      pack();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }

  public ModeDialog() {
    this(null, " R o u t e r  S i m u l a t o r ", false);
  }

  private void jbInit() throws Exception {

    jLabel1.setFont(new java.awt.Font("Monospaced", 1, 18) );
    jLabel1.setText("Application Mode .");
    jLabel1.setForeground(Color.darkGray );
    jRadioButton1.setText("Administrator Mode ");
    jRadioButton1.setFont( new Font("Tahoma", Font.PLAIN, 12) );
    jRadioButton2.setText("User Mode");
    jRadioButton2.setFont( new Font("Tahoma", Font.PLAIN, 12) );
    jLabel7.setText("Server ip address .");
    jLabel7.setForeground(Color.darkGray );
    jLabel7.setFont(new java.awt.Font("Monospaced", 1, 18) );

    jOK_button.setText("OK");
    jOK_button.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jOK_button_actionPerformed(e);
      }
    });

    jCancel_button.setText("Cancel");
    jCancel_button.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jCancel_button_actionPerformed(e);
      }
    });

    jLabel_login.setFont(new java.awt.Font("Monospaced", 1, 18));
    jLabel_login.setText("Login");
    jLabel_password.setFont(new java.awt.Font("Dialog", 0, 13));
    jLabel_password.setText("Password");
    jPassword.setText("jPasswordField1");
    jPassword.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jPassword_actionPerformed(e);
      }
    });
    jTextField1.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jTextField1_actionPerformed(e);
      }
    });
    bg.add( jRadioButton1 );
    bg.add( jRadioButton2 );

    this.getContentPane().setLayout(xYLayout2);
    xYLayout2.setWidth(551);
    xYLayout2.setHeight(308);

    this.getContentPane().add(panel1,                 new XYConstraints(-1, 0, 525, 231));
    panel1.setLayout(xYLayout1);
    panel1.add(jRadioButton1, new XYConstraints(34, 62, -1, -1));
    panel1.add(jRadioButton2,  new XYConstraints(34, 85, 142, 24));
    panel1.add(jLabel1,  new XYConstraints(29, 30, 293, -1));
    panel1.add(jTextField1, new XYConstraints(285, 64, 166, 23));
    panel1.add(jLabel7,  new XYConstraints(276, 31, 401, -1));
    panel1.add(jLabel_login, new XYConstraints(30, 113, 102, 28));
    panel1.add(jOK_button, new XYConstraints(286, 162, 66, 20));
    panel1.add(jCancel_button, new XYConstraints(374, 162, 74, 20));
    panel1.add(jLabel_password, new XYConstraints(29, 152, -1, -1));
    panel1.add(jPassword, new XYConstraints(109, 152, 114, -1));
    hostname = jTextField1.getText();
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

  void jOK_button_actionPerformed(ActionEvent e) {

    //-- get host name from textbox
     hostname = jTextField1.getText();

    //-- get mode
    if (jRadioButton1.isSelected()){
      mode = 1;
      ImageMotion.mode = 1;
      this.dispose();
    }
    else if (jRadioButton2.isSelected()){
      mode = 2;
      ImageMotion.mode = 2;
      this.dispose();
    }
    boolean match=false;
    char[] pwd=jPassword.getPassword();
    System.out.print("Password: "+pwd );
    if(Check_Lenght(jPassword.getPassword().length))
    {
      match=Check_pwd(ToString(pwd));
    }
    if(match)
    {

      //-- set ------------------------------------------------------------------------------------------------

      Frame3 app = new Frame3(mode,hostname);
      app.validate();
      Mainwindows.Clientlist.addElement(app);

      try{

        System.out.print("Servername2   "+ hostname);
        StatusPanelInt st = (StatusPanelInt)Naming.lookup("//"+hostname+"/SPservice");
        st.registerClient( app );
      }
      catch(Exception e1){
        e1.printStackTrace();
      }

      //-- set application show
      Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
      Dimension frameSize = app.getSize();

      if (frameSize.height > screenSize.height) {
        frameSize.height = screenSize.height;
      }

      if (frameSize.width > screenSize.width) {
        frameSize.width = screenSize.width;
      }

      app.setLocation((screenSize.width - frameSize.width) / 2, (screenSize.height - frameSize.height) / 2);
      app.setVisible(true);

      //--------------------------------------------------------------------------
    }
    else
    {

      WarningDialog d = new  WarningDialog();
    }

    this.hide();
  }

  void jCancel_button_actionPerformed(ActionEvent e) {

    this.dispose();
  }

  public String gethostname(){

    return hostname;
  }
  // check length of password
  public boolean Check_Lenght(int lenght)
  {
    if(lenght!=-1)
    {
      if(lenght<9)
      {
        return true;
      }
    }
    return false;
  }
  protected void processWindowEvent(WindowEvent e) {
    super.processWindowEvent(e);
    if (e.getID() == WindowEvent.WINDOW_CLOSING) {
      this.dispose();
    }
  }
 //
  void jPassword_actionPerformed(ActionEvent e) {
    boolean match=false;
    char[] pwd=jPassword.getPassword();
    System.out.print("Password: "+pwd );
    if(Check_Lenght(jPassword.getPassword().length))
    {
      match=Check_pwd(ToString(pwd));
    }
    if(match)
    {
      jOK_button_actionPerformed(e);
    }
    else
      {
        JOptionPane.showMessageDialog(null,"Password incorrect..","Warning Message",JOptionPane.INFORMATION_MESSAGE);
      }
  }
  // convert char to string
  public String ToString(char[] text)
  {
    String str="";
    for(int i=0;i<text.length;i++)
    {
      str+=(char)text[i];
    }
    return str;
  }
 // check password compare between client and server
  public boolean Check_pwd(String pwd)
  {
    boolean match = false;
    try{
     PassengerInt pas = (PassengerInt)Naming.lookup("//"+ hostname+"/PassengerService");
     System.out.print(hostname);
     KeyManager2 k = new KeyManager2();
     //.........(1).....get parameter p ,g and l
     String params = k.genDhParams();
     System.out.print("Step 1");
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
     DesEncrypter2 des = new DesEncrypter2(sec_key);
     String ciphertext1 = des.encrypt(pwd);
     // verifie password
     match = pas.VerifiePassword(ciphertext1);
     System.out.print(match);


    }
    catch(Exception ex1)
    {
      ex1.printStackTrace();
    }
   return match;
  }

  void jTextField1_actionPerformed(ActionEvent e) {
     hostname = jTextField1.getText();
     System.out.print(hostname);
  }
}