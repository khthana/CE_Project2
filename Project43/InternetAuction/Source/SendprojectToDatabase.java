
import oracle.sql.*;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import oracle.jdbc.driver.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class SendprojectToDatabase extends HttpServlet implements Serializable
{
    public synchronized void   doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
      java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
      Connection con = null;
      Statement stmt = null;
      ResultSet rs= null;
      resp.setContentType("text/html");
      HttpSession session = req.getSession(true);
      Specification spectest = new Specification();
      spectest = (Specification)session.getValue(session.getId());
      String Str_name        = MTThai.MS874ToUnicode(spectest.name) ;
      String Str_companyname = MTThai.MS874ToUnicode(spectest.company_name) ;
      String Str_projectname = MTThai.MS874ToUnicode(spectest.projectname);
      String Str_description = MTThai.MS874ToUnicode(spectest.projectdescription);
      int Int_Maxprice       = spectest.Maxprice ;
      String Str_date        = spectest.Enddate;
      String  username2    = (String)session.getValue("username");

      if (username2 == null)
          resp.sendRedirect("../Pleaselogin.html");
      String Cancel_project = req.getParameter("Cancel");
      if (Cancel_project != null )
      {
       String  username    = (String)session.getValue("username");
       String companyname  = (String)session.getValue("companyname");
       session.invalidate();
       System.out.println("username is "+ username) ;
       System.out.println("companyname is "+ companyname) ;
       HttpSession session2 = req.getSession(true);
       session2.putValue("username",username);
       session2.putValue("companyname",companyname);
       resp.sendRedirect("LoginSuccess");
      }
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Show Member List</title>");
      out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
      out.println("</head>");
      out.println("<body bgcolor=\"#FFFFFF\">");
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
      //////----Find Max spec_id-----///
      String max_projectid = new String("select max(tech_req_id) from buyer_tech_req");
    	rs = stmt.executeQuery(max_projectid);
    	rs.next();
    	int maxID = rs.getInt(1);
    	maxID++;
      //////----Insert EMPTY_BLOB------////
      String insert ;
      insert  = "insert into buyer_tech_req(tech_req_id,username,company_name,project_name,project_desc,maxprice,end_date,project_spec,finished)" ;
      insert  += "values("+maxID+","+ "'" + Str_name + "'" + "," + "'" + Str_companyname + "'" + "," + "'" + Str_projectname + "'" + "," ;
      insert  += "'" +  Str_description + "'" + "," + Int_Maxprice + "," + "to_date('" + Str_date + "','DD/MM/YYYY HH24:MI')" + ","+ "empty_BLOB()" + ",'no')" ;
    	out.println("string insert >>>  "   + insert);
    	rs  = stmt.executeQuery(insert);
      BLOB blob;
     	String cmd = new String("SELECT tech_req_id,project_spec FROM buyer_tech_req WHERE tech_req_id ="+maxID);
    	rs = stmt.executeQuery(cmd);
    	rs.next();
      out.println(rs.getString("tech_req_id"));
    	blob = ((OracleResultSet)rs).getBLOB(2);
 	    OutputStream outstream = blob.getBinaryOutputStream();
    	ObjectOutputStream oos = new ObjectOutputStream(outstream);
	  	oos.writeObject(spectest);
	    oos.flush();


      out.println("project id >>>>" +  maxID + "<BR>");
      out.println("Send project Success>>> <BR>");
      ///---------query spec from database------------------///
      con.commit();
      String  username    = (String)session.getValue("username");
      String companyname  = (String)session.getValue("companyname");
      session.invalidate();
      HttpSession session2 = req.getSession(true);
      session2.putValue("username",username);
      session2.putValue("companyname",companyname);
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
