import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class InsertContactS extends HttpServlet
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

public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

 	String FLNAME="";
  String EMAIL="";
  String HEAD="";
  String MESSAGE="";
  int CUSTOMERID;
  String temp="";
  int N_Row = 0;
  int conID =0;
//  int indeximage = 100001;
 	//----------------------get Data Session---------------
  ToUnicode t=new ToUnicode();
  FLNAME=t.toUnicode(req.getParameter("FLNAME"));
  EMAIL = t.toUnicode(req.getParameter("CONEMAIL"));
  HEAD =t.toUnicode(req.getParameter("HEAD"));
  MESSAGE =t.toUnicode(req.getParameter("MESSAGE"));


 //--------------------------Data Base-------------------------------

	try {
        //---- Create a Statement ----
        Statement stmt = conn.createStatement ();
        ResultSet rset;
        HttpSession session = req.getSession(true);
        String Susername = (String)session.getValue("tracker.username");
        temp = Susername;
        String Spassword = (String)session.getValue("tracker.password");
        if(temp == null) CUSTOMERID = 0;
        else
            {
              rset = stmt.executeQuery("SELECT customerid FROM customer where username='"+Susername+"' and password = '"+Spassword+"'");
	            rset.next();
              CUSTOMERID = rset.getInt(1);
            }

        rset = stmt.executeQuery("SELECT count(*) FROM contactask");
	      rset.next();
        N_Row = rset.getInt(1);
        conID = N_Row;
        conID++;
        FLNAME  =FLNAME.trim();
        EMAIL   =EMAIL.trim();
        HEAD    =HEAD.trim();
        MESSAGE =MESSAGE.trim();
        stmt.executeUpdate("INSERT INTO  contactask VALUES ("+"'"+conID+"'"+",'"+FLNAME+"','"+EMAIL+"','"+HEAD+"','"+MESSAGE+"','"+CUSTOMERID+"')");
        res.setContentType("text/html;charset=windows-874");
        PrintWriter out = res.getWriter();
        out.println(conID+FLNAME+EMAIL+HEAD+MESSAGE);

      } catch ( SQLException e ) {
        System.err.println("A database error occurred.");
      }


  } //doPost



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

