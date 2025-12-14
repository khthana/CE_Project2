import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class AcceptGrwap extends HttpServlet
 {     Connection theConnection;
       String DefaultURL="http://161.246.5.233:8080/planny";
        protected  void  doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {   String DefaultURL="http://161.246.5.233:8080/planny"; 
         HttpSession session = req.getSession(true);
         String UserID =session.getValue("login.username").toString();
         if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
         String  NoNum = (String)session.getValue("login.choicegr2");
         int No = Integer.parseInt(NoNum);
         String choice                  = req.getParameter("choice");
         if  (choice.equals("Accept") ){ 
           	try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                      theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                      Statement  theStatement=theConnection.createStatement();
                      theStatement.executeQuery("update calendar set check_mode= 3 where no_cal="+No);
                       theStatement.close();//Close statement
                       theConnection.close(); 
                  }   catch (Exception e)  
                                               {    PrintWriter out = res.getWriter(); 
                                                     res.setContentType("text/html");   
                                                   out.println(e.getMessage()); }
               }
               
            if (choice.equals("Decline") ){ 
            	try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                      theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                      Statement  theStatement=theConnection.createStatement();
                      theStatement.executeQuery("update calendar set check_mode= 4 where no_cal="+No);
                       theStatement.close();//Close statement
                 // theConnection.close(); 
                  }   catch (Exception e)  
                                               {    PrintWriter out = res.getWriter(); 
                                                     res.setContentType("text/html");   
                                                   out.println(e.getMessage()); }
               }
            	if (choice.equals("Cancel") ){ 
            	 try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                                theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
            	          Statement  theStatement=theConnection.createStatement();
                                 theStatement.executeQuery(     
                                 "update calendar set check_mode= 5 where no_cal="+No);
                                   theStatement.close();//Close statement
                                    theConnection.close(); 
                                 }   catch (Exception e)  
                                               {     PrintWriter out = res.getWriter(); 
                                                     res.setContentType("text/html");  
                                                     out.println(e.getMessage()); }
            		             res.sendRedirect(DefaultURL+"/servlet/ShowViewGwap");
               }
               res.sendRedirect(DefaultURL+"/servlet/ShowViewGwap");
               }
     }