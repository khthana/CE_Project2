//******************************************************************************
//This class is very important to be served for manipating both
//  instant messaging and file transfering.
//It is a panel for chatting which is one-to-one communication
//******************************************************************************
import javax.swing.*;
import java.awt.*;
import javax.swing.border.*;
import java.awt.event.*;
import java.io.*;
import java.net.*;
//import javax.net.ssl.*;
import java.net.DatagramPacket;
import java.net.DatagramSocket;

public class ChatPanel extends JFrame implements Runnable {
  Border border1;
  JPanel jPanel1 = new JPanel();
  GridBagLayout gridBagLayout1 = new GridBagLayout();
  Border border2;
  JButton B_send = new JButton();
  JLabel jLabel1 = new JLabel();
  JScrollPane jScrollPane1 = new JScrollPane();
  JScrollPane jScrollPane2 = new JScrollPane();
  JTextArea TA_board = new JTextArea();
  JTextArea TA_type = new JTextArea();
  JTextField TF_info = new JTextField();
  JFileChooser F_file = new JFileChooser();
  String connectTo;
  DataInputStream din;
  DataOutputStream dout;
  JButton B_recieve = new JButton();
  JButton B_leave = new JButton();

  //----------------------------------------------------------------------------
  Socket socket;
  String userID;
  Client connect;
  private InputStream inputstream;
  private OutputStream outputstream;
  private InputStreamReader inputread;
  private OutputStreamWriter outputwrite;
  JButton B_file = new JButton();
  File file;
  String file_sent_name;
  String file_got_name;
  String certname;
  String passphrase;
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  //There are 2 ChatPanel constructors
  // 1st(4 arguments) is called when connecting to destination by will.
  // 2nd(5 arguments) is called when recieving connection from our contacts
  //----------------------------------------------------------------------------

  public ChatPanel(String host, int port,String Cert , String Passwd) {
    enableEvents(AWTEvent.WINDOW_EVENT_MASK);
    System.out.println("First Constructor");
    connect = new Client(host,port,Cert,Passwd);
    connectTo = host;
    certname = Cert;
    passphrase = Passwd;
    userID = connect.getUserIDConnected();
    inputstream = connect.getInputStream();
    outputstream = connect.getOutputStream();
    din = new DataInputStream(inputstream);
    dout = new DataOutputStream(outputstream);

    socket = connect.getSocket();

    try
    {
      jbInit();
      TF_info.setText("I'm chating with :"+ userID+"\t"+ connectTo);
      inputread = new InputStreamReader(inputstream,"UTF-8");
      outputwrite= new OutputStreamWriter(outputstream);


    }
    catch(Exception e) {
      e.printStackTrace();
    }

    new Thread(this).start();

  }
  public ChatPanel(String cert,String passwd,String destination ,Socket socket_connect,String user_ID) {
  enableEvents(AWTEvent.WINDOW_EVENT_MASK);
    try
    {
      connectTo = destination;
      socket = socket_connect;
      userID = user_ID;
      certname = cert;
      passphrase = passwd;
      //InputStream in = socket_connect.getInputStream();
      //OutputStream out = socket_connect.getOutputStream();
      inputstream = socket_connect.getInputStream();
      outputstream = socket_connect.getOutputStream();

      din = new DataInputStream(inputstream);
      dout = new DataOutputStream(outputstream);
      inputread = new InputStreamReader(inputstream,"UTF-8");
      outputwrite= new OutputStreamWriter(outputstream);

      jbInit();
      TF_info.setText("I'm chating with :"+ userID+"\t"+ destination);
      new Thread(this).start();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }
  private void jbInit() throws Exception {
    border1 = BorderFactory.createEmptyBorder(3,3,3,3);
    border2 = BorderFactory.createEmptyBorder(3,3,3,3);
    this.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
    this.setTitle("");
    jPanel1.setLayout(gridBagLayout1);
    jPanel1.setBorder(border2);
    jPanel1.setDebugGraphicsOptions(0);
    B_send.setFont(new java.awt.Font("Dialog", 1, 16));
    B_send.setText("Send");
    B_send.addActionListener(new ChatPanel_B_send_actionAdapter(this));
    jLabel1.setText("IsagQ Option is comming soon....");
    TA_board.setPreferredSize(new Dimension(70, 17));
    TA_board.setText("");
    TA_board.setFont(new Font( "Tahoma", Font.PLAIN, 14 ));
    TA_type.setMaximumSize(new Dimension(2147483647, 2147483647));
    TA_type.setText("");
    TA_type.setFont(new Font( "Tahoma", Font.PLAIN, 14 ));
    TF_info.setEditable(false);
    TF_info.setText("");
    jScrollPane2.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
    jScrollPane2.setMaximumSize(new Dimension(23, 23));
    B_file.setMargin(new Insets(2, 2, 2, 2));
    B_file.setText("Send File");
    B_file.addActionListener(new ChatPanel_B_file_actionAdapter(this));
    B_recieve.setEnabled(false);
    B_recieve.setMargin(new Insets(2, 2, 2, 2));
    B_recieve.setText("Recieve");
    B_recieve.addActionListener(new ChatPanel_B_recieve_actionAdapter(this));
    B_leave.setEnabled(false);
    B_leave.setMargin(new Insets(2, 2, 2, 2));
    B_leave.setText("Leave");
    B_leave.addActionListener(new ChatPanel_B_leave_actionAdapter(this));
    this.getContentPane().add(jPanel1, BorderLayout.CENTER);
    jPanel1.add(B_send,                 new GridBagConstraints(2, 6, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(5, 5, 5, 5), 0, 0));
    jPanel1.add(jLabel1,              new GridBagConstraints(0, 5, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(2, 5, 2, 5), 0, 0));
    jPanel1.add(jScrollPane1,                  new GridBagConstraints(0, 2, 1, 3, 1.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(0, 5, 5, 5), 112, 116));
    jScrollPane1.getViewport().add(TA_board, null);
    jPanel1.add(jScrollPane2,           new GridBagConstraints(0, 6, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(5, 5, 5, 5), 0, 50));
    jScrollPane2.getViewport().add(TA_type, null);
    jPanel1.add(TF_info,         new GridBagConstraints(0, 0, 3, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(5, 5, 5, 5), 0, 0));
    jPanel1.add(B_file,           new GridBagConstraints(2, 2, 1, 1, 0.0, 0.0
            ,GridBagConstraints.NORTH, GridBagConstraints.HORIZONTAL, new Insets(5, 5, 0, 5), 0, 0));
    jPanel1.add(B_recieve,           new GridBagConstraints(2, 3, 1, 1, 0.0, 0.0
            ,GridBagConstraints.NORTH, GridBagConstraints.HORIZONTAL, new Insets(5, 5, 0, 5), 23, 0));
    jPanel1.add(B_leave,  new GridBagConstraints(2, 4, 1, 1, 0.0, 0.0
            ,GridBagConstraints.NORTH, GridBagConstraints.HORIZONTAL, new Insets(5, 5, 5, 5), 0, 0));
    setSize(400,400);
    Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();

    Dimension frameSize = this.getSize();
    if (frameSize.height > screenSize.height) {
      frameSize.height = screenSize.height;
    }
    if (frameSize.width > screenSize.width) {
      frameSize.width = screenSize.width;
    }
    this.setLocation( (screenSize.width - frameSize.width) / 2,
                      (screenSize.height - frameSize.height) / 2);

    setVisible(true);

  }

  //----------------------------------------------------------------------------
  //Button for sending text
  //This is function to send text.
  //----------------------------------------------------------------------------

  void B_send_actionPerformed(ActionEvent e) {
    byte[] header = new byte[7];

    if (TA_type.getText().length() != 0)
    {
      String temp = get_Text();
      //try {

      header[0] = (byte) 0x61;
      header[1] = (byte) 0x61;
      header[2] = (byte) 0x00;
      header[3] = (byte) 0x01;
      header[4] = (byte) 0x02;
      header[5] = (byte) 0x03;
      header[6] = (byte) 0x04;

      String b = new String(header);

      //System.out.println("b length " + b.length());
     // for(int i = 0 ; i < 7 ; i++) packet[i] =header[i];
     // for(int i = 0 ; i < temp.length(); i++)
      //    packet[i+7] = (byte)temp.charAt(i);
      String c = b + temp;
      String post = TA_board.getText();

      if(/*!ssl_write(packet) */!ssl_write(c))
      {
        //System.out.println("Can't send text.");
        post += "\n I say :\n" + "---Can't send text---";
      }
      else
      {
        post += "\n I say :\n" + temp;
      }

      set_Text(post);
      TA_type.setText("");
     // }
     // catch (IOException excep) {
      //  System.out.println("Error Write");
      //}
    }
    else
    {
      System.out.println("NO Input Data");
    }

  }

  protected void processWindowEvent(WindowEvent e) {
    super.processWindowEvent(e);
    if (e.getID() == WindowEvent.WINDOW_CLOSING)
    {
      System.out.println("Exit");
      Disconnect();
      Thread.currentThread().destroy();
      e.getWindow().dispose();
    }
  }

  //----------------------------------------------------------------------------
  // Disconnect communication when shutting down the chat panel
  //----------------------------------------------------------------------------

  public void Disconnect() {
    try
    {
      socket.close();
      System.out.println("Clean Socket");
    }
    catch (IOException e)
    {
      System.out.println("Error Disconnection");
      // this.dispose();
    }

  }

  public void run() {
    byte[] header = new byte[7];

      while (true)
      {
        String x = ssl_read(header);
        if(x.compareTo("Can't read") == 0) break;
        System.out.println("Header[0] = "+(byte)header[0]);
        switch((byte)header[0]){
          case 0x61 : print_Text(x);
                      break;
          case 0x62 : System.out.println("Sendfile Request");
                      get_File(x);
                      B_file.setEnabled(false);
                      B_recieve.setEnabled(true);
                      B_leave.setEnabled(true);
                      break;
          case 0x63 : System.out.println("Accept to get file");
                      SendFile(x);
                      B_file.setEnabled(false);
                      B_recieve.setEnabled(false);
                      B_leave.setEnabled(false);
                      break;
          case 0x64 : System.out.println("Cancel file");
                      print_Text("File "+file_sent_name+" is canceled");
                      B_file.setEnabled(true);
                      B_recieve.setEnabled(false);
                      B_leave.setEnabled(false);

                      break;
          case 0x65 : System.out.println("Recieving Completed");
                      print_Text("Sending "+file_sent_name+" is complete");
                      B_file.setEnabled(true);
                      B_recieve.setEnabled(false);
                      B_leave.setEnabled(false);
                      break;
          case 0x66 : System.out.println("Recieving Failed");
                      print_Text("Sending "+file_sent_name+" is failed");
                      B_file.setEnabled(true);
                      B_recieve.setEnabled(false);
                      B_leave.setEnabled(false);
                      break;

          default   : System.out.println("Default");
                      break;
        }
        //String x = din.readUTF();
      }
      this.Disconnect();
      this.dispose();

  }

 //-----------------------------------------------------------------------------
 // get_Text() funtion is for getting text from user input.
 //-----------------------------------------------------------------------------

 public String get_Text() {
   return TA_type.getText();
 }

 //-----------------------------------------------------------------------------
 // set_Text() funtion is for setting text to Area of communication taken place
 //-----------------------------------------------------------------------------

 public void set_Text(String input_text) {
   TA_board.setText(input_text);
 }

 //-----------------------------------------------------------------------------
 // print_Text() funtion is callsed before set_Text().
 // It is provided for changing input text before setting it on Area.
 //-----------------------------------------------------------------------------

 public void print_Text(String text) {
   String temp = TA_board.getText();
   temp += "\n"+userID+" :says\n" + text;
   set_Text(temp);

 }

 //----------------------------------------------------------------------------
 // ssl_write() and ssl_read() is much alike to ssl_write and ssl_read in
 // file SSLConnection.java but there is a little bit difference of method
 // and argument passed in it by using writeUTF() and readUTF() method.
 //----------------------------------------------------------------------------

 public boolean ssl_write( /*byte[] input */String input) {
   try {
     //System.out.println("Try writing");
     dout.writeUTF(input);
     dout.flush();

     return true;
   }
   catch (IOException e) {
     System.out.println("Can't write");
     return false;
   }
 }

 public String ssl_read(byte[] head) {
   byte[] temp = new byte[512];
   byte[] header = new byte[7];
   int len;
   String msg;

   try {
     String read = din.readUTF();
     for (int i = 0; i < 7; i++) {
       //System.out.println("testting " +(byte)read.charAt(i));
       head[i] = (byte) read.charAt(i);
     }
     msg = read.substring(7, read.length());
     //msg = new String(xx.getBytes("UTF-8"),"UTF-8");
     System.out.println("Try reading" + msg);
     return msg;

   }
   catch (IOException e) {
     System.out.println("Can't read");
     try {
       socket.close();
     }
     catch (IOException x) {
       System.out.println("Can't Close socket");
     }
     this.dispose();
     return "Can't read";
   }

 }

 private int checkDataLength(byte high, byte low) {
   int ms = (high & 0xff);
   int ls = (low & 0xff);
   if (ms <= 0)
     return ls;
   else if (ms > 2)
     return (512 - 7);
   else
     return ms * ls;
 }

 //----------------------------------------------------------------------------
 // get_File() function
 // To extract file name from recieved packet
 //----------------------------------------------------------------------------

 public void get_File(String temp) {
   String file_name;
   String file_size;
   for (int i = 0; i < temp.length(); i++) {
     if (temp.charAt(i) == '#') {
       file_name = temp.substring(0, i);
       file_got_name = file_name;
       file_size = temp.substring(i + 1, temp.length());
       print_Text("File name :" + file_name + " Size :" + file_size);
       break;
     }
   }
 }

 //----------------------------------------------------------------------------
 // SendFile() function
 // It is called by sender.
 //----------------------------------------------------------------------------

 public void SendFile(String ip_connect) {
   int portTo;
   try {
     portTo = Integer.parseInt(ip_connect);
     System.out.println("Sending to port :" + portTo);
   }
   catch (Exception e) {
     portTo = 16004;
     System.out.println("Using default port :" + portTo);
   }
   Sender sender = new Sender(certname, passphrase, file, connectTo, portTo);
   //sender.
   print_Text("Sending file :" + file_sent_name);
 }

 public String MakeHeader(byte[] header, byte value) {
   header[0] = (byte) value;
   header[1] = (byte) value;
   header[2] = (byte) 0x00;
   header[3] = (byte) 0x01;
   header[4] = (byte) 0x02;
   header[5] = (byte) 0x03;
   header[6] = (byte) 0x04;
   String head = new String(header);
   return head;
 }

 //----------------------------------------------------------------------------
 // SendFailedFile() function
 // To acknowledge both sender and reciever when sending file is failed.
 //----------------------------------------------------------------------------

 public void SendFailedFile() {
   byte[] header = new byte[7];

   String head = MakeHeader(header, (byte) 0x66);

   try {
     ssl_write(head);
     print_Text("Recieving " + file_got_name + " Failed!");
     B_file.setEnabled(true);
     B_recieve.setEnabled(false);
     B_leave.setEnabled(false);

   }
   catch (Exception e) {
     System.out.println("Error sending completed recieving");
   }

 }

 //----------------------------------------------------------------------------
 // SendCompleteFile() function
 // To acknowledge both sender and reciever when sending file is complete.
 //----------------------------------------------------------------------------

 public void SendCompleteFile() {
   byte[] header = new byte[7];

   String head = MakeHeader(header, (byte) 0x65);

   try {
     ssl_write(head);
     print_Text("Recieving " + file_got_name + " Completed!");
     B_file.setEnabled(true);
     B_recieve.setEnabled(false);
     B_leave.setEnabled(false);

   }
   catch (Exception e) {
     System.out.println("Error sending completed recieving");
   }

 }

 //----------------------------------------------------------------------------
 // SendCancleFile() function
 // To acknowledge sender when reciever doesn't want to recieve it.
 //----------------------------------------------------------------------------

 public void SendCancleFile() {
   byte[] header = new byte[7];

   String head = MakeHeader(header, (byte) 0x64);

   try {
     ssl_write(head);
     print_Text("Cancle file " + file_got_name);
   }
   catch (Exception e) {
     System.out.println("Error sending cancle file");
   }

 }

 //----------------------------------------------------------------------------
 // SendAccetpFile() function
 // To acknowledge sender to start transfering
 //----------------------------------------------------------------------------

 public void SendAcceptFile(int port) {
   byte[] header = new byte[7];

   String head = MakeHeader(header, (byte) 0x63);
   try {
     String port_open = Integer.toString(port);
     String temp = head + port_open;
     //System.out.println("********************" + temp);
     ssl_write(temp);
     print_Text("Accept file " + file_got_name);
   }
   catch (Exception e) {
     System.out.println("Error sending file");
   }

 }

 //----------------------------------------------------------------------------
 // SendFileRequest() function
 // To acknowledge reciever when sender wants to transfer file.
 //----------------------------------------------------------------------------

 public void SendFileRequest(File filename) {
   // Request to send file
   byte[] header = new byte[7];

   String head = MakeHeader(header, (byte) 0x62);

   String file_name = filename.getName();
   long size = filename.length();
   try {
     String file_size = Long.toString(size);
     String packet = head + file_name + "#" + file_size;
     ssl_write(packet);
     print_Text("Requesting to send " + file_name);
   }
   catch (Exception e) {
     System.out.println("Error sending file");
   }

 }

 //----------------------------------------------------------------------------
 // SelectPort() function
 // Check used ports and random to get a port.
 //----------------------------------------------------------------------------

 private int SelectPort() {
   int range = 998;
   int value = 16004;
   int start = 16002;
   boolean used = false;

   while (!used) {

     value = start + (int) (Math.random() * range);
     System.out.println("Value = " + value);
     try {
       ServerSocket server = new ServerSocket(value);
       System.out.println("Random Port : " + value);
       server.close();
       used = true;

     }
     catch (IOException e) {
       System.out.println("Port : " + value + " is used");
       System.out.println("Trying to random again");

     }
   }
   return value;
 }

 //----------------------------------------------------------------------------
 // This function is called when sender clicks send_file button.
 // Pop up windows for easy selecting file to be transfer.
 //----------------------------------------------------------------------------

 void B_file_actionPerformed(ActionEvent e) {
   int value = F_file.showOpenDialog(this);
   if (value == JFileChooser.APPROVE_OPTION) {
     file = F_file.getSelectedFile();
     file_sent_name = file.getName();
     System.out.println("--->" + file.getAbsoluteFile());
     SendFileRequest(file);
     B_file.setEnabled(false);
     B_recieve.setEnabled(false);
     B_leave.setEnabled(false);
   }
   else
     System.out.println("NO");
 }

 //----------------------------------------------------------------------------
 // This function is called when recieving the sending file request.
 // Reciving button will be activated when sending file request is coming.
 //----------------------------------------------------------------------------

 void B_recieve_actionPerformed(ActionEvent e) {
   B_file.setEnabled(false);
   B_recieve.setEnabled(false);
   B_leave.setEnabled(false);

   Reciever reciever = new Reciever(certname, passphrase, file_got_name,
                                    connectTo, this, SelectPort());
   SendAcceptFile(reciever.get_Port());

 }

 //----------------------------------------------------------------------------
 // This function is called when sender clicks cancle button.
 // It is called before SencCancleFile()
 //----------------------------------------------------------------------------

 void B_leave_actionPerformed(ActionEvent e) {
   B_file.setEnabled(true);
   B_recieve.setEnabled(false);
   B_leave.setEnabled(false);
   SendCancleFile();
 }

}

class ChatPanel_B_send_actionAdapter
   implements java.awt.event.ActionListener {
 ChatPanel adaptee;

 ChatPanel_B_send_actionAdapter(ChatPanel adaptee) {
   this.adaptee = adaptee;
 }

 public void actionPerformed(ActionEvent e) {
   adaptee.B_send_actionPerformed(e);
 }
}

class ChatPanel_B_file_actionAdapter
   implements java.awt.event.ActionListener {
 ChatPanel adaptee;

 ChatPanel_B_file_actionAdapter(ChatPanel adaptee) {
   this.adaptee = adaptee;
 }

 public void actionPerformed(ActionEvent e) {
   adaptee.B_file_actionPerformed(e);
 }
}

class ChatPanel_B_recieve_actionAdapter
   implements java.awt.event.ActionListener {
 ChatPanel adaptee;

 ChatPanel_B_recieve_actionAdapter(ChatPanel adaptee) {
   this.adaptee = adaptee;
 }

 public void actionPerformed(ActionEvent e) {
   adaptee.B_recieve_actionPerformed(e);
 }
}

class ChatPanel_B_leave_actionAdapter
   implements java.awt.event.ActionListener {
 ChatPanel adaptee;

 ChatPanel_B_leave_actionAdapter(ChatPanel adaptee) {
   this.adaptee = adaptee;
 }

 public void actionPerformed(ActionEvent e) {
   adaptee.B_leave_actionPerformed(e);
 }
}