import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ShowInsertwap extends HttpServlet 
{    Connection theConnection;
      String DefaultURL="http://161.246.5.233:8080/planny";
      static final  String [] MonthName = {"January","February","March","April","May", "June","July","August","September","October","November","December"};
      public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException         
          {   HttpSession session = req.getSession(true);
               String UserID = (String)session.getValue("login.username");	
               if ( UserID==null  ) {  res.sendRedirect(DefaultURL+"/wap/login.wml");  }
               else session.putValue("login.username",UserID);
               String gTime = req.getParameter("time");
               session.putValue("Event.TimeE",gTime);
               int  CurDate      =  Calendar.getInstance().get(Calendar.DAY_OF_MONTH); 
               int  CurMonth   =  Calendar.getInstance().get(Calendar.MONTH); 
               int  CurYear      =  Calendar.getInstance().get(Calendar.YEAR); 
               int  CurHour      =  Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
               int  CurMin      =  Calendar.getInstance().get(Calendar.MINUTE);
               if (gTime!=null) {
             Date MakeDate = new Date(Long.parseLong(gTime));
             Calendar GCalendar = new GregorianCalendar();
             GCalendar.setTime(MakeDate);
             CurDate = GCalendar.get(GCalendar.DAY_OF_MONTH); 
             CurMonth = GCalendar.get(GCalendar.MONTH);
             CurYear = GCalendar.get(GCalendar.YEAR);
             CurHour = GCalendar.get(GCalendar.HOUR_OF_DAY);
             CurMin = GCalendar.get(GCalendar.MINUTE);
                        }
          res.setContentType("text/vnd.wap.wml");
          PrintWriter out = res.getWriter();
           out.println("<?xml version=\"1.0\"?>");
           out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">");
           out.println("<wml><card  title=\"Quick Add\">"); 
           out.println("<do type =\"accept\" label=\"Save\">");
           out.println("<go href=\""+DefaultURL+"/servlet/Insertwap\" method=\"post\">");
           out.println("<postfield name=\"title\" value =\"$(title)\" />");
           out.println("<postfield name=\"type\" value =\"$(type)\"/>");
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
           out.println("Start Date : "+CurDate+"<br/>");
           out.println("StartMonth : "+MonthName[CurMonth]+"<br/>");
           out.println("StartYear : "+CurYear+"<br/>");
           out.println("Start Time : "+CurHour +":"+CurMin+"<br/>");
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