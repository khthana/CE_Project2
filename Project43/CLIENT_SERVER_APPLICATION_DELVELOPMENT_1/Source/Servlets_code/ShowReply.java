import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class ShowReply extends HttpServlet
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
  String TopicName="";
  ToUnicode t=new ToUnicode();
	//----------------------get Data Session---------------
  TopicName=req.getParameter("TopicName");
 //--------------------------Data Base--------------------
 //-----------------------Read Data Subject---------------
 try {
    Statement stmt = conn.createStatement();
    ResultSet rset = stmt.executeQuery("select * from REPLY where TOPIC="+"'"+TopicName+"'"+" order by DATE_POST");
  //---------------------Response User------------
    res.setContentType("text/html;charset=windows-874");
    //res.setContentType("text/html; charset=UTF-8");
    //res.setContentType("text/html");
	  PrintWriter out = res.getWriter();
    out.println("<HTML><HEAD><TITLE>ขอเชิญเข้าร่วมแลกเปลี่ยนความคิดเห็น</TITLE></HEAD>");
	  out.println("<body bgcolor=\"#6699CC\">");
    boolean bb;
    bb = rset.next();
out.println("<table width=\"98%\" border=\"0\" cellspacing=\"0\" height=\"655\">                                                                                       "+
"  <tr>                                                                                                                                                        "+
"    <td align=\"center\" height=\"72\" valign=\"bottom\" width=\"5%\">&nbsp;</td>                                                                                     "+
"    <td align=\"center\" height=\"72\" valign=\"bottom\" width=\"95%\"><img src=\"option_images/TopicReply.gif\" width=\"278\" height=\"44\"></td>                          "+
"  </tr>                                                                                                                                                       "+
"  <tr>                                                                                                                                                        "+
"    <td width=\"5%\" height=\"32\">&nbsp;</td>                                                                                                                    "+
"    <td width=\"95%\" height=\"32\">&nbsp;</td>                                                                                                                   "+
"  </tr>                                                                                                                                                       "+
"  <tr>                                                                                                                                                        "+
"    <td height=\"184\" valign=\"top\" align=\"center\" width=\"5%\">&nbsp;</td>                                                                                       "+
"    <td height=\"184\" valign=\"top\" align=\"left\" width=\"95%\">                                                                                                   "+
"      <table cellspacing=0 cellpadding=4 width=\"87%\" border=2 height=\"101%\">                                                                                  "+
"        <tbody>                                                                                                                                               "+
"        <tr bgcolor=#d5e6e1 valign=\"middle\">                                                                                                                  "+
"          <td width=\"18%\" bgcolor=\"#FF9999\" height=\"13\" align=\"left\"><font color=#000080size=1><b><font color=\"#000000\" size=\"3\">Subject</font></b></font>    "+
"            : </td>                                                                                                                                           "+
"          <td bgcolor=\"#FF9999\" height=\"13\"><font color=\"#000080\" size=\"3\">"+TopicName+"</font></td>                                                            "+
"        </tr>"
);
    java.util.Date date;
    Long tmp;
    tmp=new Long(rset.getLong(4)+"");
        date=new java.util.Date(tmp.longValue());
        out.println(""+
        "<tr bgcolor=#dedfdf>"+
        "<td valign=middle width=\"18%\" height=\"21\" bgcolor=\"#FF9900\"><img src=\"option_images/mark.gif\" width=\"16\" height=\"18\"></td>"+
        "<td height=\"21\" align=\"left\" bgcolor=\"#CCCCFF\" valign=\"middle\"><img src=\"option_images/reply.gif\" width=\"20\" height=\"19\"><font color=\"#800080\" size=\"3\">"+
        "posted "+
        //--------------Print Date Post--------------
        ""+date.toLocaleString()+"&nbsp;</font></font></td></tr>"+
               "<tr bgcolor=#dedfdf>"+
               "<td valign=top width=\"18%\" height=\"104\" bgcolor=\"#FFCCCC\">"+rset.getString(1)+"<br>"+
               "<font color=#000080 size=2><b>"+
               "<A href=\"mailto:"+rset.getString(5)+"\">"+
               "<img src=\"option_images/mailto.gif\" width=\"26\" height=\"21\" border=\"0\"></A></b></font>"+
               "</td>"+
               "<td height=\"104\" valign=\"top\" bgcolor=\"#cccccc\"><font color=#800080 size=2>&nbsp;&nbsp;"+
               "</font> <font size=\"3\">"+rset.getString(3)+"</font>"+
               "            <p align=right>&nbsp;</p>"+
               "          </td>"+
               "        </tr>"+
               "        </tbody>"+
               "      </table>"+
               "    </td>"+
               "  </tr>"+
               "<tr>"+
               "   <td height=\"36\" width=\"5%\">&nbsp;</td>"+
               "   <td height=\"36\" width=\"95%\">&nbsp; </td>"+
               "</tr>"
         );
         bb = rset.next();
    while(bb){
        tmp=new Long(rset.getLong(4)+"");
        date=new java.util.Date(tmp.longValue());
        out.println(""+
                "<tr>"+
                "<td valign=\"top\" align=\"center\" width=\"5%\" height=\"130\">&nbsp;</td>"+
                "<td valign=\"top\" align=\"left\" width=\"95%\" height=\"130\">"+
                "<table cellspacing=0 cellpadding=0 width=\"87%\" border=2 height=\"144\">"+
                "<tr bgcolor=#f7f7f7>"+
                "<td valign=middle width=\"18%\" height=\"31\" bgcolor=\"#FF9900\"><img src=\"option_images/mark.gif\" width=\"16\" height=\"18\"></td>"+
                "<td height=\"31\" bgcolor=\"#CCCCFF\" valign=\"middle\"><img src=\"option_images/reply.gif\" width=\"20\" height=\"19\"><font color=#800080 size=2>"+
                "<font size=\"3\">posted"
               );
        //--------------Print Date Post--------------
        out.println(""+date.toLocaleString()+"&nbsp;</font></td>"+
               "  </tr>   "+
               "  <tbody> "+
               "<tr bgcolor=#f7f7f7>"+
               "<td valign=top width=\"18%\" height=\"100\" bgcolor=\"#FFCCCC\"><font color=#000080 size=2><b><font size=\"3\">"+
               rset.getString(1)+"</font></b></font><br>"+
               "<font color=#000080 size=2><b>"+
               "<A href=\"mailto:"+rset.getString(5)+"\">"+
               "<img src=\"option_images/mailto.gif\" width=\"26\" height=\"21\" border=\"0\"></A></b></font>"+
               "</td>"+
               "<td height=\"100\" valign=\"top\" bgcolor=\"#CCCCCC\"><font color=#800080 size=2><font size=\"3\">&nbsp;</font>&nbsp;&nbsp;"+
               "</font> <font size=\"3\">"+rset.getString(3)+"</font>"+
               "<p align=right>&nbsp;</p>"+
               "</td>"+
               "</tr>"+
               "</tbody>"+
               "</table>"+
               "</td>"+
               "</tr>"+
               "<tr>"+
               "<td height=\"27\" width=\"5%\">&nbsp;</td>"+
               "<td height=\"27\" width=\"95%\">&nbsp;</td>"+
               "</tr>"
         );
         bb = rset.next();
    }
//----------------------- Form Reply -----------------------------

out.println(""+
"<FORM action=\"http://myproject/jservlets/SaveReply\""+
" method=get>"+
"<INPUT TYPE=\"hidden\" name=ATopic value="+TopicName+">"+
"<tr>                                                                                               "+
"    <td height=\"313\" valign=\"top\" align=\"center\" width=\"5%\">&nbsp;</td>                    "+
"    <td height=\"313\" valign=\"top\" align=\"left\" width=\"95%\">                                "+
"      <table cellspacing=0 cellpadding=0 border=2 width=\"601\">                                   "+
"        <tbody>                                                                                    "+
"        <tr valign=top>                                                                            "+
"          <td width=85 bgcolor=#FFCC99><font face=\"MS Sans Serif\" color=#000080      size=2><br> "+
"            </font></td>                                                                           "+
"          <td width=516 bgcolor=#FFCC99>&nbsp;</td>                                                "+
"        </tr>                                                                                      "+
"        <tr valign=top>                                                                            "+
"          <td width=85 bgcolor=#FFCCCC><b><font face=\"MS Sans Serif\" size=\"1\">Your             "+
"            Name:</font></b></td>                                                                  "+
"          <td width=516 bgcolor=#FFCCCC><font face=\"MS Sans Serif\" size=2>                       "+
"            <input     name=AName>                                                                "+
"            </font></td>                                                                           "+
"        </tr>                                                                                      "+
"        <tr valign=top>                                                                            "+
"          <td width=85 bgcolor=#FFCC99><b><font face=\"MS Sans Serif\" size=\"1\">Your             "+
"            Email:</font></b></td>                                                                 "+
"          <td valign=center width=516 bgcolor=#FFCC99><b><font face=\"MS Sans Serif\"     size=2>  "+
"            <input size=50 name=AEmail>                                                           "+
"            </font></b></td>                                                                       "+
"        </tr>                                                                                      "+
"        <tr valign=top>                                                                            "+
"          <td width=85 bgcolor=#FFCCCC height=\"160\"><b><font face=\"MS Sans Serif\" size=\"1\">Your                     "+
"            Reply:</font></b><font face=\"MS Sans Serif\" size=\"1\"> </font></td>                                        "+
"          <td valign=center width=516 bgcolor=#FFCCCC height=\"160\"><font face=\"MS Sans Serif\"      size=2>            "+
"            <textarea name=ABody rows=10 cols=80></textarea>                                                           "+
"            </font></td>                                                                                                  "+
"        </tr>                                                                                                             "+
"        <tr valign=top>                                                                                                   "+
"          <td width=85 bgcolor=#FFCCCC><img height=1 alt=\"\"      src=\"PM_filess/ecblank.gif\" width=1 border=0></td>   "+
"          <td width=516 bgcolor=#FFCCCC>                                                                                  "+
"            <div align=center>                                                                                            "+
"              <input type=\"submit\" value=Submit name=\"submit2\">                                                       "+
"              <input type=\"reset\" name=\"Reset\" value=\"Reset\">                                                       "+
"            </div>                                                                                                        "+
"          </td>                                                                                                           "+
"        </tr>                                                                                                             "+
"        </tbody>                                                                                                          "+
"      </table>                                                                                                            "+
"    </td>                                                                                                                 "+
"  </tr>                                                                                                                   "+
"</FORM>"+
"</table>     "+
"<p>&nbsp;</p>"+
"<p>&nbsp;</p>"+
"<p>&nbsp;</p>"+
"</body>      "+
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

