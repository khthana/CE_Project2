import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.lang.String;

public class AddEvent extends HttpServlet
{   String DefaultURL="http://161.246.5.233:8080/planny";
     Connection theConnection;
      String []DayName={"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Day","Week","Month","Year"} ;
      int CurDate      =  Calendar.getInstance().get(Calendar.DAY_OF_MONTH); 
       int CurMonth    =  Calendar.getInstance().get(Calendar.MONTH); 
       int CurYear      =  Calendar.getInstance().get(Calendar.YEAR); 
     protected  void  doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
        {   HttpSession session = req.getSession(true);
            String  UserID = session.getValue("login.username").toString();	
            if ( session.getValue("login.username")==null  ) {  res.sendRedirect(DefaultURL);  }
               else { session.putValue("login.username",session.getValue("login.username"));  }
            boolean checkFinal  = true;
            String Back  = req.getParameter("Back");  if (  Back != null  )   {res.sendRedirect(DefaultURL+"/servlet/mCalendar"); } 
              else  {  //Not Cancel 
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
            
            String Save                  = req.getParameter("SubmitSave");
            String SaveAnother  = req.getParameter("SubmitSaveAnother");
            
         
            int No_rem = 1;
            int No_rep = 1;
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
           // if(RemindFrom.equals("")) RemindFrom = UserID;
         
            if (RemindMessage.equals("")) RemindMessage = EventTitle;
            if(RemindFrom.equals("")) RemindFrom = "Planny.com";
          
            if( EFinalDate == 0) EFinalDate=EventDay;
            if( EFinalMonth == 0) EFinalMonth=EventMonth;
            if( EFinalYear == 0) EFinalYear=EventYear;
         
            int MHour = 0;
            int MMin = 00;
            if (session.getValue("Reminder.t") != null) {
                            long GiveTime= Long.parseLong(session.getValue("Reminder.t").toString());
                           Date MakeDate = new Date(GiveTime);
                           Calendar MCalendar = new GregorianCalendar();
                           MCalendar.setTime(MakeDate);
                           MHour = MCalendar.get(MCalendar.HOUR_OF_DAY);
                           MMin = MCalendar.get(MCalendar.MINUTE);
                           }//if
        
          try{    Class.forName("oracle.jdbc.driver.OracleDriver");
                                     theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                 }  catch (Exception e) {  res.setContentType("text/html");
                                                                                  PrintWriter out = res.getWriter();
                                 	                                       out.println(e.getMessage()); }
       
            Calendar GCalendar = new GregorianCalendar(EventYear,EventsetMonth,EventDay,EventHour,EventMin);
            EventDay = GCalendar.get(GCalendar.DAY_OF_MONTH);
            EventMonth = GCalendar.get(GCalendar.MONTH)+1;
            EventYear = GCalendar.get(GCalendar.YEAR);
            int  EventEndDay     =  EventDay;
            int  EventEndMonth =  EventMonth;
            int  EventEndYear   =  EventYear;
         
            if (EventTime.equals("AllDay"))  
                  {      if (session.getValue("Reminder.t") != null) {  
                  	     EventHour = MHour;
                           EventMin = MMin;
                  	      EventEndHour=23;
                           EventEndMin = 59;
                            } //if
                          else {   EventHour=0;
                                        EventMin=00;
                                        EventEndHour=23;
                                        EventEndMin = 59;
                                       } //else
              }
                 
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
                         {             GCalendar.add(GCalendar.MONTH,EFinalDuMonth);
                                        GCalendar.add(GCalendar.WEEK_OF_MONTH,EFinalDuWeek);
                                        GCalendar.add(GCalendar.DAY_OF_MONTH,EFinalDuDay);
               	                   EventEndDay = GCalendar.get(GCalendar.DAY_OF_MONTH);
                                        EventEndMonth = GCalendar.get(GCalendar.MONTH)+1;
                                       EventEndYear =  GCalendar.get(GCalendar.YEAR);
                                       EventEndHour = GCalendar.get(GCalendar.HOUR_OF_DAY);
                                       EventEndMin = GCalendar.get(GCalendar.MINUTE);
                                       }
                      }//if Final
         /*------------------------------------------------------------------------------Rep-----------------------------------------------------------------------*/
            if (checkFinal ) {
            Calendar RepCalendar = new GregorianCalendar(RepeatUntilYear,RepeatUntilMonth-1,RepeatUntilDay);
            RepeatUntilYear = RepCalendar.get(RepCalendar.YEAR);
            RepeatUntilMonth =  RepCalendar.get(RepCalendar.MONTH)+1;
            RepeatUntilDay = RepCalendar.get(RepCalendar.DAY_OF_MONTH);
              res.setContentType("text/html");
           PrintWriter out = res.getWriter();
            if (!RepeatFreq.equals("NoRep")) No_rep = AddRepeat.CheckRep(out,EventDay,EventMonth,EventYear,EventHour,EventMin,theConnection,RepeatFreq,No_rep,RepeatUntilYear,RepeatUntilMonth,RepeatUntilDay,RepeatWeek,RepeatUntil,UserID,DayName);
           
           /*---------------------------------------------------------------------------Rem---------------------------------------------------------------------*/
           boolean CheckRem = false;
            boolean CheckRem2 = false;
           int RemindPNum = 0;
           if (req.getParameter("PNumber").equals("") )
                {  RemindPNum = 0 ;
                    CheckRem = true;}
                else {    RemindPNum =  Integer.parseInt(req.getParameter("PNumber")); } 
           if  (RemindPager==null) { CheckRem= true;
           			RemindPagerType="No Type";}
           if (RemindPagerType.equals("162")) {
               if  ( ! (( RemindPPw.equals(RemindRePPw) ) && (!RemindPPw.equals("")) ) )  CheckRem = true; 
              }
            if (RemindPPw.equals("")) RemindPPw = "NO Password";
            if (RemindEmail==null) CheckRem2= true;
            if (RemindEmailAdd.equals("")) CheckRem2= true;
            if (RemindEmailAdd.equals("")) RemindEmailAdd="No Email";
                if  ( ((RemindPager==null) && ( RemindPPw.equals(RemindRePPw) )) || (RemindPPw.equals("")) )
                         { RemindPNum = 0;
                           RemindPagerType="No Type";
                           RemindPPw = "NO Password";
                         }    
       
           if  (  ((RemindWeek==0) && (RemindDay==0) && (RemindHour==0) && (RemindMin==0))  && (RemindBefore==0) )
              { CheckRem= true;
                 CheckRem2= true; }
       
            int FbeforeDay = 0;
            int FbeforeMonth = 0;
            int FbeforeYear = 0;
            int FbeforeHour  = 0;
            int FbeforeMin = 0;      
             int Fbefore2Day = 0;
            int Fbefore2Month = 0;
            int Fbefore2Year = 0;
            int Fbefore2Hour  = 0;
            int Fbefore2Min = 0;      
      
           if ( !RemindFreq.equals("NoRem")&& (  (!CheckRem) ||(!CheckRem2))   )
            {        Calendar RemCalendar = new GregorianCalendar(EventYear,EventMonth-1,EventDay,EventHour,EventMin);
                               RemCalendar.add(RemCalendar.DATE,-(RemindWeek*7));//Add Week
                               RemCalendar.add(RemCalendar.DATE,-(RemindDay));
                               RemCalendar.add(RemCalendar.HOUR_OF_DAY,-(RemindHour));
                               RemCalendar.add(RemCalendar.MINUTE,-(RemindMin)); 
              
                               FbeforeDay = RemCalendar.get(RemCalendar.DAY_OF_MONTH);
                              FbeforeMonth = RemCalendar.get(RemCalendar.MONTH)+1;
                             FbeforeYear = RemCalendar.get(RemCalendar.YEAR);
                              FbeforeHour = RemCalendar.get(RemCalendar.HOUR_OF_DAY);
                              FbeforeMin = RemCalendar.get(RemCalendar.MINUTE);
                         
                 Calendar RemCalendar2 = new GregorianCalendar(EventYear,EventMonth-1,EventDay,EventHour,EventMin);
                                   RemCalendar2.add(RemCalendar2.MINUTE,-(RemindBefore));  
          
                                 Fbefore2Day = RemCalendar2.get(RemCalendar2.DAY_OF_MONTH);
                                 Fbefore2Month = RemCalendar2.get(RemCalendar2.MONTH)+1;
                                Fbefore2Year = RemCalendar2.get(RemCalendar2.YEAR);
                                Fbefore2Hour = RemCalendar2.get(RemCalendar2.HOUR_OF_DAY);
                                Fbefore2Min = RemCalendar2.get(RemCalendar2.MINUTE);
                          
                        //out.println(FbeforeDay+"<br/>"+FbeforeMonth+"<br/>"+FbeforeYear+"<br/>"+FbeforeHour+"<br/>"+FbeforeMin+"<br/>");
                  No_rem = AddReminder.CheckRem(RemindWeek,RemindDay,RemindHour ,RemindMin , RemindBefore,No_rep,out,theConnection,No_rem,FbeforeDay, FbeforeMonth,FbeforeYear,FbeforeHour,FbeforeMin,Fbefore2Day,Fbefore2Month,Fbefore2Year,Fbefore2Hour,Fbefore2Min,RemindPager,RemindPagerType,RemindPNum,RemindPPw,RemindRePPw,RemindEmail,RemindEmailAdd,RemindMessage,RemindFrom,UserID);
          }//if
        
            /*----------------------------------------------------------------------------Add Event------------------------------------------------------------------*/
            
            
              try{    
                          Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                                       "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,safe_mode,no_rep,no_rem,no_group,freq_rep)"
                                                           + "values( no_cal.nextval,to_date('"+EventDay+"/" +EventMonth+"/"+EventYear+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+EventEndDay+"/"+EventEndMonth+"/"+EventEndYear+ " "+ EventEndHour+":"+EventEndMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +EventTitle+"','"+EventType+"','"+EventPlace+"','"+EventNote+"','"+EventSharing+"','"+No_rep+"','"+No_rem+"',1,to_date('"+EventDay+"/" +EventMonth+"/"+EventYear+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                 }   catch (Exception e)   
                                               { res.setContentType("text/html");
                                                   out.println(e.getMessage()); } 
                                                   
             boolean checkcal = false;
             boolean checklong = false;
              if  ( (EventYear ==  EventEndYear)  && (EventMonth ==   EventEndMonth) &&(EventDay ==   EventEndDay) ) checkcal = true;
             else checkcal = false;
             int LongEventDay =  EventDay;
             int LongEventMonth = EventMonth;
             int LongEventYear =       EventYear ;                   
            int count = 1;
             while  (!checkcal)  {
             	   GCalendar = new GregorianCalendar(LongEventYear,LongEventMonth-1,LongEventDay);
             	   GCalendar.add(GCalendar.DATE,1);   
             	  LongEventDay = GCalendar.get(GCalendar.DAY_OF_MONTH);
                       LongEventMonth = GCalendar.get(GCalendar.MONTH)+1;
                       LongEventYear = GCalendar.get(GCalendar.YEAR);
                       if  ( (LongEventYear ==  EventEndYear)  && (LongEventMonth ==   EventEndMonth) &&(LongEventDay  ==   EventEndDay) )  
                       { checkcal = true;
                          checklong = false;
                        }
                        
                       if (LongEventYear <   EventEndYear) checklong= true;
                       if (LongEventYear >   EventEndYear) checklong= false;
                       else  if ( (LongEventYear ==  EventEndYear)  && (LongEventMonth <   EventEndMonth)) checklong= true;
                          else if  ( (LongEventYear ==  EventEndYear)  && (LongEventMonth ==   EventEndMonth) &&(LongEventDay  <   EventEndDay) ) checklong= true;
                                   else checklong=false;                    
	if (checklong) {                                   
                      try{    
                          Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                                       "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,safe_mode,no_rep,no_rem,no_group,freq_rep)"
                                                           + "values( no_cal.nextval,to_date('"+EventDay+"/" +EventMonth+"/"+EventYear+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+EventEndDay+"/"+EventEndMonth+"/"+EventEndYear+ " "+ EventEndHour+":"+EventEndMin+" ','dd/mm/yyyy hh24:mi'),' "
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
                                                           + "values( no_cal.nextval,to_date('"+EventDay+"/" +EventMonth+"/"+EventYear+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+EventEndDay+"/"+EventEndMonth+"/"+EventEndYear+ " "+ EventEndHour+":"+EventEndMin+" ','dd/mm/yyyy hh24:mi'),' "
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
         
           if(No_rep >1) {
          int RepFDate = 0;
           int RepFMonth = 0;
            int RepFYear = 0 ; 
              String CheckFreq = "";
        int count1 = 0;
         int no_cal = 0;
        boolean crepshow = false;
         try{          Statement  theStatement=theConnection.createStatement();
                          ResultSet theResult =     theStatement.executeQuery("select count(*)  from calendar  where no_rep > 1 and no_rep = "+No_rep);
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
                          ResultSet theResult =     theStatement.executeQuery("select freq_rep,no_cal,to_time  from calendar  where no_rep > 1 and no_rep = "+No_rep   );
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
                   	 if ( (CalRep.equals(CalRep1)) || (CalRep.equals(CalRep2)) )
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
                   {    if ( (CalRep.equals(CalRep1)) || (CalRep.equals(CalRep2)) )
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
                                    //out.println(CalYear+"<br/>"+RepFYear+"<br/>"+CalMonth+"<br/>"+RepFMonth+"<br/>"+CalDay+"<br/>"+RepFDate);
                                     //out.println(checksure2);  
                               CalRep = new GregorianCalendar(CalYear,CalMonth-1,CalDay);
                                   Calendar  CalRep1 = new GregorianCalendar(CalYear1,CalMonth1-1,CalDay1);
                                    Calendar CalRep2 = new GregorianCalendar(CalYear2,CalMonth2-1,CalDay2);  
                             while ((!cok)  && (checksure) &&(checksure2) )
                   {     if ( (CalRep.equals(CalRep1)) || (CalRep.equals(CalRep2)) )
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
                   {        if ( (CalRep.equals(CalRep1)) || (CalRep.equals(CalRep2)) )
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
                   {       if ( (CalRep.equals(CalRep1)) || (CalRep.equals(CalRep2)) )
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
                 
                if (No_rem > 1 )
                {
                int no_count = 0 ;
                try{  
                               Statement  theStatement=theConnection.createStatement();
                               ResultSet theResult =     theStatement.executeQuery("select count(*) from calendar where no_rep ="+No_rep);
                               while (theResult.next() )
                               { no_count = theResult.getInt(1) ;}
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
                
                Calendar RemCalendar = new GregorianCalendar();                                                  
                for ( int  i=1; i<= no_count; i++)
                { //boolean  checki = true;
                   boolean checkrem = false;
                   try{  
                               Statement  theStatement=theConnection.createStatement();
                               ResultSet theResult =     theStatement.executeQuery(
                               "select time,no_cal  from calendar where no_cal in (select min(no_cal)  from calendar  group by time,to_time) and no_rep = "+No_rep );
                              while(theResult.next() && (!checkrem) ) 
                               {    if ( i == 1) 
                                     {  //checki = false;
                                         checkrem = true;
                                         no =  theResult.getInt(2);
                                      }
                                  else  if (no <  theResult.getInt(2))  
                                 {  no = theResult.getInt(2);
                                  RemCalendar.setTime(theResult.getDate(1));
                                 RemDaycal = RemCalendar.get(RemCalendar.DATE);
                                 RemMonthcal = RemCalendar.get(RemCalendar.MONTH)+1;
                                 RemYearcal  = RemCalendar.get(RemCalendar.YEAR);
                                 RemCalendar.setTime(theResult.getTime(1));
                                 RemHourcal = RemCalendar.get(RemCalendar.HOUR_OF_DAY);
                                 RemMincal  = RemCalendar.get(RemCalendar.MINUTE);
                                 RemCalendar = new GregorianCalendar(RemYearcal,RemMonthcal-1,RemDaycal,RemHourcal ,RemMincal);
                                RemCalendar.add(RemCalendar.DATE,-(RemindWeek*7));//Add Week
                                RemCalendar.add(RemCalendar.DATE,-(RemindDay));
                                RemCalendar.add(RemCalendar.HOUR_OF_DAY,-(RemindHour));
                                RemCalendar.add(RemCalendar.MINUTE,-(RemindMin)); 
                                FbeforeDay = RemCalendar.get(RemCalendar.DAY_OF_MONTH);
                                FbeforeMonth = RemCalendar.get(RemCalendar.MONTH)+1;
                                FbeforeYear = RemCalendar.get(RemCalendar.YEAR);
                                FbeforeHour = RemCalendar.get(RemCalendar.HOUR_OF_DAY);
                                FbeforeMin = RemCalendar.get(RemCalendar.MINUTE);
                         
                                 Calendar RemCalendar2 = new GregorianCalendar(EventYear,EventMonth-1,EventDay,EventHour,EventMin);
                                   RemCalendar2.add(RemCalendar2.MINUTE,-(RemindBefore));  
          
                                 Fbefore2Day = RemCalendar2.get(RemCalendar2.DAY_OF_MONTH);
                                 Fbefore2Month = RemCalendar2.get(RemCalendar2.MONTH)+1;
                                Fbefore2Year = RemCalendar2.get(RemCalendar2.YEAR);
                                Fbefore2Hour = RemCalendar2.get(RemCalendar2.HOUR_OF_DAY);
                                Fbefore2Min = RemCalendar2.get(RemCalendar2.MINUTE);
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
              }//if No <> 1
           }//checkFinal 
                 try{     theConnection.close(); 
                }  catch (Exception e) {  res.setContentType("text/html");
                                                              PrintWriter out = res.getWriter();
                	                                         out.println(e.getMessage()); }
      
   if(  Save != null  )        {res.sendRedirect(DefaultURL+"/servlet/mCalendar?t="+session.getValue("Reminder.t")+"&s=0" );}
               else if (SaveAnother != null) { res.sendRedirect(DefaultURL+"/servlet/Reminder?t="+session.getValue("Reminder.t"));}
        }//Not Cancel
       
           }
}//AddEvent
class AddRepeat {
public static  int  CheckRep(PrintWriter out,int EventDay,int EventMonth,int EventYear,int EventHour,int EventMin,Connection theConnection,String RepeatFreq,int No_rep,int RepeatUntilYear,int RepeatUntilMonth,int RepeatUntilDay,String RepeatWeek,String RepeatUntil,String UserID,String []DayName)
     {  String Freq = RepeatWeek; 
         int UntilDay = 0;
         int UntilMonth = 0;
         int UntilYear = 0;
         boolean checkrep = true;
         //out.println(RepeatUntilYear);
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
          if (!checkagain) {
            try{       Statement  theStatement=theConnection.createStatement();
                         theStatement.executeQuery(
                                                       "INSERT INTO repeat"
                                                       +"(no_rep,id,until,freq_rep)"
                                                       +" values(no_rep.nextval,' "+UserID+"',to_date(' "
                                                        +UntilDay+"/"+UntilMonth+"/"+UntilYear+"','dd/mm/yyyy'),' "+Freq+" ')");       
                           theStatement.close();
                   }   catch (Exception e)   
                                               {  System.out.println(e.getMessage());   }      
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
                                               {  System.out.println(e.getMessage());   }      
                   }//if checkagain
       if (checkagain) No_rep = 1;
       return No_rep;
              }      
         
    }//Repeat Class   
    
 class AddReminder {
    String freq_before ;
 public static  int  CheckRem(int RemindWeek,int RemindDay,int RemindHour ,int RemindMin ,int RemindBefore,int No_rep,PrintWriter out,Connection theConnection,int No_rem,int FbeforeDay,int FbeforeMonth,int FbeforeYear,int FbeforeHour,int FbeforeMin,int  Fbefore2Day,int  Fbefore2Month,int  Fbefore2Year,int Fbefore2Hour,int Fbefore2Min,String RemindPager,String RemindPagerType,int RemindPNum,String RemindPPw,String RemindRePPw,String RemindEmail,String RemindEmailAdd,String RemindMessage,String RemindFrom,String UserID)
 {      if ( ((RemindWeek > 0) || (RemindDay > 0) || (RemindHour >0) || (RemindMin >0)) && (RemindBefore > 0) )
          {   try{  
                          Statement  theStatement=theConnection.createStatement();
                         theStatement.executeQuery(
                                                       "INSERT INTO remind"
                                                       +"(no_rem,id,freq_before,freq_and, PagMob,PagMobnum,password,email,message,sender,root,no_cal)"
                                                       + "values(no_rem.nextval,' "+UserID+"',to_date(' "+FbeforeDay+"/"+FbeforeMonth+"/"+FbeforeYear
                                                       +" "+FbeforeHour+":" +FbeforeMin+"','dd/mm/yyyy hh24:mi'),to_date('"+Fbefore2Day+"/"+Fbefore2Month+"/"+Fbefore2Year+" "
                                                       +Fbefore2Hour+":"+Fbefore2Min+
                                                       "','dd/mm/yyyy hh24:mi'),'"
                                                       +RemindPagerType+"','"+RemindPNum+"','"+RemindPPw+"','"+RemindEmailAdd+"','" + RemindMessage+"','"+RemindFrom+"',1,1)");
                            theStatement.close();
                     }   catch (Exception e)   
                                               { //res.setContentType("text/html");
                                                   //PrintWriter out = res.getWriter();
                                                   out.println(e.getMessage()); }     
             }//if
             else if     ( ((RemindWeek > 0) || (RemindDay > 0) || (RemindHour >0) || (RemindMin >0)) && (RemindBefore == 0) )
                        {  try{  
                          Statement  theStatement=theConnection.createStatement();
                         theStatement.executeQuery(
                                                       "INSERT INTO remind"
                                                       +"(no_rem,id,freq_before,PagMob,PagMobnum,password,email,message,sender,root,no_cal)"
                                                       + "values(no_rem.nextval,' "+UserID+"',to_date(' "+FbeforeDay+"/"+FbeforeMonth+"/"+FbeforeYear
                                                       +" "+FbeforeHour+":" +FbeforeMin+"','dd/mm/yyyy hh24:mi'),'"
                                                       +RemindPagerType+"','"+RemindPNum+"','"+RemindPPw+"','"+RemindEmailAdd+"','" + RemindMessage+"','"+RemindFrom+"',1,1)");
                            theStatement.close();
                     }   catch (Exception e)   
                                               { //res.setContentType("text/html");
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
                     }   catch (Exception e)   
                                               { //res.setContentType("text/html");
                                                   //PrintWriter out = res.getWriter();
                                                   out.println(e.getMessage()); }     
             }//if
                try{  
                          Statement  theStatement=theConnection.createStatement();
                          ResultSet theResult =     theStatement.executeQuery("select no_rem  from remind  order by no_rem desc"   );
                          while(theResult.next()) 
                          {
                          No_rem = theResult.getInt(1);
                          break;
                          }
                            theStatement.close();
                   }   catch (Exception e)   
                                               {  //res.setContentType("text/html");
                                                 //  PrintWriter out = res.getWriter();
                                                   out.println(e.getMessage()); }   
                       return No_rem ;
                  }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
                     