import sun.net.smtp.*;
import java.io.*;


public class MailSmtp{
public static void main(String[] arg) throws IOException {
    String smtphost ="ce.kmitl.ac.th" ;
    String from = "porn_ka@hotmail.com";
    String to = "porn_ka@hotmail.com" ;
    try
    {
         SmtpClient smtp =  new SmtpClient(smtphost);
         smtp.from(from);
         smtp.to(to);
         PrintStream msg=smtp.startMessage();
         msg.println("To : "+to);
         msg.println("Subject : From Hacker");
         msg.println("Subject : access success");
         msg.println("!!!!!!!!!!!!!!!!!!be careful you self!!!!!!!!!!!!!!!");
         System.out.println("send success");
         smtp.closeServer();
         System.out.println("send success");
      }
      catch(Exception e)
           { System.out.println(e); }
      }
}


