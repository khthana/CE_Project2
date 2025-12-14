import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class ViewEventGroup extends HttpServlet
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
             res.setContentType("text/html");
             PrintWriter out = res.getWriter(); 
             out.println("<HTML><HEAD><TITLE>Planny Organizer</TITLE>");
             out.println("<META content=\"text/html; charset=windows-874\" http-equiv=Content-Type>");
             out.println("<STYLE type=text/css>BODY ");
             out.println("{MARGIN: 0px; PADDING-BOTTOM: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; PADDING-TOP: 0px}");
             out.println("A:link {COLOR: #005ca2; TEXT-DECORATION: none}");
             out.println("A:visited {COLOR: #005ca2; TEXT-DECORATION: none}");
             out.println("A:active {COLOR: #0099ff; TEXT-DECORATION: underline}");
             out.println("A:hover {COLOR: #0099ff; TEXT-DECORATION: underline}");
             out.println("</STYLE><META content=\"MSHTML 5.00.2614.3500\" name=GENERATOR></HEAD>");
             out.println("<BODY bgColor=#ffffff><TABLE border=0 height=\"100%\" width=\"100%\"><TBODY><TR>");
             out.println("<TD bgColor=#49b0fc height=84 rowSpan=3 width=\"19%\">&nbsp;</TD><TD height=25 width=\"17%\">&nbsp;</TD>");
             out.println("<TD height=25 width=\"64%\">&nbsp;</TD></TR><TR><TD align=middle colSpan=2 height=57 vAlign=center>");
             out.println("<img src=\"/planny/picture/logo4.jpg\" ></TD></TR><TR><TD colSpan=2 height=365 vAlign=top>");
             out.println("<FORM action=\""+DefaultURL+"/servlet/AcceptGr\"  method=post><table border=0 width=\"100%\"><tr>"); 
             out.println("<td height=25 width=65>&nbsp;</td><td height=25 width=165>&nbsp;</td><td height=25 width=155>&nbsp;</td>");
             out.println("<td height=25 width=174>&nbsp;</td><td height=25 width=58>&nbsp;</td></tr><tbody><tr><td height=25 width=65>&nbsp;</td>");
             out.println("<td bgcolor=#94b7f1 colspan=3 height=25><table border=0 width=\"100%\"><tbody><tr><td bgcolor=#ccffff height=23 valign=center>&nbsp;"); 
             out.println("<font face=Arial size=2>&nbsp;<b>Group Appointment</b></font></td></tr></tbody></table></td><td height=25 width=58>&nbsp;</td>");
             out.println("</tr><tr><td height=25 width=65>&nbsp;</td><td bgcolor=#49b0fc colspan=3><table border=0 width=\"100%\"><tr><td width=\"5%\">&nbsp;</td>");
             
                try{    Class.forName("oracle.jdbc.driver.OracleDriver");
                            theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                           Statement  theStatement=theConnection.createStatement();      
                           ResultSet theResult = theStatement.executeQuery(    
                           "select to_time,title,type,place,note, from_gr,time  from calendar  where no_cal="+no);
                               while(theResult.next()) {
                               	Calendar DBCalendar = new GregorianCalendar();
                                                            DBCalendar.setTime(theResult.getDate(7));
                                                            int DBDate = DBCalendar.get(DBCalendar.DATE);
                                                            int DBMonth = DBCalendar.get(DBCalendar.MONTH);
                                                            int DBYear = DBCalendar.get(DBCalendar.YEAR);
                                                            
                                                            DBCalendar.setTime(theResult.getTime(7));
                                                            int DBHour = DBCalendar.get(DBCalendar.HOUR_OF_DAY);
                                                            int DBMin = DBCalendar.get(DBCalendar.MINUTE);
                                                            
                                                            Calendar DBFCalendar = new GregorianCalendar();
                                                            DBFCalendar.setTime(theResult.getDate(1));
                                                            int DBFDate = DBFCalendar.get(DBFCalendar.DATE);
                                                            int DBFMonth = DBFCalendar.get(DBFCalendar.MONTH);
                                                            int DBFYear = DBFCalendar.get(DBFCalendar.YEAR);
                                                            
                                                            DBFCalendar.setTime(theResult.getTime(1));
                                                            int DBFHour = DBFCalendar.get(DBFCalendar.HOUR_OF_DAY);
                                                            int DBFMin = DBFCalendar.get(DBFCalendar.MINUTE);
             
             out.println("<td valign=bottom width=\"26%\"><b><font size=2>From</font></b></td><td width=\"69%\">");
             if (theResult.getString(6)!=null)
             out.println("<input name=GAFrom size=30 value=\""+theResult.getString(6)+"\"></td></tr>");
             else  out.println("<input name=GAFrom size=30 ></td></tr>");
             out.println("<tbody> <tr><td width=\"5%\">&nbsp;</td><td valign=bottom width=\"26%\"><b><font size=2>Title</font></b></td><td valign=bottom width=\"69%\">"); 
             out.println("<input name=GATitle size=30 value=\""+theResult.getString(2)+"\"></td></tr><tr><td width=\"5%\">&nbsp;</td><td valign=bottom width=\"26%\"><b><font size=2>Place</font></b></td>");
             out.println("<td width=\"69%\"><input name=GAPlace size=30 value=\""+theResult.getString(4)+"\"></td></tr><tr><td width=\"5%\">&nbsp;</td><td valign=bottom width=\"26%\"><b><font  size=2>Type</font>");
             out.println("</b></td><td valign=bottom width=\"69%\"><select name=GAType size=1>");
             out.print("<option value=\"Anniversary\"");
           if(theResult.getString(3).equals("Anniversary"))  out.print("selected");
           out.println(">Anniversary</option>");
           out.print("<option value=\"Appointment\"");
            if(theResult.getString(3).equals("Appointment"))  out.print("selected");
           out.println(">Appointment</option>");
           out.print("<option value=\"BillPayment\"");
            if(theResult.getString(3).equals("BillPayment"))  out.print("selected");
           out.println(">Bill Payment</option>");
           out.print("<option value=\"Birthday\"");
            if(theResult.getString(3).equals("Birthday"))  out.print("selected");
           out.println(">Birthday</option>");
           out.print("<option value=\"Breakfast\"");
            if(theResult.getString(3).equals("Breakfast"))  out.print("selected");
            out.println(">Breakfast</option>");
           out.println("<option value=\"Call\"");
            if(theResult.getString(3).equals("Call"))  out.print("selected");
           out.println(">Call</option>");
           out.print("<option value=\"Chat\"");
            if(theResult.getString(3).equals("Chat"))  out.print("selected");
           out.println(">Chat</option>");
           out.print("<option value=\"Class\"");
            if(theResult.getString(3).equals("Class"))  out.print("selected");
           out.println(">Class</option>");
           out.print("<option value=\"ClubEvent\"");
            if(theResult.getString(3).equals("ClubEvent"))  out.print("selected");
           out.println(">Club Event</option>");
           out.print("<option value=\"Concert\"");
            if(theResult.getString(3).equals("Concert"))  out.print("selected");
            out.println(">Concert</option>");
           out.print("<option value=\"Date\"");
            if(theResult.getString(3).equals("Date"))  out.print("selected");
           out.println(">Date</option>");
           out.print("<option value=\"Dinner\"");
            if(theResult.getString(3).equals("Dinner"))  out.print("selected");
           out.println(">Dinner</option>");
           out.print("<option value=\"Graduation\"");
            if(theResult.getString(3).equals("Graduation"))  out.print("selected");
           out.println(">Graduation</option>");
           out.print("<option value=\"HappyHour\"");
            if(theResult.getString(3).equals("HappyHour"))  out.print("selected");
           out.println(">Happy Hour</option>");
           out.print("<option value=\"Holiday\"");
            if(theResult.getString(3).equals("Holiday"))  out.print("selected");
           out.println(">Holiday</option>");
           out.print("<option value=\"Interview\"");
            if(theResult.getString(3).equals("Interview"))  out.print("selected");
           out.println(">Interview</option>");
           out.print("<option value=\"Lunch\"");
            if(theResult.getString(3).equals("Lunch"))  out.print("selected");
           out.println(">Lunch</option>");
           out.print("<option value=\"Meeting\"");
            if(theResult.getString(3).equals("Meeting"))  out.print("selected");
           out.println(">Meeting</option>");
           out.print("<option value=\"Movie\"");
            if(theResult.getString(3).equals("Movie"))  out.print("selected");
           out.println(">Movie</option>");
           out.println("<option value=\"NetEvent\"");
            if(theResult.getString(3).equals("NetEvent"))  out.print("selected");
           out.println(">Net Event</option>");
           out.print("<option value=\"Other\"");
            if(theResult.getString(3).equals("Other"))  out.print("selected");
           out.println(">Other</option>");
           out.print("<option value=\"Party\"");
            if(theResult.getString(3).equals("Party"))  out.print("selected");
           out.println(">Party</option>");
           out.print("<option value=\"Performance\"");
            if(theResult.getString(3).equals("Performance"))  out.print("selected");
           out.println(">Performance</option>");
           out.print("<option value=\"Reunion\"");
            if(theResult.getString(3).equals("Reunion"))  out.print("selected");
           out.println(">Reunion</option>");
           out.print("<option value=\"SportsEvent\"");
            if(theResult.getString(3).equals("SportsEvent"))  out.print("selected");
           out.println(">Sports Event</option>");
           out.print("<option value=\"Travel\"");
            if(theResult.getString(3).equals("Travel"))  out.print("selected");
           out.println(">Travel</option>");
           out.print("<option value=\"TVShow\"");
            if(theResult.getString(3).equals("TVShow"))  out.print("selected");
           out.println(">TV Show</option>");
           out.print("<option value=\"Vacation\"");
            if(theResult.getString(3).equals("Vacation"))  out.print("selected");
           out.println(">Vacation</option>");
           out.print("<option value=\"Wedding\"");
            if(theResult.getString(3).equals("Wedding"))  out.print("selected");
           out.println(">Wedding</option>");    
             out.println("</select></td></tr><tr><td width=\"5%\">&nbsp;</td><td valign=bottom width=\"26%\"><font size=2><b>Start Date & Time</b>");
             out.println("</font></td><td valign=bottom width=\"69%\"><select name=GADay>");
            for (int i=1;i<=31;i++)  
                  {          out.print("<option value=\"");
          	         if ( i<10 )      out.print("0");
          	         out.print(i+"\"");
          	         if ( DBDate == i ) out.print("selected");   
          	         out.println(">"+i+"</option>"); 
                   }
                  out.println("</select><select name=GAMonth>");
                   for (int i=1;i<=12;i++)  
                 {          out.print("<option value=\"");
          	        if ( i<10 )      out.print("0");
          	        out.print(i+"\"");
          	        if ( DBMonth == i-1 ) out.print("selected");   
          	        out.println(">"+MonthName[i-1]+"</option>"); 
                   }
                  out.println("</select> <select name=GAYear>");
                for(int i=2001;i<=2003;i++)
                  {        out.print("<option value=\"");
                           out.print(i+"\"");
          	      if ( DBYear == i ) out.print("selected");   
          	      out.println(">"+i+"</option>"); 
                   }
                    out.println("</select>");
                    out.println("<b> - </b><select name=GAHour>");
                     for(int i=0;i<=23;i++)
                   {   out.print("<option value=\"");
                        out.print(i+"\"");
                          if  (DBHour == i ) out.print("selected");   
                      out.print(">");
                          if  ( i <10 ) out.print("0");
                            out.println(i+"</option>"); 
                       }    
                     out.println("</select><font size=2><b> : </b></font><select name=GAMin>");  
                     for(int i=0;i<=45;i= i+15)
               {  out.print("<option value=\"");
                   if ( i<10 ) out.print("00\"");
                      else out.print(i+"\"");
                       if (i == DBMin) out.print("selected");   
                         out.print(">");
                   if ( i < 10) out.print("0");
                   out.println(i+"</option>");
                }                  
             out.println("</select></td></tr>");
             out.println("<tr><td width=\"5%\">&nbsp;</td><td valign=bottom width=\"26%\"><font size=2><b>Final Date & Time</b>");
             out.println("</font></td><td valign=bottom width=\"69%\"><select name=GAFDay>");
            for (int i=1;i<=31;i++)  
                  {          out.print("<option value=\"");
          	         if ( i<10 )      out.print("0");
          	         out.print(i+"\"");
          	         if ( DBFDate == i ) out.print("selected");   
          	         out.println(">"+i+"</option>"); 
                   }
                  out.println("</select><select name=GAFMonth>");
                   for (int i=1;i<=12;i++)  
                 {          out.print("<option value=\"");
          	        if ( i<10 )      out.print("0");
          	        out.print(i+"\"");
          	        if ( DBFMonth == i-1 ) out.print("selected");   
          	        out.println(">"+MonthName[i-1]+"</option>"); 
                   }
                  out.println("</select> <select name=GAFYear>");
                for(int i=2001;i<=2003;i++)
                  {        out.print("<option value=\"");
                           out.print(i+"\"");
          	      if ( DBFYear == i ) out.print("selected");   
          	      out.println(">"+i+"</option>"); 
                   }
                    out.println("</select>");
                    out.println("<b> - </b><select name=GAFHour>");
                     for(int i=0;i<=23;i++)
                   {   out.print("<option value=\"");
                        out.print(i+"\"");
                        if ( DBFHour == i ) out.print("selected");   
                        out.print(">");
                          if  ( i <10 ) out.print("0");
                            out.println(i+"</option>"); 
                       }    
                     out.println("</select><font size=2><b> : </b></font><select name=GAFMin>");  
                     for(int i=0;i<=45;i= i+15)
               {  out.print("<option value=\"");
                   if ( i<10 ) out.print("00\"");
                      else out.print(i+"\"");
                       if (DBFMin ==i ) out.print("selected");   
                         out.print(">");
                   if ( i < 10) out.print("0");
                   out.println(i+"</option>");
                }                  
             out.println("</select></td></tr>");
             out.println("<tr><td width=\"5%\">&nbsp;</td><td valign=top width=\"26%\"><font size=2><b>Note</b></font></td>");
             out.println("<td width=\"69%\"><textarea cols=30 name=GANote>"+theResult.getString(5)+"</textarea></td></tr><tr><td height=35 width=\"5%\">&nbsp;</td>");
             out.println("<td align=right colspan=2 height=35 valign=bottom>");
             out.println("<input type=\"hidden\" name=\"HiddenNo\" value=\""+no+"\">");
             out.println("<input name=Accept type=submit value=\"  Accept  \"> <input name=Decline type=submit value=\"  Decline  \">");
             out.println("<input name=Cancel type=submit value=\"  Cancel  \"></td></tr></tbody></table></td><td height=25 width=58>&nbsp;</td>");
             out.println("</tr></tbody></table></form></TD></TR></TBODY></TABLE></BODY></HTML>");
               }//while
               theStatement.close();//Close statement
              // theConnection.close();
                } catch (Exception e)   { out.println(e.getMessage()); }        
           
                                           
                    	          
     }
  }