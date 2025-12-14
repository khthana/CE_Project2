////////////////////This class use for add Monitor specification//////////////////////
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public  class AddMonitor extends HttpServlet
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
    String Brand_monitor ;
    String Type_monitor ;
    String Size_monitor ;
    String Dot_pitch ;
    String Quantity_monitor;
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
    out.println(" Monitor Details<br>");
    out.println(" <br>");
    out.println("</font></b></i><b><font color=\"#000066\"><font color=\"#003333\">Brand :<br>");
    out.println("Type :<br>");
    out.println("Size :<br>");
	  out.println("Dot Pitch :</font></font></b></font></div><br>");
    out.println(" </td>");
    out.println(" </tr>");

    out.println("  <tr bgcolor=\"#ffb56a\" bordercolor=\"#FFFFFF\"> ");
    out.println("    <td height=\"33\" align=\"center\" colspan=\"2\">");
    out.println("      <div align=\"right\"><font size=\"3\" face=\"Arial, Helvetica, sans-serif\"><i><b>");
    out.println("          <font color=\"#000066\">Choose MONITOR Details ...</font></i></b></font></div>");
    out.println("    </td>");
    out.println("  </tr>");

    Brand_monitor = req.getParameter("Brand_monitor") ;
    Type_monitor  = req.getParameter("Type_monitor");
    Size_monitor  = req.getParameter("Size_monitor");
    Dot_pitch     = req.getParameter("Dot_pitch");
    Quantity_monitor = req.getParameter("Quantity_monitor");

    if (Brand_monitor == null)
    {
      out.println("<form method = \"Get\" action = \"AddMonitor\">");

      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand monitor");
      out.println("           <select name=\"Brand_monitor\" size=\"1\">");
                              Query.Query("Brand_monitor","monitor","",out);
      out.println("</select>");
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Brand\">");
      out.println("    </td>");
      out.println("</tr>");

      out.println("</form>");
    }
    else if (Type_monitor == null)
    {
  //    out.println("Your Select Brand monitor >>>>> " + Brand_monitor+"<br>");
      out.println("<form method = \"Get\" action = \"AddMonitor\">");
     //row1
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand monitor");
      out.println("    </td>");
      out.println("    <td height=\"34\" align=\"center\" width=\"50%\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_monitor);
      out.println("</tr>");

      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Type monitor");
      out.println("<select name=\"Type_monitor\" size=\"1\">");

      if (Brand_monitor.compareTo("Not specific") == 0 )
      {
        Query.Query("Type_monitor","monitor","",out);
      }
      else
      {
       //  out.println("Type_monitor"+"monitor" + " where monitor ='" + Brand_monitor +"'") ;
       Query.Query("Type_monitor","monitor"," where Brand_monitor  ='" + Brand_monitor +"'",out) ;
      }
      out.println("</select>");
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" >");
      out.println(" <input type=hidden Name = \"Brand_monitor\" value = \"" + Brand_monitor + "\">" );
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Type\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }
     else if (Size_monitor == null)
    {
      out.println("<form method = \"Get\" action = \"AddMonitor\">");
      ///row 1
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand monitor");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_monitor);
      out.println("</tr>");

      ///row2
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Type monitor");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Type_monitor);
      ///row3
      out.println("</tr>");
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Size monitor ( \" )");
      out.println("<select name=\"Size_monitor\" size=\"1\">");
      if ((Type_monitor.compareTo("Not specific") == 0 ) && (Brand_monitor.compareTo("Not specific") == 0))
      {
        Query.Query("Size_monitor","monitor","",out);
      }
      else if ((Type_monitor.compareTo("Not specific") == 0) && (Brand_monitor.compareTo("Not specific") != 0))
      {
        Query.Query("Size_monitor","monitor"," where Brand_monitor ='" + Brand_monitor + "'",out);
      }
      else if ((Brand_monitor.compareTo("Not specific") == 0 ) && (Type_monitor.compareTo("Not specific") != 0))
      {
        Query.Query("Size_monitor","monitor"," where Type_monitor ='" + Type_monitor + "'",out);
      }
      else if ((Brand_monitor.compareTo("Not specific") != 0 ) && (Type_monitor.compareTo("Not specific") != 0))
      {
        Query.Query("Size_monitor","monitor"," where Type_monitor ='" + Type_monitor + "' and Brand_monitor = '" + Brand_monitor + "'",out);
      }
      out.println("</select>");
      out.println(" <input type=hidden Name = \"Brand_monitor\" value = \"" + Brand_monitor + "\">" );
      out.println(" <input type=hidden Name = \"Type_monitor\" value = \"" + Type_monitor + "\">" );
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose size\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }


      else if (Dot_pitch == null)
    {
      out.println("<form method = \"Get\" action = \"AddMonitor\">");
      ///row 1
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand monitor");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_monitor);
      out.println("</tr>");

      ///row2
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Type monitor");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Type_monitor);
      ///row3
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Size monitor");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Size_monitor);

      ///row3
      out.println("</tr>");
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Dot_pitch");
      out.println("<br>");
      out.println("<select name=\"Dot_pitch\" size=\"1\">");
      if ((Type_monitor.compareTo("Not specific")     == 0 )
          && (Brand_monitor.compareTo("Not specific") == 0 )
          && (Size_monitor.compareTo("Not specific")  == 0 ) )
          {
             Query.Query("Dot_pitch","monitor","",out);
          }
      else if ((Type_monitor.compareTo("Not specific")      == 0)
                && (Brand_monitor.compareTo("Not specific") != 0)
                && (Size_monitor.compareTo("Not specific")  == 0))
      {
        Query.Query("Dot_pitch","monitor"," where Brand_monitor ='" + Brand_monitor + "'",out);
      }
      else if ((Brand_monitor.compareTo("Not specific")   == 0 )
              && (Type_monitor.compareTo("Not specific")  != 0)
              && (Size_monitor.compareTo("Not specific")  == 0 ))
      {
        Query.Query("Dot_pitch","monitor"," where Type_monitor ='" + Type_monitor + "'",out);
      }
      else if ((Brand_monitor.compareTo("Not specific")   == 0)
              && (Type_monitor.compareTo("Not specific")  == 0)
              && (Size_monitor.compareTo("Not specific")  != 0))
      {
//        Query.Query("Dot_pitch","monitor"," where Size_monitor ='" + Size_monitor + "' and Brand_monitor = '" + Brand_monitor + "'",out);
        Query.Query("Dot_pitch","monitor"," where Size_monitor ='" + Size_monitor + "'",out);

      }
      else if ((Brand_monitor.compareTo("Not specific")   != 0)
              && (Type_monitor.compareTo("Not specific")  != 0)
              && (Size_monitor.compareTo("Not specific")  == 0))
      {
        Query.Query("Dot_pitch","monitor"," where Brand_monitor ='" + Brand_monitor + "' and Type_monitor = '" + Type_monitor + "'",out);

      }
      else if ((Brand_monitor.compareTo("Not specific")   != 0)
              && (Type_monitor.compareTo("Not specific")  == 0)
              && (Size_monitor.compareTo("Not specific")  != 0))
      {
        Query.Query("Dot_pitch","monitor"," where Brand_monitor ='" + Brand_monitor + "' and Size_monitor = '" + Size_monitor + "'",out);

      }
      else if ((Brand_monitor.compareTo("Not specific")   == 0)
              && (Type_monitor.compareTo("Not specific")  != 0)
              && (Size_monitor.compareTo("Not specific")  != 0))
      {
        Query.Query("Dot_pitch","monitor"," where Type_monitor ='" + Type_monitor + "' and Size_monitor = '" + Size_monitor + "'",out);

      }
      else if ((Brand_monitor.compareTo("Not specific")   == 0)
              && (Type_monitor.compareTo("Not specific")  != 0)
              && (Size_monitor.compareTo("Not specific")  != 0))
      {
        Query.Query("Dot_pitch","monitor"," where Type_monitor ='" + Type_monitor + "' and Size_monitor = '" + Size_monitor + "'",out);

      }
      else if ((Brand_monitor.compareTo("Not specific")   != 0)
              && (Type_monitor.compareTo("Not specific")  != 0)
              && (Size_monitor.compareTo("Not specific")  != 0))
      {
        Query.Query("Dot_pitch","monitor"," where Type_monitor ='" + Type_monitor + "' and Size_monitor = '" + Size_monitor + "' and Brand_monitor = '" + Brand_monitor + "'",out);

      }


      out.println("</select>");
      out.println(" <input type=hidden Name = \"Brand_monitor\" value = \"" + Brand_monitor + "\">" );
      out.println(" <input type=hidden Name = \"Type_monitor\" value = \"" + Type_monitor + "\">" );
      out.println(" <input type=hidden Name = \"Size_monitor\" value = \"" + Size_monitor + "\">" );

      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Dot Pitch\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }

     else if (Quantity_monitor == null)
    {
      out.println("<form method = \"Get\" action = \"AddMonitor\" name = \"form\" >");
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><i><font color=\"#003333\">");
      out.println("Your Requirements  " + "</i><br>");
      out.println("<br>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#003366\"><b><font color=\"#990000\">");
      out.println("<font color=\"#006666\">MONITOR</font>   " + Brand_monitor + "<br>");
      out.println("<font color=\"#006666\">TYPE</font>  " + Type_monitor  + "<br>");
      out.println("<font color=\"#006666\">SIZE</font> " + Size_monitor + " <br>");
      out.println("<font color=\"#006666\">DOT PITCH</font> " + Dot_pitch + " <br>");

      out.println("<br>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Enter Quantity   ");
      out.println("<input type=\"text\" name=\"Quantity_monitor\" size=\"2\" maxlength=\"2\">");
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


      out.println("<input type=\"button\" name=\"OK\" value=\"Submit\" onClick = \"validate(Quantity_monitor)\">");
      out.println("    </td>");
      out.println("  </tr>");
      out.println(" <input type=hidden Name = \"Brand_monitor\" value = \"" + Brand_monitor + "\">" );
      out.println(" <input type=hidden Name = \"Type_monitor\"  value = \"" + Type_monitor + "\">" );
      out.println(" <input type=hidden Name = \"Size_monitor\"  value = \"" + Size_monitor + "\">" );
      out.println(" <input type=hidden Name = \"Dot_pitch\"     value = \"" + Dot_pitch + "\">" );
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
      out.println("<font color=\"#006666\">MONITOR</font>   " + Brand_monitor + "<br>");
      out.println("<font color=\"#006666\">TYPE</font>  " + Type_monitor  + "<br>");
      out.println("<font color=\"#006666\">SIZE</font> " + Size_monitor + " <br>");
      out.println("<font color=\"#006666\">DOT PITCH</font> " + Dot_pitch + " <br>");
      out.println("<font color=\"#006666\">Quantity</font> " + Quantity_monitor + "<br>");

      out.println("<br>");
      out.println("<form method = \"Post\" action = \"Sendspec\">");
      out.println("<input type=hidden Name = \"Brand_monitor\" value = \"" + Brand_monitor + "\">" );
      out.println("<input type=hidden Name = \"Type_monitor\" value = \"" + Type_monitor + "\">" );
      out.println("<input type=hidden Name = \"Size_monitor\" value = \"" + Size_monitor + "\">" );
      out.println("<input type=hidden Name = \"Dot_pitch\" value = \"" + Dot_pitch + "\">" );
      out.println("<input type=hidden Name = \"Quantity_monitor\" value = \"" + Quantity_monitor + "\">" );
      out.println("<input type=hidden Name = \"Device_name\" value = \"" + "MONITOR" + "\">");

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
