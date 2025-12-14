import java.sql.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class SearchDetail extends HttpServlet
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

  String SEARCH = "SELECT * FROM Data WHERE ";
  int rowCount=0;
  boolean flag=false;
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
  String Bottom="";
  String Bottom1="";

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
  Bottom=req.getParameter("hidden");

  long startMS = System.currentTimeMillis();

	PrintWriter out = res.getWriter();
  res.setContentType("text/html");

  HttpSession session = req.getSession(true);
  String adminlogin = (String)session.getValue("Adminname");
  String passwdlogin = (String)session.getValue("Adminpass");
  if ((!(adminlogin.equals("admin")))||(!(passwdlogin.equals("admin")))) {
    out.println("<html><head><body> Login Failed ....! </body></html>");
  } else {

	try {
    if (!(Bottom.equals("Search"))) {
      SEARCH = SEARCH.substring(0,SEARCH.lastIndexOf(" WHERE "))+";";
    } else {
      if ((User.equals(""))&&(Hour.equals(""))&&(Day.equals(""))&&(Day.equals(""))&&(Date.equals(""))
      &&(Month.equals(""))&&(Year.equals(""))&&(BrowserName.equals(""))&&(Platform.equals(""))
      &&(ScreenWidth.equals(""))&&(ScreenHeight.equals(""))&&(Referer.equals(""))&&(OpSys.equals(""))
      &&(Ver.equals(""))) {
        flag = true;
        out.println("<html><head><title>Data is missed...!</title></head><body><H1>Please, put data ...!<br>"+
        "You should back to re-put Data again.</h1></body></html>");
      } else {
        if (!(User.equals(""))) SEARCH += "IdUser = '"+ User +"' and ";
        if (!(Hour.equals(""))) SEARCH += "Time = '"+ Hour +"' and ";
        if (!(Day.equals(""))) SEARCH += "Day = '"+ Day +"' and ";
        if (!(Date.equals(""))) SEARCH += "Date = '"+ Date +"' and ";
        if (!(Month.equals(""))) SEARCH += "Month = '"+ Month +"' and ";
        if (!(Year.equals(""))) SEARCH += "Year = '"+ Year +"' and ";
        if (!(BrowserName.equals(""))) SEARCH += "Browser = '"+ BrowserName +"' and ";
        if (!(Platform.equals(""))) SEARCH += "Platform = '"+ Platform +"' and ";
        if (!(ScreenWidth.equals(""))) SEARCH += "ScreenWidth = '"+ ScreenWidth +"' and ";
        if (!(ScreenHeight.equals(""))) SEARCH += "ScreenHeight = '"+ ScreenHeight +"' and ";
        if (!(Referer.equals(""))) SEARCH += "Referer = '"+ Referer +"' and ";
        if (!(OpSys.equals(""))) SEARCH += "OS = '"+ OpSys +"' and ";
        if (!(Ver.equals(""))) SEARCH += "Version = '"+ Ver +"' and ";

        SEARCH = SEARCH.substring(0,SEARCH.lastIndexOf(" and"))+";";
        }
      }
      if(!flag) {
     // Create a Statement
        out.println("<html><head>");
        out.println("<title>Result Search</title>");
        out.println("</head>");
        out.println("<h2><center> Search Result Detail");
        out.println("</center></h2><br>");

        Statement stmt = conn.createStatement();
        rs = stmt.executeQuery(SEARCH);
        rowCount = createTable(rs,out);

        long elapsed = System.currentTimeMillis()-startMS;
        out.println("<br><h4>Total 0f Result = <i>"+rowCount+" rows in "+elapsed+ " mS</i></h4>");
        out.println("</html>");
      }
    } catch ( SQLException e ) {
      System.err.println("A database error occurred.");
    } catch (Exception e) {
      out.println("Exception");
    }
  }
    //---------------------Response User------------
//    out.println("<br>"+SEARCH);
}
  //-------------------Distroy----------------------

  private int createTable(java.sql.ResultSet rs,java.io.PrintWriter out) throws Exception {
    int rowCount = 0;

    out.println("<center><table border>");

    ResultSetMetaData rsmd = rs.getMetaData();
    int columnCount = rsmd.getColumnCount();

    columnCount--;
    out.println("<tr>");

    for(int i=0;i<columnCount;i++)
      out.println("<th>"+rsmd.getColumnLabel(i+2)+"</tr>");

    while(rs.next()) {
      rowCount++;
      out.println("<tr>");
      for(int i=0;i<columnCount;i++)
        out.println("<td>"+rs.getString(i+2)+"</td>");
      out.println("</tr>");
    }
    out.println("</table></center>");

    return rowCount;
  }

  public void destroy() {
  try {
 // close the database connection
   if ( conn != null) conn.close();
   } catch (SQLException e) {
     System.err.println("Error closing database connection.");
   }
  } // destroy
}

