import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class ShowCreateMwap extends HttpServlet
 {    String DefaultURL="http://161.246.5.233:8080/planny"; 
      Connection theConnection;
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
               out.println("<go href=\"http://161.246.5.233:8080/planny/servlet/Creatememwap\" method=\"post\">");
               out.println("<postfield name=\"namemem\" value =\"$(namemem)\" />");
                 out.println("<postfield name=\"grname\" value =\"$(grname)\"/>");
              out.println("<postfield name=\"typegr\" value =\"$(typegr)\"/>");
              out.println("<postfield name=\"statusgr\" value =\"$(statusgr)\"/>");
                out.println("<postfield name=\"Memidgr\" value =\"$(Memidgr)\"/>");
                  out.println("<postfield name=\"notegr\" value =\"$(notegr)\"/>");
              out.println("</go></do><p mode=\"nowrap\">");
              out.println("Name Member: <input type =\"text\" name=\"namemem\" emptyok=\"false\"/> <br/>");
              out.println("Name Group: <select name=\"grname\" multiple=\"false\">");
                try{    Class.forName("oracle.jdbc.driver.OracleDriver");
                                     theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                    }  catch (Exception e) { out.println(e.getMessage()); }
                  try{    Statement  theStatement=theConnection.createStatement();      
                         ResultSet theResult = theStatement.executeQuery(    
                         "select groupname from member group by groupname");
                         while (theResult.next())
                         { out.println("<option value=\""+theResult.getString(1)+"\">"+theResult.getString(1)+"</option>"); }
                         theResult.close();
                        theStatement.close();
                    }  catch (Exception e) { out.println(e.getMessage()); }     
              out.println("</select><br/>");
                out.println("Type :  <select name=\"typegr\" multiple=\"false\">");
                out.println("<option  value=\"Other\">Other</option>");
                out.println("<option value=\"Chat\" >Chat</option>");
                out.println("<option value=\"Clubs\">Clubs</option>");
                out.println("<option value=\"Games\">Games</option>");
                out.println("<option value=\"Friends\">Friends</option>");
                out.println("<option value=\"Sports\">Sports</option></select>");
                out.println("Status: <input type =\"text\" name=\"statusgr\" emptyok=\"true\"/> <br/>");
                out.println("Planny ID: <input type =\"text\" name=\"Memidgr\" emptyok=\"false\"/> <br/>");
                out.println("Note : <input type =\"text\" name=\"notegr\" emptyok=\"true\"/> <br/>");
                   out.println("</p><do type =\"prev\"><prev/></do></card></wml> ");
              }
       }