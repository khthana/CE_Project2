import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.net.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
public class QuickAdd extends HttpServlet
{    String DefaultURL = "http://161.246.5.233:8080/planny";
      protected  void  doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
 {          HttpSession session = req.getSession(true);
            String  UserID = session.getValue("login.username").toString();	
             if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
             int QAYear = Calendar.getInstance().get(Calendar.YEAR);
                 
                Connection theConnection;
                 String Title      = req.getParameter("TitleQA");
                 String Type      = req.getParameter("TypeQA");
                 int StartMon      = Integer.parseInt(req.getParameter("StartMonQA"));
                 int StartDay      = Integer.parseInt(req.getParameter("StartDayQA"));
                 int StartHour      = Integer.parseInt(req.getParameter("StartHourQA"));
                 int StartMin      = Integer.parseInt(req.getParameter("StartMinQA"));
                 String FinalMonth1      = req.getParameter("FinalMonthQA");
                 String FinalDay1      = req.getParameter("FinalDayQA");
                 String FinalHour1      = req.getParameter("FinalHourQA");
                 String FinalMin1      = req.getParameter("FinalMinQA");
                 String SMode = "Private";
               
                 int FinalHour;
                 int FinalMin;
                 int FinalDay;
                 int FinalMonth;
                
                 if (FinalHour1.equals(""))  FinalHour = StartHour;
                   else   FinalHour =  Integer.parseInt(FinalHour1);
                 if (FinalMin1.equals("")) FinalMin = StartMin;
                 else    FinalMin   =  Integer.parseInt(FinalMin1);
                 if (FinalDay1.equals("")) FinalDay = StartDay;
                 else    FinalDay = Integer.parseInt(FinalDay1);
                 if (FinalMonth1.equals(""))  FinalMonth = StartMon;
                 else    FinalMonth = Integer.parseInt(FinalMonth1);    
                 if (Title.equals("")) Title= "No Title";
                 if (Type.equals("")) Type = "other";          
                 Calendar DBCalendar = new GregorianCalendar(QAYear,StartMon-1,StartDay,StartHour,StartMin);   
                StartDay = DBCalendar.get(DBCalendar.DAY_OF_MONTH);
                StartMon = DBCalendar.get(DBCalendar.MONTH)+1;
                StartHour = DBCalendar.get(DBCalendar.HOUR_OF_DAY);
                StartMin = DBCalendar.get(DBCalendar.MINUTE);
            
                
                 Calendar DB2Calendar = new GregorianCalendar(QAYear,FinalMonth-1,FinalDay,FinalHour,FinalMin); 
                 FinalDay = DB2Calendar.get(DB2Calendar.DAY_OF_MONTH);
                 FinalMonth = DB2Calendar.get(DB2Calendar.MONTH)+1;
                 FinalHour = DB2Calendar.get(DB2Calendar.HOUR_OF_DAY);
                 FinalMin = DB2Calendar.get(DB2Calendar.MINUTE);
                  if ((DB2Calendar.after(DBCalendar)) ||   (DB2Calendar.equals(DBCalendar)) ) {
               try{
                                                //Loading Sun's JDBC ODBC Driver   
                                               Class.forName("oracle.jdbc.driver.OracleDriver");
                                               //Connect to emaildb Data source
                                               theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                               //Select all records from emaillists table.
                                               Statement  theStatement=theConnection.createStatement();
                                                  theStatement.executeQuery(
                                                       "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,safe_mode,no_rep,no_rem,no_group,from_gr,freq_rep)"
                                                           + "values( no_cal.nextval, to_date(' "+StartDay+"/"
                                                           +StartMon+"/"+QAYear+ " "+StartHour+":"+StartMin+"','dd/mm/yyyy hh24:mi'),' "
                                                           +UserID+"',to_date(' "+FinalDay+"/"+FinalMonth+"/"+QAYear+ " "
                                                           +FinalHour+"."+FinalMin+"','dd/mm/yyyy hh24:mi'),'"
                                                           +Title+"','"+Type+"','"+SMode+"',1,1,1,' Elmo',to_date(' "+StartDay+"/"
                                                           +StartMon+"/"+QAYear+ " "+StartHour+":"+StartMin+"','dd/mm/yyyy hh24:mi'))");
                                                          session.putValue("login.title",Title);
                                                          session.putValue("login.day",StartDay+"/"+StartMon+"/2001");      
                                                        theStatement.close();//Close statement
                                                       theConnection.close(); 
                                                     }   catch (Exception e)  
                                               {  res.setContentType("text/html");
                                                  PrintWriter out = res.getWriter();
                                                  out.println(e.getMessage()); 
                                               }
                      }//if
                      else session.putValue("login.message","<font size=2 Color=red><b>Invalid Add Time QuickAdd</b></font>");
                     String CheckQA = "Add";
                    session.putValue("login.done",CheckQA); 	
                   res.sendRedirect(DefaultURL+ "/servlet/mCalendar");
                     }
}