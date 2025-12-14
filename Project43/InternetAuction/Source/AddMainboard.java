////////////////////This class use for add Mainboard specification//////////////////////
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public  class AddMainboard extends HttpServlet
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
    String Brand_mb ;
    String Model_mb ;
    String Chip_set ;
    String Type_cpu ;
    String Quantity_mb;
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

	  out.println("<tr valign=\"top\" align=\"center\" bgcolor=\"#FFFFFF\">");
    out.println("<td colspan=\"2\" height=\"99\">");
    out.println(" <div align=\"left\"><font size=\"3\" face=\"Arial, Helvetica, sans-serif\"><i><b><font color=\"#000066\"><br> ");
    out.println(" Mainboard Details<br>");
    out.println(" <br>");
    out.println("</font></b></i><b><font color=\"#000066\"><font color=\"#003333\">Brand :<br>");
    out.println("Model :<br>");
    out.println("Chipset :<br>");
	  out.println("Type Cpu :</font></font></b></font></div><br>");
    out.println(" </td>");
    out.println(" </tr>");

    out.println("  <tr bgcolor=\"#ffb56a\" bordercolor=\"#FFFFFF\"> ");
    out.println("    <td height=\"33\" align=\"center\" colspan=\"2\">");
    out.println("      <div align=\"right\"><font size=\"3\" face=\"Arial, Helvetica, sans-serif\"><i><b>");
    out.println("          <font color=\"#000066\">Choose Mainboard Details ...</font></i></b></font></div>");
    out.println("    </td>");
    out.println("  </tr>");

    Brand_mb = req.getParameter("Brand_mb") ;
    Model_mb  = req.getParameter("Model_mb");
    Chip_set  = req.getParameter("Chip_set");
    Type_cpu     = req.getParameter("Type_cpu");
    Quantity_mb = req.getParameter("Quantity_mb");

    if (Brand_mb == null)
    {
      out.println("<form method = \"Get\" action = \"AddMainboard\">");

      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand mainboard");
      out.println("           <select name=\"Brand_mb\" size=\"1\">");
                              Query.Query("Brand_mb","mainboard","",out);
      out.println("</select>");
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Brand\">");
      out.println("    </td>");
      out.println("</tr>");

      out.println("</form>");
    }
    else if (Model_mb == null)
    {
  //    out.println("Your Select Brand monitor >>>>> " + Brand_monitor+"<br>");
      out.println("<form method = \"Get\" action = \"AddMainboard\">");
     //row1
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand mainboard");
      out.println("    </td>");
      out.println("    <td height=\"34\" align=\"center\" width=\"50%\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_mb);
      out.println("</tr>");

      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Model mainboard");
      out.println("<select name=\"Model_mb\" size=\"1\">");

      if (Brand_mb.compareTo("Not specific") == 0 )
      {
        Query.Query("Model_mb","mainboard","",out);
      }
      else
      {
       Query.Query("Model_mb","mainboard"," where Brand_mb  ='" + Brand_mb +"'",out) ;
      }
      out.println("</select>");
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" >");
      out.println(" <input type=hidden Name = \"Brand_mb\" value = \"" + Brand_mb + "\">" );
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Model\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }
     else if (Chip_set == null)
    {
      out.println("<form method = \"Get\" action = \"AddMainboard\">");
      ///row 1
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand mainboard");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_mb);
      out.println("</tr>");

      ///row2
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Model mainboard");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Model_mb);
      ///row3
      out.println("</tr>");
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Chip set");
      out.println("<select name=\"Chip_set\" size=\"1\">");
      if ((Model_mb.compareTo("Not specific") == 0 ) && (Brand_mb.compareTo("Not specific") == 0))
      {
        Query.Query("Chip_set","mainboard","",out);
      }
      else if ((Model_mb.compareTo("Not specific") == 0) && (Brand_mb.compareTo("Not specific") != 0))
      {
        Query.Query("Chip_set","mainboard"," where Brand_mb ='" + Brand_mb + "'",out);
      }
      else if ((Brand_mb.compareTo("Not specific") == 0 ) && (Model_mb.compareTo("Not specific") != 0))
      {
        Query.Query("Chip_set","mainboard"," where Model_mb ='" + Model_mb + "'",out);
      }
      else if ((Brand_mb.compareTo("Not specific") != 0 ) && (Model_mb.compareTo("Not specific") != 0))
      {
        Query.Query("Chip_set","mainboard"," where Model_mb ='" + Model_mb + "' and Brand_mb = '" + Brand_mb + "'",out);
      }
      out.println("</select>");
      out.println(" <input type=hidden Name = \"Brand_mb\" value = \"" + Brand_mb + "\">" );
      out.println(" <input type=hidden Name = \"Model_mb\" value = \"" + Model_mb + "\">" );
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Chipset\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }


      else if (Type_cpu == null)
    {
      out.println("<form method = \"Get\" action = \"AddMainboard\">");
      ///row 1
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand mainboard");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_mb);
      out.println("</tr>");

      ///row2
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Model mainboard");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Model_mb);
      ///row3
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Chip set");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Chip_set);

      ///row3
      out.println("</tr>");
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Type cpu");
      out.println("<br>");
      out.println("<select name=\"Type_cpu\" size=\"1\">");
      if ((Model_mb.compareTo("Not specific")     == 0 )
          && (Brand_mb.compareTo("Not specific") == 0 )
          && (Chip_set.compareTo("Not specific")  == 0 ) )
          {
             Query.Query("Type_cpu","mainboard","",out);
          }
      else if ((Model_mb.compareTo("Not specific")      == 0)
                && (Brand_mb.compareTo("Not specific") != 0)
                && (Chip_set.compareTo("Not specific")  == 0))
      {
        Query.Query("Type_cpu","mainboard"," where Brand_mb ='" + Brand_mb + "'",out);
      }
      else if ((Brand_mb.compareTo("Not specific")   == 0 )
              && (Model_mb.compareTo("Not specific")  != 0)
              && (Chip_set.compareTo("Not specific")  == 0 ))
      {
        Query.Query("Type_cpu","mainboard"," where Model_mb ='" + Model_mb + "'",out);
      }
      else if ((Brand_mb.compareTo("Not specific")   == 0)
              && (Model_mb.compareTo("Not specific")  == 0)
              && (Chip_set.compareTo("Not specific")  != 0))
      {
//        Query.Query("Type_cpu","monitor"," where Chip_set ='" + Chip_set + "' and Brand_mb = '" + Brand_mb + "'",out);
        Query.Query("Type_cpu","mainboard"," where Chip_set ='" + Chip_set + "'",out);

      }
      else if ((Brand_mb.compareTo("Not specific")   != 0)
              && (Model_mb.compareTo("Not specific")  != 0)
              && (Chip_set.compareTo("Not specific")  == 0))
      {
        Query.Query("Type_cpu","mainboard"," where Brand_mb ='" + Brand_mb + "' and Model_mb = '" + Model_mb + "'",out);

      }
      else if ((Brand_mb.compareTo("Not specific")   != 0)
              && (Model_mb.compareTo("Not specific")  == 0)
              && (Chip_set.compareTo("Not specific")  != 0))
      {
        Query.Query("Type_cpu","mainboard"," where Brand_mb ='" + Brand_mb + "' and Chip_set = '" + Chip_set + "'",out);

      }
      else if ((Brand_mb.compareTo("Not specific")   == 0)
              && (Model_mb.compareTo("Not specific")  != 0)
              && (Chip_set.compareTo("Not specific")  != 0))
      {
        Query.Query("Type_cpu","mainboard"," where Model_mb ='" + Model_mb + "' and Chip_set = '" + Chip_set + "'",out);

      }
      else if ((Brand_mb.compareTo("Not specific")   == 0)
              && (Model_mb.compareTo("Not specific")  != 0)
              && (Chip_set.compareTo("Not specific")  != 0))
      {
        Query.Query("Type_cpu","mainboard"," where Model_mb ='" + Model_mb + "' and Chip_set = '" + Chip_set + "'",out);

      }
      else if ((Brand_mb.compareTo("Not specific")   != 0)
              && (Model_mb.compareTo("Not specific")  != 0)
              && (Chip_set.compareTo("Not specific")  != 0))
      {
        Query.Query("Type_cpu","mainboard"," where Model_mb ='" + Model_mb + "' and Chip_set = '" + Chip_set + "' and Brand_mb = '" + Brand_mb + "'",out);

      }


      out.println("</select>");
      out.println(" <input type=hidden Name = \"Brand_mb\" value = \"" + Brand_mb + "\">" );
      out.println(" <input type=hidden Name = \"Model_mb\" value = \"" + Model_mb + "\">" );
      out.println(" <input type=hidden Name = \"Chip_set\" value = \"" + Chip_set + "\">" );

      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Type cpu\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }

     else if (Quantity_mb == null)
    {
      out.println("<form method = \"Get\" action = \"AddMainboard\" name = \"form\" >");
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><i><font color=\"#003333\">");
      out.println("Your Requirements  " + "</i><br>");
      out.println("<br>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#003366\"><b><font color=\"#990000\">");
      out.println("<font color=\"#006666\">MONITOR</font>   " + Brand_mb + "<br>");
      out.println("<font color=\"#006666\">TYPE</font>  " + Model_mb  + "<br>");
      out.println("<font color=\"#006666\">CHIP SET</font> " + Chip_set + " <br>");
      out.println("<font color=\"#006666\">TYPE CPU</font> " + Type_cpu + " <br>");

      out.println("<br>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Enter Quantity   ");
      out.println("<input type=\"text\" name=\"Quantity_mb\" size=\"2\" maxlength=\"2\">");
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

      out.println("<input type=\"button\" name=\"OK\" value=\"Submit\" onClick = \"validate(Quantity_mb)\">");
      out.println("    </td>");
      out.println("  </tr>");
      out.println(" <input type=hidden Name = \"Brand_mb\"  value = \"" + Brand_mb + "\">" );
      out.println(" <input type=hidden Name = \"Model_mb\"  value = \"" + Model_mb + "\">" );
      out.println(" <input type=hidden Name = \"Chip_set\"  value = \"" + Chip_set + "\">" );
      out.println(" <input type=hidden Name = \"Type_cpu\"  value = \"" + Type_cpu + "\">" );
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
      out.println("<font color=\"#006666\">MONITOR</font>   " + Brand_mb + "<br>");
      out.println("<font color=\"#006666\">TYPE</font>  " + Model_mb  + "<br>");
      out.println("<font color=\"#006666\">CHIP SET</font> " + Chip_set + "  <br>");
      out.println("<font color=\"#006666\">TYPE CPU</font> " + Type_cpu + " <br>");
      out.println("<font color=\"#006666\">Quantity</font> " + Quantity_mb + "<br>");

      out.println("<br>");
      out.println("<form method = \"Post\" action = \"Sendspec\">");
      out.println("<input type=hidden Name = \"Brand_mb\" value = \"" + Brand_mb + "\">" );
      out.println("<input type=hidden Name = \"Model_mb\" value = \"" + Model_mb + "\">" );
      out.println("<input type=hidden Name = \"Chip_set\" value = \"" + Chip_set + "\">" );
      out.println("<input type=hidden Name = \"Type_cpu\" value = \"" + Type_cpu + "\">" );
      out.println("<input type=hidden Name = \"Quantity_mb\" value = \"" + Quantity_mb + "\">" );
      out.println("<input type=hidden Name = \"Device_name\" value = \"" + "MAINBOARD" + "\">");

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
