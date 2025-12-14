import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class OldDetail extends HttpServlet
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
  String HOMEIMAGE="";
  String INDEXIMAGE="";
  String DETAIL="";
  String PROJECTID="";
  String MAPIMAGE = "";
  String CONDITION = "";
 	//----------------------get Data Session---------------
  PROJECTNAME=req.getParameter("PROJECTNAME");


 //--------------------------Data Base-------------------------------

	try {
        //---- Create a Statement ----
        Statement stmt = conn.createStatement ();
        ResultSet rset;
        PROJECTNAME = PROJECTNAME.trim();
        rset = stmt.executeQuery("SELECT projectid,condition FROM project WHERE projectname = '"+PROJECTNAME+"'");
	      rset.next();
        PROJECTID = rset.getString(1);
        CONDITION = rset.getString(2);
        rset = stmt.executeQuery("SELECT homedetail,homeimage,indeximage FROM hometypedetail WHERE projectid = '"+PROJECTID+"'");
        rset.next();
        DETAIL =  rset.getString(1);
        HOMEIMAGE = rset.getString(2);
        INDEXIMAGE = rset.getString(3);
        rset = stmt.executeQuery("SELECT mapimage FROM image WHERE indeximage = '"+INDEXIMAGE+"'");
        rset.next();
        MAPIMAGE = rset.getString(1);

        res.setContentType("text/html;charset=windows-874");
        PrintWriter out = res.getWriter();
        out.println(HOMEIMAGE+"/"+MAPIMAGE+"/"+CONDITION+"/"+DETAIL);
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

