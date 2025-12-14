import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class ShowUpdateEventwap extends HttpServlet
 {    String DefaultURL="http://161.246.5.233:8080/planny"; 
       Connection theConnection;
       String [] MonthName = {"January","February","March","April","May", "June","July","August","September","October","November","December"};
       String []DayName={"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Day","Week","Month","Year"} ;
       int CurDate      =  Calendar.getInstance().get(Calendar.DAY_OF_MONTH); 
       int CurMonth    =  Calendar.getInstance().get(Calendar.MONTH); 
       int CurYear      =  Calendar.getInstance().get(Calendar.YEAR); 
       protected void doGet(HttpServletRequest req , HttpServletResponse res) throws ServletException, IOException
      {   HttpSession session = req.getSession(true);
               String UserID = (String)session.getValue("login.username");	
               if ( UserID==null  ) {  res.sendRedirect(DefaultURL+"/wap/login.wml");  }
               else session.putValue("login.username",UserID);
              String No          = req.getParameter("n");
               session.putValue("login.event",No);
               res.setContentType("text/vnd.wap.wml");
               PrintWriter out = res.getWriter();
               out.println("<?xml version=\"1.0\"?>");
               out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">");
               out.println("<wml><card  title=\"Update Event\">"); 
               out.println("<do type =\"accept\" label=\"Update\">");
               out.println("<go href=\"http://161.246.5.233:8080/planny/servlet/UpdateEventwap\" method=\"post\">");
              out.println("<postfield name=\"title\" value =\"$(title)\" />");
              out.println("<postfield name=\"type\" value =\"$(type)\"/>");
              out.println("<postfield name=\"place\" value =\"$(place)\"/>");
              out.println("<postfield name=\"startday\" value =\"$(startday)\"/>");
           out.println("<postfield name=\"startyear\" value =\"$(startyear)\"/>");
           out.println("<postfield name=\"startmonth\" value =\"$(startmonth)\"/>");
           out.println("<postfield name=\"starttime\" value =\"$(starttime)\"/>");
           out.println("<postfield name=\"until\" value =\"$(until)\"/>");
           out.println("</go></do><p mode=\"nowrap\">");
           out.println("Title : <input type =\"text\" name=\"title\" emptyok=\"true\"/> <br/>");
           out.println("Type :  <select name=\"type\" multiple=\"false\">");
           out.println("<option value=\"Anniversary\">Anniversary</option><option value=\"Appointment\">Appointment</option>");
           out.println("<option value=\"BillPayment\">Bill Payment</option><option value=\"Birthday\">Birthday</option>");
           out.println("<option value=\"Breakfast\">Breakfast</option><option value=\"Call\">Call</option>");
           out.println("<option value=\"Chat\">Chat</option><option value=\"Class\">Class</option>");
           out.println("<option value=\"ClubEvent\">Club Event</option><option value=\"Concert\">Concert</option>");
           out.println("<option value=\"Date\">Date</option><option value=\"Dinner\">Dinner</option>");
           out.println("<option value=\"Graduation\">Graduation</option><option value=\"HappyHour\">Happy Hour</option>");
           out.println("<option value=\"Holiday\">Holiday</option><option value=\"Interview\">Interview</option>");
           out.println("<option value=\"Lunch\">Lunch</option><option value=\"Meeting\">Meeting</option>");
           out.println("<option value=\"Movie\">Movie</option><option value=\"NetEvent\">Net Event</option>");
           out.println("<option value=\"Other\">Other</option><option value=\"Party\">Party</option>");
           out.println("<option value=\"Performance\">Performance</option><option value=\"Reunion\">Reunion</option>");
           out.println("<option value=\"SportsEvent\">Sports Event</option><option value=\"Travel\">Travel</option>");
           out.println("<option value=\"TVShow\">TV Show</option><option value=\"Vacation\">Vacation</option>");
           out.println("<option value=\"Wedding\">Wedding</option></select>");
            out.println("Place : <input type =\"text\" name=\"place\" emptyok=\"true\"/> <br/>");
           out.println("Start Date : <select name=\"startday\">");
           for(int i=1;i<=31;i++)
              { out.print("<option value=\"");
                out.print(i+"\">");
                    if (i<10) out.print("0");
                 out.println(i+"</option>");  }
           out.println("</select>");
           out.println("StartMonth :<select name=\"startmonth\">");
           for(int i=1;i<=12;i++)
              { out.print("<option value=\"");
                 out.print(i+"\">");
                 out.println(MonthName[i-1]+"</option>"); }   
           out.println("</select>");
           out.println("StartYear : <select name=\"startyear\">");
           out.println("<option value=\"2001\">2001</option><option value=\"2002\">2002</option><option value=\"2003\">2003</option>");
           out.println("</select>");
           out.println("Start Time :<select name=\"starttime\">");
           for(int i=0;i<=23;i++)
              {  for(int m=0;m<=45;m=m+15)
                  {
                  out.print("<option value=\"");
                         //if (i<10) out.print("0");                         
                         out.print(i);
                  if (m<10) out.print("0");       
                         out.println(m+"\">");
                  if (i<10) out.print("0");
                         out.print(i+":");
                  if (m<10) out.print("0");                         
                         out.println(m+"</option>");    }  }
           out.println("</select>");
           out.println("Until : <select name=\"until\">");
           for(int i=0;i<=23;i++)
              {  for(int m=0;m<=45;m=m+15)
                  {
                  out.print("<option value=\"");
                         //if (i<10) out.print("0");                         
                         out.print(i);
                  if (m<10) out.print("0");       
                         out.println(m+"\">");
                  if (i<10) out.print("0");
                         out.print(i+":");
                  if (m<10) out.print("0");                         
                         out.println(m+"</option>");    }  }
           out.println("</select></p><do type =\"prev\"><prev/></do></card></wml>");
                  
        }       
     }
