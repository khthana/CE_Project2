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

public class Category extends HttpServlet {
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
    if(ck.IsCookies(request)){
            System.err.println("found");
    }
    else{
            System.err.println("not found");
            response.sendRedirect("error/nocookie.html");
    }


    //connect to database ==============================================================
    String col = "";
    DataBase db = new DataBase();
    db.connect("LYS","surapunassaratt","jdbc:db2:TF");
    ResultSet rs = db.getResultSet("SELECT CATEGORY.SUB1 FROM LYS.CATEGORY AS CATEGORY GROUP BY CATEGORY.SUB1 ORDER BY CATEGORY.SUB1 ASC");

    out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">" + "\n" +
"<html>" + "\n" +
"<head>" + "\n" +
"<title>Upload</title>" + "\n" +
"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">" + "\n" +
"</head>" + "\n" +

"<body bgcolor=\"#B5E4FB\">" + "\n" +
"<table width=\"100%\" height=\"492\" border=\"0\" cellspacing=\"0\">" + "\n" +
  "<tr>" + "\n" +
    "<td width=\"13%\" height=\"458\" valign=\"top\" bgcolor=\"#FFFFCC\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" + "\n" +
        "<tr> " + "\n" +
          "<td height=\"46\" align=\"center\"><img src=\"pic/main/search.jpg\" width=\"116\" height=\"20\" vspace=\"5\"></td>" + "\n" +
        "</tr>" + "\n" +
        "<tr> " + "\n" +
          "<td align=\"center\">&nbsp;</td>" + "\n" +
        "</tr>" + "\n" +
        "<tr> " + "\n" +
          "<td align=\"center\"><form name=\"form1\" method=\"post\" action=\"search\">" + "\n" +
              "<p> " + "\n" +
                "<input name=\"textfield4\" type=\"text\" size=\"15\">" + "\n" +
              "</p>" + "\n" +
              "<p> " + "\n" +
                "<input type=\"submit\" name=\"Submit2\" value=\"Submit\">" + "\n" +
              "</p>" + "\n" +
            "</form></td>" + "\n" +
        "</tr>" + "\n" +
        "<tr> " + "\n" +
          "<td align=\"center\">&nbsp;</td>" + "\n" +
        "</tr>" + "\n" +
      "</table></td>" + "\n" +
    "<td width=\"73%\" align=\"center\" valign=\"top\" bgcolor=\"#FFFFFF\"><form name=\"form2\" method=\"post\" action=\"login\">" + "\n" +
        "<table border =0 width = 95% cellpadding = 5 cellspacing = 1>" + "\n" +
          "<tr> " + "\n" +
            "<td colspan = 9 bgcolor = #CC99FF><font size=\"2\"><b>Step 1 - Category</b></font></td>" + "\n" +
          "</tr>" + "\n" +
          "<tr bgcolor =  #E2E2E2> " + "\n" +
            "<td colspan = 9 align = center><font size=\"2\">Please Select Category</font></td>" + "\n" +
          "</tr>" + "\n" +
        "</table>" + "\n" +
        "<!-- Category-->" + "\n" +
        "<table cellpadding = 1 cellspacing = 1 align = center  width = 95% bgcolor =  #E2E2E2>");

         //add dynamic====================================================================
         int i=0;
         try{
           while ( (i < 5) && (rs.next())) {
             if (i == 0) {
               out.println("<tr>");
             }
             try {
               col = rs.getString("SUB1");
               out.println("<td align =\"center\"> <a href = subcategory?category=" +
                           col + "><img src=\"pic/" +
                           col.toLowerCase() +
                           ".jpg\" width=\"100\" height=\"30\" border=1 alt=\"" +
                           col.toLowerCase() + "\"></a></td>");
             }

             catch (Exception e) {
               out.println("SQLError<BR>");
               System.err.println(e);
             }
             ++i;
             if (i == 5) {
               out.println("</tr>");
               i = 0;
             }
           }
         }
         catch(Exception e){
           out.println("ERROR SQL");
         }
         //rs.close();
         db.disconnect();
         /*
          "<tr> " + "\n" +
            "<td align=\"center\"><a href = \"animation.html?category=animation\"><img src=\"pic/Animation.jpg\" width=\"100\" height=\"30\" border=1 alt=\"Animation\"></a> " + "\n" +
            "</td>" + "\n" +
            "<td align=\"center\"></a><a href = \"doc.html?category=document\"><img src=\"pic/Document.jpg\" width=\"100\" height=\"30\" border=1 alt=\"Document\"></a><a href = \"new.html\"></a> " + "\n" +
                        "</td>" + "\n" +
            "<td align=\"center\"></a><a href = \"game.html?category=game\"><img src=\"pic/Game.jpg\" width=\"100\" height=\"30\" border=1 alt=\"Game\"></a> " + "\n" +
            "</td>" + "\n" +
            "<td align=\"center\"></a><a href = \"image.html?category=image\"><img src=\"pic/Image.jpg\" width=\"100\" height=\"30\" border=1 alt=\"Image\"></a> " + "\n" +
            "</td>" + "\n" +
            "<td align=\"center\"><a href = \"music.html?category=music\"><img src=\"pic/Music.jpg\" width=\"100\" height=\"30\" border=1 alt=\"Music\"></a> " + "\n" +
            "</td>" + "\n" +
          "</tr>" + "\n" +
          */


         out.println("</table>" + "\n" +
      "</form></td>" + "\n" +
      /*
    "<td width=\"13%\" valign=\"top\" bgcolor=\"#FFFFCC\"><form action=\"login\" method=\"post\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"5\">" + "\n" +
        "<tr> " + "\n" +
          "<td align=\"center\"><img src=\"pic/main/login.jpg\" width=\"116\" height=\"20\"></td>" + "\n" +
        "</tr>" + "\n" +
        "<tr> " + "\n" +
          "<td height=\"137\" align=\"center\">" + "\n" +
              "<p> <font size=\"1\">UserName</font><br>" + "\n" +
                "<input type=\"text\" name=\"textfield22\" size=\"15\">" + "\n" +
                "<br>" + "\n" +
                "<font size=\"1\">PassWord</font><br>" + "\n" +
                "<input name=\"textfield32\" type=\"password\" value=\"\" size=\"15\">" + "\n" +
                "<br>" + "\n" +
                "<input name=\"Button2\" type=\"button\" value=\"Login\">" + "\n" +
              "</p>" + "\n" +
            "</td>" + "\n" +
        "</tr>" + "\n" +
        "<tr> " + "\n" +
          "<td align=\"left\">&nbsp;</td>" + "\n" +
        "</tr>" + "\n" +
      "</table></form></td>" + "\n" +
                */
  "</tr>" + "\n" +
"</table>" + "\n" +
"</body>" + "\n" +
"</html>");

 }
  //Clean up resources
  public void destroy() {
  }
}