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
import javax.servlet.http.HttpSession;
public class Update extends HttpServlet {
  DriverManager driver;
  Connection conn;
  Statement stmt = null;
  ResultSet rst = null;
  java.util.Date regisDate;
  String username,password,newpassword,repassword,name,lastname,tel,age,sex,mobile,fax,beeper,email,address;
  public void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
  {
   PrintWriter writer =  res.getWriter();
   res.setContentType("text/html");
   HttpSession session = req.getSession(true);
   if (session.isNew()){res.sendRedirect("http://161.246.5.185:8080/Sagent/sendlogin.html");}
   else {
   username = (String)session.getValue("user.username");
   name = req.getParameter("name");
   lastname = req.getParameter("lastname");
   tel = req.getParameter("tel");
   age = req.getParameter("age");
   sex = req.getParameter("sex");
   mobile = req.getParameter("mobile");
   fax = req.getParameter("fax");
   beeper = req.getParameter("beeper");
   email = req.getParameter("email");
   address = req.getParameter("address");
   password=req.getParameter("password");
   repassword=req.getParameter("repassword");
   newpassword=req.getParameter("newpassword");
   if (repassword.equals(newpassword)&&(repassword.length()!=0)){}else{newpassword=password;}
   if (password.equals((String)session.getValue("user.password"))){
    try{
      driver.registerDriver(new OracleDriver());
      conn = driver.getConnection("jdbc:oracle:thin:@161.246.5.185:1521:Sagent","scott","tiger");
      stmt = conn.createStatement();
      rst = stmt.executeQuery("update member_attribute set name='"+MTThai.MS874ToUnicode(name)+"',lastname='"+MTThai.MS874ToUnicode(lastname)+"',phone='"+tel+
       "',age='"+age+"',password='"+newpassword+"',sex='"+sex+"',mobile='"+mobile+"',fax='"+fax+"',beeper='"+beeper+"',email='"+email+"',address='"+MTThai.MS874ToUnicode(address)+"' where username='"+username+"'");
      res.sendRedirect("http://161.246.5.185:8080/Sagent/main.html");
      writer.close();
    }catch(Exception e){
      e.printStackTrace();
    }
   }else{
   writer.println("<html><body>please make sure you input old password correctly</body></html>");
   writer.close();
   }

  }
}}