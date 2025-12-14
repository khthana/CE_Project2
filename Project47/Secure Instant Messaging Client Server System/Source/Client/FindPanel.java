import java.io.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.border.*;


public class FindPanel extends JFrame {
  JPanel contentPane;
  Border border1;
  GridBagLayout gridBagLayout2 = new GridBagLayout();
  JPanel jPanel1 = new JPanel();
  GridBagLayout gridBagLayout1 = new GridBagLayout();
  Border border2;
  JTextField T_lname = new JTextField();
  JTextField T_userID = new JTextField();
  JTextField T_email = new JTextField();
  JTextField T_fname = new JTextField();
  JLabel jLabel1 = new JLabel();
  JLabel jLabel2 = new JLabel();
  JLabel jLabel3 = new JLabel();
  JLabel jLabel4 = new JLabel();
  JRadioButton R_and = new JRadioButton();
  JRadioButton R_or = new JRadioButton();
  JLabel jLabel5 = new JLabel();
  JScrollPane jScrollPane1 = new JScrollPane();
  JTextArea display = new JTextArea();
  JButton B_close = new JButton();
  JButton B_search = new JButton();
  ButtonGroup B_group = new ButtonGroup();

  boolean chk_uid ;
  boolean chk_email;
  boolean chk_fname;
  boolean chk_lname;

  String user_id;
  String email;
  String f_name;
  String l_name;

  byte buffer_write[] = new byte[512];
  String buffer_read = "";
  String msg = "";
  String temp ;
  byte[] input = new byte[80];
  byte header[] = new byte[7];

  SSLConnection ting;


  //Construct the frame
  public FindPanel(SSLConnection Session) {
    enableEvents(AWTEvent.WINDOW_EVENT_MASK);
    try {
      jbInit(Session);
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }
  //Component initialization
  private void jbInit(SSLConnection Session) throws Exception  {
    contentPane = (JPanel) this.getContentPane();
    border1 = BorderFactory.createEmptyBorder(3,3,3,3);
    border2 = BorderFactory.createEmptyBorder(10,10,10,10);
    this.setSize(new Dimension(400, 343));
    this.setTitle("Find Contact List");
    jPanel1.setBorder(border2);
    jPanel1.setDebugGraphicsOptions(0);
    jPanel1.setLayout(gridBagLayout1);
    jLabel1.setText("UserID");
    jLabel2.setText("Email");
    jLabel3.setText("First Name");
    jLabel4.setText("Last Name");
    R_and.setSelected(true);
    R_and.setText("AND");
    R_or.setActionCommand("OR");
    R_or.setText("OR");
    jLabel5.setText("Result");
    B_close.setText("Close");
    B_close.addActionListener(new FindPanel_B_close_actionAdapter(this));
    B_search.setText("Search");
    B_search.addActionListener(new FindPanel_B_search_actionAdapter(this));
    T_userID.setText("");
    T_userID.addKeyListener(new FindPanel_T_userID_keyAdapter(this));
    T_email.setText("");
    T_email.addKeyListener(new FindPanel_T_email_keyAdapter(this));
    T_fname.setText("");
    T_fname.addKeyListener(new FindPanel_T_fname_keyAdapter(this));
    T_lname.setText("");
    T_lname.addKeyListener(new FindPanel_T_lname_keyAdapter(this));
    display.setText("");
    contentPane.add(jPanel1, BorderLayout.CENTER);
    jPanel1.add(T_userID,new GridBagConstraints(1, 0, 2, 1, 2.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 5, 0, 5), 115, 0));
    jPanel1.add(T_email,new GridBagConstraints(1, 1, 2, 1, 2.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 5, 0, 5), 78, 0));
    jPanel1.add(T_fname,new GridBagConstraints(1, 2, 2, 1, 2.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 5, 0, 5), 0, 0));
    jPanel1.add(jLabel1,new GridBagConstraints(0, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets(0, 0, 0, 10), 0, 0));
    jPanel1.add(T_lname,new GridBagConstraints(1, 3, 2, 1, 2.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 5, 0, 5), 0, 0));
    jPanel1.add(jLabel2,new GridBagConstraints(0, 1, 1, 1, 1.0, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets(0, 0, 0, 10), 0, 0));
    jPanel1.add(jLabel3,new GridBagConstraints(0, 2, 1, 1, 1.0, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets(0, 0, 0, 10), 0, 0));
    jPanel1.add(jLabel4,new GridBagConstraints(0, 3, 1, 1, 1.0, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets(0, 0, 0, 10), 0, 0));
    jPanel1.add(R_and,new GridBagConstraints(3, 2, 1, 1, 1.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(10, 10, 10, 0), 0, 0));
    jPanel1.add(R_or,new GridBagConstraints(3, 3, 1, 1, 1.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(10, 10, 10, 0), 0, 0));
    jPanel1.add(jLabel5,new GridBagConstraints(0, 4, 1, 1, 1.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(10, 10, 10, 0), 0, 0));
    jPanel1.add(jScrollPane1,new GridBagConstraints(0, 5, 4, 1, 0.0, 2.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(5, 5, 5, 5), 0, 0));
    jPanel1.add(B_close,new GridBagConstraints(3, 1, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(10, 10, 10, 10), 0, 0));
    jPanel1.add(B_search,new GridBagConstraints(3, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(10, 10, 10, 10), 0, 0));
    jScrollPane1.getViewport().add(display, null);
    B_group.add(R_and);
    B_group.add(R_or);
    System.out.println("Hello");
        setSize(500,500);
        setVisible(true);

        chk_uid= false;
        chk_email = false;
        chk_fname = false;
        chk_lname = false;

        ting = Session;


  }
  //Overridden so we can exit when window is closed
  protected void processWindowEvent(WindowEvent e) {
    super.processWindowEvent(e);
    if (e.getID() == WindowEvent.WINDOW_CLOSING) {
     // System.exit(0);
         e.getWindow().dispose();
    }
  }

  void T_userID_keyPressed(KeyEvent e) {
  //	chk_uid =true;
  }

  void T_email_keyPressed(KeyEvent e) {
  //	chk_email = true;
  }

  void T_fname_keyPressed(KeyEvent e) {
  //	chk_fname = true;
  }

  void T_lname_keyPressed(KeyEvent e) {
  //	chk_lname = true;
  }

  void B_search_actionPerformed(ActionEvent e) {
          if(Get_Data())
          {
                  System.out.println("Start Processing");
                  Check_Data();
                  Fill(chk_uid,chk_email,chk_fname,chk_lname);
                  Query();
          }
          else
          {
                  System.out.println("Please enter at least one input");
          }
  }

  void B_close_actionPerformed(ActionEvent e) {
         this.dispose();
  }

  void Query()
  {
        try
        {
                ting.ssl_write(buffer_write);
                //sendData("write ok");
                System.out.println("Write OK");
        }
        catch(IOException e)
        {
                JOptionPane.showMessageDialog(null,"Error write",
                                        "ERROR",JOptionPane.ERROR_MESSAGE);
        }

        try
        {
                buffer_read = ting.ssl_read(input);
            do
            {
                if((input[0] == (byte)0x08) && (input[5] == (byte)0x82) /*&& (input[6] == 0x11)*/ )
                {
                        System.out.println(buffer_read);
                        show_result( buffer_read);
                }
                else
                {
                        JOptionPane.showMessageDialog(null,
                        "Error :" + buffer_read, "ERROR INPUT",
                        JOptionPane.ERROR_MESSAGE);

                        System.out.println("Error message no. :" + buffer_read);
                }
            }
            while(input[6] == (byte)0x01);
        }
        catch(IOException e)
        {
                JOptionPane.showMessageDialog(null,"Error Read",
                        "ERROR",JOptionPane.ERROR_MESSAGE);
        }

  }

  private void show_result(String buffer)
  {
          String store="";
          String profile[] = new String[3];

          int run =0;
          int start = 0;
          int last =0;
          //for(start=0 ;start<512 ; start++) temp[start] ='\0';
          for(int j = 0 ; j < 3 ; j++) profile[j] ="";
          boolean x = true;
          int i = 0;
          String user_id ;
          String email ;
          char status ;
          String state;
          //user_contact.clear();

                          while(x)
                          {
                                  if((buffer.charAt(run) == '$') && (buffer.charAt(run+1) == '$'))
                                  {
                                          user_id = profile[0].toString();
                                          email = profile[1].toString();
                                          status = profile[2].charAt(0);
                                          switch(status)
                                          {
                                            case 'O' : state = "Online"; break;
                                            default  : state = "Offline"; break;

                                          }
                                          store += user_id +"\t" + email+"\t"+ state + "\n";
                                          x= false;
                                  }
                                  else if((buffer.charAt(run) == '$') && (buffer.charAt(run+1) != 0))
                                  {
                                          i=0;

                                          user_id =profile[0].toString();
                                          email = profile[1].toString();
                                          status = profile[2].charAt(0);
                                          switch(status)
                                          {
                                            case 'O':state = "Online";break;
                                            default:state = "Offline";break;
                                          }

                                          store += user_id +"\t" + email+"\t"+ state + "\n";
                                          for(int j = 0 ; j < 3 ; j++) profile[j] ="";
                                          run++;
                                          last=run;
                                  }
                                  else if((buffer.charAt(run) == '$') && (buffer.charAt(run+1) == 0))
                                  {
                                          store = "No Data Returned !";
                                          x= false;

                                  }
                                  else
                                  {
                                          if (buffer.charAt(run) == '#')
                                          {
                                                  i++;
                                          }
                                          else
                                          {
                                                  profile[i] += buffer.charAt(run);
                                          }

                                          run++;
                                  }
                          }
                          display.setText(store);

  }

  void Fill(boolean input1,boolean input2,boolean input3,boolean input4 )
  {

        if(R_and.isSelected()) temp ="A#";
        else temp ="O#";
          if(input1) temp += user_id;
          else temp += "_";
          temp += "#";
        if(input2)temp += email;
          else temp += "_";
        temp += "#";
        if(input3)temp += f_name;
          else temp += "_";
        temp += "#";
        if(input4)temp += l_name;
          else temp += "_";
        temp += "$";

        System.out.println("Buffer :" + temp);

        header[0] = (byte)0x08;
        header[1] = (byte)0x00;
        header[2] = (byte)0x01;
        header[3] = (byte)0x00;
        header[4] = (byte)0x07;
        header[5] = (byte)0x81;
        header[6] = (byte)0x11;

        for(int i = 0 ; i < 7 ; i++) buffer_write[i] =header[i];

        for(int i = 0 ; i < temp.length() ; i++)
                buffer_write[i+7] = (byte)temp.charAt(i);

  }

  void Check_Data()
  {
        chk_uid = Check_userID();
        chk_email = Check_email();
        chk_fname = Check_name(f_name);
        chk_lname = Check_name(l_name);
  }
  boolean Get_Data()
  {
        user_id = T_userID.getText();
        email = T_email.getText();
        f_name = T_fname.getText();
        l_name = T_lname.getText();

        if(user_id.length()== 0 && email.length()==0 &&
           f_name.length()==0 && l_name.length()==0 )
                return false;
        else return true;
  }
  boolean Check_userID()
  {
          int id;
          if(user_id.length()>0)
          {
                  try
                {
                          id = Integer.parseInt(user_id);
                          if(id > 0 && id < 2147483647)
                                  return true;
                          else return false;
                  }
                  catch (Exception e)
                {
                          System.out.println("Invalid UserID");
                          return false;
                  }
          }
          else return false;
  }
  boolean Check_email()
  {
          if (email.length()> 0 && email.length()<65)
          {
                  for(int i= 0 ; i< email.length();i++)
                  {
                          if((email.charAt(i)< '-' || email.charAt(i)>122 )|| ( email.charAt(i)== '/' )
                                  ||(email.charAt(i)> '9' && email.charAt(i)< '@')
                                ||(email.charAt(i)> 'Z' && email.charAt(i)< 'a'))
                                {
                                          System.out.println("Email contains invalid character");
                                          return false;
                                  }
                  }
                  return true;
          }
          else return false;
  }
  boolean Check_name(String name)
  {
          if(name.length()>0 && name.length()<65)
          {
                  for(int i = 0 ; i< name.length() ;i++)
                  {
                          if(name.charAt(i)< 'A' || name.charAt(i)>'z')
                          {
                                  System.out.println("Invalid character");
                                  return false;
                          }
                  }
                  return true;
          }
          else return false;
  }

}

class FindPanel_T_userID_keyAdapter extends java.awt.event.KeyAdapter {
  FindPanel adaptee;

  FindPanel_T_userID_keyAdapter(FindPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void keyPressed(KeyEvent e) {
    adaptee.T_userID_keyPressed(e);
  }
}

class FindPanel_T_email_keyAdapter extends java.awt.event.KeyAdapter {
  FindPanel adaptee;

  FindPanel_T_email_keyAdapter(FindPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void keyPressed(KeyEvent e) {
    adaptee.T_email_keyPressed(e);
  }
}

class FindPanel_T_fname_keyAdapter extends java.awt.event.KeyAdapter {
  FindPanel adaptee;

  FindPanel_T_fname_keyAdapter(FindPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void keyPressed(KeyEvent e) {
    adaptee.T_fname_keyPressed(e);
  }
}

class FindPanel_T_lname_keyAdapter extends java.awt.event.KeyAdapter {
  FindPanel adaptee;

  FindPanel_T_lname_keyAdapter(FindPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void keyPressed(KeyEvent e) {
    adaptee.T_lname_keyPressed(e);
  }
}

class FindPanel_B_search_actionAdapter implements java.awt.event.ActionListener {
  FindPanel adaptee;

  FindPanel_B_search_actionAdapter(FindPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.B_search_actionPerformed(e);
  }
}

class FindPanel_B_close_actionAdapter implements java.awt.event.ActionListener {
  FindPanel adaptee;

  FindPanel_B_close_actionAdapter(FindPanel adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.B_close_actionPerformed(e);
  }
}
