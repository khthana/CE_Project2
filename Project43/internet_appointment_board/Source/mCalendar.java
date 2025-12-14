import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class mCalendar extends HttpServlet
 {   String DefaultURL="http://161.246.5.233:8080/planny";
      static final int  CurDate      =  Calendar.getInstance().get(Calendar.DAY_OF_MONTH); 
      static final int  CurMonth   =  Calendar.getInstance().get(Calendar.MONTH); 
      static final int  CurYear      =  Calendar.getInstance().get(Calendar.YEAR); 
      static final int  CurHour      =  Calendar.getInstance().get(Calendar.HOUR_OF_DAY); 
      static final String []DayName={"Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday",} ;
      static final  String [] MonthName = {"January","February","March","April","May", "June","July","August","September","October","November","December"};
      Connection theConnection;
      protected void doGet(HttpServletRequest req , HttpServletResponse res) throws ServletException, IOException
       {    HttpSession session = req.getSession(true);
             String UserID = (String)session.getValue("login.username");	
             if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
               else session.putValue("login.username",UserID);
              String GiveTime = req.getParameter("t");
             String Choose = req.getParameter("s");
              // ---- Convert Gtime to Integer -------
             int GDate= CurDate;
             int GMonth=CurMonth;
             int GYear=CurYear;
             int no_cal=0;
            /* int no_group = 0;
             int no_group2 = 0;
             boolean checkgr=false;
             boolean check1 = false;
             boolean check2 = false;
             boolean checkresult= false;*/
             if (GiveTime!=null) {
             Date MakeDate = new Date(Long.parseLong(GiveTime));
             Calendar GCalendar = new GregorianCalendar();
             GCalendar.setTime(MakeDate);
             GDate = GCalendar.get(GCalendar.DAY_OF_MONTH); 
             GMonth = GCalendar.get(GCalendar.MONTH);
             GYear = GCalendar.get(GCalendar.YEAR);
                                }
             //  -----------------------------------
             
             if (Choose==null) {Choose="1";}
             res.setContentType("text/html");
             PrintWriter out = res.getWriter(); 
                try{    Class.forName("oracle.jdbc.driver.OracleDriver");
                                     theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                    }  catch (Exception e) { out.println(e.getMessage()); }
                         
               /*-------------------------------------------------------------check group-----------------------------------------------*/
                 
                 boolean checkgr=false;
                 int no_group = 0;
                 int no_count = 0;
                 boolean check1=false;
                 boolean check2=false;
                
                  try{    Statement  theStatement=theConnection.createStatement();      
                         ResultSet theResult = theStatement.executeQuery(    
                         "select  count(*)  from calendar where check_mode = 2 and id=' "+UserID+"' order by no_group");
                                while (theResult.next()){  no_count = theResult.getInt(1); }
                           theStatement.close();
                         }  catch (Exception e) { out.println(e.getMessage()); }    
                  
                  for (int i=1;i<=no_count;i++) {
             	check1=false;
             	check2=false;  
                try{    Statement  theStatement=theConnection.createStatement();      
                             ResultSet theResult = theStatement.executeQuery(    
                             "select  no_group from calendar where check_mode = 2 and id=' "+UserID+"' order by no_group");
                                 while (theResult.next() && (!check2)){ 
                         	  if (no_group==0)  { no_group=theResult.getInt(1);
                         	                                             check2=true;
                                                                                      }
                         	  else  { if  ( (theResult.getInt(1) > no_group) && (!check1))
                         	                    { no_group=theResult.getInt(1); 
                         	                       check1=true; 
                         	                    }         
                                                        }                                          
                         	   }//while
                  theStatement.close();
                }  catch (Exception e) { out.println(e.getMessage()); }     
                
                   try{   Statement  theStatement=theConnection.createStatement();      
                          ResultSet theResult = theStatement.executeQuery(    
                         "select  id from groupcal  where no_group="+no_group);
                            while (theResult.next() && (!checkgr))
                              {  if (!(theResult.getString(1).equals(" "+UserID)))
                                        {  checkgr = true;
                                            session.putValue("login.messageapp","<font size=2 Color=red><b>!!! You have appointment</b></font>"); 
                                        }
                              } 
                                           
                      theStatement.close();
                  }  catch (Exception e) { out.println(e.getMessage()); }          
                      if (checkgr)    continue;
                                             
                }//for
                
                  checkgr=false;
                  no_group = 0;
                  no_count = 0;
                  check1=false;
                  check2=false;
                
                 try{    Statement  theStatement=theConnection.createStatement();      
                         ResultSet theResult = theStatement.executeQuery(    
                         "select  count(*)  from calendar  where check_mode = 3 or check_mode = 4 and id <>' "+UserID+"' order by no_group");
                                while (theResult.next()){  no_count = theResult.getInt(1); }
                           theStatement.close();
                         }  catch (Exception e) { out.println(e.getMessage()); }   
                
                    for (int i=1;i<=no_count;i++) {
             	check1=false;
             	check2=false;  
                try{    Statement  theStatement=theConnection.createStatement();      
                             ResultSet theResult = theStatement.executeQuery(    
                             "select  no_group from calendar  where check_mode = 3 or check_mode = 4 and id <>' "+UserID+"' order by no_group");
                                 while (theResult.next() && (!check2)){ 
                         	  if (no_group==0)  { no_group=theResult.getInt(1);
                         	                                             check2=true;
                                                                                      }
                         	  else  { if  ( (theResult.getInt(1) > no_group) && (!check1))
                         	                    { no_group=theResult.getInt(1); 
                         	                       check1=true; 
                         	                    }         
                                                        }                                          
                         	   }//while
                  theStatement.close();
                }  catch (Exception e) { out.println(e.getMessage()); }     
                
                   try{   Statement  theStatement=theConnection.createStatement();      
                          ResultSet theResult = theStatement.executeQuery(    
                         "select  id from groupcal  where no_group="+no_group);
                            while (theResult.next() && (!checkgr))
                              {  if (theResult.getString(1).equals(" "+UserID))
                                        {  checkgr = true;
                                            session.putValue("login.messageresult","<font size=2 Color=red><b>!!! You got appointment answer</b></font>"); 
                                        }
                              } 
                                           
                      theStatement.close();
                  }  catch (Exception e) { out.println(e.getMessage()); }          
                      if (checkgr)    continue;
                                             
                }//for
                
             out.println("<html><head><title>Planny Organizer</title><meta http-equiv=\"Content-Type\" content=\"text/html; charset=Windows-874\">");
             
             out.println("<STYLE TYPE=\"text/css\">");
             out.println("<!--");
             out.println("BODY {OVERFLOW:scroll;OVERFLOW-X:hidden}");
             out.println(".DEK {POSITION:absolute;VISIBILITY:hidden;Z-INDEX:200;}");
             out.println("//-->");
             out.println("</STYLE>");
             
             out.println("<script language=\"JavaScript\">");
             out.println("<!--");
             out.println("function MM_jumpMenu(targ,selObj,restore){ //v3.0");
             out.println("eval(targ+\".location=\'\"+selObj.options[selObj.selectedIndex].value+\"\'\");");
             out.println("if (restore) selObj.selectedIndex=0; }");
              //++++++++++++++++java script +++++++++++++++++++
                 
                 out.println("function SetCheck(val) {");
                 out.println("dml=document.ToDo;");
                 out.println("len = dml.elements.length;");
                 out.println("var i=0;");
                 out.println("for( i=0 ; i<len; i++) {");
                 out.println("if(val==0) dml[i].checked=true;");
                 out.println("else dml[i].checked=false;");
                 out.println("}}");
                 
                 //+++++++++++++++++++++++++++++++++++
             
             out.println("//--></script>");
             out.println("</head>");	
             out.println("<body bgcolor=\"#FFFFFF\" VLINK=blue LINK=blue>");
             out.println("<DIV ID=\"dek\" CLASS=\"dek\"></DIV>");
             out.println("<SCRIPT TYPE=\"text/javascript\">");
             out.println("<!--");

             out.println("Xoffset=15; // modify these values to ...");
             out.println("Yoffset= 0; // change the popup position.");

             out.println("var nav,old,iex=(document.all),yyy=-1000;");
             out.println("if(navigator.appName==\"Netscape\"){(document.layers)?nav=true:old=true;}");

             out.println("if(!old){");
             out.println("var skn=(nav)?document.dek:dek.style;");
             out.println("if(nav)document.captureEvents(Event.MOUSEMOVE);");
             out.println("document.onmousemove=get_mouse;");
             out.println("}");

             out.println("function popup(msg,bak){");
             out.println("var content=\"<TABLE WIDTH=150 \"+");
             out.println("\"BGCOLOR=><TD ><FONT COLOR=\"+bak+\" SIZE=2>\"+msg+\"</FONT></TD></TABLE>\";");
             out.println("if(old){alert(msg);return;} ");
             out.println("else{yyy=Yoffset;");
             out.println("if(nav){skn.document.write(content);skn.document.close();skn.visibility=\"visible\"}");
             out.println("if(iex){document.all(\"dek\").innerHTML=content;skn.visibility=\"visible\"}");
             out.println("}");
             out.println("}");

             out.println("function get_mouse(e){");
             out.println("var x=(nav)?e.pageX:event.x+document.body.scrollLeft;skn.left=x+Xoffset;");
             out.println("var y=(nav)?e.pageY:event.y+document.body.scrollTop;skn.top=y+yyy;");
             out.println("}");

             out.println("function kill(){");
             out.println("if(!old){yyy=-1000;skn.visibility=\"hidden\";}");
             out.println("}");

             out.println("//-->");
             out.println("</SCRIPT>");
             out.println("<table width=\"100%\" border=\"0\" height=\"69\">");
             out.println("<tbody><tr><td  width=\"34%\" align=\"center\" rowspan=\"3\"><img src=\"/planny/picture/logo3.jpg\" width=\"219\" height=\"69\"></td>");	
             out.println("<td colspan=\"4\"><hr color=\"#49B0FC\" size=\"3\" noshade></td></tr>");
             out.println("<tr><td width=\"14%\">&nbsp;</td><td width=\"41%\" align=\"right\"><b><font size=\"3\" color=\"#49B0FC\" face=\"Georgia\">Welcome : &nbsp;"+UserID+"</font></b></td>");	
             out.println("<td width=\"2%\"></td><td width=\"9%\" valign=\"bottom\"></td></tr>");		
             out.println("<tr><td colspan=\"4\"><hr color=\"#49B0FC\" size=\"3\" noshade></td></tr></table>");	
             out.println("<table width=\"100%\" border=\"0\" align=\"center\"><tbody><tr><td height=\"25\" >&nbsp;</td><td height=\"25\" width=\"555\">&nbsp;</td></tr>");
             //+++++++++++++++++++++++   Print error Message  +++++++++++++++++++++++++++++++++
             Object  ErToDo = session.getValue("login.message");
             Object  MessageGroup = session.getValue("login.messageapp");
             Object  MessageResult = session.getValue("login.messageresult");
             out.println("<tr><td height=\"25\" >&nbsp;</td><td height=\"25\" width=\"555\">&nbsp;</td></tr>"); 	
             out.println("<tr><td height=\"25\" >&nbsp;</td><td height=\"25\" width=\"555\">");
             out.println("<table width=\"100%\" border=\"0\" align=\"center\">");
             if( MessageResult  !=null ) {
             out.println("<tr><td><b>"+MessageResult+"</b></td></tr>");	
             session.removeValue("login.messageresult"); }                  
             if( MessageGroup !=null ) {
             out.println("<tr><td><b>"+MessageGroup+"</b></td></tr>");	
             session.removeValue("login.messageapp");}
             if( ErToDo!=null ) { 
             out.println("<tr><td>"+ErToDo+"</td></tr>");	
             session.removeValue("login.message");    }
             out.println("</table></td></tr>");    
            //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
             if  ( Choose.equals("0") ) 
                     {   PrintCalendar.MakeCalendar(DefaultURL,MonthName,GDate,GMonth,GYear,Choose,out); //Make Calendar
                     	    PrintMainDay.MakeMainDay(UserID,theConnection,DefaultURL,DayName,MonthName,CurHour,CurDate,CurMonth,CurYear,GDate,GMonth,GYear,out); } 
             else if ( Choose.equals("1") )
                     {   PrintCalendar.MakeCalendar(DefaultURL,MonthName,GDate,GMonth,GYear,Choose,out); //Make Calendar
                     	    PrintMainWeek.MakeMainWeek(CurHour,theConnection,UserID,DefaultURL,MonthName,CurDate,CurMonth,CurYear,GDate,GMonth,GYear,out);}
                      else if (Choose.equals("2") )
                           {  PrintCalendarMonth.MakeCalendarMonth(DefaultURL,MonthName,GDate,GMonth,GYear,Choose,out); //Make Calendar
                               PrintMainMonth.MakeMainMonth(CurHour,theConnection,UserID,DefaultURL,MonthName,CurDate,CurMonth,CurYear,GDate,GMonth,GYear,Choose,out);} 
                          else if (Choose.equals("3") )
                              {  PrintCalendarYear.MakeCalendarYear(DefaultURL,MonthName,GDate,GMonth,GYear,Choose,out);
                                  PrintMainYear.MakeMainYear(DefaultURL,MonthName,GDate,GMonth,GYear,Choose,out);}  
             out.println("<tr><td  height=\"79\"  valign=\"top\">");  //height=\"79\"
             PrintToDo.MakeToDo(DefaultURL,theConnection,UserID,out,CurDate,CurMonth,CurYear,MonthName);
             out.println("<tr><td height=\"238\" valign=\"middle\">");
             PrintQuickAdd.MakeQuickAdd(DefaultURL,MonthName,CurHour,CurDate,CurMonth,CurYear,out);
             out.println("<tr><td height=\"79\"  valign=\"top\">");
             PrintFind.MakeFind(DefaultURL,GiveTime,Choose,out);
             out.println("<tr><td height=\"25\" >&nbsp;</td></tr>");
             out.println("<tr><td height=\"25\" >&nbsp;</td></tr>");
             out.println("</table></body></html>");
             out.flush();
             out.close();
                          //---Close Database
                          try { theConnection.close(); }
                                 catch (Exception e)  {out.println(e.getMessage()); }  
             
     }//DoGet        
protected void doPost(HttpServletRequest req , HttpServletResponse res) throws ServletException, IOException
       {    HttpSession session = req.getSession(true);
             String UserID = (String)session.getValue("login.username");	
             if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
               else session.putValue("login.username",UserID);
             String t = req.getParameter("t");
             String s = req.getParameter("s");
             String Title = req.getParameter("TitleFind");
             String Type = req.getParameter("TypeFind");
             String [] MonthName2 = {"JAN","FEB","MAR","APR","MAY", "JUN","JUL","AUG","SEP","OCT","NOV","DEC"};
             // ---- Convert Gtime to Integer -------
             int GDate= CurDate;
             int GMonth=CurMonth;
             int GYear=CurYear;
             if (  ! ( t.equals("null")  )  )    {
             Date MakeDate = new Date(Long.parseLong(t));
             Calendar GCalendar = new GregorianCalendar();
             GCalendar.setTime(MakeDate);
             GDate = GCalendar.get(GCalendar.DAY_OF_MONTH); 
             GMonth = GCalendar.get(GCalendar.MONTH);
             GYear = GCalendar.get(GCalendar.YEAR);
                                }
             //  -----------------------------------
              res.setContentType("text/html");
             PrintWriter out = res.getWriter();
             out.println("<html><head><title>Planny Organizer</title><meta http-equiv=\"Content-Type\" content=\"text/html; charset=Windows-874\">");
             out.println("<script language=\"JavaScript\">");
             out.println("<!--");
             out.println("function MM_jumpMenu(targ,selObj,restore){ //v3.0");
             out.println("eval(targ+\".location=\'\"+selObj.options[selObj.selectedIndex].value+\"\'\");");
             out.println("if (restore) selObj.selectedIndex=0; }");
             out.println("//--></script>");
             out.println("</head>");	
             out.println("<body bgcolor=\"#FFFFFF\" VLINK=blue LINK=blue><table width=\"100%\" border=\"0\" height=\"69\">");
             out.println("<tbody><tr><td  width=\"34%\" align=\"center\" rowspan=\"3\"><img src=\"/planny/picture/logo3.jpg\" width=\"219\" height=\"69\"></td>");	
             out.println("<td colspan=\"4\"><hr color=\"#49B0FC\" size=\"3\" noshade></td></tr>");
             out.println("<tr><td width=\"14%\">&nbsp;</td><td width=\"41%\" align=\"right\"><b><font size=\"3\" color=\"#49B0FC\" face=\"Georgia\">Welcome : &nbsp;"+UserID+"</font></b></td>");	
             out.println("<td width=\"2%\"></td><td width=\"9%\" valign=\"bottom\"></td></tr>");		
             out.println("<tr><td colspan=\"4\"><hr color=\"#49B0FC\" size=\"3\" noshade></td></tr></table>");	
             out.println("<table width=\"100%\" border=\"0\" align=\"center\"><tbody><tr><td height=\"25\" >&nbsp;</td><td height=\"25\" width=\"555\">&nbsp;</td></tr>");
             out.println("<tr><td height=\"25\" >&nbsp;</td><td height=\"25\" width=\"555\">&nbsp;</td></tr>");	
             PrintCalendar.MakeCalendar(DefaultURL,MonthName,GDate,GMonth,GYear,s,out); //Make Calendar
             out.println("<TD align=middle height=770 rowSpan=6 vAlign=top>");
             out.println("<TABLE border=0 width=\"100%\" height=\"239\"><TBODY><TR bgColor=#6699ff>"); 
             out.println("<TD align=middle bgColor=#6699CC><TABLE border=0 height=25 width=\"100%\"><TBODY>"); 
             out.println("<TR><TD bgColor=#CCFFFF><b>&nbsp;&nbsp;<font size=\"2\">Find Results for &nbsp;&quot; </font>  ");
             if ( Type.equals("null") && Title.equals("")  ) out.print("No Title");
                else if ( Type.equals("null") && !(Title.equals(""))  ) out.print(Title);
                          else if(  !(Type.equals("null")) && !(Title.equals(""))  ) out.print("<font size=\"2\">Title = </font>"+Title+" <font size=\"2\">& Type = </font>"+Type);
                                 else if(  !(Type.equals("null")) && Title.equals("") ) out.print("<font size=\"2\">Type = </font>"+Type);
             out.println(" <font size=\"2\">&quot;</font></b></TD></TR></TBODY></TABLE></TD></TR>");
             
             out.println("<tr ><td  colspan=7 height=32  valign=center>");
             out.println("<b><font size=\"2\"> &nbsp;My Calendar</b>|");
             out.print("<a href=\""+DefaultURL+"/servlet/gCalendar\"><b>Groups Calendar</b></a></font>");
             out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
             out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
             out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
             out.println("<font size=2><a href=\""+DefaultURL+"/servlet/gCalendar?c=1\">View Group</a></font></form>");
             out.println("</td></tr>");
             
             out.println("<TR><TD height=312 vAlign=top><table width=\"100%\" border=\"0\"><tr bgcolor=\"#E3E3E3\"> ");
             out.println("<td width=\"6%\" align=\"center\" valign=\"middle\" height=\"23\"><font size=\"2\"><b>No.</b></font></td>");
             out.println("<td width=\"16%\" align=\"center\" valign=\"middle\" height=\"23\"><font size=\"2\"><b>Date</b></font></td>");
             out.println("<td width=\"19%\" align=\"center\" valign=\"middle\" height=\"23\"><font size=\"2\"><b>Time</b></font></td>");
             out.println("<td width=\"32%\" align=\"center\" valign=\"middle\" height=\"23\"><font size=\"2\"><b>Title</b></font></td>");
             out.println("<td width=\"23%\" align=\"center\" valign=\"middle\" height=\"23\"><font size=\"2\"><b>Type</b></font></td></tr>");
             Calendar FindCalendar = new GregorianCalendar();
             int Num =1;
             boolean HaveDone = true;
             try{    Class.forName("oracle.jdbc.driver.OracleDriver");
                       theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                       Statement theStatement=theConnection.createStatement();
                       ResultSet  theResult;
                       if (Type.equals("null") && (Title.equals(""))  )
                          {  Title="No Title"; 
                              theResult=theStatement.executeQuery("select  time,title,type, no_cal  from calendar where id=' "+UserID+"' and  title= '"+Title+"' order by time");   }
                      else if (Title.equals("") && (!(Type.equals("null")))  ) {  theResult=theStatement.executeQuery("select  time,title,type, no_cal  from calendar where id=' "+UserID+"' and ( type= '"+Type+"' ) order by time"); }
                      else if ((!Title.equals("")) && (Type.equals("null"))  ) {  theResult=theStatement.executeQuery("select  time,title,type, no_cal  from calendar where id=' "+UserID+"' and ( title= '"+Title+"' ) order by time"); }
                      else {  theResult=theStatement.executeQuery("select  time,title,type, no_cal  from calendar where id=' "+UserID+"' and ( title= '"+Title+"'  or type= '"+Type+"') order by time"); }
                       
                       while (theResult.next()) {
                                                             FindCalendar.setTime(theResult.getDate(1));
                                                            int FindDate = FindCalendar.get(FindCalendar.DATE);
                                                            int FindMonth = FindCalendar.get(FindCalendar.MONTH);
                                                            int FindYear = FindCalendar.get(FindCalendar.YEAR);
                                                            FindCalendar.setTime(theResult.getTime(1));
                                                             int FindHour = FindCalendar.get(FindCalendar.HOUR_OF_DAY);
                                                            int FindMin = FindCalendar.get(FindCalendar.MINUTE);
                        out.println("<tr bgcolor=\"#99CCFF\" valign=\"middle\" align=\"center\">"); 
                        out.println("<td width=\"6%\" height=\"23\"><font size=\"2\"><b>"+Num+".</b></font></td>");
                        out.print("<td width=\"19%\" height=\"23\"><font size=\"2\"><b>");
                        if (FindDate<10) out.print("0");
                        out.print(FindDate+"-");
                        //if (FindMonth <10) out.print("0");
                        out.print(MonthName2[FindMonth]+"-"+FindYear+"</b></font></td>");
                        out.print("<td width=\"16%\" height=\"23\"><font size=\"2\"><b>");
                        if (FindHour <10) out.print("0");
                        out.print(FindHour+":");
                        if (FindMin <10) out.print("0");
                        out.println(FindMin+"</b></font></td>");
                        out.println("<td width=\"32%\" height=\"23\"><font size=\"2\"><b>");
                        out.println("<a href=\""+DefaultURL+"/servlet/ShowReminder?n="+theResult.getInt(4)+"\">"+theResult.getString(2)+"</b></font></td>");
                        out.println("<td width=\"23%\" height=\"23\"><font size=\"2\"><b>"+theResult.getString(3)+"</b></font></td></tr>");
                        Num++;                          
                        HaveDone = false;                    
                                                                      }//while
                        theResult.close();
                        theStatement.close();
                        }  catch (Exception e) { out.println(e.getMessage()); }
             if (HaveDone)    {
                         out.println("<tr bgcolor=\"#99CCFF\"><td colspan=\"5\" align=\"center\" valign=\"middle\" height=\"23\">");
                         out.println("<font size=\"2\"><b>Not Found</b></font></td></tr>");  }
             out.println("</table></TD></TR></TBODY></TABLE>");
             out.println("<tr><td  height=\"79\"  valign=\"top\">");  //height=\"79\"
             PrintToDo.MakeToDo(DefaultURL,theConnection,UserID,out,CurDate,CurMonth,CurYear,MonthName);
             out.println("<tr><td height=\"238\" valign=\"middle\">");
             PrintQuickAdd.MakeQuickAdd(DefaultURL,MonthName,CurHour,CurDate,CurMonth,CurYear,out);
             out.println("<tr><td height=\"79\"  valign=\"top\">");
             PrintFind.MakeFind(DefaultURL,t,s,out);
             out.println("<tr><td height=\"25\" >&nbsp;</td></tr>");
             out.println("<tr><td height=\"25\" >&nbsp;</td></tr>");
             out.println("</table></body></html>");
             out.flush();
             out.close();
      }//doPost
}//Class 	
  class PrintCalendar {
  public static  void MakeCalendar(String DefaultURL,String []MonthName/*,int CDate,int CMonth,int CYear*/,int GDate,int GMonth,int GYear,String Choose,PrintWriter out)
                   {   
                   	Calendar GCalendar    = new GregorianCalendar(GYear,GMonth,GDate);  //Calendar  Object For MakeTime
                   	out.println("<tr><td  valign=\"bottom\">");
                   	out.println("<table width=\"100%\" border=\"1\" height=\"32%\"><tbody><tr valign=\"bottom\" align=\"center\">");
                     out.println("<td height=\"23\" ");
                     if (Choose.equals("0")) { out.print(" bgcolor=\"#FFFFCC\">"); } else { out.print(">");}
                     out.println("<a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=0\">");
                     out.println("<font size=\"2\">Day</a></font></td>");
                     out.println("<td height=\"23\"");
                     if (Choose.equals("1")) { out.print(" bgcolor=\"#FFFFCC\">"); } else { out.print(">");}
                     out.println("<a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=1\">");
                     out.println("<font size=\"2\">Week</a></font></td>");
                     out.println("<td height=\"23\"");
                     if (Choose.equals("2")) { out.print(" bgcolor=\"#FFFFCC\">"); } else { out.print(">");}
                     out.println("<a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=2\">");
                     out.println("<font size=\"2\">Month</a></font></td>");
                     out.println("<td height=\"23\"");
                     if (Choose.equals("3")) { out.print(" bgcolor=\"#FFFFCC\">"); } else { out.print(">");}
                     out.println("<a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=3\">");
                     out.println("<font size=\"2\">Year</a></font></td></tr>");
                     out.println("<tr valign=\"center\" align=\"center\" bgcolor=\"#FFFFCC\">");
                     GCalendar = new GregorianCalendar(GYear,GMonth-1,GDate);
                     out.println("<td colspan=\"8\" height=\"24\"><font size=\"2\"><a href =\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s="+Choose+"\"><b>&lt;&lt;</b></a>");
                     out.println("<b>"+MonthName[GMonth]+" "+GYear+"</b>");
                     GCalendar = new GregorianCalendar(GYear,GMonth+1,GDate);
                     out.println("<a href =\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s="+Choose+"\"><b> &gt;&gt;</b></font></a></td></tr>"); 
                     out.println("<tr valign=\"top\"><td colspan=\"8\" height=\"144\"><table width=\"90%\" border=\"0\" height=\"142\" align=\"center\"><tbody>");
                     out.println("<tr valign=\"bottom\" align=\"center\">");
                     out.println("<td height=\"20\"><font size=\"2\"><b>Su</b></font></td>");
                     out.println("<td height=\"20\"><b><font size=\"2\">Mo</font></b></td>");
                     out.println("<td height=\"20\"><b><font size=\"2\">Tu</font></b></td>");
                     out.println("<td height=\"20\"><b><font size=\"2\">We</font></b></td>");
                     out.println("<td height=\"20\"><b><font size=\"2\">Th</font></b></td>");
                     out.println("<td height=\"20\"><b><font size=\"2\">Fr</font></b></td>");
                     out.println("<td height=\"20\"><b><font size=\"2\">Sa</font></b></td></tr>");
                     out.println("<tr valign=\"middle\" align=\"center\">"); 
                     //get first day from 1
                     GCalendar = new GregorianCalendar(GYear,GMonth,1);
                   	int DayOfWeek = GCalendar.get(GCalendar.DAY_OF_WEEK);
                     GCalendar.add(GCalendar.DATE,-(DayOfWeek-1));
                     //int Startdate = GDate;
                     for (int i=1;i<=(DayOfWeek-1);i++)   
                           {   out.println ("<td><a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=0\">");
                                out.println("<font size=\"2\" color=\"#999999\"><b>"+GCalendar.get(GCalendar.DATE)+"</b></font></a></td>"); 
                                GCalendar.add(GCalendar.DATE,1);
                            }
                     int date=1;
                     int Days=DayOfWeek;
                     for ( int weeks=0; weeks<6 ;weeks++)
	     {      for (; Days<=7 ; Days++)
                                     {    GCalendar = new GregorianCalendar(GYear,GMonth,date,0,0);
                                           if  (date>28)
	                          { if (GCalendar.get(GCalendar.MONTH)==GMonth)
		          {  if (GDate != date) 
		                { out.println ("<td><a href =\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=0\">");
		                   out.print("<font size=\"2\"");
		                     if ( Vacation.MakeVacation(GCalendar) )  
		                     out.print("color=\"#FF0000\"><b>"+date+"</b></font></a></td>"); 
		                       else if (Days== 1) out.print("color=\"#FF0000\">"+date+"</b></font></a></td>");
		                             else out.println(">"+date+"</font></a></td>");  
		                 }//if 139
		            else { out.println ("<td><a href =\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=0\">");
		            out.println("<font size=\"2\" color=\"BLACK\"><b>"+date+"</b></font></a></td>"); 
		                       } // else 146
		          }//if 138     
		    else  {  if (Days !=1)	{                      	
		                      out.println("<td><a href =\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=0\">");
		                      out.println("<font size=\"2\" color=\"#999999\"><b>"+GCalendar.get(GCalendar.DATE)+"</b></font></a></td>");
		                      GCalendar.add(GCalendar.DATE,1);
		                                                                }   else Days=7;
		                  }//else 152                               
		    }//if 137
	                   else
		              {    if (GDate != date)
		                          {  out.print("<td><a href =\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=0\"><font size=\"2\"");
		                              if ( Vacation.MakeVacation(GCalendar) )  
		                                   out.print("color=\"#FF0000\"><b>"+date+"</b></font></a></td>"); 
		                                   else if (Days == 1 )  out.print("color=\"#FF0000\">"+date+"</font></a></td>");
		                                        else  out.println(">"+date+"</font></a></td>");  
		                           }//if 162
		                   else { out.println ("<td><a href =\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=0\">");
		                                out.println("<font size=\"2\" color=\"BLACK\"><b>"+date+"</b></font></a></td>"); 
		                       }
		               }  
		            date++;
	                   }             if (date>31) continue;
                                                       Days=1;
	                                  out.println("</TR><tr valign=\"bottom\" align=\"center\">");
	          }//for     
                     out.println("</tbody></table></td></tr><tr valign=\"middle\" align=\"center\" bgcolor=\"#FFFFCC\"> ");
                     out.println("<td colspan=\"8\" height=\"25\">");
                     /*out.println("<font size=\"2\"><a href =\""+DefaultURL+"/servlet/mCalendar?t="+Calendar.getInstance().getTime().getTime()+"&s="+Choose+"\">Today</a>");
                     out.println(" is : <b> "+Calendar.getInstance().get(Calendar.DATE)+" "+MonthName[Calendar.getInstance().get(Calendar.MONTH)]+" "+Calendar.getInstance().get(Calendar.YEAR)+"</b></font>");*/
                     
                     out.println("<table width=\"100%\"><tr><td width=\"8%\">&nbsp;</td><td><font size=2>");
                     out.println("<a href =\""+DefaultURL+"/servlet/mCalendar?t="+Calendar.getInstance().getTime().getTime()+"&s="+Choose+"\">Today</a>"); 
                     out.println("</font></td><td><font size=2>&nbsp;<b>");
                     out.print(Calendar.getInstance().get(Calendar.DATE)+" "+MonthName[Calendar.getInstance().get(Calendar.MONTH)]+" "+Calendar.getInstance().get(Calendar.YEAR));
                     out.println("</b></font></td></tr><tr><td width=\"8%\">&nbsp;</td><td width=\"29%\"><font size=\"2\"><b>Time</b></font></td> <td width=\"63%\"> &nbsp;<b>");
                     out.println("<script language=\"JavaScript\" 1.2>");
                     out.println("<!--");
                     out.println("if(navigator.appName ==\"Netscape\") {");
                     out.println("document.write(\'<layer id=\"clock\"></layer><br>\');");
                     out.println("}");
                     out.println("if (navigator.appVersion.indexOf(\"MSIE\") != -1){");
                     out.println("document.write(\'<span id=\"clock\"></span>\');");
                     out.println("}");
                     out.println("function upclock(){");
                     out.println("var dte = new Date();");
                     out.println("var hrs = dte.getHours();");
                     out.println("var min = dte.getMinutes();");
                     out.println("var sec = dte.getSeconds();");
                     out.println("var col = \":\";");
                     out.println("var spc = \" \";");
                     out.println("var com = \",\";");
                     out.println("var apm;");
                     out.println("if (12 < hrs) {");
                     out.println("apm=\"PM\";");
                     out.println("hrs-=12;");
                     out.println("}");
                     out.println("else {");
                     out.println("apm=\"AM\";");
                     out.println("}");
                     out.println("if (hrs == 0) hrs=12;");
                     out.println("if (hrs<=9) hrs=\"0\"+hrs;");
                     out.println("if (min<=9) min=\"0\"+min;");
                     out.println("if (sec<=9) sec=\"0\"+sec;");
                     out.println("if(navigator.appName == \"Netscape\") {");
                     out.println("document.clock.document.write(\"<font  size=\\\"2\\\" >\"+hrs+col+min+col+sec+spc+apm+\"</font>\");");
                     out.println("document.clock.document.close();");
                     out.println("}");
                     out.println("if (navigator.appVersion.indexOf(\"MSIE\") != -1){");
                     out.println("clock.innerHTML = \"<font  size=\\\"2\\\" >\"+hrs+col+min+col+sec+spc+apm+\"</font>\";");
                     out.println("}}");
                     out.println("setInterval(\"upclock()\",1000);");
                     out.println("//--></script>");
                     out.println("</b></td></tr></table>");
                     
                     out.println("</td></tr></tbody></table></td>");
                     
          }//MakeCalendar
}//Class  PrintCalendar        
   class PrintToDo
   {    public static void MakeToDo(String DefaultURL,Connection theConnection,String UserID,PrintWriter out,int CDate,int CMonth,int CYear,String []MonthName)
         {   //out.println("<form method=\"post\" action=\"ToDo\">"); 
                            /*    try{        Statement theStatement = theConnection.createStatement (ResultSet.TYPE_SCROLL_SENSITIVE, 
                                              ResultSet.CONCUR_UPDATABLE);
                                              ResultSet theResult=theStatement.executeQuery("select  no_todo,timeout,priority,title,note,id  from  todo where id = ' "+UserID+"'");
                                              //removetodo(theResult,CDate,CMonth,CYear,MonthName);
                                                while (theResult.next())
                                                    {      Calendar DBCalendar = new GregorianCalendar();
                                                            DBCalendar.setTime(theResult.getDate(2));
                                                            if(DBCalendar.get(DBCalendar.YEAR) < CYear) {theResult.deleteRow();}
                                                              else if(DBCalendar.get(DBCalendar.YEAR) == CYear)
                                                                 if(DBCalendar.get(DBCalendar.MONTH)<CMonth) {theResult.deleteRow();}
                                                                  else if(DBCalendar.get(DBCalendar.MONTH)==CMonth)
                                                                    if(DBCalendar.get(DBCalendar.DATE)<CDate)  { theResult.deleteRow();}
                                                     }//while
                                              theResult.close();
                                              theStatement.close();  } 
                                catch (Exception e) {out.println(e.getMessage());}*/
              out.println("<table width=\"100%\" border=\"1\"><tr bgcolor=\"#FFFFCC\">");
              out.println("<td height=\"23\"> <font size=\"-1\">&nbsp;<b>&nbsp;&nbsp;To Do&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
              out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>&nbsp;");
              out.println("<a href=\""+DefaultURL+"/servlet/ToDo\">Add</a></font></td></tr>");
              out.println("<tr><td><table width=\"100%\" border=\"0\"><TBODY><tr valign=\"middle\"> ");
              out.println("<td width=\"16%\" align=\"center\"><b><font size=\"-1\">No.</font></b></td>");
              out.println("<td width=\"48%\"><b><font size=\"-1\">Title</font></b></td>");
              out.println("<td width=\"36%\" ><b><font size=\"-1\">Date</font></b></td></tr>");
               out.println("<form method=\"post\" action=\"Deletetodo\" name=\"ToDo\">");    
               try{      Statement theStatement=theConnection.createStatement();
                           ResultSet  theResult=theStatement.executeQuery("select priority,timeout,title,no_todo  from  todo where id = ' "+UserID+"' order by priority desc");
                           while (theResult.next())
                             {             Calendar ShowCalendar = new GregorianCalendar();
                                            ShowCalendar.setTime(theResult.getDate(2));
                                            int ShowDate = ShowCalendar.get(ShowCalendar.DATE);
                                            int ShowMonth = ShowCalendar.get(ShowCalendar.MONTH);
                                            int ShowYear = ShowCalendar.get(ShowCalendar.YEAR);
                                            int no = theResult.getInt(4);
                                           out.println("<tr valign=\"center\">");
                                           out.println("<td width=\"16%\" align=\"center\"><input type=\"checkbox\" name=\"check\" value="+no+"></td>");
                                           out.print("<td width=\"48%\"><a href=\""+DefaultURL+"/servlet/ShowUpdateToDo?n="+no+"\" ");
                                             if (theResult.getInt(1)==4)   
                                                {  out.print("ONMOUSEOVER=\"popup(\'Most\',\'#FC2E2E\')\";");
                                                    out.print(" ONMOUSEOUT=\"kill()\">");
                                                    out.print("<font size=\"2\" color=\"FC2E2E\"") ;
                                                 }
                                             if (theResult.getInt(1)==3)   
                                                 {  out.print("ONMOUSEOVER=\"popup(\'Medium\',\'#537FF2\')\";");
                                                    out.print(" ONMOUSEOUT=\"kill()\">");
                                                    out.print("<font size=\"2\" color=\"537FF2\"") ;
                                                  }
                                             if (theResult.getInt(1)==2) 
                                                 {  out.print("ONMOUSEOVER=\"popup(\'Less\',\'#75E594\')\";");
                                                    out.print(" ONMOUSEOUT=\"kill()\">");
                                                    out.print("<font size=\"2\" color=\"75E594\"") ;
                                                  }                                            
                                            if (theResult.getInt(1)==1) 
                                                 {  out.print("ONMOUSEOVER=\"popup(\'No Identify\',\'#FFC675\')\";");
                                                    out.print(" ONMOUSEOUT=\"kill()\">");
                                                    out.print("<font size=\"2\" color=\"FFC675\"") ;
                                                  }                                                 
                                            /*if (theResult.getInt(1)==4)   out.print("color=\"FC2E2E\"") ;
                                                   else if (theResult.getInt(1)==3)   out.print("color=\"537FF2\"") ;
                                                       else if (theResult.getInt(1)==2)   out.print("color=\"75E594\""); 
                                                            else if (theResult.getInt(1)==1)   out.print("color=\"FFC675\""); */
                                            out.print(">"+theResult.getString(3)+"</font></a></td>");
                                            out.print("<td width=\"36%\"><font size=\"-1\" >"+ShowDate+"/");
                                                if ( ShowMonth < 10 ) out.print("0");
                                           out.println((ShowMonth+1)+"/"+ShowYear+"</font></td></tr>");
                            }
                           theResult.close();
                           theStatement.close();
                            } catch (Exception e) { out.println(e.getMessage()); }
                                                     
              out.println("<tr valign=center><td align=center colspan=\"3\"><a href=\"javascript:SetCheck(0)\"><font size=2 >Check All</font></a> ");
              out.println("<a href=\"javascript:SetCheck(1)\"><font size=2 >Clear</font></a>  ");
              out.println("<input type=\"submit\" name=\"submit3\" value=\"Remove\"></td></tr></tbody></table>");
              out.println("<tr><td height=\"20\" valign=\"center\"><font size=\"-1\"><b>&nbsp;Priority</b></font>");
              out.println("&nbsp;<font size=\"-1\">Max</font>");
              out.println("&nbsp;&nbsp;<img src=\"/planny/picture/Priority.jpg\" width=\"47\" height=\"8\">&nbsp;&nbsp;");
              out.println("<font size=\"-1\">Min</font> </td></tr></table></td></tr>");
              out.println("</form>");
        }//MakeToDo	
public static String OutPutToDo(String InputTest) 
    { int nut=0;
       if(InputTest.indexOf('&')!= -1) {
       nut=0;
       while(true) {
            InputTest=InputTest.substring(0,InputTest.indexOf('&',nut)).concat("&amp;"+InputTest.substring((InputTest.indexOf('&',nut)+1)));
            nut = InputTest.indexOf('&',nut);
            if (nut == InputTest.lastIndexOf('&') )  break;
            nut =nut+1;
                           } }
      if(InputTest.indexOf('<')!= -1) {
       nut=0;
       while(true) {
            if (InputTest.lastIndexOf('<')==-1 )  break;
            InputTest=InputTest.substring(0,InputTest.indexOf('<',nut)).concat("&lt;"+InputTest.substring((InputTest.indexOf('<',nut)+1)));
                             } }                                                        
        if(InputTest.indexOf('>')!= -1) {
       nut=0;
       while(true) {
            if (InputTest.lastIndexOf('>')==-1 )  break;
            InputTest=InputTest.substring(0,InputTest.indexOf('>',nut)).concat("&gt;"+InputTest.substring((InputTest.indexOf('>',nut)+1)));
                             } }                                                          
       if(InputTest.indexOf(" ")!= -1) {
       nut=0;
       while(true) {
            if (InputTest.lastIndexOf(" ")==-1 )  break;
            InputTest=InputTest.substring(0,InputTest.indexOf(" ",nut)).concat("&nbsp;"+InputTest.substring((InputTest.indexOf(" ",nut)+1)));
                             } }                                            
       return InputTest;
       }  //OutPut
}//To Do
    class PrintQuickAdd
    {   public static void MakeQuickAdd(String DefaultURL,String []MonthName,int CHour,int CDate,int CMonth,int Cyear,PrintWriter out)
        {    out.println("<form method=\"post\" action=\"QuickAdd\">"); 
              out.println("<table width=\"100%\" border=\"1\" height=\"264\"><tr valign=\"middle\" bgcolor=\"#FFFFCC\">");
              out.println("<td valign=\"middle\" bgcolor=\"#FFFFCC\" height=\"23\">&nbsp;&nbsp;<b><font size=\"-1\">Quick Add</font></b></td>");
              out.println("</tr><tr><td height=\"221\" valign=\"top\"> ");
              out.println("<table width=\"100%\" border=\"0\" height=\"73\"><tr><td height=\"65\"> ");
              out.println("<table width=\"100%\" border=\"0\" height=\"50\"><tr><td align=\"left\"><font size=\"-1\">");
              out.println("<b> Title &nbsp; <input type=\"text\" name=\"TitleQA\" size=\"18\" maxlength=\"25\"></b></font></td></tr>");
              out.println("<tr><td align=\"left\" height=\"15\"><font size=\"-1\"><b> Type&nbsp; ");
              out.println("<select name=\"TypeQA\">");
              out.println("<option value=\"Anniversary\">Anniversary</option>");
             out.println("<option value=\"Appointment\" selected>Appointment</option>");
             out.println("<option value=\"BillPayment\">Bill Payment</option>");
             out.println("<option value=\"Birthday\">Birthday</option>");
             out.println("<option value=\"Breakfast\">Breakfast</option>");
             out.println("<option value=\"Call\">Call</option>");
             out.println("<option value=\"Chat\">Chat</option>");
             out.println("<option value=\"Class\">Class</option>");
              out.println("<option value=\"ClubEvent\">Club Event</option>");
              out.println("<option value=\"Concert\">Concert</option>");
              out.println("<option value=\"Date\">Date</option>");
              out.println("<option value=\"Dinner\">Dinner</option>");
              out.println("<option value=\"Graduation\">Graduation</option>");
              out.println("<option value=\"HappyHour\">Happy Hour</option>");
              out.println("<option value=\"Holiday\">Holiday</option>");
              out.println("<option value=\"Interview\">Interview</option>");
              out.println("<option value=\"Lunch\">Lunch</option>");
              out.println("<option value=\"Meeting\">Meeting</option>");
              out.println("<option value=\"Movie\">Movie</option>");
              out.println("<option value=\"NetEvent\">Net Event</option>");
              out.println("<option value=\"Other\">Other</option>");
              out.println("<option value=\"Party\">Party</option>");
              out.println("<option value=\"Performance\">Performance</option>");
              out.println("<option value=\"Reunion\">Reunion</option>");
              out.println("<option value=\"SportsEvent\">Sports Event</option>");
              out.println("<option value=\"Travel\">Travel</option>");
              out.println("<option value=\"TVShow\">TV Show</option>");
              out.println("<option value=\"Vacation\">Vacation</option>");
              out.println("<option value=\"Wedding\">Wedding</option></select>");
              out.println("</b></font></td></tr>");
              out.println("</table></td></tr></table>");
              out.println("<table width=\"100%\" border=\"0\" height=\"61\"><tr> ");
              out.println("<td height=\"121\"> <b><font size=\"-1\">Start Date&amp;Time <select  name=StartMonQA>");
                                 for (int i=1;i<=12;i++)  
                                        {  out.print("<option value=\"");
          	                       if ( i<10 )      out.print("0");
          	                       out.print(i+"\"");
          	                       if ( CMonth == i-1 ) out.print("selected");   
          	                       out.println(">"+MonthName[i-1]+"</option>"); 
                                         }
             out.println("</select><select name=StartDayQA>");
                                  for (int i=1;i<=31;i++)  
                                        { out.print("<option value=\"");
          	                      if ( i<10 )      out.print("0");
          	                      out.print(i+"\"");
          	                      if ( CDate == i ) out.print("selected");   
          	                      out.println(">"+i+"</option>"); 
                                         }
              out.println("</select><br><select name=StartHourQA>");
                                         for (int i=0;i<=23;i++)  
                                        { out.print("<option value=\"");
          	                      //if ( i<10 )      out.print("0");
          	                      out.print(i+"\"");
          	                      if ( CHour == i ) out.print("selected");   
          	                      if ( i <10 ) {out.println(">0"+i+"</option>"); }     
          	                          else {out.println(">"+i+"</option>"); }     
                                         }
              out.println("</select><select name=StartMinQA>");
              for (int i=0;i<=45;i=i+15) {
                out.print("<option value=");
                if (i<10) out.print("0");
               out.print(i+">:");
               if (i<10) out.print("0");  
               out.print(i);
               out.println("</option>");    }
              out.println("</select><br>Final Date &amp; Time <select  name=FinalMonthQA>");
              out.println("<option selected value=\"\" selected>None</option>");
                                   for (int i=1;i<=12;i++)  
                                        {  out.print("<option value=\"");
          	                       if ( i<10 )      out.print("0");
          	                       out.print(i+"\"");
          	                       out.println(">"+MonthName[i-1]+"</option>"); 
                                         }
             out.println("</select><select name=FinalDayQA><option selected value=\"\" selected>None</option>");
                                        for (int i=1;i<=31;i++)  
                                        { out.print("<option value=\"");
          	                      if ( i<10 )      out.print("0");
          	                      out.print(i+"\"");
          	                      out.println(">"+i+"</option>"); 
                                         }
            out.println("</select><br><select name=FinalHourQA>");
            out.println("<option selected value=\"\" selected>None</option>");
                                        for (int i=0;i<=23;i++)  
                                        { out.print("<option value=\"");
          	                     out.print(i+"\"");
          	                      if ( i <10 ) {out.println(">0"+i+"</option>"); }     
          	                          else {  out.println(">"+i+"</option>"); }
                                         }
              out.println("</select><select name=FinalMinQA><option selected value=\"\" selected>None</option><option  value=00><font face=\"Arial,Helvetica\">:00</font></option>");
              out.println("<option value=15><font face=\"Arial,Helvetica\">:15</font></option><option value=30><font face=\"Arial,Helvetica\">:30</font></option>");
              out.println("<option  value=45><font face=\"Arial,Helvetica\">:45</font></option></select>"); 
              out.println("</font></b></td></tr></table>");
              out.println("<b><font size=\"-1\"> &nbsp;<input type=\"submit\" name=\"Submit2\" value=\"   Add   \"></font></b></td></tr></table></td></tr></form> ");
           }//MakeQuicAdd
    }//QuickAdd             
 class PrintFind 
    {    public static void  MakeFind(String DefaultURL,String GiveTime,String Choose,PrintWriter out)
          {        
             out.println("<table width=\"100%\" border=\"1\" height=\"123\"><tr bgcolor=\"#FFFFCC\"> ");
             out.println("<form method=post action="+DefaultURL+"/servlet/mCalendar ><td height=\"23\"><b><font size=\"-1\"> &nbsp;&nbsp;Find</font></b></td></tr>");
             out.println("<tr><td height=\"84\" valign=\"top\"><font size=\"-1\"><b> </b></font><table width=\"100%\" border=\"0\" height=\"43\">");
             out.println("<tr><td height=\"54\"><font size=\"-1\"><b> &nbsp;&nbsp;Title &nbsp;<input type=\"text\" name=\"TitleFind\" size=\"18\" maxlength=\"25\">");
             out.println("<br>&nbsp; Type");
             out.println("<select name=\"TypeFind\">");
             out.println("<option value=\"null\" selected>- No Select -</option>");
             out.println("<option value=\"Anniversary\">Anniversary</option>");
             out.println("<option value=\"Appointment\" >Appointment</option>");
             out.println("<option value=\"BillPayment\">Bill Payment</option>");
             out.println("<option value=\"Birthday\">Birthday</option>");
             out.println("<option value=\"Breakfast\">Breakfast</option>");
             out.println("<option value=\"Call\">Call</option>");
             out.println("<option value=\"Chat\">Chat</option>");
             out.println("<option value=\"Class\">Class</option>");
              out.println("<option value=\"ClubEvent\">Club Event</option>");
              out.println("<option value=\"Concert\">Concert</option>");
              out.println("<option value=\"Date\">Date</option>");
              out.println("<option value=\"Dinner\">Dinner</option>");
              out.println("<option value=\"Graduation\">Graduation</option>");
              out.println("<option value=\"HappyHour\">Happy Hour</option>");
              out.println("<option value=\"Holiday\">Holiday</option>");
              out.println("<option value=\"Interview\">Interview</option>");
              out.println("<option value=\"Lunch\">Lunch</option>");
              out.println("<option value=\"Meeting\">Meeting</option>");
              out.println("<option value=\"Movie\">Movie</option>");
              out.println("<option value=\"NetEvent\">Net Event</option>");
              out.println("<option value=\"Other\">Other</option>");
              out.println("<option value=\"Party\">Party</option>");
              out.println("<option value=\"Performance\">Performance</option>");
              out.println("<option value=\"Reunion\">Reunion</option>");
              out.println("<option value=\"SportsEvent\">Sports Event</option>");
              out.println("<option value=\"Travel\">Travel</option>");
              out.println("<option value=\"TVShow\">TV Show</option>");
              out.println("<option value=\"Vacation\">Vacation</option>");
              out.println("<option value=\"Wedding\">Wedding</option></select>");
              out.println("</b></font></td></tr></table> &nbsp; ");
              out.println("<input type=\"hidden\" name=\"t\" value=\""+GiveTime+"\">");
              out.println("<input type=\"hidden\" name=\"s\" value=\""+Choose+"\">");
              out.println("<input type=\"submit\" name=\"Submit\" value=\"  Find  \">");
              out.println("</td></tr></form></table></td></tr>");
          }//MakeFind
}//PrintFind              

class PrintMainWeek
    {  static String []DayName2={"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"} ; 
        public static void  MakeMainWeek( int CurHour,Connection theConnection,String UserID,String DefaultURL,String []MonthName,int CDate,int CMonth,int CYear,int GDate,int GMonth,int GYear,PrintWriter out)
           {  int NumTitle=0;
               int Show1Date = 0;
               int Show1Month = 0;
                int Show1Year = 0;
                  int Show1DateE = 0;
               int Show1MonthE = 0;
                int Show1YearE = 0;
                 int Show2Date = 0;
                  int Show2Month = 0;
                   int Show2Year = 0;  
                   String Title="";
                   String Type="";
                   int Count = 1;
                   boolean checkday = false;
            Calendar GCalendar = new GregorianCalendar(GYear,GMonth,GDate);
             out.println("<TD height=770 rowSpan=6 valign=\"top\" align=\"center\">");
             out.println("<table width=\"100%\" border=\"0\"><tr bgcolor=\"#6699FF\"><td bgcolor=\"#6699FF\" align=\"center\">");
             out.println("<table width=\"100%\" border=\"0\" height=\"28\"><tr> ");
             out.println("<td align=\"right\" bgcolor=\"#FFFFCC\"><font >");
             GCalendar    = new GregorianCalendar(GYear,GMonth,GDate-6);
             out.print("<a href =\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"\"><b>&lt;&lt;</b></a>");
             //--- Print Date Name 
             out.println("<b> "+MonthName[GMonth]+" "+GDate);
             GCalendar    = new GregorianCalendar(GYear,GMonth,GDate+6);
             if ( (GCalendar.get(GCalendar.MONTH) !=GMonth) ||  (GCalendar.get(GCalendar.YEAR) !=GYear ) )
                 {       if ( /*(GCalendar.get(GCalendar.MONTH) != GMonth ) &&*/ (GCalendar.get(GCalendar.YEAR)==GYear ) )   
                             {    out.print(" - "+MonthName[GCalendar.get(GCalendar.MONTH)]+"  ");
                                   out.print(GCalendar.get(GCalendar.DATE)+" , ");
                                   out.println(GYear+" </b>");
                              }
                         else
                             {   out.print(" , "+GYear);
                                  out.print(" - "+MonthName[GCalendar.get(GCalendar.MONTH)]+"  ");
                                  out.print(GCalendar.get(GCalendar.DATE)+" , ");
                                  out.println(GCalendar.get(GCalendar.YEAR)+" </b>");
                              }
                 }else {
             out.println(" - "+GCalendar.get(GCalendar.DATE));
             out.println(" , "+GYear+" </b>");
                             }
             //---------------------                         
             out.println("<a href =\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"\"><b>&gt;&gt;</b></a>&nbsp;&nbsp;");
             out.println("</font></td></tr></table></td></tr>");
             out.println("<tr><td valign=\"top\" height=\"360\">");
             out.print("<form name=\"AddEvent\"><font size=\"2\">");
             GCalendar    = new GregorianCalendar(GYear,GMonth,GDate,CurHour,0);
             out.println("<a href=\""+DefaultURL+"/servlet/Reminder?t="+GCalendar.getTime().getTime()+"\">Add Event</a></font> ");
             out.println("<select name=\"AddEvent\" onChange=\"MM_jumpMenu('parent',this,0)\">");
                    for (int i=1;i<=7;i++) {
             out.print("<option value=\""+DefaultURL+"/servlet/Reminder?t="+GCalendar.getTime().getTime()+"\">");
              if (GCalendar.get(GCalendar.DATE) <10 ) out.print("0");
                 out.print(GCalendar.get(GCalendar.DATE));  out.print(" "+MonthName[GCalendar.get(GCalendar.MONTH)]); 
                 out.print(" "+GCalendar.get(GCalendar.YEAR));
                 out.println("</option>");
             GCalendar.add(GCalendar.DATE,1);
                                                      }   
             out.print("</select><b><font size=\"2\"> &nbsp;My Calendar</b>|<b>");
             out.print("<a href=\""+DefaultURL+"/servlet/gCalendar\">Groups Calendar</a></b>");
             out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
             out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
             out.println("<a href=\""+DefaultURL+"/servlet/gCalendar?c=1\">View Group</a>");
             
             out.println("</font></form>");
             out.println("<table width=\"100%\" border=\"0\" height=\"100%\">");
             GCalendar    = new GregorianCalendar(GYear,GMonth,GDate);
              for (int i=1;i<=7;i++)
                 {  out.println("<tr align=\"right\" bgcolor=\"#99CCFF\"><td bgcolor=\"#FFFFFF\" height=\"23\">");
                 out.println("<font size=\"2\" face=\"Verdana, Arial, Helvetica, sans-serif\">");
                 if (Vacation.NameVacation(GCalendar.get(GCalendar.MONTH),GCalendar.get(GCalendar.DATE)) != "" )
                     {  out.print(" <font Color=red>( "+Vacation.NameVacation(GCalendar.get(GCalendar.MONTH),GCalendar.get(GCalendar.DATE))+"  ) </font>");  }
                 out.print("<b>");      
                       if (GCalendar.get(GCalendar.DATE)==Calendar.getInstance().get(Calendar.DATE)) {
                            if (GCalendar.get(GCalendar.MONTH)==Calendar.getInstance().get(Calendar.MONTH) )
                                  if(GCalendar.get(GCalendar.YEAR)==Calendar.getInstance().get(Calendar.YEAR) )  {
                 out.println("<a href=\""+DefaultURL+"/servlet/mCalendar?t="+Calendar.getInstance().getTime().getTime()+"&s=0\">");
                 out.println("<font  color=\"#FF0000\">Today is</font></a> ");      } }
                 out.print( DayName2[ GCalendar.get(GCalendar.DAY_OF_WEEK)-1] );
                 out.print("&nbsp;<a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=0\">");
                 out.println(GCalendar.get(GCalendar.DATE) +"&nbsp;"+ MonthName[GCalendar.get(GCalendar.MONTH)] +"&nbsp;"+ GCalendar.get(GCalendar.YEAR));
                 out.println(" </a></font></b></td></tr><TR><TD bgColor=#d2e9ff height=\"25\">");
                 Calendar ShowStartCalendar = new GregorianCalendar();
                 Calendar ShowStartCalendarE = new GregorianCalendar();
                 int nogr = 0;
                  try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery("select  *  from calendar where id = ' "+UserID+"' order by time");
                               while(theResult.next()) {
                               	   NumTitle= theResult.getInt(1);
                                             Title = theResult.getString(5);
                                             Type = theResult.getString(6);
                               	   ShowStartCalendar.setTime(theResult.getDate(4));
                                             Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                             Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                             Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                             nogr = theResult.getInt(15);
                                               if ( (Show1Year == GCalendar.get(GCalendar.YEAR)) && (Show1Month == GCalendar.get(GCalendar.MONTH)) && (Show1Date == GCalendar.get(GCalendar.DATE)))  
                                              {  checkday = true;
                                                if (nogr==1) { 
                                              out.println("<table width=\"100%\" border=\"0\">");
                                              out.println("<tr><td width=\"11%\">&nbsp;</td>");
                                              out.print("<td width=\"43%\"><font size=\"2\"><b>"+Count+" . Title = </b>");
                                              out.print("<a href=\""+DefaultURL+"/servlet/ShowReminder?n="+NumTitle+"\">");
                                              out.print(Title+"</font></td>"); 
                                              out.println("<td width=\"46%\"><font size=\"2\"><b>Type = </b>"+Type+"</font></table>");
                                               Count++;}
                                              else
                                                if  ( theResult.getInt(10)==5)
                                                  { out.println("<table width=\"100%\" border=\"0\">");
                                                     out.println("<tr><td width=\"11%\">&nbsp;</td>");
                                                     out.print("<td width=\"43%\"><font size=\"2\"><b>"+Count+" . Group Title = </b>");
                                                     out.print("<a href=\""+DefaultURL+"/servlet/ViewEventGroup?n="+NumTitle+"\" ONMOUSEOVER=\"popup(\'Not Answer\',\'black\')\";");
                                                      out.println(" ONMOUSEOUT=\"kill()\">");
                                                     out.print("<font color=black>"+Title+"</font></a></font></td>");
                                                     out.println("<td width=\"46%\"><font size=\"2\"><b>Type = </b>"+Type+"</font></table>");
                                                    Count++;
                                                    }
                                            }
                                             
                                          } //while
                      theResult.close();
                      theStatement.close();  } 
                      catch (Exception e) {out.println(e.getMessage());}  
             
                  try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id =' "+UserID+"'"+
                             " )and check_mode = 2  and id = ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                               	  if (theResult.getInt(15) > 1){
                               	  NumTitle= theResult.getInt(1);
                                            Title = theResult.getString(5);
                                             Type = theResult.getString(6); 
                               	 ShowStartCalendar.setTime(theResult.getDate(4));
                                             Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                             Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                             Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                             nogr = theResult.getInt(15);
                                             if ( (Show1Year == GCalendar.get(GCalendar.YEAR)) && (Show1Month == GCalendar.get(GCalendar.MONTH)) && (Show1Date == GCalendar.get(GCalendar.DATE)))  
                                              {  checkday = true;
                                              out.println("<table width=\"100%\" border=\"0\">");
                                              out.println("<tr><td width=\"11%\">&nbsp;</td>");
                                              out.print("<td width=\"43%\"><font size=\"2\"><b>"+Count+" . Group Title = </b>");    
                      	    out.print("<a href=\""+DefaultURL+"/servlet/ViewAppointGroup2?n="+NumTitle+"\" ONMOUSEOVER=\"popup(\'Waiting Answer\',\'#ff9900\')\";");
                      	    out.println(" ONMOUSEOUT=\"kill()\">");
                                              out.print("<font color=#ff9900>"+Title+"</font></a></font></td>");
                                               out.println("<td width=\"46%\"><font size=\"2\"><b>Type = </b>"+Type+"</font></table>");
                                               Count++;    }
                                               }
                                                 } //while
                      theResult.close();
                      theStatement.close();  } 
                      catch (Exception e) {out.println(e.getMessage());}  
                      
                       try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id =' "+UserID+"'"+
                             " )and check_mode = 3  and id <> ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                               	  if (theResult.getInt(15) > 1){
                               	  NumTitle= theResult.getInt(1);
                                            Title = theResult.getString(5);
                                             Type = theResult.getString(6); 
                               	 ShowStartCalendar.setTime(theResult.getDate(4));
                                             Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                             Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                             Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                             nogr = theResult.getInt(15);
                                             if ( (Show1Year == GCalendar.get(GCalendar.YEAR)) && (Show1Month == GCalendar.get(GCalendar.MONTH)) && (Show1Date == GCalendar.get(GCalendar.DATE)))  
                                              {  checkday = true;
                                              out.println("<table width=\"100%\" border=\"0\">");
                                              out.println("<tr><td width=\"11%\">&nbsp;</td>");
                                              out.print("<td width=\"43%\"><font size=\"2\"><b>"+Count+" . Group Title = </b>");    
                      	    out.print("<a href=\""+DefaultURL+"/servlet/ViewAppointGroup?n="+NumTitle+"\" ONMOUSEOVER=\"popup(\'OK\',\'#00cc00\')\";");
                      	   out.println(" ONMOUSEOUT=\"kill()\">");
                                              out.print("<font color=#00cc00>"+Title+"</font></a></font></td>");
                                               out.println("<td width=\"46%\"><font size=\"2\"><b>Type = </b>"+Type+"</font></table>");
                                               Count++;    }
                                               }
                                                 } //while
                      theResult.close();
                      theStatement.close();  } 
                      catch (Exception e) {out.println(e.getMessage());}  
                      
                   try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id =' "+UserID+"'"+
                             " )and check_mode = 4  and id <> ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                               	  if (theResult.getInt(15) > 1){
                               	  NumTitle= theResult.getInt(1);
                                            Title = theResult.getString(5);
                                             Type = theResult.getString(6); 
                               	 ShowStartCalendar.setTime(theResult.getDate(4));
                                             Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                             Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                             Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                             nogr = theResult.getInt(15);
                                             if ( (Show1Year == GCalendar.get(GCalendar.YEAR)) && (Show1Month == GCalendar.get(GCalendar.MONTH)) && (Show1Date == GCalendar.get(GCalendar.DATE)))  
                                              {  checkday = true;
                                              out.println("<table width=\"100%\" border=\"0\">");
                                              out.println("<tr><td width=\"11%\">&nbsp;</td>");
                                              out.print("<td width=\"43%\"><font size=\"2\"><b>"+Count+" . Group Title = </b>");    
                      	    out.print("<a href=\""+DefaultURL+"/servlet/ViewAppointGroup?n="+NumTitle+"\" ONMOUSEOVER=\"popup(\'No\',\'#cc3333\')\";");
                                              out.println(" ONMOUSEOUT=\"kill()\">");
                                              out.print("<font color=#cc3333>"+Title+"</font></a></font></td>");
                                               out.println("<td width=\"46%\"><font size=\"2\"><b>Type = </b>"+Type+"</font></table>");
                                               Count++;    }
                                               }
                                                 } //while
                      theResult.close();
                      theStatement.close();  } 
                      catch (Exception e) {out.println(e.getMessage());}        
                      
                   try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id <>' "+UserID+"'"+
                             " )and check_mode = 2  and id = ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                               	  if (theResult.getInt(15) > 1){
                               	  NumTitle= theResult.getInt(1);
                                            Title = theResult.getString(5);
                                             Type = theResult.getString(6); 
                               	 ShowStartCalendar.setTime(theResult.getDate(4));
                                             Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                             Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                             Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                             nogr = theResult.getInt(15);
                                             if ( (Show1Year == GCalendar.get(GCalendar.YEAR)) && (Show1Month == GCalendar.get(GCalendar.MONTH)) && (Show1Date == GCalendar.get(GCalendar.DATE)))  
                                              {  checkday = true;
                                              out.println("<table width=\"100%\" border=\"0\">");
                                              out.println("<tr><td width=\"11%\">&nbsp;</td>");
                                              out.print("<td width=\"43%\"><font size=\"2\"><b>"+Count+" . Group Title = </b>");    
                      	    out.print("<a href=\""+DefaultURL+"/servlet/ViewEventGroup?n="+NumTitle+"\" ONMOUSEOVER=\"popup(\'Got Appointment\',\'#959500\')\";");
                                              out.println(" ONMOUSEOUT=\"kill()\">");
                                              out.print("<font color=#959500>"+Title+"</font></a></font></td>");
                                               out.println("<td width=\"46%\"><font size=\"2\"><b>Type = </b>"+Type+"</font></table>");
                                               Count++;    }
                                               }
                                                 } //while
                      theResult.close();
                      theStatement.close();  } 
                      catch (Exception e) {out.println(e.getMessage());}           
                      
                       try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id =' "+UserID+"'"+
                             " )and check_mode = 6  and id <> ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                               	  if (theResult.getInt(15) > 1){
                               	  NumTitle= theResult.getInt(1);
                                            Title = theResult.getString(5);
                                             Type = theResult.getString(6); 
                               	 ShowStartCalendar.setTime(theResult.getDate(4));
                                             Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                             Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                             Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                             nogr = theResult.getInt(15);
                                             if ( (Show1Year == GCalendar.get(GCalendar.YEAR)) && (Show1Month == GCalendar.get(GCalendar.MONTH)) && (Show1Date == GCalendar.get(GCalendar.DATE)))  
                                              {  checkday = true;
                                              out.println("<table width=\"100%\" border=\"0\">");
                                              out.println("<tr><td width=\"11%\">&nbsp;</td>");
                                              out.print("<td width=\"43%\"><font size=\"2\"><b>"+Count+" . Group Title = </b>");    
                      	    out.print("<a href=\""+DefaultURL+"/servlet/ViewAppointGroup2?n="+NumTitle+"\" ONMOUSEOVER=\"popup(\'Readed Answer\',\'#ff6644\')\";");
                                              out.println(" ONMOUSEOUT=\"kill()\">");
                                              out.print("<font color=#ff6644>"+Title+"</font></a></font></td>");
                                               out.println("<td width=\"46%\"><font size=\"2\"><b>Type = </b>"+Type+"</font></table>");
                                               Count++;    }
                                               }
                                                 } //while
                      theResult.close();
                      theStatement.close();  } 
                      catch (Exception e) {out.println(e.getMessage());}            
                      
                if (!(checkday)) {  out.println("&nbsp;"); } 
                out.println("</TD></tr>");
                GCalendar.add(GCalendar.DATE,1);
                checkday = false;
                Count=1;
                             } //for        
             out.println("</table></td></tr></table>");
          }//MainWeek
}          
class PrintMainMonth 
     {  public static void MakeMainMonth(int CurHour,Connection theConnection,String UserID,String DefaultURL,String []MonthName,int CurDate,int CurMonth,int CurYear,int GDate,int GMonth,int GYear,String Choose,PrintWriter out)
         {   out.println("<TD height=770 rowSpan=6 valign=\"top\" align=\"center\"><table width=\"100%\" border=\"0\" height=\"30\"><tr>");
             out.println("<td bgcolor=\"#6699FF\" height=\"30\"><table width=\"100%\" border=\"0\">");
             out.println("<tr><td bgcolor=\"#FFFFCC\" valign=\"middle\" align=\"center\" height=\"27\">");
             Calendar GCalendar = new GregorianCalendar(GYear,GMonth,GDate);
             GCalendar = new GregorianCalendar(GYear,GMonth-1,GDate);
             out.print("<b><a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=2\">&lt;&lt;</a> ");
             out.println(MonthName[GMonth]+" "+GYear+" " );
             GCalendar = new GregorianCalendar(GYear,GMonth+1,GDate);
             out.println("<a href=\""+DefaultURL+"/servlet/mCalendar/?t="+GCalendar.getTime().getTime()+"&s=2\">&gt;&gt;</a></b>");
             out.println("</td></tr></table></td></tr></table>");
             out.println("<table width=\"100%\" border=\"0\">");
             out.print("<form name=\"AddEventMonth\"><font size=\"2\">");
             GCalendar    = new GregorianCalendar(GYear,GMonth,1,CurHour,0);
             out.println("<a href=\""+DefaultURL+"/servlet/Reminder?t="+GCalendar.getTime().getTime()+"\">Add Event</a></font> ");
             out.println("<select name=\"AddEvent\" onChange=\"MM_jumpMenu('parent',this,0)\">");
                        for (int i=1;i<=31;i++) {
             out.print("<option value=\""+DefaultURL+"/servlet/Reminder?t="+GCalendar.getTime().getTime()+"\">");
              if (GCalendar.get(GCalendar.DATE) <10 ) out.print("0");
                 out.print(GCalendar.get(GCalendar.DATE));  out.print(" "+MonthName[GCalendar.get(GCalendar.MONTH)]); 
                 out.print(" "+GCalendar.get(GCalendar.YEAR));
                 out.println("</option>");
             GCalendar.add(GCalendar.DATE,1);
                                                      }   
             out.print("</select><b><font size=\"2\"> &nbsp;My Calendar</b>|");
             out.print("<a href=\""+DefaultURL+"/servlet/gCalendar\"><b>Groups Calendar</b></a></font>");
             out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
             out.println("&nbsp;&nbsp;&nbsp;&nbsp;");
             out.println("<font size=2><a href=\""+DefaultURL+"/servlet/gCalendar?c=1\">View Group</a></font></form>");
             
             out.println("<tr><td bgcolor=\"#6699FF\"><table width=\"100%\" border=\"0\">");
             out.println("<tr bgcolor=\"#E9E9E9\"><td width=\"42\" height=\"25\">&nbsp;</td>");
             out.println("<td width=\"67\" height=\"25\" align=\"center\" valign=\"middle\"><b><font size=\"2\">Sun</font></b></td>");
             out.println("<td width=\"67\" height=\"25\" align=\"center\" valign=\"middle\"><b><font size=\"2\">Mon</font></b></td>");
             out.println("<td width=\"67\" height=\"25\" align=\"center\" valign=\"middle\"><b><font size=\"2\">Tue</font></b></td>");
             out.println("<td width=\"67\" height=\"25\" align=\"center\" valign=\"middle\"><b><font size=\"2\">Wed</font></b></td>");
             out.println("<td width=\"67\" height=\"25\" align=\"center\" valign=\"middle\"><b><font size=\"2\">Thu</font></b></td>");
             out.println("<td width=\"67\" height=\"25\" align=\"center\" valign=\"middle\"><b><font size=\"2\">Fri</font></b></td>");
             out.println("<td width=\"67\" height=\"25\" align=\"center\" valign=\"middle\"><b><font size=\"2\">Sat</font></b></td></tr>");
               
               out.println("<tr bgcolor=\"#FFFFFF\"> ");
               out.println("<td width=\"42\" bgcolor=\"#E9E9E9\" height=\"48\" align=\"center\" valign=\"middle\" rowspan=\"2\">");
               GCalendar = new GregorianCalendar(GYear,GMonth,1);
               int DayOfWeek = GCalendar.get(GCalendar.DAY_OF_WEEK);
               GCalendar.add(GCalendar.DATE,-(DayOfWeek-1));
               out.println("<font size=\"2\"><a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=1\">View<br>Week</a></font></td>");
               for (int i=1;i<=(DayOfWeek-1);i++)   
                         { out.print("<td height=\"15\" valign=\"bottom\" bgcolor=\"#E9E9E9\" align=\"right\">");
                            out.print("<b><font size=\"2\"><a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s="+Choose+"\">");
                            out.println("<font color=\"#666666\">"+GCalendar.get(GCalendar.DATE)+"</font></a></font></b></td>"); 
                             GCalendar.add(GCalendar.DATE,1);
                         }
               boolean first=false;
               int date=1;
               int Days=DayOfWeek;
               String Title="";
               int Show1Date = 0;
               int Show1Month = 0;
               int Show1Year = 0;
               int Num = 1;
               int NumTitle = 0;
               for ( int weeks=0; weeks<6 ;weeks++)
	{  for (; Days<=7 ; Days++)          
                            {    GCalendar = new GregorianCalendar(GYear,GMonth,date);
                                  if (date>28)
                                     {  if (GCalendar.get(GCalendar.MONTH)==GMonth)
                                                  {  if ((CurDate != date)  || (CurMonth !=GCalendar.get(GCalendar.MONTH) ) || ( CurYear!=GCalendar.get(GCalendar.YEAR) ))
                                                          { out.print("<td height=\"15\" valign=\"bottom\" bgcolor=\"#99CCFF\" align=\"right\"><b>");
                                                             out.print("<a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=0\"><font size=\"2\"");
                                                             if ( Vacation.MakeVacation(GCalendar) )    out.print("color=\"#FF0000\"");
                                                             out.println(">"+date+"</font></a></b></td>");
                                                           }	
                                                     else {   
                                                     	   out.print("<td height=\"15\" valign=\"bottom\" bgcolor=\"#FFFFCC\" align=\"right\"><b>");
                                                                   GCalendar = new GregorianCalendar(CurYear,CurMonth,CurDate);
                                                                    out.print("<a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=0\"><font size=\"2\"");
                                                                   out.println(">"+date+"</font></a></b></td>");  
                                                                }//else
	                             }//if Month ==  Month
                                        else {  if   (Days !=1)   {
                                       	          out.print("<td height=\"15\" valign=\"bottom\" bgcolor=\"#E9E9E9\" align=\"right\"><b>");
                    	                               out.print("<font size=\"2\"><a href=\""+DefaultURL+"/servlet/mCalendar/?t="+GCalendar.getTime().getTime()+"&s=0\">");
                    	                               out.println("<font color=\"#666666\">"+GCalendar.get(GCalendar.DATE)+"</font></a></font></b></td>");
                    	                                                        } else  {  Days=8; }
                    	                             }//else Month == Month	                                  
                                           }/* if Date > 28*/  
                                 else     {     if  ((CurDate != date)  || (CurMonth !=GCalendar.get(GCalendar.MONTH) ) || ( CurYear!=GCalendar.get(GCalendar.YEAR) ))
                                                      { out.print("<td height=\"15\" valign=\"bottom\" bgcolor=\"#99CCFF\" align=\"right\"><b>");
                                                         out.print("<a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=0\"><font size=\"2\"");
                                                         if ( Vacation.MakeVacation(GCalendar) )    out.print("color=\"#FF0000\"");
                                                         out.println(">"+date+"</font></a></b></td>");
                                                       } else {  out.print("<td height=\"15\" valign=\"bottom\" bgcolor=\"#FFFFCC\" align=\"right\"><b>");
                                                                       GCalendar = new GregorianCalendar(CurYear,CurMonth,CurDate);
                                                                       out.print("<a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=0\"><font size=\"2\"");
                                                                       out.println(">"+date+"</font></a></b></td>");  
	                                               }//else	
                                                }//else	
                                 if  ( Days == 7 ) 
                                    { out.println("</tr><tr bgcolor=\"#FFFFFF\">");
                              GCalendar.add(GCalendar.DATE,-6); //Count Down Day 7 Day
                              int nogr = 0;
                               Calendar ShowStartCalendar = new GregorianCalendar();
                              for (int i=1; i <=7;i++) 
                                  { out.print("<td height=\"23\"  valign=\"center\"><font size=\"2\">");
                                     try{  Statement theStatement=theConnection.createStatement();
                                              ResultSet theResult=theStatement.executeQuery("select  * from calendar where id = ' "+UserID+"' order by time");
                                     while(theResult.next()) { 
                                       	ShowStartCalendar.setTime(theResult.getDate(4));
                                            Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                            Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                            Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                            Title = theResult.getString(5);
                                            NumTitle = theResult.getInt(1);
                                              nogr = theResult.getInt(15);
                                            if ( (Show1Year == GCalendar.get(GCalendar.YEAR)) && (Show1Month == GCalendar.get(GCalendar.MONTH)) && (Show1Date == GCalendar.get(GCalendar.DATE)))  
                                              {   if (nogr==1) { 
                                                  out.print("<b><font size=2> &nbsp;"+Num+". </font></b>");
                                                 out.print("<a href=\""+DefaultURL+"/servlet/ShowReminder?n="+NumTitle+"\">");
                                                 out.print(Title+"</a><br>");  
                                                  Num++;
                                                }  else   if  ( theResult.getInt(10)==5)
                                                {    out.print("<b> &nbsp;"+Num+". </b>");
                                                 out.print("<a href=\""+DefaultURL+"/servlet/ViewEventGroup?n="+NumTitle+"\" ONMOUSEOVER=\"popup(\'Not Answer\',\'black\')\";");
                                                 out.println(" ONMOUSEOUT=\"kill()\">");
                                                 out.print("<font size=2 color=black>"+Title+"</font></a></font><br>");  
                                                  Num++;   } 
                                                     }
                                                                                 } //While      
                                      theResult.close();
                                      theStatement.close();  
                                      Num=1; } 
                                     catch (Exception e) {out.println(e.getMessage());}       
                                     
                    try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id =' "+UserID+"'"+
                             " )and check_mode = 2  and id = ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                               	  if (theResult.getInt(15) > 1){
                               	  NumTitle= theResult.getInt(1);
                                            Title = theResult.getString(5);
                                             ShowStartCalendar.setTime(theResult.getDate(4));
                                             Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                             Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                             Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                             nogr = theResult.getInt(15);
                                             if ( (Show1Year == GCalendar.get(GCalendar.YEAR)) && (Show1Month == GCalendar.get(GCalendar.MONTH)) && (Show1Date == GCalendar.get(GCalendar.DATE)))  
                                              {   out.print("<b><font size=2> &nbsp;"+Num+". </font></b>");
                                                 out.print("<a href=\""+DefaultURL+"/servlet/ViewAppointGroup2?n="+NumTitle+"\" ONMOUSEOVER=\"popup(\'Waiting Answer\',\'#ff9900\')\";");
                      	      out.println(" ONMOUSEOUT=\"kill()\">");
                                                 out.print("<font size=2 color=#ff9900>"+Title+"</font></a></font><br>");  
                                                  Num++;   }     
                                            }  
                                   } //while
                      theResult.close();
                      theStatement.close();  } 
                      catch (Exception e) {out.println(e.getMessage());}         
                                     
                  try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id =' "+UserID+"'"+
                             " )and check_mode = 3  and id <> ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                               	  if (theResult.getInt(15) > 1){
                               	  NumTitle= theResult.getInt(1);
                                            Title = theResult.getString(5);                     
                                            ShowStartCalendar.setTime(theResult.getDate(4));
                                             Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                             Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                             Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                             nogr = theResult.getInt(15);
                                             if ( (Show1Year == GCalendar.get(GCalendar.YEAR)) && (Show1Month == GCalendar.get(GCalendar.MONTH)) && (Show1Date == GCalendar.get(GCalendar.DATE)))  
                                              {   out.print("<b><font size=2> &nbsp;"+Num+". </font></b>");
                                                 out.print("<a href=\""+DefaultURL+"/servlet/ViewAppointGroup?n="+NumTitle+"\" ONMOUSEOVER=\"popup(\'OK\',\'#00cc00\')\";");
                      	       out.println(" ONMOUSEOUT=\"kill()\">");    
                                                 out.print("<font size=2 color=#00cc00>"+Title+"</font></a></font><br>");  
                                                  Num++;   }     
                                            }  
                                   } //while
                      theResult.close();
                      theStatement.close();  } 
                      catch (Exception e) {out.println(e.getMessage());}         
                                     
                 try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id =' "+UserID+"'"+
                             " )and check_mode = 4  and id <> ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                               	  if (theResult.getInt(15) > 1){
                               	  NumTitle= theResult.getInt(1);
                                            Title = theResult.getString(5);                       
                                              ShowStartCalendar.setTime(theResult.getDate(4));
                                             Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                             Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                             Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                             nogr = theResult.getInt(15);
                                             if ( (Show1Year == GCalendar.get(GCalendar.YEAR)) && (Show1Month == GCalendar.get(GCalendar.MONTH)) && (Show1Date == GCalendar.get(GCalendar.DATE)))  
                                              {   out.print("<b><font size=2> &nbsp;"+Num+". </font></b>");
                                                 out.print("<a href=\""+DefaultURL+"/servlet/ViewAppointGroup?n="+NumTitle+"\"  ONMOUSEOVER=\"popup(\'No\',\'#cc3333\')\";");
                                                 out.println(" ONMOUSEOUT=\"kill()\">");
                                                 out.print("<font size=2 color=#cc3333>"+Title+"</font></a></font><br>");  
                                                  Num++;   }     
                                            }  
                                   } //while
                      theResult.close();
                      theStatement.close();  } 
                      catch (Exception e) {out.println(e.getMessage());}      
                                     
                         try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id <>' "+UserID+"'"+
                             " )and check_mode = 2  and id = ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                               	  if (theResult.getInt(15) > 1){
                               	  NumTitle= theResult.getInt(1);
                                            Title = theResult.getString(5);              
                                              ShowStartCalendar.setTime(theResult.getDate(4));
                                             Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                             Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                             Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                             nogr = theResult.getInt(15);
                                             if ( (Show1Year == GCalendar.get(GCalendar.YEAR)) && (Show1Month == GCalendar.get(GCalendar.MONTH)) && (Show1Date == GCalendar.get(GCalendar.DATE)))  
                                              {   out.print("<b><font size=2> &nbsp;"+Num+". </font></b>");
                                                 out.print("<a href=\""+DefaultURL+"/servlet/ViewEventGroup?n="+NumTitle+"\" ONMOUSEOVER=\"popup(\'Got Appointment\',\'#959500\')\";");
                                                 out.println(" ONMOUSEOUT=\"kill()\">");
                                                 out.print("<font size=2 color=#959500>"+Title+"</font></a></font><br>");  
                                                  Num++;   }     
                                            }  
                                   } //while
                      theResult.close();
                      theStatement.close();  } 
                      catch (Exception e) {out.println(e.getMessage());}  
                                     
                          try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id =' "+UserID+"'"+
                             " )and check_mode = 6  and id <> ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                               	  if (theResult.getInt(15) > 1){
                               	  NumTitle= theResult.getInt(1);
                                            Title = theResult.getString(5);               
                                             ShowStartCalendar.setTime(theResult.getDate(4));
                                             Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                             Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                             Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                             nogr = theResult.getInt(15);
                                             if ( (Show1Year == GCalendar.get(GCalendar.YEAR)) && (Show1Month == GCalendar.get(GCalendar.MONTH)) && (Show1Date == GCalendar.get(GCalendar.DATE)))  
                                              {   out.print("<b><font size=2> &nbsp;"+Num+". </font></b>");
                                                 out.print("<a href=\""+DefaultURL+"/servlet/ViewAppointGroup2?n="+NumTitle+"\" ONMOUSEOVER=\"popup(\'Readed Answer\',\'#ff6644\')\";");
                                                 out.println(" ONMOUSEOUT=\"kill()\">");                    
                                                 out.print("<font size=2 color=#ff6644>"+Title+"</font></a></font><br>");  
                                                  Num++;   }     
                                            }  
                                   } //while
                      theResult.close();
                      theStatement.close();  } 
                      catch (Exception e) {out.println(e.getMessage());}  
                                                                
                                    GCalendar.add(GCalendar.DATE,1);
                                    out.println("</font></td>"); 
                              }//For i =1; -> 7
                                    out.println("</tr>");                
                                    GCalendar = new GregorianCalendar(GYear,GMonth,date+1);
                                    if ( GCalendar.get(GCalendar.MONTH)==GMonth)  out.println("<tr bgcolor=\"#FFFFFF\">");
                                     }	   
                                 date++;
	     }//for    days
	           if (date>31)  continue;	
	           GCalendar= new GregorianCalendar(GYear,GMonth,date);
	           if ( GCalendar.get(GCalendar.MONTH)==GMonth)  { 
	           out.println("<td width=\"42\" bgcolor=\"#E9E9E9\" height=\"48\" align=\"center\" valign=\"middle\" rowspan=\"2\">");
                                out.print("<font size=\"2\"><a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=1\">");
                                out.println("View<br>Week</a></font></td>");  }
	  Days=1;        
                }//for week     
              
             out.println("</tr>");
             out.println("</table></td></tr></table><br></TD></TR>");
           }	
 }//Class
class PrintMainYear  {
public static void MakeMainYear(String DefaultURL,String []MonthName,int GDate,int GMonth,int GYear,String Choose,PrintWriter out)
    {   out.println("<TD height=770 rowSpan=6 valign=\"top\" align=\"center\"><table width=\"100%\" border=\"0\" height=\"30\"><tbody><tr>");
         out.println("<td bgcolor=\"#6699FF\" height=\"30\"><table width=\"100%\" border=\"0\"><tbody>");
         out.println("<tr><td bgcolor=\"#FFFFCC\" valign=\"middle\" align=\"center\" height=\"27\">");
         //int MakeDate=GDate;
         int MakeMonth=0;
         Calendar GCalendar = new GregorianCalendar(GYear,GMonth,GDate);
         GCalendar = new GregorianCalendar(GYear-1,GMonth,GDate);
         out.print("<b><a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=3\">&lt;&lt;</a> ");
         out.println(" "+GYear+" " );
         GCalendar = new GregorianCalendar(GYear+1,GMonth,GDate);
         out.println("<a href=\""+DefaultURL+"/servlet/mCalendar/?t="+GCalendar.getTime().getTime()+"&s=3\">&gt;&gt;</a></b>");
         out.println("</td></tr></tbody></table></td></tr></tbody></table>");
         out.println("<table width=\"100%\" border=\"0\"><tbody><tr><td  colspan=7 height=22  valign=center>");
         out.println("<b><font size=\"2\"> &nbsp;My Calendar</b>|");
         out.print("<a href=\""+DefaultURL+"/servlet/gCalendar\"><b>Groups Calendar</b></a></font>");
         out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
         out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
         out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
         out.println("<font size=2><a href=\""+DefaultURL+"/servlet/gCalendar?c=1\">View Group</a></font></form>");
         out.println("</td></tr>");
         for(int row=1;row<=4;row++)
           {  out.println("<tr valign=\"top\">  ");
               for(int col=1;col<=3;col++)
                { 
                   out.println("<td><table align=center border=\"0\" height=\"142\" width=\"90%\">");
                   out.println("<tbody><tr align=\"middle\" valign=\"center\" bgcolor=\"#6699FF\"><td colspan=\"7\"><b><font size=\"2\">");
                  GCalendar = new GregorianCalendar(GYear,MakeMonth,GDate);
                  out.print("<a href=\""+DefaultURL+"/servlet/mCalendar/?t="+GCalendar.getTime().getTime()+"&s=2\"><font color=\"Black\">");
                  out.println(MonthName[MakeMonth]+"</font></a>");
                  out.println("</font></b></td></tr><tbody>");
                  
                  out.println("<tr align=\"middle\" valign=\"bottom\">");
                  out.println("<td height=20><font size=2><b>Su</b></font></td>");
                  out.println("<td height=20><b><font size=2>Mo</font></b></td>");
                  out.println("<td height=20><b><font size=2>Tu</font></b></td>");
                  out.println("<td height=20><b><font size=2>We</font></b></td>");
                  out.println("<td height=20><b><font size=2>Th</font></b></td>");
                  out.println("<td height=20><b><font size=2>Fr</font></b></td>");
                  out.println("<td height=20><b><font size=2>Sa</font></b></td></tr>");
                  out.println("<tr valign=\"center\" align=\"center\">"); 
                  int DayOfWeek = GCalendar.get(GCalendar.DAY_OF_WEEK);
                  GCalendar.add(GCalendar.DATE,-(DayOfWeek-1));
                  for (int i=1;i<=(DayOfWeek-1);i++)   
                         {   out.println ("<td><a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=1\">");
                              out.println("<font size=\"2\" color=\"#999999\">"+GCalendar.get(GCalendar.DATE)+"</font></a></td>"); 
                              GCalendar.add(GCalendar.DATE,1);
                          }
                  int date=1;
                  int Days=DayOfWeek;
                  for ( int weeks=0; weeks<6 ;weeks++)
	     {      for (; Days<=7 ; Days++)
                                     {    GCalendar = new GregorianCalendar(GYear,MakeMonth,date);
                                     	if (date>28)
	                                      {   if (GCalendar.get(GCalendar.MONTH)==MakeMonth){
		                          out.print ("<td><a href =\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=0\"><font size=\"2\"");
		                          if ( Vacation.MakeVacation(GCalendar) )  
		                          out.print("color=\"#FF0000\"><b>"+GCalendar.get(GCalendar.DATE)+"</b></font></a></td>"); 
		                          else if (Days== 1) out.print("color=\"#FF0000\">"+GCalendar.get(GCalendar.DATE)+"</b></font></a></td>");
		                          else out.println(">"+GCalendar.get(GCalendar.DATE)+"</font></a></td>");  }
		                          /*if (Days==1) out.print("color=\"#FF0000\"");
		                          out.println(">"+date+"</a></font></td>");}*/
		                      else  {  if (Days !=1)	{                      	
		                      out.println("<td><a href =\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=0\">");
		                      out.print("<font size=\"2\" ");
		                       /*if (Days==1) out.print("color=\"#FF0000\"");*/
		                       out.print("color=\"#999999\"");
		                      out.println(">"+GCalendar.get(GCalendar.DATE)+"</font></a></td>");
		                      GCalendar.add(GCalendar.DATE,1);
		                                                                }   else Days=7;
		                                 }                               
		                     }//if
	                                 else
		              { out.println("<td><a href =\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=0\">");
		                 out.print("<font size=\"2\"");
		                   if ( Vacation.MakeVacation(GCalendar) )  
		                          out.print("color=\"#FF0000\"><b>"+GCalendar.get(GCalendar.DATE)+"</b></font></a></td>"); 
		                          else if (Days== 1) out.print("color=\"#FF0000\">"+GCalendar.get(GCalendar.DATE)+"</b></font></a></td>");
		                          else out.println(">"+GCalendar.get(GCalendar.DATE)+"</font></a></td>");  }
		            date++;
	                 }               if (date>31) continue;
                                                       Days=1;
	                                 out.println("</tr><tr valign=\"bottom\" align=\"center\">");
	    }//for     
               out.println("</table></td>");
                MakeMonth++;
                } 
              out.println("</tr>");  
            }//for row    
       out.println("</TABLE><BR></TD></TR>");
     }//Method 
}//class
class PrintCalendarYear
     {   public static void MakeCalendarYear (String DefaultURL,String []MonthName,int GDate,int GMonth,int GYear,String Choose,PrintWriter out)
            {
                     Calendar GCalendar    = new GregorianCalendar(GYear,GMonth,GDate);
                     out.println("<tr><td  valign=\"top\">");
                     out.println("<table width=\"100%\" border=\"1\" height=\"32%\"><tbody><tr valign=\"bottom\" align=\"center\">");
                     out.println("<td height=\"23\" ");
                     if (Choose.equals("0")) { out.print(" bgcolor=\"#FFFFCC\">"); } else { out.print(">");}
                     out.println("<a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=0\">");
                     out.println("<font size=\"2\">Day</a></font></td>");
                     out.println("<td height=\"23\"");
                     if (Choose.equals("1")) { out.print(" bgcolor=\"#FFFFCC\">"); } else { out.print(">");}
                     out.println("<a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=1\">");
                     out.println("<font size=\"2\">Week</a></font></td>");
                     out.println("<td height=\"23\"");
                     if (Choose.equals("2")) { out.print(" bgcolor=\"#FFFFCC\">"); } else { out.print(">");}
                     out.println("<a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=2\">");
                     out.println("<font size=\"2\">Month</a></font></td>");
                     out.println("<td height=\"23\"");
                     if (Choose.equals("3")) { out.print(" bgcolor=\"#FFFFCC\">"); } else { out.print(">");}
                     out.println("<a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=3\">");
                     out.println("<font size=\"2\">Year</a></font></td></tr>");
                     out.println("<tr valign=\"center\" align=\"center\" bgcolor=\"#FFFFCC\">");
                     GCalendar = new GregorianCalendar(GYear-1,GMonth,GDate);
                     out.println("<td colspan=\"8\" height=\"25\"><font size=\"2\"><a href =\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s="+Choose+"\"><b>&lt;&lt;</b></a>");
                     out.println("<b>"+GYear+"</b>");
                     GCalendar = new GregorianCalendar(GYear+1,GMonth,GDate);
                     out.println("<a href =\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s="+Choose+"\"><b> &gt;&gt;</b></font></a></td></tr>"); 
                     out.println("<TR vAlign=middle><TD colSpan=8 height=73><table width=\"100%\" border=\"0\">");
                     int DoYear=Calendar.getInstance().get(Calendar.YEAR)+1;
                     for(int r=1;r<4;r++)
                        {   out.print("<tr>");
                              for(int c=1;c<4;c++)
                                  {  GCalendar = new GregorianCalendar(DoYear,GMonth,GDate);
                                      out.println("<td valign=\"middle\" align=\"center\"><b><font size=\"2\">");
                                      out.println("<a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s="+Choose+"\">"+DoYear+"</a></font></b></td>");
                                      DoYear++;
                                   }
                             out.println("</tr>");
                        }
                    out.println("</table></TD></TR><TR align=\"middle\"  bgColor=\"#ffffcc\"  vAlign=\"center\">");
                    out.println("<td colspan=\"8\" height=\"28\">");
                    out.println("<font size=\"2\"><a href =\""+DefaultURL+"/servlet/mCalendar?t="+Calendar.getInstance().getTime().getTime()+"&s=1\">Today</a>");
                    out.println(" is : <b> "+Calendar.getInstance().get(Calendar.DATE)+" "+MonthName[Calendar.getInstance().get(Calendar.MONTH)]+" "+Calendar.getInstance().get(Calendar.YEAR)+"</b></font></td>");
                    out.println("</tr></tbody></table></td>");
      } //Method
}//Class
class PrintCalendarMonth
     {   public static void MakeCalendarMonth (String DefaultURL,String []MonthName,int GDate,int GMonth,int GYear,String Choose,PrintWriter out)
            {       Calendar GCalendar    = new GregorianCalendar(GYear,GMonth,GDate);
                     out.println("<tr><td  valign=\"top\">");
                     out.println("<table width=\"100%\" border=\"1\" height=\"32%\"><tbody><tr valign=\"bottom\" align=\"center\">");
                     out.println("<td height=\"23\" ");
                     if (Choose.equals("0")) { out.print(" bgcolor=\"#FFFFCC\">"); } else { out.print(">");}
                     out.println("<a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=0\">");
                     out.println("<font size=\"2\">Day</a></font></td>");
                     out.println("<td height=\"23\"");
                     if (Choose.equals("1")) { out.print(" bgcolor=\"#FFFFCC\">"); } else { out.print(">");}
                     out.println("<a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=1\">");
                     out.println("<font size=\"2\">Week</a></font></td>");
                     out.println("<td height=\"23\"");
                     if (Choose.equals("2")) { out.print(" bgcolor=\"#FFFFCC\">"); } else { out.print(">");}
                     out.println("<a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=2\">");
                     out.println("<font size=\"2\">Month</a></font></td>");
                     out.println("<td height=\"23\"");
                     if (Choose.equals("3")) { out.print(" bgcolor=\"#FFFFCC\">"); } else { out.print(">");}
                     out.println("<a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=3\">");
                     out.println("<font size=\"2\">Year</a></font></td></tr>");
                     out.println("<tr valign=\"center\" align=\"center\" bgcolor=\"#FFFFCC\">");
                     GCalendar = new GregorianCalendar(GYear,GMonth-1,GDate);
                     out.println("<td colspan=\"8\" height=\"25\"><font size=\"2\"><a href =\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=2\"><b>&lt;&lt;</b></a>");
                     out.println("<b>"+MonthName[GMonth]+"</b>");
                     GCalendar = new GregorianCalendar(GYear,GMonth+1,GDate);
                     out.println("<a href =\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s="+Choose+"\"><b> &gt;&gt;</b></font></a></td></tr>"); 
                     out.println("<TR vAlign=\"top\" align=\"center\"><TD colSpan=8 height=116>");
                     out.println("<table width=\"100%\" border=\"0\">");
                     GCalendar = new GregorianCalendar(GYear,0,GDate);
                     for(int i=1;i<7;i++) 
                          {   out.println("<tr><td width=\"14%\">&nbsp;</td><td width=\"38%\"><font size=\"2\">");
                                if ( GCalendar.get(GCalendar.MONTH) != GMonth )  {
                               out.print("<a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=2\">"); 
                               out.print(MonthName[GCalendar.get(GCalendar.MONTH)]+"</a>"); }
                                   else { out.print("<b>"+MonthName[GCalendar.get(GCalendar.MONTH)]+"</b>" ); }
                               out.println("</font></td>");
                               GCalendar.add(GCalendar.MONTH,1);
                               out.println("<td width=\"6%\">&nbsp;</td>");
                               out.println("<td width=\"38%\"><font size=\"2\">");
                                if ( GCalendar.get(GCalendar.MONTH) != GMonth )  {
                               out.print("<a href=\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=2\">"); 
                               out.println(MonthName[GCalendar.get(GCalendar.MONTH)]+"</a>"); }
                                    else { out.print("<b>"+MonthName[GCalendar.get(GCalendar.MONTH)]+"</b>" );}
                               out.println("</font></td><td width=\"6%\">&nbsp;</td></tr>");
                               GCalendar.add(GCalendar.MONTH,1);
                           }
                    out.println("</table></TD></TR><TR align=\"middle\"  bgColor=\"#ffffcc\"  vAlign=\"center\">");
                    out.println("<td colspan=\"8\" height=\"28\">");
                    out.println("<font size=\"2\"><a href =\""+DefaultURL+"/servlet/mCalendar?t="+Calendar.getInstance().getTime().getTime()+"&s="+Choose+"\">Today</a>");
                    out.println(" is : <b> "+Calendar.getInstance().get(Calendar.DATE)+" "+MonthName[Calendar.getInstance().get(Calendar.MONTH)]+" "+Calendar.getInstance().get(Calendar.YEAR)+"</b></font></td>");
                    out.println("</tr></tbody></table></td>");
                }
}//Class PrintCalendarMonth

class PrintMainDay
    { 
        public static void  MakeMainDay(String UserID,Connection theConnection,String DefaultURL,String []DayName,String []MonthName,int CHour,int CDate,int CMonth,int CYear,int GDate,int GMonth,int GYear,PrintWriter out)   
        {     boolean check=true;
              out.println("<TD height=770 rowSpan=6 valign=\"top\">");
              out.println("<table width=\"100%\" border=\"0\"><tr bgcolor=\"#6699FF\"><td bgcolor=\"#6699FF\">");
              out.println("<table width=\"100%\" border=\"0\" height=\"28\"><tr> ");
              out.println("<td align=\"right\" bgcolor=\"#FFFFCC\">");
              Calendar GCalendar = new GregorianCalendar(GYear,GMonth,GDate);
              GCalendar = new GregorianCalendar(GYear,GMonth,GDate-1);
              out.print("<a href =\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=0\"><b>&lt;&lt;</b></a><font size=2>");
              if ( Vacation.NameVacation(GMonth,GDate) != "" )
               {  out.print(" <font Color=red>( "+Vacation.NameVacation(GMonth,GDate)+"  )</font>");  } 
              out.print("  <b>"+DayName[GCalendar.get(GCalendar.DAY_OF_WEEK)-1]+" "+GDate+" "+MonthName[GMonth]+" "+GYear+" </b></font>");
              GCalendar = new GregorianCalendar(GYear,GMonth,GDate+1);
              out.println("<a href =\""+DefaultURL+"/servlet/mCalendar?t="+GCalendar.getTime().getTime()+"&s=0\"><b>&gt;&gt;</b></a>&nbsp;&nbsp;");
              out.println("</td></tr></table></td></tr>");
              out.println("<tr><td valign=\"top\" height=\"360\"><table width=\"100%\"  high =\"100%\" border=\"0\" >");
              out.println("<tr><td  colspan=7 height=22  valign=center>");
              out.println("<b><font size=\"2\"> &nbsp;My Calendar</b>|");
              out.print("<a href=\""+DefaultURL+"/servlet/gCalendar\"><b>Groups Calendar</b></a></font>");
              out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
             out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
             out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
             out.println("<font size=2><a href=\""+DefaultURL+"/servlet/gCalendar?c=1\">View Group</a></font></form>");
              out.println("</td></tr><TBODY>");
              out.println("<TR valign=\"center\"><TD align=middle bgColor=#6699cc height=27 colspan=\"7\">");
              out.println("<B><FONT  face=\"Verdana, Arial, Helvetica, sans-serif\" size=2>Event Time</FONT></B></TD></TR>");
                Calendar ShowStartCalendar = new GregorianCalendar();
               Calendar ShowFinalCalendar = new GregorianCalendar();
               Calendar ShowTimeCalendar = new GregorianCalendar();
              boolean checkfirst = false;
              boolean checkmid = false;
              boolean checkfinal = false;
               int Show1Hour = 0;
                int Show1Min = 0;
                 int Show2Hour = 0;
                  int Show2Min = 0;
                  int nogr = 0;
                try{        Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery("select  * from calendar where id = ' "+UserID+"' order by time");
                               while(theResult.next()) {
                                       	 checkfirst = false;
                                       	 checkmid = false;
                                       	 checkfinal = false;
                                       	  ShowStartCalendar.setTime(theResult.getDate(4));
                                            int Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                            int Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                            int Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                           
                                           ShowTimeCalendar.setTime(theResult.getDate(2));
                                           int Show3Date = ShowTimeCalendar.get(ShowTimeCalendar.DATE);
                                           int Show3Month = ShowTimeCalendar.get(ShowTimeCalendar.MONTH);
                                           int Show3Year = ShowTimeCalendar.get(ShowTimeCalendar.YEAR);
                                           
                                           ShowFinalCalendar.setTime(theResult.getDate(3));
                                           int Show2Date = ShowFinalCalendar.get(ShowFinalCalendar.DATE);
                                           int Show2Month = ShowFinalCalendar.get(ShowFinalCalendar.MONTH);
                                           int Show2Year = ShowFinalCalendar.get(ShowFinalCalendar.YEAR);
                                           
                                           if( (ShowStartCalendar.equals(ShowTimeCalendar)) &&( ShowTimeCalendar.before(ShowFinalCalendar))  )
                                           checkfirst = true;
                                           if   ( (ShowStartCalendar.after(ShowTimeCalendar)) &&  (ShowStartCalendar.before(ShowFinalCalendar))  )   
                                           checkmid = true;
                                            if   ( (ShowStartCalendar.after(ShowTimeCalendar)) &&  (ShowStartCalendar.equals(ShowFinalCalendar))  )   
                                           checkfinal = true;
                                           
                                            if (Show1Year == GYear)
                                                if  (Show1Month == GMonth)
                                                   if  (Show1Date == GDate)  {
                                                   	if( (!checkfirst) && (!checkmid) && (!checkfinal))                                                   	
                                                   	{ShowStartCalendar.setTime(theResult.getTime(4));
                                                                 Show1Hour = ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                                 Show1Min = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                   	  ShowFinalCalendar.setTime(theResult.getTime(3));
                                                   	  Show2Hour = ShowFinalCalendar.get(ShowFinalCalendar.HOUR_OF_DAY);
                                                                Show2Min = ShowFinalCalendar.get(ShowFinalCalendar.MINUTE);
               			} else if ((checkfirst) || (checkmid) )
               			  { ShowStartCalendar.setTime(theResult.getTime(4));
                                                                 Show1Hour = ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                                 Show1Min = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                                 Show2Hour = 23;
                                                                 Show2Min = 59;
                                                                } else if (checkfinal)
                                                                { Show1Hour = 0;
                                                                   Show1Min = 0;
                                                                   ShowFinalCalendar.setTime(theResult.getTime(3));
                                                   	  Show2Hour = ShowFinalCalendar.get(ShowFinalCalendar.HOUR_OF_DAY);
                                                                Show2Min = ShowFinalCalendar.get(ShowFinalCalendar.MINUTE);  }
               
               check=false;
              
               nogr = theResult.getInt(15);
              if (nogr==1) { 
             out.println("<TR><TD align=middle bgColor=#6699cc height=20 vAlign=middle width=\"20%\"><B>");
              out.println("<FONT  face=\"Verdana, Arial, Helvetica, sans-serif\" size=2>");
              if (Show1Hour < 10) out.print("0");  out.print(Show1Hour+":");
              if (Show1Min <10 ) out.print("0");    out.print(Show1Min);
             if ((Show1Hour != Show2Hour)|| (Show1Min != Show2Min)) {
              out.print(" - ");   if (Show2Hour < 10) out.print("0");   out.print(Show2Hour+":");
              if (Show2Min <10 ) out.print("0");  out.print(Show2Min);   }
              out.println("</FONT></B></TD>");
              out.println("<TD bgColor=#99ccff height=20 vAlign=bottom  width=\"80%\" colspan=\"6\">&nbsp;&nbsp;");
              out.print("<font size=\"2\"><b>Title </b>&nbsp;=&nbsp;&nbsp;");
              out.print("<a href=\""+DefaultURL+"/servlet/ShowReminder?n="+theResult.getInt(1)+"\"><b>"+theResult.getString(5)+"</b></font></a>");
              out.print("<br>&nbsp;&nbsp;&nbsp;<font size=\"2\"><b>Type &nbsp;</b>=&nbsp;&nbsp;"+theResult.getString(6)+"</font>");
              out.print("<br>&nbsp;&nbsp;&nbsp;<font size=\"2\"><b>Final Date =&nbsp;&nbsp;</b>");
              out.print(Show2Date+"  ");   
              out.print(MonthName[Show2Month]+"  "); 
              out.println(Show2Year);  
               out.println("</font></TD></TR>");
              }  else   if  ( theResult.getInt(10)==5)
              { out.println("<TR><TD align=middle bgColor=#6699cc height=20 vAlign=middle width=\"20%\"><B>");
              out.println("<FONT  face=\"Verdana, Arial, Helvetica, sans-serif\" size=2>");
              if (Show1Hour < 10) out.print("0");  out.print(Show1Hour+":");
              if (Show1Min <10 ) out.print("0");    out.print(Show1Min);
             if ((Show1Hour != Show2Hour)|| (Show1Min != Show2Min)) {
              out.print(" - ");   if (Show2Hour < 10) out.print("0");   out.print(Show2Hour+":");
              if (Show2Min <10 ) out.print("0");  out.print(Show2Min);   }
              out.println("</FONT></B></TD>"); 
              out.println("<TD bgColor=#99ccff height=20 vAlign=bottom  width=\"80%\" colspan=\"6\">&nbsp;&nbsp;");
              out.print("<font size=\"2\"><b>Group Title </b>&nbsp;=&nbsp;&nbsp;");
              out.print("<a href=\""+DefaultURL+"/servlet/ViewEventGroup?n="+theResult.getInt(1)+"\"  ONMOUSEOVER=\"popup(\'Not Answer\',\'black\')\";");
              out.println(" ONMOUSEOUT=\"kill()\"><b><font size=2 color=black>"+theResult.getString(5)+"</font></b></font></a>");
              out.print("<br>&nbsp;&nbsp;&nbsp;<font size=\"2\"><b>Type &nbsp;</b>=&nbsp;&nbsp;"+theResult.getString(6)+"</font>");
              out.print("<br>&nbsp;&nbsp;&nbsp;<font size=\"2\"><b>Final Date =&nbsp;&nbsp;</b>");
              out.print(Show2Date+"  ");   
              out.print(MonthName[Show2Month]+"  "); 
              out.println(Show2Year);  
               out.println("</font></TD></TR>"); }
             }   } //while
                      theResult.close();
                      theStatement.close();  } 
                      catch (Exception e) {out.println(e.getMessage());}
        
          try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id =' "+UserID+"'"+
                             " )and check_mode = 2  and id = ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                               	  if (theResult.getInt(15) > 1){
        		 checkfirst = false;
                                       	 checkmid = false;
                                       	 checkfinal = false;
                                       	  ShowStartCalendar.setTime(theResult.getDate(4));
                                            int Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                            int Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                            int Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                           
                                           ShowTimeCalendar.setTime(theResult.getDate(2));
                                           int Show3Date = ShowTimeCalendar.get(ShowTimeCalendar.DATE);
                                           int Show3Month = ShowTimeCalendar.get(ShowTimeCalendar.MONTH);
                                           int Show3Year = ShowTimeCalendar.get(ShowTimeCalendar.YEAR);
                                           
                                           ShowFinalCalendar.setTime(theResult.getDate(3));
                                           int Show2Date = ShowFinalCalendar.get(ShowFinalCalendar.DATE);
                                           int Show2Month = ShowFinalCalendar.get(ShowFinalCalendar.MONTH);
                                           int Show2Year = ShowFinalCalendar.get(ShowFinalCalendar.YEAR);
                                           
                                           if( (ShowStartCalendar.equals(ShowTimeCalendar)) &&( ShowTimeCalendar.before(ShowFinalCalendar))  )
                                           checkfirst = true;
                                           if   ( (ShowStartCalendar.after(ShowTimeCalendar)) &&  (ShowStartCalendar.before(ShowFinalCalendar))  )   
                                           checkmid = true;
                                            if   ( (ShowStartCalendar.after(ShowTimeCalendar)) &&  (ShowStartCalendar.equals(ShowFinalCalendar))  )   
                                           checkfinal = true;
        
        		     if (Show1Year == GYear)
                                                if  (Show1Month == GMonth)
                                                   if  (Show1Date == GDate)  {
                                                   	if( (!checkfirst) && (!checkmid) && (!checkfinal))                                                   	
                                                   	{ShowStartCalendar.setTime(theResult.getTime(4));
                                                                 Show1Hour = ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                                 Show1Min = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                   	  ShowFinalCalendar.setTime(theResult.getTime(3));
                                                   	  Show2Hour = ShowFinalCalendar.get(ShowFinalCalendar.HOUR_OF_DAY);
                                                                Show2Min = ShowFinalCalendar.get(ShowFinalCalendar.MINUTE);
               			} else if ((checkfirst) || (checkmid) )
               			  { ShowStartCalendar.setTime(theResult.getTime(4));
                                                                 Show1Hour = ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                                 Show1Min = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                                 Show2Hour = 23;
                                                                 Show2Min = 59;
                                                                } else if (checkfinal)
                                                                { Show1Hour = 0;
                                                                   Show1Min = 0;
                                                                   ShowFinalCalendar.setTime(theResult.getTime(3));
                                                   	  Show2Hour = ShowFinalCalendar.get(ShowFinalCalendar.HOUR_OF_DAY);
                                                                Show2Min = ShowFinalCalendar.get(ShowFinalCalendar.MINUTE);  }
               
              check=false;
              out.println("<TR><TD align=middle bgColor=#6699cc height=20 vAlign=middle width=\"20%\"><B>");
              out.println("<FONT  face=\"Verdana, Arial, Helvetica, sans-serif\" size=2>");
              if (Show1Hour < 10) out.print("0");  out.print(Show1Hour+":");
              if (Show1Min <10 ) out.print("0");    out.print(Show1Min);
             if ((Show1Hour != Show2Hour) || (Show1Min != Show2Min)) {
              out.print(" - ");   if (Show2Hour < 10) out.print("0");   out.print(Show2Hour+":");
              if (Show2Min <10 ) out.print("0");  out.print(Show2Min);   }
              out.println("</FONT></B></TD>");
               out.println("<TD bgColor=#99ccff height=20 vAlign=bottom  width=\"80%\" colspan=\"6\">&nbsp;&nbsp;");
              out.print("<font size=\"2\"><b>Group Title </b>&nbsp;=&nbsp;&nbsp;");
              out.print("<a href=\""+DefaultURL+"/servlet/ ViewAppointGroup2?n="+theResult.getInt(1)+"\" ONMOUSEOVER=\"popup(\'Waiting Answer\',\'#ff9900\')\";");
              out.println(" ONMOUSEOUT=\"kill()\"><b><font size=2 color=#ff9900>"+theResult.getString(5)+"</font></b></font></a>");
              out.print("<br>&nbsp;&nbsp;&nbsp;<font size=\"2\"><b>Type &nbsp;</b>=&nbsp;&nbsp;"+theResult.getString(6)+"</font>");
              out.print("<br>&nbsp;&nbsp;&nbsp;<font size=\"2\"><b>Final Date =&nbsp;&nbsp;</b>");
              out.print(Show2Date+"  ");   
              out.print(MonthName[Show2Month]+"  "); 
              out.println(Show2Year);  
               out.println("</font></TD></TR>"); }
             }   } //while
                      theResult.close();
                      theStatement.close();  } 
                      catch (Exception e) {out.println(e.getMessage());}
        
           try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id =' "+UserID+"'"+
                             " )and check_mode = 3  and id <> ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                                  if (theResult.getInt(15) > 1){
        	           checkfirst = false;
                                       	 checkmid = false;
                                       	 checkfinal = false;
                                       	  ShowStartCalendar.setTime(theResult.getDate(4));
                                            int Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                            int Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                            int Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                           
                                           ShowTimeCalendar.setTime(theResult.getDate(2));
                                           int Show3Date = ShowTimeCalendar.get(ShowTimeCalendar.DATE);
                                           int Show3Month = ShowTimeCalendar.get(ShowTimeCalendar.MONTH);
                                           int Show3Year = ShowTimeCalendar.get(ShowTimeCalendar.YEAR);
                                           
                                           ShowFinalCalendar.setTime(theResult.getDate(3));
                                           int Show2Date = ShowFinalCalendar.get(ShowFinalCalendar.DATE);
                                           int Show2Month = ShowFinalCalendar.get(ShowFinalCalendar.MONTH);
                                           int Show2Year = ShowFinalCalendar.get(ShowFinalCalendar.YEAR);
                                           
                                           if( (ShowStartCalendar.equals(ShowTimeCalendar)) &&( ShowTimeCalendar.before(ShowFinalCalendar))  )
                                           checkfirst = true;
                                           if   ( (ShowStartCalendar.after(ShowTimeCalendar)) &&  (ShowStartCalendar.before(ShowFinalCalendar))  )   
                                           checkmid = true;
                                            if   ( (ShowStartCalendar.after(ShowTimeCalendar)) &&  (ShowStartCalendar.equals(ShowFinalCalendar))  )   
                                           checkfinal = true;
        
        		     if (Show1Year == GYear)
                                                if  (Show1Month == GMonth)
                                                   if  (Show1Date == GDate)  {
                                                   	if( (!checkfirst) && (!checkmid) && (!checkfinal))                                                   	
                                                   	{ShowStartCalendar.setTime(theResult.getTime(4));
                                                                 Show1Hour = ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                                 Show1Min = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                   	  ShowFinalCalendar.setTime(theResult.getTime(3));
                                                   	  Show2Hour = ShowFinalCalendar.get(ShowFinalCalendar.HOUR_OF_DAY);
                                                                Show2Min = ShowFinalCalendar.get(ShowFinalCalendar.MINUTE);
               			} else if ((checkfirst) || (checkmid) )
               			  { ShowStartCalendar.setTime(theResult.getTime(4));
                                                                 Show1Hour = ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                                 Show1Min = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                                 Show2Hour = 23;
                                                                 Show2Min = 59;
                                                                } else if (checkfinal)
                                                                { Show1Hour = 0;
                                                                   Show1Min = 0;
                                                                   ShowFinalCalendar.setTime(theResult.getTime(3));
                                                   	  Show2Hour = ShowFinalCalendar.get(ShowFinalCalendar.HOUR_OF_DAY);
                                                                Show2Min = ShowFinalCalendar.get(ShowFinalCalendar.MINUTE);  }
               
              check=false;
              out.println("<TR><TD align=middle bgColor=#6699cc height=20 vAlign=middle width=\"20%\"><B>");
              out.println("<FONT  face=\"Verdana, Arial, Helvetica, sans-serif\" size=2>");
              if (Show1Hour < 10) out.print("0");  out.print(Show1Hour+":");
              if (Show1Min <10 ) out.print("0");    out.print(Show1Min);
             if ((Show1Hour != Show2Hour) || (Show1Min != Show2Min)) {
              out.print(" - ");   if (Show2Hour < 10) out.print("0");   out.print(Show2Hour+":");
              if (Show2Min <10 ) out.print("0");  out.print(Show2Min);   }
              out.println("</FONT></B></TD>");
               out.println("<TD bgColor=#99ccff height=20 vAlign=bottom  width=\"80%\" colspan=\"6\">&nbsp;&nbsp;");
              out.print("<font size=\"2\"><b>Group Title </b>&nbsp;=&nbsp;&nbsp;");
              out.print("<a href=\""+DefaultURL+"/servlet/ViewAppointGroup?n="+theResult.getInt(1)+"\"  ONMOUSEOVER=\"popup(\'OK\',\'#00cc00\')\";");
              out.println(" ONMOUSEOUT=\"kill()\"><b><font size=2 color=#00cc00>"+theResult.getString(5)+"</font></b></font></a>");
              out.print("<br>&nbsp;&nbsp;&nbsp;<font size=\"2\"><b>Type &nbsp;</b>=&nbsp;&nbsp;"+theResult.getString(6)+"</font>");
              out.print("<br>&nbsp;&nbsp;&nbsp;<font size=\"2\"><b>Final Date =&nbsp;&nbsp;</b>");
              out.print(Show2Date+"  ");   
              out.print(MonthName[Show2Month]+"  "); 
              out.println(Show2Year);  
               out.println("</font></TD></TR>"); }
             }   } //while
                      theResult.close();
                      theStatement.close();  } 
                      catch (Exception e) {out.println(e.getMessage());}	
        		
            try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id =' "+UserID+"'"+
                             " )and check_mode = 4  and id <> ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                               	  if (theResult.getInt(15) > 1){
        		  checkfirst = false;
                                       	 checkmid = false;
                                       	 checkfinal = false;
                                       	  ShowStartCalendar.setTime(theResult.getDate(4));
                                            int Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                            int Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                            int Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                           
                                           ShowTimeCalendar.setTime(theResult.getDate(2));
                                           int Show3Date = ShowTimeCalendar.get(ShowTimeCalendar.DATE);
                                           int Show3Month = ShowTimeCalendar.get(ShowTimeCalendar.MONTH);
                                           int Show3Year = ShowTimeCalendar.get(ShowTimeCalendar.YEAR);
                                           
                                           ShowFinalCalendar.setTime(theResult.getDate(3));
                                           int Show2Date = ShowFinalCalendar.get(ShowFinalCalendar.DATE);
                                           int Show2Month = ShowFinalCalendar.get(ShowFinalCalendar.MONTH);
                                           int Show2Year = ShowFinalCalendar.get(ShowFinalCalendar.YEAR);
                                           
                                           if( (ShowStartCalendar.equals(ShowTimeCalendar)) &&( ShowTimeCalendar.before(ShowFinalCalendar))  )
                                           checkfirst = true;
                                           if   ( (ShowStartCalendar.after(ShowTimeCalendar)) &&  (ShowStartCalendar.before(ShowFinalCalendar))  )   
                                           checkmid = true;
                                            if   ( (ShowStartCalendar.after(ShowTimeCalendar)) &&  (ShowStartCalendar.equals(ShowFinalCalendar))  )   
                                           checkfinal = true;
        
        		     if (Show1Year == GYear)
                                                if  (Show1Month == GMonth)
                                                   if  (Show1Date == GDate)  {
                                                   	if( (!checkfirst) && (!checkmid) && (!checkfinal))                                                   	
                                                   	{ShowStartCalendar.setTime(theResult.getTime(4));
                                                                 Show1Hour = ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                                 Show1Min = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                   	  ShowFinalCalendar.setTime(theResult.getTime(3));
                                                   	  Show2Hour = ShowFinalCalendar.get(ShowFinalCalendar.HOUR_OF_DAY);
                                                                Show2Min = ShowFinalCalendar.get(ShowFinalCalendar.MINUTE);
               			} else if ((checkfirst) || (checkmid) )
               			  { ShowStartCalendar.setTime(theResult.getTime(4));
                                                                 Show1Hour = ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                                 Show1Min = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                                 Show2Hour = 23;
                                                                 Show2Min = 59;
                                                                } else if (checkfinal)
                                                                { Show1Hour = 0;
                                                                   Show1Min = 0;
                                                                   ShowFinalCalendar.setTime(theResult.getTime(3));
                                                   	  Show2Hour = ShowFinalCalendar.get(ShowFinalCalendar.HOUR_OF_DAY);
                                                                Show2Min = ShowFinalCalendar.get(ShowFinalCalendar.MINUTE);  }
               
              check=false;
              out.println("<TR><TD align=middle bgColor=#6699cc height=20 vAlign=middle width=\"20%\"><B>");
              out.println("<FONT  face=\"Verdana, Arial, Helvetica, sans-serif\" size=2>");
              if (Show1Hour < 10) out.print("0");  out.print(Show1Hour+":");
              if (Show1Min <10 ) out.print("0");    out.print(Show1Min);
             if ((Show1Hour != Show2Hour) || (Show1Min != Show2Min)) {
              out.print(" - ");   if (Show2Hour < 10) out.print("0");   out.print(Show2Hour+":");
              if (Show2Min <10 ) out.print("0");  out.print(Show2Min);   }
              out.println("</FONT></B></TD>");
               out.println("<TD bgColor=#99ccff height=20 vAlign=bottom  width=\"80%\" colspan=\"6\">&nbsp;&nbsp;");
              out.print("<font size=\"2\"><b>Group Title </b>&nbsp;=&nbsp;&nbsp;");
              out.print("<a href=\""+DefaultURL+"/servlet/ViewAppointGroup?n="+theResult.getInt(1)+"\"  ONMOUSEOVER=\"popup(\'No\',\'#cc3333\')\";");
              out.println(" ONMOUSEOUT=\"kill()\"><b><font size=2 color=#cc3333>"+theResult.getString(5)+"</font></b></font></a>");
              out.print("<br>&nbsp;&nbsp;&nbsp;<font size=\"2\"><b>Type &nbsp;</b>=&nbsp;&nbsp;"+theResult.getString(6)+"</font>");
              out.print("<br>&nbsp;&nbsp;&nbsp;<font size=\"2\"><b>Final Date =&nbsp;&nbsp;</b>");
              out.print(Show2Date+"  ");   
              out.print(MonthName[Show2Month]+"  "); 
              out.println(Show2Year);  
               out.println("</font></TD></TR>"); }
             }   } //while
                      theResult.close();
                      theStatement.close();  } 
                      catch (Exception e) {out.println(e.getMessage());}
        	
            try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id <>' "+UserID+"'"+
                             " )and check_mode = 2  and id = ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                               	  if (theResult.getInt(15) > 1){
         		  checkfirst = false;
                                       	 checkmid = false;
                                       	 checkfinal = false;
                                       	  ShowStartCalendar.setTime(theResult.getDate(4));
                                            int Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                            int Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                            int Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                           
                                           ShowTimeCalendar.setTime(theResult.getDate(2));
                                           int Show3Date = ShowTimeCalendar.get(ShowTimeCalendar.DATE);
                                           int Show3Month = ShowTimeCalendar.get(ShowTimeCalendar.MONTH);
                                           int Show3Year = ShowTimeCalendar.get(ShowTimeCalendar.YEAR);
                                           
                                           ShowFinalCalendar.setTime(theResult.getDate(3));
                                           int Show2Date = ShowFinalCalendar.get(ShowFinalCalendar.DATE);
                                           int Show2Month = ShowFinalCalendar.get(ShowFinalCalendar.MONTH);
                                           int Show2Year = ShowFinalCalendar.get(ShowFinalCalendar.YEAR);
                                           
                                           if( (ShowStartCalendar.equals(ShowTimeCalendar)) &&( ShowTimeCalendar.before(ShowFinalCalendar))  )
                                           checkfirst = true;
                                           if   ( (ShowStartCalendar.after(ShowTimeCalendar)) &&  (ShowStartCalendar.before(ShowFinalCalendar))  )   
                                           checkmid = true;
                                            if   ( (ShowStartCalendar.after(ShowTimeCalendar)) &&  (ShowStartCalendar.equals(ShowFinalCalendar))  )   
                                           checkfinal = true;
        
        		     if (Show1Year == GYear)
                                                if  (Show1Month == GMonth)
                                                   if  (Show1Date == GDate)  {
                                                   	if( (!checkfirst) && (!checkmid) && (!checkfinal))                                                   	
                                                   	{ShowStartCalendar.setTime(theResult.getTime(4));
                                                                 Show1Hour = ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                                 Show1Min = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                   	  ShowFinalCalendar.setTime(theResult.getTime(3));
                                                   	  Show2Hour = ShowFinalCalendar.get(ShowFinalCalendar.HOUR_OF_DAY);
                                                                Show2Min = ShowFinalCalendar.get(ShowFinalCalendar.MINUTE);
               			} else if ((checkfirst) || (checkmid) )
               			  { ShowStartCalendar.setTime(theResult.getTime(4));
                                                                 Show1Hour = ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                                 Show1Min = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                                 Show2Hour = 23;
                                                                 Show2Min = 59;
                                                                } else if (checkfinal)
                                                                { Show1Hour = 0;
                                                                   Show1Min = 0;
                                                                   ShowFinalCalendar.setTime(theResult.getTime(3));
                                                   	  Show2Hour = ShowFinalCalendar.get(ShowFinalCalendar.HOUR_OF_DAY);
                                                                Show2Min = ShowFinalCalendar.get(ShowFinalCalendar.MINUTE);  }
               
              check=false;
              out.println("<TR><TD align=middle bgColor=#6699cc height=20 vAlign=middle width=\"20%\"><B>");
              out.println("<FONT  face=\"Verdana, Arial, Helvetica, sans-serif\" size=2>");
              if (Show1Hour < 10) out.print("0");  out.print(Show1Hour+":");
              if (Show1Min <10 ) out.print("0");    out.print(Show1Min);
             if ((Show1Hour != Show2Hour) || (Show1Min != Show2Min)) {
              out.print(" - ");   if (Show2Hour < 10) out.print("0");   out.print(Show2Hour+":");
              if (Show2Min <10 ) out.print("0");  out.print(Show2Min);   }
              out.println("</FONT></B></TD>");
               out.println("<TD bgColor=#99ccff height=20 vAlign=bottom  width=\"80%\" colspan=\"6\">&nbsp;&nbsp;");
              out.print("<font size=\"2\"><b>Group Title </b>&nbsp;=&nbsp;&nbsp;");
              out.print("<a href=\""+DefaultURL+"/servlet/ViewEventGroup?n="+theResult.getInt(1)+"\" ONMOUSEOVER=\"popup(\'Got Appointment\',\'#959500\')\";");
               out.println(" ONMOUSEOUT=\"kill()\"><b><font size=2 color=#959500>"+theResult.getString(5)+"</font></b></font></a>");
              out.print("<br>&nbsp;&nbsp;&nbsp;<font size=\"2\"><b>Type &nbsp;</b>=&nbsp;&nbsp;"+theResult.getString(6)+"</font>");
              out.print("<br>&nbsp;&nbsp;&nbsp;<font size=\"2\"><b>Final Date =&nbsp;&nbsp;</b>");
              out.print(Show2Date+"  ");   
              out.print(MonthName[Show2Month]+"  "); 
              out.println(Show2Year);  
               out.println("</font></TD></TR>"); }
             }   } //while
                      theResult.close();
                      theStatement.close();  } 
                      catch (Exception e) {out.println(e.getMessage());}
         
         
            try{      Statement theStatement=theConnection.createStatement();
                              ResultSet theResult=theStatement.executeQuery(
                              "select * from calendar  where no_group in"+
 	        "(select no_group  from groupcal  where id =' "+UserID+"'"+
                             " )and check_mode = 6  and id <> ' "+UserID+"'  order by time");
                               while(theResult.next()) {       
                               	  if (theResult.getInt(15) > 1){
                             checkfirst = false;
                                       	 checkmid = false;
                                       	 checkfinal = false;
                                       	  ShowStartCalendar.setTime(theResult.getDate(4));
                                            int Show1Date = ShowStartCalendar.get(ShowStartCalendar.DATE);
                                            int Show1Month = ShowStartCalendar.get(ShowStartCalendar.MONTH);
                                            int Show1Year = ShowStartCalendar.get(ShowStartCalendar.YEAR);
                                           
                                           ShowTimeCalendar.setTime(theResult.getDate(2));
                                           int Show3Date = ShowTimeCalendar.get(ShowTimeCalendar.DATE);
                                           int Show3Month = ShowTimeCalendar.get(ShowTimeCalendar.MONTH);
                                           int Show3Year = ShowTimeCalendar.get(ShowTimeCalendar.YEAR);
                                           
                                           ShowFinalCalendar.setTime(theResult.getDate(3));
                                           int Show2Date = ShowFinalCalendar.get(ShowFinalCalendar.DATE);
                                           int Show2Month = ShowFinalCalendar.get(ShowFinalCalendar.MONTH);
                                           int Show2Year = ShowFinalCalendar.get(ShowFinalCalendar.YEAR);
                                           
                                           if( (ShowStartCalendar.equals(ShowTimeCalendar)) &&( ShowTimeCalendar.before(ShowFinalCalendar))  )
                                           checkfirst = true;
                                           if   ( (ShowStartCalendar.after(ShowTimeCalendar)) &&  (ShowStartCalendar.before(ShowFinalCalendar))  )   
                                           checkmid = true;
                                            if   ( (ShowStartCalendar.after(ShowTimeCalendar)) &&  (ShowStartCalendar.equals(ShowFinalCalendar))  )   
                                           checkfinal = true;
        
        		     if (Show1Year == GYear)
                                                if  (Show1Month == GMonth)
                                                   if  (Show1Date == GDate)  {
                                                   	if( (!checkfirst) && (!checkmid) && (!checkfinal))                                                   	
                                                   	{ShowStartCalendar.setTime(theResult.getTime(4));
                                                                 Show1Hour = ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                                 Show1Min = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                   	  ShowFinalCalendar.setTime(theResult.getTime(3));
                                                   	  Show2Hour = ShowFinalCalendar.get(ShowFinalCalendar.HOUR_OF_DAY);
                                                                Show2Min = ShowFinalCalendar.get(ShowFinalCalendar.MINUTE);
               			} else if ((checkfirst) || (checkmid) )
               			  { ShowStartCalendar.setTime(theResult.getTime(4));
                                                                 Show1Hour = ShowStartCalendar.get(ShowStartCalendar.HOUR_OF_DAY);
                                                                 Show1Min = ShowStartCalendar.get(ShowStartCalendar.MINUTE);
                                                                 Show2Hour = 23;
                                                                 Show2Min = 59;
                                                                } else if (checkfinal)
                                                                { Show1Hour = 0;
                                                                   Show1Min = 0;
                                                                   ShowFinalCalendar.setTime(theResult.getTime(3));
                                                   	  Show2Hour = ShowFinalCalendar.get(ShowFinalCalendar.HOUR_OF_DAY);
                                                                Show2Min = ShowFinalCalendar.get(ShowFinalCalendar.MINUTE);  }
               
              check=false;
              out.println("<TR><TD align=middle bgColor=#6699cc height=20 vAlign=middle width=\"20%\"><B>");
              out.println("<FONT  face=\"Verdana, Arial, Helvetica, sans-serif\" size=2>");
              if (Show1Hour < 10) out.print("0");  out.print(Show1Hour+":");
              if (Show1Min <10 ) out.print("0");    out.print(Show1Min);
             if ((Show1Hour != Show2Hour) || (Show1Min != Show2Min)) {
              out.print(" - ");   if (Show2Hour < 10) out.print("0");   out.print(Show2Hour+":");
              if (Show2Min <10 ) out.print("0");  out.print(Show2Min);   }
              out.println("</FONT></B></TD>");
               out.println("<TD bgColor=#99ccff height=20 vAlign=bottom  width=\"80%\" colspan=\"6\">&nbsp;&nbsp;");
              out.print("<font size=\"2\"><b>Group Title </b>&nbsp;=&nbsp;&nbsp;");
              out.print("<a href=\""+DefaultURL+"/servlet/ViewAppointGroup2?n="+theResult.getInt(1)+"\" ONMOUSEOVER=\"popup(\'Readed Answer\',\'#ff6644\')\";");
              out.println(" ONMOUSEOUT=\"kill()\"><b><font size=2 color=#ff6644>"+theResult.getString(5)+"</font></b></font></a>");
              out.print("<br>&nbsp;&nbsp;&nbsp;<font size=\"2\"><b>Type &nbsp;</b>=&nbsp;&nbsp;"+theResult.getString(6)+"</font>");
              out.print("<br>&nbsp;&nbsp;&nbsp;<font size=\"2\"><b>Final Date =&nbsp;&nbsp;</b>");
              out.print(Show2Date+"  ");   
              out.print(MonthName[Show2Month]+"  "); 
              out.println(Show2Year);  
               out.println("</font></TD></TR>"); }
             }   } //while
                      theResult.close();
                      theStatement.close();  } 
                      catch (Exception e) {out.println(e.getMessage());}    	  	
                               	  	
            if (check) 
                         { out.println("<TR><TD bgColor=#99ccff height=20 vAlign=center  align=center  width=\"80%\" colspan=\"7\">");
                            out.println("<font size=\"2\">No Event</font>"); 
                            out.println("</TD> </TR>");
                          }  
              out.println("<TR valign=\"middle\" align=\"center\"><TD bgColor=#6699cc height=27 colspan=\"7\">");
              out.println("<B><font face=\"Verdana, Arial, Helvetica, sans-serif\" size=\"2\">Time</font></B></TD></TR>");
              out.println("<tr><TD align=center bgColor=#6699cc height=40 vAlign=middle rowspan=\"2\">");
              out.println("<font face=\"Courier New, Courier, mono\" size=\"4\"><b>AM</b></font></TD>");
              GCalendar = new GregorianCalendar(GYear,GMonth,GDate);
              GCalendar.set(GCalendar.HOUR_OF_DAY,0);
              for(int a=1;a<=6;a++)
                        {   out.println(" <TD align=center bgColor=#6699cc height=20 vAlign=middle><b><font size=\"2\">");
                             out.print("<a href =\""+DefaultURL+"/servlet/Reminder?t="+GCalendar.getTime().getTime()+"\">");
                              if ( GCalendar.get(GCalendar.HOUR_OF_DAY) < 10 ) { out.print("0");}
                              out.print(GCalendar.get(GCalendar.HOUR_OF_DAY)+":00</a>");
                              out.println("</font></b></TD>");
                              GCalendar.add(GCalendar.HOUR_OF_DAY,1);
                         }
             out.println("</tr><tr>");
             for(int b=1;b<=6;b++)
                        {   out.println(" <TD align=center bgColor=#6699cc height=20 vAlign=middle><b><font size=\"2\">");
                             out.print("<a href =\""+DefaultURL+"/servlet/Reminder?t="+GCalendar.getTime().getTime()+"\">");
                              if ( GCalendar.get(GCalendar.HOUR_OF_DAY) < 10 ) { out.print("0");}
                              out.print(GCalendar.get(GCalendar.HOUR_OF_DAY)+":00</a>");
                              out.println("</font></b></TD>");
                              GCalendar.add(GCalendar.HOUR_OF_DAY,1);
                         }
             out.println("</tr><tr><TD align=center bgColor=#6699cc height=40 vAlign=middle rowspan=\"2\">");
             out.println("<font face=\"Courier New, Courier, mono\" size=\"4\"><b>PM</b></font></TD>");
             for(int c=1;c<=6;c++)
                       {   out.println(" <TD align=center bgColor=#6699cc height=20 vAlign=middle><b><font size=\"2\">");
                             out.print("<a href =\""+DefaultURL+"/servlet/Reminder?t="+GCalendar.getTime().getTime()+"\">");
                              out.print(GCalendar.get(GCalendar.HOUR_OF_DAY)+":00</a>");
                              GCalendar.add(GCalendar.HOUR_OF_DAY,1);
                              out.println("</font></b></TD>");
                         }
             out.println("</tr><tr>");
             for(int d=1;d<=6;d++)
                       {   out.println(" <TD align=center bgColor=#6699cc height=20 vAlign=middle><b><font size=\"2\">");
                             out.print("<a href =\""+DefaultURL+"/servlet/Reminder?t="+GCalendar.getTime().getTime()+"\">");
                              out.print(GCalendar.get(GCalendar.HOUR_OF_DAY)+":00</a>");
                              GCalendar.add(GCalendar.HOUR_OF_DAY,1);
                              out.println("</font></b></TD>");
                         }       
              out.println("</tr><TR><TD align=center bgColor=#6699cc height=18 vAlign=middle colspan=\"7\">&nbsp;</TD>");
              out.println("</TR></TBODY></TABLE></td></tr></table>");
      }
 }        
class Vacation  
 {     public static  boolean  MakeVacation(Calendar GCalendar)
    {       if ( (GCalendar.get(GCalendar.MONTH) == 0 )  
             &&  (GCalendar.get(GCalendar.DATE) == 1 ) )         return true;
            else if  ( (GCalendar.get(GCalendar.MONTH) == 3 )   
            &&  (GCalendar.get(GCalendar.DATE) == 6 ) )           return true; 
            else if ( (GCalendar.get(GCalendar.MONTH) == 4 )  
            &&  (GCalendar.get(GCalendar.DATE) == 1 ) )           return true;
            else if ( (GCalendar.get(GCalendar.MONTH) == 3 ) 
            &&  (GCalendar.get(GCalendar.DATE) == 13 ) )         return true; 
            else if ( (GCalendar.get(GCalendar.MONTH) == 4 )  
            &&  (GCalendar.get(GCalendar.DATE) == 5 ) )           return true; 
            else if ( (GCalendar.get(GCalendar.MONTH) == 7 )  
            &&  (GCalendar.get(GCalendar.DATE) == 12 ) )         return true;
            else  if ( (GCalendar.get(GCalendar.MONTH) == 9 )  
            &&  (GCalendar.get(GCalendar.DATE) == 23 ) )         return true; 
            else if  ( (GCalendar.get(GCalendar.MONTH) == 11 )  
            &&  (GCalendar.get(GCalendar.DATE) == 5 ) )            return true;     	
            else if ( (GCalendar.get(GCalendar.MONTH) == 11 )  
            &&  (GCalendar.get(GCalendar.DATE) == 10 ) )                 return true;     		
            else if ( (GCalendar.get(GCalendar.MONTH) == 11 )  
            &&  (GCalendar.get(GCalendar.DATE) == 25 ) )             return true;     	
            else if ( (GCalendar.get(GCalendar.MONTH) == 11 )  
            &&  (GCalendar.get(GCalendar.DATE) == 31 ) )      return true;     
            else return false;	 
     }
public static String NameVacation(int GMonth,int GDate)
    {        if  ( ( GMonth == 0 ) &&  (GDate == 1 )  )  return "New Year's Day"; 
            else if  ( (  GMonth== 3 ) &&  (GDate == 6 ) )             return "Chakri Day";
            else if ( (  GMonth== 3 )  && (GDate == 13 ))        return "Songkran Festival"; 
            else if ( (  GMonth== 4 )  && (GDate == 1 ))            return "Nation Labour Day";
            else if ( (  GMonth== 4 )  && (GDate == 5  ))           return "Coronation Day"; 
            else if ( (  GMonth== 7 )  &&(GDate == 12  ))         return "H.M. The Queen's Birthday"; 
            else  if ( ( GMonth== 9 ) &&   (GDate == 23 ))         return "Chulalongkorn Day"; 
            else if  ( (  GMonth== 11 ) &&  (GDate == 5  ))         return "H.M. The King's Birthday";    
            else if  ( (  GMonth== 11 ) && (GDate == 10  ) )   return "Constitution Day";     	
            else if ( (  GMonth== 11 )  && (GDate == 25  ))     return "Chrismas Day";  	
            else if ((  GMonth== 11 )  && (GDate == 31 ) )      return "New Year's Eve";    
            else return "";	 
        }
}//Vacation Calss	               


              
