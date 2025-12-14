



//package auction;
import  checkdata ;
import  java.sql.*;
import  oracle.jdbc.driver.*;
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.util.*;
public class RemoveYourProject extends HttpServlet
{

    public void   doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
    String delete ="";
	  resp.setContentType("text/html");
	  java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
    HttpSession session = req.getSession(true);
    String Tech_req_id     = req.getParameter("Tech_req_id");
    Connection con = null;
    Statement stmt = null;
    ResultSet rs= null;
    try
    {
    	  DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
    }
    catch (java.sql.SQLException ko){ out.println("Register error");}
     try
    {
      con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
      stmt = con.createStatement();
      /////--------Delete old data--------/////
      delete = "delete from buyer_tech_req  where Tech_req_id  = '" + Tech_req_id  +"'";
    	rs  = stmt.executeQuery(delete);
      delete = "delete from bidding_table where Tech_req_id ='" + Tech_req_id + "'" ;
      rs  = stmt.executeQuery(delete);
      resp.sendRedirect("YourProjectList");
     }
      catch (Exception ex)
     {
    	 out.println(ex);
	     ex.printStackTrace(out);
	   }
     finally
     {
	     try
	     { if (rs != null)  {rs.close();}
         if (stmt != null){stmt.close();}
  		   if (con != null) {con.close();}
       }
	     catch (Exception ex){ out.println(ex) ;}
	   }
    out.println("<html>");
    out.println("<head>");
    out.println("<title>Remove your spec</title>");
	  out.println("</head>");
    out.println("<body>");
    out.println("body");
    out.println(delete);
    out.println("</body>");
    out.println("<h2><center>");
	  out.println("<br>");
    out.println("</html>");
    out.flush();

    }

 }




