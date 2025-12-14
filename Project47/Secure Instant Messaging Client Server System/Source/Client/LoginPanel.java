import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.border.*;
import java.io.*;

public class LoginPanel extends JDialog {
  JPanel panel1 = new JPanel();
  BorderLayout borderLayout1 = new BorderLayout();
  GridBagLayout gridBagLayout1 = new GridBagLayout();
  Border border1;
  JLabel jLabel1 = new JLabel();
  JComboBox Combo_cert = new JComboBox();
  JLabel jLabel2 = new JLabel();
  JPasswordField Passwd = new JPasswordField();
  JButton B_search = new JButton();
  JButton B_login = new JButton();
  JButton B_close = new JButton();
  String cert_name;
  String pass;
  final JFileChooser Find_cert = new JFileChooser();
  File file_cert;
  boolean choose = false;
  ObjectInputStream read;
  String[] infile;
  boolean isnew = false;
  boolean correct = false;

  public LoginPanel(Frame frame, String title, boolean modal) {
    super(frame, title, modal);
    enableEvents(AWTEvent.WINDOW_EVENT_MASK);
    try {
      jbInit();
      pack();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }

  public LoginPanel() {
    this(null, "", false);
  }
  private void jbInit() throws Exception {
    panel1.setLayout(borderLayout1);
    getContentPane().add(panel1, BorderLayout.CENTER);
    border1 = BorderFactory.createEmptyBorder(3,3,3,3);
    this.setEnabled(true);
    this.setLocale(java.util.Locale.getDefault());
    this.setResizable(false);
    this.setSize(new Dimension(309, 223));
    this.setTitle("Login");
    this.setLocation(200,200);
    panel1.setLayout(gridBagLayout1);
    panel1.setAlignmentX((float) 0.5);
    panel1.setBorder(border1);
    jLabel1.setText("Cert Name");
    jLabel2.setText("Passphrase");
    Combo_cert.setAlignmentX((float) 0.5);
    Combo_cert.setAutoscrolls(false);
    Combo_cert.setActionCommand("comboBoxChanged");
    Combo_cert.setEditable(true);
    //Combo_cert.addItem(cert[1].toString());
    Combo_cert.addItemListener(new LoginPanel_Combo_cert_itemAdapter(this));
    Passwd.setText("");
    Passwd.addActionListener(new LoginPanel_Passwd_actionAdapter(this));
    B_search.setFont(new java.awt.Font("Dialog", 0, 10));
    B_search.setMaximumSize(new Dimension(25, 23));
    B_search.setMinimumSize(new Dimension(25, 23));
    B_search.setPreferredSize(new Dimension(25, 23));
    B_search.setMargin(new Insets(2, 2, 2, 2));
    B_search.setText(">>");
    B_search.addActionListener(new LoginPanel_B_search_actionAdapter(this));
    B_login.setMaximumSize(new Dimension(67, 25));
    B_login.setMinimumSize(new Dimension(67, 25));
    B_login.setPreferredSize(new Dimension(67, 25));
    B_login.setText("Login");
    B_login.addActionListener(new LoginPanel_B_login_actionAdapter(this));
    B_close.setText("Cancel");
    B_close.addActionListener(new LoginPanel_B_close_actionAdapter(this));
    panel1.add(jLabel1,                new GridBagConstraints(0, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.VERTICAL, new Insets(5, 5, 5, 5), 80, 0));
    panel1.add(Combo_cert,                   new GridBagConstraints(1, 0, 2, 1, 1.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.BOTH, new Insets(5, 10, 5, 0), 115, 0));
    panel1.add(jLabel2,              new GridBagConstraints(0, 1, 1, 1, 1.0, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.VERTICAL, new Insets(5, 5, 5, 5), 70, 0));
    panel1.add(Passwd,         new GridBagConstraints(1, 1, 3, 1, 1.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(5, 10, 5, 10), 145, 0));
    panel1.add(B_search,             new GridBagConstraints(3, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 10, 0, 10), 0, 0));
    panel1.add(B_login,        new GridBagConstraints(1, 2, 1, 1, 0.0, 0.0
            ,GridBagConstraints.SOUTHWEST, GridBagConstraints.NONE, new Insets(20, 10, 0, 0), 0, 0));
    panel1.add(B_close,   new GridBagConstraints(2, 2, 1, 1, 0.0, 0.0
            ,GridBagConstraints.SOUTH, GridBagConstraints.NONE, new Insets(10, 0, 0, 0), 0, 0));
   File dir = new File(".");
   Find_cert.setCurrentDirectory(dir);
   getCertList();
   initCertList();
   setVisible(true);

  // Combo_cert.add(new JComboBox(infile));
  }
  //Overridden so we can exit when window is closed
  protected void processWindowEvent(WindowEvent e) {
    super.processWindowEvent(e);
    if (e.getID() == WindowEvent.WINDOW_CLOSING) {
      //System.exit(0);
      this.dispose();
    }
  }

  void initCertList()
  {
    for(int i = 0 ;i<infile.length;i++)
      Combo_cert.addItem(infile[i]);
  }

  public String getCertName()
  {
    return cert_name;
  }

  public String getPasswd()
  {
    return pass;
  }

  void getCertList()
  {
    File temp= new File("./account");
    int i=0;

    if(temp.exists())
    {
      try
      {
        FileInputStream input = new FileInputStream(temp);
        read = new ObjectInputStream(input);
        infile = (String[])read.readObject();
      //  for(int j = 0 ; j< infile.length;j++)
      //  System.out.println(infile[j]);
        read.close();
      }
      catch (Exception e)
      {
        JOptionPane.showMessageDialog(this, "Error Loading File", "Error",
                                      JOptionPane.ERROR_MESSAGE);
      }
    }
    else
    {
      try
      {
        String[] initial = {" ","isagq"};
        FileOutputStream file = new FileOutputStream("account");
        ObjectOutputStream out = new ObjectOutputStream(file);
        out.writeObject(initial);
        out.close();
        infile = initial;
      }
      catch (IOException e)
      {
        JOptionPane.showMessageDialog(this, "Error Creating New File", "Error",
                                      JOptionPane.ERROR_MESSAGE);
      }
    }

  }
  public boolean Correct()
  {
    return correct;
  }
  void Combo_cert_itemStateChanged(ItemEvent e) {
    if(e.getStateChange() == ItemEvent.SELECTED)
    {
      cert_name = e.getItem().toString();
      System.out.println(cert_name);
    }
        choose = true;
  }

  void B_login_actionPerformed(ActionEvent e) {
    char[] temp_pass = Passwd.getPassword();

    compareCert();
    /*
    if(!choose)
    {
      cert_name = Combo_cert.getSelectedItem().toString();
    }
        */
    pass = new String(temp_pass);

    if(pass.length() != 0 && cert_name.length() !=0)
    {
      //System.out.println("+++++++++++++++++++++++++++++");
      //System.out.println(cert_name + "  " + pass);
      //System.out.println("Log in .....");
      correct = true;
      this.dispose();
    }
  }

  void B_close_actionPerformed(ActionEvent e) {
    this.dispose();
  }

  void Passwd_actionPerformed(ActionEvent e) {
    B_login.requestFocus();
    B_login_actionPerformed(e);
  }

  void B_search_actionPerformed(ActionEvent e) {
    int returnVal = Find_cert.showOpenDialog(this);

    if (returnVal == JFileChooser.APPROVE_OPTION) {
      file_cert = Find_cert.getSelectedFile();
      System.out.println("--->"+ file_cert.getAbsoluteFile());

    }
    else System.out.println("NO");
    choose = true;
  }

  void compareCert()
  {
    cert_name = Combo_cert.getSelectedItem().toString();
    boolean found = false;

    for(int i =0 ;i< infile.length;i++)
    {
      if(infile[i].compareTo(cert_name) == 0)
        {
          System.out.println("This :"+cert_name+" is old");
          found = true;
          break;
        }
    }
    //System.out.println("This :"+cert_name+" is new");
    if(!found)
    {
      isnew = true;
      System.out.println("This :"+cert_name+" is new");
    }

  }
  public boolean isNewCert()
  {
    return isnew;
  }
  public void WriteNew(String cert_name)
  {
    try{
      File file = new File("./account");
      FileInputStream input = new FileInputStream(file);
      ObjectInputStream read = new ObjectInputStream(input);
      String[] infile = (String[]) read.readObject();
      read.close();

      String[] outfile = new String[infile.length+1];
      for(int i = 0 ; i<infile.length ; i++)
      {
        outfile[i] = infile[i];
      }
      outfile[outfile.length-1] = cert_name;

      FileOutputStream output = new FileOutputStream("account");
      ObjectOutputStream write = new ObjectOutputStream(output);
      write.writeObject(outfile);
      write.close();
    }
    catch(Exception e)
    {
      System.out.println("dkdfkf");
      e.printStackTrace();
    }

  }
}


class LoginPanel_Combo_cert_itemAdapter implements java.awt.event.ItemListener {
  LoginPanel adaptee;

  LoginPanel_Combo_cert_itemAdapter(LoginPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void itemStateChanged(ItemEvent e) {
    adaptee.Combo_cert_itemStateChanged(e);
  }
}

class LoginPanel_B_login_actionAdapter implements java.awt.event.ActionListener {
  LoginPanel adaptee;

  LoginPanel_B_login_actionAdapter(LoginPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.B_login_actionPerformed(e);
  }
}

class LoginPanel_B_close_actionAdapter implements java.awt.event.ActionListener {
  LoginPanel adaptee;

  LoginPanel_B_close_actionAdapter(LoginPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.B_close_actionPerformed(e);
  }
}

class LoginPanel_Passwd_actionAdapter implements java.awt.event.ActionListener {
  LoginPanel adaptee;

  LoginPanel_Passwd_actionAdapter(LoginPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.Passwd_actionPerformed(e);
  }
}

class LoginPanel_B_search_actionAdapter implements java.awt.event.ActionListener {
  LoginPanel adaptee;

  LoginPanel_B_search_actionAdapter(LoginPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.B_search_actionPerformed(e);
  }
}
