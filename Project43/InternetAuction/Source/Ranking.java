import  java.sql.*;
import  oracle.jdbc.driver.*;
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.util.*;
public class Ranking  extends HttpServlet
{
    public void   doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
	  java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
    HttpSession session = req.getSession(true);
    String username      = (String)session.getValue("username");
    String companyname   = (String)session.getValue("companyname");
    String Rated_user = req.getParameter("username");
   resp.setContentType("text/html");
   out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">");
   out.println("<HTML><HEAD><TITLE>Internet Auction [New to our auction] : CE.KMITL</TITLE>");
   out.println("<STYLE>A:link {");
   out.println("	COLOR: #ffffff; TEXT-DECORATION: none");
   out.println("}");
   out.println("A:visited {");
out.println("	COLOR: #ffffff; TEXT-DECORATION: none");
out.println("}");
out.println("A:hover {");
out.println("	COLOR: #33ccff; TEXT-DECORATION: none");
out.println("}");
out.println("</STYLE>");
out.println("");
out.println("<META http-equiv=Content-Type content=\"text/html; charset=iso-8859-1\">");
out.println("<META content=\"MSHTML 5.50.4522.1800\" name=GENERATOR></HEAD>");
out.println("<BODY bgColor=#ffffff>");
out.println("<TABLE height=159 cellSpacing=2 cellPadding=4 width=\"100%\" border=0>");
out.println("  <TBODY>");
out.println("  <TR>");
out.println("    <TD colSpan=2 height=71> <IMG height=98 src=\"/picture/MemberRating.jpg\" width=970> </TD></TR>");
out.println("  <TR>");
out.println("    <TD vAlign=top width=\"17%\" bgColor=#4f4fd2 height=500 rowSpan=2>");
out.println("      <DIV align=center>");
out.println("      <P>&nbsp;</P>");
out.println("      <P><FONT face=\"Arial, Helvetica, sans-serif\" color=#ff3366 size=2><I><FONT ");
out.println("      color=#cc0000><B><FONT color=#ffcc00 size=3>Auction ");
out.println("      Member</FONT></B></FONT></I></FONT></P><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\" color=#ff3366 size=2><A ");
out.println("      href=\"LoginSuccess\"><FONT size=3>Home<FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\"> </FONT></FONT></A></FONT><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\" color=#ff3366 ");
out.println("      size=2><I></I></FONT><FONT face=\"Arial, Helvetica, sans-serif\" ");
out.println("      color=#ff3366 size=2><I><BR></I><A ");
out.println("      href=\"Changeinfo\"><FONT size=3><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\">Change Personal Information ");
out.println("      </FONT><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\"></FONT></FONT></A><I></I></FONT></DIV>");
out.println("      <DIV align=center><FONT face=\"Arial, Helvetica, sans-serif\" color=#ff3366 ");
out.println("      size=2></FONT><A href=\"Listmember\"><FONT size=3><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\">Member ");
out.println("      Profiles<BR></FONT></FONT></A><A ");
out.println("      href=\"Listproject\"><FONT size=3><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\">Project List</FONT></FONT></A><A ");
out.println("      href=\"/OfferSpec\"><FONT size=3><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\"><BR></FONT></FONT></A><A ");
out.println("      href=\"Ranking\"><FONT size=3><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\">Member Rating</FONT></FONT></A> ");
out.println("      <BR><BR><FONT size=3><FONT face=\"Arial, Helvetica, sans-serif\" ");
out.println("      size=2><B><FONT color=#ff9900>For Buyer</FONT></B></FONT></FONT><BR><FONT ");
out.println("      size=3><FONT face=\"Arial, Helvetica, sans-serif\"><A ");
out.println("      href=\"GeneralReq\">General ");
out.println("      Requirement</A></FONT></FONT><BR><FONT size=3><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\"><A ");
out.println("      href=\"AddTechReq\">Add Technical Requirement <FONT ");
out.println("      size=2><I>(bidding)</I></FONT></A></FONT></FONT><BR><BR><FONT size=3><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\" color=#cccccc size=2><B><FONT ");
out.println("      color=#ff9900>For Seller</FONT></B></FONT></FONT><BR><FONT size=3><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\"><A ");
out.println("      href=\"AddSpecification\">Add ");
out.println("      Specification</A></FONT></FONT><BR><FONT size=3><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\"><A ");
out.println("      href=\"ListBiddingProject\">Bidding</A></FONT></FONT><BR><BR></DIV>");
out.println("      <DIV align=center>");
out.println("      <P><FONT face=\"Arial, Helvetica, sans-serif\" color=#ff3366 size=2><I><FONT ");
out.println("      color=#cc0000><B><FONT color=#ffcc00 size=3>Auction ");
out.println("      Services</FONT></B></FONT></I></FONT> <BR></P></DIV>");
out.println("      <DIV align=center><FONT face=\"Arial, Helvetica, sans-serif\" color=#ff3366 ");
out.println("      size=2><I></I><A ");
out.println("      href=\"../AuctionBoard.html\"><FONT ");
out.println("      size=3><FONT face=\"Arial, Helvetica, sans-serif\">Auction ");
out.println("      Board</FONT></FONT></A></FONT></DIV><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\" color=#ff3366 size=2><I></I></FONT>");
out.println("      <DIV align=center><FONT face=\"Arial, Helvetica, sans-serif\" color=#ff3366 ");
out.println("      size=2><A ");
out.println("      href=\"../MailToUs.html\"><FONT ");
out.println("      size=3><FONT face=\"Arial, Helvetica, sans-serif\">Mail To ");
out.println("      Us</FONT></FONT></A><I><BR></I></FONT></DIV>");
out.println("          <div align=\"center\"> ");

out.println("            <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><a href=\"Logout\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Log ");
out.println("              Out </font></font></a></font><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("              </i></font> ");
out.println("          </div>");


out.println("<FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\" color=#ff3366 size=2><I></I></FONT>");
out.println("      <DIV align=center><FONT face=\"Arial, Helvetica, sans-serif\" color=#ff3366 ");
out.println("      size=2><I></I></FONT></DIV></TD>");
out.println("    <TD vAlign=top height=79>");
out.println("      <DIV align=right><IMG height=45 src=\"/picture/RatingHistory.jpg\" width=765></DIV></TD></TR>");
out.println("  <TR>");
out.println("    <TD vAlign=top align=middle width=\"83%\"><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\" color=#000066 size=2><B></B></FONT>");
out.println("<center><A href = \"MemberRating\"><font color =#0000ff>  click here to rating </font></a> </center>      ");
out.println("<FORM action=\"Ranking\" method=get>");
out.println("        <P align=center>Please select username that you want to see rating ");
out.println("          <select name=\"username\">");
Connection con = null;
Statement stmt = null;
ResultSet rs= null;
String Str_Query ;
java.util.Properties props = new java.util.Properties();
    try
    {
     	  DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
	   }
	   catch (java.sql.SQLException ko){ out.println("Register error");}
  	  Str_Query = "select USERNAME  from member order by username ";
    try
     {
      int i = 0 ;
      DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
      con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
      stmt = con.createStatement();
      rs = stmt.executeQuery(Str_Query);
      while (rs.next())
      {
          out.println("<option>" + rs.getString(1) + "</option>");
      }
     }
     catch (Exception ex)
     {
    	 out.println("Exception");
	     ex.printStackTrace(out);
	   }
     finally
     {
	     try
	     { if (rs != null)  {rs.close();}
         if (stmt != null){stmt.close();}
  		   if (con != null) {con.close();}
       }
	     catch (Exception ex){}
	   }

out.println("          </select>");
out.println("          <input type=\"submit\" name=\"Submit\" value=\"ok\">");
out.println("        </P>");
out.println("      </FORM>");
out.println("<br>     ");
out.println("");
if (Rated_user != null)
{
    try
    {
     	  DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
	   }
	   catch (java.sql.SQLException ko){ out.println("Register error");}
    try
     {
      int positive = 0 ;
      int negative = 0 ;
      int all      = 0 ;
      DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
      con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
      stmt = con.createStatement();
  	  Str_Query = "select USERNAME,type_of_comment  from rating where username ='" + Rated_user + "'" ;
      rs = stmt.executeQuery(Str_Query);
      while(rs.next())
      {
        if (rs.getString(2).compareTo("positive") == 0)
            positive++ ;
        if (rs.getString(2).compareTo("negative") == 0)
            negative++ ;
      }
      all = positive + negative ;
           out.println("  <font size=\"4\">   Comment for " + Rated_user +"  </font>" );
out.println("<br>     ");
out.println("<br>");
out.println("<center>  <table width=\"50%\" border=\"0\">");
out.println("        <tr bgcolor = \"#00ff00\">");
out.println("          <td>");
out.println("            <div align=\"center\">  Positive</div>");
out.println("          </td>");
out.println("          <td> <div align=\"center\">" + new Integer(positive).toString()+ " </div></td>");
out.println("        </tr>");
out.println("        <tr bgcolor = \"#ff0000\">");
out.println("          <td> <div align=\"center\"> Negative </div></td>");
out.println("          <td> <div align=\"center\">" + new Integer(negative).toString()+ "</div></td>");
out.println("        </tr>");
out.println("        <tr bgcolor = \"#86c8c8\">");
out.println("          <td> <div align=\"center\"> All </div></td>");
out.println("          <td> <div align=\"center\">" + new Integer(all).toString() + " </div></td>");
out.println("        </tr>");
out.println("      </table>");
out.println("      <br>");
out.println("<center>");


out.println("          <font size=\"4\">Detail </font> ");
out.println("        </center>");
out.println("      <br>");
out.println("      <br>");
out.println("");
out.println("        <table width=\"80%\" border=\"0\">");
out.println("          <tr bgcolor = \"#86c8c8\">");
out.println("            <td width=\"22%\">");
out.println("              <div align=\"center\"><b>Username</b></div>");
out.println("            </td>");
out.println("            <td width=\"24%\"><b>Refer to project ID</b></td>");
out.println("            <td width=\"36%\"> ");
out.println("              <div align=\"center\"><b>Comment</b></div>");
out.println("            </td>");
out.println("            <td width=\"18%\">");
out.println("              <div align=\"center\"><b>Opinion</b></div>");
out.println("            </td>");
out.println("          </tr>");
Str_Query = "select rating_giver,project_id,member_comment,type_of_comment  from rating where username ='" + Rated_user + "'" ;
rs = stmt.executeQuery(Str_Query);
while(rs.next())
{
out.println("          <tr bgcolor = \"#e0f1f1\">");
out.println("            <td width=\"22%\"> <div align=\"center\">" + rs.getString(1) + "</div></td>");
out.println("            <td width=\"24%\"> <div align=\"center\">" + rs.getString(2) + "</div></td>");
out.println("            <td width=\"36%\"> <div align=\"center\">" + rs.getString(3) + "</div></td>");
out.println("            <td width=\"18%\"> <div align=\"center\">" + rs.getString(4) + "</div></td>");
out.println("          </tr>");
}
out.println("        </table>");
out.println("      </center>");

out.println("     <FONT face=\"Arial, Helvetica, sans-serif\" ");
out.println("      color=#000066 size=2><B></B></FONT></TD>");
out.println("  </TR></TBODY></TABLE></BODY></HTML>");
     }
     catch (Exception ex)
     {
    	 out.println("Exception");
	     ex.printStackTrace(out);
	   }
     finally
     {
	     try
	     { if (rs != null)  {rs.close();}
         if (stmt != null){stmt.close();}
  		   if (con != null) {con.close();}
       }
	     catch (Exception ex){}
	   }
}

out.flush();

}
}
