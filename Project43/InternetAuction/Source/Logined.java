
import oracle.sql.*;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import oracle.jdbc.driver.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
public class Logined extends HttpServlet implements Serializable
{
    public void   doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
      java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
      Connection con = null;
      Statement stmt = null;
      ResultSet rs= null;
      resp.setContentType("text/html");
      HttpSession session = req.getSession(true);
      boolean have_user = false ;
      session.invalidate();
      HttpSession session2 = req.getSession(true);
      String username ;
      String password ;
      String companyname;
      username = req.getParameter("username");
      password = req.getParameter("password");
      try
      {
      	  DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
	    }
	    catch (java.sql.SQLException ko){ out.println("Register error");}
      try
     {
      con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
      stmt = con.createStatement();
      //////----Find Max spec_id-----///
      String finduser= new String("select username from member where username ='" + username + "'" + " and " + "password ='" + password +"'" );
    	rs = stmt.executeQuery(finduser);
      while (rs.next())
		  {
         have_user = true ;
         session2.putValue("username",username);
    	}
      String findcompanyname= new String("select comp_name from member where username ='" + username + "'" + " and " + "password ='" + password +"'" );
    	rs = stmt.executeQuery(findcompanyname);
      while (rs.next())
		  {
         companyname = rs.getString(1);
         session2.putValue("companyname",companyname);
    	}
      }
       catch (Exception ex)
      {
      	 out.println("Exception");
	       ex.printStackTrace(out);
	    }


     finally
     {
	     try
	     { if (rs != null)  {rs.close();}
         if (stmt != null){stmt.close();}
  		   if (con != null) {con.close();}
       }
	     catch (Exception ex){}
	   }
     if (have_user == true)
     {
       resp.sendRedirect("LoginSuccess");
     }
     else
    {
       resp.sendRedirect("../Loginfail.html");
    }

      out.flush();
    }

}



