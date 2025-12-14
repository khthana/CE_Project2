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

public class SubCategory extends HttpServlet {
  private static final String CONTENT_TYPE = "text/html; charset=MS874";
  //Initialize global variables
  public void init() throws ServletException {
  }
  //Process the HTTP Get request
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType(CONTENT_TYPE);
    PrintWriter out = response.getWriter();
    int row =0;
    boolean first = true;
    String sub2 = "";
    String sub3 = "";
    String tmp2 = "";

    String category = request.getParameter("category");

    //check cookies============================================================
   CheckCookies ck = new CheckCookies();
   Cookie[] cookies = request.getCookies();
   if(ck.IsCookies(request)){
           System.err.println("found");
   }
   else{
           System.err.println("not found");
           response.sendRedirect("error/nocookie.html");
   }


    try{

    out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">" + "\n" +
"<html>" + "\n" +
"<head>" + "\n" +
"<title>Upload Select File</title>" + "\n" +
"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">" + "\n" +
"</head>" + "\n" +

"<body bgcolor=\"#B5E4FB\">" + "\n" +
"<table width=\"100%\" border=\"0\" cellspacing=\"0\">" + "\n" +
  "<tr> " + "\n" +
    "<td width=\"13%\" height=\"1294\" align=\"center\" valign=\"top\" bgcolor=\"#FFFFCC\">" + "\n" +
    "<form name=\"form1\" method=\"post\" action=\"search\">" + "\n" +
    "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" + "\n" +
        "<tr> " + "\n" +
          "<td height=\"46\" align=\"center\"><img src=\"pic/main/search.jpg\" width=\"116\" height=\"20\" vspace=\"5\"></td>" + "\n" +
        "</tr>" + "\n" +
        "<tr> " + "\n" +
          "<td align=\"center\">&nbsp;</td>" + "\n" +
        "</tr>" + "\n" +
        "<tr> " + "\n" +
          "<td align=\"center\">" + "\n" +
              "<p> " + "\n" +
                "<input name=\"textfield\" type=\"text\" size=\"15\">" + "\n" +
              "</p>" + "\n" +
              "<p> " + "\n" +
                "<input type=\"submit\" name=\"Submit2\" value=\"Submit\">" + "\n" +
              "</p>" + "\n" +
            "</td>" + "\n" +
        "</tr>" + "\n" +
        "<tr> " + "\n" +
          "<td align=\"center\">&nbsp;</td>" + "\n" +
        "</tr>" + "\n" +
      "</table></form>" + "\n" +
      "</td>" + "\n" +
    "<td width=\"73%\" align=\"center\" valign=\"top\" bgcolor=\"#FFFFFF\"><form action=\"savefile\" method=\"post\" enctype=\"multipart/form-data\" name=\"login\">" + "\n" +
        "<p> " + "\n" +
//hidden subcategory
        "<input name=\"hidden\" type=\"hidden\" id=\"hidden\" value=\""+category+"\">" + "\n" +

        "<table border =0 width = 95% cellpadding = 5 cellspacing = 1>" + "\n" +
          "<tr> " + "\n" +
            "<td colspan = 2 bgcolor = #CC99FF><font size=\"2\"><b>Step 1 - Category</b></font></td>" + "\n" +
          "</tr>" + "\n" +
          "<tr bgcolor =  #E2E2E2> " + "\n" +
            "<td width = 25%><font size=\"2\">Category :</font></td>" + "\n" +
            //Edit dynamic here ======================================================================
            "<td ><font size=\"2\"><img src=\"pic/"+category.toLowerCase()+".jpg\" width=\"100\" height=\"30\" border=0 alt=\"\"> " + "\n" +
              "<a href = \"category\"> <img src=\"pic/back.gif\" width=\"100\" height=\"30\" border=0 alt=\"\"></a> " + "\n" +
              "</font></td>" + "\n" +
          "</tr>" + "\n" +
        "</table>" + "\n" +
        "<p> " + "\n" +
          "<!-- category -->" + "\n" +
        "<table border =0 width = 95% cellpadding = 5 cellspacing = 1>" + "\n" +
          "<tr> " + "\n" +
            "<td colspan = 2 bgcolor = #CC99FF><b><font size=\"2\">Step 2 - Sub Category</font></b></td>" + "\n" +
          "</tr>" + "\n" +
          "<tr bgcolor =  #E2E2E2> " + "\n" +
            "<td colspan = 2 align = center><font size=\"2\"><strong>Please Select Sub Category </strong></font></td>" + "\n" +
          "</tr>");
         //dynamic here====================================================================
         DataBase db = new DataBase();
         db.connect("LYS","surapunassaratt","jdbc:db2:TF");
         ResultSet rs = db.getResultSet("SELECT * FROM LYS.CATEGORY AS CATEGORY WHERE SUB1 = '"+category+"' ORDER BY CATEGORY.SUB1 ASC, CATEGORY.SUB2 ASC, CATEGORY.SUB3 ASC");
         //out.println("SELECT * FROM LYS.CATEGORY AS CATEGORY WHERE SUB1 = '"+category+"' ORDER BY CATEGORY.SUB1 ASC, CATEGORY.SUB2 ASC, CATEGORY.SUB3 ASC");

         try{
             while (rs.next()) {
                 sub2 = "";
                 sub3 = "";
                 sub2 = rs.getString("SUB2");
                 sub3 = rs.getString("SUB3");

                 //dont print for first time
                 //tmp2 point to old position
                 if (tmp2.compareTo(sub2) != 0 && ! (first)) {
                     out.println(
                         "</select>" + "\n" +
                         "</font></td>" + "\n" +
                         "</tr>");
                 }
                 first = false;

                 if (tmp2.compareTo(sub2) == 0) {
                     out.print(
                         "<option value = \"" + category + "/" + sub2);
                     if (sub3.compareTo("none") == 0) {
                         out.println("\">None</option>");
                     }
                     else {
                         out.println("/" + sub3 + "\">" + sub3 + "</option>");
                     }
                 }
                 else {
                     out.println(
                         "<tr bgcolor =  #E2E2E2> " + "\n" +
                         "<td width = 30%><font size=\"2\"> " + "\n" +
                         "<input type=\"radio\" name=\"subcategory\" value = \"" +
                         sub2 + "\">" + "\n" +
                         sub2 + "</font></td>" + "\n" +
                         "<td> <font size=\"2\"> " + "\n" +
                         "<select name=\"" + sub2
                         + "\">");

                     out.print(
                         "<option value = \"" + category + "/" + sub2);
                     if (sub3.compareTo("none") == 0) {
                         out.println("\">None</option>");
                     }
                     else {
                         out.println("/" + sub3 + "\">" + sub3 + "</option>");
                     }
                 }

                 tmp2 = sub2;
           }
           rs.close();
         }
         catch(Exception e){
           out.println("ERROR");
           System.err.println(e);
         }
         db.disconnect();
         /*
          "<tr bgcolor =  #E2E2E2> " + "\n" +
            "<td width = 30%><font size=\"2\"> " + "\n" +
              "<input type=\"radio\" name=\"subcategory\" value = \"alpha\">" + "\n" +
              "Alphabet</font></td>" + "\n" +
            "<td> <font size=\"2\"> " + "\n" +
              "<select name=\"alpha\">" + "\n" +
                "<option value = \"Animation/Alphabet\">None</option>" + "\n" +
              "</select>" + "\n" +
              "</font></td>" + "\n" +
          "</tr>" + "\n" +

          "<tr bgcolor =  #E2E2E2> " + "\n" +
            "<td width = 30%><font size=\"2\"> " + "\n" +
              "<input type=\"radio\" name=\"subcategory\" value = \"animal\">" + "\n" +
              "Animal</font></td>" + "\n" +
            "<td> <font size=\"2\"> " + "\n" +
              "<select name=\"animal\">" + "\n" +
                "<option value = \"Animation/Animal\">None</option>" + "\n" +
              "</select>" + "\n" +
              "</font></td>" + "\n" +
          "</tr>" + "\n" +
          */
          out.println("</table>" + "\n" +
        "<p></p>" + "\n" +
        "<p> " + "\n" +
        "<table border = 0 width = 95% cellpadding = 5 cellspacing = 1>" + "\n" +
          "<tr> " + "\n" +
            "<td colspan = 2 bgcolor = #CC99FF><font size=\"2\"><b>Step 3 - Sender</b></font></td>" + "\n" +
          "</tr>" + "\n" +
          "<tr bgcolor = #E2E2E2> " + "\n" +
            "<td width = 25% ><strong><font size=\"2\">Title :</font></strong></td>" + "\n" +
            "<td><font size=\"2\"> " + "\n" +
              "<input type = \"TEXT\" name = \"title\" size = \"60\">" + "\n" +
              "</font></td>" + "\n" +
          "</tr>" + "\n" +
          "<tr bgcolor =  #E2E2E2> " + "\n" +
            "<td><strong><font size=\"2\">Author :</font></strong></td>" + "\n" +
            "<td><font size=\"2\"> " + "\n" +
              "<input type = \"TEXT\" name = \"author\" size = \"30\">" + "\n" +
              "</font></td>" + "\n" +
          "</tr>" + "\n" +
          "<tr bgcolor =  #E2E2E2> " + "\n" +
            "<td><strong><font size=\"2\">E-mail :</font></strong></td>" + "\n" +
            "<td><font size=\"2\"> " + "\n" +
              "<input type = \"TEXT\" name = \"email\" size = \"30\">" + "\n" +
              "</font></td>" + "\n" +
          "</tr>" + "\n" +
        "</table>" + "\n" +
        "<p></p>" + "\n" +
        "<p> " + "\n" +
        "<table border =0 width = 95% cellpadding = 5 cellspacing = 1>" + "\n" +
          "<tr> " + "\n" +
            "<td colspan = 2 bgcolor = #CC99FF><b><font size=\"2\">Step 4 - File Description</font></b></td>" + "\n" +
          "</tr>" + "\n" +
          "<tr bgcolor =  #E2E2E2> " + "\n" +
            "<td width = 25%><font size=\"2\"><strong>Description :</strong></font></td>" + "\n" +
            "<td><font size=\"2\"> " + "\n" +
              "<textarea name = \"description\" rows = \"4\" cols = \"40\"></textarea>" + "\n" +
              "</font></td>" + "\n" +
          "</tr>" + "\n" +
        "</table>" + "\n" +
        "<p></p>" + "\n" +
        "<table width=\"95%\" border=\"0\" cellspacing=\"1\" cellpadding=\"5\">" + "\n" +
          "<tr bgcolor=\"#CC99FF\"> " + "\n" +
            "<td colspan=\"3\"><font size=\"2\"><strong>Step 5 - Upload the file</strong></font></td>" + "\n" +
          "</tr>" + "\n" +
          "<tr bgcolor=\"#E2E2E2\"> " + "\n" +
            "<td width=\"30%\"><font size=\"2\"><strong>File name :</strong></font></td>" + "\n" +
            "<td width=\"70%\" colspan=\"2\"><font size=\"2\"> " + "\n" +
              "<input name=\"filename\" type=\"file\" id=\"filename2\">" + "\n" +
              "</font></td>" + "\n" +
          "</tr>" + "\n" +
          "<tr bgcolor=\"#E2E2E2\"> " + "\n" +
            "<td><font size=\"2\">&nbsp;</font></td>" + "\n" +
            "<td align=\"center\" bgcolor=\"#E2E2E2\"><font size=\"2\"> " + "\n" +
              "<input name=\"Submit\" type=\"submit\" id=\"Submit2\" value=\"Submit\">" + "\n" +
              "</font></td>" + "\n" +
            "<td align=\"center\" bgcolor=\"#E2E2E2\"><font size=\"2\"> " + "\n" +
              "<input name=\"Reset\" type=\"reset\" id=\"Reset3\" value=\"Reset\">" + "\n" +
              "</font></td>" + "\n" +
          "</tr>" + "\n" +
        "</table>" + "\n" +
      "</form></td>" + "\n" +
    "<td width=\"13%\" align=\"center\" valign=\"top\" bgcolor=\"#FFFFCC\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"5\">" + "\n" +
        "<tr> " + "\n" +
          "<td align=\"center\"><img src=\"pic/main/login.jpg\" width=\"116\" height=\"20\"></td>" + "\n" +
        "</tr>" + "\n" +
        "<tr> " + "\n" +
          "<td height=\"137\" align=\"center\"><form action=\"\" method=\"get\">" + "\n" +
              "<p> <font size=\"1\">UserName</font><br>" + "\n" +
                "<input type=\"text\" name=\"textfield2\" size=\"15\">" + "\n" +
                "<br>" + "\n" +
                "<font size=\"1\">Password</font> <br>" + "\n" +
                "<input name=\"textfield3\" type=\"password\" value=\"\" size=\"15\">" + "\n" +
                "<br>" + "\n" +
                "<input name=\"Button\" type=\"button\" value=\"Login\">" + "\n" +
              "</p>" + "\n" +
            "</form></td>" + "\n" +
        "</tr>" + "\n" +
        "<tr> " + "\n" +
          "<td align=\"left\">&nbsp;</td>" + "\n" +
        "</tr>" + "\n" +
      "</table></td>" + "\n" +
  "</tr>" + "\n" +
"</table>" + "\n" +
"</body>" + "\n" +
"</html>" );
     }
     catch(Exception e){
       response.sendRedirect("error/nocookie.html");
     }
  }
  //Clean up resources
  public void destroy() {
  }
}