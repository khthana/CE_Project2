package upload;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

import java.sql.*;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class AddDelete extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=MS874";
    //Initialize global variables
    public void init() throws ServletException {
    }
    //Process the HTTP Get request
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();

//check cookies============================================================
        CheckCookies ck = new CheckCookies();
        Cookie[] cookies = request.getCookies();
        if (ck.IsCookies(request)) {
            System.err.println("found");
        }
        else {
            System.err.println("not found");
            response.sendRedirect("error/nocookie.html");
        }

        String category = request.getParameter("category");

        String sub1 = "";
        String sub2 = "";
        String sub3 = "";
        String tmp = "";

        //db connect
        DataBase db = new DataBase();
        db.connect("  ", " ", " ");
        ResultSet rs = null;
        ResultSet rs2 = null;
        ResultSet rs3 = null;

//find resultset=======================================

        if (category != null) {
            tmp = category;
            System.out.println(tmp + "   tmp first");

            if (tmp.indexOf("/") > 0) {
                sub1 = tmp.substring(0, tmp.indexOf("/"));
                rs = db.getResultSet(
                    "SELECT CATEGORY.SUB1 FROM LYS.CATEGORY AS CATEGORY GROUP BY CATEGORY.SUB1");

                if (tmp.length() > 0) {
                    tmp = tmp.substring(tmp.indexOf("/") + 1);
                    System.out.println("tmp1  " + tmp);
                    sub2 = tmp;
                    if (sub2.indexOf("/") >= 0) {
                        sub2 = sub2.substring(0, sub2.indexOf("/"));
                    }
                    else {
                        tmp = "";
                    }
                    rs2 = db.getResultSet(
                        "SELECT CATEGORY.SUB2 FROM LYS.CATEGORY AS CATEGORY WHERE CATEGORY.SUB1 = '" +
                        sub1 + "' GROUP BY CATEGORY.SUB2");

                    if (tmp.length() > 0) {
                        tmp = tmp.substring(tmp.indexOf("/") + 1);
                        System.out.println("tmp2  " + tmp);
                        sub3 = tmp;
                        rs3 = db.getResultSet(
                            "SELECT CATEGORY.SUB3 FROM LYS.CATEGORY AS CATEGORY WHERE CATEGORY.SUB1 = '" +
                            sub1 + "' AND CATEGORY.SUB2 = '" +
                            sub2 + "' GROUP BY CATEGORY.SUB3");
                    }
                }

            }
            else {
                sub1 = tmp;
                rs = db.getResultSet(
                    "SELECT CATEGORY.SUB1 FROM LYS.CATEGORY AS CATEGORY GROUP BY CATEGORY.SUB1");

            }
        }

        System.out.println("ca" + category);
        System.out.println("sub1 " + sub1);
        System.out.println("sub2 " + sub2);
        System.out.println("sub3 " + sub3);


        out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">"+"\n"+
"<html>"+"\n"+
"<head>"+"\n"+
"<title>Browse</title>"+"\n"+
"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\"></head>"+"\n"+

"<body bgcolor=\"#B5E4FB\">"+"\n"+
"<table width=\"100%\" height=\"450\" border=\"0\" align=\"center\" cellspacing=\"0\">"+"\n"+
  "<tr> "+"\n"+
    "<td width=\"13%\" valign=\"top\" bgcolor=\"#FFFFCC\"> <form action=\"search\" method=\"post\" name=\"form1\" >"+"\n"+
        "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"+"\n"+
          "<tr> "+"\n"+
            "<td height=\"46\" align=\"center\"><img src=\"pic/main/search.jpg\" width=\"116\" height=\"20\" vspace=\"5\"></td>"+"\n"+
          "</tr>"+"\n"+
          "<tr> "+"\n"+
            "<td align=\"center\">&nbsp;</td>"+"\n"+
          "</tr>"+"\n"+
          "<tr> "+"\n"+
            "<td align=\"center\"> <p> "+"\n"+
                "<input name=\"textfield\" type=\"text\" size=\"15\">"+"\n"+
              "</p>"+"\n"+
              "<p> "+"\n"+
                "<input type=\"submit\" name=\"Submit\" value=\"Submit\">"+"\n"+
              "</p></td>"+"\n"+
          "</tr>"+"\n"+
          "<tr> "+"\n"+
            "<td align=\"center\">&nbsp;</td>"+"\n"+
          "</tr>"+"\n"+
        "</table>"+"\n"+
      "</form>"+"\n"+
      "<!-- add code here-->");//+"\n"+

//==============================================add code

  //===========================table web========================================
  out.println(
            "<table width=\"100%\" border=\"1\" cellspacing=\"0\" bordercolor=\"#FFFFCC\" bgcolor=\"#99FFCC\">" +"\n" +
              "<tr> " + "\n" +
              "<td height=\"20\" align=\"left\" valign=\"top\" bgcolor=\"#99FFCC\"><font size=\"2\"><a href=\"adddelete?category=///\">MAIN</a></font></td>" +"\n" +
              "</tr>");

  try {
      while (rs.next()) {
          //category
          System.out.println("Loop1     " + rs.getString(1));

          out.println("<tr> " + "\n" +
                      "<td height=\"20\" align=\"left\" valign=\"top\" bgcolor=\"#99FFCC\"><font size=\"2\"><a href=\"adddelete?category=" +
                      rs.getString(1) + "//\">" + rs.getString(1) +
                      "</a></font></td>" + "\n" +
                      "</tr>");

          if (rs.getString(1).compareToIgnoreCase(sub1) == 0) {
              while (rs2.next()) {
                  //subcategory
                  System.out.println("Loop2     " + rs2.getString(1));

                  out.println("<tr> " + "\n" +
                              "<td height=\"20\" align=\"left\" valign=\"top\" bgcolor=\"#CCCCFF\"><blockquote> " +
                              "\n" +
                      "<font size=\"2\"><a href=\"adddelete?category=" +
                      sub1 + "/" + rs2.getString(1) + "/\">" +
                      rs2.getString(1) + "</a></font>" + "\n" +
                      "</blockquote></td>" + "\n" +
                      "</tr>");

                  if (rs2.getString(1).compareToIgnoreCase(sub2) == 0) {
                      while (rs3.next()) {
                          //subcategory
                          System.out.println("Loop3     " +
                              rs3.getString(1));

                          out.println("<tr> " + "\n" +
                                      "<td height=\"20\" align=\"left\" valign=\"top\" bgcolor=\"#CC99FF\"><blockquote> " +
                                      "\n" +
                                      "<blockquote> " + "\n" +
                              "<font size=\"2\"><a href=\"adddelete?category=" +
                              sub1 + "/" + sub2 + "/" + rs3.getString(1) +
                              "\">" + rs3.getString(1) +
                              "</a></font>" + "\n" +
                              "</blockquote>" + "\n" +
                              "</blockquote></td>" + "\n" +
                              "</tr>");

                      } //loop3
                  }

              } //loop2
          }
      }
  } catch (SQLException sqle) {
      System.out.println("sqlexception");
      System.out.println(sqle);
  } catch (Exception ex) {
      System.out.println("exception");
      System.out.println(ex);
  }

//==============================================end code


      out.println("</table>"+"\n"+
      "<!-- end code-->"+"\n"+
      "<p>&nbsp;</p></td>"+"\n"+
    "<td width=\"87%\" valign=\"top\" bgcolor=\"#FFFFFF\"><center>"+"\n"+
    /*
    "<p><a href=\"createcategory\"><img src=\"pic/main/createcat.jpg\" width=\"125\" height=\"20\" border=\"1\"></a>"+"\n"+
      "<a href=\"deletecategory\"><img src=\"pic/main/deletecat.jpg\" width=\"125\" height=\"20\" border=\"1\">"+"\n"+
      "</a><a href=\"createaddmin\"><img src=\"pic/main/createaddmin.jpg\" width=\"125\" height=\"20\" border=\"1\"></a></p>"+"\n"+
     */
        "<table width = 96% align=\"center\" bgcolor = #3399FF>"+"\n"+
          "<tr> "+"\n"+
            "<td> <table width = 100%  border = 0 align=\"center\" bgcolor = #FFFFFF>"+"\n"+
                "<tr align =center> "+"\n"+
                  "<td> <br> "+"\n"+
                    "<h1>Please select category</h1>"+"\n"+
                    "<div align=\"center\"></div></td>"+"\n"+
                "</tr>"+"\n"+
              "</table></td>"+"\n"+
          "</tr>"+"\n"+
        "</table>"+"\n"+
        "<p>&nbsp;</p>"+"\n"+
        //form
        "<form name=\"form2\" method=\"post\" action=\"\">"+"\n"+
       "<table width=\"96%\" border=\"1\" align=\"center\" cellspacing=\"0\" bordercolor=\"#000000\">"+"\n"+
          "<tr> "+"\n"+
            "<td><table width=\"100%\" border=\"1\" cellspacing=\"0\" bordercolor=\"#FFFFFF\">"+"\n"+
            //hidden categoty
              "<input type=\"hidden\" name=\"category\" value=\""+category+"\">"+"\n"+
             "<!-- add show table here -->"+"\n"+
             "<tr align=\"left\" bgcolor=\"#CC99FF\"> "+"\n"+
                    "<td colspan=\"5\"><div align=\"center\"><font size=\"2\"> "+"\n"+
                        "<input name=\"op_delete\" type=\"submit\" id=\"op_delete\" value=\"Delete\">"+"\n"+
                        "</font></div></td>"+"\n"+
                    "<td><font size=\"2\"> "+"\n"+
                      //"<input name=\"search\" type=\"text\" id=\"search\">"+"\n"+
                      //"<input name=\"op_search\" type=\"submit\" id=\"op_search\" value=\"Search\">"+"\n"+
                      "&nbsp;</font> </td>"+"\n"+
                    "<td>&nbsp;</td>"+"\n"+
                  "</tr>"+"\n"+

                  "<tr align=\"center\" bgcolor=\"#CC99FF\"> "+"\n"+
                      "<td width=\"29\"></td>"+"\n"+
                      "<td width=\"206\"><font size=\"2\"><strong>FileName</strong></font></td>"+"\n"+
                      "<td width=\"82\"><font size=\"2\"><strong>Title</strong></font></td>"+"\n"+
                      "<td width=\"68\"><font size=\"2\"><strong>Author</strong></font></td>"+"\n"+
                      "<td width=\"72\"><font size=\"2\"><strong>Category</strong></font></td>"+"\n"+
                      "<td width=\"249\"><font size=\"2\"><strong>Description</strong></font></td>"+"\n"+
                      "<td width=\"83\"><font size=\"2\"><strong>Action</strong></font></td>"+"\n"+
                    "</tr>");

//================================================addd code  show table
    try{
          String query = "";
          if(sub1.compareTo("")!=0){
                query = sub1;
                if(sub2.compareTo("")!=0){
                      query = query.concat("/");
                      query = query.concat(sub2);
                      if(sub3.compareTo("")!=0){
                            query = query.concat("/");
                            query = query.concat(sub3);
                      }
                }
          }
          System.err.println("query   :"+query);
          ResultSet show = db.getResultSet("SELECT * FROM LYS.TXML AS TXML WHERE TXML.CATEGORY = '"+query+"' ORDER BY TXML.FILENAME ASC");
          int i =0;
          while (show.next()) {
             out.println(

                   "<tr align=\"center\" bgcolor=\"#E2E2E2\"> "+"\n"+
                    "<td align=\"left\"><font size=\"2\">&nbsp; "+"\n"+
                      "<input name=\"checkbox"+String.valueOf(i)+"\" type=\"checkbox\" id=\"checkbox1\" value=\""+show.getString("FILENAME")+"\">"+"\n"+
                      "<input name=\""+show.getString("FILENAME")+"\" type=\"hidden\" id=\"Cheeky Girls - Cheeky Song.mp3\" value=\""+show.getString("CATEGORY")+"\">"+"\n"+
                      "</font></td>"+"\n"+
                      "<td align=\"left\"><font size=\"2\">"+show.getString("FILENAME")+"</font></td>" +"\n" +
                  "<td><font size=\"2\">"+show.getString("TITLE")+"</font></td>" +"\n" +
                  "<td><font size=\"2\">"+show.getString("AUTHOR")+"</font></td>" + "\n" +
                  "<td><font size=\"2\">"+show.getString("CATEGORY")+"</font></td>" +"\n" +
                  "<td align=\"left\"><font size=\"2\">"+show.getString("DESCRIPTION")+"</font></td>" +"\n" +
                  //action
                  "<td><font size=\"2\">" +"\n" +
                      "<a href=\"save/"+show.getString("CATEGORY")+"/"+show.getString("FILENAME")+"\">Download</a></font></td>" +"\n" +
                  "</tr>");
            i++;

             }


    }
    catch(Exception ex){
          System.err.println("Exception show table");
          System.err.println(ex);
    }

    db.disconnect();

    out.println(
         "<!-- end show table-->"+"\n"+
              "</table></td>"+"\n"+
          "</tr>"+"\n"+
        "</table>"+"\n"+
          "</form>"+"\n"+
        "<p>&nbsp;</p>"+"\n"+
        "</center>"+"\n"+
  "</tr>"+"\n"+
"</table>"+"\n"+
"</body>"+"\n"+
"</html>");

    }

    //Process the HTTP Post request
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   response.setContentType(CONTENT_TYPE);
   PrintWriter out = response.getWriter();
   out.println("<html>");
   out.println("<head><title>Servlet2</title></head>");
   out.println("<body bgcolor=\"#ffffff\">");
   out.println("<p>The servlet has received a POST. This is the reply.</p>");

   Enumeration enu = request.getParameterNames();
   String reqname = "";
   String reqval = ""; //filename which want to del
   String reqcat = ""; //category of fielnaem
   String realpath = request.getRealPath("/");

   DataBase db = new DataBase();
   db.connect("LYS", "surapunassaratt", "jdbc:db2:TF");
   ResultSet rs = null;

   while (enu.hasMoreElements()) {
       reqname = enu.nextElement().toString();
       if (reqname.startsWith("checkbox")) {
           reqval = request.getParameter(reqname);
           reqcat = request.getParameter(reqval);
           out.println(reqname + "<BR>");
           out.println("val    " + reqval + "<BR>");
           out.println("cate   " + reqcat + "<BR>");
           //select dxxroot id
           rs = db.getResultSet(
               "SELECT TXML.DXXROOT_ID FROM LYS.TXML AS TXML WHERE TXML.FILENAME = '" +
               reqval + "' AND TXML.CATEGORY = '" + reqcat + "'");
           System.err.println(
               "SELECT TXML.DXXROOT_ID FROM LYS.TXML AS TXML WHERE TXML.FILENAME = '" +
               reqval + "' AND TXML.CATEGORY = '" + reqcat + "'");

           try {
               rs.next();
               System.out.println(rs.getString(1));
               db.update("DELETE FROM LYS.XF AS XF WHERE XF.DXXROOT_ID = X'"+rs.getString(1)+"'");
               File f1 = new File(realpath + "save/" + reqcat + "/" +
                                  reqval);
               File f2 = new File(realpath + "save/" + reqcat + "/" +
                                  reqval.substring(0,
                   reqval.lastIndexOf(".")) + ".xml");
               if (f1.delete())
                   System.err.println("f1 del");
               if (f2.delete())
                   System.err.println("f2 del");
               System.out.println(
                   "DELETE FROM LYS.XF AS XF WHERE XF.DXXROOT_ID = X'" +
                   rs.getString(1) + "'");
           } catch (Exception ex) {
               System.out.println("DELETE Error");
               System.err.println(ex);
           }
           System.err.println("Delete file   " + realpath + "save/" +
                              reqcat + "/" +
                              reqval.substring(0, reqval.lastIndexOf(".")) +
                              ".xml");

       }
   }

   db.disconnect();

   out.println("</body></html>");
   String category = request.getParameter("category");
   response.sendRedirect("adddelete?category="+category);
 }

    //Clean up resources
    public void destroy() {
    }
}