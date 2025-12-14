import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.net.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
public class Insertwap extends HttpServlet
{    String DefaultURL = "http://161.246.5.233:8080/planny";
      protected  void  doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
 {          HttpSession session = req.getSession(true);
            String  UserID = session.getValue("login.username").toString();	
             if ( UserID==null  ) {  res.sendRedirect(DefaultURL+"/wap/login.wml");  }
             Connection theConnection;
                 String Title      = req.getParameter("title");
                 String Type      = req.getParameter("type");
                 int Until             =  Integer.parseInt(req.getParameter("until"));
                 String  ETime = (String)session.getValue("Event.TimeE");
                 int  CurDate      =  Calendar.getInstance().get(Calendar.DAY_OF_MONTH); 
                 int  CurMonth   =  Calendar.getInstance().get(Calendar.MONTH); 
                int  CurYear      =  Calendar.getInstance().get(Calendar.YEAR); 
                int  CurHour      =  Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
                int  CurMin      =  Calendar.getInstance().get(Calendar.MINUTE);
                if (ETime!=null) {
                 Date MakeDate = new Date(Long.parseLong(ETime));
                 Calendar GCalendar = new GregorianCalendar();
                 GCalendar.setTime(MakeDate);
                 CurDate = GCalendar.get(GCalendar.DAY_OF_MONTH); 
                 CurMonth = GCalendar.get(GCalendar.MONTH);
                 CurYear = GCalendar.get(GCalendar.YEAR);
                 CurHour = GCalendar.get(GCalendar.HOUR_OF_DAY);
                 CurMin = GCalendar.get(GCalendar.MINUTE);
                }
                 int UntMin = ( Until % 100 );
                 int UntHour = ((Until - UntMin)/100);
                   int StartDay;
                 int StartMon;
                 int StartYear;
                 int StartHour;
                 int StartMin;
                 int FinalHour;
                 int FinalMin;
                 int FinalDay;
                 int FinalMonth;
                 int FinalYear;
                 if (Title.equals("")) Title= "No Title";
                 if (Type.equals("")) Type = "other";      
                
                 	
                Calendar DBCalendar = new GregorianCalendar(CurYear,CurMonth,CurDate,CurHour,CurMin);   
                StartDay = DBCalendar.get(DBCalendar.DAY_OF_MONTH);
                StartMon = DBCalendar.get(DBCalendar.MONTH)+1;
                StartHour = DBCalendar.get(DBCalendar.HOUR_OF_DAY);
                StartMin = DBCalendar.get(DBCalendar.MINUTE);
                StartYear = DBCalendar.get(DBCalendar.YEAR);
            
                 if ( (UntHour<CurHour) || ( ( UntHour==CurHour) && (UntMin < CurMin))  ){ 
                 	DBCalendar.add(DBCalendar.DATE,1);
                 	FinalDay = DBCalendar.get(DBCalendar.DAY_OF_MONTH);
                     FinalMonth = DBCalendar.get(DBCalendar.MONTH)+1;
                     FinalYear = DBCalendar.get(DBCalendar.YEAR);
                     FinalHour = UntHour;
                     FinalMin = UntMin;
                }
                else{
                 Calendar DB2Calendar = new GregorianCalendar(CurYear,CurMonth,CurDate,UntHour,UntMin); 
                 FinalDay = DB2Calendar.get(DB2Calendar.DAY_OF_MONTH);
                 FinalMonth = DB2Calendar.get(DB2Calendar.MONTH)+1;
                 FinalHour = DB2Calendar.get(DB2Calendar.HOUR_OF_DAY);
                 FinalMin = DB2Calendar.get(DB2Calendar.MINUTE);
                 FinalYear =DB2Calendar.get(DB2Calendar.YEAR);
                 }
                 
               try{
                                                //Loading Sun's JDBC ODBC Driver   
                                               Class.forName("oracle.jdbc.driver.OracleDriver");
                                               //Connect to emaildb Data source
                                               theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                               //Select all records from emaillists table.
                                               Statement  theStatement=theConnection.createStatement();
                                                  theStatement.executeQuery(
                                                       "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,no_rep,no_rem,no_group,from_gr,freq_rep)"
                                                           + "values( no_cal.nextval, to_date(' "+StartDay+"/"
                                                           +StartMon+"/"+StartYear+ " "+StartHour+":"+StartMin+"','dd/mm/yyyy hh24:mi'),' "
                                                           +UserID+"',to_date(' "+FinalDay+"/"+FinalMonth+"/"+FinalYear+ " "
                                                           +FinalHour+"."+FinalMin+"','dd/mm/yyyy hh24:mi'),'"
                                                           +Title+"','"+Type+"',1,1,1,' Elmo', to_date(' "+StartDay+"/"
                                                           +StartMon+"/"+StartYear+ " "+StartHour+":"+StartMin+"','dd/mm/yyyy hh24:mi'))");
                                                          session.putValue("login.title",Title);
                                                          session.putValue("login.day",StartDay+"/"+StartMon+"/2001");      
                                                        theStatement.close();//Close statement
                                                       theConnection.close(); 
                                                     }   catch (Exception e)  
                                               {  res.setContentType("text/vnd.wap.wml");
                                                  PrintWriter out = res.getWriter();
                                                  out.println(e.getMessage()); 
                                               }
                             
                     res.sendRedirect(DefaultURL+ "/servlet/mainwap");
                     
                     }
}