////////////////////This class use for add Modem specification//////////////////////
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public  class AddModem extends HttpServlet
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
    String Brand_modem ;
    String Type_modem ;
    String Interface ;
    String Speed_modem ;
    String Quantity_modem;
    out.println("<html>");
    out.println("<head>");
    out.println("<title>Internet Auction [Add Technical Requirement] : CE.KMITL</title>");
    out.println("</head>");

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
    out.println(" Modem Details <br>");
    out.println(" <br>");
    out.println("</font></b></i><b><font color=\"#000066\"><font color=\"#003333\">Brand :<br>");
    out.println("Type :<br>");
    out.println("Interface :<br>");
	out.println("Speed :</font></font></b></font></div><br>");
    out.println(" </td>");
    out.println(" </tr>");

	
	out.println("  <tr bgcolor=\"#ffb56a\" bordercolor=\"#FFFFFF\"> ");
    out.println("    <td height=\"33\" align=\"center\" colspan=\"2\">");
    out.println("      <div align=\"right\"><font size=\"3\" face=\"Arial, Helvetica, sans-serif\"><i><b>");
    out.println("          <font color=\"#000066\">Choose MODEM Details ...</font></i></b></font></div>");
    out.println("    </td>");
    out.println("  </tr>");


    Brand_modem = req.getParameter("Brand_modem") ;
    Type_modem  = req.getParameter("Type_modem");
    Interface   = req.getParameter("Interface");
    Speed_modem = req.getParameter("Speed_modem");
    Quantity_modem = req.getParameter("Quantity_modem");



    if (Brand_modem == null)
    {
      out.println("<form method = \"Get\" action = \"AddModem\">");

      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand modem");
      out.println("           <select name=\"Brand_modem\" size=\"1\">");
                              Query.Query("Brand_modem","modem","",out);
      out.println("</select>");
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Brand\">");
      out.println("    </td>");
      out.println("</tr>");

      out.println("</form>");
    }
    else if (Type_modem == null)
    {
  //    out.println("Your Select Brand modem >>>>> " + Brand_modem+"<br>");
      out.println("<form method = \"Get\" action = \"AddModem\">");
     //row1
      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand Modem");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_modem);
      out.println("</tr>");

      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Type Modem");
      out.println("<select name=\"Type_modem\" size=\"1\">");

      if (Brand_modem.compareTo("Not specific") == 0 )
      {
        Query.Query("Type_modem","modem","",out);
      }
      else
      {
       //  out.println("Type_modem"+"modem" + " where modem ='" + Brand_modem +"'") ;
       Query.Query("Type_modem","modem"," where Brand_modem  ='" + Brand_modem +"'",out) ;
      }
      out.println("</select>");
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" >");
      out.println(" <input type=hidden Name = \"Brand_modem\" value = \"" + Brand_modem + "\">" );
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Type\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }
     else if (Interface == null)
    {
      out.println("<form method = \"Get\" action = \"AddModem\">");
      ///row 1
      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand Modem");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_modem);
      out.println("</tr>");

      ///row2
      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Type Modem");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Type_modem);
      ///row3
      out.println("</tr>");
      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Interface");
      out.println("<select name=\"Interface\" size=\"1\">");
      if ((Type_modem.compareTo("Not specific") == 0 ) && (Brand_modem.compareTo("Not specific") == 0))
      {
        Query.Query("Interface","modem","",out);
      }
      else if ((Type_modem.compareTo("Not specific") == 0) && (Brand_modem.compareTo("Not specific") != 0))
      {
        Query.Query("Interface","modem"," where Brand_modem ='" + Brand_modem + "'",out);
      }
      else if ((Brand_modem.compareTo("Not specific") == 0 ) && (Type_modem.compareTo("Not specific") != 0))
      {
        Query.Query("Interface","modem"," where Type_modem ='" + Type_modem + "'",out);
      }
      else if ((Brand_modem.compareTo("Not specific") != 0 ) && (Type_modem.compareTo("Not specific") != 0))
      {
        Query.Query("Interface","modem"," where Type_modem ='" + Type_modem + "' and Brand_modem = '" + Brand_modem + "'",out);
      }
      out.println("</select>");
      out.println(" <input type=hidden Name = \"Brand_modem\" value = \"" + Brand_modem + "\">" );
      out.println(" <input type=hidden Name = \"Type_modem\" value = \"" + Type_modem + "\">" );
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Interface\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }


      else if (Speed_modem == null)
    {
      out.println("<form method = \"Get\" action = \"AddModem\">");
      ///row 1
      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"34\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand modem");
      out.println("</td>");
      out.println("    <td height=\"34\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_modem);
      out.println("</tr>");

      ///row2
      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Type modem");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Type_modem);
      ///row3
      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Interface");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Interface);

      ///row3
      out.println("</tr>");
      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Speed_modem");
      out.println("<br>");
      out.println("<select name=\"Speed_modem\" size=\"1\">");
      if ((Type_modem.compareTo("Not specific")     == 0 )
          && (Brand_modem.compareTo("Not specific") == 0 )
          && (Interface.compareTo("Not specific")  == 0 ) )
          {
             Query.Query("Speed_modem","modem","",out);
          }
      else if ((Type_modem.compareTo("Not specific")      == 0)
                && (Brand_modem.compareTo("Not specific") != 0)
                && (Interface.compareTo("Not specific")  == 0))
      {
        Query.Query("Speed_modem","modem"," where Brand_modem ='" + Brand_modem + "'",out);
      }
      else if ((Brand_modem.compareTo("Not specific")   == 0 )
              && (Type_modem.compareTo("Not specific")  != 0)
              && (Interface.compareTo("Not specific")  == 0 ))
      {
        Query.Query("Speed_modem","modem"," where Type_modem ='" + Type_modem + "'",out);
      }
      else if ((Brand_modem.compareTo("Not specific")   == 0)
              && (Type_modem.compareTo("Not specific")  == 0)
              && (Interface.compareTo("Not specific")  != 0))
      {
//        Query.Query("Dot_pitch","modem"," where Interface ='" + Interface + "' and Brand_modem = '" + Brand_modem + "'",out);
        Query.Query("Speed_modem","modem"," where Interface ='" + Interface + "'",out);

      }
      else if ((Brand_modem.compareTo("Not specific")   != 0)
              && (Type_modem.compareTo("Not specific")  != 0)
              && (Interface.compareTo("Not specific")  == 0))
      {
        Query.Query("Speed_modem","modem"," where Brand_modem ='" + Brand_modem + "' and Type_modem = '" + Type_modem + "'",out);

      }
      else if ((Brand_modem.compareTo("Not specific")   != 0)
              && (Type_modem.compareTo("Not specific")  == 0)
              && (Interface.compareTo("Not specific")  != 0))
      {
        Query.Query("Speed_modem","modem"," where Brand_modem ='" + Brand_modem + "' and Interface = '" + Interface + "'",out);

      }
      else if ((Brand_modem.compareTo("Not specific")   == 0)
              && (Type_modem.compareTo("Not specific")  != 0)
              && (Interface.compareTo("Not specific")  != 0))
      {
        Query.Query("Speed_modem","modem"," where Type_modem ='" + Type_modem + "' and Interface = '" + Interface + "'",out);

      }
      else if ((Brand_modem.compareTo("Not specific")   == 0)
              && (Type_modem.compareTo("Not specific")  != 0)
              && (Interface.compareTo("Not specific")  != 0))
      {
        Query.Query("Speed_modem","modem"," where Type_modem ='" + Type_modem + "' and Interface = '" + Interface + "'",out);

      }
      else if ((Brand_modem.compareTo("Not specific")   != 0)
              && (Type_modem.compareTo("Not specific")  != 0)
              && (Interface.compareTo("Not specific")  != 0))
      {
        Query.Query("Speed_modem","modem"," where Type_modem ='" + Type_modem + "' and Interface = '" + Interface + "' and Brand_modem = '" + Brand_modem + "'",out);

      }


      out.println("</select>");
      out.println(" <input type=hidden Name = \"Brand_modem\" value = \"" + Brand_modem + "\">" );
      out.println(" <input type=hidden Name = \"Type_modem\" value = \"" + Type_modem + "\">" );
      out.println(" <input type=hidden Name = \"Interface\" value = \"" + Interface + "\">" );

      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"34\" align=\"center\" width=\"55%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Speed\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }

     else if (Quantity_modem == null)
    {
      out.println("<form method = \"Get\" action = \"AddModem\" name = \"form\" >");
      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><i><font color=\"#003333\">");
      out.println("Your Requirements  " + "</i><br>");
      out.println("<br>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#003366\"><b><font color=\"#990000\">");
      out.println("<font color=\"#006666\">MODEM</font>   " + Brand_modem + "<br>");
      out.println("<font color=\"#006666\">TYPE</font>  " + Type_modem  + "<br>");
      out.println("<font color=\"#006666\">INTERFACE</font> " + Interface + "<br>");
      out.println("<font color=\"#006666\">SPEED</font> " + Speed_modem + " <br>");

      out.println("<br>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Enter Quantity   ");
      out.println("<input type=\"text\" name=\"Quantity_modem\" size=\"2\" maxlength=\"2\">");
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

      out.println("<input type=\"button\" name=\"OK\" value=\"Submit\" onClick = \"validate(Quantity_modem)\">");
      out.println("    </td>");
      out.println("  </tr>");
      out.println(" <input type=hidden Name = \"Brand_modem\" value = \"" + Brand_modem + "\">" );
      out.println(" <input type=hidden Name = \"Type_modem\"  value = \"" + Type_modem + "\">" );
      out.println(" <input type=hidden Name = \"Interface\"  value = \"" + Interface + "\">" );
      out.println(" <input type=hidden Name = \"Speed_modem\"     value = \"" + Speed_modem + "\">" );
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
      out.println("<font color=\"#006666\">MODEM</font>   " + Brand_modem + "<br>");
      out.println("<font color=\"#006666\">TYPE</font>  " + Type_modem  + "<br>");
      out.println("<font color=\"#006666\">INTERFACE</font> " + Interface + " inch.<br>");
      out.println("<font color=\"#006666\">SPEED</font> " + Speed_modem + " <br>");
      out.println("<font color=\"#006666\">Quantity</font> " + Quantity_modem + "<br>");

      out.println("<br>");
      out.println("<form method = \"Post\" action = \"Sendspec\">");
      out.println("<input type=hidden Name = \"Brand_modem\" value = \"" + Brand_modem + "\">" );
      out.println("<input type=hidden Name = \"Type_modem\" value = \"" + Type_modem + "\">" );
      out.println("<input type=hidden Name = \"Interface\" value = \"" + Interface + "\">" );
      out.println("<input type=hidden Name = \"Speed_modem\" value = \"" + Speed_modem + "\">" );
      out.println("<input type=hidden Name = \"Quantity_modem\" value = \"" + Quantity_modem + "\">" );
      out.println("<input type=hidden Name = \"Device_name\" value = \"" + "MODEM" + "\">");

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
