import java.sql.*;
import java.io.*;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.http.*;


public class ShowTopicFirstS extends HttpServlet
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

 	String TOPICREPLY="";
  String USERPOST="";
  String POSTREPLY="";
  String d="";
  int N_Row = 0;
  int TopicID =0;
//  int indeximage = 100001;
 	//----------------------get Data Session---------------
  ToUnicode t=new ToUnicode();

	try {
        //---- Create a Statement ----
        Statement stmt = conn.createStatement ();
        Statement stmt1 = conn.createStatement ();
        ResultSet rset;
        ResultSet rset1;
        rset = stmt.executeQuery("SELECT topicreply,userpost,datetopic,topicid FROM topicpost order by datetopic");
        res.setContentType("text/html;charset=windows-874");
        PrintWriter out = res.getWriter();
out.println( "<html>                                                                                                                                                                                                       ");
out.println("<head>                                                                                                                                                                                                        ");
out.println("<title>คุยเรื่องบ้าน</title>                                                                                                                                                                                  ");
out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">                                                                                                                                 ");
out.println("<style type=\"text/css\">                                                                                                                                                                                     ");
out.println("<!--                                                                                                                                                                                                          ");
out.println("body {  margin: 0px  0px; padding: 0px  0px}                                                                                                                                                                  ");
out.println("a:link { color: #005CA2; text-decoration: none}                                                                                                                                                               ");
out.println("a:visited { color: #005CA2; text-decoration: none}                                                                                                                                                            ");
out.println("a:active { color: #0099FF; text-decoration: underline}                                                                                                                                                        ");
out.println("a:hover { color: #0099FF; text-decoration: underline}                                                                                                                                                         ");
out.println("-->                                                                                                                                                                                                           ");
out.println("</style>                                                                                                                                                                                                      ");
out.println("<script language=\"JavaScript\">                                                                                                                                                                              ");
out.println("<!--                                                                                                                                                                                                          ");
out.println("function MM_reloadPage(init) {  //reloads the window if Nav4 resized                                                                                                                                          ");
out.println("  if (init==true) with (navigator) {if ((appName==\"Netscape\")&&(parseInt(appVersion)==4)) {                                                                                                                 ");
out.println("    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}                                                                                                                       ");
out.println("  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();                                                                                                                    ");
out.println("}                                                                                                                                                                                                             ");
out.println("MM_reloadPage(true);                                                                                                                                                                                          ");
out.println("// -->                                                                                                                                                                                                        ");
out.println("</script>                                                                                                                                                                                                     ");
out.println("</head>                                                                                                                                                                                                       ");
out.println("                                                                                                                                                                                                              ");
out.println("<body bgcolor=\"#FFFFFF\" text=\"#000000\" alink=\"#FF0000\" link=\"#333333\">                                                                                                                                ");
out.println("<table width=\"100%\" border=\"0\" cellspacing=\"3\" cellpadding=\" \" height=\"70\" bgcolor=\"#FFFFFF\">                                                                                                     ");
out.println("  <tr>                                                                                                                                                                                                        ");
out.println("    <td bgcolor=\"#000033\"> <img src=\"http://kling/html/image/ehomeproject3.gif\" width=\"283\" height=\"85\"></td>                                                                                ");
out.println("    <td bgcolor=\"#000033\">&nbsp;</td>                                                                                                                                                                       ");
out.println("    <td bgcolor=\"#000033\">&nbsp;</td>                                                                                                                                                                       ");
out.println("  </tr>                                                                                                                                                                                                       ");
out.println("</table>                                                                                                                                                                                                      ");
out.println("<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\">                                                                                                                                       ");
out.println("  <tr>                                                                                                                                                                                                        ");
out.println("    <td width=\"3%\">&nbsp; </td>                                                                                                                                                                             ");
out.println("    <td colspan=\"6\" width=\"97%\">                                                                                                                                                                          ");
out.println("      <div id=\"Layer1\" style=\"position:absolute; left:570px; top:95px; width:263px; height:104px; z-index:3\"><img src=\"http://kling/html/image/talkHome1.gif\" width=\"244\" height=\"115\"></div>");
out.println("      <div id=\"Layer2\" style=\"position:absolute; left:777px; top:27px; width:144px; height:158px; z-index:2\"><img src=\"http://kling/html/image/logo_webboard1.gif\" width=\"143\" height=\"158\"></div>");
out.println("      <style>A:link {                                                                                                                                                                                          ");
out.println("	COLOR: black; TEXT-DECORATION: none                                                                                                                                                                   ");
out.println("}                                                                                                                                                                                                             ");
out.println("A:visited {                                                                                                                                                                                                   ");
out.println("	COLOR: black; TEXT-DECORATION: none                                                                                                                                                                   ");
out.println("}                                                                                                                                                                                                             ");
out.println("A:hover {                                                                                                                                                                                                     ");
out.println("	COLOR: red; TEXT-DECORATION: none                                                                                                                                                                     ");
out.println("}                                                                                                                                                                                                             ");
out.println("</style>                                                                                                                                                                                                      ");
out.println("    </td>                                                                                                                                                                                                     ");
out.println("  </tr>                                                                                                                                                                                                       ");
out.println("  <tr>                                                                                                                                                                                                        ");
out.println("    <td width=\"3%\">&nbsp;</td>                                                                                                                                                                              ");
out.println("    <td colspan=\"6\" width=\"97%\">&nbsp;</td>                                                                                                                                                               ");
out.println("  </tr>                                                                                                                                                                                                       ");
out.println("  <tr>                                                                                                                                                                                                        ");
out.println("    <td width=\"3%\" height=\"29\">&nbsp;</td>                                                                                                                                                                ");
out.println("    <td height=\"29\" colspan=\"6\" width=\"97%\">&nbsp;</td>                                                                                                                                                 ");
out.println("  </tr>                                                                                                                                                                                                       ");
out.println("  <tr>                                                                                                                                                                                                        ");
out.println("    <td width=\"3%\" height=\"29\">&nbsp;</td>                                                                                                                                                                ");
out.println("    <td height=\"29\" colspan=\"6\" width=\"97%\"><a href=\"http://kling/html/TopicPost.html\"><img src=\"http://kling/html/image/postNew.jpg\" width=\"91\" height=\"21\" border=\"0\"></a></td>                      ");
out.println("  </tr>                                                                                                                                                                                                       ");
out.println("  <tr>                                                                                                                                                                                                        ");
out.println("    <td width=\"3%\" height=\"29\">&nbsp;</td>                                                                                                                                                                ");
out.println("    <td height=\"29\" colspan=\"6\" width=\"97%\">                                                                                                                                                            ");
out.println("      <table width=\"95%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\">                                                                                                                                  ");
out.println("        <tr>                                                                                                                                                                                                  ");
out.println("          <td width=\"3%\" bgcolor=\"#00B0DD\" align=\"center\"><font face=\"MS Sans Serif, Microsoft Sans Serif\" size=\"1\">N</font></td>                                                                   ");
out.println("          <td width=\"65%\" bgcolor=\"#00B0DD\"><font face=\"MS Sans Serif, Microsoft Sans Serif\" size=\"1\">Topic                                                                                           ");
out.println("            Message </font></td>                                                                                                                                                                              ");
out.println("          <td width=\"17%\" bgcolor=\"#00B0DD\"><font face=\"MS Sans Serif, Microsoft Sans Serif\" size=\"1\">Member</font></td>                                                                              ");
out.println("          <td width=\"3%\" bgcolor=\"#00B0DD\" align=\"center\"><font face=\"MS Sans Serif, Microsoft Sans Serif\" size=\"1\">R</font></td>                                                                   ");
out.println("          <td width=\"12%\" bgcolor=\"#00B0DD\"><font face=\"MS Sans Serif, Microsoft Sans Serif\" size=\"1\">Date                                                                                            ");
out.println("            Post</font></td>                                                                                                                                                                                  ");
out.println("        </tr>                                                                                                                                                                                                 ");
out.println("        <tr bgcolor=\"#C9C9C9\">                                                                                                                                                                              ");
out.println("		                                                                                                                                                                                              ");
out.println("<!--start -->                                                                                                                                                                                                 ");
  boolean NextRow;
  NextRow = rset.next();
  TOPICREPLY = rset.getString(1);
  USERPOST = rset.getString(2);
  d = rset.getString(3);
  TopicID = rset.getInt(4);
  while(NextRow)
  {
    TOPICREPLY = rset.getString(1);
    USERPOST = rset.getString(2);
    d = rset.getString(3);
    TopicID = rset.getInt(4);
    rset1 = stmt1.executeQuery("SELECT count(postreply) FROM replypost where topicid="+TopicID);
    rset1.next();
    int countReply =rset1.getInt(1);
    countReply--;
    out.println("          <td width=\"3%\" bgcolor=\"#C9C9C9\" align=\"center\">#</td>                                                                                                                                        ");
    out.println("          <td width=\"65%\" bgcolor=\"#EBECED\"><font face=\"Angsana New, AngsanaUPC\" size=\"2\"><a href=\"http://kling/test/ShowReplyS?TOPICID="+TopicID+"\">"+TOPICREPLY+"</a></font></td>                                         ");
    out.println("          <td width=\"17%\" bgcolor=\"#C9C9C9\">"+USERPOST+"</td>                                                                                                                                                    ");
    out.println("          <td width=\"3%\" bgcolor=\"#EBECED\" align=\"center\"><font face=\"Angsana New, AngsanaUPC\" size=\"3\">"+countReply+"</font></td>                                                                               ");
    out.println("          <td width=\"12%\" bgcolor=\"#C9C9C9\"><font face=\"Angsana New, AngsanaUPC\">"+d+"</font></td>                                                                                                                                                                       ");
    out.println("        </tr>                                                                                                                                                                                                 ");
    out.println("		                                                                                                                                                                                              ");
    NextRow = rset.next();
  }
out.println("<!--end -->                                                                                                                                                                                                   ");
out.println("      </table>                                                                                                                                                                                                ");
out.println("    </td>                                                                                                                                                                                                     ");
out.println("  </tr>                                                                                                                                                                                                       ");
out.println("</table>                                                                                                                                                                                                      ");
out.println("<table width=\"100%\" border=\"0\" cellspacing=\"5\" cellpadding=\" \">                                                                                                                                       ");
out.println("  <tr>                                                                                                                                                                                                        ");
out.println("    <td width=\"3%\">&nbsp;</td>                                                                                                                                                                              ");
out.println("    <td width=\"80%\">&nbsp;</td>                                                                                                                                                                             ");
out.println("    <td width=\"17%\">                                                                                                                                                                                        ");
out.println("      <div align=\"left\"><a href=\"alertLogin.html\"> </a></div>                                                                                                                                             ");
out.println("    </td>                                                                                                                                                                                                     ");
out.println("  </tr>                                                                                                                                                                                                       ");
out.println("</table>                                                                                                                                                                                                      ");
out.println("<div align=\"right\"></div>                                                                                                                                                                                   ");
out.println("</body>                                                                                                                                                                                                       ");
out.println("</html>																									   ");
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

