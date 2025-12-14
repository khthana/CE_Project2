import java.net.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Properties;
import java.util.Timer;
import java.util.TimerTask;
import javax.mail.*;
import javax.mail.internet.*;
import java.sql.*;
import java.io.*;

 interface ExceptionListener { public void exceptionOccurred(Throwable t); }
class ExceptionLogger  implements ExceptionListener {
     public void exceptionOccurred( Throwable t ) {
            System.err.println("Exception  on Timer thread!");
            t.printStackTrace();     }  }

//+++++++++++++++++++++++++++++++++++  Email  ++++++++++++++++++++++++++++++++++++++++
 class Email  
{ public static void Send(String to,String Subject,String Text )
   {    String host="ce.kmitl.ac.th";
         String from="Planny@ce.kmitl.ac.th"; 
         try{   Properties props = System.getProperties();  // Get system properties
                  props.put("mail.smtp.host", host);  // Setup mail server
                  Session session = Session.getInstance(props, null);// Get session
                  MimeMessage message = new MimeMessage(session);// Define message
                  message.setFrom(new InternetAddress(from));
                  message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                  message.setSubject(Subject);
                  message.setText(Text);
                  Transport.send(message);
                  System.out.println(" Email ok");
                   }catch(Exception e){ e.printStackTrace(); } 
     }
}
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++++++++++++++++++++  Icq  ++++++++++++++++++++++++++++++++++++++++++
 class Icq  
{ public static void Send(String Sender,String Message,String ICQNumber)
  {   String Email="www.planny.com";
       String Subject = "Remind From Planny";
       String EnterURL = "http://wwp.mirabilis.com/scripts/WWPMsg.dll";
       try{  String content ="from=" + URLEncoder.encode (Sender) 
                               +"&fromemail="+ URLEncoder.encode (Email)
                               +"&subject="+URLEncoder.encode (Subject)
                               +"&body="+URLEncoder.encode (Message)
                               +"&to="+URLEncoder.encode (ICQNumber)
                               +"&send=Send Message";
        int MsgLength = content.length(); 
        URL url = new URL (EnterURL);
        URLConnection urlConn = url.openConnection();
        urlConn.setDoInput (true);
        urlConn.setDoOutput (true);
        urlConn.setUseCaches (false);
        urlConn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        PrintWriter  printout = new PrintWriter(urlConn.getOutputStream ());
        printout.println(content);
        printout.flush ();
        printout.close ();
        BufferedReader input = new BufferedReader(new InputStreamReader(urlConn.getInputStream ()));
        input.close ();
        System.out.println("ICQ OK");
          }catch(Exception e){ e.printStackTrace(); } 
   }
}//ICQ

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++++++++++++++++++++  Gsm  ++++++++++++++++++++++++++++++++++++++++++
 class Gsm  
{ public static void Send(String GsmNumber,String Password,String Message,String Sender)
  {               try {
                  Message=Message+":"+Sender;
                  if(Password.equals("NO Password"))  Password ="";
                  URL url = new URL ("http://202.183.251.250/" + "cgi-gsmweb/web2gsm.cgi");
                   URLConnection urlConn = url.openConnection();
                   urlConn.setDoInput (true);
                   urlConn.setDoOutput (true);
                   urlConn.setUseCaches (false);
                   urlConn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
                   PrintWriter  printout = new PrintWriter(urlConn.getOutputStream ());
                   String content ="szGsmNo=" + URLEncoder.encode (GsmNumber) 
                               +"&szGsmPwd="+ URLEncoder.encode (Password)
                               +"&szMesg="+URLEncoder.encode (Message)
                               +"&Send="+URLEncoder.encode ("  Send   ");
                   printout.println(content);
                   printout.flush ();
                  printout.close ();
                  BufferedReader input = new BufferedReader(new InputStreamReader(urlConn.getInputStream ()));
                  String str;
                  while (null != ((str = input.readLine())))
                  {  /*System.out.println (str);*/ }
                  input.close ();
                  } catch(Exception e){ e.printStackTrace(); } 
   }
}
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++++++++++++++++++++  Easy Call  ++++++++++++++++++++++++++++++++++++++++++
class Easy
{ public static void Send(String From,String EasyNumber,String Message)
  {       String EnterURL = "http://203.146.49.162";    
           String URI="/cgi-bin/webrmd.cgi";
           String Reference = "http://203.146.49.162/cgi-bin/webrmd.cgi";    
            try {   int Count = Message.length();
                      String content ="namefrom=" + URLEncoder.encode (From) 
                               +"&subject="+ URLEncoder.encode (EasyNumber)
                               +"&message="+ URLEncoder.encode (Message)
                               +"&CHARCOUNT="+Count
                               +"&dw="+URLEncoder.encode ("now")
                               +"&hr="+URLEncoder.encode ("now")
                               +"&mn="+URLEncoder.encode ("now");
                      int MsgLength = content.length(); 
                     URL Eurl = new URL (EnterURL); 
                     String host = Eurl.getHost();
                     int port = Eurl.getPort();
                     if (port == -1 ) port = 80 ;
                     Socket Esocket =   new Socket(host,port);
                     PrintWriter out = new PrintWriter(Esocket.getOutputStream(), true);
                     out.println("POST /cgi-bin/webrmd.cgi  HTTP/1.0");
                     out.println("Connection: Keep-Alive");
                     out.println("User-Agent: Mozilla/4.6 [en] (Win95; I)");
                     out.println("Host: "+host);
                     out.println("Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, image/png, */*");
                     out.println("Referer:"+Reference);
                     out.println("Content-type: application/x-www-form-urlencoded");
                     out.println("Content-length:"+MsgLength);
                     out.println();
                     out.println(content);
                     BufferedReader in = new BufferedReader(new InputStreamReader(Esocket.getInputStream()));
                     out.close();
                     in.close();
                     Esocket.close();
                     System.out.println("Send Easy Call 1500 OK");
                      } catch(Exception e){ e.printStackTrace(); } 
    }
}
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class Rain extends TimerTask  {
    ExceptionListener el;     
    Connection theConnection;	
 public Rain(ExceptionListener el) 
 {   this.el=el;  }
 public  void run() {
         try {
       
        int  CurDate      =  Calendar.getInstance().get(Calendar.DAY_OF_MONTH); 
        int  CurMonth   =  Calendar.getInstance().get(Calendar.MONTH)+1; 
        int  CurYear      =  Calendar.getInstance().get(Calendar.YEAR); 
        int  CurHour      =  Calendar.getInstance().get(Calendar.HOUR_OF_DAY); 
        int  CurMin        =  Calendar.getInstance().get(Calendar.MINUTE); 
       System.out.println("Current Time  =  "+CurDate+"/"+CurMonth+"/"+CurYear+"-"+CurHour+":"+CurMin);
       
       String  PagerType = ""; 
       String  PagerNumber="";
       String  Password="";
       String  UserEmail="";
       String  Message="";
       String  Sender="";
       boolean Check= true;
      
      //+++++++++++++++++++++++++++++++++++ Database +++++++++++++++++++++++++++++++++++++++++++++++++++
        try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                  theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
             } catch (Exception e)  { System.out.println(e.getMessage()); }    
        try{  Statement  theStatement=theConnection.createStatement();
                  ResultSet theResult; 
                  theResult=theStatement.executeQuery("select  *  from remind where freq_before = to_date('"+CurDate+"/"+CurMonth+"/"
                  +CurYear+"  "+CurHour+":"+CurMin+"','dd/mm/yyyy hh24:mi')"+
                  " or freq_and = to_date('"+CurDate+"/"+CurMonth+"/"
                  +CurYear+"  "+CurHour+":"+CurMin+"','dd/mm/yyyy hh24:mi')");
                  
                  while(theResult.next())
                     {   PagerType = theResult.getString(5);
                          PagerNumber=theResult.getString(6);
                          Password=theResult.getString(7);
                          UserEmail=theResult.getString(8);
                          Message=theResult.getString(9);
                          Sender=theResult.getString(10);   
                     	    System.out.println("++++++++++++++++++++++++++++++++++++++++++++++");
                     	    System.out.println("Pager Type="+theResult.getString(5));
                          System.out.println("Pager Number="+theResult.getString(6));
                          System.out.println("Pager Password="+theResult.getString(7));
                          System.out.println("Email ="+theResult.getString(8));
                          System.out.println("Message ="+theResult.getString(9));
                          System.out.println("Sender ="+theResult.getString(10));
                          System.out.println("++++++++++++++++++++++++++++++++++++++++++++++");
                    	
    //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            
            if ( PagerNumber.length() < 6 ) { Check = false; }
            
            if (Check) {
            //++++++++++  GSM  ++++++++++++++
            if ( PagerType.equals("GSM")) 
                 {  Gsm.Send(PagerNumber,Password,Message,Sender); 
                    System.out.println("GSM KUB");   }
            //++++++++++ ICQ ++++++++++++++++++
            if ( PagerType.equals("ICQ")) 
                 {  Icq.Send(Sender,Message,PagerNumber); 
                 	System.out.println("ICQ KUB");      }
            //++++++++++ Email +++++++++++++++
            if ( !UserEmail.equals("No Email")) 
                 {  Email.Send(UserEmail,Sender,Message);      
                     System.out.println("Email KUB"); }
            //++++++++++ Easy call +++++++++++++++
            if (PagerType.equals("1500"))                      
                 {  Easy.Send(Sender,PagerNumber,Message);                                      
                     System.out.println("Easy KUB");   }           
                                }//check
            //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
           /* try{   theStatement.executeQuery(
                    "delete from remind where (freq_before < to_date('"+CurDate+"/"+CurMonth+"/"+CurYear+
                    "  "+CurHour+":"+CurMin+"','dd/mm/yyyy hh24:mi') or freq_before is null) and ( freq_and < "+
                     " to_date('"+CurDate+"/"+CurMonth+"/"+CurYear+"  "+CurHour+":"+CurMin+"','dd/mm/yyyy hh24:mi')"+
                     "  or freq_and is null)");
                      theStatement.close();
                   } catch (Exception e)  { System.out.println(e.getMessage()); }  
            
            
              try{   theStatement.executeQuery(
                    "update  calendar  set no_rem = 1 where freq_rep <= to_date('"+CurDate+"/"+CurMonth+"/"+CurYear+
                    "  "+CurHour+":"+CurMin+"','dd/mm/yyyy hh24:mi') and no_rem > 1 ");
                      theStatement.close();
                 System.out.println("Updated");                 
                   } catch (Exception e)  { System.out.println(e.getMessage()); }  */
            
            
                   }//While()
            theStatement.close();
            theResult.close();
            } catch (Exception e)  { System.out.println(e.getMessage()); }
    
       
    
                try { theConnection.close();
         } catch (Exception e)  { System.out.println(e.getMessage()); }
         }catch (Throwable t) {   cancel();
                                                     el.exceptionOccurred(t);  } 
              
  }
}//class

//+++++++++++++++++++++++++++++    Main Class +++++++++++++++++++++++++++++++++++
public class TestTimer3 {
      public static void doMain()  throws Exception {
                    Timer t = new Timer();
                     //t.schedule(new Rain(),1000, 60000);
                     t.schedule(new Rain(new  ExceptionLogger()),1000, 60000);
                    }  
      public static void main(String[] args) {
                    try { doMain(); }
                    catch (Exception e) { e.printStackTrace(); }
}  }//class



/* Calendar GCalendar = new GregorianCalendar(2001,3,26,16,4);  
       System.out.println("Database Time ="+GCalendar.get(GCalendar.DATE)+"/"+GCalendar.get(GCalendar.MONTH)+"/"+GCalendar.get(GCalendar.YEAR)+"-"+GCalendar.get(GCalendar.HOUR_OF_DAY)+":"+GCalendar.get(GCalendar.MINUTE));
       System.out.println("Current Time  ="+CurDate+"/"+CurMonth+"/"+CurYear+"-"+CurHour+":"+CurMin);
       
       
       
       
       if( (GCalendar.get(GCalendar.YEAR)==CurYear)&&(GCalendar.get(GCalendar.MONTH)==CurMonth)&&(GCalendar.get(GCalendar.DATE)==CurDate)&&(GCalendar.get(GCalendar.HOUR_OF_DAY)==CurHour)&&(GCalendar.get(GCalendar.MINUTE)==CurMin) )
       { System.out.println("Send Mail");
          Email.Send(UserEmail,Sender,Message);      
          System.out.println("Send ICQ"); 
          Icq.Send("Sender","Message","97437297");       
          System.out.println("Send GSM"); 
          Gsm.Send("8381353","","Message");    }  */