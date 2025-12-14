import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class SendDetailS extends HttpServlet
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
  String IMAGEHOME="";
  String IMAGEMAP="";
  String DETAIL="";
  String PROJECTID="";
  String INDEXIMAGE="";
  String CONDITION="";
 	//----------------------get Data Session---------------
  PROJECTNAME=req.getParameter("PROJECTNAME");
  IMAGEHOME=req.getParameter("IMAGEHOME");
  IMAGEMAP=req.getParameter("IMAGEMAP");
  DETAIL=req.getParameter("DETAIL");
  CONDITION = req.getParameter("CONDITION");

 //--------------------------Data Base-------------------------------

	try {
        //---- Create a Statement ----
        Statement stmt = conn.createStatement ();
        ResultSet rset;
        rset = stmt.executeQuery("SELECT Projectid FROM project WHERE projectname = '"+PROJECTNAME+"'");
	      rset.next();
        PROJECTID = rset.getString(1);
        stmt.executeUpdate("UPDATE hometypedetail SET homeimage = '"+IMAGEHOME+"',homedetail='"+DETAIL+"' WHERE projectid = '"+PROJECTID+"'");
        stmt.executeUpdate("UPDATE image SET mapimage = '"+IMAGEMAP+"' WHERE projectid = '"+PROJECTID+"'");

        rset = stmt.executeQuery("SELECT indeximage FROM image WHERE projectid = '"+PROJECTID+"'");
	      rset.next();
        INDEXIMAGE = rset.getString(1);

        stmt.executeUpdate("UPDATE home SET homeimage = '"+IMAGEHOME+"', indeximage = '"+INDEXIMAGE+"' WHERE projectid = '"+PROJECTID+"'");
        stmt.executeUpdate("UPDATE project SET condition = '"+CONDITION+"' WHERE projectid = '"+PROJECTID+"'");


        res.setContentType("text/html;charset=windows-874");
        PrintWriter out = res.getWriter();
        out.println("Adding home detail Complete");
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

