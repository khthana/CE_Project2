package Sagent2;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import oracle.jdbc.driver.*;
import oracle.sql.*;

public class Retrieve extends HttpServlet {
  DriverManager driver;
  Connection conn;
  Statement stmt = null;
  ResultSet rst = null;
  private static final String CONTENT_TYPE = "text/html";
  /**Initialize global variables*/
  public void init(ServletConfig config) throws ServletException {
    super.init(config);
  }
  /**Process the HTTP Post request*/
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    response.setContentType(CONTENT_TYPE);
    PrintWriter out = response.getWriter();
    String username=request.getParameter("login");
    try{
    driver.registerDriver(new OracleDriver());
    conn = driver.getConnection("jdbc:oracle:thin:@161.246.5.185:1521:Sagent","scott","tiger");
    stmt = conn.createStatement();
    rst = stmt.executeQuery("select * from member_attribute where username='"+username+"'");
    if (rst.next()){
      String msgbody="This is your login:"+username+"\nYour password:"+rst.getString("password")+"\nSincerely,\nRealAgent";
      SendMail.send("forgot@realagent.com",rst.getString("email"),"Your RealAgent Password",msgbody);
      out.println("<html><head><script language=\"JavaScript1.0\">self.close();</script></head><body></body></html>");
      out.close();
    } else {
        out.println("<html><body>username does not exist&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"javascript:window.back()\">click here to go back</a></body></html>");
        out.close();
      }
    }catch (Exception e){
      out.println("<html><body>fail in try statement</body></html>");
      out.close();
    }
  }
}