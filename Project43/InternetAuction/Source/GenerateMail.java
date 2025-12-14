import  sun.net.smtp.*;
import  oracle.sql.*;
import  oracle.jdbc.driver.*;
import  java.sql.*;
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.lang.String;
public class GenerateMail
{
   void GenerateHtml(SmtpClient smtp,PrintStream msg,int tech_req_id,String best_username)
   {
      Connection con = null;
      Statement stmt = null;
      ResultSet rs= null;
      Specification Sellerspec =new Specification();
      try
      {
      	  DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
	    }
	    catch (java.sql.SQLException ko){ msg.println("Register error");}
      try
      {
        con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
        con.setAutoCommit(false);
        stmt = con.createStatement();
        String findseller_spec = new String("select  tech_req_id,seller_spec,seller_name from bidding_table ");
               findseller_spec += " where tech_req_id =" + tech_req_id + " and seller_name = '" + best_username + "'";
        rs = stmt.executeQuery(findseller_spec);
    	  rs.next();
        BLOB blob;
        ///------------Unserialize object------------///
    	  blob = ((OracleResultSet)rs).getBLOB(2);
        InputStream instream = blob.getBinaryStream();
    	  ObjectInputStream iis = new ObjectInputStream(instream);
        ///------------Read Object------------------//
        Sellerspec= (Specification)iis.readObject();
        //////////////////////////////////////////////////
        //             DISPLAY HTML DATA                //
        //////////////////////////////////////////////////

        msg.println("      <html>");
msg.println("<head>");
msg.println("<title>  Project List: CE.KMITL</title>");
msg.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
msg.println("<style><!-- A:link, A:visited { text-decoration: none; color: #ffffff}  A:hover { text-decoration: none; font-weight: underline; color :   #33ccff} // --> </style>");
msg.println("</head>");
msg.println("<body bgcolor=\"#FFFFFF\">");

        msg.println("     <img src=\"http://161.246.5.182:8080/picture/ProjectList.jpg\" ");
        msg.println("<table width=\"99%\" border=\"0\" cellpadding=\"2\" cellspacing=\"2\" bordercolor=\"#000000\">");
        msg.println("  <tr bgcolor = #89D8D8>");
        msg.println("    <td height=\"5\" width=\"20%\">");
        msg.println("      <div align=\"left\"><font face=\"Arial, Helvetica, sans-serif\"><b><font color=\"#000000\">Buyer name</font></b></font></div>");
        msg.println("    </td>");
        msg.println("    <td height=\"5\" width=\"45%\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">");
        msg.println(Sellerspec.name + "  </font></td>" );
        msg.println(" <td bgcolor = #ffffff rowspan = \"6\" width = \"70%\">");
        msg.println("     <img src=\"http://161.246.5.182:8080/picture/computer_set.JPG\" ");
        msg.println(" width=\"250\" height=\"250\"></td>");
        msg.println("    </td>");
        msg.println("  </tr>");
        msg.println("  <tr bgcolor = #c6e3e3>");
        msg.println("    <td height=\"5\" width=\"20%\">");
        msg.println("      <div align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#000000\">Buyer company");
        msg.println("    </font></b></div>");
        msg.println("    </td>");
        msg.println("    <td height=\"5\"  width=\"45%\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">");
        msg.println(Sellerspec.company_name + " </font> </td>");
        msg.println("  </tr>");
        msg.println(" <tr bgcolor = #89D8D8>");
        msg.println("    <td height=\"10\" width=\"20%\">");
        msg.println("      <div align=\"left\"><font face=\"Arial, Helvetica, sans-serif\"><b><font color=\"#000000\">Project");
        msg.println("        Name</font></b></font></div>");
        msg.println("    </td>");
        msg.println("    <td height=\"10\"  width=\"45%\">");
        msg.println("      <p>" + "<font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">" +  Sellerspec.projectname + "</p>");
        msg.println("    </td>");
        msg.println("  </tr>");
        msg.println("  <tr bgcolor = #c6e3e3>");
        msg.println("    <td height=\"5\" width=\"20%\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#000000\">Project");
        msg.println("      Description</font></b></td>");
        msg.println("    <td height=\"5\"  width=\"45%\">" + "<font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">"+ Sellerspec.projectdescription + "</td>");
        msg.println("  </tr>");
        msg.println("  <tr bgcolor = #89D8D8>");
        msg.println("    <td height=\"5\" width=\"20%\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#000000\">End");
        msg.println("      Date</font></b></td>");
        msg.println("    <td height=\"5\"  width=\"45%\">" + "<font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">" + Sellerspec.Enddate + "</td>");
        msg.println("  </tr>");
        msg.println("  <tr bgcolor = #c6e3e3>");
        msg.println("    <td height=\"5\" width=\"20%\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#000000\">Max");
        msg.println("      Price (Baht)</font></b></td>");
        msg.println("    <td height=\"5\"  width=\"45%\">" + "<font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">"+ Sellerspec.Maxprice + "</td>");
        msg.println("  </tr>");
        msg.println("</table>");
        ///------------Display Data-----------------///
        msg.println("  <br>");
        msg.println("  <br>");
        msg.println("<table border=0 cellpadding=1 cellspacing=1 height=180 width=\"99%\">");
        msg.println("<tbody>");
        int i_count_part ;
        for (i_count_part = 0 ; i_count_part < Sellerspec.Listpart.size() ; i_count_part++)
        {
           /////////////////////////////////////////////////////////
           //                  DISPLAY TABLE                      //
           /////////////////////////////////////////////////////////
           msg.println("<tr bgcolor=#ffb56a>");
           msg.println("<td height=32><b><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
           msg.println("size=2><font color=\"#000000\" size=\"3\">Part name</font></font></b></td>");
           msg.println("<td colspan=3 height=32>");
           msg.println("<font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">" + Sellerspec.GetPart(i_count_part).Partname + " </font></td>");
           msg.println("</tr>");
           msg.println("<tr bgcolor=#ffb56a>");
           msg.println("<td height=32><b><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
           msg.println("size=2><font color=\"#000000\" size=\"3\">Part description</font></font></b></td>");
           msg.println("<td colspan=3 height=32>");
           msg.println("<font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">" + Sellerspec.GetPart(i_count_part).Partdescription + "</font></td>");
           msg.println("</tr>");
           msg.println("<tr bgcolor=#FFCC99>");
           msg.println("<td height=33 width=\"16%\" bgcolor=\"#FFCC99\">");
           msg.println("<div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
           msg.println("size=2><font color=\"#000000\" size=\"3\"><b>Type Device</b></font></font></div>");
           msg.println("</td>");
           msg.println("<td height=33 width=\"46%\" bgcolor=\"#FFCC99\">");
           msg.println("<div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
           msg.println("size=2><font color=\"#000000\" size=\"3\"><b> Detail </b></font></font></div>");
           msg.println("</td>");
           msg.println("<td colspan=2 height=33 bgcolor=\"#FFCC99\">");
           msg.println("<div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
           msg.println("size=2><b><font color=\"#000000\" size=\"3\">Quantity </font></b></font></div>");
           msg.println("</td>");
           msg.println("</tr>");
           ////--------------List Each Part-----------------//
           for (int row = 0 ; row < Sellerspec.GetPart(i_count_part).Listdevice.size()  ; row++)
           {
              msg.println("<tr bgcolor=#CCCCFF>");
              msg.println("  <td height=32 width=\"16%\" bgcolor=\"#ffe4ca\">");
              msg.println("    <div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
              msg.println("    size=2><font color=\"#FF0033\" size=\"3\"><b><font color=\"#000000\">" + Sellerspec.GetPart(i_count_part).GetDevice(row).GetType() + "</font></b></font></font></div>");
              msg.println("  </td>");
              msg.println("  <td height=32 width=\"70%\" bgcolor=\"#ffe4ca\">");
              msg.println("    <div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
              msg.println("    size=2><b><font color=\"#000000\" size=\"3\">");
              msg.println(Sellerspec.GetPart(i_count_part).GetDevice(row).Data[0]);;
              msg.println("</font></b></font></div>");
              msg.println("  </td>");
              msg.println("  <td colspan=2 height=32 bgcolor=\"#ffe4ca\">");
              msg.println("    <div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
              msg.println("    size=2><b><font color=\"#000000\" size=\"3\">");
              msg.println(Sellerspec.GetPart(i_count_part).GetDevice(row).Quantity);
              msg.println("</font></b></font></div>");
              msg.println("  </td>");
              msg.println("</tr>");
           }
          /////-----------------MAKE LINE--------------------////
           msg.println("<tr bgcolor=#000000>");
           msg.println("  <td colspan=4 height=7></td>");
           msg.println("  </tr>");
        }//{End List Project detail}
        con.commit();
        msg.println("</tbody>");
        msg.println("</table>");
        msg.println("</body>");
        msg.println("</html>");
     }
     catch (Exception ex)
     {
    	 msg.println("Exception");

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
