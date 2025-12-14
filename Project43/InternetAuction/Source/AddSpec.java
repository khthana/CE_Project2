
import  java.sql.*;
import  oracle.jdbc.driver.*;
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.util.*;
public class AddSpec extends HttpServlet
{
    public void   doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
	  java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
    Connection con = null;
    Statement stmt = null;
    ResultSet rs= null;
    HttpSession session = req.getSession(true);
    String username = (String)session.getValue("username") ;
    String companyname = (String)session.getValue("companyname");
    String Str_Query ;
    int rowCount = 0;
    resp.setContentType("text/html");
out.println("   <html>");
out.println("<head>");
out.println("<title>Internet Auction : CE.KMITL</title>");
out.println("<style><!-- A:link, A:visited { text-decoration: none; color: #ffffff}  A:hover { text-decoration: none; font-weight: underline; color :  #33ccff} // --> </style>");
out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
out.println("</head>");
out.println("<body bgcolor=\"#FFFFFF\" link=\"#FF9933\" vlink=\"#3399CC\" alink=\"#FF9966\" >");
out.println("<div align=\"center\">");
out.println("  <p>&nbsp;</p>");
out.println("  <div id=\"Layer1\" style=\"position:absolute; width:970px; height:100px; z-index:1; left: 17px; top: 22px\">");
out.println("  <table width=\"99%\" border=\"0\" height=\"400\">");
out.println("<tr>");
out.println("    <div align=\"center\"><img src=\"/picture/AuctionBanner.jpg\" width=\"970\" height=\"98\"></div>");
out.println("</tr>");
out.println("<tr>");
out.println("      <td rowspan=\"3\" height=\"137\" width=\"15%\" bgcolor=\"#4F4FD2\" valign=\"top\">");
out.println("        <div align=\"center\">");
out.println("          <p><font size=\"3\" face=\"Arial, Helvetica, sans-serif\"><font color=\"#FF3366\"><i><font size=\"2\"><br>");
out.println("            </font></i></font></font></p>");
out.println("          <p><font size=\"3\" face=\"Arial, Helvetica, sans-serif\"><font color=\"#FF3366\"><i><font size=\"2\"><font color=\"#CC0000\"><b><font size=\"3\" color=\"#FFCC00\">New");
out.println("            Users !!</font></b></font><br>");
out.println("            </font></i></font></font><br>");
out.println("          </p>");
out.println("        </div>");
out.println("        <div align=\"center\">");
out.println("          <p><font size=\"3\"><a href=\"../register.html\"><font face=\"Arial, Helvetica, sans-serif\">Register</font></a></font>");
out.println("            <br>");
out.println("              <font size=\"3\"><a href=\"NewToAuction.html\"><font face=\"Arial, Helvetica, sans-serif\">");
out.println("              New to our Auction</font></a></font> <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("            </i></font><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("            <br>");
out.println("            <font color=\"#cc0000\"><b><font size=\"3\" color=\"#ffcc00\">Auction Member</font></b></font></i></font></p>");
out.println("          <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><a href=\"../index.html\"><font size=\"3\" >Home<font face=\"Arial, Helvetica, sans-serif\">");
out.println("          </font></font></a></font><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("            </i><a href=\"Changeinfo\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Change");
out.println("            Personal Information </font><font  face=\"Arial, Helvetica, sans-serif\">");
out.println("            </font></font> </a><i> </i></font> </div>");
out.println("          <div align=\"center\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"></font><a href=\"Listmember\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Member");
out.println("            Profile<br>");
out.println("            </font></font></a><a href=\"Listproject\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Project");
out.println("            List</font></font></a><a href=\"OfferSpec\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><br>");
out.println("            </font></font></a><a href=\"ranking\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Ranking</font></font></a>");
out.println("            <br>");
out.println("            <br>");
out.println("            <font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\" size=\"2\"><b><font color=\"#FF9900\">For");
out.println("            Buyer</font></b></font></font><br>");
out.println("            <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"GeneralReq\">General");
out.println("            Requirement</a></font></font><br>");
out.println("			<font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"AddTechReq\">Add Technical Requirement <font size=\"2\"><i>(bidding)</i></font></a></font></font><br><br>");
out.println("            <font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#CCCCCC\" size=\"2\"><b><font color=\"#FF9900\">For");
out.println("            Seller</font></b></font></font><br>");
out.println("            <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"AddSpecification\">Add");
out.println("            Specification</a></font></font><br>");
out.println("            <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"ListBiddingProject\">Bidding</a></font></font><br>");
out.println("            <br>");
out.println("            </div>");
out.println("          <div align=\"center\">");
out.println("<p><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><font color=\"#cc0000\"><b><font size=\"3\" color=\"#ffcc00\">Auction");
out.println("              Services</font></b></font></i></font> <br>");
out.println("            </p>");
out.println("            </div>");
out.println("          <div align=\"center\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i>");
out.println("            </i><a href=\"../AuctionBoard.html\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Auction");
out.println("            Board</font></font></a></font></div>");
out.println("        <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font>");
out.println("        <div align=\"center\">");
out.println("            <p><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Mail");
out.println("              To Us</font></font></font></p>");
out.println("            <p><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><a href=\"Logout\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Log");
out.println("              Out </font></font></a></font><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("              </i></font> </p>");
out.println("            </div>");
out.println("        <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font>");
out.println("        <div align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("          </i></font><br>");
out.println("        </div>");
out.println("        <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font>");
out.println("<div align=\"right\">");
out.println("          <pre>&nbsp;");
out.println("</pre>");
out.println("        </div>");
out.println("        <pre>&nbsp;");
out.println("</pre>");
out.println("      </td>");
out.println("      <td width=\"63%\" rowspan=\"3\" valign=\"top\" background=\"/picture/indexpic2.jpg\">");
out.println("          <div align=\"right\">");
out.println("            <p align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" size=\"+3\" color=\"#9999FF\">");
//script date here//
out.println("              </font></b></p>");
out.println("            <p align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" size=\"+3\" color=\"#000000\">Welcome </font></b>");
out.println("<font face=\"Arial, Helvetica, sans-serif\" size=\"+3\" color=\"#000000\">" + username + "</font>");
out.println("            </p>");
out.println("            </div>");
out.println("      </td>");

/*out.println("      <td width=\"17%\" rowspan=\"3\" valign=\"top\" bgcolor=\"#ffb56a\">");
out.println("        <div align=\"center\">");
out.println("          <div align=\"left\">");
out.println("            <form method=\"post\" action=\"Logined\">");
out.println("              <div align=\"center\">");
out.println("                <pre>&nbsp;");
out.println("</pre>");
out.println("                <div align=\"right\">");
out.println("                  <div align=\"center\">");
out.println("                    <div align=\"left\">");
out.println("                      <pre><img src=\"/picture/login.jpg\" width=\"170\" height=\"35\">");
out.println("</pre>");
out.println("                    </div>");
out.println("                  </div>");
out.println("                </div>");
out.println("                <table width=\"29%\" border=\"0\" align=\"center\" vspace=\"2\" hspace=\"2\" cellpadding=\"3\" cellspacing=\"2\" bgcolor=\"#ffb56a\">");
out.println("                  <tr bgcolor=\"#ffb56a\">");
out.println("                    <td width=\"49%\" height=\"31\" align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#000099\" size=\"2\">Username</font></b></font></td>");
out.println("                    <td width=\"51%\" height=\"31\" align=\"center\" valign=\"middle\">");
out.println("                      <font color=\"#FFFFFF\">");
out.println("                      <input type=\"text\" name=\"username\" size=\"10\" maxlength=\"15\">");
out.println("                      </font></td>");
out.println("                  </tr>");
out.println("                  <tr bgcolor=\"#ffb56a\">");
out.println("                    <td width=\"49%\" height=\"40\" align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#006666\"><b><font size=\"2\" color=\"#000099\">Password</font></b></font></td>");
out.println("                    <td width=\"51%\" height=\"40\" align=\"center\" valign=\"middle\">");
out.println("                      <font color=\"#FFFFFF\">");
out.println("                      <input type=\"text\" name=\"password\" size=\"10\" maxlength=\"15\">");
out.println("                      </font></td>");
out.println("                  </tr>");
out.println("                </table>");
out.println("                  <pre><i><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#FF9999\"><font color=\"#990033\" size=\"2\"><input type=\"submit\" name=\"Submit2\" value=\"Login\">");
out.println("<br>");
out.println("Forget Password ??? ...");
out.println("    Enter your e-mail here !!  </font><font color=\"#FF6666\" size=\"2\">");

out.println("</font><b><font color=\"#FF6666\"><input type=\"text\" name=\"email\">      ");
out.println("<br>");
out.println("<input type=\"submit\" name=\"Submit\" value=\"Submit\">  </font></b></font></i></pre>");
out.println("                  <pre>&nbsp;</pre>");
out.println("                <pre>&nbsp;</pre>");
out.println("                <pre>&nbsp;");
out.println("                </pre>");
out.println("              </div>");
out.println("            </form>");
out.println("            <pre>&nbsp;</pre>");
out.println("            <form method=\"post\" action=\"testsession\" name=\"test\">");
out.println("                <input type=\"submit\" name=\"test\" value=\"Delete_session\">");
out.println("            </form>");
out.println("          </div>");

out.println("          <pre>&nbsp;");
out.println("</pre>");
out.println("          <p>&nbsp;</p>");

out.println("          <pre>&nbsp;");


out.println("</pre>");
out.println("          <pre>&nbsp;");
out.println("</pre>");

out.println("          <p>&nbsp; </p>");
out.println("          <pre><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#FF6699\">");
out.println("<font color=\"#FF6666\">");

out.println("</font></font></b></font></pre>");
out.println("        </div>");
out.println("      </td>"); */
out.println("    </tr>");
out.println("    <tr> </tr>");
out.println("    <tr> </tr>");
out.println("  </table>");
out.println("  <p>&nbsp; </p>");
out.println("</div>");
out.println("</div></body>");
out.println("</html>");


     out.flush();
    }

}
