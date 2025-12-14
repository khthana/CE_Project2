import  java.sql.*;
import  oracle.jdbc.driver.*;
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.util.*;
public class ListDeviceFromDatabase extends HttpServlet
{
    public void   doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
	  java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
    HttpSession session = req.getSession(true);
    resp.setContentType("text/html");
    String device = req.getParameter("device");
    out.println("<html>");
out.println("<head>");
out.println("<title>Internet Auction : CE.KMITL</title>");
out.println("<style><!-- A:link, A:visited { text-decoration: none; color: #ffffff}  A:hover { text-decoration: none; font-weight: underline; color :  #33ccff} // --></style>");
out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
out.println("</head>");
out.println("");
out.println("<body bgcolor=\"#FFFFFF\" link=\"#FF9933\" vlink=\"#3399CC\" alink=\"#FF9966\" >");
out.println("<div align=\"center\">");
out.println("");
out.println("  <div id=\"Layer1\" style=\"position:absolute; width:970px; height:100px; z-index:1; left: 17px; top: 22px\"> ");
out.println("");
out.println("    <table width=\"99%\" border=\"0\" height=\"400\" cellpadding=\"5\" cellspacing=\"2\">");
out.println("      <tr>");
out.println("    <div align=\"center\"><img src=\"/picture/AuctionBanner.jpg\" width=\"970\" height=\"98\"></div>");
out.println("  ");
out.println("");
out.println("</tr>    ");
out.println("<tr> ");
out.println("      <td rowspan=\"3\" height=\"137\" width=\"20%\" bgcolor=\"#4F4FD2\" valign=\"top\"> ");
out.println("        <div align=\"center\">");
out.println("          <p><font size=\"3\" face=\"Arial, Helvetica, sans-serif\"><font color=\"#FF3366\"><i><font size=\"2\"><br>");
out.println("            </font></i></font></font></p>");
out.println("          <p><font size=\"3\" face=\"Arial, Helvetica, sans-serif\"><font color=\"#FF3366\"><i><font size=\"2\"><font color=\"#CC0000\"><b><font size=\"3\" color=\"#FFCC00\">New ");
out.println("            Users !!</font></b></font><br>");
out.println("            </font></i></font></font><br>");
out.println("          </p>");
out.println("        </div>");
out.println("        <div align=\"center\">");
out.println("          <p><font size=\"3\"><a href=\"../register.html\"><font face=\"Arial, Helvetica, sans-serif\">Register</font></a></font>");
out.println("            <br>");
out.println("              <font size=\"3\"><a href=\"../NewToAuction.html\"><font face=\"Arial, Helvetica, sans-serif\">");
out.println("              New to our Auction</font></a></font> <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("            </i></font><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("            <br>");
out.println("            <font color=\"#cc0000\"><b><font size=\"3\" color=\"#ffcc00\">Auction Member</font></b></font></i></font></p>");
out.println("          <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><a href=\"LoginSuccess\"><font size=\"3\" >Home<font face=\"Arial, Helvetica, sans-serif\">");
out.println("          </font></font></a></font><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("            </i><a href=\"Changeinfo\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Change ");
out.println("            Personal Information </font><font  face=\"Arial, Helvetica, sans-serif\"> ");
out.println("            </font></font> </a><i> </i></font> </div>");
out.println("          <div align=\"center\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"></font><a href=\"Listmember\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Member");
out.println("            Profiles<br>");
out.println("            </font></font></a><a href=\"Listproject\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Project");
out.println("            List</font></font></a><a href=\"OfferSpec\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><br>");
out.println("            </font></font></a><a href=\"Ranking\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Member Rating</font></font></a>");
out.println("            <br>");
out.println("            <br>");
out.println("            <font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\" size=\"2\"><b><font color=\"#FF9900\">For");
out.println("            Buyer</font></b></font></font><br>");
out.println("            <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"GeneralReq\">General");
out.println("            Requirement</a></font></font><br>");
out.println("			<font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"AddTechReq\">Add Technical Requirement <font size=\"2\"><i>(bidding)</i></font></a></font></font><br><br>");
out.println("            <font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#CCCCCC\" size=\"2\"><b><font color=\"#FF9900\">For");
out.println("            Seller</font></b></font></font><br>");
out.println("            <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"AddSpecification\">Add");
out.println("            Specification</a></font></font><br>");
out.println("            <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"ListBiddingProject\">Bidding</a></font></font><br>");
out.println("            <br>");
out.println("");
out.println("");
out.println("            </div>");
out.println("          <div align=\"center\">");
out.println("<p><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><font color=\"#cc0000\"><b><font size=\"3\" color=\"#ffcc00\">Auction ");
out.println("              Services</font></b></font></i></font> <br>");
out.println("            </p>");
out.println("            </div>");
out.println("          <div align=\"center\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i> ");
out.println("            </i><a href=\"http://freeboard.adbest.com/KBoard.cgi?db=pennie23\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Auction ");
out.println("            Board</font></font></a></font><br>");
out.println("   ");
out.println("            <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"../MailToUs.html\">Mail ");
out.println("              To Us</a></font></font></font><br>");
out.println("          <!-- <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><a href=\"Logout\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Log ");
out.println("              Out </font></font></a>--> <p></p>");
out.println("            </div>");
out.println("        <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font>");
out.println("        <div align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("          </i></font><br>");
out.println("        </div>");
out.println("        <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font>");
out.println("<div align=\"right\">");
out.println("          <pre>&nbsp;");
out.println("");
out.println("</pre>");
out.println("        </div>");
out.println("        <pre>&nbsp;");
out.println("");
out.println("");
out.println("");
out.println("</pre>");
out.println("      </td>");
out.println("      <td width=\"63%\" rowspan=\"3\" valign=\"top\">");
out.println("          <div align=\"right\"> ");
out.println("            <p align=\"right\"><b><font face=\"Arial, Helvetica, sans-serif\" size=\"+3\" color=\"#9999FF\"> ");
/*
out.println("              <script language=Javascript1.2>");
out.println("<!--");
out.println("");
out.println("//var tags_before_clock = \"<font face='geneva, arial, helvetica, sans-seif' size='4' color='#0000FF'>It is now \"");
out.println("//var tags_middle_clock = \"on\"");
out.println("//var tags_after_clock  = \"</font>\"");
out.println("");
out.println("");
out.println("if(navigator.appName == \"Netscape\") {");
out.println("document.write('<layer id=\"clock\"></layer><br>');");
out.println("}");
out.println("");
out.println("if (navigator.appVersion.indexOf(\"MSIE\") != -1){");
out.println("document.write('<span id=\"clock\"></span>');");
out.println("}");
out.println("");
out.println("DaysofWeek = new Array()");
out.println("  DaysofWeek[0]=\"SUN\"");
out.println("  DaysofWeek[1]=\"MON\"");
out.println("  DaysofWeek[2]=\"TUE\"");
out.println("  DaysofWeek[3]=\"WED\"");
out.println("  DaysofWeek[4]=\"THU\"");
out.println("  DaysofWeek[5]=\"FRI\"");
out.println("  DaysofWeek[6]=\"SAT\"");
out.println("");
out.println("Months = new Array()");
out.println("  Months[0]=\"JAN\"");
out.println("  Months[1]=\"FEB\"");
out.println("  Months[2]=\"MAR\"");
out.println("  Months[3]=\"APR\"");
out.println("  Months[4]=\"MAY\"");
out.println("  Months[5]=\"JUN\"");
out.println("  Months[6]=\"JUL\"");
out.println("  Months[7]=\"AUG\"");
out.println("  Months[8]=\"SEP\"");
out.println("  Months[9]=\"OCT\"");
out.println("  Months[10]=\"NOV\"");
out.println("  Months[11]=\"DEC\"");
out.println("");
out.println("function upclock(){");
out.println("var dte = new Date();");
out.println("var hrs = dte.getHours();");
out.println("var min = dte.getMinutes();");
out.println("var sec = dte.getSeconds();");
out.println("var day = DaysofWeek[dte.getDay()]");
out.println("var date = dte.getDate()");
out.println("var month = Months[dte.getMonth()]");
out.println("var year = dte.getFullYear()");
out.println("");
out.println("var col = \":\";");
out.println("var spc = \" \";");
out.println("var com = \",\";");
out.println("var apm;");
out.println("");
out.println("//if (date == 1 || date == 21 || date == 31)");
out.println("//  {ender = \"<sup>st</sup>\"}");
out.println("//else");
out.println("//if (date == 2 || date == 22)");
out.println("//  {ender = \"<sup>nd</sup>\"}");
out.println("//else");
out.println("//if (date == 3 || date == 23)");
out.println("//  {ender = \"<sup>rd</sup>\"}");
out.println("");
out.println("//else");
out.println("//  {ender = \"<sup>th</sup>\"}");
out.println("");
out.println("if (12 < hrs) {");
out.println("apm=\"<font size='-1'>PM</font>\";");
out.println("hrs-=12;");
out.println("}");
out.println("");
out.println("else {");
out.println("apm=\"<font size='-1'>AM</font>\";");
out.println("}");
out.println("");
out.println("if (hrs == 0) hrs=12;");
out.println("if (hrs<=9) hrs=\"0\"+hrs;");
out.println("if (min<=9) min=\"0\"+min;");
out.println("if (sec<=9) sec=\"0\"+sec;");
out.println("");
out.println("if(navigator.appName == \"Netscape\") {");
out.println("document.clock.document.write(\"<font face=\\"efArial, Helvetica, sans-serif\\" size=\\"2\\" color=\\"#000000\\">\"+hrs+col+min+col+sec+spc+apm+spc+com+spc+day+spc+date+spc+month+spc+year+\"</font>\");");
out.println("document.clock.document.close();");
out.println("}");
out.println("");
out.println("if (navigator.appVersion.indexOf(\"MSIE\") != -1){");
out.println("clock.innerHTML = \"<font face=\\"Arial, Helvetica, sans-serif\\" size=\\"2\\" color=\\"#000000\\">\"+hrs+col+min+col+sec+spc+apm+spc+com+spc+day+spc+date+spc+month+spc+year+\"</font>\";");
out.println("}");
out.println("}");
out.println("");
out.println("setInterval(\"upclock()\",1000);");
out.println("//-->");
out.println("</script>");
*/
out.println("<!--------------------------------------------------------------------------------------------------------- -->");
out.println("			");
out.println("              </font></b></p>");
out.println("<form method = \"Get\" action = \"ListDeviceFromDatabase\">");
out.println("            <br><div align=\"center\"><font face=\"Verdana, Arial, Helvetica, sans-serif\" color=\"#FF6633\"><b><font color=\"#000099\" size=\"3\">Search ");
out.println("              Computer Device</font></b> </font>");
out.println("			  <select name=\"device\" size=\"1\">");
out.println("                <option selected>CPU </option>");
out.println("                <option>RAM</option>");
out.println("                <option>MAINBOARD</option>");
out.println("				<option>HARDDISK</option>");
out.println("                <option>CD-ROM</option>");

out.println("                <option>DISPLAY CARD</option>");
out.println("                <option>SOUND CARD</option>");
out.println("                <option>MONITOR</option>");
out.println("                <option>MODEM</option>");
out.println("                <option>FLOPPY DISK</option>");
out.println("				<option>MOUSE</option>");
out.println("				<option>KEYBOARD</option>");
out.println("				<option>SPEAKER</option>");
out.println("				</select>");
out.println("				<br><font face=\"Verdana, Arial, Helvetica, sans-serif\" color=\"#FF6633\" size=\"3\">(From System Database)");
out.println("			  <br><br>");
out.println("			  <input type=\"Submit\" name=\"submit\" value=\"Choose device\">");
out.println("			</form>");
out.println("			<hr>");
out.println("");
GenerateSearchSpec Gen = new GenerateSearchSpec() ;
if (device != null)
{

    Connection con = null;
    Statement stmt = null;
    ResultSet rs= null;
    String Str_Query = "" ;
    int rowCount = 0;
    java.util.Properties props = new java.util.Properties();
    try
    {
     	  DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
	  }
	  catch (java.sql.SQLException ko){ out.println("Register error");}
    if (device.compareTo("CPU") == 0 )
 	      Str_Query = "select brand_cpu,type_cpu,speed_cpu,slot_type from "+ device + " order by 1,2,3,4" ;
    else if (device.compareTo("RAM") == 0 )
 	      Str_Query = "select brand_ram,Model_ram,size_ram  from "+ device + " order by 1,2,3 "  ;
    else if (device.compareTo("MAINBOARD") == 0 )
        Str_Query = "select brand_mb,model_mb,chip_set,type_cpu  from "+ device  + " order by 1,2,3,4" ;
    else if (device.compareTo("HARDDISK") == 0 )
 	      Str_Query = "select brand_harddisk,model_harddisk,capacity,speed from "+ device + " order by 1,2,3,4";
    else if (device.compareTo("CD-ROM") == 0 )
 	      Str_Query = "select brand_cdrom,x,interface  from CD_ROM order by 1,2,3" ;
    else if (device.compareTo("DISPLAY CARD") == 0 )
 	      Str_Query = "select brand_display,type_display,chip,memory  from display_card order by 1,2,3,4 " ;
    else if (device.compareTo("SOUND CARD") == 0 )
 	      Str_Query = "select brand_sound,model_sound,sound_system,interface  from soundcard order by 1,2,3,4 ";
    else if (device.compareTo("MONITOR") == 0 )
 	      Str_Query = "select brand_monitor,type_monitor,size_monitor,dot_pitch from monitor order by 1,2,3,4 ";
    else if (device.compareTo("MODEM") == 0 )
 	      Str_Query = "select brand_modem,type_modem,interface,speed_modem  from modem order by 1,2,3,4";
    else if (device.compareTo("SPEAKER") == 0 )
 	      Str_Query = "select brand_speaker,type_speaker,number_speaker,watt  from speaker order by 1,2,3,4 " ;
    else if (device.compareTo("MOUSE") == 0 )
 	      Str_Query = "select brand_mouse,interface  from mouse order by 1,2 " ;
    else if (device.compareTo("KEYBOARD") == 0 )
 	      Str_Query = "select brand_keyboard,interface from keyboard order by 1,2 "  ;
    else if (device.compareTo("FLOPPY DISK") == 0 )
 	      Str_Query = "select brand_floppy,capacity  from floppy_disk order by 1,2 ";


    try
    {
      DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
      con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
      stmt = con.createStatement();
      rs = stmt.executeQuery(Str_Query);
      rowCount = formatTable(rs, out);
    }
    catch (Exception ex)
    {
    	 out.println("Exception");
	     ex.printStackTrace(out);
	  }
    finally
    {
	     try
	     { if (rs != null)  {rs.close();}
         if (stmt != null){stmt.close();}
  		   if (con != null) {con.close();}
       }
	     catch (Exception ex){}
	   }
  //  out.println("</table>");
    out.flush();
}


out.println("      </td>");
out.println("");
out.println("<!------------------------------------------- column 3 [right] --------------------------------------------->");
out.println("");
out.println("      <td width=\"17%\" rowspan=\"3\" valign=\"top\" bgcolor=\"#ffb56a\"> ");
out.println("        <div align=\"center\"> ");
out.println("          <div align=\"left\"> ");
out.println("            <form method=\"post\" action=\"servlet/Logined\">");
out.println("              <div align=\"center\"> <br><br>");
out.println("			  <font face=\"Verdana, Arial, Helvetica, sans-serif\" color=\"#FF6600\"><b><font color=\"#330033\" size=\"2\">");
out.println("");
out.println("			  <SCRIPT LANGUAGE=\"JavaScript1.2\">");
out.println("");
out.println("<!-- This script and many more are available free online at -->");
out.println("<!-- The JavaScript Source!! http://javascript.internet.com -->");
out.println("");
out.println("<!-- Begin");
out.println("function initArray() {");
out.println("this.length = initArray.arguments.length;");
out.println("for (var i = 0; i < this.length; i++) {");
out.println("this[i] = initArray.arguments[i];");
out.println("   }");
out.println("}");
out.println("");
out.println("var ctext = \"Choose computer device which you need .. <br><br> We will search from System Database\" ;");
out.println("var speed = 1000;");
out.println("var x = 0;");
out.println("var color = new initArray(");
out.println("\"#003399\", ");
out.println("\"#003399\", ");
out.println("\"#003399\", ");
out.println("\"#FF9999\", ");
out.println("\"#FF6666\",");
out.println("\"#FF3333\"");
out.println("");
out.println(");");
out.println("if(navigator.appName == \"Netscape\") {");
out.println("document.write('<layer id=\"c\"><center>'+ctext+'</center></layer><br>');");
out.println("}");
out.println("if (navigator.appVersion.indexOf(\"MSIE\") != -1){");
out.println("document.write('<div id=\"c\"><center>'+ctext+'</center></div>');");
out.println("}");
out.println("function chcolor(){ ");
out.println("if(navigator.appName == \"Netscape\") {");
out.println("document.c.document.write('<center><font color=\"'+color[x]);");
out.println("document.c.document.write('\">'+ctext+'</font></center>');");
out.println("document.c.document.close();");
out.println("}");
out.println("else if (navigator.appVersion.indexOf(\"MSIE\") != -1){");
out.println("document.all.c.style.color = color[x];");
out.println("}");
out.println("(x < color.length-1) ? x++ : x = 0;");
out.println("}");
out.println("setInterval(\"chcolor()\",1000);");
out.println("// End -->");
out.println("</script>");
out.println("			");
out.println("");
out.println("               <!-- <div align=\"right\">");
out.println("                  <div align=\"center\">");
out.println("                    <div align=\"left\">");
out.println("                      <pre><img src=\"../login.jpg\" width=\"170\" height=\"35\">");
out.println("</pre>");
out.println("                    </div>");
out.println("                  </div>");
out.println("                </div>");
out.println("                <table width=\"29%\" border=\"0\" align=\"center\" vspace=\"2\" hspace=\"2\" cellpadding=\"3\" cellspacing=\"2\" bgcolor=\"#ffb56a\">");
out.println("                  <tr bgcolor=\"#ffb56a\"> ");
out.println("                    <td width=\"49%\" height=\"31\" align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#000099\" size=\"2\">Username</font></b></font></td>");
out.println("                    <td width=\"51%\" height=\"31\" align=\"center\" valign=\"middle\"> ");
out.println("                      <font color=\"#FFFFFF\"> ");
out.println("                      <input type=\"text\" name=\"username\" size=\"10\" maxlength=\"15\">");
out.println("                      </font></td>");
out.println("                  </tr>");
out.println("                  <tr bgcolor=\"#ffb56a\"> ");
out.println("                    <td width=\"49%\" height=\"40\" align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#006666\"><b><font size=\"2\" color=\"#000099\">Password</font></b></font></td>");
out.println("                    <td width=\"51%\" height=\"40\" align=\"center\" valign=\"middle\"> ");
out.println("                      <font color=\"#FFFFFF\"> ");
out.println("                      <input type=\"password\" name=\"password\" size=\"10\" maxlength=\"15\">");
out.println("                      </font></td>");
out.println("                  </tr>");
out.println("                </table>");
out.println("                  <pre><i><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#FF9999\"><font color=\"#990033\" size=\"2\"><input type=\"submit\" name=\"Submit2\" value=\"Login\">");
out.println("");
out.println("Forget Password ??? ... ");
out.println("    Enter your e-mail here !!  </font><font color=\"#FF6666\" size=\"2\">");
out.println(" ");
out.println("</font><b><font color=\"#FF6666\"><input type=\"text\" name=\"email\">");
out.println("");
out.println("<input type=\"submit\" name=\"Submit\" value=\"Submit\">  </font></b></font></i></pre>");
out.println("                  <pre>&nbsp;</pre>");
out.println("                <pre>&nbsp;</pre>");
out.println("                <pre>&nbsp;");
out.println("                </pre>");
out.println("              </div>");
out.println("            </form>");
out.println("            <pre>&nbsp;</pre>");
out.println("            <form method=\"post\" action=\"servlet/testsession\" name=\"test\">");
out.println("                <input type=\"submit\" name=\"test\" value=\"Delete_session\">");
out.println("            </form>");
out.println("          </div>");
out.println("        </div>");
out.println("      </td>");
out.println("    </tr> -->");
out.println("");
out.println("  </table>");
out.println("</div>");
out.println("</div></body>");
out.println("</html>");
out.flush();
    }
    int formatTable(java.sql.ResultSet rs,java.io.PrintWriter out)
	  throws Exception
	  {
	    int rowCount = 0;
	  	out.println("<left><table  border=\"0\"  cellpadding=\"5\" cellspacing=\"2\">");
	    ResultSetMetaData rsmd = rs.getMetaData();
      int columnCount = rsmd.getColumnCount();
      out.println("<tr>");
    	for (int i = 0; i < columnCount; i++)
	    {
          out.println("<td height=\"35\" width=\"2%\" bgcolor=\"#89d8d8\">");
          out.println("<div align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#003333\"><b><font size=\"2\">");
          out.println(rsmd.getColumnLabel(i + 1));
          out.println("</font></b></font></div>");
          out.println("          </td>");
    	}
		  out.println("</tr>");
		  while (rs.next())
		  {
		    rowCount++;
        if ((rowCount%2) ==0)
        	  out.println("<tr bgcolor = \"#c6e3e3\">");
        else
        	  out.println("<tr bgcolor = \"#e0f1f1\">");

        for (int i = 0; i < columnCount; i++)
         {
			     out.println("<td><b><font size=\"-1\">" + rs.getString(i + 1) + "</font></b></td>");
         }
			  out.println("</tr>");
			}
			out.println("</table>");
			return rowCount;
  	}

}
