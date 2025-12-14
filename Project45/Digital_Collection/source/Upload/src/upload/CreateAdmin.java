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

public class CreateAdmin extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=MS874";
    //Initialize global variables
    public void init() throws ServletException {
    }
    //Process the HTTP Get request
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">"+"\n"+
"<html>"+"\n"+
"<head>"+"\n"+
"<title>SignUp</title>"+"\n"+
"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\"></head>"+"\n"+

"<body bgcolor=\"#B5E4FB\">"+"\n"+
"<table width=\"100%\" height=\"450\" border=\"0\" align=\"center\" cellspacing=\"0\">"+"\n"+
  "<tr>"+"\n"+
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
    "<td valign=\"top\" bgcolor=\"#FFFFFF\"><center>"+"\n"+
        "<p><a href=\"createcategory\"><img src=\"pic/main/createcat.jpg\" width=\"125\" height=\"20\" border=\"1\"></a>"+"\n"+
              "<a href=\"deletecategory\"><img src=\"pic/main/deletecat.jpg\" width=\"125\" height=\"20\" border=\"1\"></a>"+"\n"+
        "</p>"+"\n"+
        "<form name=\"form2\" method=\"post\" action=\"createadmin\">"+"\n"+
          "<table width=\"55%\" border=\"1\" cellpadding=\"5\" cellspacing=\"0\" bordercolor=\"#FFFFFF\" bgcolor=\"#CCCCFF\">"+"\n"+
            "<tr align=\"left\"> "+"\n"+
              "<td width=\"30%\"><font size=\"2\">Admin name</font></td>"+"\n"+
              "<td colspan=\"2\" align=\"left\"><font size=\"2\"> "+"\n"+
                "<input name=\"addminname\" type=\"text\" id=\"addminname\">"+"\n"+
                "</font></td>"+"\n"+
            "</tr>"+"\n"+
            "<tr align=\"left\"> "+"\n"+
              "<td width=\"30%\"><font size=\"2\">Password</font></td>"+"\n"+
              "<td colspan=\"2\" align=\"left\"><font size=\"2\"> "+"\n"+
                "<input name=\"addminpass\" type=\"text\" id=\"addminpass\">"+"\n"+
                "</font></td>"+"\n"+
            "</tr>"+"\n"+
            "<tr align=\"left\"> "+"\n"+
              "<td><font size=\"2\">New admin</font></td>"+"\n"+
              "<td colspan=\"2\" align=\"left\"><font size=\"2\"> "+"\n"+
                "<input name=\"name\" type=\"text\" id=\"name3\">"+"\n"+
                "</font></td>"+"\n"+
            "</tr>"+"\n"+
            "<tr align=\"left\"> "+"\n"+
              "<td><font size=\"2\">Email</font></td>"+"\n"+
              "<td colspan=\"2\" align=\"left\"><font size=\"2\"> "+"\n"+
                "<input name=\"email\" type=\"text\" id=\"email\">"+"\n"+
                "</font></td>"+"\n"+
            "</tr>"+"\n"+
            "<tr align=\"left\"> "+"\n"+
              "<td height=\"25\"><font size=\"2\">Password</font></td>"+"\n"+
              "<td colspan=\"2\" align=\"left\"><font size=\"2\"> "+"\n"+
                "<input name=\"password\" type=\"password\" id=\"password\">"+"\n"+
                "</font></td>"+"\n"+
            "</tr>"+"\n"+
            "<tr align=\"left\"> "+"\n"+
              "<td><font size=\"2\">Retype Password</font></td>"+"\n"+
              "<td colspan=\"2\" align=\"left\"><font size=\"2\"> "+"\n"+
                "<input name=\"password2\" type=\"password\" id=\"password2\">"+"\n"+
                "</font></td>"+"\n"+
            "</tr>"+"\n"+
            "<tr align=\"left\"> "+"\n"+
              "<td><font size=\"2\">&nbsp;</font></td>"+"\n"+
              "<td width=\"16%\"><font size=\"2\"> "+"\n"+
                "<input type=\"submit\" name=\"Submit2\" value=\"Submit\">"+"\n"+
                "</font></td>"+"\n"+
              "<td width=\"54%\"><font size=\"2\"> "+"\n"+
                "<input type=\"reset\" name=\"Submit3\" value=\"Reset\">"+"\n"+
                "</font></td>"+"\n"+
            "</tr>"+"\n"+
          "</table>"+"\n"+
        "</form>"+"\n"+
        "<p><img src=\"pic/xml.gif\" width=\"200\" height=\"203\"></p>"+"\n"+
      "</center>"+"\n"+

  "</tr>"+"\n"+
"</table>"+"\n"+
"</body>"+"\n"+
"</html>");
    }


    //Process the HTTP Post request
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws
        ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();

        String admin = request.getParameter("addminname");
        String passmin = request.getParameter("addminpass");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");



        if ( !(CheckAdmin(admin,passmin))||(!CheckEmail(email)) || (!CheckPass(password, password2, name)) || (!CheckName(name))) {

        out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">"+"\n"+
"<html>"+"\n"+
"<head>"+"\n"+
"<title>SignUp</title>"+"\n"+
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
    "<td valign=\"top\" bgcolor=\"#FFFFFF\"><center>"+"\n"+
        "<p><a href=\"createcategory\"><img src=\"pic/main/createcat.jpg\" width=\"125\" height=\"20\" border=\"1\"></a>"+"\n"+
              "<a href=\"deletecategory\"><img src=\"pic/main/deletecat.jpg\" width=\"125\" height=\"20\" border=\"1\"></a>"+"\n"+
        "</p>"+"\n"+
        "<form name=\"form2\" method=\"post\" action=\"createadmin\">"+"\n"+
          "<table width=\"55%\" border=\"1\" cellpadding=\"5\" cellspacing=\"0\" bordercolor=\"#FFFFFF\" bgcolor=\"#CCCCFF\">"+"\n"+
            "<tr align=\"left\"> "+"\n"+
              "<td width=\"30%\"><font size=\"2\">Admin name</font></td>"+"\n"+
              "<td colspan=\"2\" align=\"left\"><font size=\"2\"> ");
              //"<input name=\"addminname\" type=\"text\" id=\"addminname\">");
//adminame fail
  if (!CheckAdmin(admin,passmin)) {
             admin = "";
             out.println(
                 "<input name=\"addminname\" type=\"text\" id=\"addminname\" value = \"" +
                 admin + "\">");
             out.println(
                 "<font color=\"#FF0000\"><strong>Adminame or Password error</strong></font> ");
         }
         else {
             out.println(
                 "<input name=\"addminname\" type=\"text\" id=\"addminame\" value = \"" +
                 admin + "\">");
         }


out.println(
            "</font></td>"+"\n"+
            "</tr>"+"\n"+
            "<tr align=\"left\"> "+"\n"+
              "<td width=\"30%\"><font size=\"2\">Password</font></td>"+"\n"+
              "<td colspan=\"2\" align=\"left\"><font size=\"2\"> "+"\n"+
                "<input name=\"addminpass\" type=\"text\" id=\"addminpass\">"+"\n"+
                "</font></td>"+"\n"+
            "</tr>"+"\n"+
            "<tr align=\"left\"> " + "\n" +
            "<td width=\"30%\"><font size=\"2\">New Admin</font></td>" +
            "\n" +
            "<td colspan=\"2\" align=\"left\"><font size=\"2\"> "); // + "\n"+
        // "<input name=\"name\" type=\"text\" id=\"name3\" value = \""+name+"\">");
// name false
        if (!CheckName(name)) {
            name = "";
            out.println(
                "<input name=\"name\" type=\"text\" id=\"name3\" value = \"" +
                name + "\">");
            out.println(
                "<font color=\"#FF0000\"><strong>Invalid Name.</strong></font> ");
        }
        else {
            out.println(
                "<input name=\"name\" type=\"text\" id=\"name3\" value = \"" +
                name + "\">");
        }

        out.println(

            "</font></td>" + "\n" +
            "</tr>" + "\n" +
            "<tr align=\"left\"> " + "\n" +
            "<td><font size=\"2\">Email</font></td>" + "\n" +
            "<td colspan=\"2\" align=\"left\"><font size=\"2\">"); //" + "\n"+
        //"<input name=\"email\" type=\"text\" id=\"email\" value = \""+email+"\">");
// email false
        if (!CheckEmail(email)) {
            email = "";
            out.println(
                "<input name=\"email\" type=\"text\" id=\"email\" value = \"" +
                email + "\">");
            out.println(
                "<font color=\"#FF0000\"><strong>Email incorrect</strong></font> ");
        }
        else {
            out.println(
                "<input name=\"email\" type=\"text\" id=\"email\" value = \"" +
                email + "\">");
        }

        out.println(
            "</font></td>" + "\n" +
            "</tr>" + "\n" +
            "<tr align=\"left\"> " + "\n" +
            "<td height=\"25\"><font size=\"2\">Password</font></td>" +
            "\n" +
            "<td colspan=\"2\" align=\"left\"><font size=\"2\"> " + "\n" +
            "<input name=\"password\" type=\"password\" id=\"password\">");
// password false
        if (!CheckPass(password, password2, name)) {
            out.println(
                "<font color=\"#FF0000\"><strong>Password incorrect</strong></font> ");
        }

        out.println(

            "</font></td>" + "\n" +
            "</tr>" + "\n" +
            "<tr align=\"left\"> " + "\n" +
            "<td><font size=\"2\">Retype Password</font></td>" + "\n" +
            "<td colspan=\"2\" align=\"left\"><font size=\"2\"> " + "\n" +
            "<input name=\"password2\" type=\"password\" id=\"password2\">" +
            "\n" +
            "</font></td>" + "\n" +
            "</tr>" + "\n"+


            "<tr align=\"left\"> "+"\n"+
              "<td><font size=\"2\">&nbsp;</font></td>"+"\n"+
              "<td width=\"16%\"><font size=\"2\"> "+"\n"+
                "<input type=\"submit\" name=\"Submit2\" value=\"Submit\">"+"\n"+
                "</font></td>"+"\n"+
              "<td width=\"54%\"><font size=\"2\"> "+"\n"+
                "<input type=\"reset\" name=\"Submit3\" value=\"Reset\">"+"\n"+
                "</font></td>"+"\n"+
            "</tr>"+"\n"+
          "</table>"+"\n"+
        "</form>"+"\n"+
        "<p><img src=\"pic/xml.gif\" width=\"200\" height=\"203\"></p>"+"\n"+
      "</center>"+"\n"+

  "</tr>"+"\n"+
"</table>"+"\n"+
"</body>"+"\n"+
"</html>");
    }
    else {
            DataBase db = new DataBase();
            db.connect("LYS","surapunassaratt","jdbc:db2:TF");
            db.update("INSERT INTO LYS.MEMBER (USERNAME, PASSWORD, EMAIL, GRANT) VALUES ('"+name+"', '"+password+"', '"+email+"', 'admin')");
            response.sendRedirect("Buttom.html");
            //response.sendRedirect("login");
        }
    }

    //Clean up resources
    public void destroy() {
    }


    public boolean CheckEmail(String email) {
//check email textbox
        if (email.compareTo("") == 0) {
            return false;
        }
        else {
            try {
                int i = email.indexOf("@");
                int j = (email.substring(i, email.length())).indexOf(".");
                if ( (i < 0) || (j < 0)) {
                    return false;
                }
            } catch (Exception e) {
                return false;
            }
        }
        return true;
    }


    public boolean CheckName(String name) {
        System.err.println(name);
        if (name.compareTo("") == 0) {
            return false;
        }
        try {
            DataBase db = new DataBase();
            db.connect("LYS", "surapunassaratt", "jdbc:db2:TF");
            ResultSet rs = db.getResultSet(
                "SELECT MEMBER.USERNAME FROM LYS.MEMBER AS MEMBER WHERE USERNAME = '" +
                name + "'");
            if (rs.wasNull()) {
                System.err.println(
                    "SELECT * FROM LYS.MEMBER AS MEMBER WHERE USERNAME = '" +
                    name + "'");
                rs.next();
                System.err.println(rs.getString(1));
                System.err.println("was null");
                db.disconnect();
                //cann't use this name already exist
                return false;
            }
            db.disconnect();
        } catch (Exception ex) {
            System.err.println("UserName from Member wasNull can use");
            System.err.println(ex);
            return true;
        }
        return true;
    }


    public boolean CheckPass(String pass, String pass2, String name) {
//check password textbox
        if ( (pass.compareTo("") == 0) || (pass2.compareTo("") == 0)) {
            return false;
        }
        else {
            if (pass.compareTo(pass2) == 0) {
                return true;
            }
            else {
                return false;
            }
        }

    }
    public boolean CheckAdmin(String admin,String passmin) {
        String grant = "";
//connect to db=======================================================
        DataBase db = new DataBase();
        db.connect("LYS", "surapunassaratt", "jdbc:db2:TF");
        ResultSet rs = db.getResultSet(
            "SELECT * FROM LYS.MEMBER AS MEMBER WHERE USERNAME = '" +
            admin + "' and PASSWORD = '" + passmin + "'");

        try {
            rs.next();
            grant = rs.getString("GRANT");
            if (grant.compareTo("admin") != 0) {
                db.disconnect();
                return false;
            }
        } catch (Exception exp) {
            db.disconnect();
            return false;
        }
        db.disconnect();
        return true;
    }
}