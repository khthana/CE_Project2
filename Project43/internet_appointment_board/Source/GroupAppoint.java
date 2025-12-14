import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.lang.String;
public class GroupAppoint  extends HttpServlet
    {   String DefaultURL="http://161.246.5.233:8080/planny"; 
         Connection theConnection;
         protected void doPost(HttpServletRequest req , HttpServletResponse res) throws ServletException, IOException
         {   HttpSession session = req.getSession(true);
              String UserID = (String)session.getValue("login.username");	
              if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
              else session.putValue("login.username",UserID);
              
              
              //int GASelect = Integer.parseInt(req.getParameter("GASelect"));
              String [ ]MemName = req.getParameterValues("member");  
              
               res.setContentType("text/html");
               PrintWriter out = res.getWriter();
              //for(int i=0;i<MemName.length;i++) 
              //out.println(MemName[i]);
              String Title = req.getParameter("Title");
              String Type = req.getParameter("Type");
              String GATitle = req.getParameter("GATitle");
              String GAPlace = req.getParameter("GAPlace");
              String GAType = req.getParameter("GAType");
              int GDay    = Integer.parseInt(req.getParameter("GADay"));
              int GMonth = Integer.parseInt(req.getParameter("GAMonth"));
              int GYear   = Integer.parseInt(req.getParameter("GAYear"));
              int GHour   = Integer.parseInt(req.getParameter("GAHour"));
              int GMin     = Integer.parseInt(req.getParameter("GAMin"));
               int GAF2Day    = Integer.parseInt(req.getParameter("GAFDay"));
              int GAF2Month = Integer.parseInt(req.getParameter("GAFMonth"));
              int GAF2Year   = Integer.parseInt(req.getParameter("GAFYear"));
              int GAF2Hour   = Integer.parseInt(req.getParameter("GAFHour"));
              int GAF2Min     = Integer.parseInt(req.getParameter("GAFMin"));
              String GANote = req.getParameter("GANote");
              String GAForm = req.getParameter("GAFrom");
              String Submit = req.getParameter("Submit");
              String Another = req.getParameter("SubmitAnother");
              //String Cancel = req.getParameter("Cancel");
              int No = 0;
              String MemID="";
              Calendar GCalendar = new GregorianCalendar(GYear,GMonth,GDay,GHour,GMin);
              int GADay = GCalendar.get(GCalendar.DAY_OF_MONTH);
              int GAMonth = GCalendar.get(GCalendar.MONTH)+1;
              int GAYear = GCalendar.get(GCalendar.YEAR);
              int GAHour = GCalendar.get(GCalendar.HOUR_OF_DAY);
              int GAMin = GCalendar.get(GCalendar.MINUTE);
               Calendar GCalendarF = new GregorianCalendar(GAF2Year,GAF2Month,GAF2Day,GAF2Hour,GAF2Min);
              int GAFDay = GCalendarF.get(GCalendarF.DAY_OF_MONTH);
              int GAFMonth = GCalendarF.get(GCalendarF.MONTH)+1;
              int GAFYear = GCalendarF.get(GCalendarF.YEAR);
              int GAFHour = GCalendarF.get(GCalendarF.HOUR_OF_DAY);
              int GAFMin = GCalendarF.get(GCalendarF.MINUTE);
                if (GATitle.equals("")) GATitle= "No Title";
                if (GAType.equals("")) GAType = "other";  
                  if (GAPlace.equals(""))GAPlace= "No Place";
                 if (GANote.equals("")) GANote = "other"; 
                 if (GAForm.equals("")) GAForm = UserID; 
                  try{    Class.forName("oracle.jdbc.driver.OracleDriver");
                                     theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                 }  catch (Exception e) {    res.setContentType("text/html");
                                                                                  //PrintWriter out = res.getWriter();
                                 	                                       out.println(e.getMessage()); }
               int  []NoNum=new int[MemName.length];
               //int Temp =0;
               for(int i=0;i<MemName.length;i++) {                            
                   try{    Statement  theStatement=theConnection.createStatement();      
                              ResultSet theResult = theStatement.executeQuery(    
                              "select no_mem  from member where groupname='"+Title+"'"+
                              " and grouptype = '"+Type+"'  and idmem = '"+MemName[i]+"'"+
                              " and id =' "+UserID+"'");
                              while(theResult.next())
                              {  NoNum[i]=theResult.getInt(1); }
                           theStatement.close();//Close statement
                           theResult.close();
                        }   catch (Exception e)   
                                               {  res.setContentType("text/html");
                                                   //PrintWriter out = res.getWriter();
                                                   out.println(e.getMessage()); }             	 
                           }//for
                         //  out.println("n"+MemName[0]+"n<br>");
                        //   for(int i=0;i<NoNum.length;i++) out.println("NoNum = "+NoNum[i]+"<br>");
                           
              for(int i=0;i<NoNum.length;i++)
              {   try{    Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                               "insert into groupcal values(no_group.nextval,"+NoNum[i]+",' "+UserID+"')");
                         theStatement.close();//Close statement
                      }   catch (Exception e)   
                                               {  res.setContentType("text/html");
                                                   //PrintWriter out = res.getWriter();
                                                   out.println(e.getMessage()); } 
                  try{    Statement  theStatement=theConnection.createStatement();      
                             ResultSet theResult = theStatement.executeQuery(    
                            "select no_group from groupcal  where no_mem="+NoNum[i]+" order by no_group DESC");
                             while (theResult.next()) 
                             {  No= theResult.getInt(1);     
                                 break;  }
                             theStatement.close();//Close statement
                         }   catch (Exception e)   
                                    {  res.setContentType("text/html");
                                        //PrintWriter out = res.getWriter();
                                         out.println(e.getMessage()); } 
           
          
                                            
            try{    Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                         "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,no_rep,no_rem,no_group,from_gr,check_mode,freq_rep)"
                                                           + "values( no_cal.nextval, to_date('"+GADay+"/" +GAMonth+"/"+GAYear+"  "
                                                           +GAHour+":"+GAMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+GAFDay+"/"+GAFMonth+"/"+GAFYear+ " "+ GAFHour+":"+GAFMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +GATitle+"','"+GAType+"','"+GAPlace+"','"+GANote+"',1,1,"+No+",'"+GAForm+"',2"
                                                           +", to_date('"+GADay+"/" +GAMonth+"/"+GAYear+"  "
                                                           +GAHour+":"+GAMin+ "','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                    }   catch (Exception e)   
                                               { res.setContentType("text/html");
                                                   //PrintWriter out = res.getWriter();
                                                   out.println(e.getMessage()); } 
                                                   
              try{    Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                         "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,no_rep,no_rem,no_group,from_gr,check_mode,freq_rep)"
                                                           + "values( no_cal.nextval, to_date('"+GADay+"/" +GAMonth+"/"+GAYear+"  "
                                                           +GAHour+":"+GAMin+ "','dd/mm/yyyy hh24:mi'),'"+MemName[i]+"'"+
                                                           ",to_date('"+GAFDay+"/"+GAFMonth+"/"+GAFYear+ " "+ GAFHour+":"+GAFMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +GATitle+"','"+GAType+"','"+GAPlace+"','"+GANote+"',1,1,"+No+",'"+GAForm+"',2"
                                                            +", to_date('"+GADay+"/" +GAMonth+"/"+GAYear+"  "
                                                           +GAHour+":"+GAMin+ "','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                  // theConnection.close(); 
                           
                           }   catch (Exception e)   
                                               { res.setContentType("text/html");
                                                   //PrintWriter out = res.getWriter();
                                                   out.println(e.getMessage()); } 
                              } //for                     
                    try{theConnection.close();}                            
                    catch (Exception e)   
                                               { res.setContentType("text/html");
                                                   //PrintWriter out = res.getWriter();
                                                   out.println(e.getMessage()); } 
                                                
            if(  Submit != null  )  {res.sendRedirect(DefaultURL+"/servlet/gCalendar");}
               else if (Another != null) { res.sendRedirect(DefaultURL+"/servlet/ShowUpdateGroup?m="+NoNum[0]);}
                       //else if (Cancel != null)res.sendRedirect(DefaultURL+"/servlet/gCalendar");       
                       
          }
     } 
     
     
                            
  