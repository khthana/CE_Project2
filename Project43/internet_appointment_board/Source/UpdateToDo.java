 import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
public class UpdateToDo  extends HttpServlet
{   static final  String [] MonthName = {"January","February","March","April","May", "June","July","August","September","October","November","December"};
     String DefaultURL="http://161.246.5.233:8080/planny";
     protected  void  doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {    HttpSession session = req.getSession(true);
         String UserID =session.getValue("login.username").toString();
          if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
          String  No = (String)session.getValue("ToDo.No");
          int NoNum = Integer.parseInt(No);
         Connection theConnection;
         String Cancel                  = req.getParameter("Cancel");
         if (Cancel != null ) {  res.sendRedirect(DefaultURL+"/servlet/mCalendar");  }else {
         String Delete              = req.getParameter("Delete");
         String Update                  = req.getParameter("Update");
         String Title                  = req.getParameter("TitleToDo");
         int Datetodo                  = Integer.parseInt(req.getParameter("dateToDo"));
         int Monthtodo                  =Integer.parseInt(req.getParameter("MonthToDo"));
         int Yeartodo                  = Integer.parseInt(req.getParameter("YearToDo"));
         int Priority                         = Integer.parseInt(req.getParameter("priority"));  
         String Note                        = req.getParameter("NoteToDo");  
         Calendar DBCalendar = new GregorianCalendar(Yeartodo,Monthtodo-1,Datetodo);
        Datetodo = DBCalendar.get(DBCalendar.DAY_OF_MONTH);
        Monthtodo = DBCalendar.get(DBCalendar.MONTH)+1;
        Yeartodo = DBCalendar.get(DBCalendar.YEAR);
         if  (Update != null ){ 
         	
                     try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                      theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                      Statement  theStatement=theConnection.createStatement();
                      theStatement.executeQuery(
                                                " Update todo set title = '"+Title+"',priority = "+Priority+", note = '"
                                                +Note+"', timeout = to_date('"+Datetodo+"/"+Monthtodo+"/"+Yeartodo+"','dd/mm/yyyy')"+
                                                "  where id = ' "+UserID+"' and no_todo = "+ NoNum  );
                     }   catch (Exception e)  
                                               {      res.setContentType("text/html");
                                                       PrintWriter out = res.getWriter();
                                                    out.println(e.getMessage());  }    
               }//if
               
           if  (Delete != null )     {
                           try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                      theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                      Statement  theStatement=theConnection.createStatement();
                     theStatement.executeQuery(  
                       "delete from todo     where id = ' "+UserID+"' and no_todo = "+ NoNum  );
                         }   catch (Exception e)  
                                               {      res.setContentType("text/html");
                                                      PrintWriter out = res.getWriter();
                                                    out.println(e.getMessage());  }     
               }//if
          
              res.sendRedirect(DefaultURL+"/servlet/mCalendar");
                             }   }
     }                  