import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.lang.String;
public class Appointeventwap  extends HttpServlet
    {   String DefaultURL="http://161.246.5.233:8080/planny"; 
         Connection theConnection;
         protected void doPost(HttpServletRequest req , HttpServletResponse res) throws ServletException, IOException
         {   HttpSession session = req.getSession(true);
              String UserID = (String)session.getValue("login.username");	
              if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
              else session.putValue("lgoin.username",UserID);
                    String NoNum= (String)session.getValue("login.appointg");	
                  int NoMem = Integer.parseInt(NoNum);
                  String Title      = req.getParameter("title");
                 String Type      = req.getParameter("type");
                 String Place      = req.getParameter("place");
                   String GAForm      = req.getParameter("fromgr");
                   String title = (String)session.getValue("login.groupname");
               String type = (String)session.getValue("login.grouptype");
                   int No = 0;
              String MemID="";
                 int StartMon1      = Integer.parseInt(req.getParameter("startmonth"));
                 int StartDay1      = Integer.parseInt(req.getParameter("startday"));
                 int StartYear1      = Integer.parseInt(req.getParameter("startyear"));
                 int StartTime1  = Integer.parseInt(req.getParameter("starttime"));
                   int StartMon2      = Integer.parseInt(req.getParameter("finalmonth"));
                 int StartDay2      = Integer.parseInt(req.getParameter("finalday"));
                 int StartYear2      = Integer.parseInt(req.getParameter("finalyear"));
                 int StartTime2  = Integer.parseInt(req.getParameter("finaltime"));
                 String SMode = "Private";
                 //*******Cut String
                 int StartMin1 = ( StartTime1 % 100 );
                 int StartHour1 = ((StartTime1 - StartMin1)/100 );
                //*************************
                        int StartMin2 = ( StartTime2 % 100 );
                 int StartHour2 = ((StartTime2 - StartMin2)/100 );
                   
                   
                   int StartDay;
                 int StartMon;
                 int StartYear;
                 int StartHour;
                 int StartMin;
                    int FinalDay;
                 int FinalMon;
                 int FinalYear;
                 int FinalHour;
                 int FinalMin;
                   if (Place.equals("")) Place= "No Place";
                   if (Title.equals("")) Title= "No Title";
                 if (Type.equals("")) Type = "other";          
                  if (GAForm.equals("")) GAForm = UserID; 
                 String GANote = "other";  
                 Calendar DBCalendar = new GregorianCalendar(StartYear1,StartMon1-1,StartDay1,StartHour1,StartMin1);   
                StartDay = DBCalendar.get(DBCalendar.DAY_OF_MONTH);
                StartMon = DBCalendar.get(DBCalendar.MONTH)+1;
                StartHour = DBCalendar.get(DBCalendar.HOUR_OF_DAY);
                StartMin = DBCalendar.get(DBCalendar.MINUTE);
                StartYear = DBCalendar.get(DBCalendar.YEAR);
                
                  Calendar DB2Calendar = new GregorianCalendar(StartYear2,StartMon2-1,StartDay2,StartHour2,StartMin2);   
                FinalDay = DB2Calendar.get(DB2Calendar.DAY_OF_MONTH);
                FinalMon = DB2Calendar.get(DB2Calendar.MONTH)+1;
                FinalHour = DB2Calendar.get(DB2Calendar.HOUR_OF_DAY);
                FinalMin = DB2Calendar.get(DB2Calendar.MINUTE);
                FinalYear = DB2Calendar.get(DB2Calendar.YEAR);
                boolean check = false;
               int count = 0;
              boolean checkwhile = false;
             PrintWriter out = res.getWriter();
            
                   try{    Class.forName("oracle.jdbc.driver.OracleDriver");
                                     theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                 }  catch (Exception e) {       res.setContentType("text/vnd.wap.wml");
                                                                                   //PrintWriter out = res.getWriter();
                                 	                                       out.println(e.getMessage()); }
               if (NoMem == 0)
                { try{    Statement  theStatement=theConnection.createStatement();      
                             ResultSet theResult = theStatement.executeQuery(    
               	        "select count(*) from member where groupname ='"+title+"' and grouptype='"+type+"' and idmem <> id and id = ' "+UserID+"'");
                              while (theResult.next())
                              { count = theResult.getInt(1); }
                              theResult.close();
              	        theStatement.close();
               	}catch (Exception e) {       res.setContentType("text/vnd.wap.wml");
                                                                                  // PrintWriter out = res.getWriter();
                                 	                                       out.println(e.getMessage()); }
                  for (int j=1;j <= count; j++)
                 {   checkwhile = false;
                 	    try{    Statement  theStatement=theConnection.createStatement();      
                                  ResultSet theResult = theStatement.executeQuery(    
               	            "select no_mem,idmem from member where groupname ='"+title+"' and grouptype='"+type+"' and idmem <> id and id = ' "+UserID+"' order by no_mem");
               	            while( (theResult.next()) && (!checkwhile))
               	            { if (NoMem < theResult.getInt(1)) {
               	               NoMem = theResult.getInt(1);
               	              MemID = theResult.getString(2); 
               	              checkwhile = true;}
               	              //  PrintWriter out = res.getWriter();
               	          }//while 
               	          theResult.close();
               	          theStatement.close();
               	}catch (Exception e) {       res.setContentType("text/vnd.wap.wml");
                              //                                                     PrintWriter out = res.getWriter();
                                 	                                       out.println(e.getMessage()); }
               	    try{   Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                               "insert into groupcal values(no_group.nextval,"+NoMem+",' "+UserID+"')");
                         theStatement.close();//Close statement
                      }   catch (Exception e)   
                                               {    res.setContentType("text/vnd.wap.wml");
                                  //                  PrintWriter out = res.getWriter();
                                                   out.println(e.getMessage()); } 
                                    
             try{    Statement  theStatement=theConnection.createStatement();      
                         ResultSet theResult = theStatement.executeQuery(    
                           "select no_group from groupcal order by no_group desc");
                           while (theResult.next()){ No= theResult.getInt(1);     
                           		           break; }
                         theStatement.close();//Close statement
                     }   catch (Exception e)   
                                        {    res.setContentType("text/vnd.wap.wml");
                                      //       PrintWriter out = res.getWriter();
                                            out.println(e.getMessage()); } 
                                                    
           try{    Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                         "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,no_rep,no_rem,no_group,from_gr,check_mode,freq_rep)"
                                                           + "values( no_cal.nextval, to_date('"+StartDay+"/" +StartMon+"/"+StartYear+"  "
                                                           +StartHour+":"+StartMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+FinalDay+"/"+FinalMon+"/"+FinalYear+ " "+ FinalHour+":"+FinalMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +Title+"','"+Type+"','"+Place+"','"+GANote+"',1,1,"+No+",'"+GAForm+"',2,"+
                                                           " to_date('"+StartDay+"/" +StartMon+"/"+StartYear+"  "
                                                           +StartHour+":"+StartMin+ "','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                    }   catch (Exception e)   
                                               {  res.setContentType("text/vnd.wap.wml");
                                          //         PrintWriter out = res.getWriter();
                                                   out.println(e.getMessage()); } 
                                                     
              try{    Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                         "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,no_rep,no_rem,no_group,from_gr,check_mode,freq_rep)"
                                                           + "values( no_cal.nextval, to_date('"+StartDay+"/" +StartMon+"/"+StartYear+"  "
                                                           +StartHour+":"+StartMin+ "','dd/mm/yyyy hh24:mi'),'"+MemID+"'"+
                                                           ",to_date('"+FinalDay+"/"+FinalMon+"/"+FinalYear+ " "+ FinalHour+":"+FinalMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +Title+"','"+Type+"','"+Place+"','"+GANote+"',1,1,"+No+",'"+GAForm+"',2,"+
                                                           " to_date('"+StartDay+"/" +StartMon+"/"+StartYear+"  "
                                                           +StartHour+":"+StartMin+ "','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                 //  theConnection.close(); 
                             }   catch (Exception e)   
                                               { res.setContentType("text/vnd.wap.wml");
                                              //     PrintWriter out = res.getWriter();
                                                   out.println(e.getMessage()); } 
               	}//for
               	 try { theConnection.close();
            } catch(Exception e)   
                                               { res.setContentType("text/vnd.wap.wml");
                                              //     PrintWriter out = res.getWriter();
                                                   out.println(e.getMessage()); } 
              }//if NoMem ==0 	
              else {
               try{    Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                                               "insert into groupcal values(no_group.nextval,"+NoMem+",' "+UserID+"')");
                         theStatement.close();//Close statement
                      }   catch (Exception e)   
                                               {    res.setContentType("text/vnd.wap.wml");
                                                    //PrintWriter out = res.getWriter();
                                                   out.println(e.getMessage()); } 
             try{    Statement  theStatement=theConnection.createStatement();      
                         ResultSet theResult = theStatement.executeQuery(    
                           "select no_group from groupcal order by no_group desc");
                           while (theResult.next()) { No= theResult.getInt(1);     
                           		          break;}
                         theStatement.close();//Close statement
                     }   catch (Exception e)   
                                        {    res.setContentType("text/vnd.wap.wml");
                                             //PrintWriter out = res.getWriter();
                                            out.println(e.getMessage()); } 
                                            
                                            
                                             res.setContentType("text/vnd.wap.wml");
         
           try{    Statement  theStatement=theConnection.createStatement();      
                         ResultSet theResult = theStatement.executeQuery(    
                         " select  idmem from member where no_mem="+NoMem);
                           while (theResult.next()) MemID= theResult.getString(1);     
                         theStatement.close();//Close statement
                     }   catch (Exception e)   
                                        {  res.setContentType("text/vnd.wap.wml");
                                          //PrintWriter out = res.getWriter();
                                          out.println(e.getMessage()); } 
                                                                             
         
           try{    Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                         "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,no_rep,no_rem,no_group,from_gr,check_mode,freq_rep)"
                                                           + "values( no_cal.nextval, to_date('"+StartDay+"/" +StartMon+"/"+StartYear+"  "
                                                           +StartHour+":"+StartMin+ "','dd/mm/yyyy hh24:mi'),' "+UserID+"'"+
                                                           ",to_date('"+StartDay+"/"+StartMon+"/"+StartYear+ " "+ StartHour+":"+StartMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +Title+"','"+Type+"','"+Place+"','"+GANote+"',1,1,"+No+",'"+GAForm+"',2,"+
                                                           " to_date('"+StartDay+"/" +StartMon+"/"+StartYear+"  "
                                                           +StartHour+":"+StartMin+ "','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                    }   catch (Exception e)   
                                               {  res.setContentType("text/vnd.wap.wml");
                                              //     PrintWriter out = res.getWriter();
                                                   out.println(e.getMessage()); } 
                                                     
              try{    Statement  theStatement=theConnection.createStatement();
                                               theStatement.executeQuery(
                         "INSERT INTO calendar"
                                                           + "(no_cal,time,id,to_time,title,type,place,note,no_rep,no_rem,no_group,from_gr,check_mode,freq_rep)"
                                                           + "values( no_cal.nextval, to_date('"+StartDay+"/" +StartMon+"/"+StartYear+"  "
                                                           +StartHour+":"+StartMin+ "','dd/mm/yyyy hh24:mi'),'"+MemID+"'"+
                                                           ",to_date('"+StartDay+"/"+StartMon+"/"+StartYear+ " "+ StartHour+":"+StartMin+" ','dd/mm/yyyy hh24:mi'),' "
                                                           +Title+"','"+Type+"','"+Place+"','"+GANote+"',1,1,"+No+",'"+GAForm+"',2,"+
                                                           " to_date('"+StartDay+"/" +StartMon+"/"+StartYear+"  "
                                                           +StartHour+":"+StartMin+ "','dd/mm/yyyy hh24:mi'))");
                                    theStatement.close();//Close statement
                                   theConnection.close(); 
                             }   catch (Exception e)   
                                               { res.setContentType("text/vnd.wap.wml");
                                                  // PrintWriter out = res.getWriter();
                                                   out.println(e.getMessage()); } 
                }//else
            res.sendRedirect(DefaultURL+"/servlet/mainwap");
                  
         }
     }
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
        