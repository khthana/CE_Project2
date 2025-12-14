import java.sql.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class GetImageS extends HttpServlet
implements SingleThreadModel {

private Connection conn = null;
public void init( ServletConfig config ) throws ServletException {
  super.init(config);
  try {
   Class.forName ("oracle.jdbc.driver.OracleDriver");
   conn = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:PROJECT","scott","tiger");
  } catch ( SQLException e ) {
  System.err.println("Could not establish connection.");
  } catch ( ClassNotFoundException e ) {
  System.err.println("Could not load database driver.");
  }
} // init

//-------------------------------Get Method------------------------------

public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

  String PROJECTNAME="";
  String RESERVIMAGE="";
  String projectID="";
  String pnumber="";
  String pamphur="";
  String pprovince="";
  String pzipcode="";
  String ptelephone="";
  String company="";
  String datestart="";
  String dateend="";
  int tmpID;
 	//----------------------get Data Session---------------
  PROJECTNAME=req.getParameter("NAME");
  PROJECTNAME = PROJECTNAME.trim();
 //--------------------------Data Base-------------------------------

	try {
        //---- Create a Statement ----
        Statement stmt = conn.createStatement ();
        ResultSet rset;
        rset = stmt.executeQuery("SELECT projectid,pnumber,pamphur,pprovince,pzipcode,ptelephone,company,datestart,dateend FROM PROJECT WHERE projectname = '"+PROJECTNAME+"'");

//        rset = stmt.executeQuery("SELECT projectid FROM PROJECT WHERE projectname = '"+PROJECTNAME+"'");

        rset.next();
        projectID = Integer.toString(rset.getInt(1));
        pnumber= rset.getString(2);
        pamphur=rset.getString(3);
        pprovince=rset.getString(4);
        pzipcode=rset.getString(5);
        ptelephone=rset.getString(6);
        company=rset.getString(7);
        datestart=rset.getString(8);
        dateend=rset.getString(9);
        rset = stmt.executeQuery("SELECT reservimage FROM IMAGE WHERE projectid = '"+projectID+"'");
        rset.next();
        RESERVIMAGE = rset.getString(1);
        res.setContentType("text/html;charset=windows-874");
        PrintWriter out = res.getWriter();
//        out.println(RESERVIMAGE);
        out.println(projectID+";"+pnumber+";"+pamphur+";"+pprovince+";"+pzipcode+";"+ptelephone+
                    ";"+company+";"+datestart+";"+dateend+"#"+RESERVIMAGE);
    } catch ( SQLException e ) {
    System.err.println("A database error occurred.");
    }


  } //doGet



 //-------------------Distroy----------------------
 public void destroy() {
 try {
 // close the database connection
  if ( conn != null) conn.close();
  } catch (SQLException e) {
     System.err.println("Error closing database connection.");
  }
 } // destroy
}

