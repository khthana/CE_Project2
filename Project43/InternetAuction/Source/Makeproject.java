import  java.sql.*;
import  oracle.jdbc.driver.*;
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.util.*;
public class Makeproject extends HttpServlet
{
    public void   doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
	      java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
        Connection con = null;
        Statement stmt = null;
        ResultSet rs= null;
        String Str_Query ;
        HttpSession session = req.getSession(true);
        int rowCount = 0;
        resp.setContentType("text/html");
        String  haveproject  = (String)session.getValue("haveproject");
        if (haveproject == null)
        {
          out.println("<html>");
out.println("<head>");
out.println("<title>Internet Auction [Add New Project] : CE.KMITL</title>");
out.println("<style><!-- A:link, A:visited { text-decoration: none; color: #ffffff}  A:hover { text-decoration: none; font-weight: underline; color :  #33ccff} // --> </style>");
out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
out.println("</head>");

out.println("<body bgcolor=\"#FFFFFF\">");
out.println("<div align=\"right\">");
out.println("<table width=\"99%\" border=\"0\" align=\"center\" cellpadding=\"4\" cellspacing=\"2\" height=\"300\">");
out.println("    <tr>");
out.println("<div align=\"center\"><img src=\"/picture/AuctionBanner.jpg\" width=\"970\" height=\"98\"></div>");
out.println("    </tr>");
out.println("<tr>");
out.println("      <td rowspan=\"5\" width=\"21%\" bgcolor=\"#4f4fd2\" valign=\"top\" height=\"50\">");
out.println("        <div align=\"center\">");
out.println("          <div align=\"center\">");
out.println("            <div align=\"center\">");
out.println("              <p>&nbsp;</p>");
out.println("              <p><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><font size=\"3\"><b><font color=\"#ffcc00\">Auction");
out.println("                Member</font></b></font><br>");
out.println("                </i></font></p>");
out.println("              <p><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><a href=\"../index.html\"><font size=\"3\" >Home<font face=\"Arial, Helvetica, sans-serif\">");
out.println("                </font></font></a></font><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("                </i><a href=\"Changeinfo\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">C</font><font face=\"Arial, Helvetica, sans-serif\">hange");
out.println("                Information<br>");
out.println("                </font></font></a></font> <a href=\"showmember\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Member");
out.println("                Profiles<br>");
out.println("                </font></font></a><a href=\"Listproject\"><font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\">Project");
out.println("                List <br>");
out.println("                </font></font></a><a href=\"Makeproject\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">New");
out.println("                Project </font></font></a><a href=\"OfferSpec\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><br>");
out.println("                Offer Specification <br>");
out.println("                </font></font></a><a href=\"ranking\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Ranking");
out.println("                </font></font></a><a href=\"OfferSpec\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">");
out.println("                </font></font></a><br>");
out.println("                <br>");
out.println("              </p>");
out.println("            </div>");
out.println("              <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("              <b><font color=\"#ffcc00\" size=\"3\">Auction Services</font></b></i></font><br>");
out.println("              <br>");
out.println("            </div>");
out.println("            <div align=\"center\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i>");
out.println("              </i><a href=\"../AuctionBoard.html\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Auction");
out.println("              Board</font></font></a></font></div>");
out.println("            <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font>");
out.println("            <div align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><a href=\"../MailToUs.html\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Mail");
out.println("              To Us</font></font></a><i></i></font></div>");
out.println("            <p>&nbsp;</p>");
out.println("            <p>&nbsp;</p>");
out.println("          </div>");
out.println("          <p>&nbsp;</p>");
out.println("        </div>");
out.println("      </td>");
out.println("      <td bgcolor=\"#ffb56a\" width=\"79%\" valign=\"top\" height=\"279\">");
out.println("        <pre><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#660000\">  </font></b></font></pre>");
out.println("        <table width=\"80%\" border=\"0\">");
out.println("          <tr>");
out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#660000\">Name</font></b></font></td>");
out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#660000\">");
out.println("              </font></b></font></td>");
out.println("          </tr>");
out.println("          <tr>");
out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#660000\">");
out.println("              Company Name</font></b></font></td>");
out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#660000\">");
out.println("              </font></b></font></td>");
out.println("          </tr>");
out.println("          <tr>");
out.println("      <form method=\"Get\" action=\"Addpart\">");
out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#660000\">");
out.println("              Project Name </font></b></font></td>");
out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#660000\">");
out.println("              <input type=\"text\" name=\"Projectname\" maxlength=\"30\" size=\"30\">");
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
out.println("              <select name=\"Enddate\" size=\"1\">");
out.println("                <option selected>10/02/2001</option>");
out.println("              </select>");
out.println("              </font></b></font></td>");
out.println("          </tr>");
out.println("          <tr>");
out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#990000\">Max");
out.println("              Price <i><font size=\"2\">(baht)</font></i></font></b></font></td>");
out.println("            <td><font color=\"#990000\"><i>");
out.println("              <input type=\"text\" name=\"Maxprice\">");
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
out.println("          <input type=\"submit\" name=\"Submit\" value=\"ADD PART\">");
out.println("</form>");
out.println("          </font></b></p>");
out.println("        <p>&nbsp;</p>");
out.println("      </td>");
out.println("    </tr>");
out.println("  </table>");
out.println("  <div align=\"center\">");
out.println("     <p>&nbsp;</p>");
out.println("   </div>");
out.println("   <p align=\"center\">&nbsp;</p>");
out.println("   <p align=\"center\"> <font size=\"6\" color=\"#9999FF\"><i><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#003333\">");
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
          out.println("<title> Make project</title>");
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
          out.println("data2 = data2 + \"<FORM action=Sendproject method=get name=Test><INPUT name=test\";");
          out.println("data2 = data2 + \" type=submit value=\\\"SendProject\\\"> </FORM>\";");
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
out.println("<div align=\"center\"><img src=\"/picture/AuctionBanner.jpg\" width=\"970\" height=\"98\"></div>");

out.println("    </tr>");
out.println("<tr>");



out.println("<td bgcolor=#4f4fd2 height=310 rowspan=3 valign=top width=\"19%\">");
out.println("<p>&nbsp;</p>");
out.println("<div align=\"center\">");
out.println(" <p><b><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#ffcc00\">");
out.println("  <i>  Auction  Member</i> </font> </b> <i><br>  </i></p>");
out.println(" <p><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" ><a href=\"../index.html\">Home</a><i></i><i><br>");
out.println("  </i><a href=\"Changeinfo\">Change");
out.println("     Personal Information<br>");
out.println("                  </a> <a href=\"showmember\">Member Profiles<br>");
out.println("                  </a><a href=\"Listproject\">Project  List </a> <br><a href=\"ranking\">Member Rating</a>");
out.println("                   <br> </font> </p>");
out.println("                <p>");
out.println("               <font face=\"Arial, Helvetica, sans-serif\" size=\"2\"><b><font color=\"#FF9900\">For  Buyer</font></b></font>");
out.println("                         <br>");
out.println("                  <font  face=\"Arial, Helvetica, sans-serif\" size = \"3\">");
out.println("                          <a href=\"GeneralReq\">General  Requirement</a>   <br>");
out.println("                         <a href=\"AddTechReq\">Add   Technical Requirement <font size=\"2\"><i>(bidding)</i></a></font>");
out.println("                          <br>  <br>");
out.println("                    <font face=\"Arial, Helvetica, sans-serif\" color=\"#FF9900\" size=\"2\"><b>For  Seller</b></font><br>");
out.println("                    <font  face=\"Arial, Helvetica, sans-serif\" size = \"3\">");
out.println("                             <a href=\"AddSpec\">Add   Specification</a><br>");
out.println("                             <a href=\"Bidding\">Bidding</a></font> <br>");
out.println("                           </p>");
out.println("              </div>");
out.println("                <b><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#ffcc00\"><i><br>");
out.println("                Auction Services </i></font></b> <br>");
out.println("                <br>");
out.println("              </div>");
out.println("              <div align=\"center\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#FF3366\"><i>");
out.println("                </i><a href=\"../AuctionBoard.html\">Auction  Board</a></div>  <i></i>");
out.println("                 <div align=\"center\"><a href=\"../MailToUs.html\"> Mail   To Us  </a><i></i></font></div>");
out.println("              <p>&nbsp;</p>");
out.println("            </div>");
out.println("            <p>&nbsp;</p>");
out.println("          </div>");
out.println("          <p>&nbsp;</p>");
out.println("        </div>");
out.println(" </td>");












out.println("  <td bgcolor=#ffb56a height=100 valign=top width=\"79%\"> ");
out.println("	    <br>");
out.println("        <table border=0 width=\"80%\">");
out.println("          <tbody>");
out.println("<tr>");
out.println("            <td><i><font face=\"Arial, Helvetica, sans-serif\" size=3><b><font");
out.println("            color=#660000>Name</font></b></font></i></td>");
out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font color=\"#0000ff\"></font></b></font></td>");
out.println("          </tr>");
out.println("          <tr>");
out.println("            <td><i><font face=\"Arial, Helvetica, sans-serif\" size=3><b><font");
out.println("            color=#660000>Company Name</font></b></font></i></td>");
out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=3><b><font");
out.println("            color=#660000></font></b></font></td>");
out.println("          </tr>");
out.println("          <tr>");
out.println("            <td><i><font face=\"Arial, Helvetica, sans-serif\" size=3><b><font");
out.println("            color=#660000>Project Name </font></b></font></i></td>");
out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#0000ff\"><b>Find");
out.println("              computer to play game </b></font></td>");
out.println("          </tr>");
out.println("          <tr>");
out.println("            <td><i><font face=\"Arial, Helvetica, sans-serif\" size=3><b><font");
out.println("            color=#660000>Description</font></b></font></i></td>");
out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#0000ff\"><b>I");
out.println("              want to play 3D game and want high performance </b></font></td>");
out.println("          </tr>");
out.println("          <tr>");
out.println("            <td><i><font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b><font");
out.println("            color=#990000>End Date</font></b></font></i></td>");
out.println("            <td><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#0000ff\"><b>10/02/2001");
out.println("              </b></font></td>");
out.println("          </tr>");
out.println("          <tr>");
out.println("            <td height=\"22\"><i><font face=\"Arial, Helvetica, sans-serif\" size=3><b><font");
out.println("            color=#990000>Max Price <font");
out.println("            size=2>(baht)</font></font></b></font></i></td>");
out.println("            <td height=\"22\"><font color=\"#0000ff\" size=\"3\"><i><font face=\"Arial, Helvetica, sans-serif\"><b>40000</b></font>");
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
out.println("      <table border=1 cellpadding=1 cellspacing=2 height=180 width=\"99%\">");
out.println("      <tbody>");




          int i_count_part ;
          for (i_count_part = 0 ; i_count_part < spectest.Listpart.size() ; i_count_part++)
          {
               //-------------Display part description------------//
             out.println("               <tr bgcolor = #ffb56a>");
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
out.println("    size=2><font color=\"#FF0033\" size=\"3\"><b><font color=\"#000000\">"+  spectest.GetPart(i_count_part).GetDevice(row).GetType() +"</font></b></font></font></div>");
out.println("            </td>");
out.println("            <td height=32 width=\"70%\" bgcolor=\"#ffe4ca\">");
out.println("              <div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
out.println("    size=2><b><font color=\"#000000\" size=\"3\">");

               for (int col = 0 ; col < spectest.GetPart(i_count_part).GetDevice(row).Data.length ; col++)
               {
                 out.println(spectest.GetPart(i_count_part).GetDevice(row).Data[col]);;
               }
out.println("  </font></b></font></div>");
out.println("            </td>");
out.println("            <td colspan=2 height=32 bgcolor=\"#ffe4ca\">");
out.println("              <div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
out.println("    size=2><b><font color=\"#000000\" size=\"3\">" + spectest.GetPart(i_count_part).GetDevice(row).getQuantity() + "</font></b></font></div>");
out.println("            </td>");
out.println("          </tr>");

             }
             /////-----------------MAKE LINE--------------------////
             out.println(" <tr bgcolor=\"#000000\">");
             out.println("<td colspan=\"4\" height=\"3\" width=\"35%\">");
             out.println("</td>");
             out.println("</tr>");
          }
          ///////----------------End List Part -----------------------/////






          out.println("</tbody>");
out.println("        </table>");

out.println("<center>");
out.println("        <p><font color=\"#3333FF\"><b><font size=\"3\" face=\"Arial, Helvetica, sans-serif\"><i><font color=\"#330066\">Do");
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
out.println("  <div align=\"center\">");
out.println("    <p>&nbsp;</p>");
out.println("  </div>");
out.println("  <p align=\"center\">&nbsp;</p>");
out.println("  <p align=\"center\"> <font size=\"6\" color=\"#9999FF\"><i><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#003333\">");
out.println("    </font></b></i></font> </p>");
out.println("</div>");
  out.println("  <center>");
out.println("<span id=sendproject style=\"position:relative;\"></span>");

out.println("   </center>");
out.println("</body>");
out.println("</html>");
    out.flush();
          }
    }
}



