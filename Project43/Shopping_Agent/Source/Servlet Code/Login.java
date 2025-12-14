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
public class Login extends HttpServlet{
  DriverManager driver;
  Connection conn;
  Statement stmt = null;
  ResultSet rst = null;
  String username,password;
  public void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
  {
    try{
      PrintWriter writer = res.getWriter();
      res.setContentType("text/html");
      username = req.getParameter("username");
      password = req.getParameter("password");
      driver.registerDriver(new OracleDriver());
      conn = driver.getConnection("jdbc:oracle:thin:@161.246.5.185:1521:Sagent","scott","tiger");
      stmt = conn.createStatement();
      rst = stmt.executeQuery("select * from member_attribute where username='"+username+"' and password='"+password+"'");
      if(rst.next())
      {
        HttpSession session = req.getSession(true);
        session.putValue("user.username",username);
        session.putValue("user.password",password);
        res.sendRedirect("http://161.246.5.185:8080/Sagent/main.html");
        writer.close();
      }else res.sendRedirect("http://161.246.5.185:8080/Sagent/relogin.html");
    }catch(Exception e){}
  }
}