package Sagent2;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import java.net.*;
import oracle.sql.*;
import java.lang.*;
import oracle.jdbc.driver.*;
public class SignUp extends HttpServlet {
      DriverManager driver;
      Connection conn;
      Statement stmt = null;
      ResultSet rst = null;
      java.util.Date regisDate;
      String username,password,repassword,name,lastname,tel,age,sex,mobile,fax,beeper,email,address;
    public void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {
      PrintWriter writer = res.getWriter();
	    res.setContentType("text/html");
      username = req.getParameter("username");
      password = req.getParameter("password");
      repassword = req.getParameter("repassword");
      name = ToUnicode.toUnicode(req.getParameter("name"));
      lastname = ToUnicode.toUnicode(req.getParameter("lastname"));
      sex = req.getParameter("sex");
      age = req.getParameter("age");
      tel = req.getParameter("tel");
      mobile = req.getParameter("mobile");
      fax = req.getParameter("fax");
      beeper = req.getParameter("beeper");
      email = req.getParameter("email");
      address = ToUnicode.toUnicode(req.getParameter("address"));
      if((username.length()==0)||(password.length()==0)||(repassword.length()==0)
        ||(name.length()==0)||(lastname.length()==0)||(tel.length()==0))
      {
        writer.println("You must specify all required fields");
      }else if(password.compareTo(repassword)!=0)
      {
        writer.println("Not equal");
      }else
      {
       try{
         Integer temp;
         regisDate =  new java.util.Date();
         String dateString,dayString,monthString,yearString;
         temp =  new Integer(regisDate.getDate());
         dayString = temp.toString();
         if(dayString.length()==1) dayString = "0"+dayString;
         temp = new Integer(regisDate.getMonth()+1);
         monthString = temp.toString();
         if(monthString.length()==1) monthString = "0"+monthString;
         temp = new Integer(regisDate.getYear()+1900);
         yearString = temp.toString();
         dateString = dayString+"/"+monthString+"/"+yearString;
         driver.registerDriver(new OracleDriver());
         conn = driver.getConnection("jdbc:oracle:thin:@161.246.5.185:1521:Sagent","scott","tiger");
         stmt = conn.createStatement();
         rst = stmt.executeQuery("select * from member_attribute where username='"+username+"'");
         if(rst.next())
         {
            writer.println("Already exists");
         }else
         {                            
            String mailbody="This is registration confirmation\nYour username is:"+username+"\nYour password is:"+password+"\nEnjoy our service!\nSincerely,\nRealAgent";
            stmt.executeQuery("insert into member_attribute values('"+username+"','"+password+"','"+name+"','"+
            lastname+"','"+sex+"','"+age+"','"+tel+"','"+
            fax+"','"+mobile+"','"+beeper+"','"+address+"','"+email+"',"+"to_date('"+dateString+"','dd/mm/yyyy'),"
            +"to_date('"+dateString+"','dd/mm/yyyy')"+")");
            SendMail.send("hitman@realagent.com",email,"Welcome to RealAgent",mailbody);
            FileWriter fw = new FileWriter("c:\\tomcat\\webapps\\ROOT\\profile\\"+username+".xml");
            fw.write("<?xml version=\"1.0\"?><specification count=\"0\"></specification>");
            fw.close();
            res.sendRedirect("http://161.246.5.185:8080/Sagent/login.html");
            writer.close();
         }
       }catch(Exception e)
       {
        writer.println(e.getMessage());
       }
      }
    }
}
