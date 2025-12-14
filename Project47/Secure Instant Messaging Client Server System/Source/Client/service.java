import java.io.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.JOptionPane.*;


class  service extends JFrame
{
  SSLConnection session;
  contact user_contact;
  contact user_auth;
  FindPanel find_ui;
  private String client_id;
  private String client_nick;
  private String client_status;
  private String client_email;
  private String client_ip;

  public service(SSLConnection ssl_session, String ip)
  {
    session = ssl_session;
    user_contact = new contact();
    user_auth = new contact();
    Login(ip);
  }

  //****************************************************************************
  // Login Function
  // Require one argument that is IP address to send to Server
  //****************************************************************************

  public String Login(String ip)
  {
    byte buffer_write[] = new byte[512];
    byte[] input = new byte[80];
    byte header[] = new byte[7];

    String buffer_read = "";
    String temp_ip = ip;
    temp_ip += "$";

    //--------------------------------------------------------------------------
    //  Initial Login Header and Put in buffer_write
    //  TOS = 0x02 CMD = 0x21
    //--------------------------------------------------------------------------

    header[0] = (byte) 0x02;
    header[1] = (byte) 0x00;
    header[2] = (byte) 0x01;
    header[3] = (byte) 0x00;
    header[4] = (byte) 0x07;
    header[5] = (byte) 0x21;
    header[6] = (byte) 0x11;

    for (int i = 0; i < 7; i++)
      buffer_write[i] = header[i];

    //--------------------------------------------------------------------------
    //  Put IP address into buffer_write
    //--------------------------------------------------------------------------

    for (int i = 0; i < temp_ip.length(); i++)
      buffer_write[i + 7] = (byte) temp_ip.charAt(i);

    //--------------------------------------------------------------------------
    //  Send buffer_write using SSL
    //--------------------------------------------------------------------------

    try
    {
      session.ssl_write(buffer_write);
    }
    catch (IOException e)
    {
      JOptionPane.showMessageDialog(null, "Error write",
                                    "ERROR", JOptionPane.ERROR_MESSAGE);
    }

    //--------------------------------------------------------------------------
    //  Wait to read the result back from Server
    //  The result returned consists of 3 user's informations
    //   1. User ID
    //   2. Email
    //   3. Nickname
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    //  Read into buffer_read
    //  The informations are in buffer_read while header is in input
    //--------------------------------------------------------------------------

    try
    {
      buffer_read = session.ssl_read(input);

      //------------------------------------------------------------------------
      //  Check the correctness of input(header)
      //------------------------------------------------------------------------

      if ( (input[0] == (byte) 0x02) && (input[5] == (byte) 0x22) /* && (input[6] == (byte)0x11)*/)
      {
        //System.out.println(buffer_read);

        //----------------------------------------------------------------------
        //  If it correct then extract information
        //----------------------------------------------------------------------

        int j;
        int k;

        //----------------------------------------------------------------------
        //  Get User ID -> client_id
        //----------------------------------------------------------------------

        for (j = 0; j < buffer_read.length(); j++)
          if (buffer_read.charAt(j) == '#')
            break;

        client_id = buffer_read.substring(0, j);

        //----------------------------------------------------------------------
        //  Get Email -> client_email
        //----------------------------------------------------------------------

        for (k = j + 1; k < buffer_read.length(); k++)
          if (buffer_read.charAt(k) == '#')
            break;

        client_email = buffer_read.substring(j + 1, k);

        //----------------------------------------------------------------------
        //  Get Nickname -> client_nick
        //----------------------------------------------------------------------

        client_nick = buffer_read.substring(k + 1, buffer_read.length() - 1);

        //----------------------------------------------------------------------
        //  Set current Status and IP address -> client_status , client_ip
        //----------------------------------------------------------------------

        client_status = "Online";
        client_ip = ip;
        System.out.println("ID :" + client_id + "\n" +
                           "email :" + client_email + "\n" +
                           "nick :" + client_nick + "\n" +
                           "status :" + client_status + "\n" +
                           "IP :" + client_ip + "\n");
      }
      else
      {
        //----------------------------------------------------------------------
        //  An Error occured while service was processing
        //----------------------------------------------------------------------

        JOptionPane.showMessageDialog(null,
                                      "Error :" + buffer_read, "ERROR INPUT",
                                      JOptionPane.ERROR_MESSAGE);

        System.out.println("Error message no. :" + buffer_read);
      }
      //buffer_read = "";

    }
    catch (IOException e)
    {
      JOptionPane.showMessageDialog(null, "Error Read",
                                    "ERROR", JOptionPane.ERROR_MESSAGE);
    }

    return "Login";

  }

  public contact get_contact_link()
  {
    return user_contact;
  }

  public String get_Nickname()
  {
    return client_nick;
  }

  public String get_ID()
  {
    return client_id;
  }

  public String get_Status()
  {
    return client_status;
  }

  //****************************************************************************
  // Logout Function
  //****************************************************************************

  public String Logout()
  {
    byte buffer_write[] = new byte[512];
    String buffer_read = "";
    String msg = "";
    byte[] input = new byte[80];
    byte header[] = new byte[7];

    //--------------------------------------------------------------------------
    //  Initial Logout Header and Put in buffer_write
    //  TOS = 0x07 CMD = 0x71
    //--------------------------------------------------------------------------

    header[0] = (byte) 0x07;
    header[1] = (byte) 0x00;
    header[2] = (byte) 0x01;
    header[3] = (byte) 0x00;
    header[4] = (byte) 0x07;
    header[5] = (byte) 0x71;
    header[6] = (byte) 0x11;

    for (int i = 0; i < 7; i++)
      buffer_write[i] = header[i];

    //--------------------------------------------------------------------------
    //  Send buffer_write using SSL
    //--------------------------------------------------------------------------

    try
    {
      session.ssl_write(buffer_write);
      //System.out.println("Write OK");
    }
    catch (IOException e)
    {
      JOptionPane.showMessageDialog(null, "Error write",
                                    "ERROR", JOptionPane.ERROR_MESSAGE);
    }

    //--------------------------------------------------------------------------
    //  Wait and read into buffer_read
    //--------------------------------------------------------------------------

    try
    {
      buffer_read = session.ssl_read(input);

      //------------------------------------------------------------------------
      //  Check the correctness of input(header)
      //------------------------------------------------------------------------

      if ( (input[0] == (byte) 0x07) && (input[5] == (byte) 0x72) /* && (input[6] == (byte)0x11)*/)
      {
        //----------------------------------------------------------------------
        //  Complete logging out
        //----------------------------------------------------------------------

        System.out.println(buffer_read);
      }
      else
      {
        //----------------------------------------------------------------------
        //  Incomplete logging out
        //----------------------------------------------------------------------

        JOptionPane.showMessageDialog(null,
                                      "Error :" + buffer_read, "ERROR INPUT",
                                      JOptionPane.ERROR_MESSAGE);
        System.out.println("Error message no. :" + buffer_read);
      }

    }
    catch (IOException e)
    {
      JOptionPane.showMessageDialog(null, "Error Read",
                                    "ERROR", JOptionPane.ERROR_MESSAGE);
    }

    return "Logout";

  }

  //****************************************************************************
  // Add Contact List Function
  //****************************************************************************

  public boolean AddContact()
  {
    String userID = "";
    //String buffer_write = "";
    byte buffer_write[] = new byte[512];
    String buffer_read = "";
    String msg = "";
    byte[] input = new byte[80];
    byte header[] = new byte[7];
    boolean valid_user_id = false;
    int ID = 0;

    //--------------------------------------------------------------------------
    //  Get User ID to add and put in userID
    //--------------------------------------------------------------------------

    userID = JOptionPane.showInputDialog("Enter UserID :");

    //--------------------------------------------------------------------------
    //  Initial Add Contact List Header and Put in buffer_write
    //  TOS = 0x03 CMD = 0x31
    //--------------------------------------------------------------------------

    try
    {
      //------------------------------------------------------------------------
      //  Transform userID string to Integer to check the correctness of input
      //------------------------------------------------------------------------

      ID = Integer.parseInt(userID);
      userID += "$";
      valid_user_id = true;
      header[0] = (byte) 0x03;
      header[1] = (byte) 0x00;
      header[2] = (byte) 0x01;
      header[3] = (byte) 0x00;
      header[4] = (byte) 0x07;
      header[5] = (byte) 0x31;
      header[6] = (byte) 0x11;

      for (int i = 0; i < 7; i++)
        buffer_write[i] = header[i];

      //------------------------------------------------------------------------
      // Put userID into buffer_write
      //------------------------------------------------------------------------

      for (int i = 0; i < userID.length(); i++)
        buffer_write[i + 7] = (byte) userID.charAt(i);

    }
    catch (Exception e)
    {
      valid_user_id = false;
      JOptionPane.showMessageDialog(null, "User ID must be only number!",
                                    "ERROR INPUT", JOptionPane.ERROR_MESSAGE);
      //e.printStackTrace();
      return false;
    }

    //--------------------------------------------------------------------------
    //  If User ID input is valid then it will be sent
    //--------------------------------------------------------------------------

    if (valid_user_id)
    {
      System.out.println(buffer_write);

      //------------------------------------------------------------------------
      //  Send buffer_write
      //------------------------------------------------------------------------

      try
      {
        session.ssl_write(buffer_write);
        //System.out.println("Write OK");
      }
      catch (IOException e)
      {
        JOptionPane.showMessageDialog(null, "Error write",
                                      "ERROR", JOptionPane.ERROR_MESSAGE);
        return false;

      }

      //------------------------------------------------------------------------
      //  Wait and read input buffer_read
      //------------------------------------------------------------------------

      try
      {
        buffer_read = session.ssl_read(input);
        //System.out.println(buffer_read);

        //----------------------------------------------------------------------
        //  Check the correctness of input(head) returned
        //----------------------------------------------------------------------

        if ( (input[0] == (byte) 0x03) && (input[5] == (byte) 0x33) /* && (input[6] == (byte)0x11)*/)
        {
          //System.out.println(buffer_read);
          return true;

        }
        else
        {
          //--------------------------------------------------------------------
          //  An error occured when service was processing
          //--------------------------------------------------------------------

          JOptionPane.showMessageDialog(null,
                                        "Error :" + buffer_read,
                                        "ERROR INPUT",
                                        JOptionPane.ERROR_MESSAGE);

          System.out.println("Error message no. :" + buffer_read);
          return false;

        }

      }
      catch (IOException e)
      {
        JOptionPane.showMessageDialog(null, "Error Read",
                                      "ERROR", JOptionPane.ERROR_MESSAGE);
        return false;

      }

    }
    else
    {
      //------------------------------------------------------------------------
      // User ID input is invalid then return false
      //------------------------------------------------------------------------

      return false;
    }

  }

  //****************************************************************************
  // Delete Contact List Function
  //****************************************************************************

   public boolean Delete_Contactlist()
   {
     String userID = "";
     //String buffer_write = "";
     byte buffer_write[] = new byte[512];
     String buffer_read = "";
     String msg = "";
     byte[] input = new byte[80];
     byte header[] = new byte[7];
     boolean valid_user_id = false;
     int ID = 0;
     int confirm;

     //-------------------------------------------------------------------------
     //  Get User ID to delete and put in userID
     //-------------------------------------------------------------------------

     userID = JOptionPane.showInputDialog("Enter UserID :");

     //-------------------------------------------------------------------------
     //  Initial Delete Contact List Header and Put in buffer_write
     //  TOS = 0x0B CMD = 0xB1
     //-------------------------------------------------------------------------

     try
     {

       //-----------------------------------------------------------------------
       //  Transform userID string to Integer to check the correctness of input
       //-----------------------------------------------------------------------

       ID = Integer.parseInt(userID);
       userID += "$";
       valid_user_id = true;

       header[0] = (byte) 0x0B;
       header[1] = (byte) 0x00;
       header[2] = (byte) 0x01;
       header[3] = (byte) 0x00;
       header[4] = (byte) 0x07;
       header[5] = (byte) 0xB1;
       header[6] = (byte) 0x11;

       for (int i = 0; i < 7; i++)
         buffer_write[i] = header[i];

      //------------------------------------------------------------------------
      // Put userID into buffer_write
      //------------------------------------------------------------------------

       for (int i = 0; i < userID.length(); i++)
         buffer_write[i + 7] = (byte) userID.charAt(i);
     }
     catch (Exception e)
     {
       valid_user_id = false;
       JOptionPane.showMessageDialog(null, "User ID must be only number!",
                                     "ERROR INPUT", JOptionPane.ERROR_MESSAGE);
       //e.printStackTrace();
       return false;
     }

     //-------------------------------------------------------------------------
     //  If User ID input is valid then it will be sent
     //-------------------------------------------------------------------------

     if (valid_user_id)
     {
       //System.out.println(buffer_write);

       //-----------------------------------------------------------------------
       //  Comfirm user to make a last decision before deleting process will start
       //-----------------------------------------------------------------------

       confirm = JOptionPane.showConfirmDialog(null,
           "Do you really want to delete user",
           "Confirmation", JOptionPane.YES_NO_OPTION);

       System.out.println("Confirm = " + confirm);

       //-----------------------------------------------------------------------
       //  Decide to delete the user
       //-----------------------------------------------------------------------

       if (confirm == 0)
       {
         //---------------------------------------------------------------------
         //  Send buffer write
         //---------------------------------------------------------------------

         try
         {
           session.ssl_write(buffer_write);
           //sendData("write ok");
           //System.out.println("Write OK");
         }
         catch (IOException e)
         {
           JOptionPane.showMessageDialog(null, "Error write",
                                         "ERROR", JOptionPane.ERROR_MESSAGE);
           return false;
         }

         //---------------------------------------------------------------------
         //  Wait and read into buffer_read
         //---------------------------------------------------------------------

         try
         {
           buffer_read = session.ssl_read(input);
           //System.out.println(buffer_read);

           //-------------------------------------------------------------------
           //  Check the correctness of input(head) returned
           //-------------------------------------------------------------------

           if ( (input[0] == (byte) 0x0B) && (input[5] == (byte) 0xB2) /*&& (input[6] == 0x11)*/)
           {
             System.out.println(buffer_read);
             user_contact.remove(ID);
             return true;
           }
           else
           {

             //-----------------------------------------------------------------
             //  An error occured when service was processing
             //-----------------------------------------------------------------

             JOptionPane.showMessageDialog(null,
                                           "Error :" + buffer_read,
                                           "ERROR INPUT",
                                           JOptionPane.ERROR_MESSAGE);

             System.out.println("Error message no. :" + buffer_read);
             return false;
           }
           //buffer_read = "";

         }
         catch (IOException e)
         {
           JOptionPane.showMessageDialog(null, "Error Read",
                                         "ERROR", JOptionPane.ERROR_MESSAGE);
           return false;
         }
       }

       //-----------------------------------------------------------------------
       //  Decide not to delete the user
       //-----------------------------------------------------------------------

       else
       {
         return false;
       }

     }
     else
     {
       //-----------------------------------------------------------------------
       // User ID input is invalid then return false
       //-----------------------------------------------------------------------

       return false;
     }

   }

  //****************************************************************************
  // Change Nickname Function
  //****************************************************************************

   public String ChangeNickname()
   {
     String nickname = "";
     byte buffer_write[] = new byte[512];
     String buffer_read = "";

     byte[] input = new byte[80];
     byte header[] = new byte[7];

     boolean valid_nickname = false;
     int nick_len = 0;

     //-------------------------------------------------------------------------
     //  Get new nickname from user
     //-------------------------------------------------------------------------

     nickname = JOptionPane.showInputDialog("Enter Nickname :");

     nick_len = nickname.length();


     //-------------------------------------------------------------------------
     //  Check the length of new nicname that must not be larger than 255 char
     //-------------------------------------------------------------------------

     if (nick_len > 255)
     {
       System.out.println("Nickname must not be longer than 255 characters");
       valid_nickname = false;
     }

     //-------------------------------------------------------------------------
     //  Check the length of new nicname that must be a char at least
     //-------------------------------------------------------------------------
     else if (nick_len == 0)
     {
       System.out.println("At least a character is required !");
       valid_nickname = false;
     }

     //-------------------------------------------------------------------------
     //  Check length process is passed
     //  Initial header
     //  TOS = 0x04 CMD = 0x41
     //-------------------------------------------------------------------------
     else
     {
       //Infact we have to check that nickname contains $ character
       nickname += "$";
       valid_nickname = true;
       header[0] = (byte) 0x04;
       header[1] = (byte) 0x00;
       header[2] = (byte) 0x01;
       header[3] = (byte) 0x00;
       header[4] = (byte) 0x07;
       header[5] = (byte) 0x41;
       header[6] = (byte) 0x11;


       for (int i = 0; i < 7; i++)
         buffer_write[i] = header[i];

      //------------------------------------------------------------------------
      //  Put new nickname into buffer_write
      //------------------------------------------------------------------------

       for (int i = 0; i < nickname.length(); i++)
         buffer_write[i + 7] = (byte) nickname.charAt(i);

     }

     //-------------------------------------------------------------------------
     //  If new nickname is valid then it will be sent
     //-------------------------------------------------------------------------

     if (valid_nickname)
     {
       System.out.println(buffer_write);

       //-----------------------------------------------------------------------
       //  Send buffer_write using SSL
       //-----------------------------------------------------------------------

       try
       {
         session.ssl_write(buffer_write);
         System.out.println("Write OK");
       }
       catch (IOException e)
       {
         JOptionPane.showMessageDialog(null, "Error write",
                                       "ERROR", JOptionPane.ERROR_MESSAGE);
       }

       //-----------------------------------------------------------------------
       //  Wait and read into buffer_read
       //-----------------------------------------------------------------------

       try
       {
         buffer_read = session.ssl_read(input);

         //---------------------------------------------------------------------
         //  Check the correctness of result returned
         //---------------------------------------------------------------------

         if ( (input[0] == (byte) 0x04) && (input[5] == (byte) 0x42) /*&& (input[6] == (byte)0x02)*/)
         {
           //-------------------------------------------------------------------
           //  New nickname is now ready to use
           //  Set client_nick to new nickname
           //-------------------------------------------------------------------
           client_nick = nickname.substring(0, nick_len);
         }
         else
         {
           //-------------------------------------------------------------------
           //  An error occurred while service was processing
           //-------------------------------------------------------------------

           JOptionPane.showMessageDialog(null,
                                         "Error :" + buffer_read,
                                         "ERROR INPUT",
                                         JOptionPane.ERROR_MESSAGE);

           System.out.println("Error message no. :" + buffer_read);
         }

       }
       catch (IOException e)
       {
         JOptionPane.showMessageDialog(null, "Error Read",
                                       "ERROR", JOptionPane.ERROR_MESSAGE);
       }

     }

     //-------------------------------------------------------------------------
     //  New nickname is invalid
     //-------------------------------------------------------------------------
     else
     {

     }

     //-------------------------------------------------------------------------
     //  Refresh the panel for the new nickname
     //-------------------------------------------------------------------------

     return showCurrentStatus();

   }


  //****************************************************************************
  // Check Contact List Status Function
  //****************************************************************************

  public void Status()
  {
    byte buffer_write[] = new byte[512];
    String buffer_read = "";
    String msg = "";

    byte[] input = new byte[80];
    byte[] header = new byte[7];

    //--------------------------------------------------------------------------
    //  Initial header
    //  TOS = 0x05 CMD = 0x51
    //--------------------------------------------------------------------------

    header[0] = (byte) 0x05;
    header[1] = (byte) 0x00;
    header[2] = (byte) 0x01;
    header[3] = (byte) 0x00;
    header[4] = (byte) 0x07;
    header[5] = (byte) 0x51;
    header[6] = (byte) 0x11;

    for (int i = 0; i < 7; i++)
      buffer_write[i] = header[i];

    //--------------------------------------------------------------------------
    //  Send buffer_write using SSL
    //--------------------------------------------------------------------------

    try
    {
      session.ssl_write(buffer_write);
      //System.out.println("Write OK");
    }
    catch (IOException e)
    {
      JOptionPane.showMessageDialog(null, "Error write",
                                    "ERROR", JOptionPane.ERROR_MESSAGE);
    }


    //--------------------------------------------------------------------------
    // Wait and read into buffer_read
    //--------------------------------------------------------------------------

    int x = 0;

    do
    {
      //System.out.println(x + "\n");
      try
      {
        buffer_read = session.ssl_read(input);
        x++;

        //----------------------------------------------------------------------
        //  Check the correctness of result returned
        //----------------------------------------------------------------------

        if ( (input[0] == (byte) 0x05) && (input[5] == (byte) 0x52) )
        {
          //System.out.println(buffer_read);
          //user_contact.insert();

          //--------------------------------------------------------------------
          //  Extract information of contact list by calling
          //  show_contact_list function for each packet recieved
          //  Read more detail about show_contact_list() section
          //--------------------------------------------------------------------

          show_contact_list(buffer_read, user_contact);
          buffer_read = "";

        }
        else
        {
          //--------------------------------------------------------------------
          //  An error occurred while service was processing
          //--------------------------------------------------------------------

          System.out.println("Error message no. :" + buffer_read);
        }
        //buffer_read = "";

      }
      catch (IOException e)
      {
        JOptionPane.showMessageDialog(null, "Error Read",
                                      "ERROR", JOptionPane.ERROR_MESSAGE);
      }
    }
    while (input[6] == 1);

    //--------------------------------------------------------------------------
    //  This loop will ends when input[6] != 1
    //  Mean that flag is set to = 0
    //--------------------------------------------------------------------------


  }

 //****************************************************************************
 // show_contact_list function
 // This function is for extracting information of contact list in the packet
 // and put them all in linked list data structure to use in the future
 //
 // The packet format is :
 // UserID#Email#Nickname#Status#IP$UserID#Email#Nickname#Status#IP$$
 //
 // Class contact is required as argument in this function representing for
 // linked list data structure
 //****************************************************************************

  private void show_contact_list(String buffer, contact contact_current)
  {
    String store = "";
    String profile[] = new String[6];

    int run = 0;
    int start = 0;
    int last = 0;
    boolean x = true;
    int i = 0;
    int user_id;
    String email;
    String nickname;
    char status;
    String ip;
    contact current = contact_current;
    //user_contact.clear();
    for (int j = 0; j < 6; j++)
      profile[j] = "";

    while (x)
    {
      //------------------------------------------------------------------------
      //  If this is the last portion of contact list informaion in packet
      //  Remember that the end of data will be terminated by $$
      //------------------------------------------------------------------------

      if ( (buffer.charAt(run) == '$') && (buffer.charAt(run + 1) == '$'))
      {

        user_id = Integer.parseInt(profile[0]);
        email = profile[1].toString();
        nickname = profile[2].toString();
        status = profile[3].charAt(0);
        ip = profile[4].toString();
        //user_contact.insert(user_id,email,nickname,status,ip);
        current.insert(user_id, email, nickname, status, ip);

        x = false;
        //break;
      }

      //------------------------------------------------------------------------
      //  If this is some portion of contact list informaion in packet
      //  Remember that each contact list information in packet is divided by $
      //------------------------------------------------------------------------

      else if ( (buffer.charAt(run) == '$') && (buffer.charAt(run + 1) != 0))
      {
        i = 0;

        user_id = Integer.parseInt(profile[0]);
        email = profile[1].toString();
        nickname = profile[2].toString();
        status = profile[3].charAt(0);
        ip = profile[4].toString();
        // user_contact.insert(user_id,email,nickname,status,ip);
        current.insert(user_id, email, nickname, status, ip);

        for (int j = 0; j < 6; j++)
          profile[j] = "";
        run++;
        last = run;
      }
      //------------------------------------------------------------------------
      //  This case is to prevent when there isn't any contact lists
      //  The packet contain only $ character
      //------------------------------------------------------------------------

      else if ( (buffer.charAt(run) == '$') && (buffer.charAt(run + 1) == 0))
      {
        store = "No Data Returned !";
        //System.out.println(store + "\n");
        x = false;

        //break;
      }

      //------------------------------------------------------------------------
      //  This case is to check each part of each contact list information
      //  Remember that each part of contac list information is divided by #
      //------------------------------------------------------------------------

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
        store = "";
      }
    }

    //System.out.println(user_contact.print());
  }


  //****************************************************************************
  // getPtrContact function
  //
  // This function is for returning object of class contact
  // The returning object will be used for manipulating User Contact List
  //****************************************************************************

  public contact getPtrContact() {
    return user_contact;
  }

  //****************************************************************************
  // getPtrAuth() function
  //
  // This function is for returning object of class contact
  // The returning object will be used for manipulating Authorized List.
  //****************************************************************************

   public contact getPtrAuth() {
     return user_auth;
   }

  //****************************************************************************
  // Accept_auth() function
  //
  //****************************************************************************

   public String Accept_auth() {
     byte buffer_write[] = new byte[512];
     String buffer_read = "";
     String msg = "";
     byte[] input = new byte[80];
     byte header[] = new byte[7];

     String granted_id;
     int ID;
     boolean valid_granted_id = false;
     int confirm;

     //------------------------------------------------------------------------
     //  Get UserID from user to be granted
     //------------------------------------------------------------------------

     granted_id = JOptionPane.showInputDialog("Enter User ID to be granted :");

     //------------------------------------------------------------------------
     //  Get confirmation from User about granting that entered UserID
     //------------------------------------------------------------------------

     confirm = JOptionPane.showConfirmDialog
         (null,
          "Do you  want to add this user" + granted_id,
          "Confirmation",
          JOptionPane.YES_NO_CANCEL_OPTION,
          JOptionPane.INFORMATION_MESSAGE);

     //------------------------------------------------------------------------
     //  Check entered UserID to be granted that it isn't longer than 10 characters
     //------------------------------------------------------------------------

     if (granted_id.length() < 11)
     {

      //------------------------------------------------------------------------
      //  Try to change String of UserID to integer number to check that
      //  it composes of character numbers.
      //
      //  If it is valid , valid_grainted_id will be set to true ,otherwise false
      //------------------------------------------------------------------------

       try
       {
         ID = Integer.parseInt(granted_id);
         valid_granted_id = true;
       }
       catch (Exception e)
       {
         valid_granted_id = false;
         JOptionPane.showMessageDialog(null, "User ID must be only number!",
                                       "ERROR INPUT",
                                       JOptionPane.ERROR_MESSAGE);
       }

      //------------------------------------------------------------------------
      //  Check that valid_granted_id is true.
      //------------------------------------------------------------------------

       if (valid_granted_id)
       {
         char ans;
         char status;

         //---------------------------------------------------------------------
         //  Get the abbreviation of user's staus and put it into status variable
         //---------------------------------------------------------------------

         if (client_status.compareTo("Online") == 0)
           status = 'O';
         else if (client_status.compareTo("Offline") == 0)
           status = 'F';
         else if (client_status.compareTo("Away") == 0)
           status = 'A';
         else if (client_status.compareTo("Busy") == 0)
           status = 'B';
         else
           status = 'O';

         //---------------------------------------------------------------------
         //  Change the confirmation of user to Y (yes) or N (No) and put it
         //  into ans variable
         //---------------------------------------------------------------------

         if (confirm == 0)
           ans = 'Y';
         else
           ans = 'N';

         //---------------------------------------------------------------------
         //  Initialize header
         //  TOS = 0x5E CMD = 0x55
         //---------------------------------------------------------------------

         header[0] = (byte) 0x5E;
         header[1] = (byte) 0x00;
         header[2] = (byte) 0x01;
         header[3] = (byte) 0x00;
         header[4] = (byte) 0x07;
         header[5] = (byte) 0x55;
         header[6] = (byte) 0x11;

         //---------------------------------------------------------------------
         //  Put initialized header into buffer_write
         //---------------------------------------------------------------------

         int i = 0;
         for (i = 0; i < 7; i++)
           buffer_write[i] = header[i];
         for (i = 0; i < granted_id.length(); i++)
           buffer_write[i + 7] = (byte) granted_id.charAt(i);

         //---------------------------------------------------------------------
         //  Put status and ans data into buffer_write divided each data by
         //  '#' character and terminated by '$'
         //---------------------------------------------------------------------

         buffer_write[i + 7] = (byte) '#';
         buffer_write[i + 8] = (byte) ans;
         buffer_write[i + 9] = (byte) '#';
         buffer_write[i + 10] = (byte) status;
         buffer_write[i + 11] = (byte) '$';

         //---------------------------------------------------------------------
         //  Try sending buffer_write
         //---------------------------------------------------------------------

         try
         {
           session.ssl_write(buffer_write);
           //sendData("write ok");
           System.out.println("Sending Reply");
         }
         catch (IOException e)
         {
           JOptionPane.showMessageDialog(null, "Error write",
                                         "ERROR", JOptionPane.ERROR_MESSAGE);
         }


         //---------------------------------------------------------------------
         //  Try reading returning result
         //---------------------------------------------------------------------

         buffer_read = "";

         try
         {
           buffer_read = session.ssl_read(input);

           //-------------------------------------------------------------------
           //  Check successful result
           //  TOS = 0x5E CMD = 0x56 -> successfully
           //-------------------------------------------------------------------

           if ( (input[0] == (byte) 0x5E) && (input[5] == (byte) 0x56) /* && (input[6] == 2)*/)
          {
            //------------------------------------------------------------------
            //  Successful process
            //------------------------------------------------------------------
             System.out.println(buffer_read);
             //user_contact.insert();
             //show_contact_list(buffer_read);
             buffer_read = "";

           }
           else
           {
             //-----------------------------------------------------------------
             //  Some error occured during processing
             //-----------------------------------------------------------------

             JOptionPane.showMessageDialog(null,
                                           "Error :" + buffer_read,
                                           "ERROR INPUT",
                                           JOptionPane.ERROR_MESSAGE);

             System.out.println("Error message no. :" + buffer_read);
           }
           //buffer_read = "";

         }
         catch (IOException e)
         {
           JOptionPane.showMessageDialog(null, "Error Read",
                                         "ERROR", JOptionPane.ERROR_MESSAGE);
         }

       }

       //-----------------------------------------------------------------------
       //  granted_user_id is false -> invalid input
       //-----------------------------------------------------------------------

       else
       {
         JOptionPane.showMessageDialog(null, "Invalid Input",
                                       "ERROR", JOptionPane.ERROR_MESSAGE);
       }
     }

     //-------------------------------------------------------------------------
     //  String of UserID is longer than 10
     //-------------------------------------------------------------------------

     else
     {
       JOptionPane.showMessageDialog(null, "Over Contact ID Number",
                                     "ERROR INPUT", JOptionPane.ERROR_MESSAGE);
     }
     return "Accept Authorization";

   }

  //****************************************************************************
  // Authorize() function
  //
  //****************************************************************************

   public void Authorize() {

     byte buffer_write[] = new byte[512];
     String buffer_read = "";
     String msg = "";
     String contact_id = "";

     byte[] input = new byte[80];
     byte header[] = new byte[7];

     int confirm;
     int ID;
     boolean valid_contact_id = false;

    //--------------------------------------------------------------------------
    //  Clear buffer storing authorization request before.
    //--------------------------------------------------------------------------

     user_auth.clear();

    //--------------------------------------------------------------------------
    //  Initialize header to reqest the authorization request list
    //  TOS = 0x5E CMD = 0x51
    //--------------------------------------------------------------------------

     header[0] = (byte) 0x5E;
     header[1] = (byte) 0x00;
     header[2] = (byte) 0x01;
     header[3] = (byte) 0x00;
     header[4] = (byte) 0x07;
     header[5] = (byte) 0x51;
     header[6] = (byte) 0x11;

     for (int i = 0; i < 7; i++)
       buffer_write[i] = header[i];

    //--------------------------------------------------------------------------
    //  Send packet and wait for response
    //--------------------------------------------------------------------------

     try
     {
       session.ssl_write(buffer_write);
       //sendData("write ok");
       System.out.println("Write OK");
     }
     catch (IOException e)
     {
       JOptionPane.showMessageDialog(null, "Error write",
                                     "ERROR", JOptionPane.ERROR_MESSAGE);
     }

     int x = 0;

     do
     {
       //System.out.println(x + "\n");
       //-----------------------------------------------------------------------
       //  Receive packet and check packet header
       //-----------------------------------------------------------------------
       try
       {
         buffer_read = session.ssl_read(input);
         x++;

         //---------------------------------------------------------------------
         // If packet header is correct then extracting data inside packet
         //---------------------------------------------------------------------

         if ( (input[0] == (byte) 0x5E) && (input[5] == (byte) 0x52) /* && (input[6] == 2)*/)
        {
           //System.out.println(buffer_read);

           //-------------------------------------------------------------------
           // In this case we have to check that data is not null or doesn't
           // have authorization request waiting list
           //-------------------------------------------------------------------

           if (buffer_read.compareTo("Not Found") != 0)
             //-----------------------------------------------------------------
             // Extract data into user_auth buffer
             //-----------------------------------------------------------------
             show_contact_list(buffer_read, user_auth);

           buffer_read = "";
         }

         //---------------------------------------------------------------------
         // There is an error occuring during transmission
         //---------------------------------------------------------------------
         else
         {
           System.out.println("Error message no. :" + buffer_read);
         }

       }
       catch (IOException e)
       {
         JOptionPane.showMessageDialog(null, "Error Read",
                                       "ERROR", JOptionPane.ERROR_MESSAGE);
       }
     }

     //-------------------------------------------------------------------------
     //  Because authorization request list may have longer than sending in
     //  one packet so there will be multiple packets.
     //  We have to check that each packet is the last one by checking
     //  flags field = 0 otherwise it will be looped .
     //-------------------------------------------------------------------------

     while (input[6] == 1);

   }


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//	This part concerns about manipulating contact's status (Block and Unblock)
//  These two fucntions is much alike
//  so they have to call another function : do_user(byte cmd) by just passing
//  only a byte of CMD's argument.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

 public String Block() {
   do_user( (byte) 0x51);
   return "end block";
 }

 public String Unblock() {
   do_user( (byte) 0x5a);
   return "end unblock";
 }
 public char CharStatus()
 {
   if(client_status.compareTo("Online") == 0) return 'O';
   else if (client_status.compareTo("Busy") == 0) return 'B';
   else if (client_status.compareTo("Away") == 0) return 'A';
   else return 'O';
 }
 private String do_user(byte cmd) {
   String userID = "";
   byte buffer_write[] = new byte[512];
   String buffer_read = "";
   String msg = "";
   byte[] input = new byte[80];
   byte header[] = new byte[7];

   boolean valid_user_id = false;
   int ID = 0;
   int j;

   //---------------------------------------------------------------------------
   // Get UserID to be blocked or unblocked
   //---------------------------------------------------------------------------

   userID = JOptionPane.showInputDialog("Enter UserID :");

   try
   {
     //-------------------------------------------------------------------------
     // Try to convert string of UserID to integer
     // If it is correct then set valid_user_id = true.
     //-------------------------------------------------------------------------

     ID = Integer.parseInt(userID);
     //userID += "$";
     valid_user_id = true;

     //-------------------------------------------------------------------------
     // Initialize header to call function block or unblock depending on
     // cmd parameter.
     //-------------------------------------------------------------------------

     header[0] = (byte) 0x55;
     header[1] = (byte) 0x00;
     header[2] = (byte) 0x01;
     header[3] = (byte) 0x00;
     header[4] = (byte) 0x07;
     header[5] = (byte) cmd;
     header[6] = (byte) 0x11;

     for (int i = 0; i < 7; i++)
       buffer_write[i] = header[i];

       //buffer_write += userID+"$";
     for (j = 0; j < userID.length(); j++)
       buffer_write[j + 7] = (byte) userID.charAt(j);

    //-------------------------------------------------------------------------
    // For unblock function (TOS = 0x5a) we have to give more information
    // not only for UserID to be unblocked but also my current status too.
    //-------------------------------------------------------------------------

     if (cmd == 0x5a)
     {
       buffer_write[j + 7] = (byte) '#';
       //buffer_write[j + 8] = (byte) 'O';
       buffer_write[j + 8] = (byte) CharStatus();
       buffer_write[j + 9] = (byte) '$';
     }
     //-------------------------------------------------------------------------
     // For block function (TOS = 0x5a) we just pass only header packet
     //-------------------------------------------------------------------------
     else
       buffer_write[j + 7] = (byte) '$';

   }
   //---------------------------------------------------------------------------
   // String of UserID consists of non-numeric number.
   //---------------------------------------------------------------------------
   catch (Exception e)
   {
     valid_user_id = false;
     JOptionPane.showMessageDialog(null, "User ID must be only number!",
                                   "ERROR INPUT", JOptionPane.ERROR_MESSAGE);
     //e.printStackTrace();
   }

   //---------------------------------------------------------------------------
   // valid_user_id must be true then send packet
   //---------------------------------------------------------------------------

   if (valid_user_id)
   {
     //sendData(buffer_write);
     System.out.println(buffer_write);

     try
     {
       session.ssl_write(buffer_write);
       //sendData("write ok");
       System.out.println("Write OK");
     }
     catch (IOException e)
     {
       JOptionPane.showMessageDialog(null, "Error write",
                                     "ERROR", JOptionPane.ERROR_MESSAGE);
     }

     //-------------------------------------------------------------------------
     // Read packet returned into buffer_read
     //-------------------------------------------------------------------------

     try
     {
       buffer_read = session.ssl_read(input);
       //System.out.println(buffer_read);

       //for(int k =0 ; k<7 ;k++) System.out.println("input["+k+"]"+ input[k] + "\n" );

       //-----------------------------------------------------------------------
       // Separate specific packet (block and unblock packet)
       //-----------------------------------------------------------------------

       //-----------------------------------------------------------------------
       // For returned blocking packet
       //-----------------------------------------------------------------------

       if (cmd == (byte) 0x51)
       {
         //---------------------------------------------------------------------
         // Blocking is completed!
         //---------------------------------------------------------------------
         if ( (input[0] == (byte) 0x55) && (input[5] == (byte) 0x52) /*&& (input[6] == 0x11)*/)
         {
           System.out.println(buffer_read);
         }
         //---------------------------------------------------------------------
         // Blocking is incompleted!
         //---------------------------------------------------------------------
         else
         {
           JOptionPane.showMessageDialog(null,
                                         "Error :" + buffer_read,
                                         "ERROR INPUT",
                                         JOptionPane.ERROR_MESSAGE);

           System.out.println("Error message no. :" + buffer_read);
         }
       }

       //-----------------------------------------------------------------------
       // For returned blocking packet
       //-----------------------------------------------------------------------

       else if (cmd == (byte) 0x5a)
       {
         //---------------------------------------------------------------------
         // Unblocking is completed!
         //---------------------------------------------------------------------
         if ( (input[0] == (byte) 0x55) && (input[5] == (byte) 0x5b) /*&& (input[6] == 0x11)*/)
         {
           System.out.println(buffer_read);
         }
         //---------------------------------------------------------------------
         // Unblocking is incompleted!
         //---------------------------------------------------------------------
         else
         {
           JOptionPane.showMessageDialog(null,
                                         "Error :" + buffer_read,
                                         "ERROR INPUT",
                                         JOptionPane.ERROR_MESSAGE);

           System.out.println("Error message no. :" + buffer_read);
         }
       }

     }
     catch (IOException e)
     {
       JOptionPane.showMessageDialog(null, "Error Read",
                                     "ERROR", JOptionPane.ERROR_MESSAGE);
     }

   }
   else
   { //User ID isn't valid

   }

   return "end deny";
 }

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//	Finish manipulasession contact's status
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//	This part concerns about manipulating session your own status.
//  There are three status to be chosen
//  O- Online , B- Busy  and A- Away
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

 public String SetStatus(String input_status) {
   byte buffer_write[] = new byte[512];
   String buffer_read = "";
   String msg = "";
   byte[] input = new byte[80];
   byte header[] = new byte[7];
   String status = input_status;

   //status=JOptionPane.showInputDialog("Enter Status :");

   //---------------------------------------------------------------------------
   // Format input of status
   // 1 Check the first character of input
   // 2 Convert it to uppercase
   // 3 Set status into valid status
   //---------------------------------------------------------------------------

   if (status.charAt(0) == 'A' || status.charAt(0) == 'a' ||
       status.charAt(0) == 'B' || status.charAt(0) == 'b' ||
       status.charAt(0) == 'O' || status.charAt(0) == 'o') {
     status = status.toUpperCase();
     switch (status.charAt(0)) {
       case 'A':
         status = "Away";
         break;
       case 'B':
         status = "Busy";
         break;
       case 'O':
         status = "Online";
         break;
       default:
         status = "Online";
         break;
     }

   //---------------------------------------------------------------------------
   // Initialize header
   // TOS = 0x51 CMD = 0x51 -> Change Status
   //---------------------------------------------------------------------------

     header[0] = (byte) 0x51;
     header[1] = (byte) 0x00;
     header[2] = (byte) 0x01;
     header[3] = (byte) 0x00;
     header[4] = (byte) 0x07;
     header[5] = (byte) 0x51;
     header[6] = (byte) 0x11;

     for (int i = 0; i < 7; i++)
       buffer_write[i] = header[i];

   //---------------------------------------------------------------------------
   // Put status into buffer and terminate it using '$'
   //---------------------------------------------------------------------------

     buffer_write[7] = (byte) status.charAt(0);
     buffer_write[8] = (byte) '$';

   //---------------------------------------------------------------------------
   // Send change-status packet
   //---------------------------------------------------------------------------

     try
     {
       session.ssl_write(buffer_write);
       System.out.println("Write OK");
     }
     catch (IOException e)
     {
       JOptionPane.showMessageDialog(null, "Error write",
                                     "ERROR", JOptionPane.ERROR_MESSAGE);
     }

   //---------------------------------------------------------------------------
   // Wait for returning packet
   //---------------------------------------------------------------------------

     try
     {
       buffer_read = session.ssl_read(input);

       if ( (input[0] == (byte) 0x51) && (input[5] == (byte) 0x52) /*&& (input[6] == 0x11)*/)
       {
         //System.out.println(buffer_read);
         //---------------------------------------------------------------------
         // Change status is completed!
         //---------------------------------------------------------------------

         client_status = status;
         System.out.println("Now Status :" + client_status);

       }
       else
       {
         //---------------------------------------------------------------------
         // Change status is incompleted!
         //---------------------------------------------------------------------

         JOptionPane.showMessageDialog(null,
                                       "Error :" + buffer_read, "ERROR INPUT",
                                       JOptionPane.ERROR_MESSAGE);

         System.out.println("Error message no. :" + buffer_read);
       }

     }
     catch (IOException e)
     {
       JOptionPane.showMessageDialog(null, "Error Read",
                                     "ERROR", JOptionPane.ERROR_MESSAGE);
     }

   }
   //---------------------------------------------------------------------------
   // In this case if input status is invalid then Error will be showed
   //---------------------------------------------------------------------------

   else
   {
     JOptionPane.showMessageDialog(null,
                                   "Error Input Staus\n 'O','A','B' only",
                                   "ERROR", JOptionPane.ERROR_MESSAGE);
   }
   return showCurrentStatus();
 }

//------------------------------------------------------------------------------
// showCurrentStatus function is just for returning useful information
//------------------------------------------------------------------------------

 public String showCurrentStatus()
 {
   return ("ID :" + client_id + "\n" +
           "nick :" + client_nick + "\n" +
           "status :" + client_status + "\n");

 }

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//	Finish manipulasession your own status
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


//------------------------------------------------------------------------------
// FindContact function
// This function has only resonsiblity to call class FindPanel.
//------------------------------------------------------------------------------

 public String FindContact() {
   find_ui = new FindPanel(session);
   //find_ui.setModal(true);
   return "Find Contact";
 }

}
