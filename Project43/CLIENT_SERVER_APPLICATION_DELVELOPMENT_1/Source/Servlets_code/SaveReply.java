import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class SaveReply extends HttpServlet
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
  String ABody="";
  String AName="";
  String AEmail="";
  String ATopic="";
	//----------------------get Data Session---------------
  res.setContentType("text/html;charset=windows-874");
  //res.setContentType("text/html; charset=UTF-8");
  ToUnicode t=new ToUnicode();
  ATopic=t.toUnicode(req.getParameter("ATopic"));
  AName=t.toUnicode(req.getParameter("AName"));
	AEmail=t.toUnicode(req.getParameter("AEmail"));
  ABody=t.toUnicode(req.getParameter("ABody"));
 //--------------------------Data Base-------------------------------
    // Create a Statement
  try{
    Statement stmt = conn.createStatement ();
    // insert row
    java.util.Date date=new java.util.Date();
    stmt.executeUpdate("INSERT INTO "+"REPLY"+" VALUES ("+"'"+AName+"'"+",'"+ATopic+"',"+"'"+ABody+"'"+","+date.getTime()+""+",'"+AEmail+"'"+",'"+"n"+"'"+")");
  } catch ( SQLException e ) {
     System.err.println("A database error occurred.");
    }
   //---------------------Response User------------
	  PrintWriter out = res.getWriter();
    out.println(""+
"<html>"+
"<head>"+
"<title>Untitled Document</title>"+
"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">"+
"</head>"+
"<body bgcolor=\"#FFFFFF\">"+
"<p>&nbsp;</p>"+
"<p align=\"center\"><img src=\"option_images/ReplyComplete.gif\" width=\"296\" height=\"50\" align=\"middle\"></p>"+
"<p align=\"center\"><a href=\"http://myproject/jservlets/ShowReply?TopicName="+ATopic+"\"><img src=\"option_images/BackotRead.gif\" width=\"135\" height=\"35\" border=\"0\"></a>"+
"</p>"+
"<p>&nbsp;</p>"+
"</body>"+
"</html>"
);


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

