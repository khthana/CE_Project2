import java.sql.*;
import java.io.*;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.http.*;


public class InsertReservS extends HttpServlet
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

  String selectX="";
  String selectY="";
  String homeimage="";
  String CUSTOMERID="";
  String HOMEID="";
  String PROJECTID="";
  String INDEXIMAGE="";
  int XPosition;
  int YPosition;

  int N_Row = 0;
  int IDReserv =0;
 	//----------------------get Data Session---------------
  ToUnicode t=new ToUnicode();
  selectX=req.getParameter("SELECTx");
  selectY=req.getParameter("SELECTy");
//  Image=req.getParameter("IMAGE");


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
        XPosition = Integer.parseInt(selectX);
        YPosition = Integer.parseInt(selectY);
	     //(5)
        rset = stmt.executeQuery("SELECT customerid FROM customer where username='"+Susername+"' and password = '"+Spassword+"'");
	      rset.next();
        CUSTOMERID = Integer.toString(rset.getInt(1));
        //(6)
		    rset = stmt.executeQuery("SELECT indeximage,projectid FROM hometypedetail where homeimage='"+homeimage+"'");
	      rset.next();
        INDEXIMAGE = Integer.toString(rset.getInt(1));
        PROJECTID = Integer.toString(rset.getInt(2));

		    rset = stmt.executeQuery("SELECT homeid FROM home where projectid='"+PROJECTID+"' and indeximage='"+INDEXIMAGE+"' and xposition = '"+XPosition+"'and yposition='"+YPosition+"'");
	      rset.next();
        HOMEID = Integer.toString(rset.getInt(1));

        Date DateReserv = new java.util.Date();
        String d = DateReserv.toLocaleString();
        //(7)
 		    stmt.executeUpdate("INSERT INTO "+"reservation"+" VALUES ("+"'"+CUSTOMERID+"','"+HOMEID+"','"+PROJECTID+"','"+INDEXIMAGE+"','"+d+"')");
        stmt.executeUpdate("UPDATE home SET statusreserv ='ถูกจอง' WHERE homeid = '"+HOMEID+"'");

        res.setContentType("text/html;charset=windows-874");
        PrintWriter out = res.getWriter();
//        out.println(ProjectName);
//        out.println(XPosition+","+YPosition);
//        out.println(CUSTOMERID+";"+HOMEID+";"+PROJECTID+";"+INDEXIMAGE+";"+DateReserv);
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

