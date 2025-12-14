package Sagent2;
import javax.mail.*;
import javax.activation.*;
import javax.mail.internet.*;
import java.util.*;
import java.io.*;
import java.util.Properties;

public class TestMail {
  public static void main(String[] args){
    Properties props = new Properties();
    props.put("mail.smtp.host","chaokhun.kmitl.ac.th");
    Session session = Session.getDefaultInstance(props, null);
    try {
      MimeMessage msg = new MimeMessage(session);
      msg.setContent("hello","text/html");
      msg.setFrom(new InternetAddress("zatan@haha.com"));
      InternetAddress[] address = {new InternetAddress("zatan007@hotmail.com")};
      msg.setRecipients(Message.RecipientType.TO, address);
      msg.setSubject("test mail");
      msg.setSentDate(new Date());
      msg.setText("<html><body>Please <form name=\"form1\" method=\"get\" action=\"http://161.246.5.185:8080/Sagent/servlet/Sagent2.MailToDisplay\">  <input type=\"hidden\" name=\""+username+"\" value=\"ffff\">  <input type=\"hidden\" name=\""+password\+"" value=\"dddddd\">  <input type=\"submit\" name=\"Submit\" value=\"Click\"></form>Here to See your Product... </body></html>");
      Transport.send(msg);
      } catch (MessagingException mex) {
          mex.printStackTrace();
          Exception ex = null;
          if ((ex = mex.getNextException()) != null) {
            ex.printStackTrace();
          }
      }
  }
}