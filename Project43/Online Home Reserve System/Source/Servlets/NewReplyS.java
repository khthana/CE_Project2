import java.sql.*;
import java.io.*;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.http.*;


public class NewReplyS extends HttpServlet
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

  String TOPICID="";
  ToUnicode t=new ToUnicode();
  TOPICID = t.toUnicode(req.getParameter("TOPICID"));

	try {
        //---- Create a Statement ----
        Statement stmt = conn.createStatement ();
        ResultSet rset;

        res.setContentType("text/html;charset=windows-874");
        PrintWriter out = res.getWriter();
out.println( "<html>                                                                                                                                                                                            ");
out.println("<head>                                                                                                                                                                                             ");
out.println("<title>Un title page</title>                                                                                                                                                                       ");
out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">                                                                                                                      ");
out.println("<style type=\"text/css\">                                                                                                                                                                          ");
out.println("<!--                                                                                                                                                                                               ");
out.println("body {  margin: 0px  0px; padding: 0px  0px}                                                                                                                                                       ");
out.println("a:link { color: #005CA2; text-decoration: none}                                                                                                                                                    ");
out.println("a:visited { color: #005CA2; text-decoration: none}                                                                                                                                                 ");
out.println("a:active { color: #0099FF; text-decoration: underline}                                                                                                                                             ");
out.println("a:hover { color: #0099FF; text-decoration: underline}                                                                                                                                              ");
out.println("-->                                                                                                                                                                                                ");
out.println("</style>                                                                                                                                                                                           ");
out.println("</head>                                                                                                                                                                                            ");
out.println("                                                                                                                                                                                                   ");
out.println("<body bgcolor=\"#FFFFFF\">                                                                                                                                                                         ");
out.println("<table width=\"100%\" border=\"0\" cellspacing=\"3\" cellpadding=\" \" height=\"70\" bgcolor=\"#FFFFFF\">                                                                                          ");
out.println("  <tr>                                                                                                                                                                                             ");
out.println("    <td bgcolor=\"#000033\"> <img src=\"http://kling/html/image/ehomeproject3.gif\" width=\"283\" height=\"85\"></td>                                                                              ");
out.println("    <td bgcolor=\"#000033\">&nbsp;</td>                                                                                                                                                            ");
out.println("    <td bgcolor=\"#000033\">&nbsp;</td>                                                                                                                                                            ");
out.println("  </tr>                                                                                                                                                                                            ");
out.println("</table>                                                                                                                                                                                           ");
out.println("<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\">                                                                                                                            ");
out.println("  <tr>                                                                                                                                                                                             ");
out.println("    <td width=\"1%\">&nbsp; </td>                                                                                                                                                                  ");
out.println("    <td colspan=\"6\">                                                                                                                                                                             ");
out.println("      <div id=\"Layer1\" style=\"position:absolute; left:570px; top:95px; width:263px; height:104px; z-index:3\"><img src=\"http://kling/html/image/talkHome1.gif\" width=\"244\" height=\"115\"></div>");
out.println("      <div id=\"Layer2\" style=\"position:absolute; left:777px; top:27px; width:144px; height:158px; z-index:2\"><img src=\"http://kling/html/image/logo_webboard1.gif\" width=\"143\" height=\"158\"></div>");
out.println("      <style>A:link {                                                                                                                                                                               ");
out.println("	COLOR: black; TEXT-DECORATION: none                                                                                                                                                        ");
out.println("}                                                                                                                                                                                                  ");
out.println("A:visited {                                                                                                                                                                                        ");
out.println("	COLOR: black; TEXT-DECORATION: none                                                                                                                                                        ");
out.println("}                                                                                                                                                                                                  ");
out.println("A:hover {                                                                                                                                                                                          ");
out.println("	COLOR: red; TEXT-DECORATION: none                                                                                                                                                          ");
out.println("}                                                                                                                                                                                                  ");
out.println("</style>                                                                                                                                                                                           ");
out.println("    </td>                                                                                                                                                                                          ");
out.println("  </tr>                                                                                                                                                                                            ");
out.println("  <tr>                                                                                                                                                                                             ");
out.println("    <td width=\"1%\">&nbsp;</td>                                                                                                                                                                   ");
out.println("    <td colspan=\"6\">&nbsp;</td>                                                                                                                                                                  ");
out.println("  </tr>                                                                                                                                                                                            ");
out.println("  <tr>                                                                                                                                                                                             ");
out.println("    <td width=\"1%\" height=\"29\">&nbsp;</td>                                                                                                                                                     ");
out.println("    <td height=\"29\" colspan=\"6\">&nbsp;</td>                                                                                                                                                    ");
out.println("  </tr>                                                                                                                                                                                            ");
out.println("  <form name=\"form1\" method=\"get\" action=\"http://kling/test/SaveReplyS\">                                                                                                                     ");
out.println("    <tr>                                                                                                                                                                                           ");
out.println("      <td width=\"1%\" height=\"29\">&nbsp;</td>                                                                                                                                                   ");
out.println("      <td height=\"29\" colspan=\"5\"> </td>                                                                                                                                                       ");
out.println("      <td height=\"29\" width=\"85%\" valign=\"bottom\"><font face=\"MS Sans Serif, Microsoft Sans Serif\" size=\"2\"><b><font color=\"#0066FF\" size=\"1\">Post                                   ");
out.println("        reply </font></b></font></td>                                                                                                                                                              ");
out.println("    </tr>                                                                                                                                                                                          ");
out.println("    <tr>                                                                                                                                                                                           ");
out.println("      <td width=\"1%\" height=\"29\">&nbsp;</td>                                                                                                                                                   ");
out.println("      <td height=\"29\" colspan=\"6\" align=\"center\">                                                                                                                                            ");
out.println("        <table cellspacing=0 cellpadding=0 border=0>                                                                                                                                               ");
out.println("          <tbody>                                                                                                                                                                                  ");
out.println("          <tr valign=top>                                                                                                                                                                          ");
out.println("            <td width=112 bgcolor=#d5e6e1><font face=\"MS Sans Serif\" color=#000080                                                                                                               ");
out.println("      size=2><br>                                                                                                                                                                                  ");
out.println("              </font></td>                                                                                                                                                                         ");
out.println("            <td width=616 bgcolor=#d5e6e1></td>                                                                                                                                                    ");
out.println("          </tr>                                                                                                                                                                                    ");
out.println("          <tr valign=top>                                                                                                                                                                          ");
out.println("            <td width=112 bgcolor=#d5e6e1>                                                                                                                                                         ");
out.println("              <div align=center><b><font face=\"MS Sans Serif\" size=\"2\">จากคุณ:                                                                                                                 ");
out.println("                </font></b></div>                                                                                                                                                                  ");
out.println("            </td>                                                                                                                                                                                  ");
out.println("            <td width=616 bgcolor=#d5e6e1><font size=2>                                                                                                                                            ");
out.println("              <input name=userreply>                                                                                                                                                               ");
out.println("              </font></td>                                                                                                                                                                         ");
out.println("          </tr>                                                                                                                                                                                    ");
out.println("          <tr valign=top bgcolor=\"#d5e6e1\">                                                                                                                                                      ");
out.println("            <td width=112>                                                                                                                                                                         ");
out.println("              <div align=center><b><font face=\"MS Sans Serif\" size=\"2\">ข้อความ                                                                                                                 ");
out.println("                : </font></b></div>                                                                                                                                                                ");
out.println("            </td>                                                                                                                                                                                  ");
out.println("            <td width=616><font size=2>                                                                                                                                                            ");
out.println("              <textarea name=postreply rows=10 cols=80></textarea>                                                                                                                                 ");
out.println("              </font></td>                                                                                                                                                                         ");
out.println("          </tr>                                                                                                                                                                                    ");
out.println("          <tr valign=top>                                                                                                                                                                          ");
out.println("            <td width=112 bgcolor=#d5e6e1>                                                                                                                                                         ");
out.println("              <div align=center><b></b></div>                                                                                                                                                      ");
out.println("            </td>                                                                                                                                                                                  ");
out.println("            <td valign=center width=616 bgcolor=#d5e6e1><font face=\"MS Sans Serif\" size=2>                                                                                                       ");
out.println("              <input type=\"submit\" name=\"Submit\" value=\"Submit\">                                                                                                                             ");
out.println("              </font><font size=2>                                                                                                                                                                 ");
out.println("              <input type=\"reset\" name=\"Reset\" value=\"Reset\">                                                                                                                                ");
out.println("              </font></td>                                                                                                                                                                         ");
out.println("          </tr>                                                                                                                                                                                    ");
out.println("          <tr valign=top>                                                                                                                                                                          ");
out.println("            <td width=112 bgcolor=#dedfdf>                                                                                                                                                         ");
out.println("              <div align=center><b></b></div>                                                                                                                                                      ");
out.println("            </td>                                                                                                                                                                                  ");
out.println("            <td valign=center width=616 bgcolor=#dedfdf><font face=\"MS Sans Serif\" size=2>                                                                                                       ");
out.println("              </font><font size=2> </font></td>                                                                                                                                                    ");
out.println("          </tr>                                                                                                                                                                                    ");
out.println("          <tr valign=top>                                                                                                                                                                          ");
out.println("            <td width=112 bgcolor=#dedfdf></td>                                                                                                                                                    ");
out.println("            <td width=616 bgcolor=#dedfdf>                                                                                                                                                         ");
out.println("              <div align=center><font face=\"MS Sans Serif\" size=2> </font></div>                                                                                                                 ");
out.println("            </td>                                                                                                                                                                                  ");
out.println("          </tr>                                                                                                                                                                                    ");
out.println("          <tr valign=top>                                                                                                                                                                          ");
out.println("            <td width=112 bgcolor=#dedfdf><font face=\"MS Sans Serif\"                                                                                                                             ");
out.println("    size=2><br>                                                                                                                                                                                    ");
out.println("              </font></td>                                                                                                                                                                         ");
out.println("            <td width=616 bgcolor=#dedfdf></td>                                                                                                                                                    ");
out.println("<input type=\"hidden\" name=\"TOPICID\" value=\""+TOPICID+"\">");
out.println("          </tr>                                                                                                                                                                                    ");
out.println("          </tbody>                                                                                                                                                                                 ");
out.println("        </table>                                                                                                                                                                                   ");
out.println("      </td>                                                                                                                                                                                        ");
out.println("    </tr>                                                                                                                                                                                          ");
out.println("  </form>                                                                                                                                                                                          ");
out.println("</table>                                                                                                                                                                                           ");
out.println("<div align=\"right\"></div>                                                                                                                                                                        ");
out.println("</body>                                                                                                                                                                                            ");
out.println("</html>																								");


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

