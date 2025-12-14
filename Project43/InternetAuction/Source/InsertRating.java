import  java.sql.*;
import  oracle.jdbc.driver.*;
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.util.*;
public class InsertRating extends HttpServlet
{
    public synchronized void   doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
	  resp.setContentType("text/html");
	  java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
    HttpSession session = req.getSession(true);
    String username      = (String)session.getValue("username");
    String companyname   = (String)session.getValue("companyname");
    if (username == null)
      resp.sendRedirect("../Pleaselogin.html");

	  String Rated_user = req.getParameter("username");
    String Tech_req_id  = req.getParameter("Tech_req_id");
    String Comment      = req.getParameter("comment");
    String Yourcomment  = req.getParameter("Yourcomment");

    Connection con = null;
    Statement stmt = null;
    ResultSet rs= null;
    boolean have_rate            = false  ;
    boolean rated_involve        = false  ;
    boolean rating_giver_involve = false ;
    try
    {
      DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
	  }
	  catch (java.sql.SQLException ko){ out.println("Register error");}
    try
    {
      con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
      stmt = con.createStatement();
      //////----Find Max spec_id-----///
      String find_have_rate = new String("select username,rating_giver,project_id from rating where ");
      find_have_rate += "username ='" + Rated_user + "' and rating_giver ='" + username + "' and project_id ='" + Tech_req_id + "'" ;
     	rs = stmt.executeQuery(find_have_rate);
  //    out.println(find_have_rate+ "<br>");
      while(rs.next())
      {
        have_rate = true ;
      }
      if (have_rate == false)
      {
         ////////Check Rated_user from buyer_tech_req and bidding_table /////////////
         String find_involve = new String("select username  from buyer_tech_req where ");
         find_involve += "username ='"    + Rated_user + "' and tech_req_id  ='" + Tech_req_id + "'" ;
       	 rs = stmt.executeQuery(find_involve);
    //     out.println(find_involve+ "<br>");
         while(rs.next())
         {
           rated_involve = true ;
         }
         find_involve = new String("select seller_name  from bidding_table  where ");
         find_involve += "seller_name ='" + Rated_user + "' and tech_req_id  ='" + Tech_req_id + "'" ;
       	 rs = stmt.executeQuery(find_involve);
      //   out.println(find_involve+ "<br>");
         while(rs.next())
         {
           rated_involve = true ;
         }
         if (rated_involve == true )
         {
             out.println("rated user involve<br>");
             /////////////////Check your name from buyer_tech_req and bidding_table//////////
             find_involve = new String("select username  from buyer_tech_req where ");
             find_involve += "username ='"    + username + "' and tech_req_id  ='" + Tech_req_id + "'" ;
       	     rs = stmt.executeQuery(find_involve);
        //     out.println(find_involve+ "<br>");
             while(rs.next())
             {
               rating_giver_involve = true ;
             }
             find_involve = new String("select seller_name  from bidding_table  where ");
             find_involve += "seller_name ='" + username + "' and tech_req_id  ='" + Tech_req_id + "'" ;
       	     rs = stmt.executeQuery(find_involve);
          //   out.println(find_involve + "<br>");
             while(rs.next())
             {
                rating_giver_involve = true ;
             }
             if (rating_giver_involve == true)
             {
            //   out.println("rating giver involve <br>");
             }
          }

      }

      if (rated_involve == false )
      {
  //      out.println("rated user  not involve <br>");
      }
      if (rating_giver_involve == false )
      {
//        out.println("rating giver  not involve <br>");
      }
      if ((rated_involve == true) && (rating_giver_involve == true) && ( have_rate == false) )
      {
        ///insert new comment////////////////
        String insert = "insert into rating(username,rating_giver,project_id,member_comment,type_of_comment) ";
        insert += "values('" + Rated_user + "','" + username + "'," + Tech_req_id + ",'" + Yourcomment + "','" + Comment + "')";
    //    out.println(insert);
        rs = stmt.executeQuery(insert);

      }

//      out.println("have some error");
    }
    catch (Exception ex)
    {
    	 out.println(ex);
	     ex.printStackTrace(out);
	  }
    finally
    {
	     try
	     { if (rs != null)  {rs.close();}
         if (stmt != null){stmt.close();}
  		   if (con != null) {con.close();}
       }
	     catch (Exception ex){ out.println(ex) ;}
	   }
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
out.println("  <table width=\"99%\" border=\"0\" height=\"400\">");
out.println("<tr>");
out.println("    <div align=\"center\"><img src=\"/picture/MemberRating.jpg\" width=\"970\" height=\"98\"></div>");
out.println("  ");
out.println("");
out.println("</tr>    ");
out.println("<tr> ");
out.println("      <td rowspan=\"3\" height=\"137\" width=\"15%\" bgcolor=\"#4F4FD2\" valign=\"top\"> ");
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
out.println("              <font size=\"3\"><a href=\"../NewToAuction.html\"><font face=\"Arial, Helvetica, sans-serif\"> ");
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
out.println("			<font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"AddTechReq\">Add Technical Requirement <font size=\"2\"><i>(bidding)</i></font></a></font></font><br><br>");
out.println("            <font size=\"3\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#CCCCCC\" size=\"2\"><b><font color=\"#FF9900\">For ");
out.println("            Seller</font></b></font></font><br>");
out.println("            <font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\"><a href=\"AddSpecification\">Add ");
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
out.println("            Board</font></font></a></font></div>");
out.println("        <font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i></i></font>");
out.println("        <div align=\"center\">");
out.println("            <p><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Mail ");
out.println("              To Us</font></font></font></p>");
out.println("            <p><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><a href=\"Logout\"><font size=\"3\"><font  face=\"Arial, Helvetica, sans-serif\">Log ");
out.println("              Out </font></font></a></font><font face=\"Arial, Helvetica, sans-serif\" size=\"2\" color=\"#FF3366\"><i><br>");
out.println("              </i></font> </p>");
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
out.println("      <td width=\"63%\" rowspan=\"3\" valign=\"top\" background=\"picture/indexpic2.jpg\">");
out.println("          <div align=\"right\"> ");
out.println("            <p align=\"left\"><b><font face=\"Arial, Helvetica, sans-serif\" size=\"+3\" color=\"#9999FF\"> ");
out.println("         </font></b></p>");
out.println("         <div align = \"left\">");

if (have_rate == true)
{
out.println("   <font size=\"5\" color=\"#ff0000\">    Sorry,you have already rating this case </font>");
}
if ((rated_involve == false)|| (rating_giver_involve == false))
{
out.println("   <font size=\"5\" color=\"#ff0000\">    Sorry,have some error   </font><br>");
out.println("   <font size=\"5\" color=\"#ff0000\">  1.you are not involve this project   </font><br>");
out.println("   <font size=\"5\" color=\"#ff0000\">  or </font><br>");
out.println("   <font size=\"5\" color=\"#ff0000\">  2.username who are voted are not involve this project   </font><br>");

}




if ((have_rate  == false) && (rated_involve == true) && (rating_giver_involve == true))
{
  resp.sendRedirect("Ranking");

}
out.println("			<br>");
out.println("			  <font size=\"3\"> <font face=\"Arial, Helvetica, sans-serif\" color =\"0000ff\"> ");
out.println("  </font></font>");
out.println("       </div>");
out.println("");
out.println("</div>");
out.println("      </td>");
out.println("");
out.println("");
out.println("    </tr>");
out.println("    <tr> </tr>");
out.println("    <tr> </tr>");
out.println("  </table>");
out.println("  <p>&nbsp; </p>");
out.println("</div>");
out.println("</div></body>");
out.println("</html>");
       out.flush();
    



   }
 }
