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

public class Search extends HttpServlet {

    private static final String CONTENT_TYPE = "text/html; charset=MS874";
    //Initialize global variables
    public void init() throws ServletException {

    }

    //Process the HTTP Get request
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();

        String keyword = "";
            keyword = request.getParameter("textfield");
       if(isnull(keyword)){
           response.sendRedirect("error/nocookie.html");
       }else{

       SearchAgent sa = new SearchAgent();

       if(sa.Search(keyword)){
           System.out.println("have");
       }
       else{
           System.out.println("no have");
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
           "<td align=\"center\"><input name=\"hidden\" type=\"hidden\" id=\"hidden\" value=\"subcategory\"></td>"+"\n"+
         "</tr>"+"\n"+
       "</table>"+"\n"+
     "</form>"+"\n"+
     "<p>&nbsp;</p></td>"+"\n"+
   "<td width=\"87%\" valign=\"top\" bgcolor=\"#FFFFFF\"><center>"+"\n"+
       "<table width = 96% align=\"center\" bgcolor = #3399FF>"+"\n"+
         "<tr> "+"\n"+
           "<td> <table width = 100%  border = 0 align=\"center\" bgcolor = #FFFFFF>"+"\n"+
               "<tr align =center> "+"\n"+
                 "<td> <br> "+"\n"+
                   "<h1>Search Result</h1>"+"\n"+
                   "<div align=\"center\"></div></td>"+"\n"+
               "</tr>"+"\n"+
             "</table></td>"+"\n"+
         "</tr>"+"\n"+
       "</table>"+"\n"+
       "<p>&nbsp;</p>"+"\n"+
       "<!-- add show table here -->"+"\n"+

       "<table width=\"96%\" border=\"1\" align=\"center\" cellspacing=\"0\" bordercolor=\"#000000\">"+"\n"+
        "<tr> "+"\n"+
           "<td><table width=\"100%\" border=\"1\" cellspacing=\"0\" bordercolor=\"#FFFFFF\">"+"\n"+
               "<tr align=\"center\" bgcolor=\"#CC99FF\"> "+"\n"+
                 "<td width=\"200\"><font size=\"2\"><strong>&nbsp;FileName</strong></font></td>"+"\n"+
                 "<td width=\"101\"><font size=\"2\"><strong>TITLE</strong></font></td>"+"\n"+
                 "<td width=\"98\"><font size=\"2\"><strong>Author</strong></font></td>"+"\n"+
                 "<td width=\"88\"><font size=\"2\"><strong>Category</strong></font></td>"+"\n"+
                 "<td width=\"225\"><font size=\"2\"><strong>Description</strong></font></td>"+"\n"+
                 "<td width=\"83\"><font size=\"2\"><strong>Action</strong></font></td>"+"\n"+
               "</tr>");

   for(int i=0;i<sa.getNumber();i++){
   out.println(
               "<tr align=\"center\" bgcolor=\"#E2E2E2\"> "+"\n"+
                 "<td align=\"left\"><font size=\"2\">"+sa.getString(i,"FILENAME")+"</font></td>"+"\n"+
                 "<td><font size=\"2\">"+sa.getString(i,"TITLE")+"</font></td>"+"\n"+
                 "<td><font size=\"2\">"+sa.getString(i,"AUTHOR")+"</font></td>"+"\n"+
                 "<td><font size=\"2\">"+sa.getString(i,"CATEGORY")+"</font></td>"+"\n"+
                 "<td align=\"left\"><font size=\"2\">"+sa.getString(i,"DESCRIPTION")+"</font></td>"+"\n"+
                 "<td><font size=\"2\"> <a href=\"save/"+sa.getString(i,"CATEGORY")+"/"+sa.getString(i,"FILENAME")+"\">Download</a></font></td>"+"\n"+
               "</tr>");
   }
   out.println(
             "</table></td>"+"\n"+
         "</tr>"+"\n"+
       "</table>"+"\n"+
       "<!-- end show table-->"+"\n"+
       "<p>&nbsp;</p>"+"\n"+
       "</center>"+"\n"+

 "</tr>"+"\n"+
"</table>"+"\n"+
"</body>"+"\n"+
"</html>");
       }
    }
    //Process the HTTP Post request
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        String keyword = request.getParameter("textfield");
        if (isnull(keyword)) {
            response.sendRedirect("error/nocookie");
        }
        else {

            SearchAgent sa = new SearchAgent();

            if (sa.Search(keyword)) {
                System.out.println("have");
            }
            else {
                System.out.println("no have");
            }

            out.println(
                "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">" +
                "\n" +
                "<html>" + "\n" +
                "<head>" + "\n" +
                "<title>Browse</title>" + "\n" +
                "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\"></head>" +
                "\n" +

                "<body bgcolor=\"#B5E4FB\">" + "\n" +
                "<table width=\"100%\" height=\"450\" border=\"0\" align=\"center\" cellspacing=\"0\">" +
                "\n" +
                "<tr> " + "\n" +
                "<td width=\"13%\" valign=\"top\" bgcolor=\"#FFFFCC\"> <form action=\"search\" method=\"post\" name=\"form1\" >" +
                "\n" +
                "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
                "\n" +
                "<tr> " + "\n" +
                "<td height=\"46\" align=\"center\"><img src=\"pic/main/search.jpg\" width=\"116\" height=\"20\" vspace=\"5\"></td>" +
                "\n" +
                "</tr>" + "\n" +
                "<tr> " + "\n" +
                "<td align=\"center\">&nbsp;</td>" + "\n" +
                "</tr>" + "\n" +
                "<tr> " + "\n" +
                "<td align=\"center\"> <p> " + "\n" +
                "<input name=\"textfield\" type=\"text\" size=\"15\">" + "\n" +
                "</p>" + "\n" +
                "<p> " + "\n" +
                "<input type=\"submit\" name=\"Submit\" value=\"Submit\">" +
                "\n" +
                "</p></td>" + "\n" +
                "</tr>" + "\n" +
                "<tr> " + "\n" +
                "<td align=\"center\"><input name=\"hidden\" type=\"hidden\" id=\"hidden\" value=\"subcategory\"></td>" +
                "\n" +
                "</tr>" + "\n" +
                "</table>" + "\n" +
                "</form>" + "\n" +
                "<p>&nbsp;</p></td>" + "\n" +
                "<td width=\"87%\" valign=\"top\" bgcolor=\"#FFFFFF\"><center>" +
                "\n" +
                "<table width = 96% align=\"center\" bgcolor = #3399FF>" + "\n" +
                "<tr> " + "\n" +
                "<td> <table width = 100%  border = 0 align=\"center\" bgcolor = #FFFFFF>" +
                "\n" +
                "<tr align =center> " + "\n" +
                "<td> <br> " + "\n" +
                "<h1>Search Result</h1>" + "\n" +
                "<div align=\"center\"></div></td>" + "\n" +
                "</tr>" + "\n" +
                "</table></td>" + "\n" +
                "</tr>" + "\n" +
                "</table>" + "\n" +
                "<p>&nbsp;</p>" + "\n" +
                "<!-- add show table here -->" + "\n" +

                "<table width=\"96%\" border=\"1\" align=\"center\" cellspacing=\"0\" bordercolor=\"#000000\">" +
                "\n" +
                "<tr> " + "\n" +
                "<td><table width=\"100%\" border=\"1\" cellspacing=\"0\" bordercolor=\"#FFFFFF\">" +
                "\n" +
                "<tr align=\"center\" bgcolor=\"#CC99FF\"> " + "\n" +
                "<td width=\"200\"><font size=\"2\"><strong>&nbsp;FileName</strong></font></td>" +
                "\n" +
                "<td width=\"101\"><font size=\"2\"><strong>Title</strong></font></td>" +
                "\n" +
                "<td width=\"98\"><font size=\"2\"><strong>Author</strong></font></td>" +
                "\n" +
                "<td width=\"88\"><font size=\"2\"><strong>Category</strong></font></td>" +
                "\n" +
                "<td width=\"225\"><font size=\"2\"><strong>Description</strong></font></td>" +
                "\n" +
                "<td width=\"83\"><font size=\"2\"><strong>Action</strong></font></td>" +
                "\n" +
                "</tr>");

            for (int i = 0; i < sa.getNumber(); i++) {
                out.println(
                    "<tr align=\"center\" bgcolor=\"#E2E2E2\"> " + "\n" +
                    "<td align=\"left\"><font size=\"2\">" +
                    sa.getString(i, "FILENAME") + "</font></td>" + "\n" +
                    "<td><font size=\"2\">" + sa.getString(i, "TITLE") +
                    "</font></td>" + "\n" +
                    "<td><font size=\"2\">" + sa.getString(i, "AUTHOR") +
                    "</font></td>" + "\n" +
                    "<td><font size=\"2\">" + sa.getString(i, "CATEGORY") +
                    "</font></td>" + "\n" +
                    "<td align=\"left\"><font size=\"2\">" +
                    sa.getString(i, "DESCRIPTION") + "</font></td>" + "\n" +
                    "<td><font size=\"2\"> <a href=\"save/" +
                    sa.getString(i, "CATEGORY") + "/" +
                    sa.getString(i, "FILENAME") + "\">Download</a></font></td>" +
                    "\n" +
                    "</tr>");
            }
            out.println(
                "</table></td>" + "\n" +
                "</tr>" + "\n" +
                "</table>" + "\n" +
                "<!-- end show table-->" + "\n" +
                "<p>&nbsp;</p>" + "\n" +
                "</center>" + "\n" +

                "</tr>" + "\n" +
                "</table>" + "\n" +
                "</body>" + "\n" +
                "</html>");
        }
    }

    //Clean up resources
    public void destroy() {
    }
    public boolean isnull(String s){
        try{
            s.length();
        }catch(Exception e){
            System.err.println("word null");
            return true;
        }

        return false;

    }
}