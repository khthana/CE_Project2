import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class GetProNameS extends HttpServlet
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

 	String ProjectName="";
  String temp="";
  String Pnumber="";
//  IMAGE=req.getParameter("IMAGE");


 //--------------------------Data Base-------------------------------

	try {
        //---- Create a Statement ----
        Statement stmt = conn.createStatement ();
        ResultSet rset;
        rset = stmt.executeQuery("SELECT projectname,pnumber FROM project ORDER BY projectname");
	      while (rset.next())
        {
           Pnumber=rset.getString(2);
           if(Pnumber != null)
           {
             temp = rset.getString(1)+";";
             temp = temp.trim();
             ProjectName = ProjectName+temp;
           }
        }
        res.setContentType("text/html;charset=windows-874");
        PrintWriter out = res.getWriter();
        out.println(ProjectName);

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

