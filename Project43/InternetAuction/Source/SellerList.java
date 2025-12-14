
import oracle.sql.*;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import oracle.jdbc.driver.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
public class SellerList extends HttpServlet implements Serializable
{
    public void   doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
      java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
      Connection con = null;
      Statement stmt = null;
      ResultSet rs= null;
      resp.setContentType("text/html");
      HttpSession session = req.getSession(true);
      String username      = (String)session.getValue("username");
      String companyname   = (String)session.getValue("companyname");
      String Tech_req_id   = req.getParameter("Tech_req_id");
      if (username == null)
      resp.sendRedirect("../Pleaselogin.html");
      out.println("      <html>");
out.println("<head>");
out.println("<title> Seller list: CE.KMITL</title>");
out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
out.println("<style><!-- A:link, A:visited { text-decoration: none; color: #ffffff}  A:hover { text-decoration: none; font-weight: underline; color :   #33ccff} // --> </style>");
out.println("</head>");
out.println("<body bgcolor=\"#FFFFFF\">");
out.println("<table width=\"100%\" border=\"0\" height=\"609\">");
out.println("  <tr>");
out.println("     <td colspan=\"2\" height=\"110\"><img src=\"/picture/bidding.jpg\" width=\"970\" height=\"98\"></td>");
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
out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#CC3399\">");
out.println(" <font color=\"#330033\"><b>. . S e l l e r &nbsp;&nbsp;   L i s t  . .</b></font></font><br><br><br>");
      out.println("  <table width=\"80%\" border=\"1\">");
      out.println("    <tr bgcolor = \"#00aacc\">");
      out.println("      <td width=\"10%\">");
      out.println("        <div align=\"center\"><font size=\"4\" color=\"#000000\">Project ID</font><font size=\"5\">");
      out.println("          </font></div>");
      out.println("      </td>");

      out.println("      <td width=\"10%\">");
      out.println("        <div align=\"center\"><font size=\"4\" color=\"#000000\">Seller Name</font><font size=\"5\">");
      out.println("          </font></div>");
      out.println("      </td>");
      out.println("      <td width=\"10%\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>");
      out.println("    </tr>");
      Specification spectest =new Specification();
      try
      {
      	  DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
	    }
	    catch (java.sql.SQLException ko){ out.println("Register error");}
      try
     {
      con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
      stmt = con.createStatement();
      //////----Find Max spec_id-----///
      String findmax_specid = "select Tech_req_id,seller_name from bidding_table where tech_req_id =" + Tech_req_id ;
     	rs = stmt.executeQuery(findmax_specid);
      while (rs.next())
		  {

         int number_of_bid = 0 ;
         Connection con2  = null;
         Statement  stmt2 = null;
         ResultSet  rs2   = null;
         try
         {
             con2 = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
             stmt2 = con2.createStatement();
             //////----Find Max spec_id-----///
             String find_number_of_bid = new String("select tech_req_id,seller_name from bidding_table where tech_req_id" + " = " + Tech_req_id);
             rs2 = stmt2.executeQuery(find_number_of_bid);
             while (rs2.next())
             {
                number_of_bid++ ;
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
	       { if (rs2 != null)  {rs2.close();}
           if (stmt2 != null){stmt2.close();}
  		     if (con2 != null) {con2.close();}
         }
	       catch (Exception ex){}
	       }
         out.println("<tr height = \"25\">");
         out.println("<td width=\"20%\"> <div align=\"center\"><font size=\"2\" color=\"#0000ff\"><b>" +  rs.getString(1) +  "</b></font></div></td>");
         out.println("<td width=\"20%\"> <div align=\"center\"><font size=\"2\" color=\"#0000ff\"><b>" +  rs.getString(2) +  "</b></font></div></td>");

         out.println("<td width=\"13%\">");
         out.println("  <form method=\"Post\" action=\"ViewSellerDetail\" name=\"Test\">");
     //    if (rs.getString(8).compareTo("yes") == 0)
         {
         out.println(" <input type=hidden Name = \"Tech_req_id\" value = \"" + rs.getString(1) + "\">" );
         out.println(" <input type=hidden Name = \"Sellername\" value = \"" + rs.getString(2) + "\">" );
         out.println("<center>");
         out.println("  <input type=\"submit\" name=\"projectnumber\" value=\" View Detail\">");
         out.println("</center>");

         }
         out.println("   </form> ");
         out.println("</td>");
         out.println("</tr>");
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
    out.println("</table>");
   out.println("</td>");
out.println("  </tr>");
out.println("</table>");
out.println("</body>");
out.println("</html>");
out.flush();
    }

}

