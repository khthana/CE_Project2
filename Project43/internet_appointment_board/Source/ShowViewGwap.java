import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ShowViewGwap extends HttpServlet
 {   String DefaultURL="http://161.246.5.233:8080/planny"; 
      static final int  CurDate      =  Calendar.getInstance().get(Calendar.DAY_OF_MONTH); 
      static final int  CurMonth   =  Calendar.getInstance().get(Calendar.MONTH); 
      static final int  CurYear      =  Calendar.getInstance().get(Calendar.YEAR); 
      Connection theConnection;
      protected void doGet(HttpServletRequest req , HttpServletResponse res) throws ServletException, IOException
       {    HttpSession session = req.getSession(true);
             String UserID = (String)session.getValue("login.username");	
             if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
               else session.putValue("lgoin.username",UserID);
               res.setContentType("text/vnd.wap.wml");
               PrintWriter out = res.getWriter();out.println("<?xml version=\"1.0\"?>");
               out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">");
               out.println("<wml><card   title=\"View Calendar\"><p align =\"center\" mode=\"nowrap\">");
               out.println("<small><table columns=\"4\"><tr><td>No.</td><td>Title</td><td>Status</td><td>From</td></tr>");
                  Calendar CurCalendar = new GregorianCalendar(CurYear,CurMonth,CurDate);
           
            int no_count = 0;
            boolean checkresult = false;
           boolean check1 =false;
           boolean check2= false;
           int no_groupOK=0;
          String title="";
           String from="";
           int Num=1;
           int DBYear =0;
           int DBMonth=0;
           int DBDate=0;
           String fromid="";
           int no = 0;
          int nomem = 0;
           String IDMem = "";
             try{    Class.forName("oracle.jdbc.driver.OracleDriver");
                                     theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                    }  catch (Exception e) { out.println(e.getMessage()); }
            
             try{    Statement  theStatement=theConnection.createStatement();      
                         ResultSet theResult = theStatement.executeQuery(    
                         "select  count(*)  from calendar where check_mode = 3 and id<>' "+UserID+"' order by no_group");
                    while (theResult.next()){  no_count = theResult.getInt(1); }
                   theStatement.close();
                 }  catch (Exception e) { out.println(e.getMessage()); }         
            //out.println(no_count);   
             for (int i=1;i<=no_count;i++) {
             	check1=false;
             	check2=false;
                  try{    Statement  theStatement=theConnection.createStatement();      
                             ResultSet theResult = theStatement.executeQuery(    
                             "select  no_group,title,from_gr,time,id,no_cal   from calendar where check_mode = 3 and id<>' "+UserID+"' order by no_group");
                                 while (theResult.next() && (!check2)){ 
                         	  if (no_groupOK==0)  { no_groupOK=theResult.getInt(1);
                         	                                             title = theResult.getString(2);
                         	                                             from = theResult.getString(3);
                         	                 Calendar DBCalendar = new GregorianCalendar();
                                                            DBCalendar.setTime(theResult.getDate(4));
                                                            DBDate = DBCalendar.get(DBCalendar.DATE);
                                                            DBMonth = DBCalendar.get(DBCalendar.MONTH)+1;
                                                            DBYear = DBCalendar.get(DBCalendar.YEAR); 
                                                           check2=true;
                                                           fromid=theResult.getString(5);
                                                           no= theResult.getInt(6);
                                                           }
                         	  else  { if  ( (theResult.getInt(1) > no_groupOK) && (!check1))
                         	                    { no_groupOK=theResult.getInt(1); 
                         	                                                                                             title = theResult.getString(2);
                         	                                                                                              from = theResult.getString(3);
                         	                                                                                               check1=true; 
                         	                  Calendar DBCalendar = new GregorianCalendar();
                                                            DBCalendar.setTime(theResult.getDate(4));
                                                             DBDate = DBCalendar.get(DBCalendar.DATE);
                                                             DBMonth = DBCalendar.get(DBCalendar.MONTH)+1;
                                                             DBYear = DBCalendar.get(DBCalendar.YEAR);
                                                              fromid=theResult.getString(5);
                                                               no= theResult.getInt(6);
                                                            }         
                                                        }                                          
                         	   }//while
                  theStatement.close();
                }  catch (Exception e) { out.println(e.getMessage()); }     
                   Calendar EventCalendar = new GregorianCalendar(DBYear,DBMonth,DBDate);  
                 try{   Statement  theStatement=theConnection.createStatement();      
                          ResultSet theResult = theStatement.executeQuery(    
                         "select  id,no_mem  from groupcal  where no_group="+no_groupOK );
                            while (theResult.next())
                                { nomem = theResult.getInt(2);
                                   IDMem = theResult.getString(1);
                                   if  ((theResult.getString(1).equals(" "+UserID)) &&( ( EventCalendar.after(CurCalendar))  ||   (EventCalendar.equals(CurCalendar)) ))  
                                      {  out.println("<tr><td>"+Num+"</td>");
                                          out.println("<td><a href=\""+DefaultURL+"/servlet/ViewAGwap?n="+no+"\">"+title+"</a></td>");
                                          out.println("<td>OK</td>");
                                                Num++;
                                      }
                                   if  ((theResult.getString(1).equals(" "+UserID)) && ( CurCalendar.after(EventCalendar)  ))   
                                      {   out.println("<tr><td>"+Num+"</td>");
                                          out.println("<td><a href=\""+DefaultURL+"/servlet/ViewAGwap?n="+no+"\">"+title+"</a></td>");
                                            out.println("<td>Expired</td>");
                                                      Num++;
                                      }
                               }
                  theStatement.close();
                }  catch (Exception e) { out.println(e.getMessage()); }               
                
                   try {    Statement  theStatement=theConnection.createStatement();      
                          ResultSet theResult = theStatement.executeQuery(    
                                                      "select membername,groupname,grouptype  from member "+
                                                       " where  idmem <> id and id =' "+UserID+"' and no_mem = "+nomem);                                    
                                            while (theResult.next()) out.println("<td>"+theResult.getString(1)+"</td></tr>");
	      theResult.close();
                                          theStatement.close();
                                         }  catch (Exception e) { out.println(e.getMessage()); }     
             
                 if  (IDMem.equals(" "+UserID)) {
                 	  try {    Statement  theStatement=theConnection.createStatement();      
                 	             theStatement.executeQuery(    
                 	             "delete from calendar where no_group = "+no_groupOK+" and no_cal <> "+no);
                 	             theStatement.close();
                 	        }catch (Exception e) { out.println(e.getMessage()); }     
                 }
                                                         
              }//for
                /*------------------------------------------------------------------------OK-----------------------------------------------------------------------------------------*/
           no_count = 0;
           checkresult = false;
           check1 =false;
          int no_groupNo=0;
           title="";
           from="";
            check1=false;
            check2= false;
            fromid="";
            no=0;
           nomem = 0;
            IDMem = "";
              try{    Statement  theStatement=theConnection.createStatement();      
                         ResultSet theResult = theStatement.executeQuery(    
                         "select  count(*)  from calendar where check_mode = 4 and id<>' "+UserID+"' order by no_group");
                    while (theResult.next()){  no_count = theResult.getInt(1); }
                   theStatement.close();
                 }  catch (Exception e) { out.println(e.getMessage()); }   
                   
             for (int i=1;i<=no_count;i++) {  check1=false;
                                                                     check2=false;
                  try{    Statement  theStatement=theConnection.createStatement();      
                             ResultSet theResult = theStatement.executeQuery(    
                             "select  no_group,title,from_gr,time,id,no_cal  from calendar where check_mode = 4 and id<>' "+UserID+"' order by no_group");
                                 while (theResult.next() &&(!check2)){ 
                         	  if (no_groupNo==0)  { no_groupNo=theResult.getInt(1);
                         	                                             title = theResult.getString(2);
                         	                                             from = theResult.getString(3); 
                         	                 Calendar DBCalendar = new GregorianCalendar();
                                                            DBCalendar.setTime(theResult.getDate(4));
                                                            DBDate = DBCalendar.get(DBCalendar.DATE);
                                                            DBMonth = DBCalendar.get(DBCalendar.MONTH)+1;
                                                            DBYear = DBCalendar.get(DBCalendar.YEAR); 
                                                            check2= true;
                                                             fromid=theResult.getString(5);
                                                              no= theResult.getInt(6);
                                                             }
                         	  else  { if  (((theResult.getInt(1)> no_groupNo))&& (!check1)) {  no_groupNo=theResult.getInt(1);  
                         	                                                                                           title = theResult.getString(2);
                         	                                                                                            from = theResult.getString(3); 
                         	                                                                                            check1= true;
                         	                 Calendar DBCalendar = new GregorianCalendar();
                                                            DBCalendar.setTime(theResult.getDate(4));
                                                            DBDate = DBCalendar.get(DBCalendar.DATE);
                                                            DBMonth = DBCalendar.get(DBCalendar.MONTH)+1;
                                                            DBYear = DBCalendar.get(DBCalendar.YEAR); 
                                                             fromid=theResult.getString(5);
                                                              no= theResult.getInt(6);
                                                        }       
                                                    }                                               
                         	   }//while
                  theStatement.close();
                  }  catch (Exception e) { out.println(e.getMessage()); }         
                  Calendar EventCalendar = new GregorianCalendar(DBYear,DBMonth,DBDate);  
                 try{   Statement  theStatement=theConnection.createStatement();      
                          ResultSet theResult = theStatement.executeQuery(    
                         "select  id,no_mem  from groupcal  where no_group="+no_groupNo );
                            while (theResult.next())
                                { nomem = theResult.getInt(2);
                                   IDMem = theResult.getString(1);
                                    if ( (theResult.getString(1).equals(" "+UserID)) && (( EventCalendar.after(CurCalendar))  ||   (EventCalendar.equals(CurCalendar))) )  
                                      {   out.println("<tr><td>"+Num+"</td>");
                                          out.println("<td><a href=\""+DefaultURL+"/servlet/ViewAGwap?n="+no+"\">"+title+"</a></td>");
                                          out.println("<td>No</td>");
                                         Num++;
                                      }
                                    if  ((theResult.getString(1).equals(" "+UserID)) && ( CurCalendar.after(EventCalendar)  ) )  
                                      {  out.println("<tr><td>"+Num+"</td>");
                                          out.println("<td><a href=\""+DefaultURL+"/servlet/ViewAGwap?n="+no+"\">"+title+"</a></td>");
                                          out.println("<td>Expired</td>");
                                         Num++;
                                            }
                               }
                  theStatement.close();
                }  catch (Exception e) { out.println(e.getMessage()); }  
                
                  try {    Statement  theStatement=theConnection.createStatement();      
                          ResultSet theResult = theStatement.executeQuery(    
                                                      "select membername,groupname,grouptype  from member "+
                                                       " where  idmem <> id and id =' "+UserID+"' and no_mem = "+nomem);                                    
                                            while (theResult.next()) {     out.println("<td>"+theResult.getString(1)+"</td></tr>");
                                            }theResult.close();
                                          theStatement.close();
                                         }  catch (Exception e) { out.println(e.getMessage()); }     
                          if  (IDMem.equals(" "+UserID))  {
                              try {    Statement  theStatement=theConnection.createStatement();      
                 	             theStatement.executeQuery(    
                 	             "delete from calendar where no_group = "+no_groupNo+" and no_cal <> "+no);
                 	             theStatement.close();
                 	        }catch (Exception e) { out.println(e.getMessage()); }     
                 	        }
              }//for
              /*--------------------------------------------------------------------------------NO------------------------------------------------------------------------------*/
              
           no_count = 0;
           checkresult = false;
           check1 =false;
          int no_groupWait=0;
           title="";
           from="";
            check1=false;
            check2=false; 
            no= 0;
            fromid = "";
             nomem = 0;
             String MemID2 = ""; 
                  try{    Statement  theStatement=theConnection.createStatement();      
                         ResultSet theResult = theStatement.executeQuery(    
                         "select  count(*)  from calendar where check_mode = 2 and id=' "+UserID+"' order by no_group");
                    while (theResult.next()){  no_count = theResult.getInt(1); }
                   theStatement.close();
                 }  catch (Exception e) { out.println(e.getMessage()); }       
                  
                   for (int i=1;i<=no_count;i++) { check1= false;
                                                                          check2 = false;
                  try{    Statement  theStatement=theConnection.createStatement();      
                             ResultSet theResult = theStatement.executeQuery(    
                             "select  no_group,title,from_gr,time,id,no_cal   from calendar where check_mode = 2 and id=' "+UserID+"' order by no_group");
                                 while (theResult.next() && (!check2)){ 
                         	  if (no_groupWait==0)  { no_groupWait=theResult.getInt(1);
                         	                                             title = theResult.getString(2);
                         	                                             from = theResult.getString(3); 
                         	                 Calendar DBCalendar = new GregorianCalendar();
                                                            DBCalendar.setTime(theResult.getDate(4));
                                                            DBDate = DBCalendar.get(DBCalendar.DATE);
                                                            DBMonth = DBCalendar.get(DBCalendar.MONTH)+1;
                                                            DBYear = DBCalendar.get(DBCalendar.YEAR); 
                                                             check2=true;
                                                             no= theResult.getInt(6);
                                                              fromid=theResult.getString(5);
                                                          }
                         	  else  { if  (((theResult.getInt(1)> no_groupWait)) && (!check1)) {  no_groupWait=theResult.getInt(1);  
                         	                                                                                           title = theResult.getString(2);
                         	                                                                                            from = theResult.getString(3); 
                         	                                                                                            check1= true;
                         	                 Calendar DBCalendar = new GregorianCalendar();
                                                            DBCalendar.setTime(theResult.getDate(4));
                                                            DBDate = DBCalendar.get(DBCalendar.DATE);
                                                            DBMonth = DBCalendar.get(DBCalendar.MONTH)+1;
                                                            DBYear = DBCalendar.get(DBCalendar.YEAR); 
                                                              no= theResult.getInt(6);
                                                               fromid=theResult.getString(5);
                                                              }
                         	             }     
                         	        }//while
                  theStatement.close();
                }  catch (Exception e) { out.println(e.getMessage()); }  
               // out.println(no_groupWait+"<br/>");
                   Calendar EventCalendar = new GregorianCalendar(DBYear,DBMonth,DBDate);  
                    try{   Statement  theStatement=theConnection.createStatement();      
                          ResultSet theResult = theStatement.executeQuery(    
                         "select  id,no_mem  from groupcal  where no_group="+no_groupWait );
                            while (theResult.next())
                                { nomem = theResult.getInt(2);
                                   MemID2 = theResult.getString(1);
                                    if     ( (!( theResult.getString(1).equals(" "+UserID)) )&& (( EventCalendar.after(CurCalendar))  ||   (EventCalendar.equals(CurCalendar)) ) )
                                      { out.println("<tr><td>"+Num+"</td>");
                                          out.println("<td><a href=\""+DefaultURL+"/servlet/ViewEGwap?n="+no+"\">"+title+"</a></td>");
                                          out.println("<td>Got Appointment</td>");
                                            if (from != null) out.println("<td>"+from+"</td></tr>");
                                            else out.println("<td>"+fromid+"</td></tr>");
                                               Num++;
                                          }
                                    if     ((!(theResult.getString(1).equals(" "+UserID))) &&  (CurCalendar.after(EventCalendar)))
                                      {  out.println("<tr><td>"+Num+"</td>");
                                          out.println("<td><a href=\""+DefaultURL+"/servlet/ViewEGwap?n="+no+"\">"+title+"</a></td>");
                                          out.println("<td>Expired</td>");
                                            if (from != null) out.println("<td>"+from+"</td></tr>");
                                            else out.println("<td>"+fromid+"</td></tr>");
                                               Num++;
                                       }
                                    }
                                          theStatement.close();
                  }  catch (Exception e) { out.println(e.getMessage()); }           
                  
                
              }//for
              
              /*----------------------------------------------------------------------Select Result---------------------------------------------------------------------*/
              
               no_count = 0;
           checkresult = false;
           check1 =false;
          int no_groupView=0;
           title="";
           from="";
            check1=false;
            check2=false; 
            no=0;
            fromid = "";
           
                try{    Statement  theStatement=theConnection.createStatement();      
                         ResultSet theResult = theStatement.executeQuery(    
                         "select  count(*)  from calendar where check_mode = 5 and id=' "+UserID+"' order by no_group");
                    while (theResult.next()){  no_count = theResult.getInt(1); }
                   theStatement.close();
                 }  catch (Exception e) { out.println(e.getMessage()); }  
                 //out.println(no_count);     
                   for (int i=1;i<=no_count;i++) { check1= false;
                                                                    check2 = false;
                  try{    Statement  theStatement=theConnection.createStatement();      
                             ResultSet theResult = theStatement.executeQuery(    
                             "select  no_group,title,from_gr,time,no_cal,id  from calendar where check_mode = 5 and id=' "+UserID+"' order by no_group");
                                 while (theResult.next() && (!check2)){ 
                         	  if (no_groupView==0)  { no_groupView=theResult.getInt(1);
                         	                                             title = theResult.getString(2);
                         	                                             from = theResult.getString(3); 
                         	                 Calendar DBCalendar = new GregorianCalendar();
                                                            DBCalendar.setTime(theResult.getDate(4));
                                                            DBDate = DBCalendar.get(DBCalendar.DATE);
                                                            DBMonth = DBCalendar.get(DBCalendar.MONTH)+1;
                                                            DBYear = DBCalendar.get(DBCalendar.YEAR); 
                                                             check2=true;
                                                              no= theResult.getInt(5);
                                                               fromid=theResult.getString(6);
                                                            }
                         	  else  { if  (((theResult.getInt(1)> no_groupView)) && (!check1)) {  no_groupView=theResult.getInt(1);  
                         	                                                                                           title = theResult.getString(2);
                         	                                                                                            from = theResult.getString(3); 
                         	                                                                                            check1= true;
                         	                 Calendar DBCalendar = new GregorianCalendar();
                                                            DBCalendar.setTime(theResult.getDate(4));
                                                            DBDate = DBCalendar.get(DBCalendar.DATE);
                                                            DBMonth = DBCalendar.get(DBCalendar.MONTH)+1;
                                                            DBYear = DBCalendar.get(DBCalendar.YEAR); 
                                                             no= theResult.getInt(5);
                                                              fromid=theResult.getString(6);
                                                             }
                         	             }      
                         	          }//while
                  theStatement.close();
                }  catch (Exception e) { out.println(e.getMessage()); }  
                   Calendar EventCalendar = new GregorianCalendar(DBYear,DBMonth,DBDate);  
                    try{   Statement  theStatement=theConnection.createStatement();      
                          ResultSet theResult = theStatement.executeQuery(    
                         "select  id from groupcal  where no_group="+no_groupView );
                            while (theResult.next())
                                { if ((!(theResult.getString(1).equals(" "+UserID))) &&( ( EventCalendar.after(CurCalendar))  ||   (EventCalendar.equals(CurCalendar)) )  )
                                      {   out.println("<tr><td>"+Num+"</td>");
                                          out.println("<td><a href=\""+DefaultURL+"/servlet/ViewEGwap?n="+no+"\">"+title+"</a></td>");
                                          out.println("<td>Not Answer</td>");
                                            if (from != null) out.println("<td>"+from+"</td></tr>");
                                            else out.println("<td>"+fromid+"</td></tr>");
                                            Num++;
                                                  }
                                    if  ((!(theResult.getString(1).equals(" "+UserID))) && ( CurCalendar.after(EventCalendar)  ) )  
                                      {   out.println("<tr><td>"+Num+"</td>");
                                          out.println("<td><a href=\""+DefaultURL+"/servlet/ViewEGwap?n="+no+"\">"+title+"</a></td>");
                                          out.println("<td>Expired</td>");
                                            if (from != null) out.println("<td>"+from+"</td></tr>");
                                            else out.println("<td>"+fromid+"</td></tr>");
                                            Num++;
                                                           }
                                }
                  theStatement.close();
                  }  catch (Exception e) { out.println(e.getMessage()); }           
              }//for
              
              /*-------------------------------------------------------------------------------already read--------------------------------------------------------*/
              
              
              
              
            no_count = 0;
           checkresult = false;
           check1 =false;
           no_groupView=0;
           title="";
           from="";
            check1=false;
            check2=false; 
            no=0;
            fromid="";
           
                try{    Statement  theStatement=theConnection.createStatement();      
                         ResultSet theResult = theStatement.executeQuery(    
                         "select  count(*)  from calendar where check_mode = 6  and id<>' "+UserID+"' order by no_group");
                    while (theResult.next()){  no_count = theResult.getInt(1); }
                   theStatement.close();
                 }  catch (Exception e) { out.println(e.getMessage()); }  
                 //out.println(no_count);     
                   for (int i=1;i<=no_count;i++) { check1= false;
                                                                          check2 = false;
                  try{    Statement  theStatement=theConnection.createStatement();      
                             ResultSet theResult = theStatement.executeQuery(    
                             "select  no_group,title,from_gr,time,no_cal,id  from calendar where check_mode = 6 and id <>' "+UserID+"' order by no_group");
                                 while (theResult.next() && (!check2)){ 
                         	  if (no_groupView==0)  { no_groupView=theResult.getInt(1);
                         	                                             title = theResult.getString(2);
                         	                                             from = theResult.getString(3); 
                         	                 Calendar DBCalendar = new GregorianCalendar();
                                                            DBCalendar.setTime(theResult.getDate(4));
                                                            DBDate = DBCalendar.get(DBCalendar.DATE);
                                                            DBMonth = DBCalendar.get(DBCalendar.MONTH)+1;
                                                            DBYear = DBCalendar.get(DBCalendar.YEAR); 
                                                             check2=true;
                                                              no= theResult.getInt(5);
                                                               fromid=theResult.getString(6);
                                                            }
                         	  else  { if  (((theResult.getInt(1)> no_groupView)) && (!check1)) {  no_groupView=theResult.getInt(1);  
                         	                                                                                           title = theResult.getString(2);
                         	                                                                                            from = theResult.getString(3); 
                         	                                                                                            check1= true;
                         	                 Calendar DBCalendar = new GregorianCalendar();
                                                            DBCalendar.setTime(theResult.getDate(4));
                                                            DBDate = DBCalendar.get(DBCalendar.DATE);
                                                            DBMonth = DBCalendar.get(DBCalendar.MONTH)+1;
                                                            DBYear = DBCalendar.get(DBCalendar.YEAR); 
                                                             no= theResult.getInt(5);
                                                              fromid=theResult.getString(6);
                                                             }
                         	             }      
                         	          }//while
                  theStatement.close();
                }  catch (Exception e) { out.println(e.getMessage()); }  
                   Calendar EventCalendar = new GregorianCalendar(DBYear,DBMonth,DBDate);  
                    try{   Statement  theStatement=theConnection.createStatement();      
                          ResultSet theResult = theStatement.executeQuery(    
                         "select  id from groupcal  where no_group="+no_groupView );
                            while (theResult.next())
                                { if ((theResult.getString(1).equals(" "+UserID)) &&( ( EventCalendar.after(CurCalendar))  ||   (EventCalendar.equals(CurCalendar)) )  )
                                      {    out.println("<tr><td>"+Num+"</td>");
                                          out.println("<td><a href=\""+DefaultURL+"/servlet/ViewAGwap2?n="+no+"\">"+title+"</a></td>");
                                          out.println("<td>Viewed</td>");
                                            Num++;
                                             }
                                    if  ((theResult.getString(1).equals(" "+UserID)) && ( CurCalendar.after(EventCalendar)  ) ) 
                                      {  out.println("<tr><td>"+Num+"</td>");
                                          out.println("<td><a href=\""+DefaultURL+"/servlet/ViewAGwap2?n="+no+"\">"+title+"</a></td>");
                                          out.println("<td>Expired</td>");
                                           Num++;
                                                   }
                                }
                  theStatement.close();
                  }  catch (Exception e) { out.println(e.getMessage()); }           
               try {    Statement  theStatement=theConnection.createStatement();      
                          ResultSet theResult = theStatement.executeQuery(    
                                                      "select membername,groupname,grouptype  from member "+
                                                       " where  idmem <> id and id =' "+UserID+"' and no_mem = "+nomem);                                    
                                            while (theResult.next()) out.println("<td>"+theResult.getString(1)+"</td></tr>");
	      theResult.close();
                                          theStatement.close();
                                         }  catch (Exception e) { out.println(e.getMessage()); }     
         
              }//for
              
              /*------------------------------------------------------------see answer------------------------------------------------------------------*/
              
              /*-------------------------------------------------------------------------table from-----------------------------------------------------*/
              no_count = 0;
           checkresult = false;
           check1 =false;
           no_groupWait=0;
           title="";
           from="";
            check1=false;
            check2=false; 
            boolean checkfrom= false;
          int Mname=0;
          no = 0;
                  try{    Statement  theStatement=theConnection.createStatement();      
                         ResultSet theResult = theStatement.executeQuery(    
                         "select  count(*)  from calendar where check_mode = 2 and id=' "+UserID+"' order by no_group");
                    while (theResult.next()){  no_count = theResult.getInt(1); }
                   theStatement.close();
                 }  catch (Exception e) { out.println(e.getMessage()); }       
                  for (int i=1;i<=no_count;i++) { check1= false;
                                                                        check2 = false;
                                                                         
                  try{    Statement  theStatement=theConnection.createStatement();      
                             ResultSet theResult = theStatement.executeQuery(    
                             "select  no_group,title,from_gr,time,no_cal   from calendar where check_mode = 2 and id=' "+UserID+"' order by no_group");
                                 while (theResult.next() && (!check2)){ 
                         	  if (no_groupWait==0)  { no_groupWait=theResult.getInt(1);
                         	                                             title = theResult.getString(2);
                         	                 Calendar DBCalendar = new GregorianCalendar();
                                                            DBCalendar.setTime(theResult.getDate(4));
                                                            DBDate = DBCalendar.get(DBCalendar.DATE);
                                                            DBMonth = DBCalendar.get(DBCalendar.MONTH)+1;
                                                            DBYear = DBCalendar.get(DBCalendar.YEAR); 
                                                             check2=true;
                                                              no= theResult.getInt(5);
                                                            }
                         	  else  { if  (((theResult.getInt(1)> no_groupWait)) && (!check1)) {  no_groupWait=theResult.getInt(1);  
                         	                                                                                           title = theResult.getString(2);
                         	                                                                                            check1= true;
                         	                 Calendar DBCalendar = new GregorianCalendar();
                                                            DBCalendar.setTime(theResult.getDate(4));
                                                            DBDate = DBCalendar.get(DBCalendar.DATE);
                                                            DBMonth = DBCalendar.get(DBCalendar.MONTH)+1;
                                                            DBYear = DBCalendar.get(DBCalendar.YEAR); 
                                                             no= theResult.getInt(5);
                                                             }
                         	             }                                                      
                         	    }//while
                  theStatement.close();
                }  catch (Exception e) { out.println(e.getMessage()); }  
                   Calendar EventCalendar = new GregorianCalendar(DBYear,DBMonth,DBDate);  
                    try{   Statement  theStatement=theConnection.createStatement();      
                          ResultSet theResult = theStatement.executeQuery(    
                         "select  id,no_mem from groupcal  where no_group="+no_groupWait );
                            while (theResult.next())
                                { if ( (theResult.getString(1).equals(" "+UserID)) && (( EventCalendar.after(CurCalendar))  ||   (EventCalendar.equals(CurCalendar)) )   )
                                      {   out.println("<tr><td>"+Num+"</td>");
                                          out.println("<td><a href=\""+DefaultURL+"/servlet/ViewAGwap2?n="+no+"\">"+title+"</a></td>");
                                          out.println("<td>Waiting</td>");
                                          Mname= theResult.getInt(2);
                                          checkfrom = false;
                                           Num++;
                                            }
                                     if  ((theResult.getString(1).equals(" "+UserID)) && ( CurCalendar.after(EventCalendar)  ) )  
                                      { out.println("<tr><td>"+Num+"</td>");
                                          out.println("<td><a href=\""+DefaultURL+"/servlet/ViewAGwap2?n="+no+"\">"+title+"</a></td>");
                                          out.println("<td>Expired</td>");
                                            Mname= theResult.getInt(2);
                                           checkfrom = false;
                                           Num++;
                                       }
                                                   }//while
                  theStatement.close();
                  }  catch (Exception e) { out.println(e.getMessage()); }    
                                        
                     try{   Statement  theStatement=theConnection.createStatement();      
                          ResultSet theResult = theStatement.executeQuery(    
                          "select membername from member where no_mem= "+Mname);                       
                            while (theResult.next() && (!checkfrom) ){             
                            	out.println("<td>"+theResult.getString(1)+"</td></tr>");
                            	 checkfrom =true;
                               }
                      theStatement.close();
                  }  catch (Exception e) { out.println(e.getMessage()); }                   
              }//for
                
           out.println("</table></small><br/></p><p align = \"center\"><a href=\""+DefaultURL+"/servlet/mainwap?s=6\">Group Calendar</a>");
             out.println("</p><do type =\"prev\"><prev/></do></card></wml> ");
          }
      }