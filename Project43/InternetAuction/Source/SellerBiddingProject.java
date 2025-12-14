
import oracle.sql.*;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import oracle.jdbc.driver.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
public class SellerBiddingProject extends HttpServlet implements Serializable
{
    public void   doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
      java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
      resp.setContentType("text/html");
      HttpSession session = req.getSession(true);
      String tech_req_id = req.getParameter("tech_req_number");
      GenerateSellerSpec Generate = new GenerateSellerSpec();
      String username      = (String)session.getValue("username");
      String companyname   = (String)session.getValue("companyname");
      if (username == null)
          resp.sendRedirect("../Pleaselogin.html");





      out.println("      <html>");
out.println("<head>");
out.println("<title> Seller Bidding project : CE.KMITL</title>");
out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
out.println("<style><!-- A:link, A:visited { text-decoration: none; color: #ffffff}  A:hover { text-decoration: none; font-weight: underline; color :   #33ccff} // --> </style>");
out.println("</head>");
out.println("<body bgcolor=\"#FFFFFF\">");
out.println("<table width=\"100%\" border=\"0\" height=\"609\">");
out.println("  <tr>");
out.println("     <td colspan=\"2\" height=\"110\"><img src=\"/picture/bidding.jpg\" width=\"970\" height=\"98\"></td>");
out.println("  </tr>");
out.println("  <tr>");
out.println("      <td bgcolor=#4f4fd2 height=310 rowspan=3 valign=top width=\"19%\">");
out.println("        <div align=center>");
out.println("          <div align=center>");
out.println("            <div align=center>");
out.println("              <p>&nbsp;</p>");
out.println("              <div align=\"center\">");
out.println("                <p><b><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#ffcc00\"><i>Auction");
out.println("                  Member</i></font></b><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("                  </i></font></p>");
out.println("                <p><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" ><a href=\"LoginSuccess\"><font size=\"3\" >Home<font face=\"Arial, Helvetica,   sans-serif\">");
out.println("                  </font></font></a></font><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font><font face=\"Arial,   Helvetica, sans-serif\" size=\"2\" ><i><br>");
out.println("                  </i><a href=\"Changeinfo\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">C</font><font face=\"Arial, Helvetica,   sans-serif\">hange");
out.println("                  Personal Information<br>");
out.println("                  </font></font></a></font> <a href=\"Listmember\"><font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\">Member");
out.println("                  Profiles<br>");
out.println("                  </font></font></a><a href=\"Listproject\"><font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\">Project");
out.println("                  List </font></font></a><a href=\"OfferSpec\"><font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\"><br>");
out.println("                  </font></font></a><a href=\"Ranking\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Member");
out.println("                  Rating </font></font></a><a href=\"OfferSpec\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">");
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
out.println("                <b><font face=\"Arial, Helvetica, sans-serif\" size=\"3\" color=\"#ffcc00\"><i><br>");
out.println("                Auction Services </i></font></b> <br>");
out.println("                <br>");
out.println("              </div>");
out.println("              <div align=\"center\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i>");
out.println("                </i><a href=\"http://freeboard.adbest.com/KBoard.cgi?db=pennie23\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Auction");
out.println("                Board</font></font></a></font></div>");
out.println("              <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font>");
out.println("              <div align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><a href=\"../MailToUs.html\"><font   size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Mail");
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
out.println("     <td width=\"82%\" height=\"393\" align=\"left\" valign=\"top\">");
      Connection con = null;
      Statement stmt = null;
      ResultSet rs= null;
      Specification spectest    = new Specification();
      Specification Sellerspec  = new Specification();

      Sellerspec.name = username;
      Sellerspec.company_name = companyname;
      try
      {
      	  DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
	    }
	    catch (java.sql.SQLException ko){ out.println("Register error");}
      try
      {
        con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
        con.setAutoCommit(false);
        stmt = con.createStatement();
        ///////----------Check if this username have bidding this spec-------------------///
        boolean have_bid = false;
        String check_exist = new String("SELECT tech_req_id,seller_name FROM bidding_table ") ;
        check_exist += " where seller_name ='" + username + "' and tech_req_id = " + tech_req_id ;
        rs = stmt.executeQuery(check_exist);
        while (rs.next())
  		  {
         have_bid = true ;
      	}
        if (have_bid == true)
            resp.sendRedirect("Userhavebidproject");

        boolean your_spec = false  ;
        String check_user = new String("SELECT username FROM buyer_tech_req ") ;
        check_user += " where username ='" + username + "' and tech_req_id = " + tech_req_id ;
        rs = stmt.executeQuery(check_user);
        while (rs.next())
  		  {
         your_spec = true ;
       	}
        if (your_spec == true)
            resp.sendRedirect("CannotBidYourProject");
        
        //////---------------------------end check---------------------------------------///
        String findmax_specid = new String("select  tech_req_id,project_spec from buyer_tech_req where tech_req_id =" + tech_req_id);
        rs = stmt.executeQuery(findmax_specid);
    	  rs.next();
        BLOB blob;
        ///------------Unserialize object------------///
    	  blob = ((OracleResultSet)rs).getBLOB(2);
        InputStream instream = blob.getBinaryStream();
    	  ObjectInputStream iis = new ObjectInputStream(instream);
        ///------------Read Object------------------//
        spectest = (Specification)iis.readObject();
        String Sellername = (String)session.getValue("username") ;
        String Sellercompanyname = (String)session.getValue("companyname");
        //////////////////////////////////////////////////
        //             DISPLAY HTML DATA                //
        //////////////////////////////////////////////////
        out.println("<form method=\"Post\" action=\"ConfirmSellerSpec\" name=\"form\">");
        out.println("<table width=\"99%\" border=\"0\" cellpadding=\"2\" cellspacing=\"2\" bordercolor=\"#000000\">");
        /////---------------Seller Information--------------------///
        out.println("  <tr bgcolor = #89D8D8>");
        out.println("    <td height=\"5\" width=\"20%\">");
        out.println("      <div align=\"left\"><font face=\"Arial, Helvetica, sans-serif\"><b><font color=\"#000000\">Seller name</font></b></font></div>");
        out.println("    </td>");
        out.println("    <td height=\"5\" width=\"45%\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">");
        out.println(Sellername + "  </font></td>" );
        out.println(" <td bgcolor = #ffffff rowspan = \"9\" width = \"70%\">");
        out.println("     <img src=\"/picture/computer_set.JPG\" ");
        out.println(" width=\"250\" height=\"250\"></td>");
        out.println("    </td>");
        out.println("  </tr>");
        out.println("  <tr bgcolor = #c6e3e3>");
        out.println("    <td height=\"5\" width=\"20%\">");
        out.println("      <div align=\"left\"><font face=\"Arial, Helvetica, sans-serif\"><b><font color=\"#000000\">Seller Company</font></b></font></div>");
        out.println("    </td>");
        out.println("    <td height=\"5\" width=\"45%\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">");
        out.println(Sellercompanyname + "  </font></td>" );
        out.println("    </td>");
        out.println("  </tr>");
        /////---------------End Seller Information--------------------///

        out.println("  <tr bgcolor = #89D8D8>");
        out.println("    <td height=\"5\" width=\"20%\">");
        out.println("      <div align=\"left\"><font face=\"Arial, Helvetica, sans-serif\"><b><font color=\"#000000\">Buyer name</font></b></font></div>");
        out.println("    </td>");
        out.println("    <td height=\"5\" width=\"45%\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">");
        out.println(spectest.name + "  </font></td>" );

       out.println("    </td>");
        out.println("  </tr>");
        out.println("  <tr bgcolor = #c6e3e3>");
        out.println("    <td height=\"5\" width=\"20%\">");
        out.println("      <div align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#000000\">Buyer company");
        out.println("    </font></b></div>");
        out.println("    </td>");
        out.println("    <td height=\"5\"  width=\"45%\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">");
        out.println(spectest.company_name + " </font> </td>");
        out.println("  </tr>");
        out.println(" <tr bgcolor = #89D8D8>");
        out.println("    <td height=\"10\" width=\"20%\">");
        out.println("      <div align=\"left\"><font face=\"Arial, Helvetica, sans-serif\"><b><font color=\"#000000\">Project");
        out.println("        Name</font></b></font></div>");
        out.println("    </td>");
        out.println("    <td height=\"10\"  width=\"45%\">");
        out.println("      <p>" + "<font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">" +  spectest.projectname + "</p>");
        out.println("    </td>");
        out.println("  </tr>");
        out.println("  <tr bgcolor = #c6e3e3>");
        out.println("    <td height=\"5\" width=\"20%\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#000000\">Project");
        out.println("      Description</font></b></td>");
        out.println("    <td height=\"5\"  width=\"45%\">" + "<font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">"+ spectest.projectdescription + "</td>");
        out.println("  </tr>");
        out.println("  <tr bgcolor = #89D8D8>");
        out.println("    <td height=\"5\" width=\"20%\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#000000\">End");
        out.println("      Date</font></b></td>");
        out.println("    <td height=\"5\"  width=\"45%\">" + "<font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">" + spectest.Enddate + "</td>");
        out.println("  </tr>");
        out.println("  <tr bgcolor = #c6e3e3>");
        out.println("    <td height=\"5\" width=\"20%\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#000000\">Max");
        out.println("      Price (Baht)  </td>");
        out.println("    <td height=\"5\"  width=\"45%\">" + "<font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">"+ spectest.Maxprice );
        out.println("</td>");
        out.println("  </tr>");
        out.println("  <tr bgcolor = #89d8d8>");
        out.println("    <td height=\"5\" width=\"20%\"><b><font face=\"Arial, Helvetica, sans-serif\" color=\"#000000\">");
        out.println("   Seller Price  </td>");
        out.println("    <td height=\"5\"  width=\"45%\">" + "<font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">");
        out.println("   <input type=\"text\" name=\"Seller_price\" size=\"10\"  maxlength=\"10\"> </font></b>");
        out.println("</td>");
        out.println("  </tr>");

       out.println("</table>");
        ///------------Display Data-----------------///
        out.println("  <br>");
        out.println("  <br>");
        out.println("<table border=0 cellpadding=1 cellspacing=1 height=180 width=\"99%\">");
        out.println("<tbody>");
        int i_count_part ;
        for (i_count_part = 0 ; i_count_part < spectest.Listpart.size() ; i_count_part++)
        {
           /////////////////////////////////////////////////////////
           //                  DISPLAY TABLE                      //
           /////////////////////////////////////////////////////////
           out.println("<tr bgcolor=#ffb56a>");
           out.println("<td height=32><b><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
           out.println("size=2><font color=\"#000000\" size=\"3\">Part name</font></font></b></td>");
           out.println("<td colspan=4 height=32>");
           out.println("<font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">" + spectest.GetPart(i_count_part).Partname + " </font></td>");
           out.println("</tr>");
           out.println("<tr bgcolor=#ffb56a>");
           out.println("<td height=32><b><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
           out.println("size=2><font color=\"#000000\" size=\"3\">Part description</font></font></b></td>");
           out.println("<td colspan=4 height=32>");
           out.println("<font face=\"Arial, Helvetica, sans-serif\" size=\"4\" color=\"#0000ff\">" + spectest.GetPart(i_count_part).Partdescription + "</font></td>");
           out.println("</tr>");
           out.println("<tr bgcolor=#FFCC99>");
           out.println("<td height=33 width=\"16%\" bgcolor=\"#FFCC99\">");
           out.println("<div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
           out.println("size=2><font color=\"#000000\" size=\"3\"><b>Type Device</b></font></font></div>");
           out.println("</td>");
           out.println("<td height=33 width=\"46%\" bgcolor=\"#FFCC99\">");
           out.println("<div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
           out.println("size=2><font color=\"#000000\" size=\"3\"><b> Buyer Detail </b></font></font></div>");
           out.println("</td>");
           out.println("<td height=33 width=\"46%\" bgcolor=\"#FFCC99\">");
           out.println("<div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
           out.println("size=2><font color=\"#000000\" size=\"3\"><b> Seller Detail </b></font></font></div>");
           out.println("</td>");

           out.println("<td colspan=2 height=33 bgcolor=\"#FFCC99\">");
           out.println("<div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
           out.println("size=2><b><font color=\"#000000\" size=\"3\">Quantity </font></b></font></div>");
           out.println("</td>");
           out.println("</tr>");
           ////--------------List Each Part-----------------//
           int device_col = 0 ;
           for (int row = 0 ; row < spectest.GetPart(i_count_part).Listdevice.size()  ; row++)
           {
              out.println("<tr bgcolor=#CCCCFF>");
              out.println("  <td height=32 width=\"16%\" bgcolor=\"#ffe4ca\">");
              out.println("    <div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
              out.println("    size=2><font color=\"#FF0033\" size=\"3\"><b><font color=\"#000000\">" + spectest.GetPart(i_count_part).GetDevice(row).GetType() + "</font></b></font></font></div>");
              out.println("  </td>");
              out.println("  <td height=32 width=\"70%\" bgcolor=\"#ffe4ca\">");
              out.println("    <div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
              out.println("    size=2><b><font color=\"#000000\" size=\"3\">");
              for (int col = 0 ; col < spectest.GetPart(i_count_part).GetDevice(row).Data.length ; col++)
              {
                device_col = device_col + 1;
                if (spectest.GetPart(i_count_part).GetDevice(row).Data[col].compareTo("Not specific") != 0)
                      out.println(spectest.GetPart(i_count_part).GetDevice(row).Data[col]);
              }
              out.println("</font></b></font></div>");
              out.println("  </td>");
              out.println(" <td colspan=1 height=32 bgcolor=\"#ffe4ca\"> ");
              ////////////Generate seller spec select list here///////////              out.println("<div align=left>");
              String Str_device = spectest.GetPart(i_count_part).GetDevice(row).GetType() ;
              Generate.query_seller_spec(out,Str_device,device_col,spectest,i_count_part,row);
              device_col = 0 ;
              out.println("</div>");
              ///////////end Generate seller spec select list here/////////////
              out.println("   </td>");
              out.println("  <td colspan=2 height=32 bgcolor=\"#ffe4ca\">");
              out.println("    <div align=center><font color=#330000 face=\"Arial, Helvetica, sans-serif\"");
              out.println("    size=2><b><font color=\"#000000\" size=\"3\">");
              out.println(spectest.GetPart(i_count_part).GetDevice(row).Quantity);
              out.println("</font></b></font></div>");
              out.println("  </td>");
              out.println("</tr>");
           }
          /////-----------------MAKE LINE--------------------////
           out.println("<tr bgcolor=#000000>");
           out.println("  <td colspan=5 height=7></td>");
           out.println("  </tr>");
        }//{End List Project detail}
        con.commit();


        out.println("</tbody>");
        out.println("</table>");
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
        ////////////COPY VALUE ABOUT SELLERSPEC AND BUYERSPEC///////////

        Sellerspec.Enddate      = new String(spectest.Enddate) ;
        Sellerspec.projectname  = new String(spectest.projectname) ;
        Sellerspec.projectdescription = spectest.projectdescription ;
        /////----------copy number of part-------------///
        for (int count_part = 0 ; count_part < spectest.Listpart.size() ; count_part++)
        {
         Part   part   = new Part() ;
          Sellerspec.Listpart.addElement(part);
        }
        ////-----------copy  number of device------------//
        for (int count_part = 0 ; count_part < Sellerspec.Listpart.size() ; count_part++)
        {
         for (int row = 0 ; row < spectest.GetPart(count_part).Listdevice.size()  ; row++)
         {
            Device device = new Device(1) ;
            Sellerspec.GetPart(count_part).Listdevice.addElement(device);
         }
        }
         //////////////copy Type and Quantity////////////////
        for (int count_part = 0 ; count_part < spectest.Listpart.size() ; count_part++)
        {
         Sellerspec.GetPart(count_part).Partname        = new String(spectest.GetPart(count_part).Partname) ;
         Sellerspec.GetPart(count_part).Partdescription = new String(spectest.GetPart(count_part).Partdescription);
          for (int row = 0 ; row <  Sellerspec.GetPart(count_part).Listdevice.size()  ; row++)
          {
            Sellerspec.GetPart(count_part).GetDevice(row).Type_Device =  spectest.GetPart(count_part).GetDevice(row).GetType();
            Sellerspec.GetPart(count_part).GetDevice(row).Quantity    =  spectest.GetPart(count_part).GetDevice(row).Quantity ;
          }
        }
        ////////////END COPY VALUE ABOUT SELLERSPEC AND BUYERSPEC//////
     session.putValue("buyerspec",spectest);
     session.putValue("sellerspec",Sellerspec);
     out.println("<br>");
     out.println("<br>");
     out.println("<center>");
           ////////////Script check//////////////////
out.println("   <SCRIPT LANGUAGE=\"JavaScript\">" );
out.println("<!-- Begin" );
out.println("function validate(field) {" );
out.println("var maxprice =" + spectest.Maxprice);
out.println("var valid = \"0123456789\"" );
out.println("var ok = \"yes\";" );
out.println("var temp;" );

out.println("for (var i=0; i<field.value.length; i++) {" );
out.println("temp = \"\" + field.value.substring(i, i+1);" );
out.println("if (valid.indexOf(temp) == \"-1\") ok = \"no\";" );

out.println("}" );
out.println("if (field.value.length == 0 ) ok = \"blank\";" );

out.println("if (field.value > maxprice) ok = \"above\";");

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

out.println("if (ok == \"above\") {" );
out.println("alert(\"Sorry, please input lower price than maxprice\");" );
out.println("field.focus();" );
out.println("field.select();" );
out.println("   }" );


out.println("	if ((ok != \"blank\") && (ok != \"no\") && (ok != \"above\") ) document.form.submit(); ");
out.println("}" );

out.println("</script>" );
//////////////////////////  End script /////////////

     out.println(" <input type=hidden Name = \"tech_req_number\" value = \"" + tech_req_id + "\">" );
     out.println("  <input type=\"button\" name=\"Submit\" value=\" Send Seller Project\" onClick=\"validate(Seller_price)\">");
     out.println("</center>");
     out.println("</td>");
     out.println("</tr>");
     out.println("</table>");
     out.println("</form>");
     out.println("</body>");
     out.println("</html>");
     out.flush();
    }
 }

