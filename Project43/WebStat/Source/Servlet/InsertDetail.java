import java.sql.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class InsertDetail extends HttpServlet
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
  public void doPost(HttpServletRequest req, HttpServletResponse res)
                               throws ServletException, IOException {

    String New = "SELECT count(*) FROM Data";
    String NewId = "SELECT Id FROM Data WHERE Id >= All(SELECT Id FROM Data);";
    int Number=0;

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

    User=req.getParameter("txIdUser");
    Hour=req.getParameter("txTime");
  	Day=req.getParameter("txDay");
	  Date=req.getParameter("txDate");
  	Month=req.getParameter("txMonth");
	  Year=req.getParameter("txYear");
    BrowserName=req.getParameter("txBrowser");
  	Platform=req.getParameter("txPlatform");
	  ScreenWidth=req.getParameter("txScreenW");
  	ScreenHeight=req.getParameter("txScreenH");
	  Referer=req.getParameter("txReferer");
    OpSys=req.getParameter("txOs");
    Ver=req.getParameter("txVersion");

    long startMS = System.currentTimeMillis();


	  PrintWriter out = res.getWriter();

  HttpSession session = req.getSession(true);
  String adminlogin = (String)session.getValue("Adminname");
  String passwdlogin = (String)session.getValue("Adminpass");

  if ((!(adminlogin.equals("admin")))||(!(passwdlogin.equals("admin")))) {
    out.println("<html><head><body> Login Failed ....! </body></html>");
  } else {

	  try {
      if ((User.equals(""))||(Hour.equals(""))||(Day.equals(""))||(Day.equals(""))||(Date.equals(""))
      ||(Month.equals(""))||(Year.equals(""))||(BrowserName.equals(""))||(Platform.equals(""))
      ||(ScreenWidth.equals(""))||(ScreenHeight.equals(""))||(Referer.equals(""))||(OpSys.equals(""))
      ||(Ver.equals(""))) {
        out.println("<html><head><title>Data is missed...!</title></head><body><H1>Please, put data ...!<br>"+
        "You should back to re-put Data again.</h1></body></html>");
      } else {
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

        stmt.executeUpdate("INSERT INTO Data VALUES ("+"'"+Number+"'"+",'"+User+"'"+",'"+BrowserName+"'"+",'"
                                                           +Ver+"'"+",'"+Platform+"'"+",'"+ScreenWidth+"'"+",'"
											                                     +ScreenHeight+"'"+",'"+Hour+"'"+",'"+Day+"'"+",'"
                                                           +Date+"'"+",'"+Month+"'"+",'"+Year+"'"+",'"+OpSys+"'"+",'"+Referer+"')");
        out.println("<html><head><title>Data is missed...!</title></head><body>");
        out.println("Insert Ok");
        long elapsed = System.currentTimeMillis()-startMS;
        out.println("<br><h4>Total 0f Result = "+Number+"<br>Insert in "+elapsed+ " mS</i></h4>");
        out.println("</body></html>");
        res.setContentType("text/html");
      }
    } catch ( SQLException e ) {
      System.err.println("A database error occurred.");
    }
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

