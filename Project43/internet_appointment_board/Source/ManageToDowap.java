import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

public class ManageToDowap extends HttpServlet 
  { static final  String [] MonthName = {"January","February","March","April","May", "June","July","August","September","October","November","December"};
     String DefaultURL="http://161.246.5.233:8080/planny";
      static final int  CurDate      =  Calendar.getInstance().get(Calendar.DAY_OF_MONTH); 
      static final int  CurMonth   =  Calendar.getInstance().get(Calendar.MONTH); 
      static final int  CurYear      =  Calendar.getInstance().get(Calendar.YEAR); 
      Connection theConnection;
     public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
     {    HttpSession session = req.getSession(true);
          String UserID =session.getValue("login.username").toString();
           String Title                    = req.getParameter("title");
           int Freqdate          = Integer.parseInt(req.getParameter("date"));
           int FreqMonth       = Integer.parseInt(req.getParameter("month"));
           int FreqYear          = Integer.parseInt(req.getParameter("year"));
             int no = 0;
           String Priority               = req.getParameter("priority");
          Calendar DBCalendar = new GregorianCalendar(FreqYear,FreqMonth-1,Freqdate);
          Freqdate = DBCalendar.get(DBCalendar.DAY_OF_MONTH);
          FreqMonth = DBCalendar.get(DBCalendar.MONTH)+1;
          FreqYear = DBCalendar.get(DBCalendar.YEAR);
         
           Calendar CurCalendar = new GregorianCalendar(CurYear,CurMonth,CurDate,0,0);
            try{    Class.forName("oracle.jdbc.driver.OracleDriver");
                                     theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                    }  catch (Exception e) {   res.setContentType("text/html");
                                                    	   PrintWriter out = res.getWriter();
                    			   out.println(e.getMessage()); }
         
           try{        Statement theStatement = theConnection.createStatement ();
                                              ResultSet theResult=theStatement.executeQuery(
                                              "select  count(*)  from  todo where id = ' "+UserID+"'");
                                     	   while (theResult.next()) { no = theResult.getInt(1);}
                                       theResult.close();
                                       theStatement.close();//Close statement
                                   }   catch (Exception e)  
                                               {    res.setContentType("text/html");
                                                    PrintWriter out = res.getWriter();
                                                    out.println(e.getMessage());  }          	   
         
                                   if (no < 15) 
                     {
                           if   (  (CurCalendar.before(DBCalendar)) || (CurCalendar.equals(DBCalendar))  ) { 
          
                     try{                   if (Title.equals("") )Title="No Title";
                                               Statement  theStatement=theConnection.createStatement();
                                                theStatement.executeQuery(
                                                "INSERT INTO todo"
                                                           + "(no_todo,timeout,id,title,priority)"
                                                           + "values( no_todo.nextval, to_date(' "+Freqdate+"/"+FreqMonth+"/" +FreqYear+"',"
                                                           +" 'dd/mm/yyyy'),' "+UserID+"','"+Title+"',' "+Priority+"')");
                                                theStatement.close();//Close statement
                                                theConnection.close();                                         
                             }   catch (Exception e)  
                                               {    res.setContentType("text/html");
                                                    PrintWriter out = res.getWriter();
                                                    out.println(e.getMessage());  }  
               }//if
            }
          
                 res.sendRedirect(DefaultURL+"/servlet/mainwap");
                   }
            }