import java.sql.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class GetImageCusS extends HttpServlet
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

  //String ID="project1";
 // String PROJECTNAME="project4";
  String RESERVIMAGE="";
  String homeimage="";
  String INDEXIMAGE="";
 // String ID;
//  int tmpID;
 	//----------------------get Data Session---------------
 // PROJECTNAME=req.getParameter("NAME");

 //--------------------------Data Base-------------------------------

	try {
        HttpSession session = req.getSession(true);
        //The value is saved in this client's session under
        //the name "tracker.username" and "tracker.password".
        homeimage = (String)session.getValue("tracker.homecurrent");
        //---- Create a Statement ----
        Statement stmt = conn.createStatement ();
        ResultSet rset;
        //(4)
 		    rset = stmt.executeQuery("SELECT indeximage FROM hometypedetail WHERE homeimage = '"+homeimage+"'");
        rset.next();
        INDEXIMAGE = Integer.toString(rset.getInt(1));
 		    rset = stmt.executeQuery("SELECT reservimage FROM IMAGE WHERE indeximage = '"+INDEXIMAGE+"'");
        rset.next();
        RESERVIMAGE = rset.getString(1);

        res.setContentType("text/plain");
        PrintWriter out = res.getWriter();
        out.println(RESERVIMAGE);
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

