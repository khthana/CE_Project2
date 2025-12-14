import oracle.sql.*;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import oracle.jdbc.driver.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
public class ListGeneralSpec extends HttpServlet implements Serializable
{
    public void   doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
      java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
//      Connection con = null;
//      Statement stmt = null;
 //     ResultSet rs= null;
      resp.setContentType("text/html");
      HttpSession session = req.getSession(true);
      String Spec_type    = req.getParameter("Spec_type");
      String username      = (String)session.getValue("username");
      Specification Standard_spec  = new Specification();
      String Price = "";
      Connection Standard_con = null;
      Statement Standard_stmt = null;
      ResultSet Standard_rs= null;
      String date ="" ;
      try
      {
     	  DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
      }
      catch (java.sql.SQLException ko){ out.println("Register error");}
      try
      {
        Standard_con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
        Standard_con.setAutoCommit(false);
        Standard_stmt = Standard_con.createStatement();
        String select_standard = new String("select standard_spec,standard_price,last_update from standard_spec where spec_type = '" + Spec_type + "'");
        Standard_rs = Standard_stmt.executeQuery(select_standard);

    	  Standard_rs.next();
        BLOB blob;
        ///------------Unserialize object------------///
        blob = ((OracleResultSet)Standard_rs).getBLOB(1);
        Price = Standard_rs.getString(2);
        InputStream instream = blob.getBinaryStream();
    	  ObjectInputStream iis = new ObjectInputStream(instream);
        ///------------Read Object------------------//
        Standard_spec = (Specification)iis.readObject();

       	Calendar Temp_Calendar = new GregorianCalendar();
        Temp_Calendar.setTime(Standard_rs.getDate(3));
        int Temp_Date      =  Temp_Calendar.get(Calendar.DATE);
        int Temp_Month     =  Temp_Calendar.get(Calendar.MONTH);
        int Temp_Year      =  Temp_Calendar.get(Calendar.YEAR);
        Temp_Calendar.setTime(Standard_rs.getTime(3));
        int Temp_Min       =  Temp_Calendar.get(Calendar.MINUTE);
        int Temp_Hour      =  Temp_Calendar.get(Calendar.HOUR_OF_DAY);
      	Calendar Project_Calendar = new GregorianCalendar(Temp_Year,Temp_Month,Temp_Date,
                                                       Temp_Hour,Temp_Min);
        String Day   = new  Integer(Project_Calendar.get(Calendar.DATE)).toString() ;
        String Month = new  Integer(Project_Calendar.get(Calendar.MONTH)+1).toString() ;
        String Year  = new  Integer(Project_Calendar.get(Calendar.YEAR)).toString() ;
        date = Day + "/" + Month + "/" + Year ;

      }
      catch (Exception ex)
      {
    	 out.println("Exception");
	     ex.printStackTrace(out);
	    }
      finally
      {
	     try
	     { if (Standard_rs != null)  {Standard_rs.close();}
         if (Standard_stmt != null){Standard_stmt.close();}
  		   if (Standard_con != null) {Standard_con.close();}
       }
	     catch (Exception ex){}
	    }
      String Cpu          = Standard_spec.GetPart(0).GetDevice(0).Data[0] ;
      String Ram          = Standard_spec.GetPart(0).GetDevice(1).Data[0]  ;
      String Mainboard    = Standard_spec.GetPart(0).GetDevice(2).Data[0]   ;
      String Harddisk     = Standard_spec.GetPart(0).GetDevice(3).Data[0]  ;
      String Cdrom        = Standard_spec.GetPart(0).GetDevice(4).Data[0]  ;
      String Display_card = Standard_spec.GetPart(0).GetDevice(5).Data[0]   ;
      String Sound_card   = Standard_spec.GetPart(0).GetDevice(6).Data[0]   ;
      String Monitor      = Standard_spec.GetPart(0).GetDevice(7).Data[0] ;
      String Modem        = Standard_spec.GetPart(0).GetDevice(8).Data[0]  ;
      String Floppy_disk  = Standard_spec.GetPart(0).GetDevice(9).Data[0]   ;
      String Mouse        = Standard_spec.GetPart(0).GetDevice(10).Data[0] ;
      String Keyboard     = Standard_spec.GetPart(0).GetDevice(11).Data[0]  ;
      String Speaker      = Standard_spec.GetPart(0).GetDevice(12).Data[0]  ;
      out.println("<html>");
      out.println("<head>");
out.println("<title>Internet Auction : CE.KMITL</title>");
out.println("<style><!-- A:link, A:visited { text-decoration: none; color: #ffffff}  A:hover { text-decoration: none; font-weight: underline; color :  #33ccff} // --> </style>");
out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
out.println("</head>");
out.println("");
out.println("<body bgcolor=\"#FFFFFF\" link=\"#FF9933\" vlink=\"#3399CC\" alink=\"#FF9966\" >");
out.println("<div align=\"center\">");
out.println("  <p>&nbsp;</p>");
out.println("  <div id=\"Layer1\" style=\"position:absolute; width:970px; height:100px; z-index:1; left: 17px; top: 22px\"> ");
out.println("");
out.println("    <table width=\"99%\" border=\"0\" height=\"400\">");
out.println("      <tr> ");
out.println("        <div align=\"center\"><img src=\"/picture/AuctionBanner.jpg\" width=\"970\" height=\"98\"></div>");
out.println("      </tr>");
out.println("      <tr> ");
out.println("        <td rowspan=\"3\" height=\"137\" width=\"15%\" bgcolor=\"#4F4FD2\" valign=\"top\"> ");
out.println("          <div align=\"center\"> ");
out.println("            <p><font size=\"3\" face=\"Arial, Helvetica, sans-serif\"><font color=\"#FF3366\"><i><font size=\"2\"><br>");
out.println("              </font></i></font></font></p>");
out.println("            <p><font size=\"3\" face=\"Arial, Helvetica, sans-serif\"><font color=\"#FF3366\"><i><font size=\"2\"><font color=\"#CC0000\"><b><font size=\"3\" color=\"#FFCC00\">New ");
out.println("              Users !!</font></b></font><br>");
out.println("              </font></i></font></font><br>");
out.println("            </p>");
out.println("          </div>");
out.println("          <div align=\"center\"> ");
out.println("            <p><font size=\"3\"><a href=\"../register.html\"><font face=\"Arial, Helvetica, sans-serif\">Register</font></a></font> ");
out.println("              <br>");
out.println("              <font size=\"3\"><a href=\"../NewToAuction.html\"><font face=\"Arial, Helvetica, sans-serif\"> ");
out.println("              New to our Auction</font></a></font> <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("              </i></font><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("              <br>");
out.println("              <font color=\"#cc0000\"><b><font size=\"3\" color=\"#ffcc00\">Auction ");
out.println("              Member</font></b></font></i></font></p>");
out.println("            <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><a href=\"LoginSuccess\"><font size=\"3\" >Home<font face=\"Arial, Helvetica, sans-serif\"> ");
out.println("            </font></font></a></font><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("            </i><a href=\"Changeinfo\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Change ");
out.println("            Personal Information </font><font  face=\"Arial, Helvetica, sans-serif\"> ");
out.println("            </font></font> </a><i> </i></font> </div>");
out.println("          <div align=\"center\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"></font><a href=\"Listmember\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Member ");
out.println("            Profile<br>");
out.println("            </font></font></a><a href=\"Listproject\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Project ");
out.println("            List</font></font></a><a href=\"OfferSpec\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><br>");
out.println("            </font></font></a><a href=\"Ranking\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Member Rating</font></font></a> ");
out.println("            <br>");
out.println("            <br>");
out.println("            <font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\" size=\"2\"><b><font color=\"#FF9900\">For ");
out.println("            Buyer</font></b></font></font><br>");
out.println("            <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"GeneralReq\">General ");
out.println("            Requirement</a></font></font><br>");
out.println("            <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"AddTechReq\">Add ");
out.println("            Technical Requirement <font size=\"2\"><i>(bidding)</i></font></a></font></font><br>");
out.println("            <br>");
out.println("            <font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#CCCCCC\" size=\"2\"><b><font color=\"#FF9900\">For ");
out.println("            Seller</font></b></font></font><br>");
out.println("            <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"AddSpecification\">Add ");
out.println("            Specification</a></font></font><br>");
out.println("            <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"ListBiddingProject\">Bidding</a></font></font><br>");
out.println("            <br>");
out.println("          </div>");
out.println("          <div align=\"center\"> ");
out.println("            <p><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><font color=\"#cc0000\"><b><font size=\"3\" color=\"#ffcc00\">Auction ");
out.println("              Services</font></b></font></i></font> <br>");
out.println("            </p>");
out.println("          </div>");
out.println("          <div align=\"center\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i> ");
out.println("            </i><a href=\"http://freeboard.adbest.com/KBoard.cgi?db=pennie23\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Auction ");
out.println("            Board</font></font></a></font>");
out.println("          <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font> ");
//out.println("          <div align=\"center\"> ");
out.println("            <br><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"MailToUs.html\">Mail ");
out.println("              To Us</a></font></font></font>");
out.println("            <br><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><a href=\"Logout\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Log ");
out.println("              Out </font></font></a></font><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("              </i></font>");
out.println("          </div>");
out.println("          <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font> ");
out.println("          <div align=\"center\"><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("            </i></font><br>");
out.println("          </div>");
out.println("          <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font> ");
out.println("          <div align=\"right\"> ");
out.println("            <pre>&nbsp;");
out.println("");
out.println("</pre>");
out.println("          </div>");
out.println("       ");
out.println("        </td>");
out.println("        <td width=\"63%\" rowspan=\"3\" valign=\"top\"\">");
out.println("          <p align=\"center\"><font size=\"+2\">Recommend " + Spec_type + " spec from system</font></p>");
out.println("       ");
out.println("          <table width=\"100%\" border=\"0\" align=\"center\" cellspacing=2 cellpadding=4>");
out.println("            <tr bgcolor=\"#ffe4ca\"> ");
out.println("              <td width=\"29%\"><b><font color=\"#990000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">Cpu ");
out.println("                : </font></b> <b><font color=\"#0000ff\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Cpu + "</b> </td>");
out.println("              <td width=\"31%\"><b><font color=\"#990000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">RAM ");
out.println("                : </font></b> <b><font color=\"#0000ff\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Ram + "</td>");
out.println("              <td width=\"32%\"><b><font color=\"#990000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">Mainboard ");
out.println("                : </font></b> <b><font color=\"#0000ff\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Mainboard + "</td>");
out.println("            </tr>");
out.println("            <tr bgcolor=\"#ffcc99\"> ");
out.println("              <td width=\"29%\" height=\"14\"><font color=\"#990000\"><b><font face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">HDD ");
out.println("                : </font></b></font> <b><font color=\"#0000ff\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Harddisk+ "</td>");
out.println("              <td width=\"31%\" height=\"14\"><font color=\"#990000\"><b><font face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">CD-Rom ");
out.println("                :</font></b></font> <b><font color=\"#0000ff\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Cdrom + "</td>");
out.println("              <td width=\"32%\" height=\"14\"><font color=\"#990000\"><b><font face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">Display ");
out.println("                : </font></b></font> <b><font color=\"#0000ff\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Display_card + "</td>");
out.println("            </tr>");
out.println("            <tr bgcolor=\"#ffe4ca\"> ");
out.println("              <td width=\"29%\"><b><font color=\"#990000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">Sound ");
out.println("                : </font></b> <b><font color=\"#0000ff\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Sound_card+ "</td>");
out.println("              <td width=\"31%\"><b><font color=\"#990000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">Monitor ");
out.println("                : </font></b> <b><font color=\"#0000ff\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Monitor + "</td>");
out.println("              <td width=\"32%\"><b><font color=\"#990000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">Modem ");
out.println("                : </font></b> <b><font color=\"#0000ff\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Modem + "</td>");
out.println("            </tr>");
out.println("            <tr bgcolor=\"#ffcc99\"> ");
out.println("              <td width=\"29%\"><b><font color=\"#990000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">Floppy ");
out.println("                : </font></b> <b><font color=\"#0000ff\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Floppy_disk + "</td>");
out.println("              <td width=\"31%\"><b><font color=\"#990000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">Mouse ");
out.println("                :</font></b> <b><font color=\"#0000ff\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Mouse + "</td>");
out.println("              <td width=\"32%\"><b><font color=\"#990000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">Keyboard ");
out.println("                :</font></b> <b><font color=\"#0000ff\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Keyboard + "</td>");
out.println("            </tr>");
out.println("            <tr bgcolor=\"#ffe4ca\"> ");
out.println("              <td> ");
out.println("                <div align=\"left\"><b><font face=\"ms Sans Serif, Thonburi, arial\" size=\"1\" color=\"#990000\"> ");
out.println("                  Speaker : </font></b> <b><font color=\"#0000ff\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Speaker + "</div>");
out.println("              </td>");
out.println("              <td><b><font color=\"#990000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">Price ");
out.println("                :</font></b>  <b><font color=\"#0000ff\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Price + "</td>");
out.println("              <td width=\"32%\"> ");
out.println("                <div align=\"left\"><font color=\"#aa3333\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\"><font color=\"#990000\"><b> ");
out.println(" Last update : </b></font> <b><font color=\"#0000ff\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" +  date + " </font></b> " );
out.println("                  </font></div>");
out.println("              </td>");
out.println("            </tr>");
out.println("          </table>");
out.println("");
out.println("          <br>");
out.println("          <hr>");
out.println("          <div align=\"center\"><font size=\"+2\">List all " + Spec_type + " spec </font><br>");
out.println("            <br>");
out.println("          </div>");




/////////////////////////////List seller spec////////////////////////////////////
      Specification Seller_spec  = new Specification();
      String Seller_price = "";
      Connection Seller_con = null;
      Statement  Seller_stmt = null;
      ResultSet  Seller_rs= null;
      try
      {
     	  DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
      }
      catch (java.sql.SQLException ko){ out.println("Register error");}
      try
      {
        Seller_con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
        Seller_con.setAutoCommit(false);
        Seller_stmt = Seller_con.createStatement();
        String select_standard = new String("select seller_spec,standard_price,detail,company,username,last_update");
               select_standard += " from seller_standard_spec where spec_type = '" + Spec_type + "'";
        Seller_rs = Seller_stmt.executeQuery(select_standard);
        ///////////////query all data/////////////////////////
        while (Seller_rs.next())
        {
        BLOB blob;
        ///------------Unserialize object------------///
        blob = ((OracleResultSet)Seller_rs).getBLOB(1);

         	Calendar Temp_Calendar = new GregorianCalendar();
        Temp_Calendar.setTime(Seller_rs.getDate(6));
        int Temp_Date      =  Temp_Calendar.get(Calendar.DATE);
        int Temp_Month     =  Temp_Calendar.get(Calendar.MONTH);
        int Temp_Year      =  Temp_Calendar.get(Calendar.YEAR);
        Temp_Calendar.setTime(Seller_rs.getTime(6));
        int Temp_Min       =  Temp_Calendar.get(Calendar.MINUTE);
        int Temp_Hour      =  Temp_Calendar.get(Calendar.HOUR_OF_DAY);
      	Calendar Project_Calendar = new GregorianCalendar(Temp_Year,Temp_Month,Temp_Date,
                                                       Temp_Hour,Temp_Min);
        String Day   = new  Integer(Project_Calendar.get(Calendar.DATE)).toString() ;
        String Month = new  Integer(Project_Calendar.get(Calendar.MONTH)+1).toString() ;
        String Year  = new  Integer(Project_Calendar.get(Calendar.YEAR)).toString() ;
        String Seller_date = Day + "/" + Month + "/" + Year ;
        String Sellername     = Seller_rs.getString(5);
        String Sellercompany  = Seller_rs.getString(4);
        String Seller_detail = Seller_rs.getString(3);
        Seller_price        = Seller_rs.getString(2);
        InputStream instream = blob.getBinaryStream();
    	  ObjectInputStream iis = new ObjectInputStream(instream);
        ///------------Read Object------------------//
        Seller_spec = (Specification)iis.readObject();
        String Seller_Cpu          = Seller_spec.GetPart(0).GetDevice(0).Data[0] ;
        String Seller_Ram          = Seller_spec.GetPart(0).GetDevice(1).Data[0]  ;
        String Seller_Mainboard    = Seller_spec.GetPart(0).GetDevice(2).Data[0]   ;
        String Seller_Harddisk     = Seller_spec.GetPart(0).GetDevice(3).Data[0]  ;
        String Seller_Cdrom        = Seller_spec.GetPart(0).GetDevice(4).Data[0]  ;
        String Seller_Display_card = Seller_spec.GetPart(0).GetDevice(5).Data[0]   ;
        String Seller_Sound_card   = Seller_spec.GetPart(0).GetDevice(6).Data[0]   ;
        String Seller_Monitor      = Seller_spec.GetPart(0).GetDevice(7).Data[0] ;
        String Seller_Modem        = Seller_spec.GetPart(0).GetDevice(8).Data[0]  ;
        String Seller_Floppy_disk  = Seller_spec.GetPart(0).GetDevice(9).Data[0]   ;
        String Seller_Mouse        = Seller_spec.GetPart(0).GetDevice(10).Data[0] ;
        String Seller_Keyboard     = Seller_spec.GetPart(0).GetDevice(11).Data[0]  ;
        String Seller_Speaker      = Seller_spec.GetPart(0).GetDevice(12).Data[0]  ;
out.println("          <table width=\"100%\" border=\"0\" align=\"center\" cellspacing=2 cellpadding=4>");
out.println("            <tr bgcolor=\"#89d8d8\"> ");
out.println("              <td height=\"20\"><font face=\"ms Sans Serif, Thonburi, arial\" size=\"2\"><font color=\"#000000\"><b>Seller ");
out.println("                name :</b><b><font color=\"#ff0000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"2\">" + Sellername + "</font></font></td>");
out.println("              <td colspan=\"2\" height=\"20\"><font face=\"ms Sans Serif, Thonburi, arial\" size=\"2\"><font color=\"#000000\"><b>Seller ");
out.println("                company :</b><b><font color=\"#ff0000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"2\">" + Sellercompany + "</font></font></td>");
out.println("            </tr>");
out.println("            <tr bgcolor=\"#89d8d8\"> ");
out.println("              <td colspan=\"3\"> ");
out.println("                <div align=\"left\"><font face=\"ms Sans Serif, Thonburi, arial\" size=\"1\"><font color=\"#aa3333\"><b>Detail ");
out.println("                  : </b><b><font color=\"#000000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Seller_detail + "</font><font color=\"#3366ff\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\"><b><font color=\"#3366ff\" size=\"1\"> ");
out.println("                  </font></b></font></font></div>");
out.println("              </td>");
out.println("            </tr>");
out.println("            <tr bgcolor=\"#c6e3e3\"> ");
out.println("              <td width=\"31%\"><b><font color=\"#aa3333\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">Cpu ");
out.println("                :</font></b><b><font color=\"#000000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Seller_Cpu + "</td>");
out.println("              <td width=\"31%\"><b><font color=\"#aa3333\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">RAM ");
out.println("                : </font></b><b><font color=\"#000000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Seller_Ram + "</td>");
out.println("              <td width=\"31%\"><b><font color=\"#aa3333\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">Mainboard ");
out.println("                : </font></b><b><font color=\"#000000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Seller_Mainboard + "</td>");
out.println("            </tr>");
out.println("            <tr bgcolor=\"#e0f1f1\"> ");
out.println("              <td width=\"31%\"><b><font color=\"#aa3333\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">HDD. ");
out.println("                : </font></b><b><font color=\"#000000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Seller_Harddisk + "</td>");
out.println("              <td width=\"31%\"><b><font color=\"#aa3333\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">CD-Rom ");
out.println("                : </font></b><b><font color=\"#000000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Seller_Cdrom + "</td>");
out.println("              <td width=\"31%\"><b><font color=\"#aa3333\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">Display ");
out.println("                : </font></b><b><font color=\"#000000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Seller_Display_card + "</td>");
out.println("            </tr>");
out.println("            <tr bgcolor=\"#c6e3e3\"> ");
out.println("              <td width=\"31%\"><b><font color=\"#aa3333\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">Sound ");
out.println("                : </font></b><b><font color=\"#000000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Seller_Sound_card + "</td>");
out.println("              <td width=\"31%\"><b><font color=\"#aa3333\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">Monitor ");
out.println("                :</font></b><b><font color=\"#000000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Seller_Monitor + "</td>");
out.println("              <td width=\"31%\"><b><font color=\"#aa3333\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">Modem ");
out.println("                :</font></b><b><font color=\"#000000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Seller_Modem + "</td>");
out.println("            </tr>");
out.println("            <tr bgcolor=\"#e0f1f1\"> ");
out.println("              <td width=\"31%\"><b><font color=\"#aa3333\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">Floppy ");
out.println("                : </font></b><b><font color=\"#000000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Seller_Floppy_disk + "</td>");
out.println("              <td width=\"31%\"><b><font color=\"#aa3333\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">Mouse ");
out.println("                : </font></b><b><font color=\"#000000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Seller_Mouse + "</td>");
out.println("              <td width=\"31%\"><b><font color=\"#aa3333\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">Keyboard ");
out.println("                :</font></b><b><font color=\"#000000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Seller_Keyboard + "</td>");
out.println("            </tr>");
out.println("            <tr> ");
out.println("              <td bgcolor=\"#c6e3e3\" height=\"17\"> ");
out.println("                <div align=\"left\"><b><font face=\"ms Sans Serif, Thonburi, arial\" size=\"1\"><font color=\"#FFFFC8\"> ");
out.println("                  <font color=\"#aa3333\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">Speaker ");
out.println("                  :</font><font color=\"#FFFFFF\"> </font></font></font></b><b><font color=\"#000000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Seller_Speaker + "</div>");
out.println("              </td>");
out.println("              <td bgcolor=\"#c6e3e3\" height=\"17\"><b><font color=\"#aa3333\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">Price ");
out.println("                : </font></b><b><font color=\"#000000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">" + Seller_price + "</td>");
out.println("              <td bgcolor=\"#89d8d8\" width=\"31%\" height=\"17\"> ");
out.println("                <font color=\"#aa3333\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\"> ");
out.println("<b> Last update:    </b> </font>");
out.println("<b><font color=\"#000000\" face=\"ms Sans Serif, Thonburi, arial\" size=\"1\">"+ Seller_date+ "</font></b>" );
out.println("              </td>");
out.println("            </tr>");

out.println("            <tr> ");
out.println("              <td bgcolor=\"#c6e3e3\" colspan = \"3\" height=\"17\"> ");
out.println("                <div align=\"center\"><b><font face=\"ms Sans Serif, Thonburi, arial\" size=\"1\"><font color=\"#FFFFC8\"> ");
out.println("<form method=\"Post\" action=\"MemberDetail\" name=\"NewMemberForm\">");
out.println("            <input type=hidden Name = \"username\" value = \"" + Sellername + "\">" );
out.println("      <input type=\"submit\" name=\"Submit\" value=\"Contact seller\">");
out.println("</form>");


out.println("              </td>");
out.println("            </tr>");


out.println("          </table>");
out.println("<Br>");
      }
      }
      catch (Exception ex)
      {
    	 out.println("Exception");
	     ex.printStackTrace(out);
	    }
      finally
      {
	     try
	     { if (Seller_rs != null)  {Seller_rs.close();}
         if (Seller_stmt != null){Seller_stmt.close();}
  		   if (Seller_con != null) {Seller_con.close();}
       }
	     catch (Exception ex){}
	    }

/////////////////////////////End List seller spec////////////////////////////////////




out.println("</td>");
out.println("      </tr>");
out.println("      <tr> </tr>");
out.println("      <tr> </tr>");
out.println("    </table>");
out.println("  <p>&nbsp; </p>");
out.println("</div>");
out.println("</div></body>");
out.println("</html>");


      out.flush();

     }
}
