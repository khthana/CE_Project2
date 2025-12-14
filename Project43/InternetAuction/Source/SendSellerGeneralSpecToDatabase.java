import oracle.sql.*;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import oracle.jdbc.driver.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
public class SendSellerGeneralSpecToDatabase extends HttpServlet implements Serializable
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
      String Spec_type    = req.getParameter("Spec_type");
      String Price        = req.getParameter("Seller_price");
      String Detail       = MTThai.MS874ToUnicode(req.getParameter("Detial"));
      Specification Seller_General_Spec = (Specification)session.getValue("Seller_spec");
      String username = (String)session.getValue("username") ;
      String companyname = (String)session.getValue("companyname");
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Show Member List</title>");
      out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
      out.println("</head>");
      out.println("<body bgcolor=\"#FFFFFF\">");
      String CurDay       =  new Integer(Calendar.getInstance().get(Calendar.DATE)).toString() ;
      String CurMonth     =  new Integer(Calendar.getInstance().get(Calendar.MONTH)+1).toString() ;
      String CurYear      =  new Integer(Calendar.getInstance().get(Calendar.YEAR)).toString() ;
      String CurMin       =  new Integer(Calendar.getInstance().get(Calendar.MINUTE)).toString() ;
      String CurHour      =  new Integer(Calendar.getInstance().get(Calendar.HOUR_OF_DAY)).toString() ;
      String time = CurDay + "/" + CurMonth + "/" + CurYear + " " + CurHour + ":" + CurMin ;




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
      /////--------Delete old data--------/////
      String delete ;
      delete = "delete from seller_standard_spec where spec_type = '" + Spec_type  +"'";
      delete += " and username ='" + username + "'" ;
     	out.println("string delete >>>  "   + delete);
    	rs  = stmt.executeQuery(delete);
      out.println("<br>");
      String max_projectid = new String("select max(spec_id) from seller_standard_spec");
    	rs = stmt.executeQuery(max_projectid);
    	rs.next();
    	int max_id = rs.getInt(1);
    	max_id++;
      /////--------insert new EMPTY_BLOB()--------/////
      String insert ;
      insert = "insert into seller_standard_spec(seller_spec,spec_type,standard_price,username,company,detail,spec_id,last_update)";
      insert += " values(empty_BLOB(),'" + Spec_type + "',"+ Price + ",'" + username + "','" + companyname + "','"+ Detail + "',"+ max_id ;
      insert += "," + "to_date('" + time + "','" + "DD/MM/YYYY HH24:MI'))";

    	out.println("string insert >>>  "   + insert);
    	rs  = stmt.executeQuery(insert);
      BLOB blob;
      /////--------insert new Data--------/////
      String select = "Select seller_spec from seller_standard_spec" ;
      select += " where spec_type = '"+ Spec_type + "' and username = '" + username + "' and spec_id = " + max_id ;
    	out.println("string select >>>  "   + select);
    	rs = stmt.executeQuery(select);
      out.println("<br>");
    	rs.next();
    	blob = ((OracleResultSet)rs).getBLOB(1);
 	    OutputStream outstream = blob.getBinaryOutputStream();
    	ObjectOutputStream oos = new ObjectOutputStream(outstream);
	  	oos.writeObject(Seller_General_Spec);
	    oos.flush();
      out.println("<br>");
 	    out.println("Send Seller General Spec Success>>> <BR>");
      ///---------query spec from database------------------///
      con.commit();
      resp.sendRedirect("LoginSuccess");
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
    out.println("</body>");
    out.println("</html>");
    out.flush();
    }

}
