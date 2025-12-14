////////////////////This class use for add Cdrom specification//////////////////////
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public  class AddCdrom extends HttpServlet
{
    public void   doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
    Query_data Query = new Query_data();
    resp.setContentType("text/html");
    PrintWriter out = resp.getWriter();
    HttpSession session = req.getSession(true);
    String Str_Devicename = req.getParameter("Device");
    String Str_Query ;
    String Brand_cdrom ;
    String x ;
    String Interface ;
    String Quantity_cdrom ;
    int rowCount ;
    out.println("<html>");
    out.println("<head>");
    out.println("<title>Internet Auction [Add Technical Requirement] : CE.KMITL</title>");
    out.println("</head>");
    out.println("<body bgcolor=\"#FFFFFF\">");
    out.println("<table width=\"90%\" border=\"0\" align=\"center\" bgcolor=\"#FFFFFF\" cellpadding=\"4\" cellspacing=\"2\" height=\"144\">");
    out.println(" <tr valign=\"top\" align=\"center\">");
   	out.println("<td colspan=\"2\" height=\"71\"><img src=\"/picture/AddDevices.jpg\" width=\"970\" height=\"70\"></td>");
    out.println("</td>");
    out.println("</tr>");
    out.println("  <tr valign=\"top\" align=\"center\" bgcolor=\"#FFFFFF\"> ");
    out.println("    <td height=\"99\" colspan=\"2\">");
    out.println("      <div align=\"left\"><font size=\"3\" face=\"Arial, Helvetica, sans-serif\" ><i><b>");
    out.println("  <font color=\"#000066\">CD-ROM Details </font></i></b></font></div>");
	  out.println(" <br>");
    out.println("</font></b></i><b><font color=\"#000066\"><font color=\"#003333\">Brand :<br>");
    out.println("Speed :<br>");
    out.println("Interface :</font></font></b></font></div><br>");
    out.println("    </td>");
    out.println("  </tr>");
    out.println("  <tr bgcolor=\"#ffb56a\" bordercolor=\"#FFFFFF\"> ");
    out.println("    <td height=\"33\" align=\"center\" colspan=\"2\">");
    out.println("      <div align=\"right\"><font size=\"3\" face=\"Arial, Helvetica, sans-serif\"><i><b>");
    out.println("          <font color=\"#000066\">Choose CD-ROM Details ...</font></i></b></font></div>");
    out.println("    </td>");
    out.println("  </tr>");
    Brand_cdrom = req.getParameter("Brand_cdrom") ;
    x  = req.getParameter("x");
    Interface = req.getParameter("Interface");
    Quantity_cdrom = req.getParameter("Quantity_cdrom");
    if (Brand_cdrom == null)
    {
      out.println("<form method = \"Get\" name =\"form\" action = \"AddCdrom\" >");
      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand CD-Rom");
      out.println("           <select name=\"Brand_cdrom\" size=\"1\">");
      Query.Query("Brand_cdrom","cd_rom","",out);
      out.println("</select>");
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Brand\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }
    else if (x == null)
    {
      out.println("<form method = \"Get\" name = \"form\" action = \"AddCdrom\">");
      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand CD-Rom");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_cdrom);
      out.println("</tr>");
      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Speed CD-Rom (X)");
      out.println("<select name=\"x\" size=\"1\">");
      if (Brand_cdrom.compareTo("Not specific") == 0 )
      {
        Query.Query("x","cd_rom","",out);
      }
      else
      {
       Query.Query("x","cd_rom"," where Brand_cdrom  ='" + Brand_cdrom +"'",out) ;
      }
      out.println("</select>");
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" >");
      out.println(" <input type=hidden Name = \"Brand_cdrom\" value = \"" + Brand_cdrom + "\">" );
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Speed\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }
     else if (Interface == null)
    {
      out.println("<form method = \"Get\" name =\"form\" action = \"AddCdrom\" >");
      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand CD-Rom");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_cdrom);
      out.println("</tr>");
      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Speed CD-Rom (X)");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\"  width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(x);
      out.println("</tr>");
      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Interface");
      out.println("<select name=\"Interface\" size=\"1\">");
      if ((x.compareTo("Not specific") == 0 ) && (Brand_cdrom.compareTo("Not specific") == 0))
      {
        Query.Query("Interface","cd_rom","",out);
      }
      else if ((x.compareTo("Not specific") == 0) && (Brand_cdrom.compareTo("Not specific") != 0))
      {
        Query.Query("Interface","cd_rom"," where Brand_cdrom ='" + Brand_cdrom + "'",out);
      }
      else if ((Brand_cdrom.compareTo("Not specific") == 0 ) && (x.compareTo("Not specific") != 0))
      {
        Query.Query("Interface","cd_rom"," where x ='" + x + "'",out);
      }
      else if ((Brand_cdrom.compareTo("Not specific") != 0 ) && (x.compareTo("Not specific") != 0))
      {
        Query.Query("Interface","cd_rom"," where x ='" + x + "' and Brand_cdrom = '" + Brand_cdrom + "'",out);
      }
      out.println("</select>");
      out.println(" <input type=hidden Name = \"Brand_cdrom\" value = \"" + Brand_cdrom + "\">" );
      out.println(" <input type=hidden Name = \"x\" value = \"" + x + "\">" );
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Interface\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }
     else if (Quantity_cdrom == null)
    {
      out.println("<form method = \"Get\" name =\"form\" action = \"AddCdrom\" >");
      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><i><font color=\"#003333\">");
      out.println("Your Requirements  " + "</i><br>");
      out.println("<br>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#003366\"><b><font color=\"#990000\">");
      out.println("<font color=\"#006666\">CD-Rom</font>   " + Brand_cdrom + "<br>");
      out.println("<font color=\"#006666\">SPEED</font>  " + x  + "<br>");
      out.println("<font color=\"#006666\">INTERFACE</font> " + Interface + "<br>");
      out.println("<br>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Enter Quantity   ");
      out.println(" <input type=hidden Name = \"Brand_cdrom\" value = \"" + Brand_cdrom + "\">" );
      out.println(" <input type=hidden Name = \"x\" value = \"" + x + "\">" );
      out.println(" <input type=hidden Name = \"Interface\" value = \"" + Interface + "\">" );
      out.println("   <SCRIPT LANGUAGE=\"JavaScript\">" );
      out.println("<!-- Begin" );
       out.println("function validate(field) {" );
out.println("var valid = \"0123456789\"" );
out.println("var ok = \"yes\";" );
out.println("var temp;" );

out.println("for (var i=0; i<field.value.length; i++) {" );
out.println("temp = \"\" + field.value.substring(i, i+1);" );
out.println("if (valid.indexOf(temp) == \"-1\") ok = \"no\";" );

out.println("}" );
out.println("if (field.value.length == 0 ) ok = \"blank\";" );

out.println("if (ok == \"blank\") {" );
out.println("alert(\"Invalid entry!  no blank\");" );
out.println("field.focus();" );
out.println("field.select();" );
out.println("   }" );

out.println("if (ok == \"no\") {" );
out.println("alert(\"Invalid entry!  Only characters and numbers are accepted!\");" );
out.println("field.focus();" );
out.println("field.select();" );
out.println("   }" );
out.println("	if ((ok != \"blank\") && (ok != \"no\") ) document.form.submit(); ");
out.println("}" );

out.println("</script>" );
//////////////////////////  End script /////////////



      out.println("<input type=\"text\" name=\"Quantity_cdrom\" size=\"2\" maxlength=\"2\" >");
      out.println("<br>");
      out.println("<br>");
      out.println("<input type=\"button\" name=\"Submit\" value=\"Submit\" onClick=\"validate(Quantity_cdrom)\" >");
      out.println("    </td>");
      out.println("  </tr>");
      out.println("</form>");

     }
     else
     {
      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><i><font color=\"#003333\">");
      out.println("Your Requirements  " + "</i><br>");
      out.println("<br>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#003366\"><b><font color=\"#990000\">");
      out.println("<font color=\"#006666\">CD-ROM</font>   " + Brand_cdrom + "<br>");
      out.println("<font color=\"#006666\">SPEED</font>  " + x  + "<br>");
      out.println("<font color=\"#006666\">INTERFACE</font> " + Interface + "<br>");
      out.println("<font color=\"#006666\">Quantity</font> " + Quantity_cdrom + "<br>");
      //// form send value to addspec
      out.println("<br>");
      out.println("<form method = \"Post\" action = \"Sendspec\">");
      out.println("<input type=hidden Name = \"Brand_cdrom\" value = \"" + Brand_cdrom + "\">" );
      out.println("<input type=hidden Name = \"x\" value = \"" + x + "\">" );
      out.println("<input type=hidden Name = \"Interface\" value = \"" + Interface + "\">" );
      out.println("<input type=hidden Name = \"Quantity_cdrom\" value = \"" + Quantity_cdrom + "\">" );
      out.println("<input type=hidden Name = \"Device_name\" value = \"" + "CDROM" + "\">" );

      out.println("<input type=\"submit\" name=\"OK\" value=\"Add this spec\">");
      out.println("</from>");
      out.println("</td>");
      out.println("</tr>");




     }

    out.println("  <tr bgcolor=\"#99dddd\">");
    out.println("    <td height=\"35\" colspan=\"2\">");
    out.println("        <div align=\"center\"> ");
    out.println("<input type=\"button\" name=\"back\" value=\"Back\" onClick=\"history.back()\">");
    out.println("        </div>");
    out.println("    </td>");
    out.println("  </tr>");
    out.println("</table>");
    out.println("</form>");
    out.println("</body>");
    out.println("</html>");
    }
}
