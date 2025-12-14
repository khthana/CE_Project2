import  java.sql.*;
import  oracle.jdbc.driver.*;
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.util.*;
public class Listmember extends HttpServlet
{
    public void   doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
	  java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
    int rowCount = 0;
    resp.setContentType("text/html");
    out.println("<html>");
out.println("<head>");
out.println("<title>Internet Auction [Member Profiles] : CE.KMITL</title>");
out.println("<style><!-- A:link, A:visited { text-decoration: none; color: #ffffff}  A:hover { text-decoration: none; font-weight: underline; color :  #33ccff} // --> </style>");
out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
out.println("</head>");
out.println("");
out.println("<body bgcolor=\"#FFFFFF\">");
out.println("<table width=\"100%\" border=\"0\" align=\"center\" height=\"373\">");
out.println("  <tr valign=\"top\" align=\"center\"> ");
out.println("    <td colspan=\"2\" height=\"71\"><img src=\"/picture/MemberProfiles.jpg\" width=\"970\" height=\"98\"></td>");
out.println("  </tr>");
out.println("  <tr> ");
out.println("    <td width=\"19%\" valign=\"top\" bgcolor=\"#4f4fd2\" height=\"660\"> ");
out.println("      <div align=\"center\">");
out.println("        <p>&nbsp;</p>");
out.println("        <p><font size=\"3\" face=\"Arial, Helvetica, sans-serif\"><font color=\"#FF3366\"><i><font size=\"2\"><font color=\"#CC0000\"><b><font size=\"3\" color=\"#FFCC00\">New ");
out.println("          Users !!</font></b></font><br>");
out.println("          </font></i></font></font><br>");
out.println("        </p>");
out.println("      </div>");
out.println("      <div align=\"center\"> ");
out.println("        <p><font size=\"3\"><a href=\"../register.html\"><font face=\"Arial, Helvetica, sans-serif\">Register</font></a></font> ");
out.println("          <br>");
out.println("          <font size=\"3\"><a href=\"../NewToOurAuction.html\"><font face=\"Arial, Helvetica, sans-serif\"> ");
out.println("          New to our Auction</font></a></font> <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("          </i></font><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("          <br>");
out.println("          <font color=\"#cc0000\"><b><font size=\"3\" color=\"#ffcc00\">Auction Member</font></b></font></i></font></p>");
out.println("        <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><a href=\"LoginSuccess\"><font size=\"3\" >Home<font face=\"Arial, Helvetica, sans-serif\"> ");
out.println("        </font></font></a></font><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("        </i><a href=\"Changeinfo\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Change ");
out.println("        Personal Information </font><font  face=\"Arial, Helvetica, sans-serif\"> ");
out.println("        </font></font> </a><i> </i></font> </div>");
out.println("      <div align=\"center\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"></font><a href=\"Listmember\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Member ");
out.println("        Profiles<br>");
out.println("        </font></font></a><a href=\"Listproject\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Project ");
out.println("        List</font></font></a><a href=\"OfferSpec\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><br>");
out.println("        </font></font></a><a href=\"Ranking\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Member Rating</font></font></a> ");
out.println("        <br>");
out.println("        <br>");
out.println("        <font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\" size=\"2\"><b><font color=\"#FF9900\">For ");
out.println("        Buyer</font></b></font></font><br>");
out.println("        <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"GeneralReq\">General ");
out.println("        Requirement</a></font></font><br>");
out.println("        <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"AddTechReq\">Add ");
out.println("        Technical Requirement <font size=\"2\"><i>(bidding)</i></font></a></font></font><br>");
out.println("        <br>");
out.println("        <font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#CCCCCC\" size=\"2\"><b><font color=\"#FF9900\">For ");
out.println("        Seller</font></b></font></font><br>");
out.println("        <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"AddSpecification\">Add ");
out.println("        Specification</a></font></font><br>");
out.println("        <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"ListBiddingProject\">Bidding</a></font></font><br>");
out.println("        <br>");
out.println("      </div>");
out.println("      <div align=\"center\"> ");
out.println("        <p><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><font color=\"#cc0000\"><b><font size=\"3\" color=\"#ffcc00\">Auction ");
out.println("          Services</font></b></font></i></font> <br>");
out.println("        </p>");
out.println("      </div>");
out.println("      <div align=\"center\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i> ");
out.println("        </i><a href=\"http://freeboard.adbest.com/KBoard.cgi?db=pennie23\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Auction ");
out.println("        Board</font></font></a></font></div>");
out.println("      <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font> ");
out.println("      <div align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><a href=\"../MailToUs.html\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Mail ");
out.println("        To Us</font></font></a><i><br>");
out.println("        </i></font> </div>");
out.println("<div align=\"center\">");
out.println("<FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\" color=#ff3366 size=2><A ");
out.println("      href=\"Logout\"><FONT size=3><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\">Log Out ");
out.println("</FONT></FONT></A></FONT>");
out.println("</div>");

out.println("      <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font> ");
out.println("      <div align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font></div>");
out.println("        </td>");
out.println("");
out.println("<!---------------------------------------------- column 2 [main] ---------------------------------------------------->");
out.println("");
out.println("    <td width=\"81%\" height=\"660\" valign = \"top\">");
out.println("			<br>");
out.println("<!---------------------------------------------- table member profiles ---------------------------------------------->");
out.println("");
out.println("		<table width=\"100%\" border=\"0\" cellspacing=\"2\" cellpadding=\"4\">");
out.println("          <tr bgcolor=\"#FFB56A\"> ");
out.println("            <td> ");
out.println("              <div align=\"center\"><font color=\"#000066\"><b><font face=\"Verdana, Arial, Helvetica, sans-serif\">No.</font></b></font></div>");
out.println("            </td>");
out.println("            <td> ");
out.println("              <div align=\"center\"><font color=\"#000066\"><b><font face=\"Verdana, Arial, Helvetica, sans-serif\">Username</font></b></font></div>");
out.println("            </td>");
out.println("            <td> ");
out.println("              <div align=\"center\"><font color=\"#000066\"><b><font face=\"Verdana, Arial, Helvetica, sans-serif\">Company Name</font></b></font></div>");
out.println("            </td>");
out.println("            <td> ");
out.println("              <div align=\"center\"><font color=\"#000066\"><b><font face=\"Verdana, Arial, Helvetica, sans-serif\"> </font></b></font></div>");
out.println("            </td>");
out.println("          </tr>");
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
 	  Str_Query = "select USERNAME,COMP_NAME  from member";
    try
     {
      int i = 0 ;
      DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
      con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
      stmt = con.createStatement();
      rs = stmt.executeQuery(Str_Query);
      while (rs.next())
      {

        i++;
        out.println("<form method=\"Post\" action=\"MemberDetail\" name=\"NewMemberForm\">");
        out.println("          <tr bgcolor=\"#FFE2A6\"> ");
        out.println("            <td><b>"+ new Integer(i).toString() + "</b></td>");
        out.println("            <td><b>"+ rs.getString(1) + "</b> </td>");
        out.println("            <td><b>"+ rs.getString(2) + "</b> </td>");
        out.println("            <input type=hidden Name = \"username\" value = \"" + rs.getString(1) + "\">" );
        out.println("            <td>");
        out.println("<input type=\"submit\" name=\"projectnumber\" value=\"View Detail\">");
        out.println("</td>");
        out.println(" </tr>");
        out.println("</form>");
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


out.println("        </table>");
out.println("");
out.println("<!------------------------------------------------ end table member profiles --------------------------------------------->");
out.println("");
out.println("      </td>");
out.println("  </tr>");
out.println("</table>");
out.println("</body>");
out.println("</html>");
out.flush();
}
}
