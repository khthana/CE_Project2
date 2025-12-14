import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class Reminder extends HttpServlet
 {    String DefaultURL="http://161.246.5.233:8080/planny"; 
       String [] MonthName = {"January","February","March","April","May", "June","July","August","September","October","November","December"};
       String []DayName={"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"} ;  
       int  CurDate      =  Calendar.getInstance().get(Calendar.DAY_OF_MONTH); 
       int  CurMonth    =  Calendar.getInstance().get(Calendar.MONTH); 
       int  CurYear      =  Calendar.getInstance().get(Calendar.YEAR); 
       int  CurHour      =  Calendar.getInstance().get(Calendar.HOUR_OF_DAY); 
       long TimeMili = Calendar.getInstance().getTime().getTime();
      
      protected void doGet(HttpServletRequest req , HttpServletResponse res) throws ServletException, IOException
      {         HttpSession session = req.getSession(true);
                 Object  UserID = session.getValue("login.username");
                 if ( UserID == null  ) {  res.sendRedirect(DefaultURL);  }
                 session.putValue("Reminder.t",Long.toString(TimeMili));              
                 String GiveTime = req.getParameter("t");
              int GDate= CurDate;
             int GMonth=CurMonth;
             int GYear=CurYear;
             int GHour = CurHour;
             Calendar GCalendar = new GregorianCalendar();
             if (GiveTime!=null) {
             Date MakeDate = new Date(Long.parseLong(GiveTime));
             GCalendar.setTime(MakeDate);
             GDate = GCalendar.get(GCalendar.DATE); 
             GMonth = GCalendar.get(GCalendar.MONTH);
             GYear = GCalendar.get(GCalendar.YEAR);
             GHour = GCalendar.get(GCalendar.HOUR_OF_DAY);
             session.putValue("Reminder.t",GiveTime);
                                                }else  {  GiveTime = Long.toString(TimeMili); }	
           res.setContentType("text/html");
           PrintWriter out = res.getWriter(); 
           out.println("<html><head><title>Planny Organizer</title><meta http-equiv=\"Content-Type\" content=\"text/html; charset=Windows-874\"><style type=\"text/css\">");
           out.println("<!--body {  margin: 0px  0px; padding: 0px  0px}");
           out.println("a:link { color: #005CA2; text-decoration: none}");
           out.println("a:visited { color: #005CA2; text-decoration: none}");
           out.println("a:active { color: #0099FF; text-decoration: underline}");
           out.println("a:hover { color: #0099FF; text-decoration: underline}--></style>");
           out.println("<script language=\"JavaScript\">");
           out.println("<!-- ");
           out.println("function CheckClick(C) {");
           out.println("len = document.Reminder.elements.length;");
           out.println("var i=0;");
           out.println("for (i=0;i<len;i++) {");
           out.println("if(C==\'Pager\') { ");
           out.println("if (document.Reminder.elements[i].name==\'RemindCBPager\' ) {");
           out.println("document.Reminder.elements[i].checked=true;");
           out.println("break;");
           out.println("}}else if (C==\'Mail\'){" );
           out.println("if (document.Reminder.elements[i].name==\'RemindCEmail\' ) {");
           out.println("document.Reminder.elements[i].checked=true;");
           out.println("break;");
           out.println("}}}}");
            out.println("function MM_findObj(n, d) { //v4.0");
            out.println("var p,i,x;  if(!d) d=document; if((p=n.indexOf(\"?\"))>0&&parent.frames.length) {");
            out.println(" d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}");
            out.println("if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];");
            out.println("for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);");
            out.println("if(!x && document.getElementById) x=document.getElementById(n); return x;");
            out.println("}");

            out.println("function MM_validateForm(C) { //v4.0");
            out.println("var i,p,q,nm,test,num,min,max,errors=\'\',args=MM_validateForm.arguments;");
            out.println("for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);");
            out.println("if (val) { nm=val.name; if ((val=val.value)!=\"\") {");
            out.println("if (test.indexOf(\'isEmail\')!=-1) { p=val.indexOf(\'@\');");
            out.println("if (p<1 || p==(val.length-1)) errors+=\'- This field must contain an e-mail address.\\n\';");
            out.println("} else if (test!=\'R\') {");
            out.println("if (isNaN(val)) errors+=\'- This field must contain a number.\\n\';");
            out.println("if (test.indexOf(\'inRange\') != -1) { p=test.indexOf(\':\');");
            out.println("min=test.substring(8,p); max=test.substring(p+1);");
            out.println("if (val<min || max<val) errors+=\'- This field must contain a number between \'+min+\' and \'+max+\'.\\n\';");
            out.println("} } } else if (test.charAt(0) == \'R\') errors += \'- \'+nm+\' is required.\\n\'; }");
            out.println("} if (errors) alert(\'The following error(s) occurred:\\n\'+errors);");
            out.println("document.MM_returnValue = (errors == \'\');");
         
            out.println("}");
            out.println("//-->");
           out.println("</script>");
            out.println("</head>");	
           out.println("<body bgcolor=\"#FFFFFF\" VLINK=blue LINK=blue>");
          out.println("<table width=\"100%\" border=\"0\" height=\"100%\"><tr> ");
           out.println("<td height=\"84\" rowspan=\"2\" bgcolor=\"#49B0FC\" width=\"19%\"><b><font size=\"2\"></font></b></td>");
           out.println("<td height=\"84\" valign=\"middle\" align=\"center\"><img src=\"/planny/picture/logo4.jpg\" width=\"360\" height=\"51\"></td></tr>");
           out.println("<tr><td valign=\"top\" height=\"365\"><form method=\"post\" action=\""+DefaultURL+"/servlet/AddEvent\" name=\"Reminder\">");
           
           out.println("<table width=\"100%\" border=\"0\"><tr><td width=\"63\" height=\"15\">&nbsp;</td><td colspan=\"3\" valign=\"top\" height=\"15\">");
           out.println("<a name=\"newevent\"></a></td><td width=\"30\" height=\"15\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"63\" height=\"38\">&nbsp;</td><td colspan=\"3\" height=\"38\" bgcolor=\"#94B7F1\">");
           out.println("<table width=\"100%\" border=\"0\"><tr><td bgcolor=\"#DEDEDE\" align=\"right\" valign=\"middle\" height=\"30\">&nbsp;");
           out.println("<input type=\"submit\" name=\"SubmitSave\" value=\"  Save  \">");
           out.println("<input type=\"submit\" name=\"SubmitSaveAnother\" value=\"Save And Add Another\">");
           out.println("<input type=\"submit\" name=\"Back\" value=\" Cancel \">");
           out.println("&nbsp; </td></tr></table></td><td width=\"30\" height=\"38\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"63\" height=\"25\">&nbsp;</td><td bgcolor=\"#94B7F1\" colspan=\"3\" height=\"25\">");
           out.println(" <table width=\"100%\" border=\"0\"><tr><td bgcolor=\"#CCFFFF\" height=\"23\" valign=\"middle\">");
           out.println("&nbsp;<font size=\"2\" face=\"Arial\">&nbsp;<b>New Event&nbsp;");
           out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b><a href=\""+DefaultURL+"/servlet/mCalendar\">Main</a>&nbsp&nbsp;");
           out.println("</b><a href=\""+DefaultURL+"/servlet/Reminder?t="+GiveTime+"#repeat\">Repeat</a>&nbsp;&nbsp;");
           out.println("<a href=\""+DefaultURL+"/servlet/Reminder?t="+GiveTime+"#remind\">Remind</a><b> </b></font></td></tr></table></td>");
           out.println("<td width=\"30\" height=\"25\">&nbsp;</td></tr><tr><td width=\"63\" height=\"25\">&nbsp;</td>");
           out.println("<td height=\"187\" colspan=\"3\" rowspan=\"3\" bgcolor=\"#49B0FC\" valign=\"top\"><table width=\"100%\" border=\"0\"><tr> ");
           out.println("<td width=\"9%\" valign=\"bottom\"><font size=\"2\"></font></td><td width=\"11%\" valign=\"bottom\"><font size=\"2\"><b>Title</b></font></td>");
           out.println("<td width=\"49%\" valign=\"bottom\"><input type=\"text\" name=\"ETitle\" size=\"25\"></td>");
           out.println("<td align=\"right\" valign=\"bottom\" width=\"13%\"><font size=\"2\"></font></td>");
           out.println("<td align=\"right\" valign=\"bottom\" width=\"18%\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"9%\" valign=\"bottom\"><font size=\"2\"></font></td><td width=\"11%\" valign=\"bottom\"><font size=\"2\"><b>Place</b></font></td>");
           out.println("<td width=\"49%\" valign=\"bottom\"><input type=\"text\" name=\"EPlace\" size=\"25\"></td>");
           out.println("<td valign=\"bottom\" align=\"right\" width=\"13%\"><font size=\"2\"></font></td><td valign=\"bottom\" align=\"right\" width=\"18%\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"9%\" valign=\"bottom\"><font size=\"2\"></font></td><td width=\"11%\" valign=\"bottom\"><font size=\"2\"><b>Type</b></font></td>");
           out.println("<td width=\"49%\" valign=\"bottom\">");
           out.println("<select name=\"TypeReminder\">");
           out.println("<option value=\"Anniversary\">Anniversary</option>");
           out.println("<option value=\"Appointment\" selected>Appointment</option>");
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
           out.println("<option value=\"Wedding\">Wedding</option></select>");
           out.println("</td><td width=\"13%\">&nbsp;</td><td width=\"18%\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"9%\" >&nbsp;</td><td colspan=\"3\" vAlign=bottom>");
           out.println("<font size=\"2\"><b>Start Date &amp;Time</B></FONT></TD>");
           out.println("<TD width=\"18%\">&nbsp;</TD></TR><TR><TD width=\"9%\">&nbsp;</td>");
           out.println("<TD colSpan=4><select name=\"ESDay\">");
           for (int i=1;i<=31;i++)  
                  {          out.print("<option value=\"");
          	         if ( i<10 )      out.print("0");
          	         out.print(i+"\"");
          	         if ( GDate == i ) out.print("selected");   
          	         out.println(">"+i+"</option>"); 
                   }
           out.println("</select><select name=\"ESMonth\">");
           for (int i=1;i<=12;i++)  
                 {          out.print("<option value=\"");
          	        if ( i<10 )      out.print("0");
          	        out.print(i+"\"");
          	        if ( GMonth == i-1 ) out.print("selected");   
          	        out.println(">"+MonthName[i-1]+"</option>"); 
                   }
           out.println("</select><select name=\"ESYear\">");
           for(int i=2001;i<=2003;i++)
                  {        out.print("<option value=\"");
                           out.print(i+"\"");
          	      if ( GYear == i ) out.print("selected");   
          	      out.println(">"+i+"</option>"); 
                   }
           out.println("</select><br><input type=\"radio\" name=\"ETime\" value=\"AllDay\" checked> <font size=\"2\">All Day Event</font><br>");
           out.println("<INPUT name=ETime type=radio value=\"SetTime\"> <font size=\"2\">Start Time</font>  <select name=\"EHour\">");
           for(int i=0;i<=23;i++)
                   {   out.print("<option value=\"");
                        out.print(i+"\" ");
                        if ( GHour == i ) out.print("selected");   
                        out.print(">");
                        if  ( i <10 ) out.print(0);
                        out.println(i+"</option>");
                    }      
           out.println("</select> <font size=\"2\"><b>:</b></font> <select name=\"EMin\">");
           out.println("<option value=\"00\">00</option><option value=\"15\">15</option>");
           out.println("<option value=\"30\">30</option><option value=\"45\">45</option></select>");
           out.println("&nbsp; <font size=\"2\">Duration</font>  <SELECT name=EDHour>");
           out.println("<option value=\"0\">Hour</option>");
           for(int i=1;i<=23;i++)
                { out.print("<option value=\""+i+"\">"+i+" Hour</option>"); }
           out.println("</select><SELECT name=EDMin>");
           out.println("<option value=\"0\">Min</option><option value=\"5\">5 Min</option>");
           out.println("<option value=\"10\">10 Min</option><option value=\"15\">15 Min</option>");
           out.println("<option value=\"30\">30 Min</option><option value=\"45\">45 Min</option></select></TD></TR>");
           out.println("<TR><TD width=\"9%\">&nbsp;</TD>");
           out.println("<TD colSpan=4 vAlign=bottom><FONT size=2>");
           out.println("<input type=\"radio\" name=\"ETime\" value=\"Final\">");
           out.println("Final Date &amp;Time</FONT></TD></TR>");
           out.println("<TR><TD width=\"9%\">&nbsp;</TD><TD vAlign=bottom>&nbsp; </TD>");
           out.println("<TD colSpan=3 vAlign=bottom>");
           out.println("<INPUT CHECKED name=\"EFB\"  type=radio value=\"EFBDate\"><FONT size=2>  Date</FONT>");                
           out.println("<select name=\"EFTDay\">");
           out.println("<option value=\"0\" selected>--</option>");
           for (int i=1;i<=31;i++)  
                  {          out.print("<option value=\"");
          	         if ( i<10 )      out.print("0");
          	         out.print(i+"\"");
          	         //if ( GDate == i ) out.print("selected");   
          	         out.println(">"+i+"</option>"); 
                   }
           out.println("</select><select name=\"EFTMonth\">");
           out.println("<option value=\"0\" selected>--</option>");
           for (int i=1;i<=12;i++)  
                 {          out.print("<option value=\"");
          	        if ( i<10 )      out.print("0");
          	        out.print(i+"\"");
          	        //if ( GMonth == i-1 ) out.print("selected");   
          	        out.println(">"+MonthName[i-1]+"</option>"); 
                   }
           out.println("</select><select name=\"EFTYear\">");
           out.println("<option value=\"0\" selected>--</option>");
           for(int i=2001;i<=2003;i++)
                  {       out.print("<option value=\"");
                           out.print(i+"\"");
          	      //if ( GYear == i ) out.print("selected");   
          	      out.println(">"+i+"</option>"); 
                   }
           out.println("</select>&nbsp;&nbsp;<font size=\"2\">Time&nbsp;</font><select name=\"EFTHour\">");
           for(int i=0;i<=23;i++)
                   {   out.print("<option value=\"");
                        out.print(i+"\">");
                        if  ( i <10 ) out.print(0);
                        out.println(i+"</option>");
                    }      
           out.println("</select> <font =\"2\"><font size=\"2\"><b>:</b></font></font> <select name=\"EFTMin\">");
           out.println("<option value=\"00\">00</option><option value=\"15\">15</option>");
           out.println("<option value=\"30\">30</option><option value=\"45\">45</option></select></TD></TR>");
           out.println("<TR><TD width=\"9%\">&nbsp;</TD><TD vAlign=bottom>&nbsp; </TD>");
           out.println("<TD colSpan=3 valign=\"bottom\"><INPUT name=EFB   type=radio value=EFBDu><FONT size=2>  Duration</font>"); 
           out.println("<select name=\"EFDuM\">");     
           out.println("<option value=\"0\">Month</option>");
           for(int i=1;i<=12;i++)
                { out.print("<option value=\""+i+"\">"+i+" Month</option>"); }
           out.println("</select><select name=\"EFDuW\">");
           out.println("<option value=\"0\">Week</option>");
           for(int i=1;i<=3;i++)
                { out.print("<option value=\""+i+"\">"+i+"  Week</option>"); }
           out.println("</select><select name=\"EFDuD\">");
           out.println("<option value=\"0\">Day</option>");
           for(int i=1;i<=6;i++)
                { out.print("<option value=\""+i+"\">"+i+"  Day</option>"); }
           out.println("</select></TD></TR>");
           out.println("<td width=\"9%\">&nbsp;</td><td width=\"11%\" valign=\"bottom\"><font size=\"2\"><b>Sharing</b></font></td>");
           out.println("<td width=\"49%\" valign=\"bottom\"><input type=\"radio\" name=\"ESharing\" value=\"Private\" checked><font size=\"2\">Private</font> ");
           out.println("<input type=\"radio\" name=\"ESharing\" value=\"Public\"><font size=\"2\">Public</font> </td><td width=\"13%\">&nbsp;</td>");
           out.println("<td width=\"18%\">&nbsp;</td></tr><tr> ");
           out.println("<td width=\"9%\" height=\"75\"><font size=\"2\" face=\"Arial\"><a name=\"repeat\"></a></font></td>");
           out.println("<td colspan=\"2\" height=\"75\"><font size=\"2\"><b>Note<br><textarea name=\"ENote\"  cols=\"60\"></textarea>");
           out.println("</b></font></td><td colspan=\"2\" height=\"75\">&nbsp;</td></tr></table></td>");
           out.println("<td width=\"30\" height=\"25\">&nbsp;</td></tr><tr><td width=\"63\" height=\"25\">&nbsp;</td>");
           out.println("<td width=\"30\" height=\"25\">&nbsp;</td></tr><tr> ");
           out.println("<td width=\"63\" height=\"249\">&nbsp;</td><td width=\"30\" height=\"249\">&nbsp;</td></tr></table>");
           
           
           out.println("<TABLE border=0  width=\"100%\"><TBODY><TR><TD height=25 width=63>&nbsp;</TD><TD bgColor=#94b7f1 colSpan=3 height=25> ");
           out.println("<TABLE border=0 width=\"100%\"><TBODY><TR> <TD bgColor=#ccffff height=23 vAlign=center>&nbsp;<FONT face=Arial  size=2>");
           out.println("&nbsp;<B>Repeat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ");
           out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
           out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ");
           out.println("&nbsp;&nbsp;</B><a href=\""+DefaultURL+"/servlet/mCalendar\">Main</a>&nbsp;&nbsp;&nbsp;<a href=\""+DefaultURL+"/servlet/Reminder?t="+GiveTime+"#newevent\">New");
          out.println(" Event</a><b> &nbsp;</b>&nbsp;<a href=\""+DefaultURL+"/servlet/Reminder?t="+GiveTime+"#remind\">Remind</a></font></td>");
           out.println("</tr></table></td><td width=\"30\" height=\"25\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"63\" height=\"50\">&nbsp;</td><td height=\"50\" colspan=\"3\" rowspan=\"3\" bgcolor=\"#49B0FC\" valign=\"top\">");
           out.println("<table width=\"100%\" border=\"0\"><tr><td width=\"9%\" valign=\"bottom\"><font size=\"2\"></font></td>");
           out.println("<td width=\"6%\" valign=\"bottom\"><font size=\"2\"><input type=\"radio\" name=\"RepeatB\" value=\"NoRep\" checked></font></td>");
           out.println("<td valign=\"bottom\" colspan=\"2\"> <b><font size=\"2\">Don't Repeat This Event </font></b></td>");
           out.println("<td align=\"right\" valign=\"bottom\" width=\"9%\"><font size=\"2\"></font> ");
           out.println("</td><td align=\"right\" valign=\"bottom\" width=\"14%\">&nbsp;</td></tr><tr> ");
           out.println("<td width=\"9%\" valign=\"bottom\"><font size=\"2\"></font></td><td width=\"6%\" valign=\"bottom\"><font size=\"2\"> ");
           out.println("<input type=\"radio\" name=\"RepeatB\" value=\"RepWeek\"></font></td>");
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
           out.println("<td width=\"6%\"><input type=\"radio\" name=\"RepeatB2\" value=\"No Specific\" checked></td> ");
           out.println("<td width=\"56%\" valign=\"bottom\"> <font size=\"2\"><b>Always</b></font></td><td colspan=\"2\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"9%\" height=\"0\"><a name=\"remind\"></a></td><td width=\"6%\" height=\"0\"><font size=\"2\"></font></td>");
           out.println("<td height=\"0\"><input type=\"radio\" name=\"RepeatB2\" value=\"Until\"></td>");
           out.println("<td valign=\"bottom\" height=\"0\"><font size=\"2\"><b>Until <select name=\"RB2Day\">");
            for (int i=1;i<=31;i++)  
                  {          out.print("<option value=\"");
          	         if ( i<10 )      out.print("0");
          	         out.print(i+"\"");
          	         if ( GDate == i ) out.print("selected");   
          	         out.println(">"+i+"</option>"); 
                   }
           out.println("</select><select name=\"RB2Month\">");
           for (int i=1;i<=12;i++)  
                 {          out.print("<option value=\"");
          	        if ( i<10 )      out.print("0");
          	        out.print(i+"\"");
          	        if ( GMonth == i-1 ) out.print("selected");   
          	        out.println(">"+MonthName[i-1]+"</option>"); 
                   }
           out.println("</select><select name=\"RB2Year\">");
           for(int i=2001;i<=2003;i++)
                  {        out.print("<option value=\"");
                           out.print(i+"\"");
          	      if ( GYear == i ) out.print("selected");   
          	      out.println(">"+i+"</option>"); 
                   }
           out.println(" </select></b></font></td>");
           out.println("<td colspan=\"2\" height=\"0\">&nbsp;</td> </tr></table>");
           out.println("</TD> <TD height=25 width=30>&nbsp;</TD> </TR> </TBODY></TABLE>");
           
           /*out.println("<table width=\"100%\" border=\"0\" height=\"50%\"><tr><td width=\"63\" height=\"25\">&nbsp;</td>");
           out.println("<td bgcolor=\"#94B7F1\" colspan=\"3\" height=\"25\"><table width=\"100%\" border=\"0\"><tr><td bgcolor=\"#CCFFFF\" height=\"23\" valign=\"middle\">");
           out.println("&nbsp;<font size=\"2\" face=\"Arial\">&nbsp;<b>Repeat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
           out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
           out.println("&nbsp;&nbsp;</b><a href=\""+DefaultURL+"/servlet/mCalendar\">Main</a>&nbsp;&nbsp;&nbsp;<a href=\""+DefaultURL+"/servlet/Reminder?t="+GiveTime+"#newevent\">New");
           out.println(" Event</a><b> &nbsp;</b>&nbsp;<a href=\""+DefaultURL+"/servlet/Reminder?t="+GiveTime+"#remind\">Remind</a></font></td>");
           out.println("</tr></table></td><td width=\"30\" height=\"25\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"63\" height=\"50\">&nbsp;</td><td height=\"50\" colspan=\"3\" rowspan=\"3\" bgcolor=\"#49B0FC\" valign=\"top\">");
           out.println("<table width=\"100%\" border=\"0\"><tr><td width=\"9%\" valign=\"bottom\"><font size=\"2\"></font></td>");
           out.println("<td width=\"6%\" valign=\"bottom\"><font size=\"2\"><input type=\"radio\" name=\"RepeatB\" value=\"NoRep\" checked></font></td>");
           out.println("<td valign=\"bottom\" colspan=\"2\"> <b><font size=\"2\">Don't Repeat This Event </font></b></td>");
           out.println("<td align=\"right\" valign=\"bottom\" width=\"9%\"><font size=\"2\"></font> ");
           out.println("</td><td align=\"right\" valign=\"bottom\" width=\"14%\">&nbsp;</td></tr><tr> ");
           out.println("<td width=\"9%\" valign=\"bottom\"><font size=\"2\"></font></td><td width=\"6%\" valign=\"bottom\"><font size=\"2\"> ");
           out.println("<input type=\"radio\" name=\"RepeatB\" value=\"RepWeek\"></font></td>");
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
           
           out.println("<tr><td width=\"9%\" valign=\"bottom\"><font size=\"2\"></font></td><td width=\"6%\" valign=\"bottom\"><font size=\"2\"> ");
           out.println("<input type=\"radio\" name=\"RepeatB\" value=\"RepNum\"></font></td>");
           out.println("<td colspan=\"2\"><b><font size=\"2\">Repeat Every <select name=\"RepeatL21\">");
           for (int i=1;i<=10;i++)
                 { out.println("<option value=\""+i+"\">"+i+"</option>"); }
           out.println("</select><select name=\"RepeatL22\">");
           out.println("<option value=\"Day\">Day</option><option value=\"Week\">Week</option>");
           out.println("<option value=\"Month\">Month</option><option value=\"Year\">Year</option>");
            out.println("</select></font></b></td>");
           out.println("<td width=\"9%\">&nbsp;</td><td width=\"14%\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"9%\"><font size=\"2\"><b><br></b></font></td><td width=\"6%\"><font size=\"2\">");
           out.println("<input type=\"radio\" name=\"RepeatB\" value=\"RepOrder\"></font></td><td valign=\"bottom\" colspan=\"2\">");
           out.println("<font size=\"2\"><b>Repeat On The <select name=\"RepeatL31\">");
           out.println("<option value=\"First\">First</option><option value=\"Second\">Second</option><option value=\"Third\">Third</option>");
           out.println("<option value=\"Fourth\">Fourth</option><option value=\"Last\">Last</option></select><select name=\"RepeatL32\">");
           for(int i=0;i<=6;i++)
                 {  out.print("<option value=\""+DayName[i]+"\">");
                     out.print(DayName[i]+"</option>");
                  }
           out.println("</select></b></font></td><td width=\"9%\">");
           out.println("<font size=\"2\"><b><br></b></font></td><td width=\"14%\">&nbsp;</td></tr>");
           /*out.println("<tr><td width=\"9%\"><font size=\"2\"><b> </b></font> </td><td width=\"6%\"><font size=\"2\"><b> </b></font></td>");
           out.println("<td width=\"6%\"><input type=\"radio\" name=\"RepeatB2\" value=\"Alway\" checked></td> ");
           out.println("<td width=\"56%\" valign=\"bottom\"> <font size=\"2\"><b>Always</b></font></td><td colspan=\"2\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"9%\" height=\"0\"><a name=\"remind\"></a></td><td width=\"6%\" height=\"0\"><font size=\"2\"></font></td>");
           out.println("<td height=\"0\"><input type=\"radio\" name=\"RepeatB2\" value=\"Until\"></td>");
           out.println("<td valign=\"bottom\" height=\"0\"><font size=\"2\"><b>Until <select name=\"RB2Day\">");
           for (int i=1;i<=31;i++)  
                  {          out.print("<option value=\"");
          	         if ( i<10 )      out.print("0");
          	         out.print(i+"\"");
          	         if ( GDate == i ) out.print("selected");   
          	         out.println(">"+i+"</option>"); 
                   }
           out.println("</select><select name=\"RB2Month\">");
           for (int i=1;i<=12;i++)  
                 {          out.print("<option value=\"");
          	        if ( i<10 )      out.print("0");
          	        out.print(i+"\"");
          	        if ( GMonth == i-1 ) out.print("selected");   
          	        out.println(">"+MonthName[i-1]+"</option>"); 
                   }
           out.println("</select><select name=\"RB2Year\">");
           for(int i=2001;i<=2003;i++)
                  {        out.print("<option value=\"");
                           out.print(i+"\"");
          	      if ( GYear == i ) out.print("selected");   
          	      out.println(">"+i+"</option>"); 
                   }
           out.println(" </select></b></font></td>");
           out.println("<td colspan=\"2\" height=\"0\">&nbsp;</td> </tr></table></td>");
           out.println("<td width=\"30\" height=\"25\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"63\" height=\"50\">&nbsp;</td><td width=\"30\" height=\"25\">&nbsp;</td></tr>");
           out.println("<tr><td width=\"63\" height=\"57\">&nbsp;</td><td width=\"30\" height=\"57\">&nbsp;</td></tr></table> ");*/
           out.println("<table width=\"100%\" border=\"0\"> <tr> ");
           out.println("<td width=\"64\" height=\"25\">&nbsp;</td><td bgcolor=\"#94B7F1\" colspan=\"3\" height=\"25\"><table width=\"100%\" border=\"0\">");
           out.println("<tr><td bgcolor=\"#CCFFFF\" height=\"23\" valign=\"middle\">&nbsp;");
           out.println("<font size=\"2\" face=\"Arial\">&nbsp;<b>Send Reminder&nbsp;");
           out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
           out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
           out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>");
           out.println("<a href=\""+DefaultURL+"/servlet/mCalendar\">Main</a>&nbsp;&nbsp;&nbsp;</b><a href=\""+DefaultURL+"/servlet/Reminder?t="+GiveTime+"#newevent\">New Event</a>");
           out.println("<b> &nbsp;&nbsp;</b><a href=\""+DefaultURL+"/servlet/Reminder?t="+GiveTime+"#repeat\">Repeat</a></font></td></tr></table></td>");
           out.println("<td width=\"31\" height=\"25\">&nbsp;</td></tr><tr><td width=\"64\" height=\"25\">&nbsp;</td>");
           out.println("<td height=\"187\" colspan=\"3\" rowspan=\"3\" bgcolor=\"#49B0FC\" valign=\"top\" align=\"center\">");
           out.println("<table width=\"96%\" border=\"0\"><tr><td valign=\"bottom\" width=\"12%\" align=\"right\"><font size=\"2\">");
           out.println("<input type=\"radio\" name=\"RemindB\" value=\"NoRem\" checked></font> </td><td valign=\"bottom\" colspan=\"3\">");
           out.println("<font size=\"2\"> <b>Don't Send Reminder</b><br>");
           out.println("</font></td><td width=\"11%\">&nbsp;</td></tr>");
           out.println("<tr><td valign=\"bottom\" width=\"12%\" align=\"right\" height=\"23\"><font size=\"2\"><input type=\"radio\" name=\"RemindB\" value=\"SendRem\">");
           out.println("</font> </td><td valign=\"bottom\" colspan=\"3\" height=\"23\"><font size=\"2\"><b>Send Reminder</b><br>");
           out.println("</font></td><td width=\"11%\" height=\"23\">&nbsp;</td></tr>");
           out.println("<tr><td align=\"right\" valign=\"bottom\" colspan=\"2\"><font size=\"2\"><b>Before Event </b></font></td>");
           /*out.println("<td colspan=\"3\"> <font size=\"2\"> Week</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
           out.println("<font size=\"2\">&nbsp;&nbsp;&nbsp;&nbsp;Day</font>&nbsp;&nbsp;&nbsp;");
           out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=\"2\">Hour&nbsp;</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=\"2\">&nbsp;");
           out.println("&nbsp;&nbsp;&nbsp;&nbsp;Min</font><br>*/
           out.println("<td colspan=\"3\"><select name=\"RemindWeek\">");
           out.println("<option value=\"0\">Week</option><option value=\"1\">1 Week</option>");
           out.println("<option value=\"2\">2 Week</option><option value=\"3\">3 Week</option>");
           out.println("<option value=\"4\">4 Week</option></select><select name=\"RemindDay\"><option value=\"0\">Day</option>");
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
           out.println("<td valign=\"bottom\" colspan=\"3\"><font size=\"2\"><input type=\"checkbox\" name=\"RemindCBPager\" value=\"Pager\">");
           out.println("<b>Pager &amp; Mobile Phone</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ");
           out.println("<select name=\"RemindPager\"><option value=\"152\">152</option><option value=\"162\">162</option>");
           out.println("<option value=\"1144\">1144</option><option value=\"1500\">1500</option><option value=\"GSM\">GSM</option>");
           out.println("<option value=\"ICQ\">ICQ</option></select><b>");
           out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Number</b><input type=\"text\" name=\"PNumber\" size=\"7\"><b><br>");
           //out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Number</b><input type=\"text\" name=\"PNumber\" size=\"7\" onChange=\"MM_validateForm(\'PNumber\',\'\',\'NisNum\');return document.MM_returnValue\"><b><br>");
           out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Password &nbsp;");
           out.println("&nbsp;&nbsp;&nbsp;Re-Password</b><br>&nbsp;&nbsp;&nbsp;&nbsp; ");
           out.println("<input type=\"password\" name=\"PagerPw\" size=\"8\" maxlength=\"10\" >&nbsp;");
           out.println("<input type=\"password\" name=\"RePassWd\" size=\"8\" maxlength=\"10\" ></font></td></tr>");
           out.println("<tr><td colspan=\"2\">&nbsp;</td><td colspan=\"3\"> ");
           out.println("<input type=\"checkbox\" name=\"RemindCEmail\" value=\"Email\"><font size=\"2\"><b> Email</b><br>");
          out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"text\" name=\"RemindEmail\" size=\"35\" maxlength=\"35\"></font></td>");
           //out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"text\" name=\"RemindEmail\"  onBlur=\"MM_validateForm(\'RemindEmail\',\'\',\'NisEmail\');return document.MM_returnValue\"></font></td>");
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
           out.println("<input type=\"submit\" name=\"SubmitSave\" value=\"  Save  \">");
           out.println("<input type=\"submit\" name=\"SubmitSaveAnother\" value=\"Save And Add Another\">");
           out.println("<input type=\"submit\" name=\"Back\" value=\" Cancel \">");
           out.println("&nbsp; </td></tr></table></td>");
           out.println("<td width=\"30\" height=\"38\">&nbsp;</td></tr></table>");
           out.println("</form></td></tr></table></body></html>");
           out.flush();
           out.close();
             }
 }       
 