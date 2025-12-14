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
public class DeletePosting extends HttpServlet {

  //Initialize global variables
  public void init(ServletConfig config) throws ServletException {
    super.init(config);
  }
    DriverManager driver;
  //Process the HTTP Get request
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");
     HttpSession session = request.getSession(true);
     String username = (String)session.getValue("user.username");


    Connection conn;
    Statement stmt = null;
    ResultSet rst = null;
    String productID=request.getParameter("productID");

    try{
      driver.registerDriver(new OracleDriver());
      conn = driver.getConnection("jdbc:oracle:thin:@161.246.5.185:1521:Sagent","scott","tiger");
      stmt = conn.createStatement();
      rst = stmt.executeQuery("delete from product where product_id='"+productID+"'");
      rst= stmt.executeQuery("delete from product_attribute where product_id='"+productID+"'");

      PrintWriter out = new PrintWriter (response.getOutputStream());
      response.sendRedirect("http://161.246.5.185:8080/Sagent/servlet/Sagent2.RemovePosting");
    }catch(Exception e){
      e.printStackTrace(System.out);
    }

  }

  //Get Servlet information
  public String getServletInfo() {
    return "Sagent2.DeletePosting Information";
  }
} 