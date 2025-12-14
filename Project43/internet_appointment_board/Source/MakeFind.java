import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class MakeFind extends HttpServlet
 {   String DefaultURL="http://161.246.5.231";
      static final int  CurDate      =  Calendar.getInstance().get(Calendar.DAY_OF_MONTH); 
      static final int  CurMonth   =  Calendar.getInstance().get(Calendar.MONTH); 
      static final int  CurYear      =  Calendar.getInstance().get(Calendar.YEAR); 
      static final int  CurHour      =  Calendar.getInstance().get(Calendar.HOUR_OF_DAY); 
      static final String []DayName={"Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"} ;
      static final  String [] MonthName = {"January","February","March","April","May", "June","July","August","September","October","November","December"};
      Connection theConnection;
      protected void doGet(HttpServletRequest req , HttpServletResponse res) throws ServletException, IOException
       {    HttpSession session = req.getSession(true);
             String UserID = (String)session.getValue("login.username");	
             if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
               else session.putValue("login.username",UserID);