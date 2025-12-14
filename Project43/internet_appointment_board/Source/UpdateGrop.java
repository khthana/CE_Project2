import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class UpdateGrop extends HttpServlet
 {     Connection theConnection;
        protected  void  doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {   String DefaultURL="http://161.246.5.233:8080/planny"; 
         HttpSession session = req.getSession(true);
         String UserID =session.getValue("login.username").toString();
         if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
         String Name                      = req.getParameter("EGName");
         String title                      = req.getParameter("HiddenTitle");
         String Type                       = req.getParameter("EGType");
         String type                      = req.getParameter("HiddenType");
         String Note                      = req.getParameter("EGNote");
         String Update                    = req.getParameter("EGUpdate");
         String Delete                      = req.getParameter("EGDelete");
         String Cancel                      = req.getParameter("EGCancel");
         out.println("Name"+Name+"<br/>");
         out.println("title"+title+"<br/>");
         out.println("Type"+Type+"<br/>");
         out.println("type"+type+"<br/>");
         out.println("Note"+Note+"<br/>");
           if  (Update != null ){ 
           	 try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                      theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                      Statement  theStatement=theConnection.createStatement();
                      theStatement.executeQuery("update member set groupname='"+Name+"',grouptype='"+Type+"',notegr='"+Note+"'"
                        +"where groupname='"+title+"' and grouptype='"+type+"'");
                     theStatement.close();//Close statement
                  theConnection.close(); 
                  }   catch (Exception e)  
                                               {    /*PrintWriter out = res.getWriter(); 
                                                     res.setContentType("text/html");*/
                    	                                out.println(e.getMessage()); }
                    	                      }
             }
          }