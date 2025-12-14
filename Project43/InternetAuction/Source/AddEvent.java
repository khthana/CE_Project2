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
     protected  void  doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
        {   HttpSession session = req.getSession(true);
            String  UserID = session.getValue("login.username").toString();	
            if ( session.getValue("login.username")==null  ) {  res.sendRedirect(DefaultURL);  }
               else { session.putValue("login.username",session.getValue("login.username"));  }
           /* res.setContentType("text/html");
            PrintWriter out = res.getWriter();*/
            boolean checkFinal  = true;
            String Back  = req.getParameter("Back");  if (  Back != null  )   {res.sendRedirect(DefaultURL+"/servlet/mCalendar"); } else  {  //Not Cancel 
            String EventTitle                       = req.getParameter("ETitle");
            String EventType                       = req.getParameter("TypeReminder");
            String EventPlace                    = req.getParameter("EPlace");
            String  EventTime      =  req.getParameter("ETime");
            String EventFinalTime = req.getParameter("EFB");
            String EventSharing        = req.getParameter("ESharing");
            String  EventNote          = req.getParameter("ENote");
            
            String RepeatFreq              = req.getParameter("RepeatB");
            String RepeatWeek               = req.getParameter("RepeatL1");
            String RepeatNum         = req.getParameter("RepeatL21");
            String RepeatNumWeek                    = req.getParameter("RepeatL22");
            String RepeatOrder              = req.getParameter("RepeatL31");
            String RepeatOrWeek              = req.getParameter("RepeatL32");
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
            if (!RepeatFreq.equals("NoRep")) No_rep = AddRepeat.CheckRep(theConnection,RepeatFreq,No_rep,RepeatUntilYear,RepeatUntilMonth,RepeatUntilDay,RepeatWeek,RepeatNum,RepeatOrder,RepeatNumWeek,RepeatOrWeek,RepeatUntil,UserID);
           
           /*---------------------------------------------------------------------------Rem---------------------------------------------------------------------*/
           
           
           boolean CheckRem = false;
           int RemindPNum = 0;
           if (req.getParameter("PNumber").equals("") )
                {  RemindPNum = 0 ;
                    CheckRem = true;}
                else {    RemindPNum =  Integer.parseInt(req.getParameter("PNumber")); } 
           if  (RemindPager==null)  CheckRem= true;
           if (RemindPagerType.equals("162")) {
               if  ( ! (( RemindPPw.equals(RemindRePPw) ) && (!RemindPPw.equals("")) ) )  CheckRem = true; 
              }
           
           
                         { RemindPNum = 0;
                           RemindPagerType="No Type";
                           RemindPPw = "NO Password";
                         }                                       
                if ((RemindEmail==null) || (RemindEmailAdd.equals(""))) RemindEmailAdd="No Email";
                 
          
           if ( !RemindFreq.equals("NoRem"))
            {
          Calendar RemCalendar = new GregorianCalendar(EventYear,EventMonth-1,EventDay,EventHour,EventMin);
        
          
          RemCalendar.add(RemCalendar.DATE,-(RemindWeek*7));//Add Week
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
       
          No_rem = AddReminder.CheckRem(theConnection,No_rem,FbeforeDay, FbeforeMonth,FbeforeYear,FbeforeHour,FbeforeMin,Fbefore2Day,Fbefore2Month,Fbefore2Year,Fbefore2Hour,Fbefore2Min,RemindPager,RemindPagerType,RemindPNum,RemindPPw,RemindRePPw,RemindEmail,RemindEmailAdd,RemindMessage,RemindFrom,UserID);
        }
        
               try{    
                          Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                                       "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,safe_mode,no_rep,no_rem,no_group)"
                                                           + "values( no_cal.nextval,to_date('"+EventDay+"/" +EventMonth+"/"+EventYear+"  "
                                                           +EventHour+":"+EventMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+EventEndDay+"/"+EventEndMonth+"/"+EventEndYear+ " "+ EventEndHour+":"+EventEndMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +EventTitle+"','"+EventType+"','"+EventPlace+"','"+EventNote+"','"+EventSharing+"','"+No_rep+"','"+No_rem+"',1)");
                                    theStatement.close();//Close statement
                                   theConnection.close(); 
                             }   catch (Exception e)   
                                               { res.setContentType("text/html");
                                                   PrintWriter out = res.getWriter();
                                                   out.println(e.getMessage()); } 
           }//checkFinal 
    if(  Save != null  )        {res.sendRedirect(DefaultURL+"/servlet/mCalendar?t="+session.getValue("Reminder.t")+"&s=0" );}
               else if (SaveAnother != null) { res.sendRedirect(DefaultURL+"/servlet/Reminder?t="+session.getValue("Reminder.t"));}
                }//Not Cancel
           }
}//AddEvent
class AddRepeat {
public static  int  CheckRep(Connection theConnection,String RepeatFreq,int No_rep,int RepeatUntilYear,int RepeatUntilMonth,int RepeatUntilDay,String RepeatWeek,String RepeatNum,String RepeatOrder,String RepeatNumWeek,String RepeatOrWeek,String RepeatUntil,String UserID)
     {  String Freq = RepeatWeek; 
         int UntilDay;
         int UntilMonth;
         int UntilYear;
          if(RepeatFreq.equals("RepWeek")) Freq= RepeatWeek;
          if(RepeatFreq.equals("RepNum"))  Freq= RepeatNum+"/"+RepeatNumWeek;
          if(RepeatFreq.equals("RepOrder"))  Freq= RepeatOrder +"/"+RepeatOrWeek;
          if(RepeatUntil.equals("Until")) {  UntilDay = RepeatUntilDay;
                                                                         UntilMonth = RepeatUntilMonth;
                                                                         UntilYear =   RepeatUntilYear;
                                                                      }
            else {   UntilDay = 31;
                          UntilMonth = 12;
                          UntilYear = 2003;
                      }     
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
               return No_rep;
        }       
    }//Repeat Class   
    
 class AddReminder {
    String freq_before ;
 public static  int  CheckRem(Connection theConnection,int No_rem,int FbeforeDay,int FbeforeMonth,int FbeforeYear,int FbeforeHour,int FbeforeMin,int  Fbefore2Day,int  Fbefore2Month,int  Fbefore2Year,int Fbefore2Hour,int Fbefore2Min,String RemindPager,String RemindPagerType,int RemindPNum,String RemindPPw,String RemindRePPw,String RemindEmail,String RemindEmailAdd,String RemindMessage,String RemindFrom,String UserID)
 {   
                if  ( ((RemindPager==null) && ( RemindPPw.equals(RemindRePPw) )) || (RemindPPw.equals("")) )
                         { RemindPNum = 0;
                           RemindPagerType="No Type";
                           RemindPPw = "NO Password";
                         }                                       
                if ((RemindEmail==null) || (RemindEmailAdd.equals(""))) RemindEmailAdd="No Email";
                 try{  
                          Statement  theStatement=theConnection.createStatement();
                         theStatement.executeQuery(
                                                       "INSERT INTO remind"
                                                       +"(no_rem,id,freq_before,freq_and,PagMob,PagMobnum,password,email,message,sender)"
                                                       + "values(no_rem.nextval,' "+UserID+"',to_date(' "+FbeforeDay+"/"+FbeforeMonth+"/"+FbeforeYear
                                                       +" "+FbeforeHour+":" +FbeforeMin+"','dd/mm/yyyy hh24:mi'),to_date('"+Fbefore2Day+"/"+Fbefore2Month+"/"+Fbefore2Year+" "
                                                       +Fbefore2Hour+":"+Fbefore2Min+
                                                       "','dd/mm/yyyy hh24:mi'),' "+RemindPagerType+" ',' " +RemindPNum+" ',' "+RemindPPw+" ',' "
                                                      +RemindEmailAdd+" ',' "    + RemindMessage+" ',' "+RemindFrom+"')");
                            theStatement.close();
                     }   catch (Exception e)   
                                               { System.out.println(e.getMessage());   }           
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
                                               {  System.out.println(e.getMessage());   }    
                       return No_rem ;
          
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
                     