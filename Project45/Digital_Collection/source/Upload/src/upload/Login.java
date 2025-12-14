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

public class Login extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=MS874";
    //Initialize global variables
    public void init() throws ServletException {
    }

    //Process the HTTP Get request
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws
        ServletException, IOException {
      response.setContentType(CONTENT_TYPE);
      PrintWriter out = response.getWriter();


      String name = "Please Login";
      String grant = "";
      CheckCookies ck = new CheckCookies();
      Cookie[] cookies = request.getCookies();
      if (ck.IsCookies(request)) {
          System.err.println("found");
          name = ck.getCookieValue(cookies,"UserName");
          grant = ck.getCookieValue(cookies,"Grant");
          System.err.println(name+"    "+grant);

      }
      else {
          System.err.println("not found");
          response.sendRedirect("error/nocookie.html");
      }



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
      "<p>&nbsp;</p></td>"+"\n"+
    "<td valign=\"top\" bgcolor=\"#FFFFFF\"><center>");

//spacial for admin
        if(grant.compareTo("admin")==0){
out.println(
    "<p><a href=\"createcategory\"><img src=\"pic/main/createcat.jpg\" width=\"125\" height=\"20\" border=\"1\"></a>"+"\n"+
      "<a href=\"deletecategory\"><img src=\"pic/main/deletecat.jpg\" width=\"125\" height=\"20\" border=\"1\">"+"\n"+
      "</a><a href=\"createadmin\"><img src=\"pic/main/createaddmin.jpg\" width=\"125\" height=\"20\" border=\"1\"></a></p>");
        }

out.println(
        "<table width = 96% align=\"center\" bgcolor = #3399FF>"+"\n"+
          "<tr> "+"\n"+
            "<td> <table width = 100%  border = 0 align=\"center\" bgcolor = #FFFFFF>"+"\n"+
                "<tr align =center>"+"\n"+
                  "<td> <br>"+"\n"+
                    "<h1>Hi  <font color=\"#00CC00\">"+name+"</font>,Welcome to Digital Collections</h1>"+"\n"+
                    "<div align=\"center\"></div></td>"+"\n"+
                "</tr>"+"\n"+
              "</table></td>"+"\n"+
          "</tr>"+"\n"+
        "</table>"+"\n"+
        "<p>&nbsp;</p>"+"\n"+
        "<p><img src=\"pic/digital/cd.jpg\" width=\"207\" height=\"200\"><img src=\"pic/digital/border.jpg\" width=\"184\" height=\"350\">"+"\n"+
        "<img src=\"pic/digital/manyCameras5.jpg\" width=\"255\" height=\"192\"></p>"+"\n"+
        "</center>"+"\n"+

  "</tr>"+"\n"+
"</table>"+"\n"+
"</body>"+"\n"+
"</html>");

    }


    //Process the HTTP Post request
    public void doPost(HttpServletRequest request,
                       HttpServletResponse response) throws
        ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();

        //int time = 24 * 60 * 60; //maxage
        int time = 5*60*60;

        String name = request.getParameter("name");
        String password = request.getParameter("password");

        String grant = "";
        //connect to db=======================================================
        DataBase db = new DataBase();
        db.connect("LYS", "surapunassaratt", "jdbc:db2:TF");
        ResultSet rs = db.getResultSet(
            "SELECT * FROM LYS.MEMBER AS MEMBER WHERE USERNAME = '" +
            name + "' and PASSWORD = '" + password + "'");

        System.out.println(
            "SELECT * FROM LYS.MEMBER AS MEMBER WHERE USERNAME = '" +
            name + "' and PASSWORD = '" + password + "'");

        try {
            if (rs.wasNull()) {
                rs.next();
                grant = rs.getString("GRANT");
                System.err.println(grant);
                //add cookie name
                Cookie ck = new Cookie("UserName", name);
                ck.setMaxAge(time);
                response.addCookie(ck);

                //add cookie grant
                ck = new Cookie("Grant", grant);
                ck.setMaxAge(time);
                response.addCookie(ck);
                System.err.println(grant);
                rs.close();
                db.disconnect();

                response.sendRedirect("login");
            }
           /* else {
                //login success
                Cookie ck = new Cookie("UserName", name);
                ck.setMaxAge(time);
                response.addCookie(ck);

                rs.next();
                grant = rs.getString("GRANT");
                ck = new Cookie("Grant", grant);
                ck.setMaxAge(time);
                response.addCookie(ck);

                rs.close();
                db.disconnect();
                response.sendRedirect("error/login.html");
            }*/
        } catch (Exception e) {
            System.err.println("login was null");
            System.out.println(e);
            db.disconnect();
            response.sendRedirect("error/loginerr.html");
        }

        db.disconnect();

        out.println("<html>");
        out.println("<head><title>Login</title></head>");
        out.println("<body bgcolor=\"#ffffff\">");
        out.println(
            "<p>The servlet has received a POST. This is the reply.</p>");
        out.println("</body></html>");
    }


    //Clean up resources
    public void destroy() {
    }
}