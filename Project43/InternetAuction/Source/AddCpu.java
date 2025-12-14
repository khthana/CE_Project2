////////////////////This class use for add CPU specification//////////////////////
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public  class AddCpu extends HttpServlet
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
    String Brand_cpu ;
    String Type_cpu ;
    String Speed_cpu ;
    String Slot_type ;

    String Quantity_cpu;
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
    out.println("<td  height=\"99\">");
    out.println(" <div align=\"left\"><font size=\"3\" face=\"Arial, Helvetica, sans-serif\"><i><b><font color=\"#000066\"><br> ");
    out.println(" CPU Details<br>");
    out.println(" <br>");
    out.println("</font></b></i><b><font color=\"#000066\"><font color=\"#003333\">Brand :<br>");
    out.println("Type Cpu :<br>");
    out.println("Speed Cpu :<br>");
	  out.println("Slot type :</font></font></b></font></div><br>");
    out.println(" </td>");
    out.println(" </tr>");

    out.println("  <tr bgcolor=\"#ffb56a\" bordercolor=\"#FFFFFF\"> ");
    out.println("    <td height=\"33\" align=\"center\" colspan=\"2\">");
    out.println("      <div align=\"right\"><font size=\"3\" face=\"Arial, Helvetica, sans-serif\"><i><b>");
    out.println("          <font color=\"#000066\">Choose CPU  Details ...</font></i></b></font></div>");
    out.println("    </td>");
    out.println("  </tr>");

    Brand_cpu = req.getParameter("Brand_cpu") ;
    Type_cpu  = req.getParameter("Type_cpu");
    Speed_cpu  = req.getParameter("Speed_cpu");
    Slot_type     = req.getParameter("Slot_type");
    Quantity_cpu = req.getParameter("Quantity_cpu");

    if (Brand_cpu == null)
    {
      out.println("<form method = \"Get\" action = \"AddCpu\">");

      out.println("<tr bgcolor=\"#FFCC99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand Cpu");
      out.println("           <select name=\"Brand_cpu\" size=\"1\">");
                              Query.Query("Brand_cpu","cpu","",out);
      out.println("</select>");
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Brand\">");
      out.println("    </td>");
      out.println("</tr>");

      out.println("</form>");
    }
    else if (Type_cpu == null)
    {
  //    out.println("Your Select Brand monitor >>>>> " + Brand_monitor+"<br>");
      out.println("<form method = \"Get\" action = \"AddCpu\">");
     //row1
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand Cpu");
      out.println("    </td>");
      out.println("    <td height=\"34\" align=\"center\" width=\"50%\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_cpu);
      out.println("</tr>");

      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Type cpu");
      out.println("<select name=\"Type_cpu\" size=\"1\">");

      if (Brand_cpu.compareTo("Not specific") == 0 )
      {
        Query.Query("Type_cpu","cpu","",out);
      }
      else
      {
       Query.Query("Type_cpu","cpu"," where Brand_cpu  ='" + Brand_cpu +"'",out) ;
      }
      out.println("</select>");
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" >");
      out.println(" <input type=hidden Name = \"Brand_cpu\" value = \"" + Brand_cpu + "\">" );
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Type\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }
     else if (Speed_cpu == null)
    {
      out.println("<form method = \"Get\" action = \"AddCpu\">");
      ///row 1
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand Cpu");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_cpu);
      out.println("</tr>");

      ///row2
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Type Cpu");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Type_cpu);
      ///row3
      out.println("</tr>");
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Speed cpu ");
      out.println("<select name=\"Speed_cpu\" size=\"1\">");
      if ((Type_cpu.compareTo("Not specific") == 0 ) && (Brand_cpu.compareTo("Not specific") == 0))
      {
        Query.Query("Speed_cpu","cpu","",out);
      }
      else if ((Type_cpu.compareTo("Not specific") == 0) && (Brand_cpu.compareTo("Not specific") != 0))
      {
        Query.Query("Speed_cpu","cpu"," where Brand_cpu ='" + Brand_cpu + "'",out);
      }
      else if ((Brand_cpu.compareTo("Not specific") == 0 ) && (Type_cpu.compareTo("Not specific") != 0))
      {
        Query.Query("Speed_cpu","cpu"," where Type_cpu ='" + Type_cpu + "'",out);
      }
      else if ((Brand_cpu.compareTo("Not specific") != 0 ) && (Type_cpu.compareTo("Not specific") != 0))
      {
        Query.Query("Speed_cpu","cpu"," where Type_cpu ='" + Type_cpu + "' and Brand_cpu = '" + Brand_cpu + "'",out);
      }
      out.println("</select>");
      out.println(" <input type=hidden Name = \"Brand_cpu\" value = \"" + Brand_cpu + "\">" );
      out.println(" <input type=hidden Name = \"Type_cpu\" value = \"" + Type_cpu + "\">" );
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Speed\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }


      else if (Slot_type == null)
    {
      out.println("<form method = \"Get\" action = \"AddCpu\">");
      ///row 1
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand Cpu");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_cpu);
      out.println("</tr>");

      ///row2
      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Type Cpu");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Type_cpu);
      ///row3
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Speed");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Speed_cpu);

      ///row3
      out.println("</tr>");
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Slot type");
      out.println("<br>");
      out.println("<select name=\"Slot_type\" size=\"1\">");
      if ((Type_cpu.compareTo("Not specific")     == 0 )
          && (Brand_cpu.compareTo("Not specific") == 0 )
          && (Speed_cpu.compareTo("Not specific")  == 0 ) )
          {
             Query.Query("Slot_type","cpu","",out);
          }
      else if ((Type_cpu.compareTo("Not specific")      == 0)
                && (Brand_cpu.compareTo("Not specific") != 0)
                && (Speed_cpu.compareTo("Not specific")  == 0))
      {
        Query.Query("Slot_type","cpu"," where Brand_cpu ='" + Brand_cpu + "'",out);
      }
      else if ((Brand_cpu.compareTo("Not specific")   == 0 )
              && (Type_cpu.compareTo("Not specific")  != 0)
              && (Speed_cpu.compareTo("Not specific")  == 0 ))
      {
        Query.Query("Slot_type","cpu"," where Type_cpu ='" + Type_cpu + "'",out);
      }
      else if ((Brand_cpu.compareTo("Not specific")   == 0)
              && (Type_cpu.compareTo("Not specific")  == 0)
              && (Speed_cpu.compareTo("Not specific")  != 0))
      {
//        Query.Query("Slot_type","monitor"," where Speed_cpu ='" + Speed_cpu + "' and Brand_cpu = '" + Brand_cpu + "'",out);
        Query.Query("Slot_type","cpu"," where Speed_cpu ='" + Speed_cpu + "'",out);

      }
      else if ((Brand_cpu.compareTo("Not specific")   != 0)
              && (Type_cpu.compareTo("Not specific")  != 0)
              && (Speed_cpu.compareTo("Not specific")  == 0))
      {
        Query.Query("Slot_type","cpu"," where Brand_cpu ='" + Brand_cpu + "' and Type_cpu = '" + Type_cpu + "'",out);

      }
      else if ((Brand_cpu.compareTo("Not specific")   != 0)
              && (Type_cpu.compareTo("Not specific")  == 0)
              && (Speed_cpu.compareTo("Not specific")  != 0))
      {
        Query.Query("Slot_type","cpu"," where Brand_cpu ='" + Brand_cpu + "' and Speed_cpu = '" + Speed_cpu + "'",out);

      }
      else if ((Brand_cpu.compareTo("Not specific")   == 0)
              && (Type_cpu.compareTo("Not specific")  != 0)
              && (Speed_cpu.compareTo("Not specific")  != 0))
      {
        Query.Query("Slot_type","cpu"," where Type_cpu ='" + Type_cpu + "' and Speed_cpu = '" + Speed_cpu + "'",out);

      }
      else if ((Brand_cpu.compareTo("Not specific")   == 0)
              && (Type_cpu.compareTo("Not specific")  != 0)
              && (Speed_cpu.compareTo("Not specific")  != 0))
      {
        Query.Query("Slot_type","cpu"," where Type_cpu ='" + Type_cpu + "' and Speed_cpu = '" + Speed_cpu + "'",out);

      }
      else if ((Brand_cpu.compareTo("Not specific")   != 0)
              && (Type_cpu.compareTo("Not specific")  != 0)
              && (Speed_cpu.compareTo("Not specific")  != 0))
      {
        Query.Query("Slot_type","cpu"," where Type_cpu ='" + Type_cpu + "' and Speed_cpu = '" + Speed_cpu + "' and Brand_cpu = '" + Brand_cpu + "'",out);

      }


      out.println("</select>");
      out.println(" <input type=hidden Name = \"Brand_cpu\" value = \"" + Brand_cpu + "\">" );
      out.println(" <input type=hidden Name = \"Type_cpu\" value = \"" + Type_cpu + "\">" );
      out.println(" <input type=hidden Name = \"Speed_cpu\" value = \"" + Speed_cpu + "\">" );

      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Slot type\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }

     else if (Quantity_cpu == null)
    {
      out.println("<form method = \"Get\" action = \"AddCpu\" name = \"form\" >");
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><i><font color=\"#003333\">");
      out.println("Your Requirements  " + "</i><br>");
      out.println("<br>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#003366\"><b><font color=\"#990000\">");
      out.println("<font color=\"#006666\">BRAND</font>   " + Brand_cpu + "<br>");
      out.println("<font color=\"#006666\">Type </font>  " + Type_cpu  + "<br>");
      out.println("<font color=\"#006666\">SPEED</font> " + Speed_cpu + " <br>");
      out.println("<font color=\"#006666\">Slot type</font> " + Slot_type + " <br>");

      out.println("<br>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Enter Quantity   ");
      out.println("<input type=\"text\" name=\"Quantity_cpu\" size=\"2\" maxlength=\"2\">");
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
      out.println("<input type=\"button\" name=\"OK\" value=\"Submit\" onClick = \"validate(Quantity_cpu)\">");
      out.println("    </td>");
      out.println("  </tr>");
      out.println(" <input type=hidden Name = \"Brand_cpu\"  value = \"" + Brand_cpu + "\">" );
      out.println(" <input type=hidden Name = \"Type_cpu\"  value = \"" + Type_cpu + "\">" );
      out.println(" <input type=hidden Name = \"Speed_cpu\"  value = \"" + Speed_cpu + "\">" );
      out.println(" <input type=hidden Name = \"Slot_type\"  value = \"" + Slot_type + "\">" );
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
      out.println("<font color=\"#006666\">BRAND</font>   " + Brand_cpu + "<br>");
      out.println("<font color=\"#006666\">TYPE</font>  " + Type_cpu  + "<br>");
      out.println("<font color=\"#006666\">SPEED </font> " + Speed_cpu + "  <br>");
      out.println("<font color=\"#006666\">Slot type</font> " + Slot_type + " <br>");
      out.println("<font color=\"#006666\">Quantity</font> " + Quantity_cpu + "<br>");
      out.println("<br>");
      out.println("<form method = \"Post\" action = \"Sendspec\">");
      out.println("<input type=hidden Name = \"Brand_cpu\" value = \"" + Brand_cpu + "\">" );
      out.println("<input type=hidden Name = \"Type_cpu\" value = \"" + Type_cpu + "\">" );
      out.println("<input type=hidden Name = \"Speed_cpu\" value = \"" + Speed_cpu + "\">" );
      out.println("<input type=hidden Name = \"Slot_type\" value = \"" + Slot_type + "\">" );
      out.println("<input type=hidden Name = \"Quantity_cpu\" value = \"" + Quantity_cpu + "\">" );
      out.println("<input type=hidden Name = \"Device_name\" value = \"" + "CPU" + "\">");
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
