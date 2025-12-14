import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Showmemwap extends HttpServlet 
{    Connection theConnection;
      String DefaultURL="http://161.246.5.233:8080/planny";
       public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException         
          {   HttpSession session = req.getSession(true);
               String UserID = (String)session.getValue("login.username");	
               if ( UserID==null  ) {  res.sendRedirect(DefaultURL+"/wap/login.wml");  }
               else session.putValue("login.username",UserID);
             int No =  Integer.parseInt(req.getParameter("n"));
             boolean check = false;
             boolean c = true;
              res.setContentType("text/vnd.wap.wml");
             PrintWriter out = res.getWriter();
             String  title="";
             String type="";
               try{    Class.forName("oracle.jdbc.driver.OracleDriver");
                         theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                         Statement  theStatement=theConnection.createStatement();      
                         ResultSet theResult = theStatement.executeQuery(    
                         "select  grouptype,groupname from member where no_mem = "+No);
                         while (theResult.next()) {
                         	title=theResult.getString(2);
                         	type = theResult.getString(1);
                         	                        }
                     theStatement.close();
                 }  catch (Exception e) {    out.println(e.getMessage()); }
            session.putValue("login.groupname",title);
            session.putValue("login.grouptype",type);
           out.println("<?xml version=\"1.0\"?>");
          out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">");
          out.println("<wml><card title=\"Member List\"><do type =\"accept\" label=\"Appoint\">");
          out.println("<go href=\"http://161.246.5.233:8080/planny/servlet/Appointwap\" method=\"post\">");
          out.println("<postfield name=\"nomem\" value =\"$(selectmember)\" /></go></do> ");
          out.println("<p align =\"center\" mode=\"nowrap\">Group Name: "+title+"<br/>");
          out.println("Group Type : "+type+"<br/>");
          out.println("Member List: ");    
         try{   Statement  theStatement=theConnection.createStatement();      
                          ResultSet theResult = theStatement.executeQuery(    
                          "select membername, no_mem  from member where id=' "+UserID+"'  and id <> idmem and groupname= '"+title+"' and grouptype='"+type+"'");
                          while (theResult.next()) {
                          	if (!check) {
                          	 out.println("<select name=\"selectmember\">");
                          	 out.println("<option value=\"0\">All</option>");
                                           out.println("<option value=\""+theResult.getInt(2)+"\">"+theResult.getString(1)+"</option>");
                                           check = true;
                                           c= false;
                                                        }
                                           else out.println("<option value=\""+theResult.getInt(2)+"\">"+theResult.getString(1)+"</option>");
                          	  }
                           out.println("</select><br/>");    
                 theStatement.close();
                }  catch (Exception e) {    out.println(e.getMessage()); }
                if (c) out.println("No Member");
                out.println("</p><do type =\"prev\"><prev/></do></card></wml> ");
        }
        }          	                                               
                         	
                         	
                       