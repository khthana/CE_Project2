
import oracle.sql.*;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import oracle.jdbc.driver.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class SendSellerSpecToDatabase extends HttpServlet implements Serializable
{
    public synchronized void   doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
      java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
      Connection con = null;
      Statement stmt = null;
      ResultSet rs= null;
      resp.setContentType("text/html");
      HttpSession session = req.getSession(true);
      Specification Sellerspec = new Specification();
      String tech_req_id = req.getParameter("tech_req_number");
      Sellerspec = (Specification)session.getValue("sellerspec");
      String username      = (String)session.getValue("username");
      String companyname   = (String)session.getValue("companyname");
      if (username == null)
          resp.sendRedirect("../Pleaselogin.html");
      out.println("<html>");
      out.println("<head>");
      out.println("<title> Send Seller Spec To Database</title>");
      out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
      out.println("</head>");
      out.println("<body bgcolor=\"#FFFFFF\">");
    //  out.println(Sellername);
      try
      {
      	  DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
	    }
	    catch (java.sql.SQLException ko){ out.println("Register error");}
      try
     {
       con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
       con.setAutoCommit(false);
       stmt = con.createStatement();
      //////----Insert EMPTY_BLOB------////
      String insert ;
//      insert  = "insert into bidding_table(tech_req_id,seller_name,seller_spec)" ;
//      insert  += "values("+tech_req_id +","+ "'" + username + "'" + "," + "empty_BLOB()" + ")" ;
      insert  = "insert into bidding_table(tech_req_id,seller_name,seller_spec)" ;
      insert  += "values("+tech_req_id +","+ "'" + Sellerspec.name + "'" + "," + "empty_BLOB()" + ")" ;

    	out.println("string insert >>>  "   + insert);

      rs  = stmt.executeQuery(insert);
      BLOB blob;
     	String cmd = new String("SELECT tech_req_id,seller_name,seller_spec FROM bidding_table ") ;
      cmd += "WHERE tech_req_id ="+ tech_req_id + " and seller_name = '" + Sellerspec.name + "'";
    	rs = stmt.executeQuery(cmd);
    	rs.next();
      out.println(cmd);
    	blob = ((OracleResultSet)rs).getBLOB(3);
 	    OutputStream outstream = blob.getBinaryOutputStream();
    	ObjectOutputStream oos = new ObjectOutputStream(outstream);
	  	oos.writeObject(Sellerspec);
	    oos.flush();
      out.println("project id >>>>" +  tech_req_id + "<BR>");
      out.println("Send project Success>>> <BR>");
      ///---------query spec from database------------------///
      con.commit();
      String  username2    = (String)session.getValue("username");
      String  companyname2  = (String)session.getValue("companyname");
      session.invalidate();
      HttpSession session2 = req.getSession(true);
      session2.putValue("username",username2);
      session2.putValue("companyname",companyname2);
      resp.sendRedirect("LoginSuccess");
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
    out.println("</body>");
    out.println("</html>");
    out.flush();
    }

}
