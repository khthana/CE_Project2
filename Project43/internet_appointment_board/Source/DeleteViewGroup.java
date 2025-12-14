import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
public class DeleteViewGroup extends HttpServlet
{  String DefaultURL="http://161.246.5.233:8080"; 
    Connection theConnection;
  protected  void  doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {    HttpSession session = req.getSession(true);
         String UserID =session.getValue("login.username").toString();
         if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
         String [ ]no = req.getParameterValues("checkbox");   
             try{                             
                                               //Loading Sun's JDBC ODBC Driver   
                                               Class.forName("oracle.jdbc.driver.OracleDriver");
                                               //Connect to emaildb Data source
                                               theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                               //Select all records from emaillists table.
                                               Statement  theStatement=theConnection.createStatement();
                                                  if (no != null)  {
                                                     for (int i = 0; i < no.length; i++) 
                                                    {
                                                         theStatement.executeQuery("delete from calendar where no_cal = "+no[i]);
                                                    }
                                                }
                                                   theStatement.close();//Close statement
                                               theConnection.close();   
                   }   catch (Exception e) {
                   	                       PrintWriter out = res.getWriter(); 
                                            res.setContentType("text/html");
                    	                      out.println(e.getMessage()); 
                                                                 }
                 res.sendRedirect(DefaultURL+"/planny/servlet/gCalendar?c=1");                                
                              }
        }