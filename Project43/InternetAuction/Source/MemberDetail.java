
import  java.sql.*;
import  oracle.jdbc.driver.*;
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.util.*;
public class MemberDetail extends HttpServlet
{
    public void   doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
	  java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
    HttpSession session = req.getSession(true);
    resp.setContentType("text/html");
    String username = req.getParameter("username");
    out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">");
out.println("<HTML><HEAD><TITLE>Internet Auction [Member Profiles] : CE.KMITL</TITLE>");
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
out.println("<TABLE height=373 width=\"100%\" align=center border=0>");
out.println("  <TBODY>");
out.println("  <TR vAlign=top align=middle>");
out.println("    <TD colSpan=2 height=71><IMG height=98 src=\"/picture/MemberProfiles.jpg\" width=970></TD></TR>");
out.println("  <TR>");
out.println("    <TD vAlign=top width=\"19%\" bgColor=#4f4fd2 height=660>");
out.println("      <DIV align=center>");
out.println("      <P>&nbsp;</P>");
out.println("      <P><FONT face=\"Arial, Helvetica, sans-serif\" size=3><FONT ");
out.println("      color=#ff3366><I><FONT size=2><FONT color=#cc0000><B><FONT color=#ffcc00 ");
out.println("      size=3>New Users ");
out.println("      !!</FONT></B></FONT><BR></FONT></I></FONT></FONT><BR></P></DIV>");
out.println("      <DIV align=center>");
out.println("      <P><FONT size=3><A href=\"../register.html\"><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\">Register</FONT></A></FONT> <BR><FONT ");
out.println("      size=3><A ");
out.println("      href=\"../NewToOurAuction.html\"><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\">New to our Auction</FONT></A></FONT> ");
out.println("      <FONT face=\"Arial, Helvetica, sans-serif\" color=#ff3366 ");
out.println("      size=2><I><BR></I></FONT><FONT face=\"Arial, Helvetica, sans-serif\" ");
out.println("      color=#ff3366 size=2><I><BR><BR><FONT color=#cc0000><B><FONT color=#ffcc00 ");
out.println("      size=3>Auction Member</FONT></B></FONT></I></FONT></P><FONT ");
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
out.println("      href=\"ListBiddigProject\">Bidding</A></FONT></FONT><BR><BR></DIV>");
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
out.println("      size=2><I></I></FONT></DIV></TD><!---------------------------------------------- column 2 [main] ---------------------------------------------------->");
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
 	  Str_Query = "select username,name,surname,comp_name,address,region,province,zipcode,tele_comp,";
    Str_Query += "mobile,email,rating  from member where username = '" + username + "'";
    try
     {
      int i = 0 ;
      DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
      con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
      stmt = con.createStatement();
      rs = stmt.executeQuery(Str_Query);
      rs.next();


      out.println("    <TD vAlign=top width=\"81%\" height=660><BR><BR>");
out.println("      <TABLE cellSpacing=2 cellPadding=5 width=\"80%\" align=center border=0>");
out.println("        <TBODY>");
out.println("        <TR>");
out.println("          <TD width=\"30%\" bgColor=#62c0ff>");
out.println("            <DIV align=center><FONT color=#000066><B><FONT ");
out.println("            face=\"Verdana, Arial, Helvetica, sans-serif\">Username</FONT></B></FONT></DIV></TD>");
out.println("          <TD width=\"70%\" bgColor=#aedfff><b>"+ rs.getString(1) + "</b></TD></TR>");
out.println("        <TR>");
out.println("          <TD width=\"30%\" bgColor=#62c0ff>");
out.println("            <DIV align=center><FONT color=#000066><B><FONT ");
out.println("            face=\"Verdana, Arial, Helvetica, sans-serif\">Name</FONT></B></FONT></DIV></TD>");
out.println("          <TD width=\"70%\" bgColor=#aedfff><b>"+ rs.getString(2) + "</b></TD></TR>");
out.println("        <TR>");
out.println("          <TD width=\"30%\" bgColor=#62c0ff>");
out.println("            <DIV align=center><FONT color=#000066><B><FONT ");
out.println("            face=\"Verdana, Arial, Helvetica, sans-serif\">Surname</FONT></B></FONT></DIV></TD>");
out.println("          <TD width=\"70%\" bgColor=#aedfff><b>"+ rs.getString(3) + "</b></TD></TR>");
out.println("        <TR>");
out.println("          <TD width=\"30%\" bgColor=#62c0ff>");
out.println("            <DIV align=center><FONT color=#000066><B><FONT ");
out.println("            face=\"Verdana, Arial, Helvetica, sans-serif\">Company Name ");
out.println("            </FONT></B></FONT></DIV></TD>");
out.println("          <TD width=\"70%\" bgColor=#aedfff><b>"+ rs.getString(4) + "</b></TD></TR>");
out.println("        <TR>");
out.println("          <TD width=\"30%\" bgColor=#62c0ff>");
out.println("            <DIV align=center><FONT color=#000066><B><FONT ");
out.println("            face=\"Verdana, Arial, Helvetica, sans-serif\">Address ");
out.println("            </FONT></B></FONT></DIV></TD>");
out.println("          <TD width=\"70%\" bgColor=#aedfff><b>"+ rs.getString(5) + "</b></TD></TR>");
out.println("        <TR>");
out.println("          <TD width=\"30%\" bgColor=#62c0ff>");
out.println("            <DIV align=center><FONT color=#000066><B><FONT ");
out.println("            face=\"Verdana, Arial, Helvetica, sans-serif\">Region ");
out.println("            </FONT></B></FONT></DIV></TD>");
out.println("          <TD width=\"70%\" bgColor=#aedfff><b>"+ rs.getString(6) + "</b></TD></TR>");
out.println("        <TR>");
out.println("          <TD width=\"30%\" bgColor=#62c0ff>");
out.println("            <DIV align=center><FONT color=#000066><B><FONT ");
out.println("            face=\"Verdana, Arial, Helvetica, sans-serif\">Province ");
out.println("            </FONT></B></FONT></DIV></TD>");
out.println("          <TD width=\"70%\" bgColor=#aedfff><b>"+ rs.getString(7) + "</b></TD></TR>");
out.println("        <TR>");
out.println("          <TD width=\"30%\" bgColor=#62c0ff>");
out.println("            <DIV align=center><FONT color=#000066><B><FONT ");
out.println("            face=\"Verdana, Arial, Helvetica, sans-serif\">Zip ");
out.println("            code</FONT></B></FONT></DIV></TD>");
out.println("          <TD width=\"70%\" bgColor=#aedfff><b>"+ rs.getString(8) + "</b></TD></TR>");
out.println("        <TR>");
out.println("          <TD width=\"30%\" bgColor=#62c0ff>");
out.println("            <DIV align=center><FONT color=#000066><B><FONT ");
out.println("            face=\"Verdana, Arial, Helvetica, sans-serif\">Telephone</FONT></B></FONT></DIV></TD>");
out.println("          <TD width=\"70%\" bgColor=#aedfff><b>"+ rs.getString(9) + "</b></TD></TR>");
out.println("        <TR>");
out.println("          <TD width=\"30%\" bgColor=#62c0ff>");
out.println("            <DIV align=center><FONT color=#000066><B><FONT ");
out.println("            face=\"Verdana, Arial, Helvetica, sans-serif\">Mobile Number ");
out.println("            </FONT></B></FONT></DIV></TD>");
out.println("          <TD width=\"70%\" bgColor=#aedfff><b>"+ rs.getString(10) + "</b></TD></TR>");
out.println("        <TR>");
out.println("          <TD width=\"30%\" bgColor=#62c0ff>");
out.println("            <DIV align=center><FONT color=#000066><B><FONT ");
out.println("            face=\"Verdana, Arial, Helvetica, sans-serif\">E-Mail</FONT></B></FONT></DIV></TD>");
out.println("          <TD width=\"70%\" bgColor=#aedfff><b>"+ rs.getString(11) + "</b></TD></TR>");
out.println("        <TR>");
out.println("          <TD width=\"30%\" bgColor=#62c0ff>");
out.println("            <DIV align=center><FONT color=#000066><B><FONT ");
Str_Query = "select username,type_of_comment from rating where username ='" + rs.getString(1) + "'";
rs = stmt.executeQuery(Str_Query);
int positive = 0 ;

while(rs.next())
{
  if (rs.getString(2).compareTo("positive") == 0)
     positive++;
}

out.println("            face=\"Verdana, Arial, Helvetica, sans-serif\"> Rating </FONT></B></FONT></DIV></TD>");
out.println("          <TD width=\"70%\" ");
out.println("  bgColor=#aedfff><b>"  + new Integer(positive).toString() + "</b></TD></TR>");
out.println("  <TR>");
out.println("  <TD colspan = \"2\">");
out.println("<center><input type=\"button\" name=\"back\" value=\"Back\" onClick=\"history.back()\"></center>");
out.println("  </TD>" );

out.println("</tr>");
out.println("</TBODY></TABLE></TD></TR></TBODY></TABLE>");
out.println("</BODY></HTML>");

    out.flush();
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

}
