////////////////////This class use for add each computer part specification//////////////////////
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Addpart extends HttpServlet {

    public void doGet (HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException
    {
      String Str_name ;
      String Str_Partname,Str_Partdescription;
    	PrintWriter		out;
      res.setContentType("text/html");
      String Device = req.getParameter("Device");
      HttpSession session = req.getSession(true);
     	out = res.getWriter();
      String havepart ;
      String newpart  ;
      Specification spectest = new Specification();
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Internet Auction [Add Technicle Requirement] : CE.KMITL</title>");
      out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
      out.println("</head>");
      out.println("<body bgcolor=\"#FFFFFF\">");
      havepart = (String)session.getValue("havepart");
      newpart = req.getParameter("newpart");
      if (newpart != null)
      {
        havepart = null;
      }
      if (havepart == null)
      {
        ////////-------------if it is 1st part-----------------////
        if (newpart == null)
        {

         Part part = new Part();
         spectest.Listpart.addElement(part);

      //   out.println("new value");
         spectest.name               = req.getParameter("Username");
         spectest.company_name       = req.getParameter("Companyname");
         spectest.projectname        = req.getParameter("Projectname");
         spectest.projectdescription = req.getParameter("Projectdescription");
         String Str_maxprice         = req.getParameter("Maxprice");
         spectest.Maxprice           = Integer.parseInt(Str_maxprice);
         spectest.Enddate            = req.getParameter("Enddate");
         spectest.Enddate            += " " + req.getParameter("hour");
         spectest.Enddate            += ":" + req.getParameter("min");

        }
        ///////---------------if add newpart------------------////
        else if (newpart != null)
        {
          Part part = new Part();
          spectest = (Specification)session.getValue(session.getId());
          spectest.Listpart.addElement(part);
          int count_part = spectest.Listpart.size()-1 ;
//          out.println("have new part count part = " + count_part);
        }
        Str_Partname                = req.getParameter("Partname");
        Str_Partdescription         = req.getParameter("Description");
        if (Str_Partname == null)
            Str_Partname = "-";
        if (Str_Partdescription == null)
            Str_Partdescription = "-";

        spectest.Set_Partdetail(Str_Partname,Str_Partdescription,spectest.Listpart.size()-1);
        session.putValue(session.getId(),spectest);
        out.println("<div align=\"right\">");
       // out.println("  <p><font size=\"6\" color=\"#9999FF\"><i><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#003333\">Add");
       // out.println("    New Part</font></b></i></font></p>");
       // out.println("  <p><img src=\"bar.gif\" width=\"550\" height=\"2\"></p>");
       // out.println("  <p>&nbsp; </p>");
        out.println("  <div align=\"left\">");
        out.println("    <table width=\"90%\" border=\"0\" align=\"center\" height=\"424\" cellpadding=\"5\" cellspacing=\"2\">");
    		out.println("<tr valign=\"top\" align=\"center\">");
        out.println(" <td colspan=\"4\" height=\"71\"><img src=\"/picture/AddDevices.jpg\" width=\"970\" height=\"70\"><br><br></td>");
        out.println("</tr> ");
        out.println("      <tr valign=\"top\" bgcolor=\"#ffb56a\">");
        out.println("        <td colspan=\"2\" height=\"126\">");
        out.println("      <font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#330033\">");
        out.println("Name&nbsp;&nbsp;<br>");
        out.println("      <font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#330033\">");
        out.println("Company Name&nbsp;&nbsp;<br>");
        out.println("</font><font color=\"#003333\">");
        out.println("</font><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#330033\">");
        out.println("Project Name&nbsp;&nbsp;<br>");
        out.println("</font><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#330033\">");
        out.println("project Description&nbsp;&nbsp;<br>");
        out.println("<font color=\"#990000\">");
        out.println("End Date&nbsp;&nbsp;<br>");
        out.println("<font color=\"#990000\">");
        out.println("Maxprice(Baht)&nbsp;&nbsp;<br></font></font></b></font></b></font></b></font><font color=\"#003333\">");
        out.println("Part&nbsp;&nbsp;<br></font> </b>");
        out.println("<b>");
        out.println("<font color=\"#003333\">");
        out.println("Description&nbsp;&nbsp;<br></font></b></font>");
        out.println("</td>");

		out.println(" <TD colSpan=2 height=126><font face=\"Arial, Helvetica, sans-serif\" size=3><b><font color=#003366>" + spectest.name + "<br>");
		out.println("<font face=\"Arial, Helvetica, sans-serif\" size=3><b><font color=#003366>" + spectest.company_name + "<br>");
		out.println("<font face=\"Arial, Helvetica, sans-serif\" size=3><b><font color=#003366>" + spectest.projectname + "<br>");
		out.println("<font face=\"Arial, Helvetica, sans-serif\" size=3><b><font color=#003366>" + spectest.projectdescription + "<br>");
		out.println("<font face=\"Arial, Helvetica, sans-serif\" size=3><b><font color=#003366>" + spectest.Enddate + "<br>");
		out.println("<font face=\"Arial, Helvetica, sans-serif\" size=3><b><font color=#003366>" + spectest.Maxprice + "<br>");
		out.println("<font face=\"Arial, Helvetica, sans-serif\" size=3><b><font color=#003366>" + spectest.GetPart(spectest.Listpart.size()-1).Partname + "<br>");
		out.println("<font face=\"Arial, Helvetica, sans-serif\" size=3><b><font color=#003366>" + spectest.GetPart(spectest.Listpart.size()-1).Partdescription + "<br>");
		out.println("</td>");

        out.println(" </tr>");
        out.println(" <tr bgcolor=\"#FFCC99\" valign=\"top\">");
        out.println("  <td colspan=\"4\" height=\"52\">");
        out.println("          <form method=\"Post\" action=\"Sendadddevice\">");
        out.println("            <div align=\"center\"></div>");
        out.println("            <font face=\"Arial, Helvetica, sans-serif\" color=\"#330066\" size=\"3\"><i><b><div align=\"center\">Device</b></i>     <select name=\"Device\" size=\"1\">");
        out.println("<option>CPU</option>");
        out.println("<option>RAM</option>");
        out.println("<option>MAINBOARD</option>");
        out.println("<option>HARDDISK</option> ");
        out.println("<option>CDROM</option>");
        out.println("<option>DISPLAY CARD</option>");
        out.println("<option>SOUND CARD</option>");
        out.println("<option>MONITOR</option>");
        out.println("<option>MODEM</option>");
        out.println("<option>FLOPPY DISK</option>");
        out.println("<option>MOUSE</option>");
        out.println("<option>KEYBOARD</option>");
        out.println("<option>SPEAKER</option>");
        out.println("</select> <input type=\"submit\" name=\"Adddevice\" value=\"ADD\"></div> </font>");
     // out.println("          <pre>&nbsp;</pre>");
        out.println("        </td>");
        out.println("      </tr>");
        out.println("      <tr bgcolor=\"#99DDDD\">");
        out.println("        <td height=\"33\" width=\"10%\">");
        out.println("          <div align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#330000\"><b><font color=\"#003366\">Remove</font></b></font></div>");
        out.println("        </td>");
        out.println("        <td height=\"33\" width=\"18%\">");
        out.println("          <div align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#330000\"><b><font color=\"#003366\">Devices</font></b></font></div>");
        out.println("        </td>");
        out.println("        <td height=\"33\" width=\"53%\">");
        out.println("          <div align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#330000\"><b><font color=\"#003366\">Details</font></b></font></div>");
        out.println("        </td>");
        out.println("        <td height=\"33\" width=\"19%\">");
        out.println("          <div align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#330000\"><b><font color=\"#003366\">Quantity</font></b></font></div>");
        out.println("        </td>");
        out.println("      </tr>");
        out.println("      <tr bgcolor=\"#CCCCCC\">");
        out.println("      </tr>");
        out.println("    </table>");
        out.println("  </div>");
        out.println("  <p align=\"center\">&nbsp; </p>");
        out.println("</div>");
        out.println("          </form>");
      //  out.println("            <pre>&nbsp;</pre>");
        out.println("   <center>         <form method=\"Get\" action=\"Makeproject\" name=\"test\">");
        out.println("              <input type=\"submit\" name=\"test\" value=\"Send This Part\">");
        out.println("            </form> </center>");
        out.println("</body>");
        out.println("</html>");
   }
   else if (havepart.compareTo("havepart") == 0)
   {

      spectest = (Specification)session.getValue(session.getId());
    //  out.println("old value");
      int count_part = spectest.Listpart.size() - 1 ;
    //  out.println("count part is "+ count_part);
      out.println("<div align=\"right\">");
     // out.println("  <p><font size=\"6\" color=\"#9999FF\"><i><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#003333\">Add");
     // out.println("    New Part</font></b></i></font></p>");
     // out.println("  <p><img src=\"bar.gif\" width=\"550\" height=\"2\"></p>");
     // out.println("  <p>&nbsp; </p>");
      out.println("  <div align=\"left\">");
      out.println("    <table width=\"90%\" border=\"0\" align=\"center\" height=\"424\" cellpadding=\"5\" cellspacing=\"2\">");
   	  out.println("<tr valign=\"top\" align=\"center\">");
       out.println(" <td colspan=\"4\" height=\"71\"><img src=\"/picture/AddDevices.jpg\" width=\"970\" height=\"70\"><br><br></td>");
       out.println("</tr> ");

      out.println("      <tr valign=\"top\" bgcolor=\"#ffb56a\">");
        out.println("        <td colspan=\"2\" height=\"126\">");
        out.println("      <font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#330033\">");
        out.println("Name&nbsp;&nbsp;<br>");
        out.println("      <font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#330033\">");
        out.println("Company Name&nbsp;&nbsp;<br>");
        out.println("</font><font color=\"#003333\">");
        out.println("</font><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#330033\">");
        out.println("Project Name&nbsp;&nbsp;<br>");
        out.println("</font><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#330033\">");
        out.println("project Description&nbsp;&nbsp;<br>");
        out.println("<font color=\"#990000\">");
        out.println("End Date&nbsp;&nbsp;<br>");
        out.println("<font color=\"#990000\">");
        out.println("Maxprice(Baht)&nbsp;&nbsp;<br></font></font></b></font></b></font></b></font><font color=\"#003333\">");
        out.println("Part&nbsp;&nbsp;<br></font> </b>");
        out.println("<b>");
        out.println("<font color=\"#003333\">");
        out.println("Description&nbsp;&nbsp;<br></font></b></font>");
        out.println("</td>");

		out.println(" <TD colSpan=2 height=126><font face=\"Arial, Helvetica, sans-serif\" size=3><b><font color=#003366>" + spectest.name + "<br>");
		out.println("<font face=\"Arial, Helvetica, sans-serif\" size=3><b><font color=#003366>" + spectest.company_name + "<br>");
		out.println("<font face=\"Arial, Helvetica, sans-serif\" size=3><b><font color=#003366>" + spectest.projectname + "<br>");
		out.println("<font face=\"Arial, Helvetica, sans-serif\" size=3><b><font color=#003366>" + spectest.projectdescription + "<br>");
		out.println("<font face=\"Arial, Helvetica, sans-serif\" size=3><b><font color=#003366>" + spectest.Enddate + "<br>");
		out.println("<font face=\"Arial, Helvetica, sans-serif\" size=3><b><font color=#003366>" + spectest.Maxprice + "<br>");
		out.println("<font face=\"Arial, Helvetica, sans-serif\" size=3><b><font color=#003366>" + spectest.GetPart(spectest.Listpart.size()-1).Partname + "<br>");
		out.println("<font face=\"Arial, Helvetica, sans-serif\" size=3><b><font color=#003366>" + spectest.GetPart(spectest.Listpart.size()-1).Partdescription + "<br>");
		out.println("</td>");



      out.println(" </tr>");
      out.println(" <tr bgcolor=\"#FFCC99\" valign=\"top\">");
      out.println("  <td colspan=\"4\" height=\"54\">");
      out.println("          <form method=\"Post\" action=\"Sendadddevice\">");
      //out.println("            <div align=\"center\"></div>");
      out.println("            <font face=\"Arial, Helvetica, sans-serif\" color=\"#330066\" size=\"3\"><i><b><div align=\"center\">Device</b></i>     <select name=\"Device\" size=\"1\"> ");
        out.println("<option>CPU</option>");
        out.println("<option>RAM</option>");
        out.println("<option>MAINBOARD</option>");
        out.println("<option>HARDDISK</option> ");
        out.println("<option>CDROM</option>");
        out.println("<option>DISPLAY CARD</option>");
        out.println("<option>SOUND CARD</option>");
        out.println("<option>MONITOR</option>");
        out.println("<option>MODEM</option>");
        out.println("<option>FLOPPY DISK</option>");
        out.println("<option>MOUSE</option>");
        out.println("<option>KEYBOARD</option>");
        out.println("<option>SPEAKER</option>");

      out.println("</select> <input type=\"submit\" name=\"Adddevice\" value=\"ADD\"></div> </font> ");
       //out.println("          <pre>&nbsp;</pre>");
      out.println("        </td>");
      out.println("      </tr>");
      out.println("      <tr bgcolor=\"#99dddd\">");
      out.println("        <td height=\"33\" width=\"11%\">");
      out.println("          <div align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#330000\"><b><font color=\"#003366\">Remove</font></b></font></div>");
      out.println("        </td>");
      out.println("        <td height=\"33\" width=\"15%\">");
      out.println("          <div align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#330000\"><b><font color=\"#003366\">Device</font></b></font></div>");
      out.println("        </td>");
      out.println("        <td height=\"33\" width=\"56%\">");
      out.println("          <div align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#330000\"><b><font color=\"#003366\">Detail</font></b></font></div>");
      out.println("        </td>");
      out.println("        <td height=\"33\" width=\"18%\">");
      out.println("          <div align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#330000\"><b><font color=\"#003366\">Quantity</font></b></font></div>");
      out.println("        </td>");
      out.println("      </tr>");
      out.println("</form>");
      String Str_remove = req.getParameter("Remove");
      if (Str_remove != null)
      {
        int  row_remove ;
        row_remove = Integer.parseInt(Str_remove) ;
        out.println(row_remove);
        spectest.GetPart(count_part).Listdevice.removeElementAt(row_remove);
      }
      ///-------------Display All Device in This Part--------------------////
      for (int row = 0 ; row < spectest.GetPart(count_part).Listdevice.size()  ; row++)
      {
      out.println("      <tr bgcolor=\"#D0E8E8\">");
      out.println("        <td height=\"33\" width=\"11%\">");
      out.println("<form method=\"Get\" action=\"Addpart\">");
      out.println("<div align=\"center\"><input type=\"submit\" name=\"Submit\" value=\"remove\"></div>");
      out.println("<input type=hidden Name = \"Remove\" value = \"" + row  + "\">" );
      out.println("</form>");
      out.println("        </td>");
      out.println("        <td height=\"33\" width=\"15%\">");
      out.println("          <div align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#330000\"><b><font color=\"#660033\">"+ spectest.GetPart(count_part).GetDevice(row).GetType() +"</font></b></font></div>");
      out.println("        </td>");
      out.println("        <td height=\"33\" width=\"56%\">");
      out.println("          <div align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#330000\"><b><font color=\"#660033\">");
      for (int col = 0 ; col < spectest.GetPart(count_part).GetDevice(row).Data.length ; col++)
      {
         if (spectest.GetPart(count_part).GetDevice(row).Data[col].compareTo("Not specific") != 0)
              out.println(spectest.GetPart(count_part).GetDevice(row).Data[col]);;
      }
      out.println("</font></b></font></div>");
      out.println("        </td>");
      out.println("        <td height=\"33\" width=\"18%\">");
      out.println("          <div align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#330000\"><b><font color=\"#660033\">"+spectest.GetPart(count_part).GetDevice(row).getQuantity() +"</font></b></font></div>");
      out.println("        </td>");
      out.println("      </tr>");
      }
      out.println("      <tr bgcolor=\"#CCCCCC\">");
      out.println("      </tr>");
      out.println("    </table>");
      out.println("  </div>");
      out.println("</div>");
      out.println("   <center>         <form method=\"Get\" action=\"AddTechReq\" name=\"test\">");
      out.println("              <input type=\"submit\" name=\"test\" value=\"Send This Part\">");
      out.println("            </form> </center>");
      out.println("</body>");
      out.println("</html>");
   }
   }
}
