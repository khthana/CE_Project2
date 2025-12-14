import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class NeverReserv extends HttpServlet
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

	String homeimage="";

  String CUSTOMERID="";
  String PROJECTID="";
  int N_Row = 0;
  boolean already = false;
  res.setContentType("text/html;charset=windows-874");
  PrintWriter out = res.getWriter();
//	homeimage=req.getParameter("HOME");
	try {
        //Get the current session object,creat one if necessary
        HttpSession session = req.getSession(true);
        //The value is saved in this client's session under
        //the name "tracker.username" and "tracker.password".
        String Susername = (String)session.getValue("tracker.username");
        String Spassword = (String)session.getValue("tracker.password");
        homeimage = (String)session.getValue("tracker.homecurrent");

	  	  	//---- Create a Statement ----
        Statement stmt = conn.createStatement ();
        ResultSet rset;
   		  rset = stmt.executeQuery("SELECT customerid FROM customer WHERE username = '"+Susername+"' and password = '"+Spassword+"'");
        rset.next();
        CUSTOMERID  = rset.getString(1);

   		  rset = stmt.executeQuery("SELECT projectid FROM hometypedetail where homeimage = '"+homeimage+"'");
        rset.next();
        PROJECTID = rset.getString(1);
   		  rset = stmt.executeQuery("SELECT * FROM reservation where customerid = '"+CUSTOMERID+"' and projectid = '"+PROJECTID+"'");
        if (rset.next())  already = true;

        out.println(already);

    } catch ( SQLException e ) {
    System.err.println("A database error occurred.");
    }    //---------------------Response User------------


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