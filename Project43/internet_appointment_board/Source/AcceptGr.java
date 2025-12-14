import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class AcceptGr extends HttpServlet
 {     Connection theConnection;
       String DefaultURL="http://161.246.5.233:8080/planny";
        protected  void  doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {   String DefaultURL="http://161.246.5.233:8080/planny"; 
         HttpSession session = req.getSession(true);
         String UserID =session.getValue("login.username").toString();
         if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
         String Accept                    = req.getParameter("Accept");
         String Decline                    = req.getParameter("Decline");
         String Cancel                    = req.getParameter("Cancel");
         String From                    = req.getParameter("GAFrom");
         String Title                   = req.getParameter("GATitle");
         String Place                    = req.getParameter("GAPlace");
         String Type                  = req.getParameter("GAType");
        int  SDay                   = Integer.parseInt(req.getParameter("GADay"));
         int  SMonth                   = Integer.parseInt(req.getParameter("GAMonth"));
       int SYear                   = Integer.parseInt(req.getParameter("GAYear"));
         int  SHour                  = Integer.parseInt(req.getParameter("GAHour"));
         int  SMin                  = Integer.parseInt(req.getParameter("GAMin"));
        String  Note                  = req.getParameter("GANote");
             
              int GAF2Day    = Integer.parseInt(req.getParameter("GAFDay"));
              int GAF2Month = Integer.parseInt(req.getParameter("GAFMonth"));
              int GAF2Year   = Integer.parseInt(req.getParameter("GAFYear"));
              int GAF2Hour   = Integer.parseInt(req.getParameter("GAFHour"));
              int GAF2Min     = Integer.parseInt(req.getParameter("GAFMin"));
            if (Title.equals("")) Title= "No Title";
            if (Type.equals("")) Type = "other";    
            if (Place.equals("")) Place = "No Place";
            if (Note.equals("")) Note = "other";
            String Sharing = "Pulic";
               PrintWriter out = res.getWriter(); 
               res.setContentType("text/html");   
             /*  out.println(SDay+"/"+SMonth+"/"+SYear+" "+SHour+":"+SMin);
                out.println(GAF2Day+"/"+GAF2Month+"/"+GAF2Year+" "+GAF2Hour+":"+GAF2Min);*/
            
              Calendar CalendarG = new GregorianCalendar(SYear,(SMonth-1),SDay,SHour,SMin);
                                SDay = CalendarG.get(CalendarG.DAY_OF_MONTH);
                               SMonth = CalendarG.get(CalendarG.MONTH)+1;
                                SYear = CalendarG.get(CalendarG.YEAR);
                                SHour = CalendarG.get(CalendarG.HOUR_OF_DAY);
                                SMin = CalendarG.get(CalendarG.MINUTE);
            
            
            
               Calendar GCalendarF = new GregorianCalendar(GAF2Year,(GAF2Month-1),GAF2Day,GAF2Hour,GAF2Min);
              int GAFDay = GCalendarF.get(GCalendarF.DAY_OF_MONTH);
              int GAFMonth = GCalendarF.get(GCalendarF.MONTH)+1;
              int GAFYear = GCalendarF.get(GCalendarF.YEAR);
              int GAFHour = GCalendarF.get(GCalendarF.HOUR_OF_DAY);
              int GAFMin = GCalendarF.get(GCalendarF.MINUTE);
            
           // out.println(GCalendarF.get(GCalendarF.DAY_OF_MONTH)+"/"+GCalendarF.get(GCalendarF.MONTH)+1+"nut<br>");
            
           
          /*  out.println(SDay+"/"+SMonth+"/"+SYear+" "+SHour+":"+SMin);
                out.println(GAFDay+"/"+GAFMonth+"/"+GAFYear+" "+GAFHour+":"+GAFMin);  */
         int No                   =  Integer.parseInt(req.getParameter("HiddenNo"));
        int NoNum = 0;
          if  (Accept != null ){ 
           	try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                      theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                      Statement  theStatement=theConnection.createStatement();
                      theStatement.executeQuery("update calendar set check_mode= 3 where no_cal="+No);
                       theStatement.close();//Close statement
                      // theConnection.close(); 
                  }   catch (Exception e)  
                                               { //   PrintWriter out = res.getWriter(); 
                                                     res.setContentType("text/html");   
                                                   out.println(e.getMessage()); }
                      
              try{    
                          Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                                       "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,safe_mode,no_rep,no_rem,no_group,freq_rep)"
                                                           + "values( no_cal.nextval,to_date('"+SDay+"/" +SMonth+"/"+SYear+"  "
                                                           +SHour+":"+SMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+GAFDay+"/"+GAFMonth+"/"+GAFYear+ " "+ GAFHour+":"+GAFMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +Title+"','"+Type+"','"+Place+"','"+Note+"','"+Sharing+"',1,1,1,to_date('"+SDay+"/" +SMonth+"/"+SYear+"  "
                                                           +SHour+":"+SMin+ "','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                 }   catch (Exception e)   
                                               {//  PrintWriter out = res.getWriter(); 
                                                     res.setContentType("text/html");    
                                                   out.println(e.getMessage()); }     
                                         
              try{  
                          Statement  theStatement=theConnection.createStatement();
                          ResultSet theResult =     theStatement.executeQuery(
                          "select no_cal from calendar  order by no_cal desc");
                          while (theResult.next())  NoNum = theResult.getInt(1);
                       theStatement.close();//Close statement
                             theResult.close();
                                 }   catch (Exception e)   
                                               {//  PrintWriter out = res.getWriter(); 
                                                     res.setContentType("text/html");    
                                                   out.println(e.getMessage()); }     
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
            Calendar GCalendar = new GregorianCalendar();
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
                                                           +Title+"','"+Type+"','"+Place+"','"+Note+"','"+Sharing+"',1,1,1,to_date('"+LongEventDay+"/" +LongEventMonth+"/"+LongEventYear+"  "
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
                                                           +Title+"','"+Type+"','"+Place+"','"+Note+"','"+Sharing+"',1,1,1,to_date('"+LongEventDay+"/" +LongEventMonth+"/"+LongEventYear+"  "
                                                           +SHour+":"+SMin+"','dd/mm/yyyy hh24:mi'))");
                                                      
                                    theStatement.close();//Close statement
                                 }   catch (Exception e)   
                                               { res.setContentType("text/html");
                                                   out.println(e.getMessage()); }                                      
                                                 }                          	
                              
                         count++;
                         if (count == 50) continue;
                          }//while                         
          
          
          
          
          
          
          
          
              }
               
            if(Decline != null) {
            	try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                      theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                      Statement  theStatement=theConnection.createStatement();
                      theStatement.executeQuery("update calendar set check_mode= 4 where no_cal="+No);
                       theStatement.close();//Close statement
                 // theConnection.close(); 
                  }   catch (Exception e)  
                                               {    //PrintWriter out = res.getWriter(); 
                                                     res.setContentType("text/html");   
                                                   out.println(e.getMessage()); }
               }
            	if (Cancel != null)  {  
            	 try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                                theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
            	          Statement  theStatement=theConnection.createStatement();
                                 theStatement.executeQuery(     
                                 "update calendar set check_mode= 5 where no_cal="+No);
                                   theStatement.close();//Close statement
                                  //  theConnection.close(); 
                                 }   catch (Exception e)  
                                               {  //   PrintWriter out = res.getWriter(); 
                                                     res.setContentType("text/html");  
                                                     out.println(e.getMessage()); }
            		             res.sendRedirect(DefaultURL+"/servlet/gCalendar");
               }
               try { theConnection.close(); }
                catch (Exception e)  
                                               {   //  PrintWriter out = res.getWriter(); 
                                                     res.setContentType("text/html");  
                                                     out.println(e.getMessage()); }
               res.sendRedirect(DefaultURL+"/servlet/gCalendar");
               }
     }