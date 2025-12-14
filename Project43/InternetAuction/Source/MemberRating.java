import  java.sql.*;
import  oracle.jdbc.driver.*;
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.util.*;
public class MemberRating extends HttpServlet
{
    public void   doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
	  java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
    HttpSession session = req.getSession(true);
    String username      = (String)session.getValue("username");
    String companyname   = (String)session.getValue("companyname");
    if (username == null)
      resp.sendRedirect("../Pleaselogin.html");
    resp.setContentType("text/html");
    out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">");
    out.println("<HTML><HEAD><TITLE> Member Rating : CE.KMITL</TITLE>");
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
out.println("    <TD colSpan=2 height=71><IMG height=98 src=\"/picture/MemberRating.jpg\" width=970></TD></TR>");
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
out.println("      href=\"OfferSpec\"><FONT size=3><FONT ");
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
out.println("      href=\"http://freeboard.adbest.com/KBoard.cgi?db=pennie23\"><FONT ");
out.println("      size=3><FONT face=\"Arial, Helvetica, sans-serif\">Auction ");
out.println("      Board</FONT></FONT></A></FONT></DIV><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\" color=#ff3366 size=2><I></I></FONT>");
out.println("      <DIV align=center><FONT face=\"Arial, Helvetica, sans-serif\" color=#ff3366 ");
out.println("      size=2><A ");
out.println("      href=\"../MailToUs.html\"><FONT ");
out.println("      size=3><FONT face=\"Arial, Helvetica, sans-serif\">Mail To ");
out.println("      Us</FONT></FONT></A><I><BR></I></FONT></DIV>");
out.println("<div align=\"center\">");
out.println("<FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\" color=#ff3366 size=2><A ");
out.println("      href=\"Logout\"><FONT size=3><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\">Log Out ");
out.println("</FONT></FONT></A></FONT>");
out.println("</div>");

out.println("<FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\" color=#ff3366 size=2><I></I></FONT>");
out.println("      <DIV align=center><FONT face=\"Arial, Helvetica, sans-serif\" color=#ff3366 ");
out.println("      size=2><I></I></FONT></DIV></TD>");
out.println("    <TD vAlign=top height=79>");
out.println("      <DIV align=right><IMG height=45 src=\"/picture/Addrating.jpg\" width=765></DIV></TD></TR>");
out.println("  <TR>");
out.println("    <TD vAlign=top align=middle width=\"83%\"><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\" color=#000000 size=3><B>");
out.println("Welcome  "+ username + "</B></FONT>");
out.println("      <FORM action=\"InsertRating\" method=post>");
out.println("      <P align=center><FONT face=\"Arial, Helvetica, sans-serif\" color=#000066 ");
out.println("      size=2><B>Member username whom you want to give comment and rating : ");
out.println("      <SELECT name= \"username\" >");
/////Find all user name///////////
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
           if (rs.getString(1).compareTo(username) != 0) 
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
out.println("</SELECT> <BR>Number of auction project for reference ");
out.println("      : <INPUT size=10 name = \"Tech_req_id\"> <BR><BR><BR><FONT ");
out.println("      color=#990000> Rating </FONT></B></FONT></P>");
out.println("      <P align=center><FONT face=\"Arial, Helvetica, sans-serif\" color=#000066 ");
out.println("      size=2><B><FONT color=#990000><INPUT type=radio value=\"negative\" ");
out.println("      name=\"comment\"> </FONT><FONT face=\"Arial, Helvetica, sans-serif\" ");
out.println("      color=#000066 size=2><B>Negative <IMG height=10 src=\"/picture/negative.gif\" width=58> <INPUT ");
out.println("      type=radio value=\"positive\"  name=\"comment\" checked> Positive <IMG height=10 ");
out.println("      src=\"/picture/positive.gif\" width=58> </B></FONT></B></FONT></P>");
out.println("      <P align=center><FONT face=\"Arial, Helvetica, sans-serif\" color=#000066 ");
out.println("      size=2><B><FONT face=\"Arial, Helvetica, sans-serif\" color=#000066 ");
out.println("      size=2><B>Your comment<BR><BR><TEXTAREA name=\"Yourcomment\" rows=3 cols=50></TEXTAREA> ");
out.println("      <BR><BR><INPUT type=submit value=Submit name=Submit> <INPUT type=submit value=Reset name=clear> ");
out.println("      </B></FONT></B></FONT></P></FORM><FONT face=\"Arial, Helvetica, sans-serif\" ");
out.println("      color=#000066 size=2><B></B></FONT></TD></TR></TBODY></TABLE></BODY></HTML>");
out.flush();
}
}
