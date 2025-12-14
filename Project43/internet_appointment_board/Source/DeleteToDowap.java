import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
public class DeleteToDowap extends HttpServlet
{  String DefaultURL="http://161.246.5.233:8080/planny"; 
    Connection theConnection;
  protected  void  doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {    HttpSession session = req.getSession(true);
         String UserID =session.getValue("login.username").toString();
         if ( UserID==null  ) {  res.sendRedirect(DefaultURL+"/wap/login.wml");  }
         String  No = (String)session.getValue("ToDo.No");
          int NoNum = Integer.parseInt(No);
           try{                             
                                               //Loading Sun's JDBC ODBC Driver   
                                               Class.forName("oracle.jdbc.driver.OracleDriver");
                                               //Connect to emaildb Data source
                                               theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                               //Select all records from emaillists table.
                                               Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery("delete from todo where no_todo = "+No);
                                               theStatement.close();//Close statement
                                               theConnection.close();   
                   }   catch (Exception e) {
                   	                      res.setContentType("text/vnd.wap.wml");
                                            PrintWriter out = res.getWriter(); 
                    	                      out.println(e.getMessage()); 
                                                                 }
                 res.sendRedirect(DefaultURL+"/servlet/mainwap?s=3");                                
                              }
        }