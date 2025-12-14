import java.sql.*;
import java.io.*;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.http.*;


public class DeleteReservS extends HttpServlet
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

  String CUSTOMERID="";
 //--------------------------Data Base-------------------------------

	try {
        HttpSession session = req.getSession(true);
        //The value is saved in this client's session under
        String Susername = (String)session.getValue("tracker.username");
        String Spassword = (String)session.getValue("tracker.password");
//        IndexImage = (String)session.getValue("tracker.homecurrent");*/
        //---- Create a Statement ----
        Statement stmt = conn.createStatement ();
        //---- Increment projectID and input projectname in HOMEPROJECT table ----//
        ResultSet rset;
        rset = stmt.executeQuery("SELECT customerid FROM customer where username='"+Susername+"' and password = '"+Spassword+"'");
	      rset.next();
        CUSTOMERID = Integer.toString(rset.getInt(1));
        stmt.executeUpdate("DELETE FROM reservation where customerid = "+CUSTOMERID);

        res.setContentType("text/html;charset=windows-874");
        PrintWriter out = res.getWriter();
        out.println(CUSTOMERID);
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

