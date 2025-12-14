import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
public class DeleteGrwap2 extends HttpServlet
{  String DefaultURL="http://161.246.5.233:8080"; 
    Connection theConnection;
  protected  void  doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {    HttpSession session = req.getSession(true);
         String UserID =session.getValue("login.username").toString();
         if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
         String choice = req.getParameter("choice");   
        String  NoNum = (String)session.getValue("login.choicegr");
         int No = Integer.parseInt(NoNum);
           if  (choice.equals("Delete"))     {
                           try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                      theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                      Statement  theStatement=theConnection.createStatement();
                     theStatement.executeQuery(  
                       "delete from calendar where no_cal="+No  );
                         }   catch (Exception e)  
                                               {      res.setContentType("text/html");
                                                      PrintWriter out = res.getWriter();
                                                    out.println(e.getMessage());  }     
               }//if
               if(choice.equals("Cancel"))   { 
               	 
               	                         res.sendRedirect(DefaultURL+"/planny/servlet/ShowViewGwap");      
               	             }
                 res.sendRedirect(DefaultURL+"/planny/servlet/ShowViewGwap");                                
                              }
        }