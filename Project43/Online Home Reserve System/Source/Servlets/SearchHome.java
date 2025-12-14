import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class SearchHome extends HttpServlet
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

	int N_Row=0;
	String HOMETYPE="";
  int Check=0;
  int i;
  int f=0;
  int db=0;
  int db_cut=0;
 

 	HOMETYPE=req.getParameter("HomeType");
	try {

		  	//---- Create a Statement ----
        Statement stmt = conn.createStatement ();
        //---- Create ID User ----
        res.setContentType("text/html;charset=windows-874");
	      PrintWriter out = res.getWriter();
	      out.println("<HTML><HEAD><TITLE>HomeProject</TITLE></HEAD>");
        out.println("<BODY>");
        ResultSet rset;

/*        rset = stmt.executeQuery("SELECT count(*) FROM customer");
	      rset.next();
        N_Row = rset.getInt(1);*/
out.println(HOMETYPE);
//out.println("HOMETYPEadad");

out.println("</body> ");
out.println("<!-- #EndTemplate --></html>");


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