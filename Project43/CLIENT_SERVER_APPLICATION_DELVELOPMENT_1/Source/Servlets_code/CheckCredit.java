import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class CheckCredit extends HttpServlet
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
  String UserName="";
  String Password="";
  //----------------------get Data Session---------------
  UserName=req.getParameter("UserName");
  Password=req.getParameter("Password");
 //--------------------------Data Base--------------------
 //-----------------------Read Data Subject---------------
 try {
    Statement stmt = conn.createStatement();
    ResultSet rset = stmt.executeQuery("select cradit from users where users='"+UserName+"' and password='"+Password+"'");
  //---------------------Response User------------
    res.setContentType("text/html;charset=windows-874");
    PrintWriter out = res.getWriter();
    if(rset.next()){
       out.println(""+
"       <html>                   "+
"<head>                          "+
"<title>Untitled Document</title>"+
"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">"+
"</head>                                                                 "+
"                                                                        "+
"<body bgcolor=\"#99cccc\">                                                "+
"<p>&nbsp;</p>                                                           "+
"<p>&nbsp;</p>                                                           "+
"<div align=\"center\"></div>                                              "+
"<table width=\"75%\" border=\"0\">                                          "+
"  <tr>                                                                  "+
"    <td width=\"30%\">&nbsp;</td>                                         "+
"    <td width=\"70%\">                                                    "+
"      <table width=\"99%\" border=\"1\">                                    "+
"        <tr>                                                            "+
"          <td width=\"59%\">                                              "+
"            <div align=\"center\"><b><font color=\"#000000\" size=\"5\">Your Credit"+
"              :</font></b></div>                                             "+
"          </td>                                                              "+
"          <td width=\"41%\">                                                   "+
"            <div align=\"center\"><font size=\"5\"><b>"+rset.getString(1)+"</b></font></div>       "+
"          </td>                                                              "+
"        </tr>                                                                "+
"      </table>                                                               "+
"    </td>                                                                    "+
"  </tr>                                                                      "+
"</table>                                                                     "+
"</body>                                                                      "+
"</html>                                                                      "

       );
    }else{
     out.println(""+
"<html>                                                                   "+
"<head>                                                                   "+
"<title>Untitled Document</title>                                         "+
"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> "+
"</head>                                                                  "+
"                                                                         "+
"<body bgcolor=\"#99cccc\" onLoad=\"\">                                       "+
"<div align=\"center\">                                                     "+
"  <p>&nbsp;</p>                                                          "+
"  <p>&nbsp;</p>                                                          "+
"  <p><a href=\"http://myproject/CheckCredit.html\"><img src=\"option_images/loginerror_o.gif\" width=\"325\" height=\"132\" border=\"0\"></a>"+
"  </p>                                                                                                                             "+
"</div>                                                                                                                             "+
"</body>                                                                                                                            "+
"</html>                                                                                                                            "
     );
    }
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

