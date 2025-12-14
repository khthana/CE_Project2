import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class InsertSuggest extends HttpServlet
implements SingleThreadModel {

private Connection conn = null;
private Connection conn1 = null;
boolean NameIsExist=true;
public void init( ServletConfig config ) throws ServletException {
  super.init(config);
  try {
   Class.forName ("oracle.jdbc.driver.OracleDriver");
   conn  = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
   conn1 = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
   //Class.forName ("sun.jdbc.odbc.JdbcOdbcDriver");
	 //conn = DriverManager.getConnection("jdbc:odbc:projdb","","");
  } catch ( SQLException e ) {
  System.err.println("Could not establish connection.");
  } catch ( ClassNotFoundException e ) {
  System.err.println("Could not load database driver.");
  }
} // init
//-------------------------------Get Method------------------------------
public void doGet(HttpServletRequest req, HttpServletResponse res)
                               throws ServletException, IOException {
  String book_name="";
  //----------------------get Data Session---------------
  res.setContentType("text/html;charset=windows-874");
  PrintWriter out = res.getWriter();
  book_name=req.getParameter("book_name").trim();
  //--------------------------Data Base-------------------------------
  // Create a Statement
  try{
    Statement stmt  = conn.createStatement ();
    Statement stmt1 = conn1.createStatement ();
    //generate ID
    ResultSet rset1=null;
    rset1 = stmt1.executeQuery("select book_name from cartoon_details where book_name='"+book_name+"'");
    if(!rset1.next()){
       out.println("<HTML><HEAD><TITLE>Not Complete</TITLE></HEAD>");
	     out.println("<BODY  bgColor=\"#326698\" onload=scroll()>");
       out.println("<CENTER><b>Error Not Have Book Name</b><br><A href=\"http://myproject/jservlets/FormSuggest\"><b>Continue</b></A></CENTER>");
       out.println("</BODY></HTML>");
       NameIsExist=false;
    }else{
        //ResultSet rset = stmt.executeQuery("select max(id_book) from cartoon");
        //rset.next();Long tmp;
        //tmp=new Long(rset.getString("max(id_book)"));rset.next();
        //Insert new volume Cartoon
        stmt1.executeUpdate("INSERT INTO  cartoon_new  VALUES ('"+book_name+"')");
        out.println("<HTML><HEAD><TITLE>Complete</TITLE></HEAD>");
	      out.println("<BODY  bgColor=\"#326698\" onload=scroll()>");
        out.println("<CENTER><b>Complete</b><br><A href=\"http://myproject/jservlets/FormSuggest\"><b>Continue</b></A></CENTER>");
        out.println("</BODY></HTML>");
    }
  } catch ( SQLException e ) {
     out.println("<HTML><HEAD><TITLE>Already</TITLE></HEAD>");
	   out.println("<BODY  bgColor=\"#326698\" onload=scroll()>");
     out.println("<CENTER><b>Already</b><br><A href=\"http://myproject/jservlets/FormSuggest\"><b>Continue</b></A></CENTER>");
     out.println("</BODY></HTML>");
     System.err.println("A database error occurred.");
    }
   //---------------------Response User------------
}
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

