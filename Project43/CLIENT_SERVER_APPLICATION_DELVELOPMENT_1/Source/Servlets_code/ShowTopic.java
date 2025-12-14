import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class ShowTopic extends HttpServlet
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
  String BSubject="";
  String BName="";
  String BEmail="";
  String BTitle="";
  ToUnicode t=new ToUnicode();
	//----------------------get Data Session---------------
  BSubject=req.getParameter("BSubject");
 	BName=req.getParameter("BName");
	BEmail=req.getParameter("BEmail");
  BTitle=req.getParameter("BTitle");
 //--------------------------Data Base--------------------
 //-----------------------Read Data Subject---------------
 try {
    Statement stmt = conn.createStatement();
    Statement stmt1 = conn.createStatement();
    ResultSet rset = stmt.executeQuery("select * from SUBJECT_POST order by DATE_POST desc");
    ResultSet replyRset=null;
  //---------------------Response User------------
    res.setContentType("text/html;charset=windows-874");
	  PrintWriter out = res.getWriter();

//---------------------------------------------------------------------------

/* <html>
<head>
<title>Un title page</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
body {  margin: 0px  0px; padding: 0px  0px}
a:link { color: #005CA2; text-decoration: none}
a:visited { color: #005CA2; text-decoration: none}
a:active { color: #0099FF; text-decoration: underline}
a:hover { color: #0099FF; text-decoration: underline}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%" border="0" cellspacing="0">
  <tr>
    <td height="62" align="center" valign="bottom"><font color="#FF9900" face="Georgia, Times New Roman, Times, serif"><b><img src="option_images/WebBoard.gif" width="395" height="59"></b></font></td>
  </tr>
  <tr>
    <td height="46">
      <table width="100%" border="0" cellspacing="0">
        <tr>
          <td width="2%" height="36" valign="top">&nbsp;</td>
          <td width="14%" height="36" valign="bottom"><a href="http://myproject/WebSubject.html"><img src="option_images/newtopic.gif" width="97" height="33" border="0"></a></td>
          <td width="84%" height="36">&nbsp; </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="3" cellspacing="2">
        <tr>
          <td align="center" width="4%" bgcolor="#339999">&nbsp;</td>
          <td width="12%" bgcolor="#339999" align="center"><b><font color="#000000">Created</font></b></td>
          <td width="46%" align="center" bgcolor="#339999"><b>Topic</b></td>
          <td width="18%" align="center" bgcolor="#339999"><b>Topic Starter</b></td>
          <td width="4%" align="center" bgcolor="#339999"><b>R</b></td>
          <td width="16%" align="center" bgcolor="#339999"><b>Last Post</b></td>
        </tr>
        <tr>
          <td align="center" width="4%" bgcolor="#EBEBEB"><img src="option_images/isupdate.gif" width="16" height="16"></td>
          <td width="12%" bgcolor="#CCCCCC" align="center">xxx</td>
          <td width="46%" bgcolor="#EBEBEB">xxx</td>
          <td width="18%" bgcolor="#CCCCCC">xxx</td>
          <td width="4%" bgcolor="#EBEBEB" align="center">x</td>
          <td width="16%" bgcolor="#CCCCCC" align="center">xxx</td>
        </tr>
        <tr>
          <td align="center" width="4%" bgcolor="#EBEBEB"><img src="option_images/isupdate.gif" width="16" height="16"></td>
          <td width="12%" bgcolor="#CCCCCC" align="center">xxx</td>
          <td width="46%" bgcolor="#EBEBEB">xxx</td>
          <td width="18%" bgcolor="#CCCCCC">xxx</td>
          <td width="4%" bgcolor="#EBEBEB" align="center">x</td>
          <td width="16%" bgcolor="#CCCCCC" align="center">xxx</td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center" height="40"><font face="Verdana, Arial, Helvetica, sans-serif" color="#339999"><b><i><img src="option_images/CartoonOnline.gif" width="201" height="35"><img src="option_images/pika1.gif" width="58" height="76"></i></b></font></td>
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>
*/

//-------------------------------------------------------------------------------
	  out.println("<HTML><HEAD><TITLE>ขอเชิญเข้าร่วมแลกเปลี่ยนความคิดเห็น</TITLE></HEAD>");
	  out.println("<BODY text=#000000 bgColor=white onload=scroll()>");
    out.println("<STYLE>A:link {	COLOR: black; TEXT-DECORATION: none }"+
"           A:visited {COLOR: black; TEXT-DECORATION: none }"+
"           A:hover { COLOR: red; TEXT-DECORATION: none}"+
"    </STYLE>");
    out.println(""+
//-------------------------------------------------------
"   <table width=\"100%\" border=\"0\" cellspacing=\"0\">"+
"  <tr>                                                                                                                                                                                                  "+
"    <td height=\"62\" align=\"center\" valign=\"bottom\"><font color=\"#FF9900\" face=\"Georgia, Times New Roman, Times, serif\"><b><img src=\"option_images/WebBoard.gif\" width=\"395\" height=\"59\"></b></font></td>"+
"  </tr>                                                                                                                                                                                                 "+
"  <tr>                                                                                                                                                                                                  "+
"    <td height=\"46\">                                                                                                                                                                                    "+
"      <table width=\"100%\" border=\"0\" cellspacing=\"0\">                                                                                                                                                   "+
"        <tr>                                                                                                                                                                                            "+
"          <td width=\"2%\" height=\"36\" valign=\"top\">&nbsp;</td>                                                                                                                                           "+
"          <td width=\"14%\" height=\"36\" valign=\"bottom\"><a href=\"http://myproject/WebSubject.html\"><img src=\"option_images/newtopic.gif\" width=\"97\" height=\"33\" border=\"0\"></a></td>                     " +
"          <td width=\"84%\" height=\"36\">&nbsp; </td>                                                                                                                                                      "+
"        </tr>                                                                                                                                                                                           "+
"      </table>                                                                                                                                                                                          "+
"    </td>                                                                                                                                                                                               "+
"  </tr>                                                                                                                                                                                                 "+
"  <tr>                                                                                                                                                                                                  "+
"    <td>                                                                                                                                                                                                "+
"      <table width=\"100%\" border=\"3\" cellspacing=\"2\">                                                                                                                                                   "+
"        <tr>                                                                                                                                                                                            "+
"          <td align=\"center\" width=\"4%\" bgcolor=\"#339999\">&nbsp;</td>                                                                                                                                   "+
"          <td width=\"12%\" bgcolor=\"#339999\" align=\"center\"><b><font color=\"#000000\">Created</font></b></td>                                                                                             "+
"          <td width=\"46%\" align=\"center\" bgcolor=\"#339999\"><b>Topic</b></td>                                                                                                                            "+
"          <td width=\"18%\" align=\"center\" bgcolor=\"#339999\"><b>Topic Starter</b></td>                                                                                                                    "+
"          <td width=\"4%\" align=\"center\" bgcolor=\"#339999\"><b>R</b></td>                                                                                                                                 "+
"          <td width=\"16%\" align=\"center\" bgcolor=\"#339999\"><b>Last Post</b></td>                                                                                                                        "+
"        </tr>                                                                                                                                                                                           "
);


  /*  <tr>
          <td align="center" width="4%" bgcolor="#EBEBEB"><img src="option_images/isupdate.gif" width="16" height="16"></td>
          <td width="12%" bgcolor="#CCCCCC" align="center">xxx</td>
          <td width="46%" bgcolor="#EBEBEB">xxx</td>
          <td width="18%" bgcolor="#CCCCCC">xxx</td>
          <td width="4%" bgcolor="#EBEBEB" align="center">x</td>
          <td width="16%" bgcolor="#CCCCCC" align="center">xxx</td>
        </tr>     */
    boolean bb;
    bb = rset.next();
    String TopicName="";
    java.util.Date date;
    Long tmp;
    while(bb){
        tmp=new Long(rset.getLong("DATE_POST")+"");
        date=new java.util.Date(tmp.longValue());
        out.println("<tr>");
        out.println("<td align=\"center\" width=\"4%\" bgcolor=\"#EBEBEB\"><img src=\"option_images/isupdate.gif\" width=\"16\" height=\"16\"></td>");
        out.println("<td width=\"12%\" bgcolor=\"#CCCCCC\" align=\"center\"><FONT size=2>"+date.toLocaleString().substring(0,date.toLocaleString().indexOf(","))+"</FONT></td>");
        TopicName=rset.getString("SUBJECT");
        out.println(""+
"<td width=\"46%\" bgcolor=\"#EBEBEB\">"+
"<FONT size=2><A target=\"_blank\""+
"     href=\"http://myproject/jservlets/ShowReply?TopicName="+TopicName+"\">"+TopicName+"</A></FONT></td>");
        out.println("<td width=\"18%\" bgcolor=\"#CCCCCC\"><FONT size=2>"+rset.getString("NAME")+"</FONT></td>");
        //----------------------------- ReplyNumber---------------------
        replyRset=stmt1.executeQuery("select count(*) from REPLY where TOPIC='"+TopicName+"'");
        replyRset.next();
        out.println("<td width=\"4%\" bgcolor=\"#EBEBEB\" align=\"center\"><FONT size=2>"+(replyRset.getInt(1)-1)+"</FONT></td>");
        replyRset.next();
        //----------------------------- Last Reply-------------------
        replyRset=stmt1.executeQuery(""+
          "select DATE_POST from REPLY where "+
          "(TOPIC='"+TopicName+"')and(DATE_POST>=all(select "+
          "DATE_POST from REPLY where TOPIC='"+TopicName+"'))"
        );
        replyRset.next();
        tmp=new Long(replyRset.getLong(1)+"");
        date=new java.util.Date(tmp.longValue());
        out.println("<td width=\"16%\" bgcolor=\"#CCCCCC\" align=\"center\"><FONT size=2><FONT color=#800080 size=2>"+date.toLocaleString()+"</FONT></FONT></td>");
        replyRset.next();
        bb = rset.next();
        out.println("</tr>");
    }
    //----------------------------------------------------
out.println(""+
"     </table>         "+
"     </td>            "+
"   </tr>              "+
"   <tr>               "+
"     <td>&nbsp;</td>  "+
"   </tr>              "+
"   <tr>               "+
"     <td align=\"center\" height=\"40\"><font face=\"Verdana, Arial, Helvetica, sans-serif\" color=\"#339999\"><b><i><img src=\"option_images/CartoonOnline.gif\" width=\"201\" height=\"35\"><img src=\"option_images/pika1.gif\" width=\"58\" height=\"76\"></i></b></font></td>"+
"   </tr>        "+
" </table>       "+
" <p>&nbsp;</p>  "+
" <p>&nbsp;</p>  "+
" <p>&nbsp;</p>  "+
" <p>&nbsp;</p>  "+
" <p>&nbsp;</p>  "+
" <p>&nbsp;</p>  "+
" </body>        "+
" </html>"
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

