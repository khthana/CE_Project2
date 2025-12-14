import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class ViewEGwap extends HttpServlet
 {   String DefaultURL="http://161.246.5.233:8080/planny";
      static final int  CurDate      =  Calendar.getInstance().get(Calendar.DAY_OF_MONTH); 
      static final int  CurMonth   =  Calendar.getInstance().get(Calendar.MONTH); 
      static final int  CurYear      =  Calendar.getInstance().get(Calendar.YEAR); 
      static final int  CurHour      =  Calendar.getInstance().get(Calendar.HOUR_OF_DAY); 
      static final  String [] MonthName = {"January","February","March","April","May", "June","July","August","September","October","November","December"};
      Connection theConnection;
      protected void doGet(HttpServletRequest req , HttpServletResponse res) throws ServletException, IOException
       {     HttpSession session = req.getSession(true);
             String UserID = (String)session.getValue("login.username");	
             if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
             else session.putValue("login.username",UserID);
             int no= Integer.parseInt(req.getParameter("n"));
             String No = req.getParameter("n");
             session.putValue("login.choicegr2",No);
             res.setContentType("text/vnd.wap.wml");
             PrintWriter out = res.getWriter(); 
              out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">");
               out.println("<wml><card   title=\"Show View Calendar\"><p  mode=\"nowrap\">");
               out.println("<do type =\"accept\" label=\"Answer\">");
               out.println("<go href=\"http://161.246.5.233:8080/planny/servlet/AcceptGrwap\" method=\"post\">");
              out.println("<postfield name=\"choice\" value =\"$(choice)\" />");
                out.println("</go></do>");
                try{    Class.forName("oracle.jdbc.driver.OracleDriver");
                            theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                           Statement  theStatement=theConnection.createStatement();      
                           ResultSet theResult = theStatement.executeQuery(    
                           "select time,title,type,place,note, from_gr,to_time  from calendar  where no_cal="+no);
                               while(theResult.next()) {
                               	Calendar DBCalendar = new GregorianCalendar();
                                                            DBCalendar.setTime(theResult.getDate(1));
                                                            int DBDate = DBCalendar.get(DBCalendar.DATE);
                                                            int DBMonth = DBCalendar.get(DBCalendar.MONTH);
                                                            int DBYear = DBCalendar.get(DBCalendar.YEAR);
                                                            
                                                            DBCalendar.setTime(theResult.getTime(1));
                                                            int DBHour = DBCalendar.get(DBCalendar.HOUR_OF_DAY);
                                                            int DBMin = DBCalendar.get(DBCalendar.MINUTE);
                                         Calendar DBFCalendar = new GregorianCalendar();
                                                           DBFCalendar.setTime(theResult.getDate(7));
                                                            int DBFDate = DBFCalendar.get(DBFCalendar.DATE);
                                                            int DBFMonth = DBFCalendar.get(DBFCalendar.MONTH);
                                                            int DBFYear = DBFCalendar.get(DBFCalendar.YEAR);
                                                            
                                                            DBFCalendar.setTime(theResult.getTime(7));
                                                            int DBFHour = DBFCalendar.get(DBFCalendar.HOUR_OF_DAY);
                                                            int DBFMin = DBFCalendar.get(DBFCalendar.MINUTE);
             
             
               if (theResult.getString(6)!=null)
             out.println("From :"+theResult.getString(6)+"<br/>");
             else  out.println("From: <br/>");
             out.println("Title :"+theResult.getString(2)+"<br/>");
             out.println("Place :"+theResult.getString(4)+"<br/>");
             out.println("Type :"+theResult.getString(3)+"<br/>");
             out.println("Start Date :"+DBDate+" "+MonthName[DBMonth]+" "+DBYear+"<br/>");
             out.print("Start Time :");
             if (DBHour < 10 ) out.print("0");
             out.print(DBHour+":");
             if (DBMin < 10 ) out.print("0");
             out.println(DBMin+"<br/>");
             out.println("Final Date :"+DBFDate+" "+MonthName[DBFMonth]+" "+DBFYear+"<br/>");
             out.print("Final Time :");
             if (DBFHour < 10 ) out.print("0");
             out.print(DBFHour+":");
             if (DBFMin < 10 ) out.print("0");
             out.println(DBFMin+"<br/>");
               }//while
               theStatement.close();//Close statement
               theConnection.close();
        } catch (Exception e)   { out.println(e.getMessage()); }     
                out.println("Select Result : <select name=\"choice\" multiple=\"false\">");
                out.println("<option value=\"Accept\">Accept</option>");
                out.println("<option value=\"Decline\">Decline</option>");
                out.println("<option value=\"Cancel\">Cancel</option>");
                out.println("</select></p><do type =\"prev\"><prev/></do></card></wml> "); 
          
             
     }
  }