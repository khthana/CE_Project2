import  java.sql.*;
import  oracle.jdbc.driver.*;
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.util.*;
public class AddTechReq extends HttpServlet
{
    public void   doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
	      java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
        String Str_Query ;
        HttpSession session = req.getSession(true);
        int rowCount = 0;
        resp.setContentType("text/html");
        String  haveproject  = (String)session.getValue("haveproject");
        String username      = (String)session.getValue("username");
        String companyname   = (String)session.getValue("companyname");
        if (username == null)
          resp.sendRedirect("../Pleaselogin.html");



        if (haveproject == null)
        {
          out.println("<html>");
          out.println("<head>");
          out.println("<title>Internet Auction [Add Technical Requirement] : CE.KMITL</title>");
          out.println("<style><!-- A:link, A:visited { text-decoration: none; color: #ffffff}  A:hover { text-decoration: none; font-weight: underline; color :  #33ccff} // --> </style>");
          out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
          out.println("</head>");
          out.println("<body bgcolor=\"#FFFFFF\">");
          out.println("<div align=\"right\">");
          out.println("<table width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"4\" cellspacing=\"2\" height=\"300\">");
          out.println("    <tr>");
          out.println("<div align=\"center\"><img src=\"/picture/AddTechReq.jpg\" width=\"970\" height=\"98\"></div>");
          out.println("    </tr>");
          out.println("<tr>");

          out.println("  <td bgcolor=#4f4fd2 height=310 rowspan=3 valign=top width=\"19%\">");
          out.println("        <div align=center>");
          out.println("          <div align=center>");
          out.println("            <div align=center>");
          out.println("              <p>&nbsp;</p>");
          out.println("              <div align=\"center\">");
          out.println("                <p><b><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#ffcc00\"><i>Auction");
          out.println("                  Member</i></font></b><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
          out.println("                  </i></font></p>");
          out.println("                <p><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" ><a href=\"LoginSuccess\"><font size=\"3\" >Home<font face=\"Arial, Helvetica,  sans-serif\">");
          out.println("                  </font></font></a></font><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font><font face=\"Arial,  Helvetica, sans-serif\" size=\"2\" ><i><br>");
          out.println("                  </i><a href=\"Changeinfo\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">C</font><font face=\"Arial, Helvetica,  sans-serif\">hange");
          out.println("                  Personal Information<br>");
          out.println("                  </font></font></a></font> <a href=\"Listmember\"><font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\">Member");
          out.println("                  Profiles<br>");
          out.println("                  </font></font></a><a href=\"Listproject\"><font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\">Project");
          out.println("                  List </font></font></a><a href=\"offerspec\"><font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\"><br>");
          out.println("                  </font></font></a><a href=\"Ranking\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Member");
          out.println("                  Rating </font></font></a><a href=\"OfferSpec.html\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">");
          out.println("                  </font></font></a><br>");
          out.println("                </p>");
          out.println("                <p><font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\" size=\"2\"><b><font color=\"#FF9900\">For");
          out.println("                  Buyer</font></b></font></font><br>");
          out.println("                  <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"GeneralReq\">General");
          out.println("                  Requirement</a></font></font><br>");
          out.println("                  <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"AddTechReq\">Add");
          out.println("                  Technical Requirement <font size=\"2\"><i>(bidding)</i></font></a></font></font><br>");
          out.println("                  <br>");
          out.println("                  <font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#CCCCCC\" size=\"2\"><b><font color=\"#FF9900\">For");
          out.println("                  Seller</font></b></font></font><br>");
          out.println("                  <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"AddSpecification\">Add");
          out.println("                  Specification</a></font></font><br>");
          out.println("                  <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"ListBiddingProject\">Bidding</a></font></font><br>");
          out.println("                </p>");
          out.println("              </div>");
          out.println("              <div align=\"center\"></div>");
          out.println("              <div align=\"center\"><a href=\"ProjectList.html\"><font size=\"3\"></font></a>");
          out.println("                <b><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#ffcc00\"><i><br>");
          out.println("                Auction Services </i></font></b> <br>");
          out.println("                <br>");
          out.println("              </div>");
          out.println("              <div align=\"center\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i>");
          out.println("                </i><a href=\"http://freeboard.adbest.com/KBoard.cgi?db=pennie23\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Auction");
          out.println("                Board</font></font></a></font></div>");
          out.println("              <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font>");
          out.println("              <div align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><a href=\"../MailToUs.html\"><font  size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Mail");
          out.println("                To Us</font></font></a><i></i></font></div>");
out.println("<div align=\"center\">");
out.println("<FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\" color=#ff3366 size=2><A ");
out.println("      href=\"Logout\"><FONT size=3><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\">Log Out ");
out.println("</FONT></FONT></A></FONT>");
out.println("</div>");
          out.println("              <p>&nbsp;</p>");
          out.println("            </div>");
          out.println("            <p>&nbsp;</p>");
          out.println("          </div>");
          out.println("          <p>&nbsp;</p>");
          out.println("        </div>");
          out.println("      </td>");


          out.println("      <form method=\"Get\" action=\"Addpart\" name = \"form\" >");
          out.println("      <td bgcolor=\"#ffb56a\" width=\"79%\" valign=\"top\" height=\"279\">");
          out.println("        <pre><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#660000\">  </font></b></font></pre>");
          out.println("        <table width=\"80%\" border=\"0\">");
          out.println("          <tr>");
          out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#660000\">Name</font></b></font></td>");
          out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#0000ff\">"+ username);
          out.println("      <input type=hidden Name = \"Username\" value = \"" + username + "\">" );
          out.println("              </font></b></font></td>");
          out.println("          </tr>");
          out.println("          <tr>");
          out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#660000\">");
          out.println("              Company Name</font></b></font></td>");
          out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#0000ff\">"+ companyname);
          out.println("      <input type=hidden Name = \"Companyname\" value = \"" + companyname + "\">" );
          out.println("              </font></b></font></td>");
          out.println("          </tr>");
          out.println("          <tr>");
          out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#660000\">");
          out.println("              Project Name </font></b></font></td>");
          out.println("            <td>     <font face=\"MS Sans Serif\" size=\"1\">");
          out.println("              </font> <b><font color=\"#660000\">");
          out.println("              <input type=\"text\" name=\"Projectname\" maxlength=\"40\" size=\"30\">");
          out.println("              </font></b></font></td>");
          out.println("          </tr>");
          out.println("          <tr>");
          out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#660000\">");
          out.println("              Description</font></b></font></td>");
          out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#660000\">");
          out.println("              <textarea name=\"Projectdescription\" cols=\"50\" rows=\"3\"></textarea>");
          out.println("              </font></b></font></td>");
          out.println("          </tr>");
          out.println("          <tr>");
          out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#990000\">End");
          out.println("              Date</font></b></font></td>");
          out.println("            <td> <font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#660000\">");
          int CurDay       =  Calendar.getInstance().get(Calendar.DATE);
          int CurMonth     =  Calendar.getInstance().get(Calendar.MONTH);
          int CurYear      =  Calendar.getInstance().get(Calendar.YEAR);
          Calendar Current_Calendar = new GregorianCalendar(CurYear,CurMonth,CurDay);
          Calendar Current_Calendar2 = new GregorianCalendar();

          long time1 = Current_Calendar.getTime().getTime();
//          out.println(time1);

       //   long time2 = Current_Calendar2.getTime().getTime();
     //     out.println(time2);
     //     String Day       =  new Integer(Current_Calendar.get(Current_Calendar.DATE)).toString() ;
     //     String Month     =  new Integer(Current_Calendar.get(Current_Calendar.MONTH)).toString() ;
     //     String Year      =  new Integer(Current_Calendar.get(Current_Calendar.YEAR)).toString() ;
     //     Month =  new Integer(Integer.parseInt(Month)+1).toString()  ;
    //      String time = Day + "/" + Month + "/" + Year ;
    //      out.println(time);


    //      long GiveTime= Long.parseLong(session.getValue("Reminder.t").toString());
   //       Calendar MCalendar = new GregorianCalendar();
   //               Date MakeDate = new Date(GiveTime);
   //        MCalendar.setTime(MakeDate);
          out.println("              <select name=\"Enddate\" size=\"1\">");

          for (int i = 0 ; i < 30 ; i++)
          {
          long test = time1  ;
          test = test + (Long.parseLong("86400000")*i) ;
          java.util.Date MakeDate = new java.util.Date(test) ;
          Current_Calendar2.setTime(MakeDate);
          String Day2       =  new Integer(Current_Calendar2.get(Current_Calendar2.DATE)).toString() ;
          String Month2     =  new Integer(Current_Calendar2.get(Current_Calendar2.MONTH)).toString() ;
          String Year2      =  new Integer(Current_Calendar2.get(Current_Calendar2.YEAR)).toString() ;
          Month2 =  new Integer(Integer.parseInt(Month2)+1).toString()  ;
          String time2 = Day2 + "/" + Month2 + "/" + Year2 ;
          out.println("<option>"+ time2 + "</option>") ;
          out.println(time2);
  //        Current_Calendar.setTime(long_time);
          }




          out.println("              </select> &nbsp;&nbsp;&nbsp;");
          out.println("  <select name=\"hour\">");
out.println("    <option>00</option>");
out.println("    <option>01</option>");
out.println("    <option>02</option>");
out.println("    <option>03</option>");
out.println("    <option>04</option>");
out.println("    <option>05</option>");
out.println("    <option>06</option>");
out.println("    <option>07</option>");
out.println("    <option>08</option>");
out.println("    <option>09</option>");
out.println("    <option>10</option>");
out.println("    <option>11</option>");
out.println("    <option>12</option>");
out.println("    <option>13</option>");
out.println("    <option>14</option>");
out.println("    <option>15</option>");
out.println("    <option>16</option>");
out.println("    <option>17</option>");
out.println("    <option>18</option>");
out.println("    <option>19</option>");
out.println("    <option>20</option>");
out.println("    <option>21</option>");
out.println("    <option>22</option>");
out.println("    <option>23</option>");
out.println("  </select>");
out.println(":");
out.println("  <select name=\"min\">");
out.println("    <option>00</option>");
out.println("    <option>10</option>");
out.println("    <option>20</option>");
out.println("    <option>30</option>");
out.println("    <option>40</option>");
out.println("    <option>50</option>");
out.println("  </select>");



          out.println("              </font></b></font></td>");
          out.println("          </tr>");
          out.println("          <tr>");
          out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#990000\">Max");
          out.println("              Price <i><font size=\"2\">(baht)</font></i></font></b></font></td>");
          out.println("            <td><font color=\"#990000\"><i>");

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



          out.println("              <input type=\"text\" name=\"Maxprice\" maxlength=\"40\" size=\"30\" >");
          out.println("              </i></font></td>");
          out.println("          </tr>");
          out.println("        </table>");
          out.println("        <pre><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#660000\">");
          out.println("  </font></b></font></pre>");
          out.println("      </td>");
          out.println("    </tr>");
          out.println("    <tr>");
          out.println("      <td bgcolor=\"#FFFFFF\" width=\"79%\" valign=\"top\" height=\"2\">");
          out.println("        <div align=\"center\"><img src=\"/picture/ProjectRequirement.jpg\" width=\"764\" height=\"45\"></div>");
          out.println("      </td>");
          out.println("    </tr>");
          out.println("    <tr>");
          out.println("      <td bgcolor=\"#F1E28D\" width=\"79%\" valign=\"top\" height=\"210\">");
          out.println("        <p><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#660000\">Part");
          out.println("          Name</font> <font color=\"#660000\">");
          out.println("          <input type=\"text\" name=\"Partname\" maxlength=\"30\" size=\"30\">");
          out.println("          </font>");
          out.println("        </b></font></p>");
          out.println("        <p><b><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#660000\">");
          out.println("          Part Description</font><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#660000\">");
          out.println("          <textarea name=\"Description\" rows=\"2\" cols=\"43\"></textarea>");
          out.println("          <input type=\"button\" name=\"Submit\" value=\"ADD PART\" onClick =\"validate(Maxprice)\">");
          out.println("</form>");
          out.println("          </font></b></p>");
          out.println("        <p>&nbsp;</p>");
          out.println("      </td>");
          out.println("    </tr>");
          out.println("  </table>");
          out.println("     </font></b></i></font> </p>");
          out.println(" </div>");
          out.println(" </body>");
          out.println(" </html>");
          out.flush();
    }
    ////////////////-- IF HAVE PROJECT---/////////////////////
    else if  (haveproject.compareTo("haveproject") == 0)
    {
          Specification spectest = new Specification();
          spectest = (Specification)session.getValue(session.getId());
          out.println("<html>");
          out.println("<head>");
          out.println("<title> Internet Auction [Add Technical Requirement] </title>");
          out.println("<style><!-- A:link, A:visited { text-decoration: none; color: #ffffff}  A:hover { text-decoration: none; font-weight: underline; color :  #33ccff} // --> </style>");
          out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
            out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
         /////------------------Script Create form--------------------////
          out.println("function AddForm(number) {");
          out.println("data = \"\";");
          out.println("data2 = \"\";");
          out.println("inter = \"'\";");
          out.println("    data =  data + \"<p><font face=\\\"Arial, Helvetica, sans-serif\\\" size=\\\"3\\\"><b><font color=\\\"#660000\\\">Part\"; ");
          out.println("    data =  data + \"Name</font> <font color=\\\"#660000\\\">\"; ");
          out.println("    data =  data + \" <input type=\\\"text\\\" name=\\\"Partname\\\" maxlength=\\\"30\\\" size=\\\"30\\\"></font></b></font></p>\"; ");
          out.println("    data =  data + \"<p><b><font face=\\\"Arial, Helvetica, sans-serif\\\" size=\\\"3\\\" color=\\\"#660000\\\">\"; ");
          out.println("    data =  data + \"Part Description</font><font face=\\\"Arial, Helvetica, sans-serif\\\" size=\\\"3\\\" color=\\\"#660000\\\">\"; ");
          out.println("    data =  data + \"<textarea name=\\\"Description\\\" rows=\\\"2\\\" cols=\\\"43\\\"></textarea>\"; ");
          out.println("    data =  data + \"<input type=\\\"submit\\\" name=\\\"Submit\\\" value=\\\"ADD PART\\\">\"; ");
          out.println("    data =  data + \"</font></b></p>\"; ");
          out.println("     if (document.layers)");
          out.println("     { ");
          out.println("       document.layers.cust.document.write(data); ");
          out.println("       document.layers.cust.document.close();");
          out.println("       document.layers.sendproject.document.write(data2); ");
          out.println("       document.layers.sendproject.document.close();");

          out.println("     } ");
          out.println("     else ");
          out.println("     {  ");
          out.println("       if (document.all)");
          out.println("	   { ");
          out.println("         cust.innerHTML = data; ");
          out.println("         sendproject.innerHTML = data2; ");
          out.println("       }   ");
          out.println("     }   ");
          out.println("} ");
          /////------------------Script Delete form--------------------////
          out.println("function DelForm(number) {");
          out.println("data = \"\";");
          out.println("data2= \"\";");
          out.println("data2 = data2 + \"<FORM action=SendprojectToDatabase method=get name=Test><INPUT name=Send\";");
          out.println("data2 = data2 + \" type=submit value=\\\"SendProject\\\"> </FORM>\";");
          out.println("data2 = data2 + \"<FORM action=SendprojectToDatabsse method=get name=Test><INPUT name=Cancel\";");
          out.println("data2 = data2 + \" type=submit value=\\\"Cancel Project\\\"> </FORM>\";");

          out.println("     if (document.layers)");
          out.println("     { ");
          out.println("       document.layers.cust.document.write(data); ");
          out.println("       document.layers.cust.document.close();");
          out.println("       document.layers.sendproject.document.write(data2); ");
          out.println("       document.layers.sendproject.document.close();");

          out.println("     } ");
          out.println("     else ");
          out.println("     {  ");
          out.println("       if (document.all)");
          out.println("	   { ");
          out.println("         cust.innerHTML = data; ");
          out.println("         sendproject.innerHTML = data2; ");

          out.println("       }   ");
          out.println("     }   ");
          out.println("} ");
          out.println("</script>  ");
          ///----------------End Script-------------///
          out.println("</head>");
          out.println("<body bgcolor=\"#FFFFFF\">");
          out.println("<div align=\"right\">");
          out.println("<table width=\"99%\" border=\"0\" align=\"center\" cellpadding=\"4\" cellspacing=\"2\" height=\"300\">");
          out.println("    <tr>");
          out.println("<div align=\"center\"><img src=\"/picture/AddTechReq.jpg\" width=\"970\" height=\"98\"></div>");
          out.println("    </tr>");
          out.println("<tr>");
          out.println("  <td bgcolor=#4f4fd2 height=310 rowspan=3 valign=top width=\"19%\">");
          out.println("        <div align=center>");
          out.println("          <div align=center>");
          out.println("            <div align=center>");
          out.println("              <p>&nbsp;</p>");
          out.println("              <div align=\"center\">");
          out.println("                <p><b><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#ffcc00\"><i>Auction");
          out.println("                  Member</i></font></b><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
          out.println("                  </i></font></p>");
          out.println("                <p><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" ><a href=\"LoginSuccess\"><font size=\"3\" >Home<font face=\"Arial, Helvetica,  sans-serif\">");
          out.println("                  </font></font></a></font><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font><font face=\"Arial,  Helvetica, sans-serif\" size=\"2\" ><i><br>");
          out.println("                  </i><a href=\"Changeinfo\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">C</font><font face=\"Arial, Helvetica,  sans-serif\">hange");
          out.println("                  Personal Information<br>");
          out.println("                  </font></font></a></font> <a href=\"Listmember\"><font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\">Member");
          out.println("                  Profiles<br>");
          out.println("                  </font></font></a><a href=\"Listproject\"><font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\">Project");
          out.println("                  List </font></font></a><a href=\"OfferSpec.html\"><font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\"><br>");
          out.println("                  </font></font></a><a href=\"Ranking\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Member");
          out.println("                  Rating </font></font></a><a href=\"OfferSpec.html\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">");
          out.println("                  </font></font></a><br>");
          out.println("                </p>");
          out.println("                <p><font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\" size=\"2\"><b><font color=\"#FF9900\">For");
          out.println("                  Buyer</font></b></font></font><br>");
          out.println("                  <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"GeneralReq\">General");
          out.println("                  Requirement</a></font></font><br>");
          out.println("                  <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"AddTechReq\">Add");
          out.println("                  Technical Requirement <font size=\"2\"><i>(bidding)</i></font></a></font></font><br>");
          out.println("                  <br>");
          out.println("                  <font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#CCCCCC\" size=\"2\"><b><font color=\"#FF9900\">For");
          out.println("                  Seller</font></b></font></font><br>");
          out.println("                  <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"AddSpecification\">Add");
          out.println("                  Specification</a></font></font><br>");
          out.println("                  <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"ListBiddingProjec\">Bidding</a></font></font><br>");
          out.println("                </p>");
          out.println("              </div>");
          out.println("              <div align=\"center\"></div>");
          out.println("              <div align=\"center\"><a href=\"\"><font size=\"3\"></font></a>");
          out.println("                <b><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#ffcc00\"><i><br>");
          out.println("                Auction Services </i></font></b> <br>");
          out.println("                <br>");
          out.println("              </div>");
          out.println("              <div align=\"center\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i>");
          out.println("                </i><a href=\"../AuctionBoard.html\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Auction");
          out.println("                Board</font></font></a></font></div>");
          out.println("              <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font>");
          out.println("              <div align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><a href=\"../MailToUs.html\"><font  size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Mail");
          out.println("                To Us</font></font></a><i></i></font></div>");
out.println("<div align=\"center\">");
out.println("<BR><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\" color=#ff3366 size=2><A ");
out.println("      href=\"Logout\"><FONT size=3><FONT ");
out.println("      face=\"Arial, Helvetica, sans-serif\">Log Out ");
out.println("</FONT></FONT></A></FONT>");
out.println("</div>");
      
          out.println("              <p>&nbsp;</p>");
          out.println("            </div>");
          out.println("            <p>&nbsp;</p>");
          out.println("          </div>");
          out.println("          <p>&nbsp;</p>");
          out.println("        </div>");
          out.println("      </td>");


          out.println("  <td bgcolor=#ffb56a height=100 valign=top width=\"79%\"> ");
out.println("	    <br>");
out.println("        <table border=0 width=\"80%\">");
out.println("          <tbody>");
out.println("<tr>");
out.println("            <td width=\"30%\"><i><font face=\"Arial, Helvetica, sans-serif\" size=3><b><font");
out.println("            color=#660000>Name</font></b></font></i></td>");
out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#0000ff\">");
out.println(spectest.name + " </font></b></font></td>");
out.println("          </tr>");
out.println("          <tr>");
out.println("            <td><i><font face=\"Arial, Helvetica, sans-serif\" size=3><b><font");
out.println("            color=#660000>Company Name</font></b></font></i></td>");
out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=3><b><font");
out.println("            color=#0000ff>" + spectest.company_name + " </font></b></font></td>");
out.println("          </tr>");
out.println("          <tr>");
out.println("            <td><i><font face=\"Arial, Helvetica, sans-serif\" size=3><b><font");
out.println("            color=#660000>Project Name </font></b></font></i></td>");
out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#0000ff\"><b>");
out.println(spectest.projectname + "  </b></font></td>");
out.println("          </tr>");
out.println("          <tr>");
out.println("            <td><i><font face=\"Arial, Helvetica, sans-serif\" size=3><b><font");
out.println("            color=#660000>Description</font></b></font></i></td>");
out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#0000ff\"><b>");
out.println(spectest.projectdescription  + "  </b></font></td>");
out.println("          </tr>");
out.println("          <tr>");
out.println("            <td><i><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font");
out.println("            color=#990000>End Date</font></b></font></i></td>");
out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#0000ff\"><b>");
out.println(spectest.Enddate + " </b></font></td>");
out.println("          </tr>");
out.println("          <tr>");
out.println("            <td height=\"22\"><i><font face=\"Arial, Helvetica, sans-serif\" size=3><b><font");
out.println("            color=#990000>Max Price <font");
out.println("            size=2>(baht)</font></font></b></font></i></td>");
out.println("            <td height=\"22\"><font color=\"#0000ff\" size=\"3\"><i><font face=\"Arial, Helvetica, sans-serif\">");
out.println("  <b>" + spectest.Maxprice + " </b></font>");
out.println("              </i></font></td>");
out.println("          </tr>");
out.println("          </tbody>");
out.println("        </table>");
out.println("        <br>");
out.println("      </td>");
out.println("    </tr>");





          out.println("    <tr>");
          out.println("      <td bgcolor=\"#FFFFFF\" width=\"79%\" valign=\"top\" height=\"2\">");
          out.println("        <div align=\"center\"><img src=\"/picture/ProjectRequirement.jpg\" width=\"764\" height=\"45\"></div>");
          out.println("      </td>");
          out.println("    </tr>");

          out.println("  <tr>");
          out.println("      <td bgcolor=\"#F1E28D\" width=\"79%\" valign=\"top\" height=\"210\">");
          int i_count_part ;
          String Str_remove = req.getParameter("Part_Remove");
          if (Str_remove != null)
          {
           int  part_remove ;
           part_remove = Integer.parseInt(Str_remove) ;
           spectest.Listpart.removeElementAt(part_remove);
          }
          if (spectest.Listpart.size() > 0)
          {
            out.println("      <table border=0 cellpadding=1 cellspacing=2 height=180 width=\"99%\">");
            out.println("      <tbody>");
          }
          for (i_count_part = 0 ; i_count_part < spectest.Listpart.size() ; i_count_part++)
          {
               //-------------Display part description------------//
            out.println("               <tr bgcolor=#ffb56a>");
            out.println("            <td height=32><b><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
            out.println("size=2><font color=\"#000000\" size=\"3\">Part name</font></font></b></td>");
            out.println("            <td colspan=3 height=32> <font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">" + spectest.GetPart(i_count_part).Partname );
            out.println("              </font></td>");
            out.println("          </tr>");
            out.println("          <tr bgcolor=#ffb56a>");
            out.println("            <td height=32><b><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
            out.println("size=2><font color=\"#000000\" size=\"3\">Part description</font></font></b></td>");
            out.println("            <td colspan=3 height=32> <font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">" + spectest.GetPart(i_count_part).Partdescription);
            out.println("             </font></td>");
            out.println("          </tr>");
            out.println("          <tr bgcolor=#FFCC99>");
            out.println("            <td height=33 width=\"16%\" bgcolor=\"#FFCC99\">");
            out.println("              <div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
            out.println("size=2><font color=\"#000000\" size=\"3\"><b>Type Device</b></font></font></div>");
            out.println("            </td>");
            out.println("            <td height=33 width=\"70%\" bgcolor=\"#FFCC99\">");
            out.println("              <div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
            out.println("size=2><font color=\"#000000\" size=\"3\"><b> Detail </b></font></font></div>");
            out.println("            </td>");
            out.println("            <td colspan=2 height=33 bgcolor=\"#FFCC99\">");
            out.println("              <div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
            out.println("size=2><b><font color=\"#000000\" size=\"3\">Quantity </font></b></font></div>");
            out.println("            </td>");
            out.println("          </tr>");
            for (int row = 0 ; row < spectest.GetPart(i_count_part).Listdevice.size()  ; row++)
            {
                out.println("<tr bgcolor=#CCCCFF>");
                out.println("            <td height=32 width=\"16%\" bgcolor=\"#ffe4ca\">");
                out.println("              <div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
                out.println("    size=2><font color=\"#FF0033\" size=\"2\"><b><font color=\"#000000\">"+  spectest.GetPart(i_count_part).GetDevice(row).GetType() +"</font></b></font></font></div>");
                out.println("            </td>");
                out.println("            <td height=32 width=\"70%\" bgcolor=\"#ffe4ca\">");
                out.println("              <div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
                out.println("    size=2><b><font color=\"#000000\" size=\"2\">");
                for (int col = 0 ; col < spectest.GetPart(i_count_part).GetDevice(row).Data.length ; col++)
                {
                   if (spectest.GetPart(i_count_part).GetDevice(row).Data[col].compareTo("Not specific") != 0)
                  out.println(spectest.GetPart(i_count_part).GetDevice(row).Data[col]);;
                }
                out.println("  </font></b></font></div>");
                out.println("            </td>");
                out.println("            <td colspan=2 height=32 bgcolor=\"#ffe4ca\">");
                out.println("              <div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
                out.println("    size=2><b><font color=\"#000000\" size=\"2\">" + spectest.GetPart(i_count_part).GetDevice(row).getQuantity() + "</font></b></font></div>");
                out.println("            </td>");
                out.println("          </tr>");
             }
             /////---------------Make remove button-----------------///
             out.println(" <tr>");
             out.println("   <td colspan = \"4\"> ");
             out.println("<form method=\"Get\" action=\"AddTechReq\">");
             out.println("<center><input type=\"submit\" name=\"Submit\" value=\"Remove This Part\"></center>");
             out.println("<input type=hidden Name = \"Part_Remove\" value = \"" +  i_count_part  + "\">" );
             out.println("</form>");
             out.println("           </td>");
             out.println(" </tr>");
             /////-----------------MAKE LINE--------------------////
             out.println(" <tr bgcolor=\"#000000\">");
             out.println("<td colspan=\"4\" height=\"4\" width=\"35%\">");
             out.println("</td>");
             out.println("</tr>");
          }
          ///////----------------End List Part -----------------------/////

         if (spectest.Listpart.size() > 0)
          {
           out.println("</tbody>");
           out.println("        </table>");
          }
          out.println("<center>");
          out.println("        <p><font color=\"#3333FF\"><b><font size=\"2\" face=\"Arial, Helvetica, sans-serif\"><i><font color=\"#330066\">Do");
          out.println("          you want to add more part??</font></i></font> </b></font> <font color=\"#3333FF\"><b>");
          out.println("     <form name=counter>");
          out.println("          <input type=button value=\"Yes\" onClick=\"AddForm(counter);\" name=\"button\">");
          out.println("          </b></font><font color=\"#3333FF\"><b>");
          out.println("          <input type=button value=\" No \" onClick=\"DelForm(counter);\" name=\"button2\">");
          out.println("          </b></font></p>");
          out.println("      </form>");
          out.println("</center>");

          out.println("<form method=\"Get\" action=\"Addpart\" name=\"Addproject\">");
          out.println("        <input type=hidden Name = \"newpart\" value = \"" + "newpart" + "\">" );
          out.println("        <!-- Placeholder for dynamic form contents --> <span id=cust style=\"position:relative;\"></span>");
          out.println("</form>");
          out.println("      </td>");
          out.println("    </tr>");
          out.println("  </table>");
          out.println("</div>");
          out.println("  <center>");
          out.println("<span id=sendproject style=\"POSITION: relative\"></span> </CENTER>");
          out.println("</body>");
          out.println("</html>");
          out.flush();
          }
    }
}



