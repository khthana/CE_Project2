package Sagent2;
import javax.mail.*;
import javax.activation.*;
import javax.mail.internet.*;
import java.util.*;
import java.io.*;
import java.util.Properties;

public class SendMail {

  public SendMail() {
  }
  public static void send(String from,String to,String subject,String message){
    Properties props = new Properties();
    props.put("mail.smtp.host","chaokhun.kmitl.ac.th");
    Session session = Session.getDefaultInstance(props, null);
    try {
      // create a message
      MimeMessage msg = new MimeMessage(session);
      msg.setFrom(new InternetAddress(from));
      InternetAddress[] address = {new InternetAddress(to)};
      msg.setRecipients(Message.RecipientType.TO, address);
      msg.setSubject(subject);
      msg.setSentDate(new Date());
/*      // create and fill the first message part
      MimeBodyPart mbp1 = new MimeBodyPart();
      mbp1.setText(msgText1);
      // create and fill the second message part
      MimeBodyPart mbp2 = new MimeBodyPart();
      // Use setText(text, charset), to show it off !
      mbp2.setText(msgText2, "us-ascii");
      // create the Multipart and its parts to it
      Multipart mp = new MimeMultipart();
      mp.addBodyPart(mbp1);
      mp.addBodyPart(mbp2);
      // add the Multipart to the message
      msg.setContent(mp);*/
      msg.setText(message);
      // send the message
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
