import java.sql.*;
import java.io.*;
//import java.net.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class ReceiveData extends HttpServlet
implements SingleThreadModel {

private Connection conn = null;
private ResultSet rs = null;

public void init( ServletConfig config ) throws ServletException {
  super.init(config);
  try {
   Class.forName ("sun.jdbc.odbc.JdbcOdbcDriver");
	 conn = DriverManager.getConnection("jdbc:odbc:database","","");
  } catch ( SQLException e ) {
  System.err.println("Could not establish connection.");
  } catch ( ClassNotFoundException e ) {
  System.err.println("Could not load database driver.");
  }
} // init
//-------------------------------Get Method------------------------------
  public void doGet(HttpServletRequest req, HttpServletResponse res)
                               throws ServletException, IOException {

  String New = "SELECT count(*) FROM Data";
  int Number=0;
  String NewId = "SELECT Id FROM Data WHERE Id >= All(SELECT Id FROM Data);";
//  int LenString=0;
//  int TempLen=0;

	String User="";
  String Hour="";
  String Day="";
	String Date="";
  String Month="";
  String Year="";
	String BrowserName="";
	String Platform="";
	String ScreenWidth="";
	String ScreenHeight="";
	String Referer="";
  String OpSys = "";
  String Ver="";

  User=req.getParameter("idUser");
  Hour=req.getParameter("hour");
	Day=req.getParameter("day");
	Date=req.getParameter("date");
	Month=req.getParameter("month");
	Year=req.getParameter("year");
  BrowserName=req.getParameter("name");
	Platform=req.getParameter("appPlatform");
	ScreenWidth=req.getParameter("screenWidth");
	ScreenHeight=req.getParameter("screenHeight");
	Referer=req.getParameter("referrer");
  OpSys=req.getParameter("os");
  Ver=req.getParameter("version");

	try {

     // Create a Statement
     Statement stmt = conn.createStatement();
     // insert row
       rs = stmt.executeQuery(New);
       rs.next();
       Number = rs.getInt(1);
       if (Number == 0) Number = 1;
       else {
         rs = stmt.executeQuery(NewId);
         rs.next();
         Number = rs.getInt(1);
         Number++;
       }

//       stmt.executeUpdate("INSERT INTO Table1 VALUES ('"+Number+"','"+Name +"','b')");
 	    stmt.executeUpdate("INSERT INTO Data VALUES ("+"'"+Number+"'"+",'"+User+"'"+",'"+BrowserName+"'"+",'"
                                                           +Ver+"'"+",'"+Platform+"'"+",'"+ScreenWidth+"'"+",'"
											                                     +ScreenHeight+"'"+",'"+Hour+"'"+",'"+Day+"'"+",'"
                                                           +Date+"'"+",'"+Month+"'"+",'"+Year+"'"+",'"+OpSys+"'"+",'"+Referer+"')");
//    stmt.executeUpdate("INSERT INTO Data VALUES ('"+Number+"',2,'5','male','10','589','123','23','name','10','589','123','23','name')");
    } catch ( SQLException e ) {
    System.err.println("A database error occurred.");
    }
    //---------------------Response User------------

	res.setContentType("text/html");
  }
/*
  static String ReadFile(String Url)  {
    String inPut=new String("");
    FileInputStream s;
    int readVar;

    try {
      s = new FileInputStream("www.txt");
      readVar = 0;
      //--------------------Read File to String-----------
      while (readVar != -1) {
        try {
          readVar = s.read();
          inPut+=(char)readVar;
        } catch (IOException e){
          System.out.println("Unknown IO error reading file " + File);
          System.exit(2);
        }
      }
//      inPut = inPut.substring(inPut.indexOf("?"),1);
    } catch (FileNotFoundException e) {
      System.out.println("File " + File + " not found");
      System.exit(1);
    }
    System.out.println();
    return inPut;
  }
*/
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

