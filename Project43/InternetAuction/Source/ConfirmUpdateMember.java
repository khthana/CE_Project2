


import  java.sql.*;
import  oracle.jdbc.driver.*;                                                      
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.util.*;
public class ConfirmUpdateMember extends HttpServlet
{
    public void   doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
	  java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
    checkdata  one_value = new checkdata() ;
    String username = req.getParameter("username");
	  String password = req.getParameter("password");
	  String confirm  = req.getParameter("confirmpassword");
	  String type = req.getParameter("type");
	  String email = req.getParameter("email");
	  String name = req.getParameter("name");
    String companyname = req.getParameter("companyname");
	  String surname = req.getParameter("surname");
	  String sex = req.getParameter("sex");
	  String BirthDate = req.getParameter("birthdate");
	  String BirthMonth = req.getParameter("birthmonth");
	  String BirthYear = req.getParameter("birthyear");
	  String age = req.getParameter("age");
	  String telephone = req.getParameter("telephone");
    String date = BirthDate + "/" + BirthMonth + "/" + BirthYear;
	  String region = req.getParameter("region");
	  String province = req.getParameter("province");
	  String telephonecompany = req.getParameter("telephonecompany");
	  String address = req.getParameter("address");
	  String zipcode = req.getParameter("zipcode");
	  String occupation = req.getParameter("occupation");
	  String pager = req.getParameter("pager");
	  String pagernumber = req.getParameter("pagernumber");
	  String mobilenumber = req.getParameter("mobilenumber");
	  resp.setContentType("text/html");
out.println("      <html>");
out.println("<head>");
out.println("<title> Confirm Update member : CE.KMITL</title>");
out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
out.println("<style><!-- A:link, A:visited { text-decoration: none; color: #ffffff}  A:hover { text-decoration: none; font-weight: underline; color :   #33ccff} // --> </style>");
out.println("</head>");
out.println("<body bgcolor=\"#FFFFFF\">");
out.println("<table width=\"100%\" border=\"0\" height=\"609\">");
out.println("  <tr>");
out.println("     <td colspan=\"2\" height=\"110\"><img src=\"/picture/Register.jpg\" width=\"970\" height=\"98\"></td>");
out.println("  </tr>");
out.println("  <tr>");
out.println("      <td bgcolor=#4f4fd2 height=310 rowspan=3 valign=top width=\"19%\">");
out.println("        <div align=center>");
out.println("          <div align=center>");
out.println("            <div align=center>");
out.println("              <p>&nbsp;</p>");
out.println("              <div align=\"center\">");
out.println("                <p><b><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#ffcc00\"><i>Auction");
out.println("                  Member</i></font></b><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("                  </i></font></p>");
out.println("                <p><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" ><a href=\"LoginSuccess\"><font size=\"3\" >Home<font face=\"Arial, Helvetica,   sans-serif\">");
out.println("                  </font></font></a></font><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font><font face=\"Arial,   Helvetica, sans-serif\" size=\"2\" ><i><br>");
out.println("                  </i><a href=\"Changeinfo\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">C</font><font face=\"Arial, Helvetica,   sans-serif\">hange");
out.println("                  Personal Information<br>");
out.println("                  </font></font></a></font> <a href=\"Listmember\"><font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\">Member");
out.println("                  Profiles<br>");
out.println("                  </font></font></a><a href=\"Listproject\"><font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\">Project");
out.println("                  List </font></font></a><a href=\"OfferSpec\"><font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\"><br>");
out.println("                  </font></font></a><a href=\"Ranking\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Member");
out.println("                  Rating </font></font></a><a href=\"OfferSpec\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">");
out.println("                  </font></font></a><br>");
out.println("                </p>");
out.println("                <p><font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\" size=\"2\"><b><font color=\"#FF9900\">For");
out.println("                  Buyer</font></b></font></font><br>");
out.println("                  <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"GeneralReq\">General");
out.println("                  Requirement</a></font></font><br>");
out.println("                  <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"AddTechReq\">Add");
out.println("                  Technical Requirement <font size=\"2\"><i>(bidding)</i></font></a></font></font><br>");
out.println("                  <br>");
out.println("                  <font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#CCCCCC\" size=\"2\"><b><font color=\"#FF9900\">For");
out.println("                  Seller</font></b></font></font><br>");
out.println("                  <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"AddSpecification\">Add");
out.println("                  Specification</a></font></font><br>");
out.println("                  <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"ListBiddingProject\">Bidding</a></font></font><br>");
out.println("                </p>");
out.println("              </div>");
out.println("                <b><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#ffcc00\"><i><br>");
out.println("                Auction Services </i></font></b> <br>");
out.println("                <br>");
out.println("              </div>");
out.println("              <div align=\"center\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i>");
out.println("                </i><a href=\"http://freeboard.adbest.com/KBoard.cgi?db=pennie23\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Auction");
out.println("                Board</font></font></a></font></div>");
out.println("              <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font>");
out.println("              <div align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><a href=\"../MailToUs.html\"><font   size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Mail");
out.println("                To Us</font></font></a><i></i></font></div>");
out.println("<div align=\"center\">");
out.println("<FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\" color=#ff3366 size=2><A ");
out.println("      href=\"Logout\"><FONT size=3><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\">Log Out ");
out.println("</FONT></FONT></A></FONT>");
out.println("</div>");

out.println("              <p>&nbsp;</p>");
out.println("            </div>");
out.println("            <p>&nbsp;</p>");
out.println("          </div>");
out.println("          <p>&nbsp;</p>");
out.println("        </div>");
out.println("      </td>");
out.println("     <td width=\"82%\" height=\"393\" align=\"left\" valign=\"top\">");


    if (password.compareTo("")  == 0 )
    {
      out.println("please input password");
      out.flush();
    }
    else if (confirm.compareTo("")  == 0 )
    {
      out.println("please confirm password");
      out.flush();
    }
    else if (confirm.compareTo(password) != 0 )
    {
      out.println("password not match");
      out.flush();
    }
    else if (type.compareTo("company") == 0)
    {
      if (type == null )
      {
        out.println("please input company");
        out.flush();
      }
    }
    else if (name.compareTo("")  == 0 )
    {
      out.println("please input name");
      out.flush();
    }
    else if (surname.compareTo("")  == 0 )
    {
      out.println("please input surname");
      out.flush();
    }
    else if (email.compareTo("")  == 0 )
    {
      out.println("please input email");
      out.flush();
    }
    else if (sex == null )
    {
      out.println("please input sex");
      out.flush();
    }
    else if (address.compareTo("") == 0)
    {
      out.println("please input address");
      out.flush();
    }
    else if (region.compareTo("") == 0)
    {
      out.println("please input region");
      out.flush();
    }
    else if (zipcode.compareTo("") == 0)
    {
      out.println("please input zipcode");
      out.flush();
    }
    else if (telephone.compareTo("") == 0)
    {
      out.println("please input telephone");
      out.flush();
    }
    else if (type.compareTo("company") == 0)
    {
      if (telephonecompany.compareTo("") == 0 )
      {
        out.println("please input company's tel");
        out.flush();
      }
    }
    else if (confirm.compareTo(password) == 0 )
    {
    out.println("<p align=\"right\"><img src=\"/picture/bar.gif\" width=\"550\" height=\"2\"></p>");
    out.println("<center> <font face=\"Arial, Helvetica, sans-serif\" size=\"5\" color=\"#FF6666\">");
    out.println("	Your Information... <br> ");
    out.println("                            </font> </center>");
    out.println("<table width=\"52%\" border=\"0\" align=\"center\" cellpadding=\"4\" cellspacing=\"2\" color=\"#FF6666\">");
    out.println("  <tr bgcolor=\"#89D8D8\">");
    out.println("    <td width=\"36%\" ><font face=\"Arial, Helvetica, sans-serif\" color=\"#330099\"><b><font size=\"3\">Username</font></b></font></td>");
    out.println("    <td width=\"64%\"> " + username + "</td>");
    out.println("  </tr>");
    out.println("  <tr>");
    out.println("    <td width=\"36%\" bgcolor=\"#FFFFFF\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#330099\"><b><font size=\"3\">Password</font></b></font></td>");
    out.println("    <td width=\"64%\">" + password + "</td>");
    out.println("  </tr>");
   out.println("  <tr bgcolor=\"#89D8D8\">");
    out.println("    <td  align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#330099\" size=\"3\">Type</font></b></td>");
    out.println("    <td width=\"64%\">" + type + "</td>");
    out.println("  </tr>");
    out.println("  <tr>");
    out.println("    <td bgcolor=\"#FFFFFF\" align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#330099\" size=\"3\">Company");
    out.println("      Name </font></b></td>");
    out.println("    <td width=\"64%\">" + companyname + "</td>");
    out.println("  </tr>");
    out.println("  <tr bgcolor=\"#89D8D8\">");
    out.println("    <td align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#330099\" size=\"3\">Name</font></b></td>");
    out.println("    <td width=\"64%\">" + name + "</td>");
    out.println("  </tr>");
    out.println("  <tr>");
    out.println("    <td bgcolor=\"#FFFFFF\" align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#330099\" size=\"3\">Surname</font></b></td>");
    out.println("    <td width=\"64%\">" + surname + "</td>");
    out.println("  </tr>");
    out.println("  <tr bgcolor=\"#89D8D8\">");
    out.println("    <td align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#330099\" size=\"3\">e-mail</font></b></td>");
    out.println("    <td width=\"64%\">" + email + "</td>");
    out.println("  </tr>");
    out.println("  <tr>");
    out.println("    <td bgcolor=\"#FFFFFF\" align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#330099\" size=\"3\">Sex</font></b></td>");
    out.println("    <td width=\"64%\">" + sex + "</td>");
    out.println("  </tr>");
    out.println("  <tr>");
    out.println("  <tr bgcolor=\"#89D8D8\">");
    out.println("    <td align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#330099\" size=\"3\">Birth_date</font></b></td>");
    out.println("    <td width=\"64%\">" + date + "</td>");
    out.println("  </tr>");
    out.println("  <tr>");
    out.println("    <td bgcolor=\"#FFFFFF\" align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#330099\" size=\"3\">Age</font></b></td>");
    out.println("    <td width=\"64%\">" + age + "</td>");
    out.println("  </tr>");
    out.println("  <tr>");
    out.println("  <tr bgcolor=\"#89D8D8\">");
    out.println("    <td  align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#330099\" size=\"3\">Address");
    out.println("      </font></b></td>");
    out.println("    <td width=\"64%\">" + address + "</td>");
    out.println("  </tr>");
    out.println("  <tr>");
    out.println("    <td bgcolor=\"#FFFFFF\" align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#330099\" size=\"3\">Region</font></b></td>");
    out.println("    <td width=\"64%\">" + region + "</td>");
    out.println("  </tr>");
    out.println("  <tr bgcolor=\"#89D8D8\">");
    out.println("    <td  align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#330099\" size=\"3\">Province</font></b></td>");
    out.println("    <td width=\"64%\">" + province + "</td>");
    out.println("  </tr>");
    out.println("  <tr>");
    out.println("    <td bgcolor=\"#FFFFFF\" align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#330099\" size=\"3\">Zip");
    out.println("      Code </font></b></td>");
    out.println("    <td width=\"64%\">" + zipcode + "</td>");
    out.println("  </tr>");
    out.println("  <tr bgcolor=\"#89D8D8\">");
    out.println("    <td  align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#330099\" size=\"3\">Telephone_number</font></b></td>");
    out.println("    <td width=\"64%\">" + telephonecompany + "</td>");
    out.println("  </tr>");
    out.println("  <tr>");
    out.println("    <td bgcolor=\"#FFFFFF\" align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#330099\" size=\"3\">Telephone_No");
    out.println("      (company) </font></b></td>");
    out.println("    <td width=\"64%\">" + telephone + "</td>");
    out.println("  </tr>");
    out.println("  <tr bgcolor=\"#89D8D8\">");
    out.println("    <td align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#330099\" size=\"3\">Mobile_Number");
    out.println("      </font></b></td>");
    out.println("    <td width=\"64%\">" + mobilenumber + "</td>");
    out.println("  </tr>");
    out.println("  <tr>");
    out.println("    <td bgcolor=\"#FFFFFF\" align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#330099\" size=\"3\">Pager</font></b></td>");
    out.println("    <td width=\"64%\">" + pagernumber + "</td>");
    out.println("  </tr>");
    out.println("  <tr bgcolor=\"#89D8D8\">");
    out.println("    <td  align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#330099\" size=\"3\">Occupation");
    out.println("      </font></b></td>");
    out.println("    <td width=\"64%\">" + occupation + "</td>");
    out.println("  </tr>");
    out.println("</table>");
    out.println(" <form method=\"Post\" action=\"Updatemember\"> ");
    out.println(" <input type=hidden Name = \"username\" value = \"" + username + "\">" );
    out.println(" <input type=hidden Name = \"password\" value = \"" + password + "\">" );
    out.println(" <input type=hidden Name = \"confirm\" value = \"" + confirm + "\">" );
    out.println(" <input type=hidden Name = \"email\" value = \"" + email + "\">" );
    out.println(" <input type=hidden Name = \"name\" value = \"" + name + "\">" );
    out.println(" <input type=hidden Name = \"surname\" value = \"" + surname + "\">" );
    out.println(" <input type=hidden Name = \"companyname\" value = \"" + companyname + "\">" );
    out.println(" <input type=hidden Name = \"sex\" value = \"" + sex + "\">" );
    out.println(" <input type=hidden Name = \"date\" value = \"" + date + "\">" );
    out.println(" <input type=hidden Name = \"age\" value = \"" + age + "\">" );
    out.println(" <input type=hidden Name = \"telephone\" value = \"" + telephone + "\">" );
    out.println(" <input type=hidden Name = \"region\" value = \"" + region + "\">" );
    out.println(" <input type=hidden Name = \"type\" value = \"" + type + "\">" );
    out.println(" <input type=hidden Name = \"province\" value = \"" + province + "\">" );
    out.println(" <input type=hidden Name = \"telephonecompany\" value = \"" + telephonecompany + "\">" );
    out.println(" <input type=hidden Name = \"address\" value = \"" + address + "\">" );
    out.println(" <input type=hidden Name = \"zipcode\" value = \"" + zipcode + "\">" );
    out.println(" <input type=hidden Name = \"occupation\" value = \"" + occupation + "\">" );
    out.println(" <input type=hidden Name = \"pager\" value = \"" + pager + "\">" );
    out.println(" <input type=hidden Name = \"pagernumber\" value = \"" + pagernumber + "\">" );
    out.println(" <input type=hidden Name = \"mobilenumber\" value = \"" + mobilenumber + "\">" );
    out.println(" <center>");
    out.println(" <input type=\"submit\" name=\"Submit\" value=\"Submit\">");
    out.println(" <input type=\"reset\" name=\"Cancel\" value=\"Cancel\">");
    out.println(" </center>");
    out.println(" <p>&nbsp;</p>");
    out.println("</form>");
    out.println("<p>&nbsp;</p>");
    out.println("<p>&nbsp;</p>");
    out.println("</td>");
    out.println("  </tr>");
    out.println("</table>");
    out.println("</body>");
    out.println("</html>");
    out.flush();
    }
    }
}