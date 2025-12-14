import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class InsertProjectS extends HttpServlet
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
  String PNUMBER="";
  String PZIPCODE="";
  String PTELEPHONE="";
  String COMPANY="";
  String PAMPHUR="";
  String PPROVINCE="";
  String RESERVIMAGE="";
  String DATESTART="";
  String DATEEND="";
  int N_Row = 0;
  int projectID =101;
  int indeximage = 100001;
 	//----------------------get Data Session---------------
  ToUnicode t=new ToUnicode();
  PROJECTNAME=req.getParameter("PROJECTNAME");
  PNUMBER = req.getParameter("PNUMBER");
  PZIPCODE =req.getParameter("PZIPCODE");
  PTELEPHONE =req.getParameter("PTELEPHONE");
  COMPANY = req.getParameter("COMPANY");
  PAMPHUR = req.getParameter("PAMPHUR");
  PPROVINCE = req.getParameter("PPROVINCE");
  DATESTART = req.getParameter("DATESTART");
  DATEEND = req.getParameter("DATEEND");
  RESERVIMAGE=req.getParameter("RESERVIMAGE");


 //--------------------------Data Base-------------------------------

	try {
        //---- Create a Statement ----
        Statement stmt = conn.createStatement ();
        //---- Increment projectID and input projectname in HOMEPROJECT table ----//
        ResultSet rset;
        rset = stmt.executeQuery("SELECT count(*) FROM project");
	      rset.next();
        N_Row = rset.getInt(1);
        projectID = projectID+N_Row;
        indeximage = indeximage+N_Row;
        stmt.executeUpdate("INSERT INTO  project(projectid,projectname,pnumber,pamphur,pprovince,pzipcode,ptelephone,company,datestart,dateend) VALUES ("+"'"+
                                 projectID+"'"+",'"+PROJECTNAME+"','"+PNUMBER+"','"+PAMPHUR+"','"+
                                 PPROVINCE+"','"+PZIPCODE+"','"+PTELEPHONE+"','"+COMPANY+"','"+
                                 DATESTART+"','"+DATEEND+"')");
       // stmt.executeUpdate("INSERT INTO image(indeximage,RESERVIMAGE,PROJECTID) VALUES ("+"'"+indeximage+"',"+"'"+RESERVIMAGE+
        //                                                                                "'"+",'"+projectID+"'"+")");

        res.setContentType("text/html;charset=windows-874");
        PrintWriter out = res.getWriter();
        out.println("โครงการ Complete!");

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

