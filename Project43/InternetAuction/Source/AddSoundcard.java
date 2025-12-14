////////////////////This class use for add Soundcard specification//////////////////////
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public  class AddSoundcard extends HttpServlet
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
    String Brand_sound ;
    String Model_sound ;
    String Sound_system ;
    String Interface ;

    String Quantity_sound;
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
    out.println(" Sound card Details<br>");
    out.println(" <br>");
    out.println("</font></b></i><b><font color=\"#000066\"><font color=\"#003333\">Brand :<br>");
    out.println("Model sound :<br>");
    out.println("Sound system :<br>");
	  out.println("Interface :</font></font></b></font></div><br>");
    out.println(" </td>");
    out.println(" </tr>");

    out.println("  <tr bgcolor=\"#ffb56a\" bordercolor=\"#FFFFFF\"> ");
    out.println("    <td height=\"33\" align=\"center\" colspan=\"2\">");
    out.println("      <div align=\"right\"><font size=\"3\" face=\"Arial, Helvetica, sans-serif\"><i><b>");
    out.println("          <font color=\"#000066\">Choose Sound card Details ...</font></i></b></font></div>");
    out.println("    </td>");
    out.println("  </tr>");

    Brand_sound = req.getParameter("Brand_sound") ;
    Model_sound  = req.getParameter("Model_sound");
    Sound_system  = req.getParameter("Sound_system");
    Interface     = req.getParameter("Interface");
    Quantity_sound = req.getParameter("Quantity_sound");

    if (Brand_sound == null)
    {
      out.println("<form method = \"Get\" action = \"AddSoundcard\">");

      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand Sound");
      out.println("           <select name=\"Brand_sound\" size=\"1\">");
                              Query.Query("Brand_sound","soundcard","",out);
      out.println("</select>");
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Brand\">");
      out.println("    </td>");
      out.println("</tr>");

      out.println("</form>");
    }
    else if (Model_sound == null)
    {
  //    out.println("Your Select Brand monitor >>>>> " + Brand_monitor+"<br>");
      out.println("<form method = \"Get\" action = \"AddSoundcard\">");
     //row1
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand Sound");
      out.println("    </td>");
      out.println("    <td height=\"34\" align=\"center\" width=\"50%\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_sound);
      out.println("</tr>");

      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Model Sound");
      out.println("<select name=\"Model_sound\" size=\"1\">");

      if (Brand_sound.compareTo("Not specific") == 0 )
      {
        Query.Query("Model_sound","soundcard","",out);
      }
      else
      {
       Query.Query("Model_sound","soundcard"," where Brand_sound  ='" + Brand_sound +"'",out) ;
      }
      out.println("</select>");
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" >");
      out.println(" <input type=hidden Name = \"Brand_sound\" value = \"" + Brand_sound + "\">" );
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Model\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }
     else if (Sound_system == null)
    {
      out.println("<form method = \"Get\" action = \"AddSoundcard\">");
      ///row 1
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand Sound card");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_sound);
      out.println("</tr>");

      ///row2
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Model Sound card");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Model_sound);
      ///row3
      out.println("</tr>");
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Sound system ");
      out.println("<select name=\"Sound_system\" size=\"1\">");
      if ((Model_sound.compareTo("Not specific") == 0 ) && (Brand_sound.compareTo("Not specific") == 0))
      {
        Query.Query("Sound_system","soundcard","",out);
      }
      else if ((Model_sound.compareTo("Not specific") == 0) && (Brand_sound.compareTo("Not specific") != 0))
      {
        Query.Query("Sound_system","soundcard"," where Brand_sound ='" + Brand_sound + "'",out);
      }
      else if ((Brand_sound.compareTo("Not specific") == 0 ) && (Model_sound.compareTo("Not specific") != 0))
      {
        Query.Query("Sound_system","soundcard"," where Model_sound ='" + Model_sound + "'",out);
      }
      else if ((Brand_sound.compareTo("Not specific") != 0 ) && (Model_sound.compareTo("Not specific") != 0))
      {
        Query.Query("Sound_system","soundcard"," where Model_sound ='" + Model_sound + "' and Brand_sound = '" + Brand_sound + "'",out);
      }
      out.println("</select>");
      out.println(" <input type=hidden Name = \"Brand_sound\" value = \"" + Brand_sound + "\">" );
      out.println(" <input type=hidden Name = \"Model_sound\" value = \"" + Model_sound + "\">" );
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Sound system\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }


      else if (Interface == null)
    {
      out.println("<form method = \"Get\" action = \"AddSoundcard\">");
      ///row 1
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand Sound card");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_sound);
      out.println("</tr>");

      ///row2
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Model Sound card");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Model_sound);
      ///row3
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Sound system ");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Sound_system);

      ///row3
      out.println("</tr>");
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Interface");
      out.println("<br>");
      out.println("<select name=\"Interface\" size=\"1\">");
      if ((Model_sound.compareTo("Not specific")     == 0 )
          && (Brand_sound.compareTo("Not specific") == 0 )
          && (Sound_system.compareTo("Not specific")  == 0 ) )
          {
             Query.Query("Interface","soundcard","",out);
          }
      else if ((Model_sound.compareTo("Not specific")      == 0)
                && (Brand_sound.compareTo("Not specific") != 0)
                && (Sound_system.compareTo("Not specific")  == 0))
      {
        Query.Query("Interface","soundcard"," where Brand_sound ='" + Brand_sound + "'",out);
      }
      else if ((Brand_sound.compareTo("Not specific")   == 0 )
              && (Model_sound.compareTo("Not specific")  != 0)
              && (Sound_system.compareTo("Not specific")  == 0 ))
      {
        Query.Query("Interface","soundcard"," where Model_sound ='" + Model_sound + "'",out);
      }
      else if ((Brand_sound.compareTo("Not specific")   == 0)
              && (Model_sound.compareTo("Not specific")  == 0)
              && (Sound_system.compareTo("Not specific")  != 0))
      {
//        Query.Query("Interface","monitor"," where Sound_system ='" + Sound_system + "' and Brand_sound = '" + Brand_sound + "'",out);
        Query.Query("Interface","soundcard"," where Sound_system ='" + Sound_system + "'",out);

      }
      else if ((Brand_sound.compareTo("Not specific")   != 0)
              && (Model_sound.compareTo("Not specific")  != 0)
              && (Sound_system.compareTo("Not specific")  == 0))
      {
        Query.Query("Interface","soundcard"," where Brand_sound ='" + Brand_sound + "' and Model_sound = '" + Model_sound + "'",out);

      }
      else if ((Brand_sound.compareTo("Not specific")   != 0)
              && (Model_sound.compareTo("Not specific")  == 0)
              && (Sound_system.compareTo("Not specific")  != 0))
      {
        Query.Query("Interface","soundcard"," where Brand_sound ='" + Brand_sound + "' and Sound_system = '" + Sound_system + "'",out);

      }
      else if ((Brand_sound.compareTo("Not specific")   == 0)
              && (Model_sound.compareTo("Not specific")  != 0)
              && (Sound_system.compareTo("Not specific")  != 0))
      {
        Query.Query("Interface","soundcard"," where Model_sound ='" + Model_sound + "' and Sound_system = '" + Sound_system + "'",out);

      }
      else if ((Brand_sound.compareTo("Not specific")   == 0)
              && (Model_sound.compareTo("Not specific")  != 0)
              && (Sound_system.compareTo("Not specific")  != 0))
      {
        Query.Query("Interface","soundcard"," where Model_sound ='" + Model_sound + "' and Sound_system = '" + Sound_system + "'",out);

      }
      else if ((Brand_sound.compareTo("Not specific")   != 0)
              && (Model_sound.compareTo("Not specific")  != 0)
              && (Sound_system.compareTo("Not specific")  != 0))
      {
        Query.Query("Interface","soundcard"," where Model_sound ='" + Model_sound + "' and Sound_system = '" + Sound_system + "' and Brand_sound = '" + Brand_sound + "'",out);

      }


      out.println("</select>");
      out.println(" <input type=hidden Name = \"Brand_sound\" value = \"" + Brand_sound + "\">" );
      out.println(" <input type=hidden Name = \"Model_sound\" value = \"" + Model_sound + "\">" );
      out.println(" <input type=hidden Name = \"Sound_system\" value = \"" + Sound_system + "\">" );

      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Interface\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }

     else if (Quantity_sound == null)
    {
      out.println("<form method = \"Get\" action = \"AddSoundcard\"   name = \"form\" >");
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><i><font color=\"#003333\">");
      out.println("Your Requirements  " + "</i><br>");
      out.println("<br>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#003366\"><b><font color=\"#990000\">");
      out.println("<font color=\"#006666\">BRAND</font>   " + Brand_sound + "<br>");
      out.println("<font color=\"#006666\">MODEL </font>  " + Model_sound  + "<br>");
      out.println("<font color=\"#006666\">SOUND SYSTEM</font> " + Sound_system + " <br>");
      out.println("<font color=\"#006666\">INTERFACE</font> " + Interface + " <br>");

      out.println("<br>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Enter Quantity   ");
      out.println("<input type=\"text\" name=\"Quantity_sound\" size=\"2\" maxlength=\"2\">");
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

      out.println("<input type=\"button\" name=\"OK\" value=\"Submit\" onClick = \"validate(Quantity_sound)\">");
      out.println("    </td>");
      out.println("  </tr>");
      out.println(" <input type=hidden Name = \"Brand_sound\"  value = \"" + Brand_sound + "\">" );
      out.println(" <input type=hidden Name = \"Model_sound\"  value = \"" + Model_sound + "\">" );
      out.println(" <input type=hidden Name = \"Sound_system\"  value = \"" + Sound_system + "\">" );
      out.println(" <input type=hidden Name = \"Interface\"  value = \"" + Interface + "\">" );
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
      out.println("<font color=\"#006666\">BRAND</font>   " + Brand_sound + "<br>");
      out.println("<font color=\"#006666\">MODEL </font>  " + Model_sound  + "<br>");
      out.println("<font color=\"#006666\">SOUND SYSTEM</font> " + Sound_system + "  <br>");
      out.println("<font color=\"#006666\">INTERFACE</font> " + Interface + " <br>");
      out.println("<font color=\"#006666\">Quantity</font> " + Quantity_sound + "<br>");
      out.println("<br>");
      out.println("<form method = \"Post\" action = \"Sendspec\">");
      out.println("<input type=hidden Name = \"Brand_sound\" value = \"" + Brand_sound + "\">" );
      out.println("<input type=hidden Name = \"Model_sound\" value = \"" + Model_sound + "\">" );
      out.println("<input type=hidden Name = \"Sound_system\" value = \"" + Sound_system + "\">" );
      out.println("<input type=hidden Name = \"Interface\" value = \"" + Interface + "\">" );
      out.println("<input type=hidden Name = \"Quantity_sound\" value = \"" + Quantity_sound + "\">" );
      out.println("<input type=hidden Name = \"Device_name\" value = \"" + "SOUND CARD" + "\">");
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
