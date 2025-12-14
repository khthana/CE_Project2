import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class ShowCreateGwap extends HttpServlet
 {    String DefaultURL="http://161.246.5.233:8080/planny"; 
   protected void doGet(HttpServletRequest req , HttpServletResponse res) throws ServletException, IOException
      {   HttpSession session = req.getSession(true);
                String UserID = (String)session.getValue("login.username");	
               if ( UserID==null  ) {  res.sendRedirect(DefaultURL+"/wap/login.wml");  }
              res.setContentType("text/vnd.wap.wml");
               PrintWriter out = res.getWriter();
               out.println("<?xml version=\"1.0\"?>");
               out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">");
               out.println("<wml><card  title=\"Update Event\">"); 
               out.println("<do type =\"accept\" label=\"Create Group\">");
               out.println("<go href=\"http://161.246.5.233:8080/planny/servlet/Creategrwap\" method=\"post\">");
               out.println("<postfield name=\"namegr\" value =\"$(titlecreate)\" />");
              out.println("<postfield name=\"typegr\" value =\"$(typecreate)\"/>");
              out.println("<postfield name=\"notegr\" value =\"$(notecreate)\"/>");
              out.println("</go></do><p mode=\"nowrap\">");
              out.println("Name : <input type =\"text\" name=\"titlecreate\"/> <br/>");
                out.println("Type :  <select name=\"typecreate\" multiple=\"false\">");
                out.println("<option  value=\"Other\">Other</option>");
                out.println("<option value=\"Chat\" >Chat</option>");
                out.println("<option value=\"Clubs\">Clubs</option>");
                out.println("<option value=\"Games\">Games</option>");
                out.println("<option value=\"Friends\">Friends</option>");
                out.println("<option value=\"Sports\">Sports</option></select>");
                out.println("Note : <input type =\"text\" name=\"notecreate\"/> <br/>");
                   out.println("</p><do type =\"prev\"><prev/></do></card></wml> ");
              }
       }