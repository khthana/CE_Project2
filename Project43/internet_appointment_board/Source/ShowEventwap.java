import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class ShowEventwap extends HttpServlet
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
           if ( UserID==null  ) {  res.sendRedirect(DefaultURL+"/wap/login.wml");  }
           String Nonum =   req.getParameter("n");        
           int NoNum = Integer.parseInt(req.getParameter("n")); 
          session.putValue("Event.No",Nonum);
           res.setContentType("text/vnd.wap.wml");
           PrintWriter out = res.getWriter();
           out.println("<?xml version=\"1.0\"?>");
           out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">"); 
           out.println("<wml> <card id=\"card1\" title=\"Show Event\" ><p align=\"center\" mode=\"nowrap\">");
          
           try{    Class.forName("oracle.jdbc.driver.OracleDriver");
                       theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                      Statement theStatement=theConnection.createStatement();
                      ResultSet theResult = theStatement.executeQuery(
                                                " Select *  from calendar  where id = ' "+UserID+"'  and no_cal = '"+NoNum+"'"  );
                    while (theResult.next())   {
                    	      String title = theResult.getString(5);
                    	      String place = theResult.getString(7);
                    	      String type = theResult.getString(6);
                    	        out.println("<a href=\""+DefaultURL+"/servlet/DeleteEventwap?n="+theResult.getInt(1)+"\">Delete Event </a><br/></p>");
                            out.println("<p  mode=\"nowrap\">");
                    	      out.println("Title: "+CheckInput(title)+"<br/>");
                    	      out.println("Place : "+CheckInput(place)+"<br/>");
                    	      out.println("Type: "+type+"<br/>");
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
                                                            
                                                            DBCalendar.setTime(theResult.getTime(2));
                                                            int DBHour = DBCalendar.get(DBCalendar.HOUR_OF_DAY);
                                                            int DBMin = DBCalendar.get(DBCalendar.MINUTE);
                                                            DB2Calendar.setTime(theResult.getTime(3));
                                                            int DB2Hour = DB2Calendar.get(DB2Calendar.HOUR_OF_DAY);
                                                            int DB2Min = DB2Calendar.get(DB2Calendar.MINUTE);
                                                            
                               out.println("StartEvent : "+DBDate+" "+MonthName[DBMonth]+" "+DBYear+"<br/>");
                               out.print("StartTime: "+DBHour+":");
                               if (DBMin<10) out.print("0");
                               out.println(DBMin+"<br/>");
                               out.println("UntilEvent : "+DB2Date+" "+MonthName[DB2Month]+" "+DB2Year+"<br/>");
                               out.print("UntilTime: "+DB2Hour+":");
                               if (DB2Min<10) out.print("0");
                               out.println(DB2Min+"<br/>");
                                                                     }//while
                        theStatement.close();//Close statement
                        theConnection.close();
                   }   catch (Exception e)   {
                       out.println(e.getMessage()); } 
                       out.println("</p><do type =\"prev\"><prev/></do>");
                       out.println("</card></wml>");
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
     
       }