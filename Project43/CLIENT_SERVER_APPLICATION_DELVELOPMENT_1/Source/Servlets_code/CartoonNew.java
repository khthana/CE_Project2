import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class CartoonNew extends HttpServlet
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
public void doGet(HttpServletRequest req, HttpServletResponse res)
                               throws ServletException, IOException {
   ToUnicode t=new ToUnicode();
 //--------------------------Data Base--------------------
 //-----------------------Read Data Subject---------------
 try {
    Statement stmt = conn.createStatement();
    Statement stmt1 = conn.createStatement();
    ResultSet rset = stmt.executeQuery("select * from cartoon_new");
    ResultSet rset1= null;
  //---------------------Response User------------
    res.setContentType("text/html;charset=windows-874");
	  PrintWriter out = res.getWriter();

//-------------------------------------------------------------------------------
    String book_name,book_name_t,BOOK_PATH,BOOK_DESC;
out.println("<BASE HREF=\"http://myproject/\">");
out.println("     <html> ");
out.println("<head>      ");
out.println("<title>Un title page</title> ");
out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">");
out.println("<style type=\"text/css\">                     ");
out.println("</style>                                      ");
out.println("</head>                                       ");
out.println("<body bgcolor=\"#326698\" link=\"#FFCC00\" >  ");
out.println("<table width=\"68%\" >                        ");
out.println("  <tr>                                        ");
out.println("    <td width=\"22%\"><a href=\"first.html\" target=\"_self\"><img src=\"images/global_home.gif\" width=\"43\" height=\"20\" border=\"0\"></a></td>");
out.println("    <td width=\"20%\"><img src=\"images/global_newr.gif\" width=\"43\" height=\"20\"></td>                                                         ");
out.println("    <td width=\"32%\"><a href=\"http://myproject/jservlets/ShowTopic\" target=\"_blank\"><img src=\"images/global_web.gif\" width=\"91\" height=\"20\" border=\"0\"></a></td>");
out.println("    <td width=\"26%\"><a href=\"download.html\" target=\"_self\"><img src=\"images/global_down.gif\" width=\"91\" height=\"20\" border=\"0\"></a></td> ");
out.println("  </tr>                           ");
out.println("  <tr>                            ");
out.println("    <td width=\"22%\">&nbsp;</td> ");
out.println("    <td width=\"20%\">&nbsp;</td> ");
out.println("    <td width=\"32%\">&nbsp;</td> ");
out.println("    <td width=\"26%\">&nbsp;</td> ");
out.println("  </tr>");
out.println("</table>");
out.println("<p><font color=\"#FFFF00\" size=\"6\"><b><font face=\"Angsana New, AngsanaUPC\">การ์ตูนใหม่");
out.println("  </font><font size=\"6\" color=\"#FFFF00\"><b><font face=\"Angsana New, AngsanaUPC\">และ  ");
out.println("  การ์ตูนน่าอ่าน</font></b></font></b></font></p>                                          ");
 while(rset.next()){
          book_name=rset.getString(1).trim();
          rset1=stmt1.executeQuery("select book_name_t,BOOK_PATH,BOOK_DESC from cartoon_details where book_name='"+book_name+"'");
          rset1.next();
          book_name_t=rset1.getString("book_name_t").trim();
          BOOK_PATH=rset1.getString("BOOK_PATH").trim();
          BOOK_DESC=rset1.getString("BOOK_DESC").trim();
out.println("<table width=\"100%\" border=\"1\">                                                        ");
out.println("  <tr>                                                                                     ");
out.println("    <td height=\"204\"><a href=\"http://myproject/jservlets/OpenDemo?book_name="+book_name+"\"><img src=\"/Images/"+BOOK_PATH+"/demo.jpg\" width=\"240\" height=\"280\" border=\"0\"></a></td>     ");
out.println("  </tr>                                                                                                                                                                                 ");
out.println("  <tr>                                                                                                                                                                                  ");
out.println("    <td height=\"8\" bgcolor=\"#0099CC\">                                                                                                                                               ");
out.println("      <div align=\"center\"><b><font size=\"5\" color=\"#FFFF00\">เรื่อง</font><font size=\"6\">                                                                                        ");
out.println("        </font><font size=\"5\"><font color=\"#FFFFFF\"><a href=\"http://myproject/jservlets/OpenDemo?book_name="+book_name+"\"><font size=\"4\">"+book_name_t+"</font></a></font></font></b></div>  ");
out.println("    </td>                                                                                                                                                                               ");
out.println("  </tr>                                                                                                                                                                                 ");
out.println("  <tr>                                                                              ");
out.println("    <td bgcolor=\"#660000\" height=\"79\" valign=\"top\" align=\"left\"><font color=\"#FFFFFF\" size=\"4\">"+BOOK_DESC+"</font></td>");
out.println("  </tr>");
out.println("</table>");
out.println("<p>&nbsp;</p>");
}
out.println("</body>");
out.println("</html>");
//out.println(rset1.getString("book_name_t")+","+rset1.getString("BOOK_PATH")+","+rset1.getString("BOOK_DESC")+"<br>");
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

