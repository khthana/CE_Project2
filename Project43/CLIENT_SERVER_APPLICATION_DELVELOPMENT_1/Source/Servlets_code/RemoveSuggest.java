import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class RemoveSuggest extends HttpServlet
implements SingleThreadModel {

private Connection conn = null;
public void init( ServletConfig config ) throws ServletException {
  super.init(config);
  try {
   Class.forName ("oracle.jdbc.driver.OracleDriver");
   conn = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
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
  String c1[]=new String[100];
  //--------------------------Data Base--------------------
  //-----------------------Read Data Subject---------------
 try {
    Statement stmt = conn.createStatement();
    for(int i=1;i<100;i++){
       if(req.getParameter("c"+i)!=null)
       stmt.executeUpdate("delete from cartoon_new where book_name ='"+req.getParameter("c"+i)+"'");
    }
    //---------------------Response User------------
    res.setContentType("text/html;charset=windows-874");
    PrintWriter out = res.getWriter();
    out.println("<HTML><HEAD><TITLE>ลบการ์ตูนใหม่ที่แนะนำ</TITLE></HEAD>");
	  out.println("<body bgcolor=\"#326698\"><center><b>Remove Complete"+
"<br><A href=\"http://myproject/jservlets/FormSuggest\">Continue</A></b></center></body>      "+
"</html>      "
);

  } catch ( SQLException e ) {
     System.err.println("A database error occurred.");
     }
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

