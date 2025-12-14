import  sun.net.smtp.*;
import  java.util.Calendar;
import  java.util.GregorianCalendar;
import  oracle.sql.*;
import  oracle.jdbc.driver.*;
import  java.awt.*;
import  java.awt.event.*;
import  javax.swing.*;
import  javax.swing.UIManager;
import  java.sql.*;
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.lang.String;

public class FindBestSpec {
  public  String name ;
  Specification Sellerspec = new Specification();
  boolean packFrame = false;
  Frame1 frame ;
   int tech_req_id;
  //Construct the application
   public FindBestSpec() {
    Frame1 frame = new Frame1(this);
    //Validate frames that have preset sizes
    //Pack frames that have useful preferred size info, e.g. from their layout
    if (packFrame)
      frame.pack();
    else
      frame.validate();
    frame.setVisible(true);
  }

  //Main method
  public static void main(String[] args) {
    try  {
      UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
    }
    catch(Exception e) {
    }
    new FindBestSpec();

  }
  public void query()
  {
       long i = 0 ;

       while(true)
       {
          Connection con_buyer     = null;
          Statement  stmt_buyer    = null;
          ResultSet  rs_buyer      = null;
          try
          {
         	  DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
          }
	        catch (java.sql.SQLException ko){ System.out.println("Register error");}
          try
          {
            con_buyer = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
            stmt_buyer = con_buyer.createStatement();
            String Listbuyerspec = new String("select  tech_req_id,project_spec,end_date,finished,maxprice,username from buyer_tech_req order by tech_req_id ");
            rs_buyer = stmt_buyer.executeQuery(Listbuyerspec);
            System.out.println("SQL Buyer = " + Listbuyerspec);
            while (rs_buyer.next())
            {
             	Calendar Temp_Calendar = new GregorianCalendar();
              Temp_Calendar.setTime(rs_buyer.getDate(3));
              int Temp_Date      =  Temp_Calendar.get(Calendar.DATE);
              int Temp_Month     =  Temp_Calendar.get(Calendar.MONTH);
              int Temp_Year      =  Temp_Calendar.get(Calendar.YEAR);
              Temp_Calendar.setTime(rs_buyer.getTime(3));
              int Temp_Min       =  Temp_Calendar.get(Calendar.MINUTE);
              int Temp_Hour      =  Temp_Calendar.get(Calendar.HOUR_OF_DAY);
            	Calendar Project_Calendar = new GregorianCalendar(Temp_Year,Temp_Month,Temp_Date,
                                                       Temp_Hour,Temp_Min);
              long projecttime  = Project_Calendar.getTime().getTime();
              int CurDay       =  Calendar.getInstance().get(Calendar.DATE);
              int CurMonth     =  Calendar.getInstance().get(Calendar.MONTH);
              int CurYear      =  Calendar.getInstance().get(Calendar.YEAR);
              int CurMin       =  Calendar.getInstance().get(Calendar.MINUTE);
              int CurHour      =  Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
              Calendar Current_Calendar = new GregorianCalendar(CurYear,CurMonth,CurDay,
                                                          CurHour,CurMin);
              int tech_req_id;
              tech_req_id = Integer.parseInt(rs_buyer.getString(1));
              /////////////if current time >  project time /////////////////////

              if ((Project_Calendar.before(Current_Calendar)) &&
                 (rs_buyer.getString(4).compareTo("no") == 0))
              {
                 Connection con_seller     = null;
                 Statement  stmt_seller    = null;
                 ResultSet  rs_seller      = null;
                 con_seller = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
                 stmt_seller = con_seller.createStatement();
                 String Listsellerspec = new String("select  tech_req_id,seller_name,seller_spec");
                 Listsellerspec += " from bidding_table where tech_req_id =" + tech_req_id ;
                 rs_seller = stmt_seller.executeQuery(Listsellerspec);
                 System.out.println("SQL Seller = " + Listsellerspec);
                 String Sellername = "";
                 int min_price = Integer.parseInt(rs_buyer.getString(5)) ;
                 boolean havebidding = false ;
                 while(rs_seller.next())
                 {
                    Sellername = rs_seller.getString(2);
                    havebidding = true ;
                    BLOB blob;
                    blob = ((OracleResultSet)rs_seller).getBLOB(3);
                    String username = rs_seller.getString(2);
                    InputStream instream = blob.getBinaryStream();
                	  ObjectInputStream iis = new ObjectInputStream(instream);
                    Sellerspec = (Specification)iis.readObject();
                    int    seller_price   =   Sellerspec.Maxprice ;
                    if (seller_price < min_price)
                    {
                      min_price     = seller_price    ;
                    }
                    if (havebidding == true)
                    {
                      System.out.println("tech_req_id = " + tech_req_id);
                      Connection con_mail     = null;
                      Statement  stmt_mail    = null;
                      ResultSet  rs_mail      = null;
                      con_mail = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
                      stmt_mail = con_mail.createStatement();
                      String Sendmail = new String("select  email from member ");
                      Sendmail   += " where username = '" + Sellername + "'" ;
                      rs_mail = stmt_mail.executeQuery(Sendmail);
                      while(rs_mail.next())
                      {
                       String email = rs_mail.getString(1) ;
                       String smtphost ="ce.kmitl.ac.th" ;
                       String from = "Auction@hotmail.com";
                       String to   = email ;
                       System.out.println("mail to " + email);
                       try
                       {
                        GenerateMail Genmail = new GenerateMail();
                        SmtpClient smtp =  new SmtpClient(smtphost);
                        smtp.from(from);
                        smtp.to(to);
                        PrintStream msg=smtp.startMessage();
                        msg.println("To : "+to);
                        msg.println("Subject : Hello " + Sellername + " auction have closed");
                        msg.println("hello  " + Sellername);
                        msg.println("project number "+ tech_req_id + " have closed");
                        msg.println("Please wait contact from buyer");
                        smtp.closeServer();
                        System.out.println("send email to " + Sellername + " at ");
                        System.out.println(email + " success") ;
                        }//END try
                        catch(Exception e){ System.out.println(e) ;}
                      }
                    }// END if havebidding = true //
                 }
                 /////////////Send mail to buyer///////////////////
                 if (havebidding == true)
                 {
                      String Buyername =rs_buyer.getString(6);
                      Connection con_mail     = null;
                      Statement  stmt_mail    = null;
                      ResultSet  rs_mail      = null;
                      con_mail = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
                      stmt_mail = con_mail.createStatement();
                      String Sendmail = new String("select  email from member ");
                      Sendmail   += " where username = '" + Buyername + "'" ;
                      rs_mail = stmt_mail.executeQuery(Sendmail);
                      while (rs_mail.next())
                      {
                        String Buyermail = rs_mail.getString(1) ;
                        String smtphost ="ce.kmitl.ac.th" ;
                        String from = "Auction@hotmail.com";
                        String to   = Buyermail ;
                        System.out.println("mail to " + Buyername);
                        try
                        {
                         GenerateMail Genmail = new GenerateMail();
                         SmtpClient smtp =  new SmtpClient(smtphost);
                         smtp.from(from);
                         smtp.to(to);
                         PrintStream msg=smtp.startMessage();
                         msg.println("To : "+to);
                         msg.println("Subject : Hello " + Buyername + " auction have closed");
                         msg.println("hello  " + Buyername);
                         msg.println("project number "+ tech_req_id + " have closed");
                         msg.println("min price = " + min_price);
                         msg.println("Please visit our site to choose best spec");
                         smtp.closeServer();
                         System.out.println("send email to " + Buyername + " at ");
                         System.out.println("with min price =" + min_price );
                         System.out.println(Buyermail + " success") ;
                         }//END try
                         catch(Exception e){ System.out.println(e) ;}
                      }
                  }
                 //////set project finished = "yes"////
                 Connection con_finished     = null;
                 Statement  stmt_finished    = null;
                 ResultSet  rs_finished      = null;
                 con_finished = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
                 stmt_finished= con_finished.createStatement();
                 String update = new String("update  buyer_tech_req set finished = 'yes' ");
                 update   += " where tech_req_id  = '" + tech_req_id + "'" ;
                 rs_finished= stmt_finished.executeQuery(update);
                 System.out.println("set project id ="+ tech_req_id + " to finished success") ;
              }///END    if (Project_Calendar.before(Current_Calendar))// &&
             //////----query in bidding_table-------/////
           }///End while(rs_buyer.next())
        Thread.sleep(1000);
        System.gc() ;
        i++;
        System.out.println("count program = " + i);
     }
     catch (Exception ex)
     {
     	 System.out.println(ex);

     }
     finally
     {
	     try
	     { if (rs_buyer != null)  {rs_buyer.close();}
         if (stmt_buyer != null){stmt_buyer.close();}
  		   if (con_buyer != null) {con_buyer.close();}
       }
	     catch (Exception ex){ }

     }
    }

  }
 }
 /*   int project_Date      =  Project_Calendar.get(Calendar.DATE);
        int project_Month     =  Project_Calendar.get(Calendar.MONTH);
        int project_Year      =  Project_Calendar.get(Calendar.YEAR);
        int project_Min       =  Project_Calendar.get(Calendar.MINUTE);
        int project_Hour      =  Project_Calendar.get(Calendar.HOUR_OF_DAY);
        int Current_Date      =  Current_Calendar.get(Calendar.DATE);
        int Current_Month     =  Current_Calendar.get(Calendar.MONTH);
        int Current_Year      =  Current_Calendar.get(Calendar.YEAR);
        int Current_Min       =  Current_Calendar.get(Calendar.MINUTE);
        int Current_Hour      =  Current_Calendar.get(Calendar.HOUR_OF_DAY);
        long Time = Current_Calendar.getTime().getTime();
        System.msg.println("current Day   = " + Current_Date);
        System.msg.println("current Month = " + Current_Month);
        System.msg.println("current Year  = " + Current_Year);
        System.msg.println("current Hour  = " + Current_Hour);
        System.msg.println("current Min   = " + Current_Min);
        System.msg.println("project Day   = " + project_Date);
        System.msg.println("project Month = " + project_Month);
        System.msg.println("project Year  = " + project_Year);
        System.msg.println("project Hour  = " + project_Hour);
        System.msg.println("project Min   = " + project_Min);
        System.msg.println("Current Time   = " + Time);
        System.msg.println("Project Time   = " + projecttime); */
        ///////////////------
    //    InputStream instream = blob.getBinaryStream();
   // 	  ObjectInputStream iis = new ObjectInputStream(instream);
    //    Sellerspec = (Specification)iis.readObject();

