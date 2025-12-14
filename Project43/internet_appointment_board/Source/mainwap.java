import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class mainwap extends HttpServlet 
{    Connection theConnection;
      String DefaultURL="http://161.246.5.233:8080/planny";
      static final int  CurDate      =  Calendar.getInstance().get(Calendar.DAY_OF_MONTH); 
      static final int  CurMonth   =  Calendar.getInstance().get(Calendar.MONTH); 
      static final int  CurYear      =  Calendar.getInstance().get(Calendar.YEAR); 
      static final int  CurHour      =  Calendar.getInstance().get(Calendar.HOUR_OF_DAY); 
      static final  String [] DayName={"Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"} ;
      static final  String [] MonthName = {"January","February","March","April","May", "June","July","August","September","October","November","December"};
      static final  String [] MonthAbr = {"Jan","Feb","Mar","Apr","May", "Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
      static final  String [] DayAbr = {"","Sun","Mon","Tue","Wed","Thu","Fri", "Sat"};
   public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException         
          {   HttpSession session = req.getSession(true);
               String UserID = (String)session.getValue("login.username");	
               if ( UserID==null  ) {  res.sendRedirect(DefaultURL+"/wap/login.wml");  }
               else session.putValue("login.username",UserID);
             String ch = req.getParameter("s");
             
             String GiveTime = req.getParameter("t");
             int GDate= CurDate;
             int GMonth=CurMonth;
             int GYear=CurYear;
             if (GiveTime!=null) {
             Date MakeDate = new Date(Long.parseLong(GiveTime));
             Calendar GCalendar = new GregorianCalendar();
             GCalendar.setTime(MakeDate);
             GDate = GCalendar.get(GCalendar.DAY_OF_MONTH); 
             GMonth = GCalendar.get(GCalendar.MONTH);
             GYear = GCalendar.get(GCalendar.YEAR);
                        }
             if (ch==null) ch="1";
               res.setContentType("text/vnd.wap.wml");
               PrintWriter out = res.getWriter();
               try{    Class.forName("oracle.jdbc.driver.OracleDriver");
                                     theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                 }  catch (Exception e) { out.println(e.getMessage()); }
               if(ch.equals("1")) { Main(out); }
                  else if (ch.equals("2")) {View(GDate,GMonth,GYear,DefaultURL,out);}                  	
                      else if(ch.equals("3")) {ToDowap(DefaultURL,theConnection,UserID,out,GDate,GMonth,GYear,MonthName);}     
                         else if(ch.equals("4")){QuickAddWap(DefaultURL,out,GDate,GMonth,GYear,MonthName);}
                           else if(ch.equals("5")){FindWap(out);}	
                             else if (ch.equals("d")) {WapDay(GDate,GMonth,GYear,MonthAbr,UserID,DefaultURL,out);}     	                 
                              else if (ch.equals("w")) {WapWeek(GDate,GMonth,GYear,DayAbr,MonthAbr,UserID,DefaultURL,out);}     	                 
                                   else if (ch.equals("m")) {WapMonth(GDate,GMonth,GYear,DefaultURL,out);}  
                                       else if(ch.equals("6")) {GroupCalWap(DefaultURL,out,theConnection,UserID);}              
                 try { theConnection.close(); }
                                 catch (Exception e)  {out.println(e.getMessage()); }  
           }
      
   public void Main (PrintWriter out)
	{  out.println("<?xml version=\"1.0\"?>");
                         out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">"); 
                         out.println("<wml> <card id=\"card1\" title=\"Please Select Funct\" >");
                         out.println("<p><a  href=\"http://161.246.5.233:8080/planny/servlet/mainwap?s=2\">My Calendar</a><br/>");
                         out.println("<a href=\""+DefaultURL+"/servlet/mainwap?s=3\"> Todo </a><br/>");
                         out.println("<a href=\""+DefaultURL+"/servlet/mainwap?s=4\"> QuickAdd</a><br/>");
                         out.println("<a href=\""+DefaultURL+"/servlet/mainwap?s=5\"> Find</a><br/>");
                         out.println("<a href=\""+DefaultURL+"/servlet/mainwap?s=6\">Group Calendar</a><br/></p>");
                         out.println("<do type=\"accept\" label =\"Log in\">");
                        out.println("<go href=\""+DefaultURL+"/wap/login.wml\"/>");
                        out.println("</do></card></wml> ");
                        }
  public void  View(int GDate,int GMonth,int GYear,String DefaultURL,PrintWriter out)
    {  out.println("<?xml version=\"1.0\"?>");
        out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">");  
        out.println("<wml><card id=\"card1\" title=\"View Calendar\">");
        out.println("<p>");
        Calendar GCalendar = new GregorianCalendar(GYear,GMonth,GDate); 
        out.println("<a href=\""+DefaultURL+"/servlet/mainwap?t="+GCalendar.getTime().getTime()+"&amp;s=d\">Calendar Day</a><br/>");
        out.println("<a href=\""+DefaultURL+"/servlet/mainwap?t="+GCalendar.getTime().getTime()+"&amp;s=w\">Calendar Week</a><br/>");
        out.println("<a href=\""+DefaultURL+"/servlet/mainwap?t="+GCalendar.getTime().getTime()+"&amp;s=m\">Calendar Month</a><br/>");
        out.println("</p>");
        out.println("<do type =\"prev\"><prev/></do>");
        out.println("<do type=\"accept\" label =\"Function\">");
        out.println("<go href=\""+DefaultURL+"/servlet/mainwap\"/></do>");
        out.println("</card></wml>"); 
     } 
  
  public void WapDay(int GDate,int GMonth,int GYear,String []MonthAbr,String UserID,String DefaultURL,PrintWriter out)      
     {  int Month1=GMonth+1; 
         int ShowHour = 0;
         int ShowMin=0;
          int Show1Date = 0;
         int Show1Month = 0;
        int Show1Year = 0;
        //boolean check =true;
        out.println("<?xml version=\"1.0\"?>");
        out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">");
        out.println("<wml><card  title=\"Calendar Day\"><p align =\"center\" mode=\"nowrap\">");
        Calendar GCalendar = new GregorianCalendar(GYear,GMonth,GDate-1,0,0); 
        out.println("<a href=\""+DefaultURL+"/servlet/mainwap?t="+GCalendar.getTime().getTime()+"&amp;s=d\">&lt;&lt;</a>");
        GCalendar = new GregorianCalendar(GYear,GMonth,GDate,0,0); 
        out.print(GCalendar.get(GCalendar.DATE)+" "+MonthAbr[GCalendar.get(GCalendar.MONTH)]+" "+GCalendar.get(GCalendar.YEAR));
        GCalendar.add(GCalendar.DATE,1);
        out.println("<a href=\""+DefaultURL+"/servlet/mainwap?t="+GCalendar.getTime().getTime()+"&amp;s=d\">&gt;&gt;</a><br/>");
        out.println("<a href=\""+DefaultURL+"/servlet/mainwap?t="+Calendar.getInstance().getTime().getTime()+"&amp;s=d\">Today</a><br/>");
        out.println("<do type =\"accept\" label=\"Insert\">");
        out.println("<go href=\""+DefaultURL+"/servlet/ShowInsertwap\" method=\"post\">");
        out.println("<postfield name=\"time\" value =\"$(time)\" />");
        out.println("</go></do>");
        out.println("<b>Add Event :</b><select name=\"time\" multiple=\"false\">");
       GCalendar = new GregorianCalendar(GYear,GMonth,GDate,0,0); 
          for(int i=0;i<=23;i++)
              {  for(int m=0;m<=45;m=m+15)
                  {   out.print("<option value=\"");
                       out.println(GCalendar.getTime().getTime()+"\">");
                  if (i<10) out.print("0");
                         out.print(i+":");
                  if (m<10) out.print("0");                         
                         out.println(m+"</option>");    
                         GCalendar.add(GCalendar.MINUTE,15);}  }
           out.println("</select>");
        out.println("<small><table columns=\"3\">");
        out.println("<tr><td>No</td><td>Title</td><td>Time</td></tr>"); 
        int Num =1;
        Calendar ShowStartCalendar = new GregorianCalendar();
        Calendar ShowFinalCalendar = new GregorianCalendar();
        Calendar ShowTimeCalendar = new GregorianCalendar();
        boolean checkfirst = false;
        boolean checkmid = false;
        boolean checkfinal = false;
         int Show1Hour = 0;
         int Show1Min = 0;
         int Show2Hour = 0;
         int Show2Min = 0;
         int nogr = 0;
             try{    Class.forName("oracle.jdbc.driver.OracleDriver");
                       theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                       Statement theStatement=theConnection.createStatement();
                       ResultSet  theResult;
                         theResult=theStatement.executeQuery("select  title,time, no_cal,freq_rep,to_time,check_mode  from calendar where id=' "+UserID+"'"+ 
                        " order by time"); 
                       while (theResult.next()) {
                       	                  checkfirst = false;
                                       	                  checkmid = false;
                                       	                 checkfinal = false;
                       	                 
                                                            ShowStartCalendar.setTime(theResult.getDate(4));
                                                            Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                                            Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                                            Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                                              
                                                            ShowTimeCalendar.setTime(theResult.getDate(2));
                                                            int Show3Date = ShowTimeCalendar.get(ShowTimeCalendar.DATE);
                                                           int Show3Month = ShowTimeCalendar.get(ShowTimeCalendar.MONTH);
                                                           int Show3Year = ShowTimeCalendar.get(ShowTimeCalendar.YEAR);
                                           
                                                           ShowFinalCalendar.setTime(theResult.getDate(5));
                                                           int Show2Date = ShowFinalCalendar.get(ShowFinalCalendar.DATE);
                                                           int Show2Month = ShowFinalCalendar.get(ShowFinalCalendar.MONTH);
                                                           int Show2Year = ShowFinalCalendar.get(ShowFinalCalendar.YEAR);
                                                           
                                                         if   ( (ShowStartCalendar.after(ShowTimeCalendar)) &&  (ShowStartCalendar.equals(ShowFinalCalendar))  )   
                                                         checkfinal = true;
                                                         
                                                              if( (Show1Date==GDate)&&(Show1Month==GMonth)&&(Show1Year==GYear)) {
                                                                if (!checkfinal) {
                                                                ShowStartCalendar.setTime(theResult.getTime(4));
                                                              ShowHour =ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                              ShowMin = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                              }    else { Show1Hour = 0;
                                                                      Show1Min = 0; }
                                                            nogr = theResult.getInt(6);
                                                            if (nogr==1) { 
                                                           out.println("<tr><td>"+Num+"</td>");
                                                            out.println("<td><a href=\""+DefaultURL+"/servlet/ShowEventwap?n="+theResult.getInt(3)+"\">"+CheckInput(theResult.getString(1))+"</a></td>");
                                                            out.print("<td>");
                                                            if(ShowHour<10) out.print("0");
                                                            out.print(ShowHour+":");
                                                            if (ShowMin<10) out.print("0");
                                                            out.print(ShowMin+"</td></tr>");
                                                            Num++;         }//if nogr=1
                                  	                 else   if  ( theResult.getInt(6)==5)
           		               {  out.println("<tr><td>"+Num+"</td>");
                                                            out.println("<td><a href=\""+DefaultURL+"/servlet/ViewEGwap?n="+theResult.getInt(3)+"\">"+CheckInput(theResult.getString(1))+"</a></td>");
                                                            out.print("<td>");
                                                            if(ShowHour<10) out.print("0");
                                                            out.print(ShowHour+":");
                                                            if (ShowMin<10) out.print("0");
                                                            out.print(ShowMin+"</td></tr>");
                                                            Num++;     }
                               }//if            
                                               }//while
                        theResult.close();
                        theStatement.close();
                }  catch (Exception e) { out.println(e.getMessage()); }
                
                  try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id =' "+UserID+"'"+
                             " )and check_mode = 2  and id = ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                                  if (theResult.getInt(15) > 1){
        	                  checkfirst = false;
                                       	                  checkmid = false;
                                       	                 checkfinal = false;
                       	                 
                                                            ShowStartCalendar.setTime(theResult.getDate(4));
                                                            Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                                            Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                                            Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                                              
                                                            ShowTimeCalendar.setTime(theResult.getDate(2));
                                                            int Show3Date = ShowTimeCalendar.get(ShowTimeCalendar.DATE);
                                                           int Show3Month = ShowTimeCalendar.get(ShowTimeCalendar.MONTH);
                                                           int Show3Year = ShowTimeCalendar.get(ShowTimeCalendar.YEAR);
                                           
                                                           ShowFinalCalendar.setTime(theResult.getDate(3));
                                                           int Show2Date = ShowFinalCalendar.get(ShowFinalCalendar.DATE);
                                                           int Show2Month = ShowFinalCalendar.get(ShowFinalCalendar.MONTH);
                                                           int Show2Year = ShowFinalCalendar.get(ShowFinalCalendar.YEAR);
                                                           
                                                         if   ( (ShowStartCalendar.after(ShowTimeCalendar)) &&  (ShowStartCalendar.equals(ShowFinalCalendar))  )   
                                                         checkfinal = true;
                                                         
                                                              if( (Show1Date==GDate)&&(Show1Month==GMonth)&&(Show1Year==GYear)) {
                                                                if (!checkfinal) {
                                                                ShowStartCalendar.setTime(theResult.getTime(4));
                                                              ShowHour =ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                              ShowMin = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                              }    else { Show1Hour = 0;
                                                                      Show1Min = 0; }
                			out.println("<tr><td>"+Num+"</td>");
                                                            out.println("<td><a href=\""+DefaultURL+"/servlet/ViewAGwap2?n="+theResult.getInt(1)+"\">"+CheckInput(theResult.getString(5))+"</a></td>");
                                                            out.print("<td>");
                                                            if(ShowHour<10) out.print("0");
                                                            out.print(ShowHour+":");
                                                            if (ShowMin<10) out.print("0");
                                                            out.print(ShowMin+"</td></tr>");
                                                            Num++;   
                                                  } }}
                                theResult.close();
                      theStatement.close();  } 
                   catch (Exception e) {out.println(e.getMessage());}
        
           try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id =' "+UserID+"'"+
                             " )and check_mode = 3  and id <> ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                                  if (theResult.getInt(15) > 1){
                		checkfirst = false;
                                       	                  checkmid = false;
                                       	                 checkfinal = false;
                       	                 
                                                            ShowStartCalendar.setTime(theResult.getDate(4));
                                                            Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                                            Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                                            Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                                              
                                                            ShowTimeCalendar.setTime(theResult.getDate(2));
                                                            int Show3Date = ShowTimeCalendar.get(ShowTimeCalendar.DATE);
                                                           int Show3Month = ShowTimeCalendar.get(ShowTimeCalendar.MONTH);
                                                           int Show3Year = ShowTimeCalendar.get(ShowTimeCalendar.YEAR);
                                           
                                                           ShowFinalCalendar.setTime(theResult.getDate(3));
                                                           int Show2Date = ShowFinalCalendar.get(ShowFinalCalendar.DATE);
                                                           int Show2Month = ShowFinalCalendar.get(ShowFinalCalendar.MONTH);
                                                           int Show2Year = ShowFinalCalendar.get(ShowFinalCalendar.YEAR);
                                                           
                                                         if   ( (ShowStartCalendar.after(ShowTimeCalendar)) &&  (ShowStartCalendar.equals(ShowFinalCalendar))  )   
                                                         checkfinal = true;
                                                         
                                                              if( (Show1Date==GDate)&&(Show1Month==GMonth)&&(Show1Year==GYear)) {
                                                                if (!checkfinal) {
                                                                ShowStartCalendar.setTime(theResult.getTime(4));
                                                              ShowHour =ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                              ShowMin = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                              }    else { Show1Hour = 0;
                                                                      Show1Min = 0; }
                			out.println("<tr><td>"+Num+"</td>");
                                                            out.println("<td><a href=\""+DefaultURL+"/servlet/ViewAGwap?n="+theResult.getInt(1)+"\">"+CheckInput(theResult.getString(5))+"</a></td>");
                                                            out.print("<td>");
                                                            if(ShowHour<10) out.print("0");
                                                            out.print(ShowHour+":");
                                                            if (ShowMin<10) out.print("0");
                                                            out.print(ShowMin+"</td></tr>");
                                                            Num++;   
                                                  }}}
                            theResult.close();
                      theStatement.close();  } 
                      catch (Exception e) {out.println(e.getMessage());}	
        		
            try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id =' "+UserID+"'"+
                             " )and check_mode = 4  and id <> ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                               	  if (theResult.getInt(15) > 1){
        		   checkfirst = false;
                                       	                  checkmid = false;
                                       	                 checkfinal = false;
                       	                 
                                                            ShowStartCalendar.setTime(theResult.getDate(4));
                                                            Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                                            Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                                            Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                                              
                                                            ShowTimeCalendar.setTime(theResult.getDate(2));
                                                            int Show3Date = ShowTimeCalendar.get(ShowTimeCalendar.DATE);
                                                           int Show3Month = ShowTimeCalendar.get(ShowTimeCalendar.MONTH);
                                                           int Show3Year = ShowTimeCalendar.get(ShowTimeCalendar.YEAR);
                                           
                                                           ShowFinalCalendar.setTime(theResult.getDate(3));
                                                           int Show2Date = ShowFinalCalendar.get(ShowFinalCalendar.DATE);
                                                           int Show2Month = ShowFinalCalendar.get(ShowFinalCalendar.MONTH);
                                                           int Show2Year = ShowFinalCalendar.get(ShowFinalCalendar.YEAR);
                                                           
                                                         if   ( (ShowStartCalendar.after(ShowTimeCalendar)) &&  (ShowStartCalendar.equals(ShowFinalCalendar))  )   
                                                         checkfinal = true;
                                                         
                                                              if( (Show1Date==GDate)&&(Show1Month==GMonth)&&(Show1Year==GYear)) {
                                                                if (!checkfinal) {
                                                                ShowStartCalendar.setTime(theResult.getTime(4));
                                                              ShowHour =ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                              ShowMin = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                              }    else { Show1Hour = 0;
                                                                      Show1Min = 0; }
                			out.println("<tr><td>"+Num+"</td>");
                                                            out.println("<td><a href=\""+DefaultURL+"/servlet/ViewAGwap?n="+theResult.getInt(1)+"\">"+CheckInput(theResult.getString(5))+"</a></td>");
                                                            out.print("<td>");
                                                            if(ShowHour<10) out.print("0");
                                                            out.print(ShowHour+":");
                                                            if (ShowMin<10) out.print("0");
                                                            out.print(ShowMin+"</td></tr>");
                                                            Num++;   
                                                  }}}
	  theResult.close();
                      theStatement.close();  } 
                      catch (Exception e) {out.println(e.getMessage());}
        	
            try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id <>' "+UserID+"'"+
                             " )and check_mode = 2  and id = ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                               	  if (theResult.getInt(15) > 1){
         	            checkfirst = false;
                                       	                  checkmid = false;
                                       	                 checkfinal = false;
                       	                 
                                                            ShowStartCalendar.setTime(theResult.getDate(4));
                                                            Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                                            Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                                            Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                                              
                                                            ShowTimeCalendar.setTime(theResult.getDate(2));
                                                            int Show3Date = ShowTimeCalendar.get(ShowTimeCalendar.DATE);
                                                           int Show3Month = ShowTimeCalendar.get(ShowTimeCalendar.MONTH);
                                                           int Show3Year = ShowTimeCalendar.get(ShowTimeCalendar.YEAR);
                                           
                                                           ShowFinalCalendar.setTime(theResult.getDate(3));
                                                           int Show2Date = ShowFinalCalendar.get(ShowFinalCalendar.DATE);
                                                           int Show2Month = ShowFinalCalendar.get(ShowFinalCalendar.MONTH);
                                                           int Show2Year = ShowFinalCalendar.get(ShowFinalCalendar.YEAR);
                                                           
                                                         if   ( (ShowStartCalendar.after(ShowTimeCalendar)) &&  (ShowStartCalendar.equals(ShowFinalCalendar))  )   
                                                         checkfinal = true;
                                                         
                                                              if( (Show1Date==GDate)&&(Show1Month==GMonth)&&(Show1Year==GYear)) {
                                                                if (!checkfinal) {
                                                                ShowStartCalendar.setTime(theResult.getTime(4));
                                                              ShowHour =ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                              ShowMin = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                              }    else { Show1Hour = 0;
                                                                      Show1Min = 0; }
                			out.println("<tr><td>"+Num+"</td>");
                                                            out.println("<td><a href=\""+DefaultURL+"/servlet/ViewEGwap?n="+theResult.getInt(1)+"\">"+CheckInput(theResult.getString(5))+"</a></td>");
                                                            out.print("<td>");
                                                            if(ShowHour<10) out.print("0");
                                                            out.print(ShowHour+":");
                                                            if (ShowMin<10) out.print("0");
                                                            out.print(ShowMin+"</td></tr>");
                                                            Num++;   
                                                  }}}
	 theResult.close();
                      theStatement.close();  } 
                      catch (Exception e) {out.println(e.getMessage());}
         
         
            try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id =' "+UserID+"'"+
                             " )and check_mode = 6  and id <> ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                               	  if (theResult.getInt(15) > 1){
                                 checkfirst = false;
                                       	                  checkmid = false;
                                       	                 checkfinal = false;
                       	                 
                                                            ShowStartCalendar.setTime(theResult.getDate(4));
                                                            Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                                            Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                                            Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                                              
                                                            ShowTimeCalendar.setTime(theResult.getDate(2));
                                                            int Show3Date = ShowTimeCalendar.get(ShowTimeCalendar.DATE);
                                                           int Show3Month = ShowTimeCalendar.get(ShowTimeCalendar.MONTH);
                                                           int Show3Year = ShowTimeCalendar.get(ShowTimeCalendar.YEAR);
                                           
                                                           ShowFinalCalendar.setTime(theResult.getDate(3));
                                                           int Show2Date = ShowFinalCalendar.get(ShowFinalCalendar.DATE);
                                                           int Show2Month = ShowFinalCalendar.get(ShowFinalCalendar.MONTH);
                                                           int Show2Year = ShowFinalCalendar.get(ShowFinalCalendar.YEAR);
                                                           
                                                         if   ( (ShowStartCalendar.after(ShowTimeCalendar)) &&  (ShowStartCalendar.equals(ShowFinalCalendar))  )   
                                                         checkfinal = true;
                                                         
                                                              if( (Show1Date==GDate)&&(Show1Month==GMonth)&&(Show1Year==GYear)) {
                                                                if (!checkfinal) {
                                                                ShowStartCalendar.setTime(theResult.getTime(4));
                                                              ShowHour =ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                              ShowMin = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                              }    else { Show1Hour = 0;
                                                                      Show1Min = 0; }
                			out.println("<tr><td>"+Num+"</td>");
                                                            out.println("<td><a href=\""+DefaultURL+"/servlet/ViewAGwap2?n="+theResult.getInt(1)+"\">"+CheckInput(theResult.getString(5))+"</a></td>");
                                                            out.print("<td>");
                                                            if(ShowHour<10) out.print("0");
                                                            out.print(ShowHour+":");
                                                            if (ShowMin<10) out.print("0");
                                                            out.print(ShowMin+"</td></tr>");
                                                            Num++;   
                                                  }}}
	 theResult.close();
                      theStatement.close();  } 
                      catch (Exception e) {out.println(e.getMessage());}
                
        GCalendar = new GregorianCalendar(GYear,GMonth,GDate);         
        out.println("</table></small><br/><a href=\""+DefaultURL+"/servlet/mainwap?t="+GCalendar.getTime().getTime()+"&amp;s=2\">View Calendar</a><br/>");
        out.println("<do type =\"prev\"><prev/></do>");
        out.println("</p></card></wml>");
      }//WapDay
  
  public void WapWeek(int GDate,int GMonth,int GYear,String []DayAbr,String []MonthAbr,String UserID,String DefaultURL,PrintWriter out)
      {  
          out.println("<?xml version=\"1.0\"?>");
          out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">");
          out.println("<wml><card title=\"Calendar Week\"><p align =\"center\" mode=\"nowrap\">");
          Calendar GCalendar    = new GregorianCalendar(GYear,GMonth,GDate); 
          GCalendar.add(GCalendar.DATE,-6);
          out.println("<a href=\""+DefaultURL+"/servlet/mainwap?t="+GCalendar.getTime().getTime()+"&amp;s=w\">&lt;&lt;&nbsp;</a>");
          GCalendar    = new GregorianCalendar(GYear,GMonth,GDate); 
          out.print(GCalendar.get(GCalendar.DATE)+" - ");
          GCalendar.add(GCalendar.DATE,6);
          out.print(GCalendar.get(GCalendar.DATE)+" ");
          out.print(MonthAbr[GCalendar.get(GCalendar.MONTH)]+" "+GCalendar.get(GCalendar.YEAR));
          out.println("<a href=\""+DefaultURL+"/servlet/mainwap?t="+GCalendar.getTime().getTime()+"&amp;s=w\">&nbsp;&gt;&gt;</a><br/>");
          out.println("<a href=\""+DefaultURL+"/servlet/mainwap?t="+Calendar.getInstance().getTime().getTime()+"&amp;s=w\">Today</a>");
          out.println("</p><p><small><table columns=\"2\">");
          GCalendar    = new GregorianCalendar(GYear,GMonth,GDate); 
         int nogr = 0;
          for(int i=1;i<=7;i++)
            { boolean check = true;
               int ShowHour = 0;
                int ShowMin=0;
                int Show1Date = 0;
               int Show1Month = 0;
               int Show1Year = 0;
               boolean chfor = true;
               boolean chtr = true;
               out.println("<tr>");
               out.print("<td><a href=\""+DefaultURL+"/servlet/mainwap?t="+GCalendar.getTime().getTime()+"&amp;s=d\">");
               out.print(DayAbr[GCalendar.get(GCalendar.DAY_OF_WEEK)]);
               out.print(" "+GCalendar.get(GCalendar.DATE));
               out.print(" "+MonthAbr[GCalendar.get(GCalendar.MONTH)]);
               out.print(" "+GCalendar.get(GCalendar.YEAR));
               out.println("</a></td>"); 
               
                  int Num =1;
                 try{    Class.forName("oracle.jdbc.driver.OracleDriver");
                       theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                       Statement theStatement=theConnection.createStatement();
                       ResultSet  theResult;
                         theResult=theStatement.executeQuery("select  title,time, no_cal,freq_rep,check_mode  from calendar where id=' "+UserID+"'"+ 
                        " order by time"); 
                       while (theResult.next()) {
                       	//if  (!check) { out.println("<tr><td></td>");}
                       	Calendar ShowStartCalendar = new GregorianCalendar();
                       	                 ShowStartCalendar.setTime(theResult.getTime(4));
                                                            ShowHour =ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                            ShowMin = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                            ShowStartCalendar.setTime(theResult.getDate(4));
                                                            Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                                            Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                                            Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                                              if ((!check)&& ( (Show1Date==GCalendar.get(GCalendar.DATE))&&(Show1Month==GCalendar.get(GCalendar.MONTH))&&(Show1Year==GCalendar.get(GCalendar.YEAR))) ) 
                                                              { out.println("<tr><td></td>");
                                                              	check = true;}
                                                             if( (Show1Date==GCalendar.get(GCalendar.DATE))&&(Show1Month==GCalendar.get(GCalendar.MONTH))&&(Show1Year==GCalendar.get(GCalendar.YEAR))) {
                                                            nogr = theResult.getInt(5);
                                                            if (nogr==1) { 
                                                           //  if  ((!chfor) || (!chtr))out.print("<tr>");
                                                             out.println("<td><a href=\""+DefaultURL+"/servlet/ShowEventwap?n="+theResult.getInt(3)+"\">"+CheckInput(theResult.getString(1))+"</a></td>");
                                                             out.println("</tr>");
                                                             check = false;}
                                                             //chfor = false;  }
                                                              else   if  ( theResult.getInt(5)==5)
           		               { // if (!chfor) out.print("<tr>");
           		                   out.println("<td><a href=\""+DefaultURL+"/servlet/ViewEGwap?n="+theResult.getInt(3)+"\">"+CheckInput(theResult.getString(1))+"</a></td>");
                                                             out.println("</tr>");
                                                             check = false; }
                                                             //chfor =false; }
                                                         }
                                 }//while        
                           theResult.close();
                        theStatement.close();
                }  catch (Exception e) { out.println(e.getMessage()); }
             //   check = true;
            try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id =' "+UserID+"'"+
                             " )and check_mode = 2  and id = ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                                  if (theResult.getInt(15) > 1){
        	         Calendar ShowStartCalendar = new GregorianCalendar();
                       	                 ShowStartCalendar.setTime(theResult.getTime(4));
                                                            ShowHour =ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                            ShowMin = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                            ShowStartCalendar.setTime(theResult.getDate(4));
                                                            Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                                            Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                                            Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                                              if ((!check)&& ( (Show1Date==GCalendar.get(GCalendar.DATE))&&(Show1Month==GCalendar.get(GCalendar.MONTH))&&(Show1Year==GCalendar.get(GCalendar.YEAR))) )
                                                               { out.println("<tr><td></td>");
                                                               check = true;}
                                                             if( (Show1Date==GCalendar.get(GCalendar.DATE))&&(Show1Month==GCalendar.get(GCalendar.MONTH))&&(Show1Year==GCalendar.get(GCalendar.YEAR))) {
                                                             //if (!chfor) out.print("<tr>");
                                                             out.println("<td><a href=\""+DefaultURL+"/servlet/ViewAGwap2?n="+theResult.getInt(1)+"\">"+CheckInput(theResult.getString(5))+"</a></td>");
                                                             out.println("</tr>");
                                                             check = false; }
                                                             //chfor  = false; }
                                         }
                                 }//while        
                           theResult.close();
                        theStatement.close();
                }  catch (Exception e) { out.println(e.getMessage()); }                          
           //   check = true;
                  try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id =' "+UserID+"'"+
                             " )and check_mode = 3  and id <> ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                                  if (theResult.getInt(15) > 1){
             		      Calendar ShowStartCalendar = new GregorianCalendar();
                       	                 ShowStartCalendar.setTime(theResult.getTime(4));
                                                            ShowHour =ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                            ShowMin = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                            ShowStartCalendar.setTime(theResult.getDate(4));
                                                            Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                                            Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                                            Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                                              if ((!check)&& ( (Show1Date==GCalendar.get(GCalendar.DATE))&&(Show1Month==GCalendar.get(GCalendar.MONTH))&&(Show1Year==GCalendar.get(GCalendar.YEAR))) )
                                                               { out.println("<tr><td></td>");
                                                               check = true;}
                                                             if( (Show1Date==GCalendar.get(GCalendar.DATE))&&(Show1Month==GCalendar.get(GCalendar.MONTH))&&(Show1Year==GCalendar.get(GCalendar.YEAR))) {
                                                             out.println("<td><a href=\""+DefaultURL+"/servlet/ViewAGwap?n="+theResult.getInt(1)+"\">"+CheckInput(theResult.getString(5))+"</a></td>");
                                                             out.println("</tr>");
                                                             check = false; }
                                                             //chfor  = false; }
                                         }
                                 }//while        
                           theResult.close();
                        theStatement.close();
                }  catch (Exception e) { out.println(e.getMessage()); }  
            //  check = true;
                try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id =' "+UserID+"'"+
                             " )and check_mode = 4  and id <> ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                               	  if (theResult.getInt(15) > 1){ 
             		    Calendar ShowStartCalendar = new GregorianCalendar();
                       	                 ShowStartCalendar.setTime(theResult.getTime(4));
                                                            ShowHour =ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                            ShowMin = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                            ShowStartCalendar.setTime(theResult.getDate(4));
                                                            Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                                            Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                                            Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                                              if ((!check)&& ( (Show1Date==GCalendar.get(GCalendar.DATE))&&(Show1Month==GCalendar.get(GCalendar.MONTH))&&(Show1Year==GCalendar.get(GCalendar.YEAR))) )
                                                               { out.println("<tr><td></td>");
                                                               check=true;}
                                                             if( (Show1Date==GCalendar.get(GCalendar.DATE))&&(Show1Month==GCalendar.get(GCalendar.MONTH))&&(Show1Year==GCalendar.get(GCalendar.YEAR))) {
                                                             out.println("<td><a href=\""+DefaultURL+"/servlet/ViewAGwap?n="+theResult.getInt(1)+"\">"+CheckInput(theResult.getString(5))+"</a></td>");
                                                             out.println("</tr>");
                                                             check = false;}
                                                            // chfor  = false;  }
                                         }
                                 }//while        
                           theResult.close();
                        theStatement.close();
                }  catch (Exception e) { out.println(e.getMessage()); }  
            //  check = true;
             try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id <>' "+UserID+"'"+
                             " )and check_mode = 2  and id = ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                               	  if (theResult.getInt(15) > 1){ 
             		   Calendar ShowStartCalendar = new GregorianCalendar();
                       	                 ShowStartCalendar.setTime(theResult.getTime(4));
                                                            ShowHour =ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                            ShowMin = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                            ShowStartCalendar.setTime(theResult.getDate(4));
                                                            Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                                            Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                                            Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                                              if ((!check)&& ( (Show1Date==GCalendar.get(GCalendar.DATE))&&(Show1Month==GCalendar.get(GCalendar.MONTH))&&(Show1Year==GCalendar.get(GCalendar.YEAR))) ) 
                                                              { out.println("<tr><td></td>");
                                                              check = true;}
                                                             if( (Show1Date==GCalendar.get(GCalendar.DATE))&&(Show1Month==GCalendar.get(GCalendar.MONTH))&&(Show1Year==GCalendar.get(GCalendar.YEAR))) {
                                                             out.println("<td><a href=\""+DefaultURL+"/servlet/ViewEGwap?n="+theResult.getInt(1)+"\">"+CheckInput(theResult.getString(5))+"</a></td>");
                                                             out.println("</tr>");
                                                             check = false;}
                                                             //chfor  = false;  }
                                         }
                                 }//while        
                           theResult.close();
                        theStatement.close();
                }  catch (Exception e) { out.println(e.getMessage()); }  
              //check = true;
              try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id =' "+UserID+"'"+
                             " )and check_mode = 6  and id <> ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                               	  if (theResult.getInt(15) > 1){
             		  Calendar ShowStartCalendar = new GregorianCalendar();
                       	                 ShowStartCalendar.setTime(theResult.getTime(4));
                                                            ShowHour =ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                            ShowMin = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                            ShowStartCalendar.setTime(theResult.getDate(4));
                                                            Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                                            Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                                            Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                                              if ((!check)&& ( (Show1Date==GCalendar.get(GCalendar.DATE))&&(Show1Month==GCalendar.get(GCalendar.MONTH))&&(Show1Year==GCalendar.get(GCalendar.YEAR))) )
                                                               { out.println("<tr><td></td>");
                                                               check = true;}
                                                             if( (Show1Date==GCalendar.get(GCalendar.DATE))&&(Show1Month==GCalendar.get(GCalendar.MONTH))&&(Show1Year==GCalendar.get(GCalendar.YEAR))) {
                                                             out.println("<td><a href=\""+DefaultURL+"/servlet/ViewAGwap2?n="+theResult.getInt(1)+"\">"+CheckInput(theResult.getString(5))+"</a></td>");
                                                             out.println("</tr>");
                                                             check = false;  }
                                                          //   chfor  = false;}
                                         }
                                 }//while        
                           theResult.close();
                        theStatement.close();
                }  catch (Exception e) { out.println(e.getMessage()); }  
             
             
             
              if (check)  out.println("<td>No Event</td></tr>");
              GCalendar.add(GCalendar.DATE,1);            }//for
         out.println("</table></small><br/></p><p align = \"center\"><a href=\""+DefaultURL+"/servlet/mainwap?t="+GCalendar.getTime().getTime()+"&amp;s=2\">View Calendar</a>");
         out.println("</p><do type =\"prev\"><prev/>");
         out.println("</do><do type=\"accept\" label =\"View Calendar\">");
         GCalendar = new GregorianCalendar(GYear,GMonth,GDate); 
         out.println("<go href=\""+DefaultURL+"/servlet/mainwap?t="+GCalendar.getTime().getTime()+"&amp;s=2\"/></do>");
         out.println("</card></wml>");
      }//WapWeek 
  
  public void WapMonth(int GDate,int GMonth,int GYear,String DefaultURL,PrintWriter out)
      {
        out.println("<?xml version=\"1.0\"?>");
        out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">");
        out.println("<wml><card title=\"Planny Calendar\"><p mode=\"nowrap\" align=\"center\">");
        Calendar GCalendar = new GregorianCalendar(GYear,GMonth,GDate); 
        GCalendar.add(GCalendar.MONTH,-1);
        out.println("<a href=\""+DefaultURL+"/servlet/mainwap?t="+GCalendar.getTime().getTime()+"&amp;s=m\">&lt;&lt;&nbsp;</a>");
        GCalendar = new GregorianCalendar(GYear,GMonth,GDate); 
        out.println(MonthName[GCalendar.get(GCalendar.MONTH)]+" "+GCalendar.get(GCalendar.YEAR));
        GCalendar.add(GCalendar.MONTH,1);
        out.println("<a href=\""+DefaultURL+"/servlet/mainwap?t="+GCalendar.getTime().getTime()+"&amp;s=m\">&nbsp;&gt;&gt;</a>");
        out.println("<br/><a href=\""+DefaultURL+"/servlet/mainwap?t="+Calendar.getInstance().getTime().getTime()+"&amp;s=m\">Today</a>");
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
            {  out.println("<td><a href=\""+DefaultURL+"/servlet/mainwap?t="+GCalendar.getTime().getTime()+"&amp;s=d\">"+GCalendar.get(GCalendar.DATE)+"</a></td>");
               GCalendar.add(GCalendar.DATE,1);
             }
                         int date=1;
                         int Days=DayOfWeek;
                         GCalendar=new GregorianCalendar(GYear,GMonth,1);
                         for ( int weeks=0; weeks<6 ;weeks++)
	        {   for (; Days<=7 ; Days++)
	            {    out.print("<td><a href=\""+DefaultURL+"/servlet/mainwap?t="+GCalendar.getTime().getTime()+"&amp;s=d\">");
	                    if (GCalendar.get(GCalendar.DATE) < 10 ) {out.print(" "); }
	                 out.println(GCalendar.get(GCalendar.DATE)+"</a></td>");  
                                       GCalendar.add(GCalendar.DATE,1);
                                  }   
	               if (GCalendar.get(GCalendar.MONTH) != GMonth )
	                 { out.println("</tr>");
	                    weeks=8; 
	                    continue;  } else
	                 {  Days=1; 
	                    out.println("</tr><tr>");  }
	        }//For       
                     out.println("</table></small><br/></p><p align = \"center\"><a href=\""+DefaultURL+"/servlet/mainwap?t="+GCalendar.getTime().getTime()+"&amp;s=2\">View Calendar</a>");
       out.println("</p><do type =\"prev\">");
       out.println("<prev/></do>");
       out.println("<do type =\"accept\" label=\"View Calendar\">");
       GCalendar = new GregorianCalendar(GYear,GMonth,GDate); 
       out.println("<go href=\""+DefaultURL+"/servlet/mainwap?t="+GCalendar.getTime().getTime()+"&amp;s=2\"/></do>");
       out.println("</card></wml>");
       }//WCalendar          

 public void ToDowap(String DefaultURL,Connection theConnection,String UserID,PrintWriter out,int CDate,int CMonth,int CYear,String []MonthName)
    {    //boolean check = true;
         try{  Statement theStatement = theConnection.createStatement (ResultSet.TYPE_SCROLL_SENSITIVE, 
                 ResultSet.CONCUR_UPDATABLE);
                ResultSet theResult=theStatement.executeQuery("select  no_todo,timeout,priority,title,note,id  from  todo where id = ' "+UserID+"'");
                //removetodo(theResult,CDate,CMonth,CYear,MonthName);
                while (theResult.next())
               {   Calendar DBCalendar = new GregorianCalendar();
                    DBCalendar.setTime(theResult.getDate(2));
                
                if(DBCalendar.get(DBCalendar.YEAR) < CYear) {theResult.deleteRow();}
                     else if(DBCalendar.get(DBCalendar.YEAR) == CYear)
                                 {  if(DBCalendar.get(DBCalendar.MONTH)<CMonth) {theResult.deleteRow();}
                                         else if(DBCalendar.get(DBCalendar.MONTH)==CMonth)
                                                      if(DBCalendar.get(DBCalendar.DATE)<CDate)  { theResult.deleteRow();}
                                 }
                
               }//while
               theResult.close();
               theStatement.close();  } 
               catch (Exception e) {out.println(e.getMessage());}
               out.println("<?xml version=\"1.0\"?>");
               out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">");
               out.println(" <wml><card id = \"viewToDo\" title=\"View ToDo\"><p align=\"center\" mode=\"nowrap\">");
               out.println("<a href=\""+DefaultURL+"/wap/todo.wml\">Add ToDo</a>");
              out.println("<table columns=\"3\"><tr><td>No</td><td><b>Title</b></td><td><b>Priority</b></td></tr>");
                int Num =1;
                try{     Statement theStatement=theConnection.createStatement();
                           ResultSet  theResult=theStatement.executeQuery("select priority,timeout,title,no_todo  from  todo where id = ' "+UserID+"' order by priority desc");
                           while (theResult.next())
                             {             Calendar ShowCalendar = new GregorianCalendar();
                                            ShowCalendar.setTime(theResult.getDate(2));
                                            int ShowDate = ShowCalendar.get(ShowCalendar.DATE);
                                            int ShowMonth = ShowCalendar.get(ShowCalendar.MONTH);
                                            int ShowYear = ShowCalendar.get(ShowCalendar.YEAR);
                                            int no = theResult.getInt(4);
                                             out.println("<tr><td>"+Num+"</td><td><a href=\""+DefaultURL+"/servlet/ShowUpdateToDowap?n="+no+"\">"+CheckInput(theResult.getString(3))+"</a></td>");
                                             if (theResult.getInt(1)==4)   out.print("<td>Most</td>");
                                             if (theResult.getInt(1)==3)   out.print("<td>Medium</td>");
                                             if (theResult.getInt(1)==2)   out.print("<td>Less</td>");
                                             if (theResult.getInt(1)==1)   out.print("<td>No Identify</td>");
                                             out.println("</tr>");
                                Num++;       
                               // check= false;                   
                              }
                           theResult.close();
                           theStatement.close();
                        } catch (Exception e) { out.println(e.getMessage()); }
                         //   if (!check) out.println("</table>");
                             //out.println("<table columns=\"1\"><tr><td>No ToDo List</td></tr></table>");
                            out.println("</table><br/></p><p align = \"center\"> <a href=\""+DefaultURL+"/servlet/mainwap\">Back To Function</a></p><do type =\"prev\"><prev/></do></card></wml> ");
                            }
  public void QuickAddWap(String DefaultURL,PrintWriter out,int CDate,int CMonth,int CYear,String []MonthName)                        	
       {  out.println("<?xml version=\"1.0\"?>");
           out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">");
           out.println("<wml><card  title=\"Quick Add\">"); 
           out.println("<do type =\"accept\" label=\"Save\">");
           out.println("<go href=\""+DefaultURL+"/servlet/QuickAddwap\" method=\"post\">");
           out.println("<postfield name=\"title\" value =\"$(title)\" />");
           out.println("<postfield name=\"type\" value =\"$(type)\"/>");
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
           out.println("</select><br/></p><p align = \"center\"><a href=\""+DefaultURL+"/servlet/mainwap\">Back To Function</a></p><do type =\"prev\"><prev/></do></card></wml>");
                  
        }       
        
  public void FindWap(PrintWriter out) 
  {  out.println("<?xml version=\"1.0\"?>");
      out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">");
      out.println("<wml><card title=\"Find\"><do type =\"accept\" label=\"Find\">");
      out.println("<go href=\"http://161.246.5.233:8080/planny/servlet/ManageFindwap\" method=\"post\">");
      out.println("<postfield name=\"title\" value =\"$(titlefind)\" /><postfield name=\"type\" value =\"$(typefind)\"/></go></do> ");
      out.println("<p mode=\"nowrap\">Title : <input type =\"text\" name=\"titlefind\" emptyok=\"true\"/> <br/>Type : <select name=\"typefind\" multiple=\"false\">");
      out.println("<option value=\"Anniversary\">Anniversary</option><option value=\"Appointment\">Appointment</option>");
      out.println("<option value=\"BillPayment\">Bill Payment</option><option value=\"Birthday\">Birthday</option>");
      out.println("<option value=\"Breakfast\">Breakfast</option><option value=\"Call\">Call</option>");
      out.println("<option value=\"Chat\">Chat</option> <option value=\"Class\">Class</option>");
      out.println(" <option value=\"ClubEvent\">Club Event</option><option value=\"Concert\">Concert</option>");
      out.println("<option value=\"Date\">Date</option><option value=\"Dinner\">Dinner</option>");
      out.println("<option value=\"Graduation\">Graduation</option><option value=\"HappyHour\">Happy Hour</option>");
      out.println("<option value=\"Holiday\">Holiday</option><option value=\"Interview\">Interview</option>");
      out.println("<option value=\"Lunch\">Lunch</option><option value=\"Meeting\">Meeting</option>");
      out.println("<option value=\"Movie\">Movie</option><option value=\"NetEvent\">Net Event</option>");
      out.println(" <option value=\"Other\">Other</option><option value=\"Party\">Party</option>");
      out.println("<option value=\"Performance\">Performance</option><option value=\"Reunion\">Reunion</option>");
      out.println("<option value=\"SportsEvent\">Sports Event</option><option value=\"Travel\">Travel</option>");
      out.println("<option value=\"TVShow\">TV Show</option><option value=\"Vacation\">Vacation</option>");
      out.println("<option value=\"Wedding\">Wedding</option></select><br/></p><p align = \"center\"><a href=\""+DefaultURL+"/servlet/mainwap\">Back To Function</a></p>");
      out.println("<do type =\"prev\"><prev/></do>");
      out.println(" </card></wml> ");
   }//findwap   
 
 public void GroupCalWap(String DefaultURL,PrintWriter out,Connection theConnection,String UserID)
   {          int Num = 1;
              String title ="";
              String type ="";
              int no = 0;
              boolean check = true;
              boolean checkhave =false;         
               out.println("<?xml version=\"1.0\"?>");
               out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">");
               out.println("<wml><card   title=\"Group Calendar\"><p align =\"center\" mode=\"nowrap\">");
               out.println("<small><table columns=\"3\"><tr><td>No.</td> <td>Group Type </td><td> Group Name </td></tr>"); 
                try{                            
                                                //Loading Sun's JDBC ODBC Driver   
                                               Class.forName("oracle.jdbc.driver.OracleDriver");
                                               //Connect to emaildb Data source
                                               theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                               //Select all records from emaillists table.
                                               Statement  theStatement=theConnection.createStatement();
                                               ResultSet theResult = theStatement.executeQuery(  "select groupname,grouptype,no_mem  from member "+
                                               "where idmem <> id and id = ' "+UserID+"' order  by groupname , grouptype");
                                               while (theResult.next()){ 
                                               	if  (title.equals(""))  {   title=theResult.getString(1);  }
                                                                if (title.equals(theResult.getString(1))) 
                                                              	{  if  (type.equals("")) { type = theResult.getString(2);}
                                                              	   if (type.equals(theResult.getString(2)) && (check) ) 
                                                              	{        out.println("<tr><td>"+Num+".</td>");
                                                                         out.println("<td>"+theResult.getString(2)+"</td>");
                                                                         no = theResult.getInt(3);
                                                                         out.println("<td>");
                                                                         out.println("<a href=\""+DefaultURL+"/servlet/Showmemwap?n="+no+"\">"+theResult.getString(1)+"</a></td></tr>");
                                                                         Num++;
                                                                         check = false;
                                                                }//if type1
                                                                  if ( !(type.equals(theResult.getString(2))))  {
                                                                  	   type = theResult.getString(2) ;
                                                                  	   out.println("<tr><td>"+Num+".</td>");
                                                                         out.println("<td>"+theResult.getString(2)+"</td>");
                                                                         no = theResult.getInt(3);
                                                                         out.println("<td>");
                                                                         out.println("<a href=\""+DefaultURL+"/servlet/Showmemwap?n="+no+"\">"+theResult.getString(1)+"</a></td></tr>");
                                                                         Num++;
                                                                         check = false;
                                                                                    }//if type
                                                              }//if title
                                                  if  ( !(title.equals(theResult.getString(1))) ) {
                                                  	title= theResult.getString(1) ;
                                                  	 if (type.equals(theResult.getString(2)) ) {
                                                                       out.println("<tr><td>"+Num+".</td>");
                                                                         out.println("<td>"+theResult.getString(2)+"</td>");
                                                                         no = theResult.getInt(3);
                                                                         out.println("<td>");
                                                                         out.println("<a href=\""+DefaultURL+"/servlet/Showmemwap?n="+no+"\">"+theResult.getString(1)+"</a></td></tr>");
                                                                         Num++;
                                                                         check = false;
                                                                       }//if type1
                                                                 
                                                                    if ( !(type.equals(theResult.getString(2))) ) {
                                                                    	 type = theResult.getString(2) ;
                                                                                       out.println("<tr><td>"+Num+".</td>");
                                                                         out.println("<td>"+theResult.getString(2)+"</td>");
                                                                         no = theResult.getInt(3);
                                                                         out.println("<td>");
                                                                         out.println("<a href=\""+DefaultURL+"/servlet/Showmemwap?n="+no+"\">"+theResult.getString(1)+"</a></td></tr>");
                                                                         Num++;
                                                                         check = false;
                                                                        }//if type
                                                     }//title
                                           checkhave = true;
                                                                   }//while
                           theResult.close();
                           theStatement.close();
                        } catch (Exception e) { out.println(e.getMessage()); }
                  
                     title="";
                     type="";
                      try{    
                          Statement  theStatement=theConnection.createStatement();
                          ResultSet theResult = theStatement.executeQuery(  "select groupname,grouptype  from member "+
                                               "where id = ' "+UserID+"' having count(*) = 1 group  by groupname , grouptype");
                                                  while (theResult.next()){ 
                                               	if  (type.equals(""))  {   type=theResult.getString(2);  }
                                               	if (! (type.equals(theResult.getString(2))) )  type=theResult.getString(2); 
                                                                if (type.equals(theResult.getString(2))) 
                                                              	{        out.println("<tr><td>"+Num+".</td>");
                                                                         out.println("<td>"+theResult.getString(2)+"</td>");
                                                                         out.println("<td>"+theResult.getString(1)+"</td></tr>");
                                                                            Num++;
                                                                }//if type1
                                                                     }//while
                           theResult.close();
                           theStatement.close();
                        } catch (Exception e) { out.println(e.getMessage()); }
                                               
              out.println("</table></small>");
              out.println("<a href=\""+DefaultURL+"/servlet/ShowCreateGwap\"> Create Group</a><br/>");
               out.println("<a href=\""+DefaultURL+"/servlet/ShowCreateMwap\"> Create Member</a><br/>");
               out.println("<a href=\""+DefaultURL+"/servlet/ShowViewGwap\"> View Group</a><br/>");
               out.println("<a href=\""+DefaultURL+"/servlet/mainwap\">Back To Function</a></p>");
               out.println("<do type =\"prev\"><prev/></do></card></wml> ");
        }
 
 
 
 public String CheckInput(String InputTest) 
    {  int nut=0;
       if(InputTest.indexOf('&')!= -1) {
       nut=0;
       while(true) {
            InputTest=InputTest.substring(0,InputTest.indexOf('&',nut)).concat("&amp;"+InputTest.substring((InputTest.indexOf('&',nut)+1)));
            System.out.println(InputTest);
            nut = InputTest.indexOf('&',nut);
            if (nut == InputTest.lastIndexOf('&') )  break;
            nut =nut+1;
                           } }
       if(InputTest.indexOf('\'')!= -1) {
       nut=0;
       while(true) {
            if ( InputTest.indexOf('\'')== -1)  break;
            InputTest=InputTest.substring(0,InputTest.indexOf('\'',nut)).concat("&apos;"+InputTest.substring((InputTest.indexOf('\'',nut)+1)));
            System.out.println(InputTest);                              
                              } }                
       if(InputTest.indexOf('"')!= -1) {
       nut=0;
       while(true) {
            if (InputTest.lastIndexOf('"')== -1 )  break;
            InputTest=InputTest.substring(0,InputTest.indexOf('"',nut)).concat("&quot;"+InputTest.substring((InputTest.indexOf('"',nut)+1)));
            System.out.println(InputTest);
                             } }                                         
       if(InputTest.indexOf('<')!= -1) {
       nut=0;
       while(true) {
            if (InputTest.lastIndexOf('<')==-1 )  break;
            InputTest=InputTest.substring(0,InputTest.indexOf('<',nut)).concat("&lt;"+InputTest.substring((InputTest.indexOf('<',nut)+1)));
            System.out.println(InputTest);
                              } }                                                        
        if(InputTest.indexOf('>')!= -1) {
       nut=0;
       while(true) {
            if (InputTest.lastIndexOf('>')==-1 )  break;
            InputTest=InputTest.substring(0,InputTest.indexOf('>',nut)).concat("&gt;"+InputTest.substring((InputTest.indexOf('>',nut)+1)));
            System.out.println(InputTest);
                              } }                                                          
       if(InputTest.indexOf(" ")!= -1) {
       nut=0;
       while(true) {
            if (InputTest.lastIndexOf(" ")==-1 )  break;
            InputTest=InputTest.substring(0,InputTest.indexOf(" ",nut)).concat("&nbsp;"+InputTest.substring((InputTest.indexOf(" ",nut)+1)));
            System.out.println(InputTest);
                              } }                                            
       if(InputTest.indexOf('-')!= -1) {
       nut=0;
       while(true) {
            if (InputTest.lastIndexOf('-')==-1 )  break;
            InputTest=InputTest.substring(0,InputTest.indexOf('-',nut)).concat("&shy;"+InputTest.substring((InputTest.indexOf('-',nut)+1)));
            System.out.println(InputTest);
                               } }                                                        
       return InputTest;   
     }//Output Check 
 
  }//class
 
   