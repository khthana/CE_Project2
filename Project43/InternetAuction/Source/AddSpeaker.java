////////////////////This class use for add Speaker specification//////////////////////
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public  class AddSpeaker extends HttpServlet
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
    String Brand_speaker ;
    String type_speaker ;
    String number_speaker ;
    String watt ;
    String Quantity_speaker;

     out.println("<body bgcolor=\"#FFFFFF\">");
    //out.println("<p align=\"right\"><font size=\"6\" color=\"#9999FF\"><i><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#003333\">Add Devices </font></b></i></font></p>");
    //out.println("<p align=\"right\"><img src=\"bar.gif\" width=\"550\" height=\"2\"></p>");
    //out.println("<p align=\"right\">&nbsp;</p>");
    out.println("<table width=\"90%\" border=\"0\" align=\"center\" bgcolor=\"#FFFFFF\" cellpadding=\"4\" cellspacing=\"2\" height=\"144\">");

	
    out.println(" <tr valign=\"top\" align=\"center\">");
	out.println("<td colspan=\"2\" height=\"71\"><img src=\"/picture/AddDevices.jpg\" width=\"970\" height=\"70\"></td>");
    out.println("</td>");
    out.println("</tr>");

    out.println("<tr valign=\"top\" align=\"center\" bgcolor=\"#FFFFFF\">"); 
    out.println("<td colspan=\"2\" height=\"99\">");
    out.println(" <div align=\"left\"><font size=\"3\" face=\"Arial, Helvetica, sans-serif\"><i><b><font color=\"#000066\"><br> ");
    out.println(" Speaker Details<br>");
    out.println(" <br>");
    out.println("</font></b></i><b><font color=\"#000066\"><font color=\"#003333\">Brand :<br>");
    out.println("Model :<br>");
    out.println("Number of speaker :<br>");
	out.println("Power (watt) :</font></font></b></font></div><br>");
    out.println(" </td>");
    out.println(" </tr>");


    out.println("  <tr bgcolor=\"#ffb56a\" bordercolor=\"#FFFFFF\"> ");
    out.println("    <td height=\"33\" align=\"center\" colspan=\"2\">");
    out.println("      <div align=\"right\"><font size=\"3\" face=\"Arial, Helvetica, sans-serif\"><i><b>");
    out.println("          <font color=\"#000066\">Choose SPEAKER Details ...</font></i></b></font></div>");
    out.println("    </td>");
    out.println("  </tr>");

    Brand_speaker = req.getParameter("Brand_speaker") ;
    type_speaker  = req.getParameter("type_speaker");
    number_speaker  = req.getParameter("number_speaker");
    watt     = req.getParameter("watt");
    Quantity_speaker = req.getParameter("Quantity_speaker");

    if (Brand_speaker == null)
    {
      out.println("<form method = \"Get\" action = \"AddSpeaker\">");

      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand Speaker");
      out.println("           <select name=\"Brand_speaker\" size=\"1\">");
                              Query.Query("Brand_speaker","speaker","",out);
      out.println("</select>");
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Brand\">");
      out.println("    </td>");
      out.println("</tr>");

      out.println("</form>");
    }
    else if (type_speaker == null)
    {
  //    out.println("Your Select Brand monitor >>>>> " + Brand_monitor+"<br>");
      out.println("<form method = \"Get\" action = \"AddSpeaker\">");
     //row1
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"34\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand Speaker");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_speaker);
      out.println("</tr>");

      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Model Speaker");
      out.println("<select name=\"type_speaker\" size=\"1\">");

      if (Brand_speaker.compareTo("Not specific") == 0 )
      {
        Query.Query("type_speaker","speaker","",out);
      }
      else
      {
       //  out.println("type_speaker"+"monitor" + " where monitor ='" + Brand_monitor +"'") ;
       Query.Query("type_speaker","speaker"," where Brand_speaker  ='" + Brand_speaker +"'",out) ;
      }
      out.println("</select>");
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" >");
      out.println(" <input type=hidden Name = \"Brand_speaker\" value = \"" + Brand_speaker + "\">" );
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Model\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }
     else if (number_speaker == null)
    {
      out.println("<form method = \"Get\" action = \"AddSpeaker\">");
      ///row 1
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand Speaker");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_speaker);
      out.println("</tr>");

      ///row2
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Model Speaker");
      out.println("</td>");
      out.println("    <td height=\"34\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(type_speaker);
      ///row3
      out.println("</tr>");
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Number of Speaker");
      out.println("<select name=\"number_speaker\" size=\"1\">");
      if ((type_speaker.compareTo("Not specific") == 0 ) && (Brand_speaker.compareTo("Not specific") == 0))
      {
        Query.Query("number_speaker","speaker","",out);
      }
      else if ((type_speaker.compareTo("Not specific") == 0) && (Brand_speaker.compareTo("Not specific") != 0))
      {
        Query.Query("number_speaker","speaker"," where Brand_speaker ='" + Brand_speaker + "'",out);
      }
      else if ((Brand_speaker.compareTo("Not specific") == 0 ) && (type_speaker.compareTo("Not specific") != 0))
      {
        Query.Query("number_speaker","speaker"," where type_speaker ='" + type_speaker + "'",out);
      }
      else if ((Brand_speaker.compareTo("Not specific") != 0 ) && (type_speaker.compareTo("Not specific") != 0))
      {
        Query.Query("number_speaker","speaker"," where type_speaker ='" + type_speaker + "' and Brand_speaker = '" + Brand_speaker + "'",out);
      }
      out.println("</select>");
      out.println(" <input type=hidden Name = \"Brand_speaker\" value = \"" + Brand_speaker + "\">" );
      out.println(" <input type=hidden Name = \"type_speaker\" value = \"" + type_speaker + "\">" );
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Number of Speaker\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }


      else if (watt == null)
    {
      out.println("<form method = \"Get\" action = \"AddSpeaker\">");
      ///row 1
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand Speaker");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_speaker);
      out.println("</tr>");

      ///row2
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Model Speaker");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(type_speaker);
      ///row3
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Number of Speaker");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(number_speaker);

      ///row3
      out.println("</tr>");
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("watt");
      out.println("<br>");
      out.println("<select name=\"watt\" size=\"1\">");
      if ((type_speaker.compareTo("Not specific")     == 0 )
          && (Brand_speaker.compareTo("Not specific") == 0 )
          && (number_speaker.compareTo("Not specific")  == 0 ) )
          {
             Query.Query("watt","speaker","",out);
          }
      else if ((type_speaker.compareTo("Not specific")      == 0)
                && (Brand_speaker.compareTo("Not specific") != 0)
                && (number_speaker.compareTo("Not specific")  == 0))
      {
        Query.Query("watt","speaker"," where Brand_speaker ='" + Brand_speaker + "'",out);
      }
      else if ((Brand_speaker.compareTo("Not specific")   == 0 )
              && (type_speaker.compareTo("Not specific")  != 0)
              && (number_speaker.compareTo("Not specific")  == 0 ))
      {
        Query.Query("watt","speaker"," where type_speaker ='" + type_speaker + "'",out);
      }
      else if ((Brand_speaker.compareTo("Not specific")   == 0)
              && (type_speaker.compareTo("Not specific")  == 0)
              && (number_speaker.compareTo("Not specific")  != 0))
      {
//        Query.Query("watt","speaker"," where number_speaker ='" + number_speaker + "' and Brand_speaker = '" + Brand_speaker + "'",out);
        Query.Query("watt","speaker"," where number_speaker ='" + number_speaker + "'",out);

      }
      else if ((Brand_speaker.compareTo("Not specific")   != 0)
              && (type_speaker.compareTo("Not specific")  != 0)
              && (number_speaker.compareTo("Not specific")  == 0))
      {
        Query.Query("watt","speaker"," where Brand_speaker ='" + Brand_speaker + "' and type_speaker = '" + type_speaker + "'",out);

      }
      else if ((Brand_speaker.compareTo("Not specific")   != 0)
              && (type_speaker.compareTo("Not specific")  == 0)
              && (number_speaker.compareTo("Not specific")  != 0))
      {
        Query.Query("watt","speaker"," where Brand_speaker ='" + Brand_speaker + "' and number_speaker = '" + number_speaker + "'",out);

      }
      else if ((Brand_speaker.compareTo("Not specific")   == 0)
              && (type_speaker.compareTo("Not specific")  != 0)
              && (number_speaker.compareTo("Not specific")  != 0))
      {
        Query.Query("watt","speaker"," where type_speaker ='" + type_speaker + "' and number_speaker = '" + number_speaker + "'",out);

      }
      else if ((Brand_speaker.compareTo("Not specific")   == 0)
              && (type_speaker.compareTo("Not specific")  != 0)
              && (number_speaker.compareTo("Not specific")  != 0))
      {
        Query.Query("watt","speaker"," where type_speaker ='" + type_speaker + "' and number_speaker = '" + number_speaker + "'",out);

      }
      else if ((Brand_speaker.compareTo("Not specific")   != 0)
              && (type_speaker.compareTo("Not specific")  != 0)
              && (number_speaker.compareTo("Not specific")  != 0))
      {
        Query.Query("watt","speaker"," where type_speaker ='" + type_speaker + "' and number_speaker = '" + number_speaker + "' and Brand_speaker = '" + Brand_speaker + "'",out);

      }


      out.println("</select>");
      out.println(" <input type=hidden Name = \"Brand_speaker\" value = \"" + Brand_speaker + "\">" );
      out.println(" <input type=hidden Name = \"type_speaker\" value = \"" + type_speaker + "\">" );
      out.println(" <input type=hidden Name = \"number_speaker\" value = \"" + number_speaker + "\">" );

      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Power(Watt)\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }

     else if (Quantity_speaker == null)
    {
      out.println("<form method = \"Get\" action = \"AddSpeaker\" name = \"form\" >");
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><i><font color=\"#003333\">");
      out.println("Your Requirements  " + "</i><br>");
      out.println("<br>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#003366\"><b><font color=\"#990000\">");
      out.println("<font color=\"#006666\">SPEAKER</font>   " + Brand_speaker + "<br>");
      out.println("<font color=\"#006666\">MODEL</font>  " + type_speaker  + "<br>");
      out.println("<font color=\"#006666\">NUMBER of SPEAKER</font> " + number_speaker + "<br>");
      out.println("<font color=\"#006666\">POWER (watt)</font> " + watt + " <br>");

      out.println("<br>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Enter Quantity   ");
      out.println("<input type=\"text\" name=\"Quantity_speaker\" size=\"2\" maxlength=\"2\">");
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

      out.println("<input type=\"button\" name=\"OK\" value=\"Submit\" onClick = \"validate(Quantity_speaker)\">");
      out.println("    </td>");
      out.println("  </tr>");
      out.println(" <input type=hidden Name = \"Brand_speaker\" value = \"" + Brand_speaker + "\">" );
      out.println(" <input type=hidden Name = \"type_speaker\"  value = \"" + type_speaker + "\">" );
      out.println(" <input type=hidden Name = \"number_speaker\"  value = \"" + number_speaker + "\">" );
      out.println(" <input type=hidden Name = \"watt\"     value = \"" + watt + "\">" );
      out.println("</form>");

     }
     else
     {
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><i><font color=\"#003333\">");
      out.println("Your Requirements  " + "</i><br>");
      out.println("<br>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#003366\"><b><font color=\"#990000\">");
      out.println("<font color=\"#006666\">SPEAKER</font>   " + Brand_speaker + "<br>");
      out.println("<font color=\"#006666\">MODEL</font>  " + type_speaker  + "<br>");
      out.println("<font color=\"#006666\">NUMBER of SPEAKER</font> " + number_speaker + "<br>");
      out.println("<font color=\"#006666\">POWER (watt)</font> " + watt + " <br>");
      out.println("<font color=\"#006666\">Quantity</font> " + Quantity_speaker + "<br>");
      out.println("<br>");
      out.println("<form method = \"Post\" action = \"Sendspec\">");
      out.println("<input type=hidden Name = \"Brand_speaker\" value = \"" + Brand_speaker + "\">" );
      out.println("<input type=hidden Name = \"Type_speaker\" value = \"" + type_speaker + "\">" );
      out.println("<input type=hidden Name = \"Number_speaker\" value = \"" + number_speaker + "\">" );
      out.println("<input type=hidden Name = \"watt\" value = \"" + watt + "\">" );
      out.println("<input type=hidden Name = \"Quantity_speaker\" value = \"" + Quantity_speaker + "\">" );
      out.println("<input type=hidden Name = \"Device_name\" value = \"" + "SPEAKER" + "\">");
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
