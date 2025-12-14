////////////////////This class use for add RAM specification//////////////////////
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public  class AddRam extends HttpServlet
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
    String Brand_ram ;
    String Model_ram ;
    String Size_ram;
    String Speed_ram ;
    String Quantity_ram;
    int rowCount ;
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
    out.println(" RAM Details<br>");
    out.println(" <br>");
    out.println("</font></b></i><b><font color=\"#000066\"><font color=\"#003333\">Brand :<br>");
    out.println("Model :<br>");
    out.println("Size :</font></font></b></font></div><br>");
	//out.println("Dot Pitch :</font></font></b></font></div><br>");
    out.println(" </td>");
    out.println(" </tr>");

    out.println("  <tr bgcolor=\"#ffb56a\" bordercolor=\"#FFFFFF\"> ");
    out.println("    <td height=\"33\" align=\"center\" colspan=\"2\">");
    out.println("      <div align=\"right\"><font size=\"3\" face=\"Arial, Helvetica, sans-serif\"><i><b>");
    out.println("          <font color=\"#000066\">Choose RAM Details ...</font></i></b></font></div>");
    out.println("    </td>");
    out.println("  </tr>");

    Brand_ram = req.getParameter("Brand_ram") ;
    Model_ram  = req.getParameter("Model_ram");
    Size_ram = req.getParameter("Size_ram");
    Speed_ram = req.getParameter("Speed_ram");
    Quantity_ram = req.getParameter("Quantity_ram");
    if (Brand_ram == null)
    {
      out.println("<form method = \"Get\" action = \"AddRam\">");

      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand ram");
      out.println("           <select name=\"Brand_ram\" size=\"1\">");
                              Query.Query("Brand_ram","ram","",out);
      out.println("</select>");
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Brand\">");
      out.println("    </td>");
      out.println("</tr>");

      out.println("</form>");
    }
    else if (Model_ram == null)
    {
  //    out.println("Your Select Brand Cpu >>>>> " + Brand_cpu+"<br>");
      out.println("<form method = \"Get\" action = \"AddRam\">");
     //row1
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand Ram");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_ram);
      out.println("</tr>");

      out.println("<tr bgcolor=\"#ffcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Model_ram");
      out.println("<select name=\"Model_ram\" size=\"1\">");

      if (Brand_ram.compareTo("Not specific") == 0 )
      {
        Query.Query("Model_ram","ram","",out);
      }
      else
      {
       //  out.println("Type_cpu"+"cpu" + " where cpu ='" + Brand_cpu +"'") ;
       Query.Query("Model_ram","ram"," where Brand_ram  ='" + Brand_ram +"'",out) ;
      }
      out.println("</select>");
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" >");
      out.println(" <input type=hidden Name = \"Brand_ram\" value = \"" + Brand_ram + "\">" );
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Model\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }
     else if (Size_ram == null)
    {
      out.println("<form method = \"Get\" action = \"AddRam\">");
      ///row 1
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Brand ram");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\" ><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Brand_ram);
      out.println("</tr>");

      ///row2
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Model ram");
      out.println("</td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println(Model_ram);
      ///row3
      out.println("</tr>");
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Size ram");
      out.println("<select name=\"Size_ram\" size=\"1\">");
      if ((Model_ram.compareTo("Not specific") == 0 ) && (Brand_ram.compareTo("Not specific") == 0))
      {
        Query.Query("Size_ram","ram","",out);
      }
      else if ((Model_ram.compareTo("Not specific") == 0) && (Brand_ram.compareTo("Not specific") != 0))
      {
        Query.Query("Size_ram","ram"," where Brand_ram ='" + Brand_ram + "'",out);
      }
      else if ((Brand_ram.compareTo("Not specific") == 0 ) && (Model_ram.compareTo("Not specific") != 0))
      {
        Query.Query("Size_ram","ram"," where Model_ram ='" + Model_ram + "'",out);
      }
      else if ((Brand_ram.compareTo("Not specific") != 0 ) && (Model_ram.compareTo("Not specific") != 0))
      {
        Query.Query("Size_ram","ram"," where Model_ram ='" + Model_ram + "' and Brand_ram = '" + Brand_ram + "'",out);
      }
      out.println("</select>");
      out.println(" <input type=hidden Name = \"Brand_ram\" value = \"" + Brand_ram + "\">" );
      out.println(" <input type=hidden Name = \"Model_ram\" value = \"" + Model_ram + "\">" );
      out.println("</font></b> </font>");
      out.println("    </td>");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\">");
      out.println("<input type=\"submit\" name=\"Sumbit\" value=\"Choose Size\">");
      out.println("    </td>");
      out.println("</tr>");
      out.println("</form>");
    }
    else if (Quantity_ram == null)
    {
      out.println("<form method = \"Get\" action = \"AddRam\"  name = \"form\" >");
      out.println("<tr bgcolor=\"#FFcc99\" bordercolor=\"#FFFFFF\">");
      out.println("    <td height=\"33\" align=\"center\" width=\"50%\"><font size=\"2\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#333333\"><b></b></font></font>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#003366\"><b><i><font color=\"#003333\">");
      out.println("Your Requirements  " + "</i><br>");
      out.println("<br>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#003366\"><b><font color=\"#990000\">");
      out.println("<font color=\"#006666\">RAM</font>   " + Brand_ram + "<br>");
      out.println("<font color=\"#006666\">MODEL</font>  " + Model_ram  + "<br>");
      out.println("<font color=\"#006666\">SIZE</font> " + Size_ram + "<br>");
      out.println("<br>");
      out.println("       <font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#003366\"><b><font color=\"#003333\">");
      out.println("Enter Quantity   ");
      out.println(" <input type=hidden Name = \"Brand_ram\" value = \"" + Brand_ram + "\">" );
      out.println(" <input type=hidden Name = \"Model_ram\" value = \"" + Model_ram + "\">" );
      out.println(" <input type=hidden Name = \"Size_ram\" value = \""  + Size_ram + "\" >" );
      out.println("<input type=\"text\" name=\"Quantity_ram\" size=\"2\" maxlength=\"2\">");
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


      out.println("<input type=\"button\" name=\"OK\" value=\"Submit\" onClick = \"validate(Quantity_ram)\">");
      out.println("    </td>");
      out.println("  </tr>");
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
      out.println("<font color=\"#006666\">RAM</font>   " + Brand_ram + "<br>");
      out.println("<font color=\"#006666\">MODEL</font>  " + Model_ram  + "<br>");
      out.println("<font color=\"#006666\">SIZE</font> " + Size_ram + " <br>");
      out.println("<font color=\"#006666\">Quantity</font> " + Quantity_ram + "<br>");
      out.println("<br>");
      out.println("<form method = \"Post\" action = \"Sendspec\">");
      out.println("<input type=hidden Name = \"Brand_ram\" value = \"" + Brand_ram + "\">" );
      out.println("<input type=hidden Name = \"Model_ram\" value = \"" + Model_ram + "\">" );
      out.println("<input type=hidden Name = \"Size_ram\" value = \"" + Size_ram + "\">" );
      out.println("<input type=hidden Name = \"Quantity_ram\" value = \"" + Quantity_ram + "\">" );
      out.println("<input type=hidden Name = \"Device_name\" value = \"" + "RAM" + "\">" );
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
