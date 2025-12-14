 import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class UpdateRemind extends HttpServlet
 {     Connection theConnection;
         String []DayName={"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Day","Week","Month","Year"} ;
        protected  void  doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {   String DefaultURL="http://161.246.5.233:8080/planny"; 
         HttpSession session = req.getSession(true);
         String UserID =session.getValue("login.username").toString();
         if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
         String  Norem1 = (String)session.getValue("Remind.No");
          int No_rem = Integer.parseInt(Norem1);
          String  Norep1 = (String)session.getValue("Repeat.No");
          int No_rep = Integer.parseInt(Norep1);
          String  Nocal1 = (String)session.getValue("Event.No");
          int NoNum = Integer.parseInt(Nocal1);
           boolean checkFinal  = true;
            String EventTitle                       = req.getParameter("ETitle");
            String EventType                       = req.getParameter("TypeReminder");
            String EventPlace                    = req.getParameter("EPlace");
            String  EventTime      =  req.getParameter("ETime");
            String EventFinalTime = req.getParameter("EFB");
            String EventSharing        = req.getParameter("ESharing");
            String  EventNote          = req.getParameter("ENote");
            
            String RepeatFreq              = req.getParameter("RepeatB");
            String RepeatWeek               = req.getParameter("RepeatL1");
            String RepeatUntil              = req.getParameter("RepeatB2");
            String RemindFreq                 = req.getParameter("RemindB");
            String RemindPager     = req.getParameter("RemindCBPager");
            String RemindPagerType              =  req.getParameter("RemindPager");
            String RemindPPw                 = req.getParameter("PagerPw");
            String RemindRePPw        = req.getParameter("RePassWd");
            String RemindEmail              = req.getParameter("RemindCEmail");
            String RemindEmailAdd             = req.getParameter("RemindEmail");
            String RemindMessage              = req.getParameter("RemindMessage");
            String RemindFrom         = req.getParameter("RemindFrom");
            String Deleteall              = req.getParameter("Deleteall");
            String Deletesome       = req.getParameter("Deletesome");
            String Update                  = req.getParameter("Update");
            String Cancel                  = req.getParameter("Cancel");
          
            int No_appoint = 1;
            int EventDay               =  Integer.parseInt(req.getParameter("ESDay"));
            int EventMonth           =  Integer.parseInt(req.getParameter("ESMonth"));
            int EventYear             =  Integer.parseInt(req.getParameter("ESYear"));
            int EventHour              = Integer.parseInt(req.getParameter("EHour"));
            int EventMin                 = Integer.parseInt(req.getParameter("EMin"));
            int EventDuHour        = Integer.parseInt(req.getParameter("EDHour"));
            int EventDuMin           = Integer.parseInt(req.getParameter("EDMin"));
           int EFinalDate            = Integer.parseInt(req.getParameter("EFTDay"));
            int EFinalMonth            = Integer.parseInt(req.getParameter("EFTMonth"));
           int EFinalYear            = Integer.parseInt(req.getParameter("EFTYear"));
            int EFinalHour            = Integer.parseInt(req.getParameter("EFTHour"));
            int EFinalMin              = Integer.parseInt(req.getParameter("EFTMin"));
            int EFinalDuMonth              = Integer.parseInt(req.getParameter("EFDuM")); 
           int EFinalDuWeek              = Integer.parseInt(req.getParameter("EFDuW")); 
           int EFinalDuDay              = Integer.parseInt(req.getParameter("EFDuD")); 
            
             int RepeatUntilDay               = Integer.parseInt(req.getParameter("RB2Day"));
            int RepeatUntilMonth         = Integer.parseInt(req.getParameter("RB2Month"));
            int RepeatUntilYear                    = Integer.parseInt(req.getParameter("RB2Year"));
            int RemindWeek        = Integer.parseInt(req.getParameter("RemindWeek"));
            int RemindDay              = Integer.parseInt(req.getParameter("RemindDay"));
            int RemindHour              = Integer.parseInt(req.getParameter("RemindHour"));
             int RemindMin              = Integer.parseInt(req.getParameter("RemindMin"));
            int RemindBefore         = Integer.parseInt(req.getParameter("RemindBefore"));
            int  EventsetMonth  = EventMonth-1;
         
            int  EventEndHour = 0;
            int  EventEndMin = 0;
            if (EventTitle.equals("")) EventTitle= "No Title";
            if (EventType.equals("")) EventType = "other";    
            if (EventPlace.equals("")) EventPlace = "No Place";
            if (EventNote.equals("")) EventNote = "other";
            if (RemindMessage.equals("")) RemindMessage = EventTitle;
            if(RemindFrom.equals("")) RemindFrom = UserID;
            if( EFinalDate == 0) EFinalDate=EventDay;
            if( EFinalMonth == 0) EFinalMonth=EventMonth;
            if( EFinalYear == 0) EFinalYear=EventYear;
          
       
            int MHour = 0;
            int MMin = 00;
             try{    Class.forName("oracle.jdbc.driver.OracleDriver");
                      theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                   }  catch (Exception e) {  res.setContentType("text/html");
                                                              PrintWriter out = res.getWriter();
                                                              out.println(e.getMessage()); }
            if (session.getValue("Reminder.t") != null) {
                            long GiveTime= Long.parseLong(session.getValue("Reminder.t").toString());
                           Date MakeDate = new Date(GiveTime);
                           Calendar MCalendar = new GregorianCalendar();
                           MCalendar.setTime(MakeDate);
                           MHour = MCalendar.get(MCalendar.HOUR_OF_DAY);
                           MMin = MCalendar.get(MCalendar.MINUTE);
                        }//if
             Calendar GCalendar = new GregorianCalendar(EventYear,EventsetMonth,EventDay,EventHour,EventMin);
            EventDay = GCalendar.get(GCalendar.DAY_OF_MONTH);
            EventMonth = GCalendar.get(GCalendar.MONTH)+1;
            EventYear = GCalendar.get(GCalendar.YEAR);
            int  EventEndDay     =  EventDay;
            int  EventEndMonth =  EventMonth;
            int  EventEndYear   =  EventYear;
            int newHourall = 0;
            int newMinall = 0;
            Calendar GAll = new GregorianCalendar();
            if (EventTime.equals("AllDay"))  
                  {      try{  
                          Statement  theStatement=theConnection.createStatement();
                          ResultSet theResult =     theStatement.executeQuery("select freq_rep,to_time  from calendar  where no_cal = "+NoNum  );
                          while(theResult.next()) 
                          {                                GAll.setTime(theResult.getTime(1));
                                                            newHourall = GAll.get(GAll.HOUR_OF_DAY);
                                                            newMinall = GAll.get(GAll.MINUTE);
                  	            }
                                    theResult.close();
                                    theStatement.close();//Close statement
                                   }   catch (Exception e)   
                                               {   PrintWriter out = res.getWriter(); 
                                                    res.setContentType("text/html");
                                                    out.println(e.getMessage()); } 
                  	     EventHour = newHourall;
                  	     EventMin = newMinall;
                  	      EventEndHour=23;
                           EventEndMin = 59;
                            } //if
                        
                 
          if (EventTime.equals("SetTime")) 
                 {     GCalendar.add(GCalendar.HOUR_OF_DAY,EventDuHour);
                        GCalendar.add(GCalendar.MINUTE,EventDuMin);
                        EventEndDay = GCalendar.get(GCalendar.DAY_OF_MONTH);
                        EventEndMonth = GCalendar.get(GCalendar.MONTH)+1;
                        EventEndYear =  GCalendar.get(GCalendar.YEAR);
                        EventEndHour = GCalendar.get(GCalendar.HOUR_OF_DAY);
                        EventEndMin = GCalendar.get(GCalendar.MINUTE);
                      }        
                      
         if (EventTime.equals("Final")) {
               	        if (EventFinalTime.equals("EFBDate")) {
               	          Calendar FCalendar = new GregorianCalendar(EFinalYear,EFinalMonth-1,EFinalDate,EFinalHour,EFinalMin);
                                    if (FCalendar.after(GCalendar)){
                                         EventHour = MHour;
                                         EventMin = MMin;
                                         EventEndDay = FCalendar.get(FCalendar.DAY_OF_MONTH);
                                         EventEndMonth = FCalendar.get(FCalendar.MONTH)+1;
                                         EventEndYear =  FCalendar.get(FCalendar.YEAR);
                                         EventEndHour = FCalendar.get(FCalendar.HOUR_OF_DAY);
                                         EventEndMin =  FCalendar.get(FCalendar.MINUTE);
                                                                                    }//if after
                                  else checkFinal = false;
                                }//if EFBDate
                           if (EventFinalTime.equals("EFBDu")) 
                         { GCalendar.add(GCalendar.MONTH,EFinalDuMonth);
                                        GCalendar.add(GCalendar.WEEK_OF_MONTH,EFinalDuWeek);
                                        GCalendar.add(GCalendar.DAY_OF_MONTH,EFinalDuDay);
               	                   EventEndDay = GCalendar.get(GCalendar.DAY_OF_MONTH);
                                        EventEndMonth = GCalendar.get(GCalendar.MONTH)+1;
                                       EventEndYear =  GCalendar.get(GCalendar.YEAR);
                                       EventEndHour = GCalendar.get(GCalendar.HOUR_OF_DAY);
                                       EventEndMin = GCalendar.get(GCalendar.MINUTE);
                                       }
                      }//if Final
                /*----------------------------------------------------------------------------repeat-----------------------------------------------------*/     
               int no_counttotal = 0;
               int no_count= 0;
                 int no_counttotal2 = 0;
               int no_count2= 0;
               boolean addrep = false;
               boolean updatecal = false;
               boolean updaterep = false;
               if (checkFinal ) {
               if  (Update != null ){ 
              
              
               Calendar RepCalendar = new GregorianCalendar(RepeatUntilYear,RepeatUntilMonth-1,RepeatUntilDay);
               RepeatUntilYear = RepCalendar.get(RepCalendar.YEAR);
              RepeatUntilMonth =  RepCalendar.get(RepCalendar.MONTH)+1;
              RepeatUntilDay = RepCalendar.get(RepCalendar.DAY_OF_MONTH);
          
            int newDay = 0;
               int newMonth = 0;
               int newYear = 0;
                 int newHour = 0;
                int newMin = 0; 
                  int newDay2 = 0;
               int newMonth2 = 0;
               int newYear2 = 0;
                 int newHour2 = 0;
                int newMin2 = 0; 
                    int newDay3 = 0;
               int newMonth3 = 0;
               int newYear3 = 0;
                 int newHour3 = 0;
                int newMin3 = 0; 
                boolean chpassday = false;
             Calendar CalTemp = new GregorianCalendar();
             Calendar CalTemp2 = new GregorianCalendar();
             Calendar CalTemp3 = new GregorianCalendar();
             try{  
                          Statement  theStatement=theConnection.createStatement();
                          ResultSet theResult =     theStatement.executeQuery("select freq_rep,to_time,time  from calendar  where no_cal = "+NoNum  );
                          while(theResult.next()) 
                          {                                CalTemp.setTime(theResult.getDate(1));
                                                            newDay = CalTemp.get(CalTemp.DATE);
                                                            newMonth = CalTemp.get(CalTemp.MONTH)+1;
                                                            newYear  = CalTemp.get(CalTemp.YEAR);
                                                             CalTemp.setTime(theResult.getTime(1));
                                                            newHour = CalTemp.get(CalTemp.HOUR_OF_DAY);
                                                            newMin = CalTemp.get(CalTemp.MINUTE);
                                                             CalTemp2.setTime(theResult.getDate(2));
                                                            newDay2 = CalTemp2.get(CalTemp2.DATE);
                                                            newMonth2 = CalTemp2.get(CalTemp2.MONTH)+1;
                                                            newYear2  = CalTemp2.get(CalTemp2.YEAR);
                                                             CalTemp2.setTime(theResult.getTime(2));
                                                            newHour2 = CalTemp2.get(CalTemp2.HOUR_OF_DAY);
                                                            newMin2 = CalTemp2.get(CalTemp2.MINUTE);
                                                              CalTemp3.setTime(theResult.getDate(3));
                                                            newDay3 = CalTemp3.get(CalTemp3.DATE);
                                                            newMonth3 = CalTemp3.get(CalTemp3.MONTH)+1;
                                                            newYear3  = CalTemp3.get(CalTemp3.YEAR);
                                                             CalTemp3.setTime(theResult.getTime(3));
                                                            newHour3 = CalTemp3.get(CalTemp3.HOUR_OF_DAY);
                                                            newMin3 = CalTemp3.get(CalTemp3.MINUTE);
                                                           }
                                    theResult.close();
                                    theStatement.close();//Close statement
                                   }   catch (Exception e)   
                                               {   PrintWriter out = res.getWriter(); 
                                                    res.setContentType("text/html");
                                                    out.println(e.getMessage()); } 
                                                    
	     try{    Statement  theStatement=theConnection.createStatement();
                                                           ResultSet theResult =     theStatement.executeQuery("select count(*)  from calendar  where no_rep = "+No_rep );
                                                          while (theResult.next())   { no_counttotal = theResult.getInt(1) ; }
                                                          theStatement.close();
                                                           theResult.close();
                                                     } catch (Exception e) {   PrintWriter out = res.getWriter(); 
                                                                                                   res.setContentType("text/html");
                    	                                                                             out.println(e.getMessage()); }   
                                           
                        try {    Statement  theStatement=theConnection.createStatement();
                                                        ResultSet theResult =     theStatement.executeQuery("select count(*)  from calendar  where no_rep = "+No_rep +"and no_cal >= "+NoNum );
                                                         while (theResult.next())    { no_count = theResult.getInt(1) ; }
                                                        theStatement.close();
                                                        theResult.close();
                                                   } catch (Exception e) { PrintWriter out = res.getWriter(); 
                                                                                               res.setContentType("text/html");
                    	                                                                         out.println(e.getMessage()); }   
                    	                                                                         
	   try{    Statement  theStatement=theConnection.createStatement();
                                                           ResultSet theResult =     theStatement.executeQuery("select count(*)  from calendar  where no_rep = "+No_rep+
                                                          " and  time = to_date('"+newDay+"/" +newMonth+"/"+newYear+"  "
                                                           +newHour+":"+newMin+"','dd/mm/yyyy hh24:mi') and  freq_rep =  to_date('"+newDay+"/"+newMonth+"/"+newYear+ " "+ newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')"
                                                           +" and  to_time = to_date('"+newDay2+"/"+newMonth2+"/"+newYear2+ " "+ newHour2+":"+newMin2+"','dd/mm/yyyy hh24:mi')");
                                                          while (theResult.next())   { no_counttotal2 = theResult.getInt(1) ; }
                                                          theStatement.close();
                                                           theResult.close();
                                                     } catch (Exception e) {   PrintWriter out = res.getWriter(); 
                                                                                                   res.setContentType("text/html");
                    	                                                                             out.println(e.getMessage()); }   
                    	   try {    Statement  theStatement=theConnection.createStatement();
                                                        ResultSet theResult =     theStatement.executeQuery("select count(*)  from calendar  where no_rep = "+No_rep +
                                                         " and  time <  to_date('"+newDay+"/" +newMonth+"/"+newYear+"  "
                                                           +newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')");
                                                         while (theResult.next())    { no_count2 = theResult.getInt(1) ; }
                                                        theStatement.close();
                                                        theResult.close();
                                                   } catch (Exception e) { PrintWriter out = res.getWriter(); 
                                                                                               res.setContentType("text/html");
                    	                                                                         out.println(e.getMessage()); }   
                                                                                                        	                                                                         
               CalTemp3 =  new GregorianCalendar(newYear3,newMonth3-1,newDay3);
              CalTemp2 =  new GregorianCalendar(newYear2,newMonth2-1,newDay2);                                       
               if  (!(CalTemp3.equals(CalTemp2)))      chpassday = true;                              
              PrintWriter out = res.getWriter(); 
              
              if (!chpassday) {
              if (!RepeatFreq.equals("NoRep")) {
                if (No_rep == 1)  {  addrep = true;
                                                   updatecal = true; }
                else  if (No_rep > 1) {  
               	                                    try {   Statement  theStatement=theConnection.createStatement();
                    	                                     theStatement.executeQuery( "delete from calendar  where no_rep = "+No_rep +" and no_cal > "+NoNum);
                    	                                     theStatement.close();
                                                               } catch (Exception e) { // PrintWriter out = res.getWriter(); 
                                                                                                   res.setContentType("text/html");
                    	                                                                              out.println(e.getMessage()); }   
                    	                        if (no_counttotal == no_count)  { updaterep = true;
                    	                        			updatecal = true;        }
                    	                      else {addrep = true;
                    	                                  updatecal = true;       }
                    	                           }//if No_rep
                }//if NoRep     
                  else {  if (No_rep >1) {try {   Statement  theStatement=theConnection.createStatement();
                    	                                        theStatement.executeQuery( "delete from calendar  where no_rep = "+No_rep +" and no_cal > "+NoNum);
                    	                                        theStatement.close();
                                                         } catch (Exception e) { // PrintWriter out = res.getWriter(); 
                                                                                                      res.setContentType("text/html");
                    	                                                                                 out.println(e.getMessage()); }   
                    	                     if (no_counttotal == no_count) {   
                    	                                      	try {   Statement  theStatement=theConnection.createStatement();
                    	                                                    theStatement.executeQuery( "delete from repeat  where no_rep = "+No_rep);
                    	                                                    theStatement.close();
                                                                     } catch (Exception e) {  //PrintWriter out = res.getWriter(); 
                                                                                                                  res.setContentType("text/html");
                    	                                                                                            out.println(e.getMessage()); }   
                    	                  }//if no_count
                    	       }//if no_rep > 1
                    	                updatecal = true;
                      	No_rep = 1;
           	    }//else
                    	}//if chpassday
                   	  else {   if (!RepeatFreq.equals("NoRep")) {
                    	                if (No_rep == 1) 
                    	                {  try {   Statement  theStatement=theConnection.createStatement();
                    	                                     theStatement.executeQuery( "delete from calendar  where " +
                    	                                     "  time = to_date('"+newDay3+"/" +newMonth3+"/"+newYear3+"  "
                                                           +newHour3+":"+newMin3+"','dd/mm/yyyy hh24:mi') and  freq_rep > to_date('"+newDay+"/"+newMonth+"/"+newYear+ " "+ newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')"
                                                           +" and  to_time = to_date('"+newDay2+"/"+newMonth2+"/"+newYear2+ " "+ newHour2+":"+newMin2+"','dd/mm/yyyy hh24:mi')");
                    	                                     theStatement.close();
                                                      } catch (Exception e) {  //PrintWriter out = res.getWriter(); 
                                                                                                   res.setContentType("text/html");
                    	                                                                              out.println(e.getMessage()); }
                    	              }//if No_rep = 1
                    	             else {                    	             
                    	                try {   Statement  theStatement=theConnection.createStatement();
                    	                                     theStatement.executeQuery( "delete from calendar  where no_rep = "+No_rep +
                    	                                     " and  time >= to_date('"+newDay3+"/" +newMonth3+"/"+newYear3+"  "
                                                           +newHour3+":"+newMin3+"','dd/mm/yyyy hh24:mi') and  freq_rep > to_date('"+newDay+"/"+newMonth+"/"+newYear+ " "+ newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')"
                                                           +" and  to_time >= to_date('"+newDay2+"/"+newMonth2+"/"+newYear2+ " "+ newHour2+":"+newMin2+"','dd/mm/yyyy hh24:mi')"
                    	                                     +"and  freq_rep >  to_date('"+newDay+"/"+newMonth+"/"+newYear+ " "+ newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')");
                    	                                     theStatement.close();
                                                      } catch (Exception e) {  //PrintWriter out = res.getWriter(); 
                                                                                                   res.setContentType("text/html");
                    	                                                                              out.println(e.getMessage()); }
                    	                       }//else
                    	         if (No_rep == 1)  {  addrep = true;
                                                                               updatecal = true; }
                              else {  if ((no_counttotal2 == 0) || (no_count2 > 0))   {      addrep = true;
                    	                        			                           updatecal = true;   }
                    	                                      else  { if (no_counttotal2 ==1) addrep = true;
                    	                                                   else if (no_count2 == 0)  updaterep = true;
                    	                                                  } updatecal = true;   
                    	                                }
                    	  }//if No_rep<>Norep
                    	              else{   if (No_rep == 1)
                    	                          {   try {      Statement  theStatement=theConnection.createStatement();
                    	                                        theStatement.executeQuery( "delete from calendar  where "+
                    	                                         "   time = to_date('"+newDay3+"/" +newMonth3+"/"+newYear3+"  "
                                                           +newHour3+":"+newMin3+"','dd/mm/yyyy hh24:mi')" 
                                                           +" and  to_time = to_date('"+newDay2+"/"+newMonth2+"/"+newYear2+ " "
                                                           + newHour2+":"+newMin2+"','dd/mm/yyyy hh24:mi')"
                                                           +"and  freq_rep >  to_date('"+newDay+"/"+newMonth+"/"+newYear+ " "+ newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')");
                    	                                        theStatement.close();
                                                         } catch (Exception e) { // PrintWriter out = res.getWriter(); 
                                                                                                      res.setContentType("text/html");
                    	                                                                                 out.println(e.getMessage()); }   
                    	                                    }//if
                    	                              if (No_rep > 1) {     try {      Statement  theStatement=theConnection.createStatement();
                    	                                        theStatement.executeQuery( "delete from calendar  where no_rep = "+No_rep +
                    	                                         " and  time >= to_date('"+newDay3+"/" +newMonth3+"/"+newYear3+"  "
                                                           +newHour3+":"+newMin3+"','dd/mm/yyyy hh24:mi')" 
                                                           +" and  to_time >= to_date('"+newDay2+"/"+newMonth2+"/"+newYear2+ " "
                                                           + newHour2+":"+newMin2+"','dd/mm/yyyy hh24:mi')"
                                                           +"and  freq_rep >  to_date('"+newDay+"/"+newMonth+"/"+newYear+ " "+ newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')");
                    	                                        theStatement.close();
                                                         } catch (Exception e) { // PrintWriter out = res.getWriter(); 
                                                                                                      res.setContentType("text/html");
                    	                                                                                 out.println(e.getMessage()); }   
                    	                                    }//if
                    	                                  if (No_rep>1) { if  (no_count2 == 0) {   
                    	                                      	try {   Statement  theStatement=theConnection.createStatement();
                    	                                                    theStatement.executeQuery( "delete from repeat  where no_rep = "+No_rep);
                    	                                                    theStatement.close();
                                                                     } catch (Exception e) {  //PrintWriter out = res.getWriter(); 
                                                                                                                  res.setContentType("text/html");
                    	                                                                                            out.println(e.getMessage()); }   
                    	                                               }//if
                    	                                            }//if No_rep
                    	                              /*  out.println(newDay3+"/"+newMonth3+"/"+newYear3+" "+newHour3+":"+newMin3);
                    	                                out.println(newDay2+"/"+newMonth2+"/"+newYear2+" "+newHour2+":"+newMin2);
                    	                                out.println(newDay+"/"+newMonth+"/"+newYear+" "+newHour+":"+newMin);*/
                    	                                   try{    Statement  theStatement=theConnection.createStatement();
                                                             theStatement.executeQuery(
                                                         "Update calendar  set  title = '"+EventTitle+"',  type = '"+EventType+"', place = '"+EventPlace+"', note = '"+EventNote+"', safe_mode = '"+EventSharing+"', "+
                                                           "no_rep = 1 , no_rem = "+No_rem+
                                                           " where  no_rep ="+No_rep+
                                                           "  and time = to_date('"+newDay3+"/" +newMonth3+"/"+newYear3+"  "
                                                           +newHour3+":"+newMin3+"','dd/mm/yyyy hh24:mi') "
                                                           +" and  to_time = to_date('"+newDay2+"/"+newMonth2+"/"+newYear2+ " "+ newHour2+":"+newMin2+"','dd/mm/yyyy hh24:mi')"
                                                           +"and  freq_rep >=  to_date('"+newDay+"/"+newMonth+"/"+newYear+ " "+ newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')");
                                                            theStatement.close();//Close statement
                                                     }   catch (Exception e)     {   //PrintWriter out = res.getWriter(); 
                                                                                                            res.setContentType("text/html");
                    	                                                                                       out.println(e.getMessage()); }   
                	
           		} 
                    	  No_rep = 1;
                    	    }//else chpassday
              int No_repnew = 1;
              No_repnew = No_rep;
              if ( (updaterep) || (addrep) ) {  No_rep = UpdateRepeat.CheckRep(out,updaterep,addrep,EventDay,EventMonth,EventYear,EventHour,EventMin,theConnection,RepeatFreq,No_rep,RepeatUntilYear,RepeatUntilMonth,RepeatUntilDay,RepeatWeek,RepeatUntil,UserID,DayName); }
             
             /*--------------------------------------------------------------------------------Remind---------------------------------------------------------------------------*/
              boolean Chrem = false; 
            boolean CheckRem = false;
            boolean CheckRem2 = false;
           int RemindPNum = 0;
           if (req.getParameter("PNumber").equals("") )
                {  RemindPNum = 0 ;
                    CheckRem = true;}
                else {    RemindPNum =  Integer.parseInt(req.getParameter("PNumber")); } 
           if  (RemindPager==null)  {CheckRem= true;
           			RemindPagerType="No Type";}
           if (RemindPagerType.equals("162")) {
               if  ( ! (( RemindPPw.equals(RemindRePPw) ) && (!RemindPPw.equals("")) ) )  CheckRem = true; 
              }
            if (RemindPPw.equals("")) RemindPPw = "NO Password";
            if (RemindEmailAdd.equals("")) RemindEmailAdd="No Email";
            if (RemindEmail==null) CheckRem2= true;
            if (RemindEmailAdd.equals("")) CheckRem2= true;
            if  (  ((RemindWeek==0) && (RemindDay==0) && (RemindHour==0) && (RemindMin==0))  && (RemindBefore==0) )
              { CheckRem= true;
                 CheckRem2= true; }	
            boolean addrem = false;
           boolean updaterem = false;
           boolean updaterem1 = false;
           boolean updatecalrem = false;
           int  norem = 0;
            try {    Statement  theStatement=theConnection.createStatement();
                                         ResultSet theResult =     theStatement.executeQuery(
                                              "select count(*)  from remind where no_cal = "+NoNum);
                                                 while (theResult.next()) { norem = theResult.getInt(1) ; }
                                                theStatement.close();
                                                theResult.close();
                                      } catch (Exception e) { // PrintWriter out = res.getWriter(); 
                                                                                   res.setContentType("text/html");
                    	                                                              out.println(e.getMessage()); }   
           if (( !RemindFreq.equals("NoRem")) && (  (!CheckRem) ||(!CheckRem2))   )
           {	if (No_rem == 1) {  addrem = true;
             		              updatecalrem = true;}
               else {      if (norem==0) {    try{   Statement  theStatement=theConnection.createStatement();
                                                                   theStatement.executeQuery( 
                                                                   "delete from remind where root = "+No_rem ); 
                                                                   theStatement.close(); 
                                                                }   catch (Exception e) {   // PrintWriter out = res.getWriter(); 
                                                                                                                  res.setContentType("text/html");
                    	                                                                                             out.println(e.getMessage()); }
                    	                                     updaterem = true;
          	       	                updatecalrem = true; 
          	       	                }
          	      else {  try {   Statement  theStatement=theConnection.createStatement();
                    	                               theStatement.executeQuery( 
                    	                               " delete from remind where no_cal  >"+ NoNum+"  and root ="+No_rem);
          		        theStatement.close();
                                              } catch (Exception e) { // PrintWriter out = res.getWriter(); 
                                                                                         res.setContentType("text/html");
                    	                                                                    out.println(e.getMessage()); }   	
                    	                       updaterem1 = true;
          	                      updatecalrem = true;
                    	                        }//else
                        }//else
                 if ((updaterem) || (addrem) || (updaterem1))  {
               Calendar RemCalendar = new GregorianCalendar(EventYear,EventMonth-1,EventDay,EventHour,EventMin);
               RemCalendar.add(RemCalendar.DATE,-(RemindWeek*7));
               RemCalendar.add(RemCalendar.DATE,-(RemindDay));
               RemCalendar.add(RemCalendar.HOUR_OF_DAY,-(RemindHour));
              RemCalendar.add(RemCalendar.MINUTE,-(RemindMin)); 
               int FbeforeDay = RemCalendar.get(RemCalendar.DAY_OF_MONTH);
               int FbeforeMonth = RemCalendar.get(RemCalendar.MONTH)+1;
               int FbeforeYear = RemCalendar.get(RemCalendar.YEAR);
               int FbeforeHour = RemCalendar.get(RemCalendar.HOUR_OF_DAY);
               int FbeforeMin = RemCalendar.get(RemCalendar.MINUTE);
         
               Calendar RemCalendar2 = new GregorianCalendar(EventYear,EventMonth-1,EventDay,EventHour,EventMin);
              RemCalendar2.add(RemCalendar2.MINUTE,-(RemindBefore));  
          
              int Fbefore2Day = RemCalendar2.get(RemCalendar2.DAY_OF_MONTH);
              int  Fbefore2Month = RemCalendar2.get(RemCalendar2.MONTH)+1;
              int  Fbefore2Year = RemCalendar2.get(RemCalendar2.YEAR);
              int Fbefore2Hour = RemCalendar2.get(RemCalendar2.HOUR_OF_DAY);
              int Fbefore2Min = RemCalendar2.get(RemCalendar2.MINUTE);
           
              res.setContentType("text/html");
              No_rem = UpdateReminderSub.CheckRem(NoNum,addrem,updaterem,updaterem1,out,RemindWeek,RemindDay, RemindHour ,RemindMin ,RemindBefore,theConnection,No_rem,FbeforeDay, FbeforeMonth,FbeforeYear,FbeforeHour,FbeforeMin,Fbefore2Day,Fbefore2Month,Fbefore2Year,Fbefore2Hour,Fbefore2Min,RemindPager,RemindPagerType,RemindPNum,RemindPPw,RemindRePPw,RemindEmail,RemindEmailAdd,RemindMessage,RemindFrom,UserID);
              }//if
        }//if remind
        else  {  if (No_rem >1) {     if (norem ==0) {    try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                                                                   theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                                                   Statement  theStatement=theConnection.createStatement();
                                                                   theStatement.executeQuery( 
                                                                   "delete from remind where (no_rem = "+No_rem +" and no_cal=1)  or root = "+No_rem ); 
                                                                   theStatement.close(); 
                                                                }   catch (Exception e) {   // PrintWriter out = res.getWriter(); 
                                                                                                                  res.setContentType("text/html");
                    	                                                                                             out.println(e.getMessage()); }
                    	                                   }//if
                    	                                else {  try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                                                               theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                                               Statement  theStatement=theConnection.createStatement();
                                                              theStatement.executeQuery(  " delete from remind where no_cal >="+ NoNum+" and root ="+No_rem);
                                                              theStatement.close(); 
                                                                 }   catch (Exception e) {// PrintWriter out = res.getWriter(); 
                                                                                            res.setContentType("text/html");
                    	                                                                        out.println(e.getMessage()); }
                    	                 }//else
                    	            }//if No_rem >1
                    	              try{    Statement  theStatement=theConnection.createStatement();
                                                             theStatement.executeQuery(
                                                         "Update calendar  set  title = '"+EventTitle+"',  type = '"+EventType+"', place = '"+EventPlace+"', note = '"+EventNote+"', safe_mode = '"+EventSharing+"', "+
                                                           "no_rep = "+No_rep+"  , no_rem = 1"+
                                                           " where  no_rep ="+No_rep+
                                                           "  and time = to_date('"+newDay3+"/" +newMonth3+"/"+newYear3+"  "
                                                           +newHour3+":"+newMin3+"','dd/mm/yyyy hh24:mi') "
                                                           +" and  to_time = to_date('"+newDay2+"/"+newMonth2+"/"+newYear2+ " "+ newHour2+":"+newMin2+"','dd/mm/yyyy hh24:mi')");
                                                             theStatement.close();//Close statement
                                                     }   catch (Exception e)     {   //PrintWriter out = res.getWriter(); 
                                                                                                            res.setContentType("text/html");
                    	                                                                                       out.println(e.getMessage()); }   
                    	  No_rem = 1;
                      }//else
                
             /*----------------------------------------------------------------------------------Update Calendar-------------------------------------------------------------*/
              
                 try{  
                          Statement  theStatement=theConnection.createStatement();
                          ResultSet theResult =     theStatement.executeQuery("select freq_rep,to_time,time  from calendar  where no_cal = "+NoNum  );
                          while(theResult.next()) 
                          {                                CalTemp.setTime(theResult.getDate(1));
                                                            newDay = CalTemp.get(CalTemp.DATE);
                                                            newMonth = CalTemp.get(CalTemp.MONTH)+1;
                                                            newYear  = CalTemp.get(CalTemp.YEAR);
                                                             CalTemp.setTime(theResult.getTime(1));
                                                            newHour = CalTemp.get(CalTemp.HOUR_OF_DAY);
                                                            newMin = CalTemp.get(CalTemp.MINUTE);
                                                             CalTemp2.setTime(theResult.getDate(2));
                                                            newDay2 = CalTemp2.get(CalTemp2.DATE);
                                                            newMonth2 = CalTemp2.get(CalTemp2.MONTH)+1;
                                                            newYear2  = CalTemp2.get(CalTemp2.YEAR);
                                                             CalTemp2.setTime(theResult.getTime(2));
                                                            newHour2 = CalTemp2.get(CalTemp2.HOUR_OF_DAY);
                                                            newMin2 = CalTemp2.get(CalTemp2.MINUTE);
                                                              CalTemp3.setTime(theResult.getDate(3));
                                                            newDay3 = CalTemp3.get(CalTemp3.DATE);
                                                            newMonth3 = CalTemp3.get(CalTemp3.MONTH)+1;
                                                            newYear3  = CalTemp3.get(CalTemp3.YEAR);
                                                             CalTemp3.setTime(theResult.getTime(3));
                                                            newHour3 = CalTemp3.get(CalTemp3.HOUR_OF_DAY);
                                                            newMin3 = CalTemp3.get(CalTemp3.MINUTE);
                                                           }
                                    theResult.close();
                                    theStatement.close();//Close statement
                                   }   catch (Exception e)   
                                               {   //PrintWriter out = res.getWriter(); 
                                                    res.setContentType("text/html");
                                                    out.println(e.getMessage()); } 
               Calendar GCalendar2  = new GregorianCalendar(EventEndYear,EventEndMonth-1,EventEndDay,EventEndHour,EventEndMin);
                GCalendar =  new GregorianCalendar(EventYear,EventMonth-1,EventDay,EventHour,EventMin);
                CalTemp =  new GregorianCalendar(newYear,newMonth-1,newDay,newHour,newMin);
                CalTemp2 =  new GregorianCalendar(newYear2,newMonth2-1,newDay2,newHour2,newMin2);
                CalTemp3 =  new GregorianCalendar(newYear3,newMonth3-1,newDay3,newHour3,newMin3);
              out.println(updatecal+" "+updatecalrem);
                if ((updatecal) || (updatecalrem)) {
         	if ((CalTemp3.equals(GCalendar)) && (!(CalTemp2.equals(GCalendar2))))
        	  {    try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                              theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                              Statement  theStatement=theConnection.createStatement();
                               theStatement.executeQuery(
                                                "Update calendar  set  time = to_date('"+newDay3+"/" +newMonth3+"/"+newYear3+"  "
                                                           +newHour3+":"+newMin3+"','dd/mm/yyyy hh24:mi')"
                                                           +", to_time = to_date('"+EventEndDay+"/"+EventEndMonth+"/"+EventEndYear+ " "+ EventEndHour+":"+EventEndMin+"','dd/mm/yyyy hh24:mi') ,"+
                                                           " title = '"+EventTitle+"',  type = '"+EventType+"', place = '"+EventPlace+"', note = '"+EventNote+"', safe_mode = '"+EventSharing+"', "+
                                                           "no_rep = "+No_rep+", no_rem = "+No_rem+",  freq_rep = to_date('"+newDay3+"/"+newMonth3+"/"+newYear3+ " "+ newHour3+":"+newMin3+"','dd/mm/yyyy hh24:mi')"  
                                                           +" where id = ' "+UserID+"' and no_cal = "+ NoNum);
                        theStatement.close();//Close statement
                   }   catch (Exception e)  
                                               {   //PrintWriter out = res.getWriter(); 
                                                     res.setContentType("text/html");
                    	                                out.println(e.getMessage()); }
        	  }//if	
        	  else {  if ((CalTemp3.equals(GCalendar)) && (CalTemp2.equals(GCalendar2)))
        	  	  {   try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                                                            theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                                           Statement  theStatement=theConnection.createStatement();
                                                             theStatement.executeQuery(
                                                         "Update calendar  set  "+
                                                           " title = '"+EventTitle+"',  type = '"+EventType+"', place = '"+EventPlace+"', note = '"+EventNote+"', safe_mode = '"+EventSharing+"', "+
                                                           "no_rep = "+No_rep+", no_rem = "+No_rem+
                                                           " where id = ' "+UserID+"' and no_cal = "+ NoNum);
                                                  theStatement.close();//Close statement
                                                     }   catch (Exception e)     {   //PrintWriter out = res.getWriter(); 
                                                                                                            res.setContentType("text/html");
                    	                                                                                       out.println(e.getMessage()); }
        	                         }//if	
        	  	else if  ((!(CalTemp3.equals(GCalendar))) && (CalTemp2.equals(GCalendar2)))
        	  	         {    try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                                                         theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                                        Statement  theStatement=theConnection.createStatement();
                                                        theStatement.executeQuery(
                                                        "Update calendar  set  time = to_date('"+EventDay+"/" +EventMonth+"/"+EventYear+"  "
                                                           +EventHour+":"+EventMin+"','dd/mm/yyyy hh24:mi')"
                                                           +", to_time = to_date('"+newYear2+"/"+newMonth2+"/"+newDay2+ " "+ newHour2+":"+newMin2+"','dd/mm/yyyy hh24:mi') ,"+
                                                           " title = '"+EventTitle+"',  type = '"+EventType+"', place = '"+EventPlace+"', note = '"+EventNote+"', safe_mode = '"+EventSharing+"', "+
                                                           "no_rep = "+No_rep+", no_rem = "+No_rem+",  freq_rep =to_date('"+EventDay+"/" +EventMonth+"/"+EventYear+"  "
                                                           +EventHour+":"+EventMin+"','dd/mm/yyyy hh24:mi')"
                                                           +" where id = ' "+UserID+"' and no_cal = "+ NoNum);
                                                         theStatement.close();//Close statement
                                                         }   catch (Exception e)        {   //PrintWriter out = res.getWriter(); 
                                                                                                                  res.setContentType("text/html");
                    	                                                                                           out.println(e.getMessage()); }
        	                          }//if	
        	  	    else if ((!(CalTemp.equals(GCalendar))) && (!(CalTemp2.equals(GCalendar2))))
        	  	                   {try{     
        	  	                   	 Class.forName("oracle.jdbc.driver.OracleDriver");
                                                                  theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                                                Statement  theStatement=theConnection.createStatement();
                                                               theStatement.executeQuery(
                                                                "Update calendar  set  time = to_date('"+EventDay+"/" +EventMonth+"/"+EventYear+"  "
                                                           +EventHour+":"+EventMin+"','dd/mm/yyyy hh24:mi')"
                                                           +", to_time = to_date('"+EventEndDay+"/"+EventEndMonth+"/"+EventEndYear+ " "+ EventEndHour+":"+EventEndMin+"','dd/mm/yyyy hh24:mi') ,"+
                                                           " title = '"+EventTitle+"',  type = '"+EventType+"', place = '"+EventPlace+"', note = '"+EventNote+"', safe_mode = '"+EventSharing+"', "+
                                                           "no_rep = "+No_rep+", no_rem = "+No_rem+",  freq_rep = to_date('"+EventDay+"/" +EventMonth+"/"+EventYear+"  "
                                                           +EventHour+":"+EventMin+"','dd/mm/yyyy hh24:mi')"
                                                           +" where id = ' "+UserID+"' and no_cal = "+ NoNum);
                                                       theStatement.close();//Close statement
                                                       }   catch (Exception e)  {   //PrintWriter out = res.getWriter(); 
                                                                                                        res.setContentType("text/html");
                    	                                                                                   out.println(e.getMessage()); }
                    	                                 }//if
                    	      }//else
                    	   }//if updatecalnew
              
               try{  
                          Statement  theStatement=theConnection.createStatement();
                          ResultSet theResult =     theStatement.executeQuery("select freq_rep,to_time,time  from calendar  where no_cal = "+NoNum  );
                          while(theResult.next()) 
                          {                                CalTemp.setTime(theResult.getDate(1));
                                                            newDay = CalTemp.get(CalTemp.DATE);
                                                            newMonth = CalTemp.get(CalTemp.MONTH)+1;
                                                            newYear  = CalTemp.get(CalTemp.YEAR);
                                                             CalTemp.setTime(theResult.getTime(1));
                                                            newHour = CalTemp.get(CalTemp.HOUR_OF_DAY);
                                                            newMin = CalTemp.get(CalTemp.MINUTE);
                                                             CalTemp2.setTime(theResult.getDate(2));
                                                            newDay2 = CalTemp2.get(CalTemp2.DATE);
                                                            newMonth2 = CalTemp2.get(CalTemp2.MONTH)+1;
                                                            newYear2  = CalTemp2.get(CalTemp2.YEAR);
                                                             CalTemp2.setTime(theResult.getTime(2));
                                                            newHour2 = CalTemp2.get(CalTemp2.HOUR_OF_DAY);
                                                            newMin2 = CalTemp2.get(CalTemp2.MINUTE);
                                                              CalTemp3.setTime(theResult.getDate(3));
                                                            newDay3 = CalTemp3.get(CalTemp3.DATE);
                                                            newMonth3 = CalTemp3.get(CalTemp3.MONTH)+1;
                                                            newYear3  = CalTemp3.get(CalTemp3.YEAR);
                                                             CalTemp3.setTime(theResult.getTime(3));
                                                            newHour3 = CalTemp3.get(CalTemp3.HOUR_OF_DAY);
                                                            newMin3 = CalTemp3.get(CalTemp3.MINUTE);
                                                           }
                                    theResult.close();
                                    theStatement.close();//Close statement
                                   }   catch (Exception e)   
                                               {   //PrintWriter out = res.getWriter(); 
                                                    res.setContentType("text/html");
                                                    out.println(e.getMessage()); } 
              boolean checkcal = false;
             boolean checklong = false;
              if  ( (newYear ==  newYear2)  && (newMonth ==   newMonth2) &&(newDay ==   newDay2) ) checkcal = true;
             else checkcal = false;
             int LongEventDay =  newDay;
             int LongEventMonth = newMonth;
             int LongEventYear =       newYear ;                   
            int count = 1;
             while  (!checkcal)  {
             	   GCalendar = new GregorianCalendar(LongEventYear,LongEventMonth-1,LongEventDay);
             	   GCalendar.add(GCalendar.DATE,1);   
             	  LongEventDay = GCalendar.get(GCalendar.DAY_OF_MONTH);
                       LongEventMonth = GCalendar.get(GCalendar.MONTH)+1;
                       LongEventYear = GCalendar.get(GCalendar.YEAR);
                       if  ( (LongEventYear ==  newYear2)  && (LongEventMonth ==   newMonth2) &&(LongEventDay  ==   newDay2) )  
                       { checkcal = true;
                          checklong = false;
                        }
                        
                       if (LongEventYear <   newYear2) checklong= true;
                       if (LongEventYear >   newYear2) checklong= false;
                       else  if ( (LongEventYear ==  newYear2)  && (LongEventMonth <   newMonth2)) checklong= true;
                          else if  ( (LongEventYear ==  newYear2)  && (LongEventMonth ==   newMonth2) &&(LongEventDay  <   newDay2) ) checklong= true;
                                   else checklong=false;                    
	if (checklong) {                                   
                      try{    
                          Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                                     "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,safe_mode,no_rep,no_rem,no_group,freq_rep)"
                                                           + "values( no_cal.nextval,to_date('"+newDay3+"/" +newMonth3+"/"+newYear3+"  "
                                                           +newHour3+":"+newMin3+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+newDay2+"/"+newMonth2+"/"+newYear2+ " "+ newHour2+":"+newMin2+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +EventTitle+"','"+EventType+"','"+EventPlace+"','"+EventNote+"','"+EventSharing+"','"+No_rep+"','"+No_rem+"',1,to_date('"+LongEventDay+"/" +LongEventMonth+"/"+LongEventYear+"  "
                                                           +"00:00','dd/mm/yyyy hh24:mi'))");
                                               theStatement.close();//Close statement
                                 }   catch (Exception e)   
                                               { res.setContentType("text/html");
                                                   out.println(e.getMessage()); }                                      
                                                 }
                          if  ((!checklong) && (checkcal) ) {
	         try{    
                          Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                                    "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,safe_mode,no_rep,no_rem,no_group,freq_rep)"
                                                           + "values( no_cal.nextval,to_date('"+newDay3+"/" +newMonth3+"/"+newYear3+"  "
                                                           +newHour3+":"+newMin3+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+newDay2+"/"+newMonth2+"/"+newYear2+ " "+ newHour2+":"+newMin2+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +EventTitle+"','"+EventType+"','"+EventPlace+"','"+EventNote+"','"+EventSharing+"','"+No_rep+"','"+No_rem+"',1,to_date('"+LongEventDay+"/" +LongEventMonth+"/"+LongEventYear+"  "
                                                           +EventHour+":"+EventMin+"','dd/mm/yyyy hh24:mi'))");
                                                      
                                    theStatement.close();//Close statement
                                 }   catch (Exception e)   
                                               { res.setContentType("text/html");
                                                   out.println(e.getMessage()); }                                      
                                                 }                          	
                              
                         count++;
                         if (count == 50) continue;
                          }//while                         
           /*---------------------------------------------------------------------Add Repeat----------------------------------------------------------------------*/
               
                 /*--------------------------------------------------------------Show Repeat-----------------------------------------------------------------------*/
         //  int count = 5;
              if ( ((No_rep > No_repnew) || (No_repnew > 1)) && (No_rep > 1))   	                                
                 {      int RepFDate = 0;
                        int RepFMonth = 0;
                        int RepFYear = 0 ; 
              String CheckFreq = "";
                 int count1 = 0;
         int no_cal = 0;
        boolean crepshow = false;
         try{          Statement  theStatement=theConnection.createStatement();
                          ResultSet theResult =     theStatement.executeQuery(
                          "select count(*)  from calendar  where no_rep > 1 and no_rep = "+No_rep);
                            while(theResult.next()) {count1 = theResult.getInt(1) ;}
                 theResult.close();
                theStatement.close();//Close statement
                }   catch (Exception e)       { res.setContentType("text/html");
                                                                   out.println(e.getMessage()); } 
             try{          Statement  theStatement=theConnection.createStatement();
                          ResultSet theResult =     theStatement.executeQuery("select until,freq_rep from repeat  where no_rep > 1 and no_rep = "+No_rep);
                          while(theResult.next()) 
                          {                Calendar RepFCalendar = new GregorianCalendar();
                          	RepFCalendar.setTime(theResult.getDate(1));
                                                            RepFDate = RepFCalendar.get(RepFCalendar.DATE);
                                                            RepFMonth = RepFCalendar.get(RepFCalendar.MONTH)+1;
                                                            RepFYear = RepFCalendar.get(RepFCalendar.YEAR);
                                                            CheckFreq = theResult.getString(2);
                               }
                                    theResult.close();
                                    theStatement.close();//Close statement
                                   }   catch (Exception e)   
                                               { res.setContentType("text/html");
                                                   out.println(e.getMessage()); } 
              
           int RepFDatecal = 0;
           int RepFMonthcal = 0;
           int RepFYearcal   = 0;
             int RepFDatecal1 = 0;
           int RepFMonthcal1 = 0;
           int RepFYearcal1   = 0;
           int tempDay = 0;
           int tempMonth = 0;
           int tempYear = 0;
              try{  
                          Statement  theStatement=theConnection.createStatement();
                          ResultSet theResult =     theStatement.executeQuery("select freq_rep,no_cal,to_time  from calendar  where no_rep > 1 and no_rep = "+No_rep+" order by no_cal");
                          while (theResult.next()) 
                          {                                Calendar RepFCalendar2 = new GregorianCalendar();
                          	                  RepFCalendar2.setTime(theResult.getDate(1));
                                                            RepFDatecal = RepFCalendar2.get(RepFCalendar2.DATE);
                                                            RepFMonthcal = RepFCalendar2.get(RepFCalendar2.MONTH)+1;
                                                             RepFYearcal  = RepFCalendar2.get(RepFCalendar2.YEAR);
                                                             Calendar RepFCalendar3 = new GregorianCalendar();
                          	                  RepFCalendar3.setTime(theResult.getDate(3));
                                                            RepFDatecal1 = RepFCalendar3.get(RepFCalendar3.DATE);
                                                            RepFMonthcal1 = RepFCalendar3.get(RepFCalendar3.MONTH)+1;
                                                             RepFYearcal1  = RepFCalendar3.get(RepFCalendar3.YEAR);
                                                             continue;
                              }//while
                                    theResult.close();
                                    theStatement.close();//Close statement
                                   }   catch (Exception e)   
                                               { res.setContentType("text/html");
                                                    out.println(e.getMessage()); } 
         // out.println(RepFDatecal+"<br/>"+RepFMonthcal+"<br/>"+RepFYearcal);
          /*----------------------------------------------------------------------Freq_rep------------------------------------------------------------------*/
          Calendar CalRep = new GregorianCalendar(RepFYearcal,RepFMonthcal-1,RepFDatecal);
                int Temp = (CalRep.get(CalRep.DAY_OF_WEEK));
                boolean Temp2=true;
                if (CheckFreq.equals(" Sunday ")) 
                { Temp=1+(7-Temp);
                    Temp2=false; }
                if (CheckFreq.equals(" Monday ")) 
               {  if ( Temp < 2 ) Temp = 2-Temp;  else Temp=2+(7-Temp);  
                   Temp2=false;                }
               else if (CheckFreq.equals(" Tuesday ")) 
               {  if ( Temp < 3 ) Temp = 3-Temp;  else Temp=3+(7-Temp);   
                   Temp2=false;}
               else if (CheckFreq.equals(" Wednesday ")) 
               {  if ( Temp < 4 ) Temp = 4-Temp;  else Temp=4+(7-Temp);   
                   Temp2=false; }
               else if (CheckFreq.equals(" Thursday ")) 
               {  if ( Temp < 5 ) Temp = 5-Temp;  else Temp=5+(7-Temp);   
                   Temp2=false; }
               else if (CheckFreq.equals(" Friday ")) 
               {  if ( Temp < 6 ) Temp = 6-Temp;  else Temp=6+(7-Temp);   
                    Temp2=false;  }
               else if (CheckFreq.equals(" Saturday ")) 
               {  if ( Temp < 7 ) Temp = 7-Temp;  else Temp=7+(7-Temp);   
                    Temp2=false; }
               CalRep.add(CalRep.DATE,Temp);  
               int CalYear =CalRep.get(CalRep.YEAR);
               int CalMonth = CalRep.get(CalRep.MONTH)+1;
               int CalDay = CalRep.get(CalRep.DATE);
               //out.println(count);
               CalRep.add(CalRep.DATE,count-1);
                int CalYeartemp2 =CalRep.get(CalRep.YEAR);
               int CalMonthtemp2 = CalRep.get(CalRep.MONTH)+1;
               int CalDaytemp2  = CalRep.get(CalRep.DATE);
               int CalYeartemp1 = CalYear;
               int CalMonthtemp1 = CalMonth;
               int CalDaytemp1 = CalDay;
               int CalYear1 = 0;
               int  CalMonth1 = 0;
               int  CalDay1 = 0;
                int CalYear2 = 0;
               int  CalMonth2 = 0;
               int  CalDay2 = 0;
                boolean checksure = true;
               boolean checksure2 = true;
               boolean cok = false;
               for (int i = 1;i<= count1; i++)
                 {   CalYear1 = CalYeartemp1;
                      CalMonth1 = CalMonthtemp1;
                      CalDay1 = CalDaytemp1; 
                      CalYear2 = CalYeartemp2;
                      CalMonth2 = CalMonthtemp2;
                      CalDay2 = CalDaytemp2; 
                 	if  ((tempDay ==0) && (tempMonth ==0) && (tempYear==0))
                 	 { tempDay = CalDay;
                         tempMonth = CalMonth;
                         tempYear = CalYear;
                          }//if
                       else { CalRep = new GregorianCalendar(tempYear,tempMonth-1,tempDay);
                                     CalRep.add(CalRep.DATE,1);   
                                     CalYear =CalRep.get(CalRep.YEAR);
                                     CalMonth = CalRep.get(CalRep.MONTH)+1;
                                     CalDay = CalRep.get(CalRep.DATE);  
                                      tempYear = CalYear;
                                      tempMonth = CalMonth;
                                      tempDay = CalDay;
                                 }    
              /*--------------------------------------------------------------------------Rep Event---------------------------------------------------------------*/
              
               checksure = true;
               checksure2 = true;
               cok = false;
               if  (   ( RepFYearcal == RepFYear)  &&  (RepFMonthcal == RepFMonth) && (RepFDatecal == RepFDate)  )
                     checksure = false;
               if (CalYear <   RepFYear) checksure2 = true;
              if (CalYear >   RepFYear) checksure2 = false;
               else  if ( (CalYear ==  RepFYear)  && (CalMonth <   RepFMonth)) checksure2 = true;
                          else if  ( (CalYear ==  RepFYear)  && (CalMonth ==   RepFMonth) &&(CalDay <=   RepFDate) ) checksure2 = true;
                                   else checksure2 = false;
                                    CalRep = new GregorianCalendar(CalYear,CalMonth-1,CalDay);
                                   Calendar  CalRep1 = new GregorianCalendar(CalYear1,CalMonth1-1,CalDay1);
                                    Calendar CalRep2 = new GregorianCalendar(CalYear2,CalMonth2-1,CalDay2);
                                    while ( (!cok)  && (checksure)&& ( !Temp2) && (checksure2)  )
                   { 
                   	 if (CalRep.equals(CalRep1)) 
                   	     {  try{       Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                                       "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,safe_mode,no_rep,no_rem,no_group,freq_rep)"
                                                           + "values( no_cal.nextval,to_date('"+CalDay1+"/" +CalMonth1+"/"+CalYear1+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+CalDay2+"/"+CalMonth2+"/"+CalYear2+ " "+ EventEndHour+":"+EventEndMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +EventTitle+"','"+EventType+"','"+EventPlace+"','"+EventNote+"','"+EventSharing+"','"+No_rep+"','"+No_rem+"',1,to_date('"+CalDay+"/" +CalMonth+"/"+CalYear+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                  }   catch (Exception e)   
                                               { res.setContentType("text/html");
                                                   out.println(e.getMessage()); } 
                            }//if
                         else  if (CalRep.equals(CalRep2))
                            {   try{       Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                                       "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,safe_mode,no_rep,no_rem,no_group,freq_rep)"
                                                           + "values( no_cal.nextval,to_date('"+CalDay1+"/" +CalMonth1+"/"+CalYear1+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+CalDay2+"/"+CalMonth2+"/"+CalYear2+ " "+ EventEndHour+":"+EventEndMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +EventTitle+"','"+EventType+"','"+EventPlace+"','"+EventNote+"','"+EventSharing+"','"+No_rep+"','"+No_rem+"',1,to_date('"+CalDay+"/" +CalMonth+"/"+CalYear+"  "
                                                           +EventHour+":"+EventMin+"','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                  }   catch (Exception e)   
                                               { res.setContentType("text/html");
                                                   out.println(e.getMessage()); } 
                            }//if
                           else   if (CalRep.after(CalRep1))
                                          {   try{       Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                                       "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,safe_mode,no_rep,no_rem,no_group,freq_rep)"
                                                           + "values( no_cal.nextval,to_date('"+CalDay1+"/" +CalMonth1+"/"+CalYear1+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+CalDay2+"/"+CalMonth2+"/"+CalYear2+ " "+ EventEndHour+":"+EventEndMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +EventTitle+"','"+EventType+"','"+EventPlace+"','"+EventNote+"','"+EventSharing+"','"+No_rep+"','"+No_rem+"',1,to_date('"+CalDay+"/" +CalMonth+"/"+CalYear+"  "
                                                           +"00:00','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                                       }   catch (Exception e)   
                                                      { res.setContentType("text/html");
                                                   out.println(e.getMessage()); } 
                                           }//if
                                   
                            /*-----------------------------------------------------------add rep--------------------------------------------------*/
                                CalRep = new GregorianCalendar(CalYear,CalMonth-1,CalDay);
                                 CalRep.add(CalRep.DATE,7);          
                                    CalYear =CalRep.get(CalRep.YEAR);
                                    CalMonth = CalRep.get(CalRep.MONTH)+1;
                                    CalDay = CalRep.get(CalRep.DATE);   
                                    RepFYearcal = CalYear;
                                    RepFMonthcal = CalMonth;
                                   RepFDatecal  = CalDay;
                                   /*-----------------------------------------------------add event------------------------------------------------------*/
                                    CalRep1 = new GregorianCalendar(CalYear1,CalMonth1-1,CalDay1);
                                    CalRep1.add(CalRep1.DATE,7);          
                                    CalYear1 =CalRep1.get(CalRep1.YEAR);
                                    CalMonth1 = CalRep1.get(CalRep1.MONTH)+1;
                                    CalDay1 = CalRep1.get(CalRep1.DATE);   
                                   
                                   /*-----------------------------------------------------add endevent-----------------------------------------------*/
                                    CalRep2 = new GregorianCalendar(CalYear2,CalMonth2-1,CalDay2);
                                    CalRep2.add(CalRep2.DATE,7);          
                                    CalYear2 =CalRep2.get(CalRep2.YEAR);
                                    CalMonth2 = CalRep2.get(CalRep2.MONTH)+1;
                                    CalDay2 = CalRep2.get(CalRep2.DATE);   
                        
                           if  ( RepFYearcal >  RepFYear) cok = true;
                            else  if  ( RepFYearcal <  RepFYear) cok = false; 
                                   else if  ( ( RepFYearcal ==  RepFYear)  && (RepFMonthcal < RepFMonth))  cok = false;
                                             else  if(( RepFYearcal ==  RepFYear) && (RepFMonthcal == RepFMonth)&& (RepFDatecal <= RepFDate))  cok =false;
                                                          else cok = true;
                                    }       //while
                          }//for
             CalRep = new GregorianCalendar(EventYear,EventMonth-1,EventDay,EventHour,EventMin);
                if (CheckFreq.equals(" Day "))       
                    {  CalRep.add(CalRep.DATE,1);   
                         CalYear =CalRep.get(CalRep.YEAR);
                         CalMonth = CalRep.get(CalRep.MONTH)+1;
                         CalDay = CalRep.get(CalRep.DATE);
                         CalRep.add(CalRep.DATE,count-1);
               CalYeartemp2 =CalRep.get(CalRep.YEAR);
                CalMonthtemp2 = CalRep.get(CalRep.MONTH)+1;
                CalDaytemp2  = CalRep.get(CalRep.DATE);
                CalYeartemp1 = CalYear;
                CalMonthtemp1 = CalMonth;
                CalDaytemp1 = CalDay;
                CalYear1 = 0;
                 CalMonth1 = 0;
                 CalDay1 = 0;
                CalYear2 = 0;
                 CalMonth2 = 0;
                 CalDay2 = 0;
                 tempDay = 0;
                 tempMonth = 0;
                 tempYear = 0;
                  for (int i = 1;i<= count1; i++)
                 {   CalYear1 = CalYeartemp1;
                      CalMonth1 = CalMonthtemp1;
                      CalDay1 = CalDaytemp1; 
                      CalYear2 = CalYeartemp2;
                      CalMonth2 = CalMonthtemp2;
                      CalDay2 = CalDaytemp2; 
                 	if  ((tempDay ==0) && (tempMonth ==0) && (tempYear==0))
                 	 { tempDay = CalDay;
                         tempMonth = CalMonth;
                         tempYear = CalYear;
                          }//if
                       else { CalRep = new GregorianCalendar(tempYear,tempMonth-1,tempDay);
                                     CalRep.add(CalRep.DATE,1);   
                                     CalYear =CalRep.get(CalRep.YEAR);
                                     CalMonth = CalRep.get(CalRep.MONTH)+1;
                                     CalDay = CalRep.get(CalRep.DATE);  
                                      tempYear = CalYear;
                                      tempMonth = CalMonth;
                                      tempDay = CalDay;
                                 }    
                              cok = false;   
                              checksure2 = false;
                                if (CalYear <   RepFYear) checksure2 = true;
                              if (CalYear >   RepFYear) checksure2 = false;
               else  if ( (CalYear ==  RepFYear)  && (CalMonth <   RepFMonth)) checksure2 = true;
                          else if  ( (CalYear ==  RepFYear)  && (CalMonth ==   RepFMonth) &&(CalDay <=   RepFDate) ) checksure2 = true;
                                   else checksure2 = false;
                                   CalRep = new GregorianCalendar(CalYear,CalMonth-1,CalDay);
                                   Calendar  CalRep1 = new GregorianCalendar(CalYear1,CalMonth1-1,CalDay1);
                                    Calendar CalRep2 = new GregorianCalendar(CalYear2,CalMonth2-1,CalDay2);    
                             while ((!cok)  && (checksure)&& (checksure2))
                   {    if  (CalRep.equals(CalRep1))
                   	     {  try{       Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                                       "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,safe_mode,no_rep,no_rem,no_group,freq_rep)"
                                                           + "values( no_cal.nextval,to_date('"+CalDay1+"/" +CalMonth1+"/"+CalYear1+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+CalDay2+"/"+CalMonth2+"/"+CalYear2+ " "+ EventEndHour+":"+EventEndMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +EventTitle+"','"+EventType+"','"+EventPlace+"','"+EventNote+"','"+EventSharing+"','"+No_rep+"','"+No_rem+"',1,to_date('"+CalDay+"/" +CalMonth+"/"+CalYear+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                  }   catch (Exception e)   
                                               { res.setContentType("text/html");
                                                   out.println(e.getMessage()); } 
                            }//if
                            else  if (CalRep.equals(CalRep2))
                            {   try{       Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                                       "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,safe_mode,no_rep,no_rem,no_group,freq_rep)"
                                                           + "values( no_cal.nextval,to_date('"+CalDay1+"/" +CalMonth1+"/"+CalYear1+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+CalDay2+"/"+CalMonth2+"/"+CalYear2+ " "+ EventEndHour+":"+EventEndMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +EventTitle+"','"+EventType+"','"+EventPlace+"','"+EventNote+"','"+EventSharing+"','"+No_rep+"','"+No_rem+"',1,to_date('"+CalDay+"/" +CalMonth+"/"+CalYear+"  "
                                                           +EventHour+":"+EventMin+"','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                  }   catch (Exception e)   
                                               { res.setContentType("text/html");
                                                   out.println(e.getMessage()); } 
                            }//if
                           else   if (CalRep.after(CalRep1))
                                          {   try{       Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                                       "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,safe_mode,no_rep,no_rem,no_group,freq_rep)"
                                                           + "values( no_cal.nextval,to_date('"+CalDay1+"/" +CalMonth1+"/"+CalYear1+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+CalDay2+"/"+CalMonth2+"/"+CalYear2+ " "+ EventEndHour+":"+EventEndMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +EventTitle+"','"+EventType+"','"+EventPlace+"','"+EventNote+"','"+EventSharing+"','"+No_rep+"','"+No_rem+"',1,to_date('"+CalDay+"/" +CalMonth+"/"+CalYear+"  "
                                                           +"00:00','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                                       }   catch (Exception e)   
                                                      { res.setContentType("text/html");
                                                   out.println(e.getMessage()); } 
                                           }//if
                             CalRep = new GregorianCalendar(CalYear,CalMonth-1,CalDay);
                             CalRep.add(CalRep.DATE,1);          
                                    CalYear =CalRep.get(CalRep.YEAR);
                                    CalMonth = CalRep.get(CalRep.MONTH)+1;
                                    CalDay = CalRep.get(CalRep.DATE);   
                                    RepFYearcal = CalYear;
                                    RepFMonthcal = CalMonth;
                                   RepFDatecal  = CalDay;
                                
                                    /*-----------------------------------------------------add event------------------------------------------------------*/
                                    CalRep1 = new GregorianCalendar(CalYear1,CalMonth1-1,CalDay1);
                                    CalRep1.add(CalRep1.DATE,1);          
                                    CalYear1 =CalRep1.get(CalRep1.YEAR);
                                    CalMonth1 = CalRep1.get(CalRep1.MONTH)+1;
                                    CalDay1 = CalRep1.get(CalRep1.DATE);   
                                   
                                   /*-----------------------------------------------------add endevent-----------------------------------------------*/
                                  CalRep2 = new GregorianCalendar(CalYear2,CalMonth2-1,CalDay2);
                                    CalRep2.add(CalRep2.DATE,1);          
                                    CalYear2 =CalRep2.get(CalRep2.YEAR);
                                    CalMonth2 = CalRep2.get(CalRep2.MONTH)+1;
                                    CalDay2 = CalRep2.get(CalRep2.DATE);   
                         
                           if  ( RepFYearcal >  RepFYear) cok = true;
                            else  if  ( RepFYearcal <  RepFYear) cok = false; 
                                   else if  ( ( RepFYearcal ==  RepFYear)  && (RepFMonthcal < RepFMonth))  cok = false;
                                             else  if(( RepFYearcal ==  RepFYear) && (RepFMonthcal == RepFMonth)&& (RepFDatecal <= RepFDate))  cok =false;
                                                          else cok = true;
                                    }       //while            
                    }//if Day
              }//for
           CalRep = new GregorianCalendar(EventYear,EventMonth-1,EventDay,EventHour,EventMin);
                if (CheckFreq.equals(" Week "))       
                    {  CalRep.add(CalRep.DATE,7);   
                         CalYear =CalRep.get(CalRep.YEAR);
                         CalMonth = CalRep.get(CalRep.MONTH)+1;
                         CalDay = CalRep.get(CalRep.DATE);
                 CalRep.add(CalRep.DATE,count-1);
                CalYeartemp2 =CalRep.get(CalRep.YEAR);
                CalMonthtemp2 = CalRep.get(CalRep.MONTH)+1;
                CalDaytemp2  = CalRep.get(CalRep.DATE);
                CalYeartemp1 = CalYear;
                CalMonthtemp1 = CalMonth;
                CalDaytemp1 = CalDay;
                CalYear1 = 0;
                 CalMonth1 = 0;
                 CalDay1 = 0;
                CalYear2 = 0;
                 CalMonth2 = 0;
                 CalDay2 = 0;
                 tempDay = 0;
                 tempMonth = 0;
                 tempYear = 0;
                  for (int i = 1;i<= count1; i++)
                 {   CalYear1 = CalYeartemp1;
                      CalMonth1 = CalMonthtemp1;
                      CalDay1 = CalDaytemp1; 
                      CalYear2 = CalYeartemp2;
                      CalMonth2 = CalMonthtemp2;
                      CalDay2 = CalDaytemp2; 
                 	if  ((tempDay ==0) && (tempMonth ==0) && (tempYear==0))
                 	 { tempDay = CalDay;
                         tempMonth = CalMonth;
                         tempYear = CalYear;
                          }//if
                       else { CalRep = new GregorianCalendar(tempYear,tempMonth-1,tempDay);
                                     CalRep.add(CalRep.DATE,1);   
                                     CalYear =CalRep.get(CalRep.YEAR);
                                     CalMonth = CalRep.get(CalRep.MONTH)+1;
                                     CalDay = CalRep.get(CalRep.DATE);  
                                      tempYear = CalYear;
                                      tempMonth = CalMonth;
                                      tempDay = CalDay;
                                 }    
                              cok = false;   
                              checksure2 =true;
                                 if (CalYear <   RepFYear) checksure2 = true;
                                if (CalYear >   RepFYear) checksure2 = false;
               else  if ( (CalYear ==  RepFYear)  && (CalMonth <   RepFMonth)) checksure2 = true;
                          else if  ( (CalYear ==  RepFYear)  && (CalMonth ==   RepFMonth) &&(CalDay  <=   RepFDate) ) checksure2 = true;
                                   else checksure2 =false;    
                                     CalRep = new GregorianCalendar(CalYear,CalMonth-1,CalDay);
                                   Calendar  CalRep1 = new GregorianCalendar(CalYear1,CalMonth1-1,CalDay1);
                                    Calendar CalRep2 = new GregorianCalendar(CalYear2,CalMonth2-1,CalDay2);  
                             while ((!cok)  && (checksure) &&(checksure2) )
                   {     if ( CalRep.equals(CalRep1)) 
                   	     {  try{       Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                                       "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,safe_mode,no_rep,no_rem,no_group,freq_rep)"
                                                           + "values( no_cal.nextval,to_date('"+CalDay1+"/" +CalMonth1+"/"+CalYear1+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+CalDay2+"/"+CalMonth2+"/"+CalYear2+ " "+ EventEndHour+":"+EventEndMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +EventTitle+"','"+EventType+"','"+EventPlace+"','"+EventNote+"','"+EventSharing+"','"+No_rep+"','"+No_rem+"',1,to_date('"+CalDay+"/" +CalMonth+"/"+CalYear+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                  }   catch (Exception e)   
                                               { res.setContentType("text/html");
                                                   out.println(e.getMessage()); } 
                            }//if
                             else  if (CalRep.equals(CalRep2))
                            {   try{       Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                                       "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,safe_mode,no_rep,no_rem,no_group,freq_rep)"
                                                           + "values( no_cal.nextval,to_date('"+CalDay1+"/" +CalMonth1+"/"+CalYear1+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+CalDay2+"/"+CalMonth2+"/"+CalYear2+ " "+ EventEndHour+":"+EventEndMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +EventTitle+"','"+EventType+"','"+EventPlace+"','"+EventNote+"','"+EventSharing+"','"+No_rep+"','"+No_rem+"',1,to_date('"+CalDay+"/" +CalMonth+"/"+CalYear+"  "
                                                           +EventHour+":"+EventMin+"','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                  }   catch (Exception e)   
                                               { res.setContentType("text/html");
                                                   out.println(e.getMessage()); } 
                            }//if
                           else   if (CalRep.after(CalRep1))
                                          {   try{       Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                                       "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,safe_mode,no_rep,no_rem,no_group,freq_rep)"
                                                           + "values( no_cal.nextval,to_date('"+CalDay1+"/" +CalMonth1+"/"+CalYear1+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+CalDay2+"/"+CalMonth2+"/"+CalYear2+ " "+ EventEndHour+":"+EventEndMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +EventTitle+"','"+EventType+"','"+EventPlace+"','"+EventNote+"','"+EventSharing+"','"+No_rep+"','"+No_rem+"',1,to_date('"+CalDay+"/" +CalMonth+"/"+CalYear+"  "
                                                           +"00:00','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                                       }   catch (Exception e)   
                                                      { res.setContentType("text/html");
                                                   out.println(e.getMessage()); } 
                                           }//if
                             CalRep = new GregorianCalendar(CalYear,CalMonth-1,CalDay);
                             CalRep.add(CalRep.DATE,7);          
                                    CalYear =CalRep.get(CalRep.YEAR);
                                    CalMonth = CalRep.get(CalRep.MONTH)+1;
                                    CalDay = CalRep.get(CalRep.DATE);   
                                    RepFYearcal = CalYear;
                                    RepFMonthcal = CalMonth;
                                   RepFDatecal  = CalDay;
                             /*-----------------------------------------------------add event------------------------------------------------------*/
                                    CalRep1 = new GregorianCalendar(CalYear1,CalMonth1-1,CalDay1);
                                    CalRep1.add(CalRep1.DATE,7);          
                                    CalYear1 =CalRep1.get(CalRep1.YEAR);
                                    CalMonth1 = CalRep1.get(CalRep1.MONTH)+1;
                                    CalDay1 = CalRep1.get(CalRep1.DATE);   
                                   
                                   /*-----------------------------------------------------add endevent-----------------------------------------------*/
                                    CalRep2 = new GregorianCalendar(CalYear2,CalMonth2-1,CalDay2);
                                    CalRep2.add(CalRep2.DATE,7);          
                                    CalYear2 =CalRep2.get(CalRep2.YEAR);
                                    CalMonth2 = CalRep2.get(CalRep2.MONTH)+1;
                                    CalDay2 = CalRep2.get(CalRep2.DATE);   
                         
                           if  ( RepFYearcal >  RepFYear) cok = true;
                            else  if  ( RepFYearcal <  RepFYear) cok = false; 
                                   else if  ( ( RepFYearcal ==  RepFYear)  && (RepFMonthcal < RepFMonth))  cok = false;
                                             else  if(( RepFYearcal ==  RepFYear) && (RepFMonthcal == RepFMonth)&& (RepFDatecal <= RepFDate))  cok =false;
                                                          else cok = true;
                                    }       //while            
                    }//if Week
               }//for
           CalRep = new GregorianCalendar(EventYear,EventMonth-1,EventDay,EventHour,EventMin);
                if (CheckFreq.equals(" Month "))       
                    {  CalRep.add(CalRep.MONTH,1);   
                         CalYear =CalRep.get(CalRep.YEAR);
                         CalMonth = CalRep.get(CalRep.MONTH)+1;
                         CalDay = CalRep.get(CalRep.DATE);
                CalRep.add(CalRep.DATE,count-1);
                CalYeartemp2 =CalRep.get(CalRep.YEAR);
                CalMonthtemp2 = CalRep.get(CalRep.MONTH)+1;
                CalDaytemp2  = CalRep.get(CalRep.DATE);
                CalYeartemp1 = CalYear;
                CalMonthtemp1 = CalMonth;
                CalDaytemp1 = CalDay;
                CalYear1 = 0;
                 CalMonth1 = 0;
                 CalDay1 = 0;
                CalYear2 = 0;
                 CalMonth2 = 0;
                 CalDay2 = 0;
                 tempDay = 0;
                 tempMonth = 0;
                 tempYear = 0;
                  for (int i = 1;i<= count1; i++)
                 {   CalYear1 = CalYeartemp1;
                      CalMonth1 = CalMonthtemp1;
                      CalDay1 = CalDaytemp1; 
                      CalYear2 = CalYeartemp2;
                      CalMonth2 = CalMonthtemp2;
                      CalDay2 = CalDaytemp2; 
                 	if  ((tempDay ==0) && (tempMonth ==0) && (tempYear==0))
                 	 { tempDay = CalDay;
                         tempMonth = CalMonth;
                         tempYear = CalYear;
                          }//if
                       else { CalRep = new GregorianCalendar(tempYear,tempMonth-1,tempDay);
                                     CalRep.add(CalRep.DATE,1);   
                                     CalYear =CalRep.get(CalRep.YEAR);
                                     CalMonth = CalRep.get(CalRep.MONTH)+1;
                                     CalDay = CalRep.get(CalRep.DATE);  
                                      tempYear = CalYear;
                                      tempMonth = CalMonth;
                                      tempDay = CalDay;
                                 }    
                              cok = false;    
                               checksure2 =true;
                                  if (CalYear <   RepFYear) checksure2 = true;
                                if (CalYear >   RepFYear) checksure2 = false;
               else  if ( (CalYear ==  RepFYear)  && (CalMonth <   RepFMonth)) checksure2 = true;
                          else if  ( (CalYear ==  RepFYear)  && (CalMonth ==   RepFMonth) &&(CalDay <=   RepFDate) ) checksure2 = true;
                                   else checksure2 = false;  
                                    CalRep = new GregorianCalendar(CalYear,CalMonth-1,CalDay);
                                   Calendar  CalRep1 = new GregorianCalendar(CalYear1,CalMonth1-1,CalDay1);
                                    Calendar CalRep2 = new GregorianCalendar(CalYear2,CalMonth2-1,CalDay2);  
                                     while ((!cok)  && (checksure)&& (checksure2))
                   {        if  (CalRep.equals(CalRep1)) 
                   	     {  try{       Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                                       "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,safe_mode,no_rep,no_rem,no_group,freq_rep)"
                                                           + "values( no_cal.nextval,to_date('"+CalDay1+"/" +CalMonth1+"/"+CalYear1+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+CalDay2+"/"+CalMonth2+"/"+CalYear2+ " "+ EventEndHour+":"+EventEndMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +EventTitle+"','"+EventType+"','"+EventPlace+"','"+EventNote+"','"+EventSharing+"','"+No_rep+"','"+No_rem+"',1,to_date('"+CalDay+"/" +CalMonth+"/"+CalYear+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                  }   catch (Exception e)   
                                               { res.setContentType("text/html");
                                                   out.println(e.getMessage()); } 
                            }//if
                             else  if (CalRep.equals(CalRep2))
                            {   try{       Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                                       "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,safe_mode,no_rep,no_rem,no_group,freq_rep)"
                                                           + "values( no_cal.nextval,to_date('"+CalDay1+"/" +CalMonth1+"/"+CalYear1+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+CalDay2+"/"+CalMonth2+"/"+CalYear2+ " "+ EventEndHour+":"+EventEndMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +EventTitle+"','"+EventType+"','"+EventPlace+"','"+EventNote+"','"+EventSharing+"','"+No_rep+"','"+No_rem+"',1,to_date('"+CalDay+"/" +CalMonth+"/"+CalYear+"  "
                                                           +EventHour+":"+EventMin+"','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                  }   catch (Exception e)   
                                               { res.setContentType("text/html");
                                                   out.println(e.getMessage()); } 
                            }//if
                           else   if (CalRep.after(CalRep1))
                                          {   try{       Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                                       "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,safe_mode,no_rep,no_rem,no_group,freq_rep)"
                                                           + "values( no_cal.nextval,to_date('"+CalDay1+"/" +CalMonth1+"/"+CalYear1+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+CalDay2+"/"+CalMonth2+"/"+CalYear2+ " "+ EventEndHour+":"+EventEndMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +EventTitle+"','"+EventType+"','"+EventPlace+"','"+EventNote+"','"+EventSharing+"','"+No_rep+"','"+No_rem+"',1,to_date('"+CalDay+"/" +CalMonth+"/"+CalYear+"  "
                                                           +"00:00','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                                       }   catch (Exception e)   
                                                      { res.setContentType("text/html");
                                                   out.println(e.getMessage()); } 
                                           }//if
                             CalRep = new GregorianCalendar(CalYear,CalMonth-1,CalDay);
                             CalRep.add(CalRep.MONTH,1);          
                                    CalYear =CalRep.get(CalRep.YEAR);
                                    CalMonth = CalRep.get(CalRep.MONTH)+1;
                                    CalDay = CalRep.get(CalRep.DATE);   
                                    RepFYearcal = CalYear;
                                    RepFMonthcal = CalMonth;
                                   RepFDatecal  = CalDay;
                                    /*-----------------------------------------------------add event------------------------------------------------------*/
                                    CalRep1 = new GregorianCalendar(CalYear1,CalMonth1-1,CalDay1);
                                    CalRep1.add(CalRep1.MONTH,1);        
                                    CalYear1 =CalRep1.get(CalRep1.YEAR);
                                    CalMonth1 = CalRep1.get(CalRep1.MONTH)+1;
                                    CalDay1 = CalRep1.get(CalRep1.DATE);   
                                   
                                   /*-----------------------------------------------------add endevent-----------------------------------------------*/
                                    CalRep2 = new GregorianCalendar(CalYear2,CalMonth2-1,CalDay2);
                                    CalRep2.add(CalRep2.MONTH,1);            
                                    CalYear2 =CalRep2.get(CalRep2.YEAR);
                                    CalMonth2 = CalRep2.get(CalRep2.MONTH)+1;
                                    CalDay2 = CalRep2.get(CalRep2.DATE);   
                         
                           if  ( RepFYearcal >  RepFYear) cok = true;
                            else  if  ( RepFYearcal <  RepFYear) cok = false; 
                                   else if  ( ( RepFYearcal ==  RepFYear)  && (RepFMonthcal < RepFMonth))  cok = false;
                                             else  if(( RepFYearcal ==  RepFYear) && (RepFMonthcal == RepFMonth)&& (RepFDatecal<= RepFDate))  cok =false;
                                                          else cok = true;
                                    }       //while            
                    }//if Month
                 }//for
                    CalRep = new GregorianCalendar(EventYear,EventMonth-1,EventDay,EventHour,EventMin);
                if (CheckFreq.equals(" Year "))       
                    {  CalRep.add(CalRep.YEAR,1);   
                         CalYear =CalRep.get(CalRep.YEAR);
                         CalMonth = CalRep.get(CalRep.MONTH)+1;
                         CalDay = CalRep.get(CalRep.DATE);
                   CalRep.add(CalRep.DATE,count-1);
                CalYeartemp2 =CalRep.get(CalRep.YEAR);
                CalMonthtemp2 = CalRep.get(CalRep.MONTH)+1;
                CalDaytemp2  = CalRep.get(CalRep.DATE);
                CalYeartemp1 = CalYear;
                CalMonthtemp1 = CalMonth;
                CalDaytemp1 = CalDay;
                CalYear1 = 0;
                 CalMonth1 = 0;
                 CalDay1 = 0;
                CalYear2 = 0;
                 CalMonth2 = 0;
                 CalDay2 = 0;
                 tempDay = 0;
                 tempMonth = 0;
                 tempYear = 0;
                  for (int i = 1;i<= count1; i++)
                 {   CalYear1 = CalYeartemp1;
                      CalMonth1 = CalMonthtemp1;
                      CalDay1 = CalDaytemp1; 
                      CalYear2 = CalYeartemp2;
                      CalMonth2 = CalMonthtemp2;
                      CalDay2 = CalDaytemp2; 
                 	if  ((tempDay ==0) && (tempMonth ==0) && (tempYear==0))
                 	 { tempDay = CalDay;
                         tempMonth = CalMonth;
                         tempYear = CalYear;
                          }//if
                       else { CalRep = new GregorianCalendar(tempYear,tempMonth-1,tempDay);
                                     CalRep.add(CalRep.DATE,1);   
                                     CalYear =CalRep.get(CalRep.YEAR);
                                     CalMonth = CalRep.get(CalRep.MONTH)+1;
                                     CalDay = CalRep.get(CalRep.DATE);  
                                      tempYear = CalYear;
                                      tempMonth = CalMonth;
                                      tempDay = CalDay;
                                 }    
                              cok = false;  
                               checksure2 =true;     
                                  if (CalYear <   RepFYear) checksure2 = true;
                                if (CalYear >   RepFYear) checksure2 = false;
                               else  if ( (CalYear ==  RepFYear)  && (CalMonth <   RepFMonth)) checksure2 = true;
                          else if  ( (CalYear ==  RepFYear)  && (CalMonth ==   RepFMonth) &&(CalDay <=   RepFDate) ) checksure2 = true;
                                   else checksure2 = false;
                                    CalRep = new GregorianCalendar(CalYear,CalMonth-1,CalDay);
                                   Calendar  CalRep1 = new GregorianCalendar(CalYear1,CalMonth1-1,CalDay1);
                                    Calendar CalRep2 = new GregorianCalendar(CalYear2,CalMonth2-1,CalDay2);  
                                    while ((!cok)  && (checksure) &&(checksure2) )
                   {       if  (CalRep.equals(CalRep1))
                   	     {  try{       Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                                       "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,safe_mode,no_rep,no_rem,no_group,freq_rep)"
                                                           + "values( no_cal.nextval,to_date('"+CalDay1+"/" +CalMonth1+"/"+CalYear1+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+CalDay2+"/"+CalMonth2+"/"+CalYear2+ " "+ EventEndHour+":"+EventEndMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +EventTitle+"','"+EventType+"','"+EventPlace+"','"+EventNote+"','"+EventSharing+"','"+No_rep+"','"+No_rem+"',1,to_date('"+CalDay+"/" +CalMonth+"/"+CalYear+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                  }   catch (Exception e)   
                                               { res.setContentType("text/html");
                                                   out.println(e.getMessage()); } 
                            }//if
                             else  if (CalRep.equals(CalRep2))
                            {   try{       Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                                       "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,safe_mode,no_rep,no_rem,no_group,freq_rep)"
                                                           + "values( no_cal.nextval,to_date('"+CalDay1+"/" +CalMonth1+"/"+CalYear1+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+CalDay2+"/"+CalMonth2+"/"+CalYear2+ " "+ EventEndHour+":"+EventEndMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +EventTitle+"','"+EventType+"','"+EventPlace+"','"+EventNote+"','"+EventSharing+"','"+No_rep+"','"+No_rem+"',1,to_date('"+CalDay+"/" +CalMonth+"/"+CalYear+"  "
                                                           +EventHour+":"+EventMin+"','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                  }   catch (Exception e)   
                                               { res.setContentType("text/html");
                                                   out.println(e.getMessage()); } 
                            }//if
                           else   if (CalRep.after(CalRep1))
                                          {   try{       Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                                       "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,safe_mode,no_rep,no_rem,no_group,freq_rep)"
                                                           + "values( no_cal.nextval,to_date('"+CalDay1+"/" +CalMonth1+"/"+CalYear1+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+CalDay2+"/"+CalMonth2+"/"+CalYear2+ " "+ EventEndHour+":"+EventEndMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +EventTitle+"','"+EventType+"','"+EventPlace+"','"+EventNote+"','"+EventSharing+"','"+No_rep+"','"+No_rem+"',1,to_date('"+CalDay+"/" +CalMonth+"/"+CalYear+"  "
                                                           +"00:00','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                                       }   catch (Exception e)   
                                                      { res.setContentType("text/html");
                                                   out.println(e.getMessage()); } 
                                           }//if
                             CalRep = new GregorianCalendar(CalYear,CalMonth-1,CalDay);
                             CalRep.add(CalRep.YEAR,1);          
                                    CalYear =CalRep.get(CalRep.YEAR);
                                    CalMonth = CalRep.get(CalRep.MONTH)+1;
                                    CalDay = CalRep.get(CalRep.DATE);   
                                    RepFYearcal = CalYear;
                                    RepFMonthcal = CalMonth;
                                   RepFDatecal  = CalDay;
                                   
                                   /*-----------------------------------------------------add event------------------------------------------------------*/
                                    CalRep1 = new GregorianCalendar(CalYear1,CalMonth1-1,CalDay1);
                                    CalRep1.add(CalRep1.YEAR,1);        
                                    CalYear1 =CalRep1.get(CalRep1.YEAR);
                                    CalMonth1 = CalRep1.get(CalRep1.MONTH)+1;
                                    CalDay1 = CalRep1.get(CalRep1.DATE);   
                                   
                                   /*-----------------------------------------------------add endevent-----------------------------------------------*/
                                    CalRep2 = new GregorianCalendar(CalYear2,CalMonth2-1,CalDay2);
                                    CalRep2.add(CalRep2.YEAR,1);     
                                    CalYear2 =CalRep2.get(CalRep2.YEAR);
                                    CalMonth2 = CalRep2.get(CalRep2.MONTH)+1;
                                    CalDay2 = CalRep2.get(CalRep2.DATE);   
                         
                           if  ( RepFYearcal >  RepFYear) cok = true;
                            else  if  ( RepFYearcal <  RepFYear) cok = false; 
                                   else if  ( ( RepFYearcal ==  RepFYear)  && (RepFMonthcal < RepFMonth))  cok = false;
                                             else  if(( RepFYearcal ==  RepFYear) && (RepFMonthcal == RepFMonth)&& (RepFDatecal <= RepFDate))  cok =false;
                                                          else cok = true;
                                    }       //while            
                    }//if Year
           }//for
                  }	 //if No_rep     
             
                   if( (No_rem > 1 ) && (No_rep >1))
                {
                int no_countrem = 0 ;
                try{  
                               Statement  theStatement=theConnection.createStatement();
                               ResultSet theResult =     theStatement.executeQuery(
                               "select count(*) from calendar where no_rep ="+No_rep+" and  freq_rep >  to_date('"+newDay+"/" +newMonth+"/"+newYear+"  "
                                                           +newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')");
                               while (theResult.next() )
                               { no_countrem = theResult.getInt(1) ;}
                            theResult.close();
                           theStatement.close();
                      }   catch (Exception e)   
                                               {  res.setContentType("text/html");
                                                   //PrintWriter out = res.getWriter();
                                                   out.println(e.getMessage()); }   
                int no = 0;      
                int RemDaycal = 0;
                int RemMonthcal  = 0;
                int RemYearcal = 0;
                int RemHourcal = 0;
                int RemMincal  = 0;
                int FbeforeDay = 0;
                int FbeforeMonth = 0;
                int FbeforeYear = 0;
                int FbeforeHour = 0;
                int FbeforeMin = 0;
                 int Fbefore2Day = 0;
                int Fbefore2Month = 0;
                int Fbefore2Year = 0;
                int Fbefore2Hour = 0;
                int Fbefore2Min = 0;
                Calendar RemCalendar = new GregorianCalendar();
                Calendar RemCalendar2 = new GregorianCalendar();           
                for ( int  i=1; i<= no_countrem; i++)
                { //boolean  checki = true;
                   boolean checkrem = false;
                    try{      Statement  theStatement=theConnection.createStatement();
                               ResultSet theResult =     theStatement.executeQuery(
                               "select time,no_cal  from calendar where no_cal in (select min(no_cal)  from calendar  group by time,to_time) and no_rep = "+No_rep+
                               "and freq_rep > to_date('"+newDay+"/" +newMonth+"/"+newYear+"  "
                                                           +newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')" );
                              while(theResult.next() && (!checkrem) ) 
                               {    if (no <  theResult.getInt(2))  
                                  {  no = theResult.getInt(2);
                                   RemCalendar.setTime(theResult.getDate(1));
                                 RemDaycal = RemCalendar.get(RemCalendar.DATE);
                                 RemMonthcal = RemCalendar.get(RemCalendar.MONTH)+1;
                                 RemYearcal  = RemCalendar.get(RemCalendar.YEAR);
                                 RemCalendar.setTime(theResult.getTime(1));
                                 RemHourcal = RemCalendar.get(RemCalendar.HOUR_OF_DAY);
                                 RemMincal  = RemCalendar.get(RemCalendar.MINUTE);
                                 if  ((RemindWeek > 0) || (RemindDay > 0) || (RemindHour >0) || (RemindMin >0))
                                 {RemCalendar = new GregorianCalendar(RemYearcal,RemMonthcal-1,RemDaycal,RemHourcal ,RemMincal);
                                  RemCalendar.add(RemCalendar.DATE,-(RemindWeek*7));//Add Week
                                  RemCalendar.add(RemCalendar.DATE,-(RemindDay));
                                  RemCalendar.add(RemCalendar.HOUR_OF_DAY,-(RemindHour));
                                  RemCalendar.add(RemCalendar.MINUTE,-(RemindMin)); 
                                    FbeforeDay = RemCalendar.get(RemCalendar.DAY_OF_MONTH);
                                    FbeforeMonth = RemCalendar.get(RemCalendar.MONTH)+1;
                                    FbeforeYear = RemCalendar.get(RemCalendar.YEAR);
                                    FbeforeHour = RemCalendar.get(RemCalendar.HOUR_OF_DAY);
                                    FbeforeMin = RemCalendar.get(RemCalendar.MINUTE);    }
                                  if (RemindBefore > 0)
                                 { RemCalendar2 = new GregorianCalendar(RemYearcal,RemMonthcal-1,RemDaycal,RemHourcal ,RemMincal);
                                   RemCalendar2.add(RemCalendar2.MINUTE,-(RemindBefore));  
                                   Fbefore2Day = RemCalendar2.get(RemCalendar2.DAY_OF_MONTH);
                                  Fbefore2Month = RemCalendar2.get(RemCalendar2.MONTH)+1;
                                 Fbefore2Year = RemCalendar2.get(RemCalendar2.YEAR);
                                 Fbefore2Hour = RemCalendar2.get(RemCalendar2.HOUR_OF_DAY);
                                 Fbefore2Min = RemCalendar2.get(RemCalendar2.MINUTE);   }
                                  if ( ((RemindWeek > 0) || (RemindDay > 0) || (RemindHour >0) || (RemindMin >0)) && (RemindBefore > 0) )
                                {    try{   theStatement.executeQuery(
                                                       "INSERT INTO remind"
                                                       +"(no_rem,id,freq_before,freq_and, PagMob,PagMobnum,password,email,message,sender,root,no_cal)"
                                                       + "values(no_rem.nextval,' "+UserID+"',to_date(' "+FbeforeDay+"/"+FbeforeMonth+"/"+FbeforeYear
                                                       +" "+FbeforeHour+":" +FbeforeMin+"','dd/mm/yyyy hh24:mi'),to_date('"+Fbefore2Day+"/"+Fbefore2Month+"/"+Fbefore2Year+" "
                                                       +Fbefore2Hour+":"+Fbefore2Min+
                                                       "','dd/mm/yyyy hh24:mi'),'"
                                                       +RemindPagerType+"','"+RemindPNum+"','"+RemindPPw+"','"+RemindEmailAdd+"','" + RemindMessage+"','"+RemindFrom+"',"+No_rem+","+no+")");
                           // theStatement.close();
                     }   catch (Exception e)   
                                               { //res.setContentType("text/html");
                                                   //PrintWriter out = res.getWriter();
                                                   out.println(e.getMessage()); }     
             }//if
             else if     ( ((RemindWeek > 0) || (RemindDay > 0) || (RemindHour >0) || (RemindMin >0)) && (RemindBefore == 0) )
                        {  try{   theStatement.executeQuery(
                                                       "INSERT INTO remind"
                                                       +"(no_rem,id,freq_before,PagMob,PagMobnum,password,email,message,sender,root,no_cal)"
                                                       + "values(no_rem.nextval,' "+UserID+"',to_date(' "+FbeforeDay+"/"+FbeforeMonth+"/"+FbeforeYear
                                                       +" "+FbeforeHour+":" +FbeforeMin+"','dd/mm/yyyy hh24:mi'),'"
                                                       +RemindPagerType+"','"+RemindPNum+"','"+RemindPPw+"','"+RemindEmailAdd+"','" + RemindMessage+"','"+RemindFrom+"',"+No_rem+","+no+")");
                          //  theStatement.close();
                     }   catch (Exception e)   
                                               { //res.setContentType("text/html");
                                                   //PrintWriter out = res.getWriter();
                                                   out.println(e.getMessage()); }     
                        }//if
                        else if  ( ((RemindWeek == 0) && (RemindDay == 0) && (RemindHour ==0) && (RemindMin ==0)) && (RemindBefore > 0) )
                        {  try{       theStatement.executeQuery(
                                                       "INSERT INTO remind"
                                                       +"(no_rem,id,freq_and, PagMob,PagMobnum,password,email,message,sender,root,no_cal)"
                                                       + "values(no_rem.nextval,' "+UserID+"',to_date('"+Fbefore2Day+"/"+Fbefore2Month+"/"+Fbefore2Year+" "
                                                       +Fbefore2Hour+":"+Fbefore2Min+
                                                       "','dd/mm/yyyy hh24:mi'),'"
                                                       +RemindPagerType+"','"+RemindPNum+"','"+RemindPPw+"','"+RemindEmailAdd+"','" + RemindMessage+"','"+RemindFrom+"',"+No_rem+","+no+")");
                           // theStatement.close();
                     }   catch (Exception e)   
                                               { //res.setContentType("text/html");
                                                   //PrintWriter out = res.getWriter();
                                                   out.println(e.getMessage()); }     
                            }//if   
                             checkrem = true;
                          }//if   
                        }//while
                           theStatement.close();
                           theResult.close();
                     }   catch (Exception e)   
                                               { //res.setContentType("text/html");
                                                   //PrintWriter out = res.getWriter();
                                                   out.println(e.getMessage()); }     
                         }//for
                      }//No_rem
                    }//if Update
               }//if Check
               
               Calendar CalTemp = new GregorianCalendar();
               Calendar CalTemp2 = new GregorianCalendar();
               Calendar CalTemp3 = new GregorianCalendar();
                if  ((Deleteall != null ) ||  (Deletesome != null ))    {  
                	                                              int newDay = 0;
                                                                   int newMonth = 0;
                                                                   int newYear = 0;
                                                                   int newHour = 0;
                                                                   int newMin = 0; 
                                                                   int newDay2 = 0;
                                                                   int newMonth2 = 0;
                                                                   int newYear2 = 0;
                                                                   int newHour2 = 0;
                                                                  int newMin2 = 0; 
                                                                  int newDay3 = 0;
                                                                  int newMonth3 = 0;
                                                                  int newYear3 = 0;
                                                                 int newHour3 = 0;
                                                                 int newMin3 = 0; 
                                                                boolean chpassday = false;
                         try{  
                          Statement  theStatement=theConnection.createStatement();
                          ResultSet theResult =     theStatement.executeQuery("select freq_rep,to_time,time  from calendar  where no_cal = "+NoNum  );
                          while(theResult.next()) 
                          {                                CalTemp.setTime(theResult.getDate(1));
                                                            newDay = CalTemp.get(CalTemp.DATE);
                                                            newMonth = CalTemp.get(CalTemp.MONTH)+1;
                                                            newYear  = CalTemp.get(CalTemp.YEAR);
                                                             CalTemp.setTime(theResult.getTime(1));
                                                            newHour = CalTemp.get(CalTemp.HOUR_OF_DAY);
                                                            newMin = CalTemp.get(CalTemp.MINUTE);
                                                             CalTemp2.setTime(theResult.getDate(2));
                                                            newDay2 = CalTemp2.get(CalTemp2.DATE);
                                                            newMonth2 = CalTemp2.get(CalTemp2.MONTH)+1;
                                                            newYear2  = CalTemp2.get(CalTemp2.YEAR);
                                                             CalTemp2.setTime(theResult.getTime(2));
                                                            newHour2 = CalTemp2.get(CalTemp2.HOUR_OF_DAY);
                                                            newMin2 = CalTemp2.get(CalTemp2.MINUTE);
                                                              CalTemp3.setTime(theResult.getDate(3));
                                                            newDay3 = CalTemp3.get(CalTemp3.DATE);
                                                            newMonth3 = CalTemp3.get(CalTemp3.MONTH)+1;
                                                            newYear3  = CalTemp3.get(CalTemp3.YEAR);
                                                             CalTemp3.setTime(theResult.getTime(3));
                                                            newHour3 = CalTemp3.get(CalTemp3.HOUR_OF_DAY);
                                                            newMin3 = CalTemp3.get(CalTemp3.MINUTE);
                                                           }
                                    theResult.close();
                                    theStatement.close();//Close statement
                                   }   catch (Exception e)   
                                               {   PrintWriter out = res.getWriter(); 
                                                    res.setContentType("text/html");
                                                    out.println(e.getMessage()); } 
                             chpassday = false;
                	      CalTemp3 =  new GregorianCalendar(newYear3,newMonth3-1,newDay3);
                           CalTemp2 =  new GregorianCalendar(newYear2,newMonth2-1,newDay2);                                       
                           if  (!(CalTemp3.equals(CalTemp2)))      chpassday = true;       
                 
                 /*-----------------------------------------------------------------------------N=1------------------------------------------------------------------------------*/
                   
                  if ((No_rep == 1) && (No_rem==1)) {
                  	PrintWriter out = res.getWriter(); 
                        if ( ((chpassday) &&  (Deletesome != null ) ) || (!chpassday)) 
                  	                            { try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                                                                 theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                                                Statement  theStatement=theConnection.createStatement();
                                                                 theStatement.executeQuery(
                                                                "delete from calendar  where id = ' "+UserID+"' and no_cal = "+NoNum );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    //PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); } 
                    	      }//if 
                    	      else if ((chpassday) &&  (Deleteall != null )) {    
                    	      	 // PrintWriter out = res.getWriter(); 
                    	      	 try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                                                                 theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                                                Statement  theStatement=theConnection.createStatement();
                                                                 theStatement.executeQuery(
                                                               "delete from calendar  where no_rep = "+No_rep +
                    	                                          " and  time = to_date('"+newDay3+"/" +newMonth3+"/"+newYear3+"  "
                                                           +newHour3+":"+newMin3+"','dd/mm/yyyy hh24:mi') and  freq_rep >=  to_date('"+newDay+"/"+newMonth+"/"+newYear+ " "+ newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')"
                                                           +" and  to_time = to_date('"+newDay2+"/"+newMonth2+"/"+newYear2+ " "+ newHour2+":"+newMin2+"','dd/mm/yyyy hh24:mi')");  
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    //PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); } 
                    	                  }//else if
                         }//if            N==1
                         
                         /*----------------------------------------------------------------------No_rep > 1 & No_rem =1---------------------------------------------*/
                	   int count1 = 0;
                	   int count2 = 0;
                	   int count3 = 0;
                	   int count4 = 0;
                	   if ((No_rep > 1) && (No_rem == 1))  {
                	    
                	      if  (Deletesome != null )  {
                	              try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                                                                 theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                                                Statement  theStatement=theConnection.createStatement();
                                                                 theStatement.executeQuery(
                                                                "delete from calendar  where id = ' "+UserID+"' and no_cal = "+NoNum );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }  
                	             try{   Statement  theStatement=theConnection.createStatement();
                	             		 ResultSet theResult =     theStatement.executeQuery(
                                                                   "select count(*)  from calendar  where  no_rep = "+No_rep);
                	                                             while (theResult.next()) { count1 = theResult.getInt(1) ;       }
                	                                            theStatement.close();//Close statement
                	                                                  }   catch (Exception e)   {    PrintWriter out = res.getWriter(); 
                                                                                                                         res.setContentType("text/html");
                    	                                                                                                    out.println(e.getMessage()); }
                	            if (count1 ==0)   { try{   Statement  theStatement=theConnection.createStatement();
                	            		            theStatement.executeQuery(
                	            		            "delete from repeat where no_rep = "+No_rep );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }  
                	            		}//if
                	            }//	if Deletesome
                	    
                	       if ((Deleteall != null) && (!chpassday))	{
                	                 try{   Statement  theStatement=theConnection.createStatement();
                                                                    ResultSet theResult =     theStatement.executeQuery(
                                                                   "select count(*)  from calendar  where  no_rep = "+No_rep +" and no_cal <= "+NoNum);
                	                                             while (theResult.next()) { count2 = theResult.getInt(1) ;       }
                	                                            theStatement.close();//Close statement
                	                                           theResult.close();
                	                                                  }   catch (Exception e)   {    PrintWriter out = res.getWriter(); 
                                                                                                                         res.setContentType("text/html");
                    	                                                                                                    out.println(e.getMessage()); }	
                	            if (count2 == 1)   {
                	             try{   Statement  theStatement=theConnection.createStatement();
                	             		            theStatement.executeQuery(
                	            		            "delete from calendar  where no_rep = "+No_rep );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }  
                	             try{   Statement  theStatement=theConnection.createStatement();
                	             		            theStatement.executeQuery(
                	            		            "delete from repeat where no_rep = "+No_rep );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }  
                	            	}//if count2
                	            
                	            else {  try{   Statement  theStatement=theConnection.createStatement();
                	            	                    theStatement.executeQuery(
                	                                         "delete from calendar  where no_rep = "+No_rep +
                    	                                          " and  time >= to_date('"+newDay3+"/" +newMonth3+"/"+newYear3+"  "
                                                           +newHour3+":"+newMin3+"','dd/mm/yyyy hh24:mi') and  freq_rep >=  to_date('"+newDay+"/"+newMonth+"/"+newYear+ " "+ newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')"
                                                           +" and  to_time >= to_date('"+newDay2+"/"+newMonth2+"/"+newYear2+ " "+ newHour2+":"+newMin2+"','dd/mm/yyyy hh24:mi')");  
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); } 
                	                         }//else
                	            }//if Dalete !chpassday
                	        
                	        if ((Deleteall != null) && (chpassday))
                	        {     try{    Statement  theStatement=theConnection.createStatement();
                                                           ResultSet theResult =     theStatement.executeQuery("select count(*)  from calendar  where no_rep = "+No_rep+
                                                          " and  time = to_date('"+newDay+"/" +newMonth+"/"+newYear+"  "
                                                           +newHour+":"+newMin+"','dd/mm/yyyy hh24:mi') and  freq_rep =  to_date('"+newDay+"/"+newMonth+"/"+newYear+ " "+ newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')"
                                                           +" and  to_time = to_date('"+newDay2+"/"+newMonth2+"/"+newYear2+ " "+ newHour2+":"+newMin2+"','dd/mm/yyyy hh24:mi')");
                                                          while (theResult.next())   { count3 = theResult.getInt(1) ; }
                                                          theStatement.close();
                                                           theResult.close();
                                                     } catch (Exception e) {   PrintWriter out = res.getWriter(); 
                                                                                                   res.setContentType("text/html");
                    	                                                                             out.println(e.getMessage()); }   
                    	   try {    Statement  theStatement=theConnection.createStatement();
                                                        ResultSet theResult =     theStatement.executeQuery("select count(*)  from calendar  where no_rep = "+No_rep +
                                                         " and  time <  to_date('"+newDay+"/" +newMonth+"/"+newYear+"  "
                                                           +newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')");
                                                         while (theResult.next())    { count4 = theResult.getInt(1) ; }
                                                        theStatement.close();
                                                        theResult.close();
                                                   } catch (Exception e) { PrintWriter out = res.getWriter(); 
                                                                                               res.setContentType("text/html");
                    	                                                                         out.println(e.getMessage()); }   
                	      if ((count3== 0) || (count4  > 0))  {
                	          try{   Statement  theStatement=theConnection.createStatement();
                	          		 theStatement.executeQuery(
                	                                         "delete from calendar  where no_rep = "+No_rep +
                    	                                          " and  time >= to_date('"+newDay3+"/" +newMonth3+"/"+newYear3+"  "
                                                           +newHour3+":"+newMin3+"','dd/mm/yyyy hh24:mi') and  freq_rep >=  to_date('"+newDay+"/"+newMonth+"/"+newYear+ " "+ newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')"
                                                           +" and  to_time >= to_date('"+newDay2+"/"+newMonth2+"/"+newYear2+ " "+ newHour2+":"+newMin2+"','dd/mm/yyyy hh24:mi')");  
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); } 
                	            }//if count3 ,count4
                	            else   if (count4  == 0) { 
                	            	       try{   Statement  theStatement=theConnection.createStatement();
                	            	       	           theStatement.executeQuery(
                	            		            "delete from calendar  where no_rep = "+No_rep );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }  
                	            	      
                	            	      try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from repeat where no_rep = "+No_rep );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }  
                	                                                              }
                	                            else if (count3== 1) {
                	                            	  try{   Statement  theStatement=theConnection.createStatement();
                	                            	   theStatement.executeQuery(
                	                                         "delete from calendar  where no_rep = "+No_rep +
                    	                                          " and  time >= to_date('"+newDay3+"/" +newMonth3+"/"+newYear3+"  "
                                                           +newHour3+":"+newMin3+"','dd/mm/yyyy hh24:mi') and  freq_rep >=  to_date('"+newDay+"/"+newMonth+"/"+newYear+ " "+ newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')"
                                                           +" and  to_time >= to_date('"+newDay2+"/"+newMonth2+"/"+newYear2+ " "+ newHour2+":"+newMin2+"','dd/mm/yyyy hh24:mi')");  
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); } 
                	                                         }//else if
                	               }//Deleteall    
                     }// Delete No_rep
                  /*-----------------------------------------------------------No_rem>1 & No_rep = 1------------------------------------------------------*/   	            
           int countrem = 0;
           if ((No_rem > 1) && (No_rep == 1)) {
           	 PrintWriter out = res.getWriter(); 
           	//out.println(chpassday);
            
              if (((Deletesome != null) ||  (Deleteall != null)) && (!chpassday))
                {   	       	 try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from calendar  where no_cal = "+NoNum );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    //PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }   
                	         try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from remind  where no_rem = "+No_rem+" or root = "+No_rem );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {   // PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }         	 
                	  }
                	else if ((Deletesome != null) && (chpassday))          	 
                	            {     try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "update calendar set no_rem = 1 where no_rem ="+No_rem );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    //PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                       out.println(e.getMessage()); }   
                    	                   try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from  calendar  where no_cal ="+NoNum );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    //PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                       out.println(e.getMessage()); }   
                    	                   try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from remind  where no_rem = "+No_rem+" or root = "+No_rem );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {   // PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }         
                    	             }//if
                    	             else if  ((Deleteall != null) && (!chpassday))  {
                    	             	  try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from calendar  where no_cal >= "+NoNum+" and no_rem = "+No_rem );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    //PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }   
                    	             	
                    	             	 try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "update calendar set no_rem = 1 where no_rem ="+No_rem );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    //PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                       out.println(e.getMessage()); }   
                    	             	
                	                     try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from remind  where no_rem = "+No_rem+" or root = "+No_rem );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {   // PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }         	
                    	            }//Deleteall 
                    	             	
                   }//if No_rem > 1 & No_rep = 1
                    	           
                /*-------------------------------------No_rep > 1 & No_rem > 1---------------------------------------------------------------------------*/    	           
                    	           
                    	   count1 = 0;
                	   count2 = 0;
                	   count3 = 0;
                	   count4 = 0;
                	   countrem = 0;
                	   if ((No_rep > 1) && (No_rem > 1))  {
                	      try{    Statement  theStatement=theConnection.createStatement();
                                                           ResultSet theResult =     theStatement.executeQuery("select count(*)  from calendar  where no_rep = "+No_rep+
                                                          " and  time = to_date('"+newDay+"/" +newMonth+"/"+newYear+"  "
                                                           +newHour+":"+newMin+"','dd/mm/yyyy hh24:mi') and  freq_rep =  to_date('"+newDay+"/"+newMonth+"/"+newYear+ " "+ newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')"
                                                           +" and  to_time = to_date('"+newDay2+"/"+newMonth2+"/"+newYear2+ " "+ newHour2+":"+newMin2+"','dd/mm/yyyy hh24:mi')");
                                                          while (theResult.next())   { count3 = theResult.getInt(1) ; }
                                                          theStatement.close();
                                                           theResult.close();
                                                     } catch (Exception e) {   PrintWriter out = res.getWriter(); 
                                                                                                   res.setContentType("text/html");
                    	                                                                             out.println(e.getMessage()); }   
                    	   try {    Statement  theStatement=theConnection.createStatement();
                                                        ResultSet theResult =     theStatement.executeQuery("select count(*)  from calendar  where no_rep = "+No_rep +
                                                         " and  time <  to_date('"+newDay+"/" +newMonth+"/"+newYear+"  "
                                                           +newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')");
                                                         while (theResult.next())    { count4 = theResult.getInt(1) ; }
                                                        theStatement.close();
                                                        theResult.close();
                                                   } catch (Exception e) { PrintWriter out = res.getWriter(); 
                                                                                               res.setContentType("text/html");
                    	                                                                         out.println(e.getMessage()); }   
                	      if  ((Deletesome != null ) && (!chpassday)) {
                	              try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                                                                 theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                                                Statement  theStatement=theConnection.createStatement();
                                                                 theStatement.executeQuery(
                                                                "delete from calendar  where id = ' "+UserID+"' and no_cal = "+NoNum );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }  
                    	              
                	             try{   Statement  theStatement=theConnection.createStatement();
                	             		 ResultSet theResult =     theStatement.executeQuery(
                                                                   "select count(*)  from calendar  where  no_rep = "+No_rep);
                	                                             while (theResult.next()) { count1 = theResult.getInt(1) ;       }
                	                                            theStatement.close();//Close statement
                	                                                  }   catch (Exception e)   {    PrintWriter out = res.getWriter(); 
                                                                                                                         res.setContentType("text/html");
                    	                                                                                                    out.println(e.getMessage()); }
                	            if (count1 ==0)   { try{   Statement  theStatement=theConnection.createStatement();
                	            		            theStatement.executeQuery(
                	            		            "delete from repeat where no_rep = "+No_rep );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }  
			  try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from remind  where no_rem = "+No_rem );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {   PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }                           	                                                                                                      
                	            		}//if
                	            if (count4 > 0 ) {   try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from remind  where root = "+No_rem +" and no_cal="+NoNum );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }      
                    	                                                     }//if
                	           }//Deletesome & !chpassday
                	           
                	           if  ((Deletesome != null ) && (chpassday)) {    
                	             
                	               try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "update calendar set no_rem = 1 where no_rem ="+No_rem+
                	            		            "and  time = to_date('"+newDay3+"/" +newMonth3+"/"+newYear3+"  "
                                                                             +newHour3+":"+newMin3+"','dd/mm/yyyy hh24:mi') and  freq_rep >=  to_date('"+newDay+"/"+newMonth+"/"+newYear+ " "+ newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')"
                                                                              +" and  to_time = to_date('"+newDay2+"/"+newMonth2+"/"+newYear2+ " "+ newHour2+":"+newMin2+"','dd/mm/yyyy hh24:mi')"); 
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                       out.println(e.getMessage()); }   
                    	                   try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from  calendar  where no_cal ="+NoNum );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                       out.println(e.getMessage()); }   
                    	                  
                	                 try{   Statement  theStatement=theConnection.createStatement();
                	             		 ResultSet theResult =     theStatement.executeQuery(
                                                                   "select count(*)  from calendar  where  no_rep = "+No_rep);
                	                                             while (theResult.next()) { count1 = theResult.getInt(1) ;       }
                	                                            theStatement.close();//Close statement
                	                                                  }   catch (Exception e)   {    PrintWriter out = res.getWriter(); 
                                                                                                                         res.setContentType("text/html");
                    	                                                                                                    out.println(e.getMessage()); }
                	            if (count1 ==0)   { try{   Statement  theStatement=theConnection.createStatement();
                	            		            theStatement.executeQuery(
                	            		            "delete from repeat where no_rep = "+No_rep );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }
                    	                                              try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from remind  where no_rem = "+No_rem );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }                                                                
                	          		}
                	            if ((count3==1) && (count4> 0))  {
                    	                                       try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from remind  where  root = "+No_rem+" and no_cal="+NoNum );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }        
                	          	}//if count3
                	}   //Deletesome & chpassday       
                	          
                    if  ((Deleteall != null ) && (!chpassday))          
                      {   try{   Statement  theStatement=theConnection.createStatement();
                	                            	   theStatement.executeQuery(
                	                                         "delete from calendar  where no_rep = "+No_rep +
                    	                                          " and  time >= to_date('"+newDay3+"/" +newMonth3+"/"+newYear3+"  "
                                                           +newHour3+":"+newMin3+"','dd/mm/yyyy hh24:mi') and  freq_rep >=  to_date('"+newDay+"/"+newMonth+"/"+newYear+ " "+ newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')"
                                                           +" and  to_time >= to_date('"+newDay2+"/"+newMonth2+"/"+newYear2+ " "+ newHour2+":"+newMin2+"','dd/mm/yyyy hh24:mi')");  
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); } 
                	             if (count4 > 0 ) {   try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from remind  where root = "+No_rem +" and no_cal >="+NoNum );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }      
                    	                                           }//if
                	            try{   Statement  theStatement=theConnection.createStatement();
                	             		 ResultSet theResult =     theStatement.executeQuery(
                                                                   "select count(*)  from calendar  where  no_rep = "+No_rep);
                	                                             while (theResult.next()) { count1 = theResult.getInt(1) ;       }
                	                                            theStatement.close();//Close statement
                	                                                  }   catch (Exception e)   {    PrintWriter out = res.getWriter(); 
                                                                                                                         res.setContentType("text/html");
                    	                                                                                                    out.println(e.getMessage()); }
                	            if (count1 ==0)   { try{   Statement  theStatement=theConnection.createStatement();
                	            		            theStatement.executeQuery(
                	            		            "delete from repeat where no_rep = "+No_rep );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }
                    	                                              try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from remind  where no_rem = "+No_rem );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {   PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }       
                    	                                                }//if             
                	          }//if Deleteall & !chpassday
                	          
             if   ((Deleteall != null ) && (chpassday))        
              {           try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "update calendar set no_rem = 1 where no_rem ="+No_rem+
                	            		            " and  time = to_date('"+newDay3+"/" +newMonth3+"/"+newYear3+"  "
                                                                             +newHour3+":"+newMin3+"','dd/mm/yyyy hh24:mi') and  freq_rep >=  to_date('"+newDay+"/"+newMonth+"/"+newYear+ " "+ newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')"
                                                                              +" and  to_time = to_date('"+newDay2+"/"+newMonth2+"/"+newYear2+ " "+ newHour2+":"+newMin2+"','dd/mm/yyyy hh24:mi')"+
                                                                              "and   freq_rep >=  to_date('"+newDay+"/"+newMonth+"/"+newYear+ " "+ newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')");  
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                       out.println(e.getMessage()); }   
                	           try{   Statement  theStatement=theConnection.createStatement();
                	                            	   theStatement.executeQuery(
                	                                         "delete from calendar  where no_rep = "+No_rep +
                    	                                          " and  time >= to_date('"+newDay3+"/" +newMonth3+"/"+newYear3+"  "
                                                           +newHour3+":"+newMin3+"','dd/mm/yyyy hh24:mi') and  freq_rep >=  to_date('"+newDay+"/"+newMonth+"/"+newYear+ " "+ newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')"
                                                           +" and  to_time >= to_date('"+newDay2+"/"+newMonth2+"/"+newYear2+ " "+ newHour2+":"+newMin2+"','dd/mm/yyyy hh24:mi')");  
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); } 
                	              if (count3 == 1 ) {   try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from remind  where root = "+No_rem +" and no_cal >="+NoNum );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }   
                    	                                            }//if count  
                	          if (count4==0) {  try{   Statement  theStatement=theConnection.createStatement();
                	            		            theStatement.executeQuery(
                	            		            "delete from repeat where no_rep = "+No_rep );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }
                    	                                              try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from remind  where no_rem = "+No_rem+" or root = "+No_rem );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }      
                    	                                         }//if               
                	          }//if Deleteall & chpassday
                	          
                   }//if No_rep >1 & No_rem > 1         
               }//Delete
                    	        try{     theConnection.close(); 
                         }  catch (Exception e) {  res.setContentType("text/html");
                                                              PrintWriter out = res.getWriter();
                	                                         out.println(e.getMessage()); }                     
                    	       if (Cancel != null ) { res.sendRedirect(DefaultURL+"/servlet/mCalendar"); }
                            res.sendRedirect(DefaultURL+"/servlet/mCalendar");
         }
     }
class UpdateRepeat {
public static  int  CheckRep(PrintWriter out,boolean updaterep,boolean addrep,int EventDay,int EventMonth,int EventYear,int EventHour,int EventMin,Connection theConnection,String RepeatFreq,int No_rep,int RepeatUntilYear,int RepeatUntilMonth,int RepeatUntilDay,String RepeatWeek,String RepeatUntil,String UserID,String []DayName)
     {  String Freq = RepeatWeek; 
          int UntilDay = 0;
         int UntilMonth = 0;
         int UntilYear = 0;
        boolean checkrep = true;
          if(RepeatFreq.equals("RepWeek")) Freq= RepeatWeek;
          for(int i=0;i<=6;i++)   {                                                   
    	  if  (   (Freq.equals(DayName[i]) )  && (checkrep) )
                           {  Calendar RepUntCalendar = new GregorianCalendar(EventYear,EventMonth-1,EventDay,EventHour,EventMin);
                                 RepUntCalendar.add(RepUntCalendar.MONTH,3);
                                  UntilDay = RepUntCalendar.get(RepUntCalendar.DAY_OF_MONTH);
                                  UntilMonth = RepUntCalendar.get(RepUntCalendar.MONTH)+1;
                                  UntilYear= RepUntCalendar.get(RepUntCalendar.YEAR);
                                  checkrep = false;
                                }
                        }//for*/
                      if    ( Freq.equals(DayName[7]) )
              	       { //out.println("Kate ");
              	          Calendar RepUntCalendar = new GregorianCalendar(EventYear,EventMonth-1,EventDay,EventHour,EventMin);
              	          RepUntCalendar.add(RepUntCalendar.MONTH,1);
                               UntilDay = RepUntCalendar.get(RepUntCalendar.DAY_OF_MONTH);
                               UntilMonth = RepUntCalendar.get(RepUntCalendar.MONTH)+1;
                               UntilYear= RepUntCalendar.get(RepUntCalendar.YEAR);
                           }
                    else   if    (Freq.equals(DayName[8]) ) 
              	                  { Calendar RepUntCalendar = new GregorianCalendar(EventYear,EventMonth-1,EventDay,EventHour,EventMin);
              	          RepUntCalendar.add(RepUntCalendar.MONTH,3);
                               UntilDay = RepUntCalendar.get(RepUntCalendar.DAY_OF_MONTH);
                               UntilMonth = RepUntCalendar.get(RepUntCalendar.MONTH)+1;
                               UntilYear= RepUntCalendar.get(RepUntCalendar.YEAR);
                                }
                                else     if    (Freq.equals(DayName[9]) ) 
              	                   { Calendar RepUntCalendar = new GregorianCalendar(EventYear,EventMonth-1,EventDay,EventHour,EventMin);
              	                       RepUntCalendar.add(RepUntCalendar.YEAR,1);
                                             UntilDay = RepUntCalendar.get(RepUntCalendar.DAY_OF_MONTH);
                                             UntilMonth = RepUntCalendar.get(RepUntCalendar.MONTH)+1;
                                             UntilYear= RepUntCalendar.get(RepUntCalendar.YEAR);
                                          }
                                          else     if    (Freq.equals(DayName[10]) ) 
              	                                      { Calendar RepUntCalendar = new GregorianCalendar(EventYear,EventMonth-1,EventDay,EventHour,EventMin);
              	                                          RepUntCalendar.add(RepUntCalendar.YEAR,5);
                                                                UntilDay = RepUntCalendar.get(RepUntCalendar.DAY_OF_MONTH);
                                                                 UntilMonth = RepUntCalendar.get(RepUntCalendar.MONTH)+1;
                                                                  UntilYear= RepUntCalendar.get(RepUntCalendar.YEAR);
                                                                }
             boolean checkunt = true;                                             
            if(RepeatUntil.equals("Until")) {  
                //   if ( UntilYear >   RepeatUntilYear) checkunt = false;
                if ( UntilYear <   RepeatUntilYear) checkunt = true;
                  else if (  ( UntilYear ==   RepeatUntilYear)  &&  ( UntilMonth > RepeatUntilMonth) ) checkunt = false;
                                 else if  (  ( UntilYear ==   RepeatUntilYear)  &&  ( UntilMonth > RepeatUntilMonth)  &&  (UntilDay >= RepeatUntilDay)  ) checkunt = false;
                                         else if ( UntilYear >   RepeatUntilYear) checkunt =false;
                                                   else checkunt = true;
                  if (!checkunt) 
                    {  UntilDay = RepeatUntilDay;
                        UntilMonth = RepeatUntilMonth;
                        UntilYear =   RepeatUntilYear;}
                }//if
              boolean checkagain = false;
             if(RepeatUntil.equals("Until")) {  
                 if ( UntilYear <   EventYear) checkagain= true;
                  else if (  ( UntilYear ==   EventYear)  &&  ( UntilMonth > EventMonth) ) checkagain= false;
                                 else if  (  ( UntilYear ==   EventYear)  &&  ( UntilMonth ==  EventMonth)  &&  (UntilDay > EventDay)  ) checkagain= false;
                                         else if ( UntilYear >   EventYear) checkagain=false;
                                                   else checkagain= true;
                                                }
	 if ( (!checkagain) && (updaterep)){
            try{       Statement  theStatement=theConnection.createStatement();
                         theStatement.executeQuery(
                                                       "update  repeat set  until = to_date(' "
                                                        +UntilDay+"/"+UntilMonth+"/"+UntilYear+"','dd/mm/yyyy'), freq_rep = ' "+Freq+" ' where no_rep = "+No_rep);
                         theStatement.close();
                   }   catch (Exception e)   
                                               { /*PrintWriter out = res.getWriter(); 
                                                 res.setContentType("text/html"); */
                                                 out.println(e.getMessage());   }      
            }//if
          else  if(  (!checkagain) && (addrep))
          	    {  try{       Statement  theStatement=theConnection.createStatement();
                         theStatement.executeQuery(
                                                       "INSERT INTO repeat"
                                                       +"(no_rep,id,until,freq_rep)"
                                                       +" values(no_rep.nextval,' "+UserID+"',to_date(' "
                                                        +UntilDay+"/"+UntilMonth+"/"+UntilYear+"','dd/mm/yyyy'),' "+Freq+" ')");       
                           theStatement.close();
                                 }   catch (Exception e)   
                                               { /*PrintWriter out = res.getWriter(); 
                                                  res.setContentType("text/html"); */
                                                  out.println(e.getMessage());   }      
                   try{  
                          Statement  theStatement=theConnection.createStatement();
                          ResultSet theResult =     theStatement.executeQuery("select no_rep from repeat  order by no_rep desc"   );
                          while(theResult.next()) 
                          {
                          No_rep = theResult.getInt(1);
                          break;
                        }
                            theResult.close();
                            theStatement.close();
                   }   catch (Exception e)   
                                               { /*PrintWriter out = res.getWriter(); 
                                                 res.setContentType("text/html"); */
                                                  out.println(e.getMessage());   }    
                    }//if  
                return No_rep;
        } 
    }//Repeat Class   
    
 class UpdateReminderSub {
String freq_before ;
 public static  int  CheckRem(int NoNum,boolean addrem,boolean updaterem,boolean updaterem1,PrintWriter out,int RemindWeek,int RemindDay,int RemindHour ,int RemindMin ,int RemindBefore,Connection theConnection,int No_rem,int FbeforeDay,int FbeforeMonth,int FbeforeYear,int FbeforeHour,int FbeforeMin,int  Fbefore2Day,int  Fbefore2Month,int  Fbefore2Year,int Fbefore2Hour,int Fbefore2Min,String RemindPager,String RemindPagerType,int RemindPNum,String RemindPPw,String RemindRePPw,String RemindEmail,String RemindEmailAdd,String RemindMessage,String RemindFrom,String UserID)
 {          if (updaterem) {          if  (((RemindWeek > 0) || (RemindDay > 0) || (RemindHour >0) || (RemindMin >0)) && (RemindBefore > 0) )
                                                  {   try{   Statement  theStatement=theConnection.createStatement();
                                                          theStatement.executeQuery(
                                                                "update  remind set  freq_before = to_date('"+FbeforeDay+"/"+FbeforeMonth+"/"+FbeforeYear
                                                                 +" "+FbeforeHour+":" +FbeforeMin+"','dd/mm/yyyy hh24:mi'), freq_and = to_date('"+Fbefore2Day+"/"+Fbefore2Month+"/"+Fbefore2Year+" "
                                                                +Fbefore2Hour+":"+Fbefore2Min+"','dd/mm/yyyy hh24:mi'), PagMob = '"+RemindPagerType+"', PagMobnum = '"
                                                                +RemindPNum+"', password = '"+RemindPPw+" ', email = '" +RemindEmailAdd+"', message = '"+
                                                                RemindMessage+"', sender = '"+RemindFrom+"', root = 1 ,no_cal = 1 where no_rem = "+No_rem);
                                                                 theStatement.close();
                                                            }   catch (Exception e)     { System.out.println(e.getMessage());   }         
                                                     }//if
                                             else{     if  ( ((RemindWeek > 0) || (RemindDay > 0) || (RemindHour >0) || (RemindMin >0)) && (RemindBefore == 0) )
                                                              {   try{   Statement  theStatement=theConnection.createStatement();
                                                                  theStatement.executeQuery(
                                                                "update  remind set  freq_before = to_date('"+FbeforeDay+"/"+FbeforeMonth+"/"+FbeforeYear
                                                                 +" "+FbeforeHour+":" +FbeforeMin+"','dd/mm/yyyy hh24:mi'), PagMob = '"+RemindPagerType+"', PagMobnum = '"
                                                                +RemindPNum+"', password = '"+RemindPPw+" ', email = '" +RemindEmailAdd+"', message = '"+
                                                                RemindMessage+"', sender = '"+RemindFrom+"', root = 1  ,freq_and = null  ,no_cal = 1 where no_rem = "+No_rem);
                                                                 theStatement.close();
                                                                }   catch (Exception e)     { System.out.println(e.getMessage());   }   
                                                                 
                                                             }//if
                                                             else if  ( ((RemindWeek == 0) && (RemindDay == 0) && (RemindHour ==0) && (RemindMin ==0)) && (RemindBefore > 0) )
                                                                        {  try{   Statement  theStatement=theConnection.createStatement();
                                                                           theStatement.executeQuery(
                                                                          "update  remind set  freq_and = to_date('"+Fbefore2Day+"/"+Fbefore2Month+"/"+Fbefore2Year+" "
                                                                          +Fbefore2Hour+":"+Fbefore2Min+"','dd/mm/yyyy hh24:mi'), PagMob = '"+RemindPagerType+"', PagMobnum = '"
                                                                           +RemindPNum+"', password = '"+RemindPPw+" ', email = '" +RemindEmailAdd+"', message = '"+
                                                                             RemindMessage+"', sender = '"+RemindFrom+"', root = 1, freq_before = null  ,no_cal = 1 where no_rem = "+No_rem);
                                                                            theStatement.close();
                                                                             }   catch (Exception e)     { System.out.println(e.getMessage());   }         
                                                                        }//if
                                                        }//else
                                          }//if update

            if (updaterem1) {       try{      Statement  theStatement=theConnection.createStatement();
                       			   ResultSet theResult =     theStatement.executeQuery("select no_rem  from remind  where no_cal = "+NoNum   );
                       			   while(theResult.next())     {  No_rem = theResult.getInt(1);
                    				                                                        break;       }
                  				          theStatement.close();
                  				          theResult.close(); }   catch (Exception e)      {  System.out.println(e.getMessage());   }    
            	 
            	 	      if  (((RemindWeek > 0) || (RemindDay > 0) || (RemindHour >0) || (RemindMin >0)) && (RemindBefore > 0) )
                                                  {  try{   Statement  theStatement=theConnection.createStatement();
                                                          theStatement.executeQuery(
                                                                "update  remind set  freq_before = to_date('"+FbeforeDay+"/"+FbeforeMonth+"/"+FbeforeYear
                                                                 +" "+FbeforeHour+":" +FbeforeMin+"','dd/mm/yyyy hh24:mi'), freq_and = to_date('"+Fbefore2Day+"/"+Fbefore2Month+"/"+Fbefore2Year+" "
                                                                +Fbefore2Hour+":"+Fbefore2Min+"','dd/mm/yyyy hh24:mi'), PagMob = '"+RemindPagerType+"', PagMobnum = '"
                                                                +RemindPNum+"', password = '"+RemindPPw+" ', email = '" +RemindEmailAdd+"', message = '"+
                                                                RemindMessage+"', sender = '"+RemindFrom+"', root = 1 ,no_cal = 1 where no_cal = "+NoNum);
                                                                 theStatement.close();
                                                            }   catch (Exception e)     { System.out.println(e.getMessage());   }         
                                                     }//if
                                             else{     if  ( ((RemindWeek > 0) || (RemindDay > 0) || (RemindHour >0) || (RemindMin >0)) && (RemindBefore == 0) )
                                                              {   try{   Statement  theStatement=theConnection.createStatement();
                                                                  theStatement.executeQuery(
                                                                "update  remind set  freq_before = to_date('"+FbeforeDay+"/"+FbeforeMonth+"/"+FbeforeYear
                                                                 +" "+FbeforeHour+":" +FbeforeMin+"','dd/mm/yyyy hh24:mi'), PagMob = '"+RemindPagerType+"', PagMobnum = '"
                                                                +RemindPNum+"', password = '"+RemindPPw+" ', email = '" +RemindEmailAdd+"', message = '"+
                                                                RemindMessage+"', sender = '"+RemindFrom+"', root = 1  ,freq_and = null  ,no_cal = 1 where no_cal = "+NoNum);
                                                                 theStatement.close();
                                                                }   catch (Exception e)     { System.out.println(e.getMessage());   }   
                                                                 
                                                             }//if
                                                             else if  ( ((RemindWeek == 0) && (RemindDay == 0) && (RemindHour ==0) && (RemindMin ==0)) && (RemindBefore > 0) )
                                                                        {  try{   Statement  theStatement=theConnection.createStatement();
                                                                           theStatement.executeQuery(
                                                                          "update  remind set  freq_and = to_date('"+Fbefore2Day+"/"+Fbefore2Month+"/"+Fbefore2Year+" "
                                                                          +Fbefore2Hour+":"+Fbefore2Min+"','dd/mm/yyyy hh24:mi'), PagMob = '"+RemindPagerType+"', PagMobnum = '"
                                                                           +RemindPNum+"', password = '"+RemindPPw+" ', email = '" +RemindEmailAdd+"', message = '"+
                                                                             RemindMessage+"', sender = '"+RemindFrom+"', root = 1, freq_before = null  ,no_cal = 1 where no_cal = "+NoNum);
                                                                            theStatement.close();
                                                                             }   catch (Exception e)     { System.out.println(e.getMessage());   }         
                                                                        }//if
                                                        }//else
                                          }//if update                                          
                                             
            if (addrem) {  if ( ((RemindWeek > 0) || (RemindDay > 0) || (RemindHour >0) || (RemindMin >0)) && (RemindBefore > 0) )
                                           {   try{      Statement  theStatement=theConnection.createStatement();
                                                 theStatement.executeQuery(
                                                       "INSERT INTO remind"
                                                       +"(no_rem,id,freq_before,freq_and, PagMob,PagMobnum,password,email,message,sender,root,no_cal)"
                                                       + "values(no_rem.nextval,' "+UserID+"',to_date('"+FbeforeDay+"/"+FbeforeMonth+"/"+FbeforeYear
                                                       +" "+FbeforeHour+":" +FbeforeMin+"','dd/mm/yyyy hh24:mi'),to_date('"+Fbefore2Day+"/"+Fbefore2Month+"/"+Fbefore2Year+" "
                                                       +Fbefore2Hour+":"+Fbefore2Min+
                                                       "','dd/mm/yyyy hh24:mi'),'"
                                                       +RemindPagerType+"','"+RemindPNum+"','"+RemindPPw+"','"+RemindEmailAdd+"','" + RemindMessage+"','"+RemindFrom+"',1,1)");
                                                theStatement.close();
                                       }   catch (Exception e)     { //res.setContentType("text/html");
                                                                                         //PrintWriter out = res.getWriter();
                                                                                        out.println(e.getMessage()); }     
                                    }//if
                               else{   if     ( ((RemindWeek > 0) || (RemindDay > 0) || (RemindHour >0) || (RemindMin >0)) && (RemindBefore == 0) )
                                                {  try{   Statement  theStatement=theConnection.createStatement();
                                                             theStatement.executeQuery(
                                                                 "INSERT INTO remind"
                                                                 +"(no_rem,id,freq_before,PagMob,PagMobnum,password,email,message,sender,root,no_cal)"
                                                                 + "values(no_rem.nextval,' "+UserID+"',to_date(' "+FbeforeDay+"/"+FbeforeMonth+"/"+FbeforeYear
                                                                +" "+FbeforeHour+":" +FbeforeMin+"','dd/mm/yyyy hh24:mi'),'"
                                                               +RemindPagerType+"','"+RemindPNum+"','"+RemindPPw+"','"+RemindEmailAdd+"','" + RemindMessage+"','"+RemindFrom+"',1,1)");
                                                             theStatement.close();
                                                        }   catch (Exception e)      { //res.setContentType("text/html");
                                                                                                          //PrintWriter out = res.getWriter();
                                                                                                            out.println(e.getMessage()); }     
                                                     }//if
                                              else if  ( ((RemindWeek == 0) && (RemindDay == 0) && (RemindHour ==0) && (RemindMin ==0)) && (RemindBefore > 0) )
                                                             {  try{    Statement  theStatement=theConnection.createStatement();
                                                                             theStatement.executeQuery(
                                                                                    "INSERT INTO remind"
                                                                                    +"(no_rem,id,freq_and, PagMob,PagMobnum,password,email,message,sender,root,no_cal)"
                                                                                    + "values(no_rem.nextval,' "+UserID+"',to_date('"+Fbefore2Day+"/"+Fbefore2Month+"/"+Fbefore2Year+" "
                                                                                    +Fbefore2Hour+":"+Fbefore2Min+
                                                                                     "','dd/mm/yyyy hh24:mi'),'"
                                                                                     +RemindPagerType+"','"+RemindPNum+"','"+RemindPPw+"','"+RemindEmailAdd+"','" + RemindMessage+"','"+RemindFrom+"',1,1)");
                                                                           theStatement.close();
                                                                         }   catch (Exception e)        {//  res.setContentType("text/html");
                                                                                                                            //PrintWriter out = res.getWriter();
                                                                                                                             out.println(e.getMessage()); }     
                                                               }//if
                                        }//else
              if (updaterem) 
                 { try{   Statement  theStatement=theConnection.createStatement();
                             ResultSet theResult =     theStatement.executeQuery("select no_rem  from remind  where no_rem = "+No_rem );
                             while(theResult.next())   { No_rem = theResult.getInt(1);
                                                                              break;    }
                             theStatement.close();
                             theResult.close(); }   catch (Exception e)    {  System.out.println(e.getMessage());   }    
                  }//if
                 if (addrem)    try{  Statement  theStatement=theConnection.createStatement();
                                                   ResultSet theResult =     theStatement.executeQuery("select no_rem  from remind  order by no_rem desc"   );
                                                    while(theResult.next())    {  No_rem = theResult.getInt(1);
                                                                                                         break;    }
                                                   theStatement.close();
                                                   theResult.close();   }   catch (Exception e)       {  System.out.println(e.getMessage());   }    
                                                  }
                       return No_rem ;  
    }
  }