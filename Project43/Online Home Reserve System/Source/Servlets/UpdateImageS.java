import java.sql.*;
import java.io.*;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.http.*;


public class UpdateImageS extends HttpServlet
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

  String RESERVIMAGE="";
  String homeimage="";
  String INDEXIMAGE="";
  RESERVIMAGE=req.getParameter("IMAGE");


 //--------------------------Data Base-------------------------------

	try {
        HttpSession session = req.getSession(true);
        //The value is saved in this client's session under
        String Susername = (String)session.getValue("tracker.username");
        String Spassword = (String)session.getValue("tracker.password");
        homeimage = (String)session.getValue("tracker.homecurrent");
        //---- Create a Statement ----
        Statement stmt = conn.createStatement ();
        //---- Increment projectID and input projectname in HOMEPROJECT table ----//
        ResultSet rset;
        RESERVIMAGE = RESERVIMAGE.trim();
//        int Index = Integer.parseInt(IndexImage);
		    rset = stmt.executeQuery("SELECT indeximage FROM hometypedetail where homeimage='"+homeimage+"'");
	      rset.next();
        INDEXIMAGE = Integer.toString(rset.getInt(1));

        stmt.executeUpdate("UPDATE image SET reservimage ="+"'"+RESERVIMAGE+"'"+" WHERE indeximage = '"+INDEXIMAGE+"'");

        res.setContentType("text/html;charset=windows-874");
        PrintWriter out = res.getWriter();
        out.println(INDEXIMAGE);

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

