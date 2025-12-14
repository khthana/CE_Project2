import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Appointwap extends HttpServlet 
{    Connection theConnection;
      String DefaultURL="http://161.246.5.233:8080/planny";
      static final  String [] MonthName = {"January","February","March","April","May", "June","July","August","September","October","November","December"};
       public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException         
          {   HttpSession session = req.getSession(true);
               String UserID = (String)session.getValue("login.username");	
               if ( UserID==null  ) {  res.sendRedirect(DefaultURL+"/wap/login.wml");  }
               else session.putValue("login.username",UserID);
                int No =  Integer.parseInt(req.getParameter("nomem"));
                String Num = req.getParameter("nomem");
              String title = (String)session.getValue("login.groupname");
               String type = (String)session.getValue("login.grouptype");
            session.putValue("login.appointg",Num);
            session.putValue("login.groupname",title);
            session.putValue("login.grouptype",type);
              res.setContentType("text/vnd.wap.wml");
             PrintWriter out = res.getWriter();
             String MemberG = "";
             if (No == 0) MemberG = "All";
             else  {
               try{    Class.forName("oracle.jdbc.driver.OracleDriver");
                         theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                         Statement  theStatement=theConnection.createStatement();      
                         ResultSet theResult = theStatement.executeQuery(    
                         "select  grouptype,groupname,membername,idmem from member where no_mem = "+No);
                         while (theResult.next()) {MemberG =  theResult.getString(3);  }
                     theStatement.close();
                 }  catch (Exception e) {    out.println(e.getMessage()); }
               } 
           out.println("<?xml version=\"1.0\"?>");
          out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">");
         out.println("<wml><card title=\"Appoint Event\"><p mode=\"nowrap\">");
           out.println("Group Name: "+title+"<br/>");
          out.println("Group Type : "+type+"<br/>");
          out.println("Member List: "+MemberG+"<br/>");    
          out.println("<do type =\"accept\" label=\"Submit\">");
          out.println("<go href=\"http://161.246.5.233:8080/planny/servlet/Appointeventwap\" method=\"post\">");
          out.println("<postfield name=\"title\" value =\"$(titlegroup)\" />");
          out.println("<postfield name=\"type\" value =\"$(typegroup)\"/>");
          out.println("<postfield name=\"place\" value =\"$(placegroup)\"/>");
          out.println("<postfield name=\"startday\" value =\"$(startdaygroup)\"/>");
           out.println("<postfield name=\"startyear\" value =\"$(startyeargroup)\"/>");
           out.println("<postfield name=\"startmonth\" value =\"$(startmonthgroup)\"/>");
           out.println("<postfield name=\"starttime\" value =\"$(starttimegroup)\"/>");
           
           out.println("<postfield name=\"finalday\" value =\"$(finaldaygroup)\"/>");
           out.println("<postfield name=\"finalyear\" value =\"$(finalyeargroup)\"/>");
           out.println("<postfield name=\"finalmonth\" value =\"$(finalmonthgroup)\"/>");
           out.println("<postfield name=\"finaltime\" value =\"$(finaltimegroup)\"/>");
           
           out.println("<postfield name=\"fromgr\" value =\"$(fromgroup)\" />");
           out.println("</go></do>");
           out.println("Title : <input type =\"text\" name=\"titlegroup\" emptyok=\"true\"/> <br/>");
           out.println("Type :  <select name=\"typegroup\" multiple=\"false\">");
          out.println("<option value=\"Anniversary\">Anniversary</option>");
                 out.println("<option value=\"Appointment\">Appointment</option>");
                 out.println("<option value=\"BillPayment\">Bill Payment</option>");
                 out.println("<option value=\"Birthday\">Birthday</option>");
                 out.println("<option value=\"Breakfast\">Breakfast</option>");
                 out.println("<option value=\"Call\">Call</option>");
                 out.println("<option value=\"Chat\">Chat</option>");
                 out.println("<option value=\"Class\">Class</option>");
                 out.println("<option value=\"ClubEvent\">Club Event</option>");
                 out.println("<option value=\"Concert\">Concert</option>");
                 out.println("<option value=\"Date\">Date</option>");
                 out.println("<option value=\"Dinner\">Dinner</option>");
                 out.println("<option value=\"Graduation\">Graduation</option>");
                 out.println("<option value=\"HappyHour\">Happy Hour</option>");
                 out.println("<option value=\"Holiday\">Holiday</option>");
                 out.println("<option value=\"Interview\">Interview</option>");
                 out.println("<option value=\"Lunch\">Lunch</option>");
                 out.println("<option value=\"Meeting\">Meeting</option>");
                 out.println("<option value=\"Movie\">Movie</option>");
                 out.println("<option value=\"NetEvent\">Net Event</option>");
                 out.println("<option value=\"Other\">Other</option>");
                 out.println("<option value=\"Party\">Party</option>");
                 out.println("<option value=\"Performance\">Performance</option>");
                 out.println("<option value=\"Reunion\">Reunion</option>");
                 out.println("<option value=\"SportsEvent\">Sports Event</option>");
                 out.println("<option value=\"Travel\">Travel</option>");
                 out.println("<option value=\"TVShow\">TV Show</option>");
                 out.println("<option value=\"Vacation\">Vacation</option>");
                 out.println("<option value=\"Wedding\">Wedding</option>");                     
                 out.println("</select>");
           out.println("Place : <input type =\"text\" name=\"place\" emptyok=\"true\"/> <br/>");
           out.println("Start Date : <select name=\"startdaygroup\">");
           for(int i=1;i<=31;i++)
              { out.print("<option value=\"");
                out.print(i+"\">");
                    if (i<10) out.print("0");
                 out.println(i+"</option>");  }
           out.println("</select>");
           out.println("StartMonth :<select name=\"startmonthgroup\">");
           for(int i=1;i<=12;i++)
              { out.print("<option value=\"");
                 out.print(i+"\">");
                 out.println(MonthName[i-1]+"</option>"); }   
           out.println("</select>");
           out.println("StartYear : <select name=\"startyeargroup\">");
           out.println("<option value=\"2001\">2001</option><option value=\"2002\">2002</option><option value=\"2003\">2003</option>");
           out.println("</select>");
           out.println("Start Time :<select name=\"starttimegroup\">");
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
           out.println("</select><br/>");
           
           out.println("Final Date : <select name=\"finaldaygroup\">");
           for(int i=1;i<=31;i++)
              { out.print("<option value=\"");
                out.print(i+"\">");
                    if (i<10) out.print("0");
                 out.println(i+"</option>");  }
           out.println("</select>");
           out.println("Final Month :<select name=\"finalmonthgroup\">");
           for(int i=1;i<=12;i++)
              { out.print("<option value=\"");
                 out.print(i+"\">");
                 out.println(MonthName[i-1]+"</option>"); }   
           out.println("</select>");
           out.println("FinalYear : <select name=\"finalyeargroup\">");
           out.println("<option value=\"2001\">2001</option><option value=\"2002\">2002</option><option value=\"2003\">2003</option>");
           out.println("</select>");
           out.println("Final Time :<select name=\"finaltimegroup\">");
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
           
           out.println("From : <input type =\"text\" name=\"fromgroup\" emptyok=\"true\"/> <br/>");
           out.println("</p><do type =\"prev\"><prev/></do></card></wml>");
          }
       }
             