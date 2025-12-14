import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Success extends HttpServlet
{
    public void doGet (HttpServletRequest req, HttpServletResponse res)  throws ServletException, IOException
        {   String DefaultURL= "http://161.246.5.233:8080/planny";
             PrintWriter out =  res.getWriter();
            HttpSession session=req.getSession(true);
            Object UserID = session.getValue("login.username");
             if (UserID==null) {  res.sendRedirect(DefaultURL); }
            res.setContentType("text/html");
            out.println("<HTML><HEAD>");
            out.println("<TITLE>Planny Orgaizer</TITLE>");
            out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
            out.println("</HEAD><BODY bgcolor=\"#FFFFFF\" leftmargin=\"0\" topmargin=\"0\" VLINK=blue LINK=blue>");
            out.println("<br><table width=\"77%\" border=\"0\" height=\"370\" align=\"center\">");
            out.println("<tr><td height=\"9\">&nbsp;</td><td height=\"9\">&nbsp;</td></tr>");
            out.println("<tr><td height=\"30\" colspan=\"2\" valign=\"baseline\" align=\"center\"><img src=\"/planny/picture/logo2.jpg\" width=\"417\" height=\"59\"></td></tr> ");
            out.println(" <tr><td height=\"30\" colspan=\"2\" bgcolor=\"#1A5f9b\" valign=\"bottom\"> <img src=\"/planny/picture/Sign.jpg\" width=\"198\" height=\"22\"></td></tr><tr> ");
            out.println("<td height=\"49\" colspan=\"2\" valign=\"bottom\"> &nbsp;&nbsp;<font face=\"Arial\">&nbsp;&nbsp;Congratulation.Your  Planny ID is : </font></td></tr>");
            out.println(" <tr align=\"center\"><td height=\"70\" colspan=\"2\"> <font face=\"Arial\" size=\"6\" color=\"#FF0000\">"+UserID/*session.getValue("login.username")*/+"</font></td></tr>");
            out.println("<tr valign=\"bottom\"><td height=\"35\" colspan=\"2\">&nbsp;&nbsp;&nbsp;&nbsp;<font face=\"Arial\">&nbsp;Besure to write down your Planny ID and password for future reference.</font></td></tr>");
            out.println(" <tr><td height=\"38\" colspan=\"2\" valign=\"bottom\"><hr align=\"center\" width=\"100%\" size=\"4\"></td></tr>");
            out.println("<tr align=\"center\" valign=\"bottom\"><td height=\"50\" colspan=\"2\"><a href=\""+DefaultURL+"/servlet/mCalendar\">Continue to Planny</a></td></tr>");
            out.println("<tr><td height=\"5\" colspan=\"2\" valign=\"baseline\">&nbsp;</td></tr></table>");
            out.println("</BODY></HTML>");
            out.flush();
            out.close();
        }
}

