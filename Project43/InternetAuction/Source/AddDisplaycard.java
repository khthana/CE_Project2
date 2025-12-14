////////////////////This class use for add Display card specification//////////////////////
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public  class AddDisplaycard extends HttpServlet
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
    String Brand_display ;
    String Type_display ;
    String Chip ;
    String Memory ;

    String Quantity_display;
    int rowCount ;
    out.println("<html>");
    out.println("<head>");
    out.println("<title>Internet Auction [Add Technical Requirement] : CE.KMITL</title>");
    out.println("</head>");


    out.println("<body bgcolor=\"#FFFFFF\">");
   // out.println("<p align=\"right\"><font size=\"6\" color=\"#9999FF\"><i><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#003333\">Add Devices </font></b></i></font></p>");
   // out.println("<p align=\"right\"><img src=\"bar.gif\" width=\"550\" height=\"2\"></p>");
   // out.println("<p align=\"right\">&nbsp;</p>");
    out.println("<table width=\"90%\" border=\"0\" align=\"center\" bgcolor=\"#FFFFFF\" cellpadding=\"4\" cellspacing=\"2\" height=\"144\">");

    out.println(" <tr valign=\"top\" align=\"center\">");
   	out.println("<td colspan=\"2\" height=\"71\"><img src=\"/picture/AddDevices.jpg\" width=\"970\" height=\"70\"></td>");
    out.println("</td>");
    out.println("</tr>");

	  out.println("<tr valign=\"top\" align=\"center\" bgcolor=\"#FFFFFF\">");
    out.println("<td colspan=\"2\" height=\"99\">");
    out.println(" <div align=\"left\"><font size=\"3\" face=\"Arial, Helvetica, sans-serif\"><i><b><font color=\"#000066\"><br> ");
    out.println(" Display card Details<br>");
    out.println(" <br>");
    out.println("</font></b></i><b><font color=\"#000066\"><font color=\"#003333\">Brand :<br>");
    out.println("Type display :<br>");
    out.println("Chip set :<br>");
	  out.println("Memory :</font></font></b></font></div><br>");
    out.println(" </td>");
    out.println(" </tr>");

    out.println("  <tr bgcolor=\"#ffb56a\" bordercolor=\"#FFFFFF\"> ");
    out.println("    <td height=\"33\" align=\"center\" colspan=\"2\">");
    out.println("      <div align=\"right\"><font size=\"3\" face=\"Arial, Helvetica, sans-serif\"><i><b>");
    out.println("          <font color=\"#000066\">Choose Display card Details ...</font></i></b></font></div>");
    out.println("    </td>");
    out.println("  </tr>");

    Brand_display = req.getParameter("Brand_display") ;
    Type_display  = req.getParameter("Type_display");
    Chip  = req.getParameter("Chip");
    Memory     = req.getParameter("Memory");
    Quantity_display = req.getParameter("Quantity_display");

    if (Brand_display == null)
    {
      out.println("<form method = \"Get\" action = \"AddDisplaycard\">");

      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand display");
      out.println("           <select name=\"Brand_display\" size=\"1\">");
                              Query.Query("Brand_display","display_card","",out);
      out.println("</select>");
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Brand\">");
      out.println("    </td>");
      out.println("</tr>");

      out.println("</form>");
    }
    else if (Type_display == null)
    {
  //    out.println("Your Select Brand monitor >>>>> " + Brand_monitor+"<br>");
      out.println("<form method = \"Get\" action = \"AddDisplaycard\">");
     //row1
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand display");
      out.println("    </td>");
      out.println("    <td height=\"34\" align=\"center\" width=\"50%\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_display);
      out.println("</tr>");

      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Type display");
      out.println("<select name=\"Type_display\" size=\"1\">");

      if (Brand_display.compareTo("Not specific") == 0 )
      {
        Query.Query("Type_display","display_card","",out);
      }
      else
      {
       Query.Query("Type_display","display_card"," where Brand_display  ='" + Brand_display +"'",out) ;
      }
      out.println("</select>");
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" >");
      out.println(" <input type=hidden Name = \"Brand_display\" value = \"" + Brand_display + "\">" );
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Type\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }
     else if (Chip == null)
    {
      out.println("<form method = \"Get\" action = \"AddDisplaycard\">");
      ///row 1
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand display card");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_display);
      out.println("</tr>");

      ///row2
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Type display card");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Type_display);
      ///row3
      out.println("</tr>");
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Chip set");
      out.println("<select name=\"Chip\" size=\"1\">");
      if ((Type_display.compareTo("Not specific") == 0 ) && (Brand_display.compareTo("Not specific") == 0))
      {
        Query.Query("Chip","display_card","",out);
      }
      else if ((Type_display.compareTo("Not specific") == 0) && (Brand_display.compareTo("Not specific") != 0))
      {
        Query.Query("Chip","display_card"," where Brand_display ='" + Brand_display + "'",out);
      }
      else if ((Brand_display.compareTo("Not specific") == 0 ) && (Type_display.compareTo("Not specific") != 0))
      {
        Query.Query("Chip","display_card"," where Type_display ='" + Type_display + "'",out);
      }
      else if ((Brand_display.compareTo("Not specific") != 0 ) && (Type_display.compareTo("Not specific") != 0))
      {
        Query.Query("Chip","display_card"," where Type_display ='" + Type_display + "' and Brand_display = '" + Brand_display + "'",out);
      }
      out.println("</select>");
      out.println(" <input type=hidden Name = \"Brand_display\" value = \"" + Brand_display + "\">" );
      out.println(" <input type=hidden Name = \"Type_display\" value = \"" + Type_display + "\">" );
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Chipset\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }


      else if (Memory == null)
    {
      out.println("<form method = \"Get\" action = \"AddDisplaycard\">");
      ///row 1
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand display card");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_display);
      out.println("</tr>");

      ///row2
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Type display card");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Type_display);
      ///row3
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Chip set");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Chip);

      ///row3
      out.println("</tr>");
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Memory");
      out.println("<br>");
      out.println("<select name=\"Memory\" size=\"1\">");
      if ((Type_display.compareTo("Not specific")     == 0 )
          && (Brand_display.compareTo("Not specific") == 0 )
          && (Chip.compareTo("Not specific")  == 0 ) )
          {
             Query.Query("Memory","display_card","",out);
          }
      else if ((Type_display.compareTo("Not specific")      == 0)
                && (Brand_display.compareTo("Not specific") != 0)
                && (Chip.compareTo("Not specific")  == 0))
      {
        Query.Query("Memory","display_card"," where Brand_display ='" + Brand_display + "'",out);
      }
      else if ((Brand_display.compareTo("Not specific")   == 0 )
              && (Type_display.compareTo("Not specific")  != 0)
              && (Chip.compareTo("Not specific")  == 0 ))
      {
        Query.Query("Memory","display_card"," where Type_display ='" + Type_display + "'",out);
      }
      else if ((Brand_display.compareTo("Not specific")   == 0)
              && (Type_display.compareTo("Not specific")  == 0)
              && (Chip.compareTo("Not specific")  != 0))
      {
//        Query.Query("Memory","monitor"," where Chip ='" + Chip + "' and Brand_display = '" + Brand_display + "'",out);
        Query.Query("Memory","display_card"," where Chip ='" + Chip + "'",out);

      }
      else if ((Brand_display.compareTo("Not specific")   != 0)
              && (Type_display.compareTo("Not specific")  != 0)
              && (Chip.compareTo("Not specific")  == 0))
      {
        Query.Query("Memory","display_card"," where Brand_display ='" + Brand_display + "' and Type_display = '" + Type_display + "'",out);

      }
      else if ((Brand_display.compareTo("Not specific")   != 0)
              && (Type_display.compareTo("Not specific")  == 0)
              && (Chip.compareTo("Not specific")  != 0))
      {
        Query.Query("Memory","display_card"," where Brand_display ='" + Brand_display + "' and Chip = '" + Chip + "'",out);

      }
      else if ((Brand_display.compareTo("Not specific")   == 0)
              && (Type_display.compareTo("Not specific")  != 0)
              && (Chip.compareTo("Not specific")  != 0))
      {
        Query.Query("Memory","display_card"," where Type_display ='" + Type_display + "' and Chip = '" + Chip + "'",out);

      }
      else if ((Brand_display.compareTo("Not specific")   == 0)
              && (Type_display.compareTo("Not specific")  != 0)
              && (Chip.compareTo("Not specific")  != 0))
      {
        Query.Query("Memory","display_card"," where Type_display ='" + Type_display + "' and Chip = '" + Chip + "'",out);

      }
      else if ((Brand_display.compareTo("Not specific")   != 0)
              && (Type_display.compareTo("Not specific")  != 0)
              && (Chip.compareTo("Not specific")  != 0))
      {
        Query.Query("Memory","display_card"," where Type_display ='" + Type_display + "' and Chip = '" + Chip + "' and Brand_display = '" + Brand_display + "'",out);

      }


      out.println("</select>");
      out.println(" <input type=hidden Name = \"Brand_display\" value = \"" + Brand_display + "\">" );
      out.println(" <input type=hidden Name = \"Type_display\" value = \"" + Type_display + "\">" );
      out.println(" <input type=hidden Name = \"Chip\" value = \"" + Chip + "\">" );

      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Memory\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }

     else if (Quantity_display == null)
    {
      out.println("<form method = \"Get\" action = \"AddDisplaycard\" name = \"form\" >");
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><i><font color=\"#003333\">");
      out.println("Your Requirements  " + "</i><br>");
      out.println("<br>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#003366\"><b><font color=\"#990000\">");
      out.println("<font color=\"#006666\">MONITOR</font>   " + Brand_display + "<br>");
      out.println("<font color=\"#006666\">TYPE</font>  " + Type_display  + "<br>");
      out.println("<font color=\"#006666\">CHIP SET</font> " + Chip + " <br>");
      out.println("<font color=\"#006666\">MEMORY</font> " + Memory + " <br>");

      out.println("<br>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Enter Quantity   ");
      out.println("<input type=\"text\" name=\"Quantity_display\" size=\"2\" maxlength=\"2\">");
      out.println("<br>");
      out.println("<br>");
       ////////////Script check//////////////////
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


      out.println("<input type=\"button\" name=\"OK\" value=\"Submit\" onClick = \"validate(Quantity_display)\">");
      out.println("    </td>");
      out.println("  </tr>");
      out.println(" <input type=hidden Name = \"Brand_display\"  value = \"" + Brand_display + "\">" );
      out.println(" <input type=hidden Name = \"Type_display\"  value = \"" + Type_display + "\">" );
      out.println(" <input type=hidden Name = \"Chip\"  value = \"" + Chip + "\">" );
      out.println(" <input type=hidden Name = \"Memory\"  value = \"" + Memory + "\">" );
      out.println("</form>");

     }
     else
     {
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><i><font color=\"#003333\">");
      out.println("Your Requirements  " + "</i><br>");
      out.println("<br>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#003366\"><b><font color=\"#990000\">");
      out.println("<font color=\"#006666\">MONITOR</font>   " + Brand_display + "<br>");
      out.println("<font color=\"#006666\">TYPE</font>  " + Type_display  + "<br>");
      out.println("<font color=\"#006666\">CHIP SET</font> " + Chip + "  <br>");
      out.println("<font color=\"#006666\">MEMORY</font> " + Memory + " <br>");
      out.println("<font color=\"#006666\">Quantity</font> " + Quantity_display + "<br>");
      out.println("<br>");
      out.println("<form method = \"Post\" action = \"Sendspec\">");
      out.println("<input type=hidden Name = \"Brand_display\" value = \"" + Brand_display + "\">" );
      out.println("<input type=hidden Name = \"Type_display\" value = \"" + Type_display + "\">" );
      out.println("<input type=hidden Name = \"Chip\" value = \"" + Chip + "\">" );
      out.println("<input type=hidden Name = \"Memory\" value = \"" + Memory + "\">" );
      out.println("<input type=hidden Name = \"Quantity_display\" value = \"" + Quantity_display + "\">" );
      out.println("<input type=hidden Name = \"Device_name\" value = \"" + "DISPLAY CARD" + "\">");
      out.println("<br>");
      out.println("<input type=\"submit\" name=\"OK\" value=\"Add this spec\">");
      out.println("    </td>");
      out.println("  </tr>");
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
