import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class WCalendar extends HttpServlet
 {   String DefaultURL="http://161.246.5.233:8080/planny";
      static final int  GDate      =  Calendar.getInstance().get(Calendar.DAY_OF_MONTH); 
      static final int  GMonth   =  Calendar.getInstance().get(Calendar.MONTH); 
      static final int  GYear      =  Calendar.getInstance().get(Calendar.YEAR); 
      static final int  GHour      =  Calendar.getInstance().get(Calendar.HOUR_OF_DAY); 
      static final String []DayName={"Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"} ;
      static final  String [] MonthName = {"January","February","March","April","May", "June","July","August","September","October","November","December"};
      //Connection theConnection;
      protected void service(HttpServletRequest req , HttpServletResponse res) throws ServletException, IOException
       {   
        res.setContentType ("text/vnd.wap.wml");
        PrintWriter out = res.getWriter();
        out.println("<?xml version=\"1.0\"?>");
        out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">");
        out.println("<wml><card title=\"Planny Calendar\"><p mode=\"nowrap\" align=\"center\">");
        //PrintWCalendar.MakeWCalendar(DefaultURL,MonthName,CurDate,CurMonth,CurYear,out);
        
        Calendar GCalendar    = new GregorianCalendar(GYear,GMonth,GDate); 
       //out.print(GCalendar.get(GCalendar.DATE)+" "+MonthName[GCalendar.get(GCalendar.DATE)]+" "+GCalendar.get(GCalendar.YEAR));
        out.print("<a href=\""+DefaultURL+"/servlet/WCalendar\">");
        out.println(GCalendar.get(GCalendar.DATE)+" "+MonthName[GCalendar.get(GCalendar.MONTH)]+" "+GCalendar.get(GCalendar.YEAR)+"</a>");
        out.println("<small><table columns=\"7\" align=\"CCCCCCC\">");
        out.println("<tr><td>Su</td>");
        out.println("<td>Mo</td>");
        out.println("<td>Tu</td>");
        out.println("<td>We</td>");
        out.println("<td>Th</td>");
        out.println("<td>Fr</td>");
        out.println("<td>Sa</td></tr>");
        GCalendar = new GregorianCalendar(GYear,GMonth,1);
        int DayOfWeek = GCalendar.get(GCalendar.DAY_OF_WEEK);
        GCalendar.add(GCalendar.DATE,-(DayOfWeek-1));
        out.println("<tr>");
        for (int i=1;i<=(DayOfWeek-1);i++)   
            {  out.println("<td><a href=\""+DefaultURL+"/servlet/WCalendar\">"+GCalendar.get(GCalendar.DATE)+"</a></td>");
               GCalendar.add(GCalendar.DATE,1);
             }
                         int date=1;
                         int Days=DayOfWeek;
                         GCalendar=new GregorianCalendar(GYear,GMonth,1);
                         for ( int weeks=0; weeks<6 ;weeks++)
	        {   for (; Days<=7 ; Days++)
	            {   if (GCalendar.get(GCalendar.MONTH) != GMonth )
	                 { weeks=7; }//if
	                 out.print("<td><a href=\""+DefaultURL+"/servlet/WCaelndar\">");
	                    if (GCalendar.get(GCalendar.DATE) < 10 ) {out.print(" "); }
	                 out.println(GCalendar.get(GCalendar.DATE)+"</a></td>");  
                                       GCalendar.add(GCalendar.DATE,1);
                                  }   
	                if (weeks==7) 
	                   {  out.println("</tr>");  
	                       continue;  }
	               Days=1;
                                    out.println("</tr><tr>");
	        }//For       
                     out.println("</table></small>");
       out.println("</p></card></wml>");
       }//doGet
 }//Class
  