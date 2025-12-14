/*
 * SendMail.java
 *
 * Created on 29 มกราคม 2549, 1:02 น.
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

/**
 *
 * @author IBM
 */
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import java.sql.*;
public class SendMail {
    
    /** Creates a new instance of SendMail */
    public SendMail(String filename) {
        String host = "localhost";
        String sender = "AMS@network35.ce.kmilt.ac.th";
        String receiver = getEmail();
        String subject = "AMS Alert FROM Motion Detection";
        Properties p = new Properties();
        p.put("mail.smtp.host",host);
        Session ses = Session.getInstance(p,null);

        try{
                Message msg = new MimeMessage(ses);
                msg.setFrom(new InternetAddress(sender));
                Address[] toaddress = InternetAddress.parse(receiver);
                msg.setRecipients(Message.RecipientType.TO,toaddress);
                msg.setSubject(subject);
                //create Multipart 
                Multipart mp = new MimeMultipart();
                BodyPart bp = new MimeBodyPart();
                bp.setText("ALERT MOTION DETECTION IS IN YOUR LOCATION!!!!!!!!!!!!!!!!!!!!!!!");
                mp.addBodyPart(bp);
                
                bp = new MimeBodyPart();
                DataSource ds = new FileDataSource(Imagemaker.getImagepath()+filename+".jpeg");
                bp.setDataHandler(new DataHandler(ds));
                bp.setFileName(filename+".jpeg");
                mp.addBodyPart(bp);
                msg.setContent(mp);
                
                        //msg.setText("ALERT MOTION DETECTION IS IN YOUR LOCATION!!!!!!!!!!!!!!!!!!!!!!!");
                Transport.send(msg);
                System.out.println("Email has been Send");
                //msg.writeTo(System.out);
        }catch(Exception e){
                e.printStackTrace();
        }
    }
    public String getEmail(){
        Vector v = new Vector();
        String email = "";
        String querystring;
        Statement s;
        Connection c;
        //String username = "root";
        //String password = "komate";
        String username = variableCode.userDB;
        String password = variableCode.passDB;
        String url = "jdbc:mysql://localhost/ams";
        String driver = "com.mysql.jdbc.Driver";
        //String driver = "org.gjt.mm.mysql.Drive";
        querystring = "SELECT email FROM mobileaccount";
        try{
        Class.forName(driver);
        c = DriverManager.getConnection(url,username,password);
        s = c.createStatement();
        ResultSet r =s.executeQuery(querystring);
        
        while(r.next()){
            v.addElement(r.getString(1));
        }
        for(int i=0;i<v.size();i++){
            if(i!=v.size()-1)
            email = email+(String)v.elementAt(i)+",";
        else
            email = email +(String)v.elementAt(i);
        }
        s.close();
        c.close();
        }
        catch(ClassNotFoundException cnfe){
        System.err.println("Failed to Connect Database");
        System.exit(1);
        }
        catch(SQLException se){
            System.err.println("Unable to connect");
            se.printStackTrace();
        }
        

        return email;
    }
    
    
}
