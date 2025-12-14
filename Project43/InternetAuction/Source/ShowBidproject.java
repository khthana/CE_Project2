
import oracle.sql.*;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import oracle.jdbc.driver.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
public class ShowBidproject extends HttpServlet implements Serializable
{
    public void   doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
      java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
      resp.setContentType("text/html");
      HttpSession session = req.getSession(true);
      String tech_req_id = req.getParameter("tech_req_number");
      String username      = (String)session.getValue("username");
      String companyname   = (String)session.getValue("companyname");
      if (username == null)
          resp.sendRedirect("../Pleaselogin.html");
      out.println("      <html>");
out.println("<head>");
out.println("<title> Show Bidding project: CE.KMITL</title>");
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
 Connection con = null;
      Statement stmt = null;
      ResultSet rs= null;


      Specification spectest =new Specification();
      try
      {
      	  DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
	    }
	    catch (java.sql.SQLException ko){ out.println("Register error");}
      try
      {
        con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
        con.setAutoCommit(false);
        stmt = con.createStatement();
        String findmax_specid = new String("select  tech_req_id,project_spec from buyer_tech_req where tech_req_id =" + tech_req_id);
        rs = stmt.executeQuery(findmax_specid);
    	  rs.next();
        BLOB blob;
        ///------------Unserialize object------------///
    	  blob = ((OracleResultSet)rs).getBLOB(2);
        InputStream instream = blob.getBinaryStream();
    	  ObjectInputStream iis = new ObjectInputStream(instream);
        ///------------Read Object------------------//
        spectest = (Specification)iis.readObject();
        //////////////////////////////////////////////////
        //             DISPLAY HTML DATA                //
        //////////////////////////////////////////////////
        out.println("<table width=\"99%\" border=\"0\" cellpadding=\"2\" cellspacing=\"2\" bordercolor=\"#000000\">");
        out.println("  <tr bgcolor = #89D8D8>");
        out.println("    <td height=\"5\" width=\"20%\">");
        out.println("      <div align=\"left\"><font face=\"Arial, Helvetica, sans-serif\"><b><font color=\"#000000\">Buyer name</font></b></font></div>");
        out.println("    </td>");
        out.println("    <td height=\"5\" width=\"45%\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">");
        out.println(spectest.name + "  </font></td>" );
        out.println(" <td bgcolor = #ffffff rowspan = \"6\" width = \"70%\">");
        out.println("     <img src=\"/picture/computer_set.JPG\" ");
        out.println(" width=\"250\" height=\"250\"></td>");
        out.println("    </td>");
        out.println("  </tr>");
        out.println("  <tr bgcolor = #c6e3e3>");
        out.println("    <td height=\"5\" width=\"20%\">");
        out.println("      <div align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#000000\">Buyer company");
        out.println("    </font></b></div>");
        out.println("    </td>");
        out.println("    <td height=\"5\"  width=\"45%\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">");
        out.println(spectest.company_name + " </font> </td>");
        out.println("  </tr>");
        out.println(" <tr bgcolor = #89D8D8>");
        out.println("    <td height=\"10\" width=\"20%\">");
        out.println("      <div align=\"left\"><font face=\"Arial, Helvetica, sans-serif\"><b><font color=\"#000000\">Project");
        out.println("        Name</font></b></font></div>");
        out.println("    </td>");
        out.println("    <td height=\"10\"  width=\"45%\">");
        out.println("      <p>" + "<font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">" +  spectest.projectname + "</p>");
        out.println("    </td>");
        out.println("  </tr>");
        out.println("  <tr bgcolor = #c6e3e3>");
        out.println("    <td height=\"5\" width=\"20%\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#000000\">Project");
        out.println("      Description</font></b></td>");
        out.println("    <td height=\"5\"  width=\"45%\">" + "<font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">"+ spectest.projectdescription + "</td>");
        out.println("  </tr>");
        out.println("  <tr bgcolor = #89D8D8>");
        out.println("    <td height=\"5\" width=\"20%\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#000000\">End");
        out.println("      Date</font></b></td>");
        out.println("    <td height=\"5\"  width=\"45%\">" + "<font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">" + spectest.Enddate + "</td>");
        out.println("  </tr>");
        out.println("  <tr bgcolor = #c6e3e3>");
        out.println("    <td height=\"5\" width=\"20%\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#000000\">Max");
        out.println("      Price (Baht)</font></b>");
        out.println("</td>");
        out.println("    <td height=\"5\"  width=\"45%\">" + "<font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">"+ spectest.Maxprice + "</td>");
        out.println("  </tr>");
        out.println("</table>");
        ///------------Display Data-----------------///
        out.println("  <br>");
        out.println("  <br>");
        out.println("<table border=0 cellpadding=1 cellspacing=1 height=180 width=\"99%\">");
        out.println("<tbody>");
        int i_count_part ;
        for (i_count_part = 0 ; i_count_part < spectest.Listpart.size() ; i_count_part++)
        {
           /////////////////////////////////////////////////////////
           //                  DISPLAY TABLE                      //
           /////////////////////////////////////////////////////////
           out.println("<tr bgcolor=#ffb56a>");
           out.println("<td height=32><b><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
           out.println("size=2><font color=\"#000000\" size=\"3\">Part name</font></font></b></td>");
           out.println("<td colspan=3 height=32>");
           out.println("<font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">" + spectest.GetPart(i_count_part).Partname + " </font></td>");
           out.println("</tr>");
           out.println("<tr bgcolor=#ffb56a>");
           out.println("<td height=32><b><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
           out.println("size=2><font color=\"#000000\" size=\"3\">Part description</font></font></b></td>");
           out.println("<td colspan=3 height=32>");
           out.println("<font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">" + spectest.GetPart(i_count_part).Partdescription + "</font></td>");
           out.println("</tr>");
           out.println("<tr bgcolor=#FFCC99>");
           out.println("<td height=33 width=\"16%\" bgcolor=\"#FFCC99\">");
           out.println("<div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
           out.println("size=2><font color=\"#000000\" size=\"3\"><b>Type Device</b></font></font></div>");
           out.println("</td>");
           out.println("<td height=33 width=\"46%\" bgcolor=\"#FFCC99\">");
           out.println("<div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
           out.println("size=2><font color=\"#000000\" size=\"3\"><b> Detail </b></font></font></div>");
           out.println("</td>");
           out.println("<td colspan=2 height=33 bgcolor=\"#FFCC99\">");
           out.println("<div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
           out.println("size=2><b><font color=\"#000000\" size=\"3\">Quantity </font></b></font></div>");
           out.println("</td>");
           out.println("</tr>");
           ////--------------List Each Part-----------------//
           for (int row = 0 ; row < spectest.GetPart(i_count_part).Listdevice.size()  ; row++)
           {
              out.println("<tr bgcolor=#CCCCFF>");
              out.println("  <td height=32 width=\"16%\" bgcolor=\"#ffe4ca\">");
              out.println("    <div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
              out.println("    size=2><font color=\"#FF0033\" size=\"3\"><b><font color=\"#000000\">" + spectest.GetPart(i_count_part).GetDevice(row).GetType() + "</font></b></font></font></div>");
              out.println("  </td>");
              out.println("  <td height=32 width=\"70%\" bgcolor=\"#ffe4ca\">");
              out.println("    <div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
              out.println("    size=2><b><font color=\"#000000\" size=\"3\">");
              for (int col = 0 ; col < spectest.GetPart(i_count_part).GetDevice(row).Data.length ; col++)
              {
                out.println(spectest.GetPart(i_count_part).GetDevice(row).Data[col]);;
              }
              out.println("</font></b></font></div>");
              out.println("  </td>");
              out.println("  <td colspan=2 height=32 bgcolor=\"#ffe4ca\">");
              out.println("    <div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
              out.println("    size=2><b><font color=\"#000000\" size=\"3\">");
              out.println(spectest.GetPart(i_count_part).GetDevice(row).Quantity);
              out.println("</font></b></font></div>");
              out.println("  </td>");
              out.println("</tr>");
           }
          /////-----------------MAKE LINE--------------------////
           out.println("<tr bgcolor=#000000>");
           out.println("  <td colspan=4 height=7></td>");
           out.println("  </tr>");
        }//{End List Project detail}
        con.commit();
        out.println("</tbody>");
        out.println("</table>");
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
     out.println("<center>");
     out.println("  <form method=\"Post\" action=\"SellerBiddingProject\" name=\"Test\">");
     out.println(" <input type=hidden Name = \"tech_req_number\" value = \"" + tech_req_id + "\">" );
     out.println("  <input type=\"submit\" name=\"projectnumber\" value=\" Go To Bidding\">");
     out.println("</form>");
     out.println("</center>");
     out.println("</td>");
     out.println("  </tr>");
     out.println("</table>");
     out.println("</body>");
     out.println("</html>");
     out.flush();
    }

}


