import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class UpdateImageDbaS extends HttpServlet
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

 	String PROJECTID="";
  String RESERVIMAGE="";
 	//----------------------get Data Session---------------
  PROJECTID=req.getParameter("PROJECTID");
  RESERVIMAGE=req.getParameter("IMAGE");


 //--------------------------Data Base-------------------------------

	try {
        //---- Create a Statement ----
        Statement stmt = conn.createStatement ();
        PROJECTID =PROJECTID.trim();
        stmt.executeUpdate("UPDATE image SET reservimage ="+"'"+RESERVIMAGE+"'"+" WHERE projectid = '"+PROJECTID+"'");

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        out.println(PROJECTID);

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

