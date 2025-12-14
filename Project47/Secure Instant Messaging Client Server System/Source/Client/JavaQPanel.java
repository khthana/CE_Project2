import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.tree.*;
import javax.swing.event.*;
import javax.swing.border.*;
import java.util.Iterator;
import java.io.*;

public class JavaQPanel extends JFrame {
  JPanel contentPane;
  JMenuBar jMenuBar1 = new JMenuBar();
  JMenu MF_file = new JMenu();
  JMenuItem jMenuFileExit = new JMenuItem();
  JMenu MF_help = new JMenu();
  JMenuItem jMenuHelpAbout = new JMenuItem();
  JLabel statusBar = new JLabel();
  BorderLayout borderLayout1 = new BorderLayout();
  JPanel jPanel1 = new JPanel();
  GridBagLayout gridBagLayout1 = new GridBagLayout();
  Border border1;
  JLabel jLabel1 = new JLabel();
  JButton B_login = new JButton();
  LoginPanel login ;
  JPanel jPanel2 = new JPanel();
  JPanel jPanel3 = new JPanel();
  JLabel jLabel2 = new JLabel();
  JLabel jLabel3 = new JLabel();
  JLabel jLabel4 = new JLabel();
  JMenuItem M_signin = new JMenuItem();
  JMenuItem M_signout = new JMenuItem();
  JMenuItem jMenuItem3 = new JMenuItem();
  JMenuItem M_close = new JMenuItem();
  JMenu MF_status = new JMenu();
  JMenuItem M_Son = new JMenuItem();
  JMenuItem M_Sbusy = new JMenuItem();
  JMenuItem M_Saway = new JMenuItem();
  JMenu MF_contact = new JMenu();
  JMenuItem M_add = new JMenuItem();
  JMenuItem M_del = new JMenuItem();
  JMenuItem M_find = new JMenuItem();
  JMenuItem M_nickname = new JMenuItem();
  JMenuItem M_deny = new JMenuItem();
  JMenuItem M_admit = new JMenuItem();
  JMenuItem M_accept = new JMenuItem();

  JTabbedPane jTabbedPane1 = new JTabbedPane();
  Border border2;
  BorderLayout borderLayout2 = new BorderLayout();
  JPanel jPanel4 = new JPanel();
  JPanel jPanel5 = new JPanel();

  DefaultMutableTreeNode N_Contact = new DefaultMutableTreeNode("Contactlist");
  DefaultMutableTreeNode N_Online = new DefaultMutableTreeNode("Online");
  DefaultMutableTreeNode N_Busy = new DefaultMutableTreeNode("Busy");
  DefaultMutableTreeNode N_Away = new DefaultMutableTreeNode("Away");
  DefaultMutableTreeNode N_Offline = new DefaultMutableTreeNode("Offline");

  DefaultMutableTreeNode N_Wait = new DefaultMutableTreeNode("Waiting");
  DefaultMutableTreeNode N_Auth = new DefaultMutableTreeNode("Authorize");
  DefaultMutableTreeNode N_Deny = new DefaultMutableTreeNode("Blocked");

/*
DefaultMutableTreeNode N_Contact = new DefaultMutableTreeNode("Contactlist");
DefaultMutableTreeNode N_Online = new DefaultMutableTreeNode(new ContactNode(null,null,null));
DefaultMutableTreeNode N_Offline = new DefaultMutableTreeNode(new ContactNode(null,null,null));
DefaultMutableTreeNode N_Wait = new DefaultMutableTreeNode(new ContactNode(null,null,null));
DefaultMutableTreeNode N_Auth = new DefaultMutableTreeNode(new ContactNode(null,null,null));
DefaultMutableTreeNode N_Deny = new DefaultMutableTreeNode(new ContactNode(null,null,null));
*/
  BorderLayout borderLayout4 = new BorderLayout();
  GridBagLayout gridBagLayout2 = new GridBagLayout();
  Border border3;

  JButton B_Add = new JButton();
  JTree T_Contactlist = new JTree(N_Contact);

  JScrollPane treeView = new JScrollPane(T_Contactlist);
  JTextArea A_userID = new JTextArea();
  JTextArea A_status = new JTextArea();
  JTextArea A_nick = new JTextArea();

  //------------------------------------------------------------------------------

  SSLConnection ssl_context ;
  contact user_contact;
  contact user_auth;
  service tos;
  RequestStatus poll;
  //Thread poll_thread;
  LoginPanel dialog;
  Server server;
  int ServerPort = 16001;
  String ServerIP = "161.246.5.32";
  //------------------------------------------------------------------------------

  //Construct the frame
  public JavaQPanel() {
    enableEvents(AWTEvent.WINDOW_EVENT_MASK);
    try {
      jbInit();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }
  //Component initialization
  private void jbInit() throws Exception  {
    contentPane = (JPanel) this.getContentPane();
    border1 = BorderFactory.createEmptyBorder(3,3,3,3);
    border2 = BorderFactory.createEmptyBorder(3,3,3,3);
    border3 = BorderFactory.createEmptyBorder(3,3,3,3);
    contentPane.setLayout(borderLayout1);
    this.setSize(new Dimension(256, 470));
    this.setTitle("JavaQ");
    statusBar.setText(" ");
    MF_file.setText("File");
    jMenuFileExit.setText("Exit");
    //jMenuFileExit.addActionListener(new JavaQPanel_jMenuFileExit_ActionAdapter(this));
    MF_help.setText("Help");
    jMenuHelpAbout.setText("About");
    jMenuHelpAbout.addActionListener(new JavaQPanel_jMenuHelpAbout_ActionAdapter(this));
    jPanel1.setBorder(border1);
    jPanel1.setDebugGraphicsOptions(0);
    jPanel1.setLayout(gridBagLayout1);
    jLabel1.setFont(new java.awt.Font("Dialog", 1, 32));
    jLabel1.setText("IsagQ");
    B_login.setFont(new java.awt.Font("Dialog", 1, 15));
    B_login.setText("Login");
    B_login.addActionListener(new JavaQPanel_B_login_actionAdapter(this));
    jLabel2.setFont(new java.awt.Font("Dialog", 0, 20));
    jLabel2.setText("Wait");
    jLabel3.setFont(new java.awt.Font("Dialog", 0, 20));
    jLabel3.setText("for");
    jLabel4.setFont(new java.awt.Font("Dialog", 0, 20));
    jLabel4.setText("Signing in");
    jPanel2.setEnabled(true);
    M_signin.setText("Sign in");
    M_signin.addActionListener(new JavaQPanel_M_signin_actionAdapter(this));
    M_signout.setEnabled(false);
    M_signout.setText("Sign out");
    M_signout.addActionListener(new JavaQPanel_M_signout_actionAdapter(this));
    jMenuItem3.setText("Close");
    M_close.setText("Close");
    M_close.addActionListener(new JavaQPanel_M_close_actionAdapter(this));
    MF_status.setText("Status");
   // MF_status.addActionListener(new JavaQPanel_MF_status_actionAdapter(this));
    M_Son.setEnabled(false);
    M_Son.setText("Online");
    M_Son.addActionListener(new JavaQPanel_M_Son_actionAdapter(this));
    M_Sbusy.setEnabled(false);
    M_Sbusy.setText("Busy");
    M_Sbusy.addActionListener(new JavaQPanel_M_Sbusy_actionAdapter(this));
    M_Saway.setEnabled(false);
    M_Saway.setText("Away");
    M_Saway.addActionListener(new JavaQPanel_M_Saway_actionAdapter(this));
    MF_contact.setText("Contact");
    M_add.setEnabled(false);
    M_add.setText("Add Contact");
    M_add.addActionListener(new JavaQPanel_M_add_actionAdapter(this));
    M_del.setEnabled(false);
    M_del.setText("Delete Contact");
    M_del.addActionListener(new JavaQPanel_M_del_actionAdapter(this));
    M_find.setEnabled(false);
    M_find.setText("Find Contact");
    M_find.addActionListener(new JavaQPanel_M_find_actionAdapter(this));
    M_close.setEnabled(false);
    jPanel3.setLayout(borderLayout2);
    jTabbedPane1.setBorder(border2);
    jPanel4.setBorder(border3);
    jPanel4.setDebugGraphicsOptions(0);
    jPanel4.setLayout(gridBagLayout2);
    jPanel5.setLayout(borderLayout4);
    B_Add.setText("Add Contactlist");
    treeView.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
    A_userID.setEditable(false);
    A_nick.setEditable(false);
    A_nick.setText("");
    A_status.setEditable(false);
    A_status.setText("");
    M_nickname.setEnabled(false);
    M_nickname.setText("Change Nickname");
    M_nickname.addActionListener(new JavaQPanel_M_nickname_actionAdapter(this));
    M_deny.setEnabled(false);
    M_deny.setText("Deny User");
    M_deny.addActionListener(new JavaQPanel_M_deny_actionAdapter(this));
    M_admit.setEnabled(false);
    M_admit.setText("Admit User");
    M_admit.addActionListener(new JavaQPanel_M_admit_actionAdapter(this));
    M_accept.setEnabled(false);
    M_accept.setText("Accept Authorize");
    M_accept.addActionListener(new JavaQPanel_M_accept_actionAdapter(this));

    MF_file.add(M_signin);
    MF_file.add(M_signout);
    MF_help.add(jMenuHelpAbout);
    jMenuBar1.add(MF_file);
    jMenuBar1.add(MF_status);
    jMenuBar1.add(MF_contact);
    jMenuBar1.add(MF_help);
    this.setJMenuBar(jMenuBar1);
    contentPane.add(statusBar, BorderLayout.SOUTH);
    contentPane.add(jPanel1, BorderLayout.CENTER);
    jPanel1.add(jLabel1,    new GridBagConstraints(0, 0, 1, 1, 0.0, 1.0
            ,GridBagConstraints.NORTH, GridBagConstraints.NONE, new Insets(10, 0, 20, 0), 0, 0));
    jPanel1.add(B_login,         new GridBagConstraints(0, 1, 1, 1, 0.0, 5.0
            ,GridBagConstraints.NORTH, GridBagConstraints.NONE, new Insets(10, 0, 0, 0), 0, 0));

    //*********************************************************************************************

    jPanel2.setBorder(border1);
    jPanel2.setDebugGraphicsOptions(0);
    jPanel2.setLayout(gridBagLayout1);
    jPanel2.add(jLabel2,       new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.NORTH, GridBagConstraints.VERTICAL, new Insets(5, 5, 5, 5), 0, 0));
    jPanel2.add(jLabel3,      new GridBagConstraints(0, 1, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.VERTICAL, new Insets(5, 5, 5, 5), 0, 0));
    jPanel2.add(jLabel4,      new GridBagConstraints(0, 2, 1, 1, 0.0, 0.0
            ,GridBagConstraints.SOUTH, GridBagConstraints.VERTICAL, new Insets(5, 5, 5, 5), 0, 0));

     //********************************************************************************************
    //T_Contactlist.addTreeSelectionListener(new NodeSelectionListener());
   // T_Contactlist.addMouseListener(new MouseAdaptor());

    MF_file.add(M_close);
    MF_status.add(M_Son);
    MF_status.add(M_Sbusy);
    MF_status.add(M_Saway);
    MF_status.addSeparator();
    MF_status.add(M_nickname);
    MF_contact.add(M_add);
    MF_contact.add(M_del);
    MF_contact.add(M_find);
    MF_contact.addSeparator();
    MF_contact.add(M_deny);
    MF_contact.add(M_admit);
    MF_contact.addSeparator();
    MF_contact.add(M_accept);
    jPanel3.add(jTabbedPane1, BorderLayout.CENTER);
    jTabbedPane1.add(jPanel4,   "IsagQ");
    jPanel4.add(B_Add,          new GridBagConstraints(1, 4, 1, 1, 2.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(5, 5, 5, 5), 0, 0));
    jPanel4.add(treeView,             new GridBagConstraints(0, 1, 3, 1, 0.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(5, 5, 5, 5), 3, 0));
    jPanel4.add(A_userID,                        new GridBagConstraints(0, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(3, 5, 3, 0), 1, 0));
    jPanel4.add(A_status,         new GridBagConstraints(2, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(3, 0, 3, 5), 0, 0));
    jPanel4.add(A_nick,    new GridBagConstraints(1, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(3, 0, 3, 0), 1, 0));
    jTabbedPane1.add(jPanel5,   "ICQ");

    N_Contact.add(N_Online);
    N_Contact.add(N_Busy);
    N_Contact.add(N_Away);
    N_Contact.add(N_Offline);
    N_Contact.add(N_Wait);
    N_Contact.add(N_Auth);
    N_Contact.add(N_Deny);

    MouseListener ml = new MouseAdapter() {
      public void mousePressed(MouseEvent e)
      {
        int selRow = T_Contactlist.getRowForLocation(e.getX(), e.getY());
        TreePath selPath = T_Contactlist.getPathForLocation(e.getX(), e.getY());
        DefaultMutableTreeNode node = (DefaultMutableTreeNode) T_Contactlist.
            getLastSelectedPathComponent();
        if (selRow > 0 && selPath.getPathCount() > 2)
        {
          if (e.getClickCount() == 1)
          {
            System.out.println("One Click" + " " + selRow + " " +
                               selPath.getPathCount());
            System.out.println(node.toString());

            if (node.isLeaf())
            {
              Object nodeInfo = node.getUserObject();
              ContactNode y = (ContactNode) nodeInfo;
              y.Print();
            }
          }
          else if (e.getClickCount() == 2)
          {
            System.out.println("Double Click" + " " + selRow + " " +
                               selPath.toString());
            if (node.isLeaf())
            {
              Object nodeInfo = node.getUserObject();
              ContactNode y = (ContactNode) nodeInfo;
              y.Print();
              //Have to check that there is still panel associated the both ips
              //Client z = new Client("161.246.5.4",16003,dialog.getCertName(),dialog.getPasswd());
              //Client z = new Client(y.get_IP(),16003,dialog.getCertName(),dialog.getPasswd());
              ChatPanel z = new ChatPanel(y.get_IP(),16002,dialog.getCertName(),dialog.getPasswd());
            }

          }
        }
      }
    };
     T_Contactlist.addMouseListener(ml);

  }
  //File | Exit action performed
  public void jMenuFileExit_actionPerformed(ActionEvent e) {
    System.exit(0);
  }
  //Help | About action performed
  public void jMenuHelpAbout_actionPerformed(ActionEvent e) {
    JavaQPanel_AboutBox dlg = new JavaQPanel_AboutBox(this);
    Dimension dlgSize = dlg.getPreferredSize();
    Dimension frmSize = getSize();
    Point loc = getLocation();
    dlg.setLocation((frmSize.width - dlgSize.width) / 2 + loc.x, (frmSize.height - dlgSize.height) / 2 + loc.y);
    dlg.setModal(true);
    dlg.pack();
    dlg.show();
  }
  //Overridden so we can exit when window is closed
  protected void processWindowEvent(WindowEvent e) {
    super.processWindowEvent(e);
    if (e.getID() == WindowEvent.WINDOW_CLOSING) {
      System.exit(0);
    }
  }
  boolean Connect_to_Server()
  {
    try
    {
      ssl_context = new SSLConnection(ServerIP, ServerPort,
                                      dialog.getCertName(),
                                      dialog.getPasswd());
      if(ssl_context.isConnected())
      {
        System.out.println("Connection Established!");
        return true;
      }
      else
      {
        System.out.println("Connection to Server Failed");
        return false;
      }
    }
    catch (Exception ie)
    {
      ie.printStackTrace();
      System.out.println("Connection to Server Failed!");
      return false;
    }
  }

  boolean StartService()
  {
    try
    {
      System.out.println("Starting Services!");
      tos = new service(ssl_context, ssl_context.get_client_ip());
      tos.Status();
      tos.Authorize();
      UpdateMenu(true);
      user_contact = tos.getPtrContact();
      System.out.println("Updating Contactlist!");
      UpdateContact();
      //poll_thread = new Thread(new RequestStatus(tos,this),"Poll_Thread");
      //poll_thread.start();
      poll = new RequestStatus(tos, this);
      poll.start();
      return true;
    }
    catch (Exception ie) {
      ie.printStackTrace();
      System.out.println("Start Services Failed!");
      return false;
    }

  }
  void B_login_actionPerformed(ActionEvent e) {

    dialog = new LoginPanel(this,"xxxx",true);
    if(dialog.Correct())
    {
      try {

        contentPane.remove(jPanel1);
        contentPane.add(jPanel2, BorderLayout.CENTER);
        contentPane.updateUI();

        if (Connect_to_Server()) {
          //dialog.WriteNew(dialog.getCertName());
          if(dialog.isNewCert()) dialog.WriteNew(dialog.getCertName());
          contentPane.remove(jPanel2);
          contentPane.add(jPanel3, BorderLayout.CENTER);
          contentPane.updateUI();

          if (StartService()) {
            System.out.println("Starting accepting port");
            server = new Server(dialog.getCertName(), dialog.getPasswd(),
                                tos.get_contact_link());
          }
          else {
            JOptionPane.showMessageDialog(null, "Try next Time!",
                                          "ERROR", JOptionPane.ERROR_MESSAGE);

            contentPane.remove(jPanel2);
            contentPane.add(jPanel1, BorderLayout.CENTER);
            contentPane.updateUI();
          }
        }
        else {
          JOptionPane.showMessageDialog(null, "Try next Time!",
                                        "ERROR", JOptionPane.ERROR_MESSAGE);

          contentPane.remove(jPanel2);
          contentPane.add(jPanel1, BorderLayout.CENTER);
          contentPane.updateUI();

        }
      }
      catch (Exception ex) {
        JOptionPane.showMessageDialog(null, "Create port fail!",
                                      "ERROR", JOptionPane.ERROR_MESSAGE);
        contentPane.remove(jPanel2);
        contentPane.add(jPanel1, BorderLayout.CENTER);
        contentPane.updateUI();

      }
    }
    else
    {
      System.out.println("Incorrect input");
    }
    //System.out.println(dialog.getCertName());
  }
  void UpdateMenu(boolean tologin)
  {
    M_signin.setEnabled(!tologin);
    M_signout.setEnabled(tologin);
    M_Son.setEnabled(tologin);
    M_Sbusy.setEnabled(tologin);
    M_Saway.setEnabled(tologin);
    M_add.setEnabled(tologin);
    M_del.setEnabled(tologin);
    M_find.setEnabled(tologin);
    M_nickname.setEnabled(tologin);
    M_deny.setEnabled(tologin);
    M_admit.setEnabled(tologin);
    M_close.setEnabled(tologin);
    M_accept.setEnabled(tologin);
  }
  public void UpdateContact()
  {
    user_contact = tos.getPtrContact();
    Iterator i = user_contact.list.iterator();
    int count=0;

    N_Online.removeAllChildren();
    N_Busy.removeAllChildren();
    N_Away.removeAllChildren();
    N_Offline.removeAllChildren();
    N_Wait.removeAllChildren();
    N_Auth.removeAllChildren();
    N_Deny.removeAllChildren();

    while (i.hasNext())
    {
      Object x = i.next();
      profile y = (profile) x;
      switch (y.get_status()) {
        case 'O':
          N_Online.add(new DefaultMutableTreeNode(new ContactNode(Integer.
              toString(y.get_user_id()) + " :" + y.get_nickname(), y.get_ip())));
          break;
        case 'D':
          N_Deny.add(new DefaultMutableTreeNode(new ContactNode(Integer.
              toString(y.get_user_id()) + " :" + y.get_nickname(), y.get_ip())));
          break;
        case 'B':
          N_Busy.add(new DefaultMutableTreeNode(new ContactNode(Integer.
              toString(y.get_user_id()) + " :" + y.get_nickname(), y.get_ip())));
          break;
        case 'F':
          N_Offline.add(new DefaultMutableTreeNode(new ContactNode(Integer.
              toString(y.get_user_id()) + " :" + y.get_nickname(), y.get_ip())));
          break;
        case 'A':
          N_Away.add(new DefaultMutableTreeNode(new ContactNode(Integer.
              toString(y.get_user_id()) + " :" + y.get_nickname(), y.get_ip())));
          break;
        case 'W':
          N_Wait.add(new DefaultMutableTreeNode(new ContactNode(Integer.
              toString(y.get_user_id()) + " :" + y.get_nickname(), y.get_ip())));
          break;

      }

    }


    user_auth = tos.getPtrAuth();
    i = user_auth.list.iterator();

    while (i.hasNext()) {
      Object x = i.next();
      profile y = (profile) x;

      N_Auth.add(new DefaultMutableTreeNode(new ContactNode(Integer.
              toString(y.get_user_id()) + " :" + y.get_nickname(), y.get_ip())));
    }

    N_Contact.add(N_Online);
    N_Contact.add(N_Busy);
    N_Contact.add(N_Away);
    N_Contact.add(N_Deny);
    N_Contact.add(N_Offline);
    N_Contact.add(N_Wait);
    N_Contact.add(N_Auth);

    A_userID.setText(tos.get_ID());
    if(tos.get_Nickname().length()>12)
    A_nick.setText(tos.get_Nickname().substring(0,12));
    else
    A_nick.setText(tos.get_Nickname());
    A_status.setText(tos.get_Status());

    T_Contactlist.updateUI();

  }

  void Update()
  {
    user_contact = tos.getPtrContact();
    user_contact.clear();
    tos.Status();
    user_contact = tos.getPtrContact();
    UpdateContact();
  }

  void M_Son_actionPerformed(ActionEvent e) {
    tos.SetStatus(e.getActionCommand());
    A_status.setText(tos.get_Status());

  }

  void M_Sbusy_actionPerformed(ActionEvent e) {
    tos.SetStatus(e.getActionCommand());
    A_status.setText(tos.get_Status());

  }

  void M_Saway_actionPerformed(ActionEvent e) {
    tos.SetStatus(e.getActionCommand());
    A_status.setText(tos.get_Status());
  }

  void M_add_actionPerformed(ActionEvent e) {
    if(!tos.AddContact())
      System.out.println("Incomplete Add!");

    Update();

   }

  void M_del_actionPerformed(ActionEvent e) {

    if(!tos.Delete_Contactlist())
      System.out.println("Incomplete Delete!");

    Update();
  }

  void M_find_actionPerformed(ActionEvent e) {
    tos.FindContact();
  }

  void M_nickname_actionPerformed(ActionEvent e) {
    tos.ChangeNickname();
    if(tos.get_Nickname().length()>12)
    A_nick.setText(tos.get_Nickname().substring(0,12));
    else
    A_nick.setText(tos.get_Nickname());

  }

  void M_signin_actionPerformed(ActionEvent e) {
    B_login_actionPerformed(e);
  }

  void M_signout_actionPerformed(ActionEvent e) {
    System.out.println("sign out");
    tos.Logout();
    tos.dispose();
    poll.get_Timer().stop();
    //poll.currentThread().st
    //poll.Stop();
    server.Close();
    System.out.println("Thread running "+ Thread.activeCount());
    System.out.println(Thread.currentThread().getName());

    UpdateMenu(false);
    contentPane.remove(jPanel3);
    contentPane.add(jPanel1, BorderLayout.CENTER);
    contentPane.updateUI();

  }

  void M_close_actionPerformed(ActionEvent e) {
    /*
    System.out.println("close");
    tos.Logout();
    UpdateMenu(false);
    contentPane.remove(jPanel3);
    contentPane.add(jPanel1, BorderLayout.CENTER);
    contentPane.updateUI();
*/
    System.exit(0);
   /*
    getContentPane().remove(this);
    getContentPane().validate();
    repaint();
        */
}

  void M_deny_actionPerformed(ActionEvent e) {
    tos.Block();
    Update();
  }

  void M_admit_actionPerformed(ActionEvent e) {
    tos.Unblock();
    Update();
  }

  void M_accept_actionPerformed(ActionEvent e) {
    tos.Accept_auth();
    Update();
  }

}

class JavaQPanel_jMenuHelpAbout_ActionAdapter implements ActionListener {
  JavaQPanel adaptee;

  JavaQPanel_jMenuHelpAbout_ActionAdapter(JavaQPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuHelpAbout_actionPerformed(e);
  }
}

class JavaQPanel_B_login_actionAdapter implements java.awt.event.ActionListener {
  JavaQPanel adaptee;

  JavaQPanel_B_login_actionAdapter(JavaQPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.B_login_actionPerformed(e);
  }
}


class JavaQPanel_M_Son_actionAdapter implements java.awt.event.ActionListener {
  JavaQPanel adaptee;

  JavaQPanel_M_Son_actionAdapter(JavaQPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.M_Son_actionPerformed(e);
  }
}

class JavaQPanel_M_Sbusy_actionAdapter implements java.awt.event.ActionListener {
  JavaQPanel adaptee;

  JavaQPanel_M_Sbusy_actionAdapter(JavaQPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.M_Sbusy_actionPerformed(e);
  }
}

class JavaQPanel_M_Saway_actionAdapter implements java.awt.event.ActionListener {
  JavaQPanel adaptee;

  JavaQPanel_M_Saway_actionAdapter(JavaQPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.M_Saway_actionPerformed(e);
  }
}

class JavaQPanel_M_add_actionAdapter implements java.awt.event.ActionListener {
  JavaQPanel adaptee;

  JavaQPanel_M_add_actionAdapter(JavaQPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.M_add_actionPerformed(e);
  }
}

class JavaQPanel_M_del_actionAdapter implements java.awt.event.ActionListener {
  JavaQPanel adaptee;

  JavaQPanel_M_del_actionAdapter(JavaQPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.M_del_actionPerformed(e);
  }
}

class JavaQPanel_M_find_actionAdapter implements java.awt.event.ActionListener {
  JavaQPanel adaptee;

  JavaQPanel_M_find_actionAdapter(JavaQPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.M_find_actionPerformed(e);
  }
}

class JavaQPanel_M_signin_actionAdapter implements java.awt.event.ActionListener {
  JavaQPanel adaptee;

  JavaQPanel_M_signin_actionAdapter(JavaQPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.M_signin_actionPerformed(e);
  }
}

class JavaQPanel_M_signout_actionAdapter implements java.awt.event.ActionListener {
  JavaQPanel adaptee;

  JavaQPanel_M_signout_actionAdapter(JavaQPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.M_signout_actionPerformed(e);
  }
}

class JavaQPanel_M_close_actionAdapter implements java.awt.event.ActionListener {
  JavaQPanel adaptee;

  JavaQPanel_M_close_actionAdapter(JavaQPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.M_close_actionPerformed(e);
  }
}


class JavaQPanel_M_deny_actionAdapter implements java.awt.event.ActionListener {
  JavaQPanel adaptee;

  JavaQPanel_M_deny_actionAdapter(JavaQPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.M_deny_actionPerformed(e);
  }
}

class JavaQPanel_M_admit_actionAdapter implements java.awt.event.ActionListener {
  JavaQPanel adaptee;

  JavaQPanel_M_admit_actionAdapter(JavaQPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.M_admit_actionPerformed(e);
  }
}
/*
class JavaQPanel_T_Contactlist_actionAdapter implements java.awt.event.MouseAdapter
{
  JavaQPanel adaptee;
  JavaQPanel_T_Contactlist_actionAdapter(JavaQPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.T_Contactlist_actionPerformed(e);
  }

}
*/
class JavaQPanel_M_nickname_actionAdapter implements java.awt.event.ActionListener {
  JavaQPanel adaptee;

  JavaQPanel_M_nickname_actionAdapter(JavaQPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.M_nickname_actionPerformed(e);
  }
}
//class NodeSelectionListener implements javax.swing.event.TreeSelectionListener
//class JavaQPanel_NodeSelectionListener implements TreeSelectionListener

//{
class ContactNode
{
  String nickname;
  String ip;
 // String cat;
  public ContactNode(/*String category,*/String contact_nick,String contact_ip)
  {
    nickname = contact_nick;
    ip = contact_ip;
    //cat = category;
  }
  public String get_Nickname()
  {
    return nickname;
  }
  public String get_IP()
  {
    return ip;
  }
  public String toString()
  {
    return nickname;
  }
  public void Print()
  {
    System.out.println("Nickname is :"+nickname +"\n"+ "IP is :"+ip);
  }

};
class RequestStatus extends Thread
{
  service temp_serv;
  JavaQPanel temp_panel;
  Timer timer ;
  boolean signin = true;
  //Thread request;

  public RequestStatus(service tos,JavaQPanel panel)
  {
    temp_serv =tos;
    temp_panel = panel ;
    //request = new Thread(new RequestStatus(tos,panel),"ThreadA");
    //request.start();
  }
  public void run()
  {
      Polling();
      System.out.println("Timer Exit");
  }

   public void Polling()
   {
     ActionListener act = new ActionListener()
     {
       public void actionPerformed(ActionEvent e)
       {
         // Request here
         temp_serv.Status();
         temp_serv.Authorize();
         temp_panel.UpdateContact();
         System.out.println("Requesting Status");
       }
     };
      System.out.println("Polling outside");
      timer = new Timer(10000, act);
      timer.setInitialDelay(0);
                //tim.setCoalesce(true);
      timer.start();
    }
  public Timer get_Timer()
  {
    return timer;
  }
  public void Stop()
  {
    signin= false;
  }

};

class JavaQPanel_M_accept_actionAdapter implements java.awt.event.ActionListener {
  JavaQPanel adaptee;

  JavaQPanel_M_accept_actionAdapter(JavaQPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.M_accept_actionPerformed(e);
  }
}




