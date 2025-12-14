import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class ShowReminder extends HttpServlet
 {    String DefaultURL="http://161.246.5.233:8080/planny"; 
       Connection theConnection;
       boolean checkAll = true;
       String [] MonthName = {"January","February","March","April","May", "June","July","August","September","October","November","December"};
       String []DayName={"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Day","Week","Month","Year"} ;
       int CurDate      =  Calendar.getInstance().get(Calendar.DAY_OF_MONTH); 
       int CurMonth    =  Calendar.getInstance().get(Calendar.MONTH); 
       int CurYear      =  Calendar.getInstance().get(Calendar.YEAR); 
      protected void doGet(HttpServletRequest req , HttpServletResponse res) throws ServletException, IOException
      {   HttpSession session = req.getSession(true);
           String UserID = (String)session.getValue("login.username");	
           if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
           String Nonum =   req.getParameter("n");        
           int NoNum = Integer.parseInt(req.getParameter("n")); 
          session.putValue("Event.No",Nonum);
           res.setContentType("text/html");
           PrintWriter out = res.getWriter(); 
           try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                      theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                            }   catch (Exception e)   {
                       out.println(e.getMessage()); } 
           out.println("<html><head><title>Planny Organizer</title><meta http-equiv=\"Content-Type\" content=\"text/html; charset=Windows-874\"><style type=\"text/css\">");
           out.println("<!--body {  margin: 0px  0px; padding: 0px  0px}");
           out.println("a:link { color: #005CA2; text-decoration: none}");
           out.println("a:visited { color: #005CA2; text-decoration: none}");
           out.println("a:active { color: #0099FF; text-decoration: underline}");
           out.println("a:hover { color: #0099FF; text-decoration: underline}--></style>");
           out.println("</head>");	
           out.println("<body bgcolor=\"#FFFFFF\" VLINK=blue LINK=blue>");
           out.println("<table width=\"100%\" border=\"0\" height=\"100%\"><tr> ");
           out.println("<td height=\"84\" rowspan=\"2\" bgcolor=\"#49B0FC\" width=\"19%\"><b><font size=\"2\"></font></b></td>");
           out.println("<td height=\"84\" valign=\"middle\" align=\"center\"><img src=\"/planny/picture/logo4.jpg\" width=\"360\" height=\"51\"></td></tr>");
           out.println("<tr><td valign=\"top\" height=\"365\"><form method=\"post\" action=\""+DefaultURL+"/servlet/UpdateRemind\">");
           ShowReminderNewEvent.PrintNewEvent(checkAll,NoNum,theConnection,DefaultURL,CurDate,CurMonth,CurYear,MonthName,out,UserID);
           int No_rep = ShowReminderRepeat.PrintRepeat(NoNum,theConnection,UserID,DefaultURL,CurDate,CurMonth,CurYear,MonthName,DayName,out);
           session.putValue("Repeat.No",Integer.toString(No_rep));
           int No_rem = ShowReminderReminder.PrintReminder(NoNum,theConnection,UserID,DefaultURL,out);
           session.putValue("Remind.No",Integer.toString(No_rem));
                  try { theConnection.close(); }
                                 catch (Exception e)  {out.println(e.getMessage()); }  
           out.println("</form></td></tr></table></body></html>");
             }
 }       
 class ShowReminderNewEvent
  { public static void  PrintNewEvent(boolean checkAll,int No,Connection theConnection,String DefaultURL,int CurDate,int CurMonth,int CurYear,String []MonthName,PrintWriter out,String UserID)
      {   int  DuHour2;
           int  DuMin2;
           out.println("<table width=\"100%\" border=\"0\"><tr><td width=\"63\" height=\"15\">&nbsp;</td><td colspan=\"3\" valign=\"top\" height=\"15\">");
           out.println("<a name=\"newevent\"></a></td><td width=\"30\" height=\"15\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"63\" height=\"38\">&nbsp;</td><td colspan=\"3\" height=\"38\" bgcolor=\"#94B7F1\">");
           out.println("<table width=\"100%\" border=\"0\"><tr><td bgcolor=\"#DEDEDE\" align=\"right\" valign=\"middle\" height=\"30\">&nbsp;");
           out.println("<input type=\"submit\" name=\"Update\" value=\"  Update  \">");
           out.println("<input type=\"submit\" name=\"Deletesome\" value=\" Delete Some \">");
           out.println("<input type=\"submit\" name=\"Deleteall\" value=\" Delete Until\">");
           out.println("<input type=\"submit\" name=\"Cancel\" value=\"Cancel\">");
           out.println("&nbsp; </td></tr></table></td><td width=\"30\" height=\"38\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"63\" height=\"25\">&nbsp;</td><td bgcolor=\"#94B7F1\" colspan=\"3\" height=\"25\">");
           out.println(" <table width=\"100%\" border=\"0\"><tr><td bgcolor=\"#CCFFFF\" height=\"23\" valign=\"middle\">");
           out.println("&nbsp;<font size=\"2\" face=\"Arial\">&nbsp;<b>New Event&nbsp;");
           out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b><a href=\""+DefaultURL+"/servlet/mCalendar\">Main</a>&nbsp&nbsp;");
           out.println("</b><a href=\""+DefaultURL+"/servlet/ShowReminder?n="+No+"#Repeat\">Repeat</a>&nbsp;&nbsp;");
           out.println("<a href=\""+DefaultURL+"/servlet/ShowReminder?n="+No+"#remind\">Remind</a><b> </b></font></td></tr></table></td>");
           out.println("<td width=\"30\" height=\"25\">&nbsp;</td></tr><tr><td width=\"63\" height=\"25\">&nbsp;</td>");
           out.println("<td height=\"187\" colspan=\"3\" rowspan=\"3\" bgcolor=\"#49B0FC\" valign=\"top\"><table width=\"100%\" border=\"0\"><tr> ");
           out.println("<td width=\"9%\" valign=\"bottom\"><font size=\"2\"></font></td><td width=\"11%\" valign=\"bottom\"><font size=\"2\"><b>Title</b></font></td>");
              try{    
                      Statement  theStatement=theConnection.createStatement();
                      ResultSet theResult = theStatement.executeQuery(
                                                " Select *  from calendar  where id = ' "+UserID+"'  and no_cal = '"+No+"'"  );
                    while (theResult.next())   {
                    	      String title = theResult.getString(5);
                    	      String place = theResult.getString(7);
                    	      String type = theResult.getString(6);
                    	      	Calendar DBCalendar = new GregorianCalendar();
                                                            DBCalendar.setTime(theResult.getDate(2));
                                                            int DBDate = DBCalendar.get(DBCalendar.DATE);
                                                            int DBMonth = DBCalendar.get(DBCalendar.MONTH);
                                                            int DBYear = DBCalendar.get(DBCalendar.YEAR);
                                                                                                                      
                                          Calendar DB2Calendar = new GregorianCalendar();
                                                            DB2Calendar.setTime(theResult.getDate(3));
                                                            int DB2Date = DB2Calendar.get(DB2Calendar.DATE);
                                                            int DB2Month = DB2Calendar.get(DB2Calendar.MONTH);
                                                            int DB2Year = DB2Calendar.get(DB2Calendar.YEAR);
           //-------------------------------------------------------- Duration -------------------------------------------------------------
           int BtwDay = 0;
           int BtwMonth=0;
           int BtwWeek=0;
           int Temp=0;
           Calendar BtwCa = new GregorianCalendar(DBYear,DBMonth,DBDate);
           if (DB2Year != DBYear) 
                     { Temp = DB2Year-DBYear; 
                        BtwMonth= ( (Temp*12)+ DB2Month )-(DBMonth);  } 
           else BtwMonth = DB2Month-DBMonth;
           if (BtwMonth == 0) BtwDay = DB2Date-DBDate; 
           else  if(BtwMonth==1) {
                                BtwCa.add(BtwCa.MONTH,BtwMonth);
                                if (  BtwCa.get(BtwCa.DATE) <= DB2Date ) 
                                            {  BtwMonth = 1;
                                                BtwDay = DB2Date - DBDate;
                                              }
                                else 
                                   {    BtwCa.add(BtwCa.MONTH,-1);
                                         for (int i=DBDate;i<32;i++)
                                                  {    BtwCa.add(BtwCa.DATE,1);
                                                        if ( BtwCa.get(BtwCa.MONTH) != DBMonth )  break ;
                                                       BtwDay++;   
                                                  }  
                                         BtwDay = DB2Date+BtwDay;
                                         BtwMonth=0;
                                    }
         } else if(BtwMonth > 1) { BtwCa.add(BtwCa.MONTH,BtwMonth);
                                                        if (  BtwCa.get(BtwCa.DATE) <= DB2Date )   
                                                      {   BtwDay = DB2Date - DBDate;  }                                      
                                                        else  {     BtwCa.add(BtwCa.MONTH,-1);
                                                                         Temp=BtwCa.get(BtwCa.MONTH);
                                                                         for (int i=DBDate;i<32;i++)
                                                                          {  BtwCa.add(BtwCa.DATE,1);
                                                                              if ( BtwCa.get(BtwCa.MONTH) != Temp )  break ;
                                                                             BtwDay++;   
                                                                           }  
                                                        BtwDay = DB2Date+BtwDay;
                                                        BtwMonth=BtwMonth-1; 
                                                      }      }                      
           for (int i=1;i<=5;i++)
                 {   if ( BtwDay>= 7 ) {
                 	 BtwDay=BtwDay-7;
                 	 BtwWeek++;  } else break;
                  }
           //---------------------------------------------------------------------------------------------------------------------------------------------------       
           out.println("<td width=\"49%\" valign=\"bottom\"><input type=\"text\" name=\"ETitle\" size=\"25\" value=\""+title+"\"></td>");
           out.println("<td align=\"right\" valign=\"bottom\" width=\"13%\"><font size=\"2\"></font></td>");
           out.println("<td align=\"right\" valign=\"bottom\" width=\"18%\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"9%\" valign=\"bottom\"><font size=\"2\"></font></td><td width=\"11%\" valign=\"bottom\"><font size=\"2\"><b>Place</b></font></td>");
           out.println("<td width=\"49%\" valign=\"bottom\"><input type=\"text\" name=\"EPlace\" size=\"25\"value=\""+place+"\"></td>");
           out.println("<td valign=\"bottom\" align=\"right\" width=\"13%\"><font size=\"2\"></font></td><td valign=\"bottom\" align=\"right\" width=\"18%\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"9%\" valign=\"bottom\"><font size=\"2\"></font></td><td width=\"11%\" valign=\"bottom\"><font size=\"2\"><b>Type</b></font></td>");
            out.println("<td width=\"49%\" valign=\"bottom\">");
           out.println("<select name=\"TypeReminder\">");
           out.print("<option value=\"Anniversary\"");
           if(theResult.getString(6).equals("Anniversary"))  out.print("selected");
           out.println(">Anniversary</option>");
           out.print("<option value=\"Appointment\"");
            if(theResult.getString(6).equals("Appointment"))  out.print("selected");
           out.println(">Appointment</option>");
           out.print("<option value=\"BillPayment\"");
            if(theResult.getString(6).equals("BillPayment"))  out.print("selected");
           out.println(">Bill Payment</option>");
           out.print("<option value=\"Birthday\"");
            if(theResult.getString(6).equals("Birthday"))  out.print("selected");
           out.println(">Birthday</option>");
           out.print("<option value=\"Breakfast\"");
            if(theResult.getString(6).equals("Breakfast"))  out.print("selected");
            out.println(">Breakfast</option>");
           out.println("<option value=\"Call\"");
            if(theResult.getString(6).equals("Call"))  out.print("selected");
           out.println(">Call</option>");
           out.print("<option value=\"Chat\"");
            if(theResult.getString(6).equals("Chat"))  out.print("selected");
           out.println(">Chat</option>");
           out.print("<option value=\"Class\"");
            if(theResult.getString(6).equals("Class"))  out.print("selected");
           out.println(">Class</option>");
           out.print("<option value=\"ClubEvent\"");
            if(theResult.getString(6).equals("ClubEvent"))  out.print("selected");
           out.println(">Club Event</option>");
           out.print("<option value=\"Concert\"");
            if(theResult.getString(6).equals("Concert"))  out.print("selected");
            out.println(">Concert</option>");
           out.print("<option value=\"Date\"");
            if(theResult.getString(6).equals("Date"))  out.print("selected");
           out.println(">Date</option>");
           out.print("<option value=\"Dinner\"");
            if(theResult.getString(6).equals("Dinner"))  out.print("selected");
           out.println(">Dinner</option>");
           out.print("<option value=\"Graduation\"");
            if(theResult.getString(6).equals("Graduation"))  out.print("selected");
           out.println(">Graduation</option>");
           out.print("<option value=\"HappyHour\"");
            if(theResult.getString(6).equals("HappyHour"))  out.print("selected");
           out.println(">Happy Hour</option>");
           out.print("<option value=\"Holiday\"");
            if(theResult.getString(6).equals("Holiday"))  out.print("selected");
           out.println(">Holiday</option>");
           out.print("<option value=\"Interview\"");
            if(theResult.getString(6).equals("Interview"))  out.print("selected");
           out.println(">Interview</option>");
           out.print("<option value=\"Lunch\"");
            if(theResult.getString(6).equals("Lunch"))  out.print("selected");
           out.println(">Lunch</option>");
           out.print("<option value=\"Meeting\"");
            if(theResult.getString(6).equals("Meeting"))  out.print("selected");
           out.println(">Meeting</option>");
           out.print("<option value=\"Movie\"");
            if(theResult.getString(6).equals("Movie"))  out.print("selected");
           out.println(">Movie</option>");
           out.println("<option value=\"NetEvent\"");
            if(theResult.getString(6).equals("NetEvent"))  out.print("selected");
           out.println(">Net Event</option>");
           out.print("<option value=\"Other\"");
            if(theResult.getString(6).equals("Other"))  out.print("selected");
           out.println(">Other</option>");
           out.print("<option value=\"Party\"");
            if(theResult.getString(6).equals("Party"))  out.print("selected");
           out.println(">Party</option>");
           out.print("<option value=\"Performance\"");
            if(theResult.getString(6).equals("Performance"))  out.print("selected");
           out.println(">Performance</option>");
           out.print("<option value=\"Reunion\"");
            if(theResult.getString(6).equals("Reunion"))  out.print("selected");
           out.println(">Reunion</option>");
           out.print("<option value=\"SportsEvent\"");
            if(theResult.getString(6).equals("SportsEvent"))  out.print("selected");
           out.println(">Sports Event</option>");
           out.print("<option value=\"Travel\"");
            if(theResult.getString(6).equals("Travel"))  out.print("selected");
           out.println(">Travel</option>");
           out.print("<option value=\"TVShow\"");
            if(theResult.getString(6).equals("TVShow"))  out.print("selected");
           out.println(">TV Show</option>");
           out.print("<option value=\"Vacation\"");
            if(theResult.getString(6).equals("Vacation"))  out.print("selected");
           out.println(">Vacation</option>");
           out.print("<option value=\"Wedding\"");
            if(theResult.getString(6).equals("Wedding"))  out.print("selected");
           out.println(">Wedding</option></select>");
           out.println("</td><td width=\"13%\">&nbsp;</td><td width=\"18%\">&nbsp;</td></tr>");
            out.println("<tr><td width=\"9%\" >&nbsp;</td><td colspan=\"3\" vAlign=bottom>");
           out.println("<font size=\"2\"><b>Start Date &amp;Time</B></FONT></TD>");
           out.println("<TD width=\"18%\">&nbsp;</TD></TR><TR><TD width=\"9%\">&nbsp;</td>");
           out.println("<TD colSpan=4><select name=\"ESDay\">");
           for (int i=1;i<=31;i++)  
                  {          out.print("<option value=\"");
          	         if ( i<10 )      out.print("0");
          	         out.print(i+"\"");
          	         if ( DBDate == i ) out.print("selected");   
          	         out.println(">"+i+"</option>"); 
                   }
           out.println("</select><select name=\"ESMonth\">");
           for (int i=1;i<=12;i++)  
                 {          out.print("<option value=\"");
          	        if ( i<10 )      out.print("0");
          	        out.print(i+"\"");
          	        if ( DBMonth == i-1 ) out.print("selected");   
          	        out.println(">"+MonthName[i-1]+"</option>"); 
                   }
           out.println("</select><select name=\"ESYear\">");
           for(int i=2001;i<=2003;i++)
                  {        out.print("<option value=\"");
                           out.print(i+"\"");
          	      if ( DBYear == i ) out.print("selected");   
          	      out.println(">"+i+"</option>"); 
                   }
           out.println("</select></b></font><br>");
           out.print("<input type=\"radio\" name=\"ETime\" value=\"AllDay\"");
            DBCalendar.setTime(theResult.getTime(2));
            int DBHour = DBCalendar.get(DBCalendar.HOUR_OF_DAY);
            int DBMin = DBCalendar.get(DBCalendar.MINUTE);
            DB2Calendar.setTime(theResult.getTime(3));
            int DB2Hour = DB2Calendar.get(DB2Calendar.HOUR_OF_DAY);
            int DB2Min = DB2Calendar.get(DB2Calendar.MINUTE);
            if (  (DB2Hour == 23) && (DB2Min == 59)) { out.print("checked");
                                                                                              checkAll = false; }
            out.println("> <font size=\"2\">All Day Event</font><br>");
            out.print("<input type=\"radio\" name=\"ETime\" value=\"SetTime\"");
            if ((DB2Hour != 23) || (DB2Min != 59) && (DBDate == DB2Date) && (DBMonth==DB2Month) && (DBYear == DB2Year))  out.print("checked");  
            out.println("><font size=\"2\"> Start Time</font>  <select name=\"EHour\">");
            for(int i=0;i<=23;i++)
                   {   out.print("<option value=\"");
                        out.print(i+"\"");
                          if ( (DBHour == i ) && (checkAll) && (DBDate == DB2Date) && (DBMonth==DB2Month) && (DBYear == DB2Year)) out.print(" selected"); 
                          out.print(">");
                          if  ( i <10 ) out.print("0");
                            out.println(i+"</option>"); 
                       }    
           out.println("</select> <font size=\"2\"><b>:</b></font> <select name=\"EMin\">");
             for(int i=0;i<=45;i= i+15)
               {  out.print("<option value=\"");
                   if ( i<10 ) out.print("00\"");
                      else out.print(i+"\"");
                   if ((i == DBMin)&& (checkAll) &&  (DBDate == DB2Date) && (DBMonth==DB2Month) && (DBYear == DB2Year))  out.print(" selected"); 
                   out.print(">");
                   if ( i < 10) out.print("0");
                   out.println(i+"</option>");
                }
           out.println("</select>&nbsp; <font size=\"2\">Duration</font>  <SELECT name=EDHour>");
           Calendar DB3Calendar = DB2Calendar;
           DB3Calendar.add(DB3Calendar.HOUR_OF_DAY,-DBHour);
           DB3Calendar.add(DB3Calendar.MINUTE,-DBMin);
           int DB3Hour = DB2Calendar.get(DB2Calendar.HOUR_OF_DAY);
           int DB3Min = DB2Calendar.get(DB2Calendar.MINUTE);
           
           out.println("<option value=\"0\">Hour</option>");
           for(int i=1;i<=23;i++)
                { out.print("<option value=\""+i+"\"");
                   if ( (DB3Hour == i )&& (checkAll) && (DBDate == DB2Date) && (DBMonth==DB2Month) && (DBYear == DB2Year))  out.print("selected");   
          	         out.println(">"+i+" Hour</option>"); 
                 }
           out.println("</select><SELECT name=EDMin>");
           out.println("<option value=\"0\">Min</option>");
           out.print("<option value=\"5\"");
           if ((DB3Min==5)&& (checkAll) && (DBDate == DB2Date) && (DBMonth==DB2Month) && (DBYear == DB2Year))  out.print(" selected");
           out.println(">5 Min</option>");
           out.print("<option value=\"10\"");
           if ((DB3Min==10)&& (checkAll) && (DBDate == DB2Date) && (DBMonth==DB2Month) && (DBYear == DB2Year))  out.print(" selected");
           out.println(">10 Min</option>");
            for(int i=15;i<=45;i= i+15)
               {  out.print("<option value=\""+i+"\"");
                   if ((i == DB3Min) && (checkAll) && (DBDate == DB2Date) && (DBMonth==DB2Month) && (DBYear == DB2Year)) out.print(" selected"); 
                   out.print(">"+i+" Min</option>");
               }
           out.println("</select></TD></TR>");
           out.println("<TR><TD width=\"9%\">&nbsp;</TD>");
           out.println("<TD colSpan=4 vAlign=bottom><FONT size=2>");
           out.print("<input type=\"radio\" name=\"ETime\" value=\"Final\"");
           if((DBDate != DB2Date) || (DBMonth!=DB2Month) || (DBYear != DB2Year)) out.print("checked"); 
           out.println(">Final Date &amp;Time</FONT></TD></TR>");
           out.println("<TR><TD width=\"9%\">&nbsp;</TD><TD vAlign=bottom>&nbsp; </TD>");
           out.println("<TD colSpan=3 vAlign=bottom>");
           out.print("<INPUT  name=\"EFB\"  type=radio value=\"EFBDate\"");
           if((DBDate != DB2Date) || (DBMonth!=DB2Month) || (DBYear != DB2Year)) out.print("checked"); 
           out.println("><FONT size=2>  Date</FONT>");  
           out.println("<select name=\"EFTDay\">");
           out.println("<option value=\"0\" selected>--</option>");
           for (int i=1;i<=31;i++)  
                  {          out.print("<option value=\"");
          	       out.print(i+"\"");
          	         if ( (DB2Date == i )&& (checkAll) &&( (DBDate != DB2Date) || (DBMonth!=DB2Month) || (DBYear != DB2Year)))  out.print("selected");   
          	         out.print(">");
          	          if ( i<10 )      out.print("0");
          	          out.println(i+"</option>"); 
                   }
           out.println("</select><select name=\"EFTMonth\">");
           out.println("<option value=\"0\" selected>--</option>");
           for (int i=1;i<=12;i++)  
                 {          out.print("<option value=\"");
          	        if ( i<10 )      out.print("0");
          	        out.print(i+"\"");
          	        if ((DB2Month == i-1 )&& (checkAll) && ((DBDate != DB2Date) || (DBMonth!=DB2Month) || (DBYear != DB2Year)))  out.print("selected");   
          	        out.println(">"+MonthName[i-1]+"</option>"); 
                   }
           out.println("</select><select name=\"EFTYear\">");
           out.println("<option value=\"0\" selected>--</option>");
           for(int i=2001;i<=2003;i++)
                  {       out.print("<option value=\"");
                           out.print(i+"\"");
          	      if ( (DB2Year == i )&& (checkAll)&& ((DBDate != DB2Date) || (DBMonth!=DB2Month) || (DBYear != DB2Year))) out.print("selected");   
          	      out.println(">"+i+"</option>"); 
                   }
           out.println("</select>&nbsp;&nbsp;<font size=\"2\">Time&nbsp;</font>");
           out.println("<select name=\"EFTHour\">");
           for(int i=0;i<=23;i++)
                   {   out.print("<option value=\"");
                        out.print(i+"\"");
                       if ((DB2Hour == i) && (checkAll) &&( (DBDate != DB2Date) || (DBMonth!=DB2Month) || (DBYear != DB2Year)) )out.print("selected");
                        out.print(">");
                          if  ( i <10 ) out.print("0");
                        out.println(i+"</option>");
                    }      
           out.println("</select> <font =\"2\"><font size=\"2\"><b>:</b></font></font> <select name=\"EFTMin\">");
           out.print("<option value=\"00\"");
           if ((DB2Min == 00)&& (checkAll) && (DBDate != DB2Date) || (DBMonth!=DB2Month) || (DBYear != DB2Year))  out.print(" selected");
           out.println(">00</option><option value=\"15\"");
            if ((DB2Min == 15)&& (checkAll) && (DBDate != DB2Date) || (DBMonth!=DB2Month) || (DBYear != DB2Year))  out.print(" selected");
           out.println(">15</option>");
           out.print("<option value=\"30\"");
            if ((DB2Min == 30) && (checkAll) && (DBDate != DB2Date) || (DBMonth!=DB2Month) || (DBYear != DB2Year)) out.print(" selected");
           out.print(">30</option><option value=\"45\"");
            if ((DB2Min == 45)&& (checkAll) && (DBDate != DB2Date) || (DBMonth!=DB2Month) || (DBYear != DB2Year))  out.print(" selected");
           out.println(">45</option></select></TD></TR>");
           out.println("<TR><TD width=\"9%\">&nbsp;</TD><TD vAlign=bottom>&nbsp; </TD>");
          out.println("<TD colSpan=3 valign=\"bottom\"><INPUT name=EFB   type=radio value=EFBDu><FONT size=2>  Duration</font>"); 
           out.println("<select name=\"EFDuM\">");     
           out.print("<option value=\"0\"");
           if (BtwMonth == 0) out.print(" selected");
            out.println(">Month</option>");
           for(int i=1;i<=12;i++)
                { out.print("<option value=\""+i+"\"");
                   if (BtwMonth == i) out.print(" selected");
                   out.println(" >"+i+" Month</option>"); }
           out.println("</select><select name=\"EFDuW\">");
           out.print("<option value=\"0\"");
           if (BtwWeek == 0) out.print(" selected");
          out.println(" >Week</option>");
           for(int i=1;i<=3;i++)
                { out.print("<option value=\""+i+"\"");
                   if (BtwWeek == i) out.print(" selected");
                    out.println(">"+i+"  Week</option>"); }
           out.println("</select><select name=\"EFDuD\">");
           out.print("<option value=\"0\"");
           if (BtwDay == 0) out.print(" selected");
           out.println(">Day</option>");
           for(int i=1;i<=6;i++)
                { out.print("<option value=\""+i+"\"");
                   if (BtwDay == i) out.print(" selected");
                   out.println(">"+i+"  Day</option>"); }
           out.println("</select></TD></TR>");
           out.println("<td width=\"9%\">&nbsp;</td><td width=\"11%\" valign=\"bottom\"><font size=\"2\"><b>Sharing</b></font></td>");
           out.println("<td width=\"49%\" valign=\"bottom\"><input type=\"radio\" name=\"ESharing\" value=\"Private\""); 
           if (theResult.getString(9).equals( "Private"))  out.print("checked");
           out.print("><font size=\"2\">Private</font> ");
           out.println("<input type=\"radio\" name=\"ESharing\" value=\"Public\"");
            if (theResult.getString(9).equals("Public"))  out.print("checked");
            out.print("><font size=\"2\">Public</font> </td><td width=\"13%\">&nbsp;</td>");
           out.println("<td width=\"18%\">&nbsp;</td></tr><tr> ");
           out.println("<td width=\"9%\" height=\"75\"><font size=\"2\" face=\"Arial\"><a name=\"repeat\"></a></font></td>");
           out.println("<td colspan=\"2\" height=\"75\"><font size=\"2\"><b>Note<br><textarea name=\"ENote\" rows=\"3\" cols=\"35\">"+theResult.getString(8)+"</textarea>");
           out.println("</b></font></td><td colspan=\"2\" height=\"75\">&nbsp;</td></tr></table></td>");
           out.println("<td width=\"30\" height=\"25\">&nbsp;</td></tr><tr><td width=\"63\" height=\"25\">&nbsp;</td>");
           out.println("<td width=\"30\" height=\"25\">&nbsp;</td></tr><tr> ");
           out.println("<td width=\"63\" height=\"249\">&nbsp;</td><td width=\"30\" height=\"249\">&nbsp;</td></tr></table>");
         }//while
                  theStatement.close();//Close statement
                   }   catch (Exception e)   {
                       out.println(e.getMessage()); } 
              
      }
}
 class ShowReminderRepeat
 {  public static int  PrintRepeat (int No,Connection theConnection,String UserID,String DefaultURL,int CurDate,int CurMonth,int CurYear,String []MonthName,String []DayName,PrintWriter out)
    {    int   No_rep = 1;
          int  No_rep1= 1;
           out.println("<table width=\"100%\" border=\"0\" ><TBODY><TR><td width=\"63\" height=\"25\">&nbsp;</td>");
           out.println("<td bgcolor=\"#94B7F1\" colspan=\"3\" height=\"25\"><table width=\"100%\" border=\"0\"><TBODY><tr><td bgcolor=\"#CCFFFF\" height=\"23\" valign=\"middle\">");
           out.println("&nbsp;<font size=\"2\" face=\"Arial\">&nbsp;<b>Repeat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
           out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
           out.println("&nbsp;&nbsp;</b><a href=\""+DefaultURL+"/servlet/mCalendar\">Main</a>&nbsp;&nbsp;&nbsp;<a href=\""+DefaultURL+"/servlet/ShowReminder?n="+No+"#newevent\">New");
           out.println(" Event</a><b> &nbsp;</b>&nbsp;<a href=\""+DefaultURL+"/servlet/ShowReminder?n="+No+"#remind\">Remind</a></font></td>");
           out.println("</tr></table></td><td width=\"30\" height=\"25\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"63\" height=\"50\">&nbsp;</td><td height=\"50\" colspan=\"3\" rowspan=\"3\" bgcolor=\"#49B0FC\" valign=\"middle\">");
           out.println("<table width=\"100%\" border=\"0\"><tr><td width=\"9%\" valign=\"bottom\"><font size=\"2\"></font></td>");
           out.print("<td width=\"6%\" valign=\"bottom\"><font size=\"2\"><input type=\"radio\" name=\"RepeatB\" value=\"NoRep\"");  
            try{    
                      Statement  theStatement=theConnection.createStatement();
                      ResultSet theResult = theStatement.executeQuery(" Select  no_rep  from calendar  where id = ' "+UserID+"'  and no_cal = '"+No+"'"  );
                      while (theResult.next()) {  No_rep1 = theResult.getInt(1);
             	if (theResult.getInt(1) == 1)  
             	        { out.print("checked");
                               }
                             else  No_rep = theResult.getInt(1);
                                                                    } //while
               theResult.close();
               theStatement.close();//Close statement
               }   catch (Exception e)   { out.println(e.getMessage()); } 
           out.println("></font></td>");                      
           out.println("<td valign=\"bottom\" colspan=\"2\"> <b><font size=\"2\">Don't Repeat This Event </font></b></td>");
                      
           out.println("<td align=\"right\" valign=\"bottom\" width=\"9%\"><font size=\"2\"></font> ");
           out.println("</td><td align=\"right\" valign=\"bottom\" width=\"14%\">&nbsp;</td></tr><tr> ");
           out.println("<td width=\"9%\" valign=\"bottom\"><font size=\"2\"></font></td><td width=\"6%\" valign=\"bottom\"><font size=\"2\"> ");
           out.print("<input type=\"radio\" name=\"RepeatB\" value=\"RepWeek\"");
              if (No_rep == 1) {  
           out.println("></font></td>");
           out.println("<td valign=\"bottom\" colspan=\"2\"><b><font size=\"2\">Repeat Every <select name=\"RepeatL1\">");
           for(int i=0;i<=6;i++)
                 {  out.print("<option value=\""+DayName[i]+"\">");
                     out.print(DayName[i]+"</option>");
                  }
           out.println("<option value=\"Day\">Day</option><option value=\"Week\">Week</option>");
           out.println("<option value=\"Month\">Month</option><option value=\"Year\">Year</option>");
           out.println("</select></font></b> </td>");
           out.println("<td valign=\"bottom\" align=\"right\" width=\"9%\"><font size=\"2\"></font></td>");
           out.println("<td valign=\"bottom\" align=\"right\" width=\"14%\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"9%\"><font size=\"2\"><b> </b></font> </td><td width=\"6%\"><font size=\"2\"><b> </b></font></td>");
           out.println("<td width=\"6%\"><input type=\"radio\" name=\"RepeatB2\" value=\"Alway\" checked></td> ");
           out.println("<td width=\"56%\" valign=\"bottom\"> <font size=\"2\"><b>Always</b></font></td><td colspan=\"2\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"9%\" height=\"0\"><a name=\"remind\"></a></td><td width=\"6%\" height=\"0\"><font size=\"2\"></font></td>");
           out.println("<td height=\"0\"><input type=\"radio\" name=\"RepeatB2\" value=\"Until\"></td>");
           out.println("<td valign=\"bottom\" height=\"0\"><font size=\"2\"><b>Until <select name=\"RB2Day\">");
           for (int i=1;i<=31;i++)  
                  {          out.print("<option value=\"");
          	         if ( i<10 )      out.print("0");
          	         out.print(i+"\"");
          	         if ( CurDate == i ) out.print("selected");   
          	         out.println(">"+i+"</option>"); 
                   }
           out.println("</select><select name=\"RB2Month\">");
           for (int i=1;i<=12;i++)  
                 {          out.print("<option value=\"");
          	        if ( i<10 )      out.print("0");
          	        out.print(i+"\"");
          	        if ( CurMonth == i-1 ) out.print("selected");   
          	        out.println(">"+MonthName[i-1]+"</option>"); 
                   }
           out.println("</select><select name=\"RB2Year\">");
           for(int i=2001;i<=2003;i++)
                  {        out.print("<option value=\"");
                           out.print(i+"\"");
          	      if ( CurYear == i ) out.print("selected");   
          	      out.println(">"+i+"</option>"); 
                   }
           out.println(" </select></b></font></td>");
           out.println("<td colspan=\"2\" height=\"0\">&nbsp;</td> </tr></table></td>");
           out.println("<td width=\"30\" height=\"25\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"63\" height=\"50\">&nbsp;</td><td width=\"30\" height=\"25\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"63\" height=\"57\">&nbsp;</td><td width=\"30\" height=\"57\">&nbsp;</td></tr></table> ");
                                                  }/* No_rep == 1*/  else {    
           try{    
                      Statement  theStatement=theConnection.createStatement();
                      ResultSet theResult = theStatement.executeQuery( " select  *  from repeat  where id = ' "+UserID+"'  and no_rep = '"+No_rep+" ' "  );         
                      while(theResult.next()) {  
                      if  (  (theResult.getString(3).equals(" Sunday "))  ||  (theResult.getString(3).equals(" Monday ")) ||  (theResult.getString(3).equals(" Tuesday "))  ||  (theResult.getString(3).equals(" Wednesday ")) || (theResult.getString(3).equals(" Thursday ")) ||(theResult.getString(3).equals(" Friday "))  ||  (theResult.getString(3).equals(" Saturday ")) ||                          
               (theResult.getString(3).equals(" Day "))  ||  (theResult.getString(3).equals(" Week ")) ||(theResult.getString(3).equals(" Month "))  ||  (theResult.getString(3).equals(" Year ")) )
                   out.print("checked");
           out.println("></font></td>");
           out.println("<td valign=\"bottom\" colspan=\"2\"><b><font size=\"2\">Repeat Every <select name=\"RepeatL1\">");
           for(int i=0;i<=10;i++)
                 {  out.print("<option value=\""+DayName[i]+"\"");
                     if ( theResult.getString(3).equals(" "+DayName[i]+" ") )   out.print("\" selected");
                     out.println(">"+DayName[i]+"</option>");
                   }
           out.println("</select></font></b> </td>");
           out.println("<td valign=\"bottom\" align=\"right\" width=\"9%\"><font size=\"2\"></font></td>");
           out.println("<td valign=\"bottom\" align=\"right\" width=\"14%\">&nbsp;</td></tr>");
                  
           out.println("<tr><td width=\"9%\"><font size=\"2\"><b> </b></font> </td><td width=\"6%\"><font size=\"2\"><b> </b></font></td>");
           Calendar RepFCalendar = new GregorianCalendar();
                                                            RepFCalendar.setTime(theResult.getDate(2));
                                                            int RepFDate = RepFCalendar.get(RepFCalendar.DATE);
                                                            int RepFMonth = RepFCalendar.get(RepFCalendar.MONTH);
                                                            int RepFYear = RepFCalendar.get(RepFCalendar.YEAR);
           out.print("<td width=\"6%\"><input type=\"radio\" name=\"RepeatB2\" value=\"Alway\"");
           if (( RepFDate==31) && (RepFMonth == 11) && (RepFYear == 2003)) out.print("checked");
           out.print("></td> ");
           out.println("<td width=\"56%\" valign=\"bottom\"> <font size=\"2\"><b>Always</b></font></td><td colspan=\"2\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"9%\" height=\"0\"><a name=\"remind\"></a></td><td width=\"6%\" height=\"0\"><font size=\"2\"></font></td>");
           out.print("<td height=\"0\"><input type=\"radio\" name=\"RepeatB2\" value=\"Until\"");
             if  (( RepFDate!=31) || (RepFMonth != 11) || (RepFYear != 2003)) out.print("checked");
            out.println("></td>");
           out.println("<td valign=\"bottom\" height=\"0\"><font size=\"2\"><b>Until <select name=\"RB2Day\">");
           for (int i=1;i<=31;i++)  
                  {          out.print("<option value=\"");
          	         out.print(i+"\"");
          	         if ( RepFDate == i ) out.print("selected");   
          	           out.print(">");
          	           if ( i<10 )      out.print("0");
          	         out.println(i+"</option>"); 
                   }
           out.println("</select><select name=\"RB2Month\">");
           for (int i=1;i<=12;i++)  
                 {          out.print("<option value=\"");
          	        out.print(i+"\"");
          	        if ( RepFMonth == i-1 ) out.print("selected");   
          	         out.print(">");
          	         out.println(MonthName[i-1]+"</option>"); 
                   }
           out.println("</select><select name=\"RB2Year\">");
           for(int i=2001;i<=2003;i++)
                  {        out.print("<option value=\"");
                           out.print(i+"\"");
          	      if ( RepFYear == i ) out.print("selected");   
          	      out.println(">"+i+"</option>"); 
                   }
           out.println(" </select></b></font></td>");
           out.println("<td colspan=\"2\" height=\"0\">&nbsp;</td> </tr></table>");
           out.println("</TD> <TD height=25 width=30>&nbsp;</TD> </TR> </TBODY></TABLE>");
            }//while
              theStatement.close();//Close statement
                    } catch (Exception e)   { out.println(e.getMessage()); }                                        
                                           }//else
               return No_rep1;
                }
}
class ShowReminderReminder
{  public static int  PrintReminder (int No,Connection theConnection,String UserID,String DefaultURL,PrintWriter out)
      {    int No_rem = 1; 
           int No_rem1= 1;
           out.println("<table width=\"100%\" border=\"0\"> <tr> ");
           out.println("<td width=\"64\" height=\"25\">&nbsp;</td><td bgcolor=\"#94B7F1\" colspan=\"3\" height=\"25\" valign=\"middle\"><table width=\"100%\" border=\"0\">");
           out.println("<tr><td bgcolor=\"#CCFFFF\" height=\"23\" valign=\"middle\">&nbsp;");
           out.println("<font size=\"2\" face=\"Arial\">&nbsp;<b>Send Reminder&nbsp;");
           out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
           out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
           out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>");
           out.println("<a href=\""+DefaultURL+"/servlet/mCalendar\">Main</a>&nbsp;&nbsp;&nbsp;</b><a href=\""+DefaultURL+"/servlet/ShowReminder?n="+No+"#newevent\">New Event</a>");
           out.println("<b> &nbsp;&nbsp;</b><a href=\""+DefaultURL+"/servlet/ShowReminder?n="+No+"#repeat\">Repeat</a></font></td></tr></table></td>");
           out.println("<td width=\"31\" height=\"25\">&nbsp;</td></tr><tr><td width=\"64\" height=\"25\">&nbsp;</td>");
           out.println("<td height=\"187\" colspan=\"3\" rowspan=\"3\" bgcolor=\"#49B0FC\" valign=\"top\" align=\"center\">");
           out.println("<table width=\"96%\" border=\"0\"><tr><td valign=\"bottom\" width=\"12%\" align=\"right\"><font size=\"2\">");
           out.println("<input type=\"radio\" name=\"RemindB\" value=\"NoRem\"");
             int DBDate=0;
             int DBMonth=0;
             int DBYear=0;
             int DBHour=0;
             int DBMin=0;
           
              int EStartDate = 0;
              int EStartMonth = 0;
              int EStartYear = 0;  
              int EStartHour= 0;       
              int EStartMin = 0;        
               int EStartDate5 = 0;
              int EStartMonth5 = 0;
              int EStartYear5 = 0;  
              int EStartHour5= 0;       
              int EStartMin5 = 0;                
             try{    
                      Statement  theStatement=theConnection.createStatement();
                      ResultSet theResult = theStatement.executeQuery(" Select  no_rem,time from calendar  where id = ' "+UserID+"'  and no_cal = '"+No+"'"  );
                      while (theResult.next()) { No_rem = theResult.getInt(1);
                      		     
             	if (theResult.getInt(1) == 1)  
             	        { out.print("checked");
                               }
                             else  No_rem = theResult.getInt(1);
                      Calendar DBCalendar = new GregorianCalendar();
                                                            DBCalendar.setTime(theResult.getDate(2));
                                                            DBDate = DBCalendar.get(DBCalendar.DATE);
                                                           DBMonth = DBCalendar.get(DBCalendar.MONTH);
                                                            DBYear = DBCalendar.get(DBCalendar.YEAR); 
                                                              DBCalendar.setTime(theResult.getTime(2)); 
                                                             DBHour= DBCalendar.get(DBCalendar.HOUR_OF_DAY);       
                                                            DBMin = DBCalendar.get(DBCalendar.MINUTE);                                             
                                                                    } //while
               theResult.close();
               theStatement.close();//Close statement
        }   catch (Exception e)   { out.println(e.getMessage()); } 
           out.println("  ></font> </td><td valign=\"bottom\" colspan=\"3\">");
             //out.println(No_rem+"&"+No);
            Calendar EStartCalendar = new GregorianCalendar();
            Calendar EStartCalendar5 = new GregorianCalendar();
            try{    
                      Statement  theStatement=theConnection.createStatement();
                      ResultSet theResult = theStatement.executeQuery(
                                                "select  freq_before,freq_and  from remind  where no_rem="+No_rem);
                          while (theResult.next())   {    theResult.getDate(1);
                    	                                                   if (!theResult.wasNull())
                    	                                                   { 
                                                                         EStartCalendar.setTime(theResult.getDate(1));
                                                                         EStartDate = EStartCalendar.get(EStartCalendar.DATE);
                                                                         EStartMonth = EStartCalendar.get(EStartCalendar.MONTH);
                                                                         EStartYear = EStartCalendar.get(EStartCalendar.YEAR);  
                                                                         EStartCalendar.setTime(theResult.getTime(1));
                                                                         EStartHour= EStartCalendar.get(EStartCalendar.HOUR_OF_DAY);       
                                                                         EStartMin = EStartCalendar.get(EStartCalendar.MINUTE);     }
                                                                        theResult.getDate(2);
                    	                                                   if (!theResult.wasNull())
                    	                                                   { 
                                                                         EStartCalendar5.setTime(theResult.getDate(2));
                                                                         EStartDate5 = EStartCalendar5.get(EStartCalendar5.DATE);
                                                                         EStartMonth5 = EStartCalendar5.get(EStartCalendar5.MONTH);
                                                                         EStartYear5 = EStartCalendar5.get(EStartCalendar5.YEAR);  
                                                                         EStartCalendar5.setTime(theResult.getTime(2));
                                                                         EStartHour5= EStartCalendar5.get(EStartCalendar5.HOUR_OF_DAY);       
                                                                         EStartMin5 = EStartCalendar5.get(EStartCalendar5.MINUTE);    }//if
                                                                                              }//while
                  theResult.close();
               theStatement.close();//Close statement
        }   catch (Exception e)   { out.println(e.getMessage()); } 
         try{    
                      Statement  theStatement=theConnection.createStatement();
                      ResultSet theResult = theStatement.executeQuery(
                                                "select  freq_before,freq_and  from remind  where  no_cal ="+No);
                          while (theResult.next())   {    theResult.getDate(1);
                    	                                                   if (!theResult.wasNull())
                    	                                                   { 
                                                                         EStartCalendar.setTime(theResult.getDate(1));
                                                                         EStartDate = EStartCalendar.get(EStartCalendar.DATE);
                                                                         EStartMonth = EStartCalendar.get(EStartCalendar.MONTH);
                                                                         EStartYear = EStartCalendar.get(EStartCalendar.YEAR);  
                                                                         EStartCalendar.setTime(theResult.getTime(1));
                                                                         EStartHour= EStartCalendar.get(EStartCalendar.HOUR_OF_DAY);       
                                                                         EStartMin = EStartCalendar.get(EStartCalendar.MINUTE);     }
                                                                        theResult.getDate(2);
                    	                                                   if (!theResult.wasNull())
                    	                                                   { 
                                                                         EStartCalendar5.setTime(theResult.getDate(2));
                                                                         EStartDate5 = EStartCalendar5.get(EStartCalendar5.DATE);
                                                                         EStartMonth5 = EStartCalendar5.get(EStartCalendar5.MONTH);
                                                                         EStartYear5 = EStartCalendar5.get(EStartCalendar5.YEAR);  
                                                                         EStartCalendar5.setTime(theResult.getTime(2));
                                                                         EStartHour5= EStartCalendar5.get(EStartCalendar5.HOUR_OF_DAY);       
                                                                         EStartMin5 = EStartCalendar5.get(EStartCalendar5.MINUTE);    }//if
                                                                                              }//while
                  theResult.close();
               theStatement.close();//Close statement
        }   catch (Exception e)   { out.println(e.getMessage()); } 
          // out.println(EStartDate+"/"+EStartMonth+"/"+EStartYear+"/"+EStartHour+"/"+EStartMin);
           //out.println(EStartDate5+"/"+EStartMonth5+"/"+EStartYear5+"/"+EStartHour5+"/"+EStartMin5);
          out.println("<font size=\"2\"> <b>Don't Send Reminder</b><br>");
           out.println("</font></td><td width=\"11%\">&nbsp;</td></tr>");
           out.print("<tr><td valign=\"bottom\" width=\"12%\" align=\"right\" height=\"23\"><font size=\"2\"><input type=\"radio\" name=\"RemindB\" value=\"SendRem\"");
           if (No_rem != 1) out.print("checked");
           out.println("></font> </td><td valign=\"bottom\" colspan=\"3\" height=\"23\"><font size=\"2\"><b>Send Reminder</b><br>");
           out.println("</font></td><td width=\"11%\" height=\"23\">&nbsp;</td></tr>");
           out.println("<tr><td align=\"right\" valign=\"bottom\" colspan=\"2\"><font size=\"2\"><b>Before Event </b></font></td>");
           out.println("<td colspan=\"3\">");
           //*******************************************  Duration ************************************************************
           int BtwDay = 0;
           int BtwHour=0;
           int BtwWeek=0;
           int BtwMin=0;
           int Temp=0;
          //out.println(DBMin+":"+DBHour+"/"+DBDate+"/"+DBMonth+"/"+DBYear+"<br/>");
           //out.println(EStartMin+":"+EStartHour+"/"+EStartDate+"/"+EStartMonth+"/"+EStartYear+"<br/>");
          Calendar BtwCa = new GregorianCalendar();
                        if (EStartYear !=0 ) {
          BtwCa = new GregorianCalendar(EStartYear,EStartMonth,EStartDate,EStartHour,EStartMin);
          while(true) {   
          if ( BtwCa.get(BtwCa.MINUTE) == DBMin )  break;
          else { BtwMin=BtwMin+15; 
          	 BtwCa.add(BtwCa.MINUTE,15);
                     }
                               }//Minute  
          while(true)
           {  if (BtwCa.get(BtwCa.HOUR_OF_DAY) == DBHour ) break;
             else {   BtwHour++;
             	      BtwCa.add(BtwCa.HOUR_OF_DAY,1); 
                        }       
           } 
         while (true)
          { if ( ( BtwCa.get(BtwCa.MONTH) == DBMonth ) && (BtwCa.get(BtwCa.DATE) == DBDate) && (BtwCa.get(BtwCa.YEAR) == DBYear ) )
                               { break; } else {
                               BtwDay++;               
                               BtwCa.add(BtwCa.DATE,1);
                                                            }
            }
           for (int i=1;i<=5;i++)
                 {   if ( BtwDay>= 7 ) {
                 	 BtwDay=BtwDay-7;
                 	 BtwWeek++;  } else break;
                  }          }//if year != 0
          //************************************************** Check And Min****************************************
          int AndMin=0;
          if (EStartYear5 !=0 ) {
          BtwCa = new GregorianCalendar(EStartYear5,EStartMonth5,EStartDate5,EStartHour5,EStartMin5);              
          while(true) {   
          if ( BtwCa.get(BtwCa.MINUTE) == DBMin )  break;
          else { AndMin=AndMin+5; 
          	 BtwCa.add(BtwCa.MINUTE,5);
                     }     } }// if EStartYear 5 
        //**************************************************   End    ****************************************      */
           if (No_rem ==1) {
           out.println("<select name=\"RemindWeek\">");
           out.println("<option value=\"0\"");
           out.println(" >Week</option><option value=\"1\">1 Week</option>");
           out.println("<option value=\"2\">2 Week</option><option value=\"3\">3 Week</option>");
           out.println("<option value=\"4\">4 Week</option></select>");
           out.println("<select name=\"RemindDay\"><option value=\"0\">Day</option>");
           for(int i=1;i<=6;i++)
               { out.print("<option value=\""+i+"\">"+i+" Day</option>"); }
           out.println("</select><select name=\"RemindHour\"><option value=\"0\">Hour</option>");
           for(int i=1;i<=23;i++)
                { out.print("<option value=\""+i+"\">"+i+" Hour</option>"); }
           out.println("</select><select name=\"RemindMin\">");
           out.println("<option value=\"0\" selected>Min</option>");
           for(int i=15;i<=45;i=i+15)
                { out.println("<option value=\""+i+"\">"+i+" Min</option>");  }
           out.println("</select></td></tr><tr><td align=\"right\" valign=\"bottom\" colspan=\"2\">");  
             out.println("<b><font size=\"2\">And </font></b></td><td colspan=\"3\" valign=\"bottom\">");
           out.println("<b><font size=\"2\"><select name=\"RemindBefore\">");
           out.println("<option value=\"0\">--</option><option value=\"5\">5 </option>");
           out.println("<option value=\"10\">10 </option>");
           out.println("</select></font></b>");
           out.println("<font size=\"2\">Minutes</font><b><font size=\"2\"> &nbsp;&nbsp;Before Event</font></b></td></tr>");
           out.println("<tr><td align=\"right\" valign=\"top\" colspan=\"2\"><b><font size=\"2\">By</font></b></td>");
           out.println("<td valign=\"bottom\" colspan=\"3\"><font size=\"2\"><input type=\"checkbox\" name=\"RemindCBPager\" value=\"Pager\"");
           out.println("><b>Pager &amp; Mobile Phone</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ");
           out.println("<select name=\"RemindPager\"><option value=\"152\">152</option><option value=\"162\">162</option>");
           out.println("<option value=\"1144\">1144</option><option value=\"1500\">1500</option><option value=\"GSM\">GSM</option>");
           out.println("<option value=\"Hello\">Hello</option></select><b>");
           out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Number</b><input type=\"text\" name=\"PNumber\" size=\"7\"><b><br>");
           out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Password &nbsp;");
           out.println("&nbsp;&nbsp;&nbsp;Re-Password</b><br>&nbsp;&nbsp;&nbsp;&nbsp; ");
           out.println("<input type=\"password\" name=\"PagerPw\" size=\"8\" maxlength=\"10\" >&nbsp;");
           out.println("<input type=\"password\" name=\"RePassWd\" size=\"8\" maxlength=\"10\" ></font></td></tr>");
           out.println("<tr><td colspan=\"2\">&nbsp;</td><td colspan=\"3\"> ");
           out.println("<input type=\"checkbox\" name=\"RemindCEmail\" value=\"Email\"><font size=\"2\"><b> Email</b><br>");
           out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"text\" name=\"RemindEmail\" size=\"35\" maxlength=\"35\"></font></td>");
           out.println("</tr><tr><td align=\"right\" valign=\"bottom\" colspan=\"2\"><b><font size=\"2\"> ");
           out.println("Message</font></b></td><td colspan=\"3\">");
           out.println("<input type=\"text\" name=\"RemindMessage\" size=\"39\"></td></tr>");
           out.println("<tr><td align=\"right\" valign=\"bottom\" colspan=\"2\" ><b><font size=\"2\">From</font></b></td>");
           out.println("<td width=\"34%\"  valign=\"bottom\"><input type=\"text\" name=\"RemindFrom\"></td>");
           out.println("</tr></table></td>");
           out.println("<td width=\"31\" height=\"25\">&nbsp;</td></tr> <tr> ");
           out.println("<td width=\"64\" height=\"24\">&nbsp;</td><td width=\"31\" height=\"24\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"64\" height=\"240\">&nbsp;</td><td width=\"31\" height=\"240\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"63\" height=\"38\">&nbsp;</td><td colspan=\"3\" height=\"38\" bgcolor=\"#94B7F1\">");
           out.println("<table width=\"100%\" border=\"0\"><tr><td bgcolor=\"#DEDEDE\" align=\"right\" valign=\"middle\" height=\"30\">");
           out.println("<input type=\"submit\" name=\"Update\" value=\"  Update  \">");
           out.println("<input type=\"submit\" name=\"Deletesome\" value=\" Delete Some \">");
           out.println("<input type=\"submit\" name=\"Deleteall\" value=\" Delete Until\">");
           out.println("<input type=\"submit\" name=\"Cancel\" value=\"Cancel\">");
           out.println("&nbsp; </td></tr></table></td>");
           out.println("<td width=\"30\" height=\"38\">&nbsp;</td></tr></table>");
        }//if No_rem=1
       else {
            
             try{    
                      Statement  theStatement=theConnection.createStatement();
                      ResultSet theResult = theStatement.executeQuery( " select  *  from remind  where id = ' "+UserID+"'  and no_rem = "+No_rem  );         
                      while(theResult.next()) {  
                       out.println("<select name=\"RemindWeek\">");
                       out.print("<option value=\"0\"");
                       if (BtwWeek==0) out.print("selected");
                       out.print(" >Week</option><option value=\"1\"");
                        if (BtwWeek==1) out.print("selected");
                       out.println(">1 Week</option>");
                       out.print("<option value=\"2\"");
                        if (BtwWeek==2) out.print("selected");
                       out.print(">2 Week</option><option value=\"3\"");
                        if (BtwWeek==3) out.print("selected");
                       out.println(">3 Week</option>");
                      out.print("<option value=\"4\"");
                       if (BtwWeek==4) out.print("selected");
                      out.println(">4 Week</option></select>");
                      out.print("<select name=\"RemindDay\"><option value=\"0\"");
                       if (BtwDay==0) out.print("selected");
                      out.println(">Day</option>");
           for(int i=1;i<=6;i++)
               { out.print("<option value=\""+i+"\"");
                  if (BtwDay==i) out.print("selected");
                  out.println(">"+i+" Day</option>"); }
           out.print("</select><select name=\"RemindHour\"><option value=\"0\"");
           if (BtwHour==0) out.print("selected");
           out.println(">Hour</option>");
           for(int i=1;i<=23;i++)
                { out.print("<option value=\""+i+"\"");
                   if (BtwHour==i) out.print("selected");
                   out.println(">"+i+" Hour</option>"); }
           out.println("</select><select name=\"RemindMin\">");
           out.print("<option value=\"0\"");
           if (BtwMin==0) out.print("selected");
           out.println(">Min</option>");
          for(int i=15;i<=45;i=i+15)
                {out.print("<option value=\""+i+"\"");
                  if (BtwMin==i) out.print("selected");
                  out.println(">"+i+" Min</option>"); }
           out.println("</select></td></tr><tr><td align=\"right\" valign=\"bottom\" colspan=\"2\">");  
           out.println("<b><font size=\"2\">And </font></b></td><td colspan=\"3\" valign=\"bottom\">");
           out.println("<b><font size=\"2\"><select name=\"RemindBefore\">");
           out.print("<option value=\"0\"");
           if (AndMin==0) out.print("selected");
           out.println(">-</option>");
           for(int i=5;i<=10;i=i+5 )  { 
           out.print("<option value=\""+i+"\"");
           if (AndMin==i) out.print("selected");
           out.println(">"+i+"</option>");  } //for
          out.println("</select></font></b>");
           out.println("<font size=\"2\">Minutes</font><b><font size=\"2\"> &nbsp;&nbsp;Before Event</font></b></td></tr>");
           out.println("<tr><td align=\"right\" valign=\"top\" colspan=\"2\"><b><font size=\"2\">By</font></b></td>");
           out.println("<td valign=\"bottom\" colspan=\"3\"><font size=\"2\"><input type=\"checkbox\" name=\"RemindCBPager\" value=\"Pager\"");
            if ( !(theResult.getString(5).equals("No Type")))  out.print("checked");
           out.println("><b>Pager &amp; Mobile Phone</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ");
           out.print("<select name=\"RemindPager\"><option value=\"152\"");
             if (theResult.getString(5).equals("152 ")) out.print(" selected");
           out.print(">152</option><option value=\"162\"");
               if (theResult.getString(5).equals("162")) out.print(" selected");
            out.println(">162</option>");
           out.print("<option value=\"1144\"");
               if (theResult.getString(5).equals("1144")) out.print(" selected");
            out.print(">1144</option><option value=\"1500\"");
                if (theResult.getString(5).equals("1500")) out.print(" selected");
            out.print(">1500</option><option value=\"GSM\"");
                if (theResult.getString(5).equals("GSM")) out.print(" selected");
            out.println(">GSM</option>");
           out.print("<option value=\"ICQ\"");
               if (theResult.getString(5).equals("ICQ")) out.print(" selected");
           out.println(">ICQ</option></select><b>");
           out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Number</b><input type=\"text\" name=\"PNumber\" size=\"7\""); 
              if ( !(theResult.getString(5).equals("No Type")))  out.print("value=\""+theResult.getInt(6)+"\"><b><br>");
           out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Password &nbsp;");
           out.println("&nbsp;&nbsp;&nbsp;Re-Password</b><br>&nbsp;&nbsp;&nbsp;&nbsp; ");
           out.println("<input type=\"password\" name=\"PagerPw\" size=\"8\" maxlength=\"10\" >&nbsp;");
           out.println("<input type=\"password\" name=\"RePassWd\" size=\"8\" maxlength=\"10\" ></font></td></tr>");
           out.println("<tr><td colspan=\"2\">&nbsp;</td><td colspan=\"3\"> ");
           out.print("<input type=\"checkbox\" name=\"RemindCEmail\" value=\"Email\"");
            if ( !(theResult.getString(8).equals("No Email")))  out.print("checked");
           out.println("><font size=\"2\"><b> Email</b><br>");
           out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"text\" name=\"RemindEmail\" size=\"35\"");
            if ( !(theResult.getString(8).equals("No Email"))) out.print("value=\""+theResult.getString(8)+"\"");
           out.println(" maxlength=\"35\" ></font></td>");
           out.println("</tr><tr><td align=\"right\" valign=\"bottom\" colspan=\"2\"><b><font size=\"2\"> ");
           out.println("Message</font></b></td><td colspan=\"3\">");
           out.println("<input type=\"text\" name=\"RemindMessage\" size=\"39\" value=\""+theResult.getString(9)+"\"></td></tr>");
           out.println("<tr><td align=\"right\" valign=\"bottom\" colspan=\"2\" ><b><font size=\"2\">From</font></b></td>");
           out.println("<td width=\"34%\"  valign=\"bottom\"><input type=\"text\" name=\"RemindFrom\" value=\""+theResult.getString(10)+"\"></td>");
           out.println("</tr></table></td>");
           out.println("<td width=\"31\" height=\"25\">&nbsp;</td></tr> <tr> ");
           out.println("<td width=\"64\" height=\"24\">&nbsp;</td><td width=\"31\" height=\"24\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"64\" height=\"240\">&nbsp;</td><td width=\"31\" height=\"240\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"63\" height=\"38\">&nbsp;</td><td colspan=\"3\" height=\"38\" bgcolor=\"#94B7F1\">");
           out.println("<table width=\"100%\" border=\"0\"><tr><td bgcolor=\"#DEDEDE\" align=\"right\" valign=\"middle\" height=\"30\">");
           out.println("<input type=\"submit\" name=\"Update\" value=\"  Update  \">");
           out.println("<input type=\"submit\" name=\"Deletesome\" value=\" Delete Some \">");
           out.println("<input type=\"submit\" name=\"Deleteall\" value=\" Delete Until\">");
           out.println("<input type=\"submit\" name=\"Cancel\" value=\"Cancel\">");
           out.println("&nbsp; </td></tr></table></td>");
           out.println("<td width=\"30\" height=\"38\">&nbsp;</td></tr></table>");
                                                                    } //while
               theResult.close();
               theStatement.close();//Close statement
        }   catch (Exception e)   { out.println(e.getMessage()); }         
}//else	
   return No_rem;
       }
 }  