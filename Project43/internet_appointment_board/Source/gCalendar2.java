import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class gCalendar2 extends HttpServlet
 {   String DefaultURL="http://161.246.5.233:8080/planny"; 
      static final int  CurDate      =  Calendar.getInstance().get(Calendar.DAY_OF_MONTH); 
      static final int  CurMonth   =  Calendar.getInstance().get(Calendar.MONTH); 
      static final int  CurYear      =  Calendar.getInstance().get(Calendar.YEAR); 
      static final int  CurHour      =  Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
      static final int  CurMin      =  Calendar.getInstance().get(Calendar.MINUTE);  
      static final String []DayName={"Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"} ;
      static final  String [] MonthName = {"January","February","March","April","May", "June","July","August","September","October","November","December"};
      Connection theConnection;
      protected void doGet(HttpServletRequest req , HttpServletResponse res) throws ServletException, IOException
       {    HttpSession session = req.getSession(true);
             String UserID = (String)session.getValue("login.username");	
             if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
               else session.putValue("lgoin.username",UserID);
       
            // String UserID="nut";
             String GiveTime = req.getParameter("t");
             String Choose = req.getParameter("c");
             int GDate= CurDate;
             int GMonth=CurMonth;
             int GYear=CurYear;
             if (GiveTime!=null) {
             Date MakeDate = new Date(Long.parseLong(GiveTime));
             Calendar GCalendar = new GregorianCalendar();
             GCalendar.setTime(MakeDate);
             GDate = GCalendar.get(GCalendar.DAY_OF_MONTH); 
             GMonth = GCalendar.get(GCalendar.MONTH);
             GYear = GCalendar.get(GCalendar.YEAR);
                             }
             res.setContentType("text/html");
             PrintWriter out = res.getWriter(); 
             out.println("<HTML><HEAD><TITLE>Planny Organizer</TITLE>");
             out.println("<META content=\"text/html; charset=windows-874\" http-equiv=Content-Type>");
             out.println("<STYLE type=text/css>BODY {MARGIN: 0px; PADDING-BOTTOM: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; PADDING-TOP: 0px}");
             out.println("</STYLE><META content=\"MSHTML 5.00.2614.3500\" name=GENERATOR>");
             //++++++++++++++++java script +++++++++++++++++++
                 out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
                 out.println("<!--");
                 out.println("function SetCheck(val) {");
                 out.println("dml=document.PVG;");
                 out.println("len = dml.elements.length;");
                 out.println("var i=0;");
                 out.println("for( i=0 ; i<len; i++) {");
                 out.println("if(val==0) dml[i].checked=true;");
                 out.println("else dml[i].checked=false;");
                 out.println("}}");
                 out.println("//--></script>");
                 //+++++++++++++++++++++++++++++++++++
             out.println("<STYLE TYPE=\"text/css\">");
             out.println("<!--");
             out.println("BODY {OVERFLOW:scroll;OVERFLOW-X:hidden}");
             out.println(".DEK {POSITION:absolute;VISIBILITY:hidden;Z-INDEX:200;}");
             out.println("//-->");
             out.println("</STYLE>");    
             out.println("</HEAD>");
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
             out.println("<tr><td colspan=\"4\"><hr color=\"#49B0FC\" size=\"3\" noshade></td></tr></tbody></table>");	
             out.println("<table width=\"100%\" border=\"0\" align=\"center\"><tr><td height=\"25\" width=\"190\">&nbsp;</td><td height=\"25\" width=\"579\">&nbsp;</td></tr>");
              Object  ErGr = session.getValue("login.messagegroup");
             if( ErGr!=null ) {
             out.println("<tr><td height=\"25\" width=\"190\">&nbsp;</td><td height=\"25\" width=\"579\">"+ErGr+"</td></tr>");	
             session.removeValue("login.messagegroup");    
                 } else { out.println("<tr><td height=\"25\" width=\"190\">&nbsp;</td><td height=\"25\" width=\"579\">&nbsp;</td></tr>"); }	
             
             out.println("<tr><td  valign=\"top\" width=\"190\">"); 
             PrintGroupCalendar.MakeCalendar(DefaultURL,MonthName,GDate,GMonth,GYear,out);
             CreateNewGroup(DefaultURL,out);
             AddNewMember(UserID,DefaultURL,out);
             //PrintGroupFind.MakeFind(DefaultURL,GiveTime,out);
             out.println("<TD align=center  vAlign=top width=\"579\"> ");
             if (Choose==null){
             MainGroup.PrintMainGroup(UserID,theConnection,out,DefaultURL,GDate,GMonth,GYear,MonthName,DayName); }
             else {PrintViewGroup(UserID,theConnection,out,DefaultURL,GDate,GMonth,GYear,MonthName,DayName); }
              out.println("</tbody></table></body></html>");
             out.flush();
             out.close();
        }//MainMethod     
        public  void CreateNewGroup(String DefaultURL,PrintWriter out)      
            {  out.println("<table border=1 height=123 width=\"100%\"><tbody><tr bgcolor=#ffffcc>");
                out.println("<td height=23><b><font size=-1>&nbsp;&nbsp;Create Group</font></b></td></tr>");
                out.println("<form method=\"post\" action=\""+DefaultURL+"/servlet/NewGroup\"><tr><td height=84 valign=top><font size=-1><b></b></font>"); 
                out.println("<table border=0 height=43 width=\"100%\"><tbody><tr> ");
                out.println("<td height=54><font size=-1><b>&nbsp;&nbsp;Type&nbsp; &nbsp;");
                out.println("<select name=\"CreateGType\">");
                out.println("<option selected  value=Other><font size=\"-1\"><b>Other</b></font></option>");
                out.println("<option value=\"Chat\" >Chat</option>");
                out.println("<option value=\"Clubs\">Clubs</option>");
                out.println("<option value=\"Games\">Games</option>");
                out.println("<option value=\"Friends\">Friends</option>");
                out.println("<option value=\"Sports\">Sports</option></select>");
                out.println("<br>&nbsp; Name&nbsp;&nbsp;");
                out.println("<input type=\"text\" name=\"CreateGName\" size=\"16\"><br>&nbsp;&nbsp;Note&nbsp;&nbsp;&nbsp; ");
                out.println("<input type=\"text\" name=\"CreateGNote\" size=\"16\">");
                out.println("</b></font></td></tr></tbody></table>");
                out.println("&nbsp;<input name=Submit22 type=submit value=\" Create \"></td></tr></form></tbody></table>");
            }//CreateNewGroup
        public   void AddNewMember(String UserID,String DefaultURL,PrintWriter out)              
             {  out.println("<table border=1 height=123 width=\"100%\"><tbody><tr bgcolor=#ffffcc>"); 
                out.println("<td height=23><b><font size=-1>&nbsp;&nbsp;Add Member</font></b></td></tr>");
                out.println("<form method=\"post\" action=\""+DefaultURL+"/servlet/NewMember\"><tr><td height=84 valign=top><font size=-1><b></b></font>"); 
                out.println("<table border=0 height=43 width=\"100%\">");
                out.println("<tbody><tr>"); 
                out.println("<td height=54><font size=-1><b>&nbsp;&nbsp;Name&nbsp;&nbsp;");
                out.println("<input  maxlength=25 name=AddMName size=16><br>");
                out.println("&nbsp; Group&nbsp;&nbsp;<select name=AddMGroup>");
                  try{    Class.forName("oracle.jdbc.driver.OracleDriver");
                                     theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                    }  catch (Exception e) { out.println(e.getMessage()); }
                  try{    Statement  theStatement=theConnection.createStatement();      
                         ResultSet theResult = theStatement.executeQuery(    
                         "select groupname from member where id = ' "+UserID+"' group by groupname ");
                         while (theResult.next())
                         { out.println("<option value=\""+theResult.getString(1)+"\">"+theResult.getString(1)+"</option>"); }
                         theResult.close();
                        theStatement.close();
                    }  catch (Exception e) { out.println(e.getMessage()); }     
                  out.println("</select><br>");
                 out.println("&nbsp; Type&nbsp; &nbsp;&nbsp;<select name=AddMType>");
                out.println("<option selected  value=Other><font size=\"-1\"><b>Other</b></font></option>");
                out.println("<option  value=Chat><font size=\"-1\"><b>Chat</b></font></option>");
                out.println("<option value=Clubs><font size=\"-1\"><b>Clubs</b></font></option>");
                out.println("<option value=Games><font size=\"-1\"><b>Games</b></font></option>");
                out.println("<option value=Friends><font size=\"-1\"><b>Friends</b></font></option>");
                out.println("<option value=Sports><font size=\"-1\"><b>Sports</b></font><b></b></option></select><BR>&nbsp; Status");
                out.println("<input type=\"text\" name=\"AddMStatus\" size=\"16\"><br>&nbsp;");
                out.println("Planny ID&nbsp;<input type=\"text\" name=\"AddMID\" size=\"13\"><br>&nbsp;&nbsp;Note &nbsp;&nbsp;");
                out.println("<input type=\"text\" name=\"AddMNote\" size=\"16\">");
                out.println("</b></font></td></tr></tbody></table>");
                out.println("&nbsp;<input name=Submit222 type=submit value=\" Add \"></td></tr></form></tbody></table>");
             }//AddNewMember  
     public  void PrintViewGroup(String UserID,Connection theConnection,PrintWriter out,String DefaultURL,int GDate,int GMonth,int GYear,String []MonthName,String []DayName)
       {    out.println("<form action=\""+DefaultURL+"/servlet/DeleteViewGroup\" method=\"post\" name=\"PVG\"><TABLE border=0 width=\"100%\">");
             out.println("<TR bgColor=#6699ff><TD align=middle bgColor=#cccccc colSpan=2><TABLE border=0 height=28 width=\"100%\">");
             out.println("<TBODY><TR><TD align=right bgColor=#ffffcc><FONT size=+0>");
             Calendar GCalendar = new GregorianCalendar(GYear,GMonth,GDate);
             GCalendar = new GregorianCalendar(GYear,GMonth,GDate-1);
             out.println("<A href=\""+DefaultURL+"/servlet/gCalendar?t="+GCalendar.getTime().getTime()+"&amp;s=0\"><B>&lt;&lt;</B></A>");
             out.println("<FONT size=2> <B>"+DayName[GCalendar.get(GCalendar.DAY_OF_WEEK)-1]+" "+GDate+" "+MonthName[GMonth]+" "+GYear+"</B></FONT>");
             GCalendar = new GregorianCalendar(GYear,GMonth,GDate+1);
             out.println("<A href=\""+DefaultURL+"/servlet/gCalendar?t="+GCalendar.getTime().getTime()+"&amp;s=0\"><B>&gt;&gt;</B></A>");
             out.println("&nbsp;&nbsp;</FONT></TD></TR></TBODY></TABLE></TD></TR><TR><TD height=30 vAlign=center width=\"62%\">");
             out.println("<FONT size=2>&nbsp;<A href=\""+DefaultURL+"/servlet/mCalendar\"><B>My Calendar</B></A> <b>|</b>"); 
             out.println("<B><A href=\""+DefaultURL+"/servlet/gCalendar\">Groups Calendar</A></B></FONT><TD height=30 Align=right  vAlign=center width=\"38%\">");
             out.println("&nbsp;<FONT size=2><b>View Group</b></FONT>"); 
             
             out.println("<TR><TD colSpan=2><table bgcolor=#ffffff border=0 height=29 width=\"100%\"><tr bgcolor=#FFCC99 align=\"center\">");
             out.println("<td height=26 colspan=\"5\"><font size=\"2\"><b>Receive Appointment</b></font></td></tr><tbody>");
             out.println("<tr bgcolor=#d0d0d0><td align=middle height=25 width=\"3%\"><b><font size=2>No.</font></b></td><td align=middle height=25 width=\"16%\">");
             out.println("<b><font size=2>Title</font></b></td><TD align=center height=25 width=\"16%\"><b><font size=\"2\">Group</font></b></TD>");
             out.println("<TD align=center height=25 width=\"14%\"><B><font size=\"2\">Type</font></B></TD>");
             out.println("<td align=middle height=25 width=\"14%\"><b><font size=2>From</font></b></td></tr>");
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
                             "select  no_group,title,membername,time,id,no_cal   from calendar where check_mode = 3 and id<>' "+UserID+"' and id <> idmem order by no_group");
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
                                                          // fromid=theResult.getString(5);
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
                                                             // fromid=theResult.getString(5);
                                                               no= theResult.getInt(6);
                                                            }         
                                                        }                                          
                         	   }//while
                  theResult.close();
                  theStatement.close();
                }  catch (Exception e) { out.println(e.getMessage()); }     
                   Calendar EventCalendar = new GregorianCalendar(DBYear,DBMonth,DBDate);  
               //out.println(from);
                 try{   Statement  theStatement=theConnection.createStatement();      
                          ResultSet theResult = theStatement.executeQuery(    
                         "select  id from groupcal  where no_group="+no_groupOK );
                            while (theResult.next())
                                { if  ((theResult.getString(1).equals(" "+UserID)) &&( ( EventCalendar.after(CurCalendar))  ||   (EventCalendar.equals(CurCalendar)) ))  
                                      {  //out.println(from+"OD");
                                      	 out.println("<tr bgcolor=#99CCFF><td align=center height=23 width=\"3%\"><font size=\"2\">"+Num+".</font> </td><td align=middle height=23>");
                                          out.println("<table width=\"100%\" border=\"0\"><tr><td width=\"40%\" align=\"center\" width=\"16%\"><input type=\"checkbox\" name=\"checkbox\" value=\""+no+"\"></td>");
                                          out.print("<td width=\"60%\"><b><a href=\""+DefaultURL+"/servlet/ViewAppointGroup?n="+no+"\"  ONMOUSEOVER=\"popup(\'OK\',\'#00cc00\')\";");
                      	out.println(" ONMOUSEOUT=\"kill()\">");    
                                          out.println("<font size=\"2\" color=#00cc00>"+title+"</font></a></b></td></tr></table></td>");
                                          out.println("<TD align=middle height=23 width=\"16%\">&nbsp;</TD>");
                                          out.println("<TD align=middle height=23 width=\"14%\">&nbsp; </TD>");
                                          out.println("<td align=middle height=23 width=\"14%\"><table width=\"100%\" border=\"0\"><tr><td width=\"35%\" align=\"center\">&nbsp; </td>");
                                        //   if (from != null) 
                                          out.println("<td width=\"65%\"><font size=\"2\"><b>"+from+"</b></font></td></tr></table></td></tr>");
                                       //   else out.println("<td width=\"65%\"><font size=\"2\"><b>"+ fromid+"</b></font></td></tr></table></td></tr>");
                                          Num++;
                                      }
                                   if  ((theResult.getString(1).equals(" "+UserID)) && ( CurCalendar.after(EventCalendar)  ))   
                                      {   out.println("<tr bgcolor=#99CCFF><td align=center height=23 width=\"3%\"><font size=\"2\">"+Num+".</font> </td><td align=middle height=23>");
                                          out.println("<table width=\"100%\" border=\"0\"><tr><td width=\"40%\" align=\"center\" width=\"16%\"><input type=\"checkbox\" name=\"checkbox\" value=\""+no+"\"></td>");
                                          out.print("<td width=\"60%\"><b><a href=\""+DefaultURL+"/servlet/ViewAppointGroup?n="+no+"\"  ONMOUSEOVER=\"popup(\'Expired\',\'#999999\')\";");
                                          out.println(" ONMOUSEOUT=\"kill()\">");    
                                          out.println("<font size=\"2\" color=#999999>"+title+"</font></a></b></td></tr></table></td>");
                                           out.println("<TD align=middle height=23 width=\"16%\">&nbsp;</TD>");
                                          out.println("<TD align=middle height=23 width=\"14%\">&nbsp; </TD>");
                                          out.println("<td align=middle height=23 width=\"14%\"><table width=\"100%\" border=\"0\"><tr><td width=\"35%\" align=\"center\">&nbsp; </td>");
                                       //     if (from != null) 
                                          out.println("<td width=\"65%\"><font size=\"2\"><b>"+from+"</b></font></td></tr></table></td></tr>");
                                          //else out.println("<td width=\"65%\"><font size=\"2\"><b>"+ fromid+"</b></font></td></tr></table></td></tr>");
                                          Num++;
                                      }
                               }
                  theStatement.close();
                  }  catch (Exception e) { out.println(e.getMessage()); }               
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
                         "select  id from groupcal  where no_group="+no_groupNo );
                            while (theResult.next())
                                { if ( (theResult.getString(1).equals(" "+UserID)) && (( EventCalendar.after(CurCalendar))  ||   (EventCalendar.equals(CurCalendar))) )  
                                      {   out.println("<tr bgcolor=#99CCFF><td align=center height=23 width=\"3%\"><font size=\"2\">"+Num+".</font> </td><td align=middle height=23>");
                                          out.println("<table width=\"100%\" border=\"0\"><tr><td width=\"40%\" align=\"center\"><input type=\"checkbox\" name=\"checkbox\" value=\""+no+"\"></td>");
                                          out.print("<td width=\"60%\"><b><a href=\""+DefaultURL+"/servlet/ViewAppointGroup?n="+no+"\" ONMOUSEOVER=\"popup(\'No\',\'#cc3333\')\";");
                                          out.println(" ONMOUSEOUT=\"kill()\">");
                                          out.println("<font size=\"2\" color=#cc3333>"+title+"</font></a></b></td></tr></table></td>");
                                          out.println("<TD align=middle height=23 width=\"16%\">&nbsp;</TD>");
                                          out.println("<TD align=middle height=23 width=\"14%\">&nbsp; </TD>");
                                          out.println("<td align=middle height=23 width=\"14%\"><table width=\"100%\" border=\"0\"><tr><td width=\"35%\" align=\"center\">&nbsp; </td>");
                                            if (from != null) 
                                          out.println("<td width=\"65%\"><font size=\"2\"><b>"+from+"</b></font></td></tr></table></td></tr>");
                                          else out.println("<td width=\"65%\"><font size=\"2\"><b>"+ fromid+"</b></font></td></tr></table></td></tr>");
                                          Num++;
                                      }
                                    if  ((theResult.getString(1).equals(" "+UserID)) && ( CurCalendar.after(EventCalendar)  ) )  
                                      {   out.println("<tr bgcolor=#99CCFF><td align=center height=23  width=\"3%\"><font size=\"2\">"+Num+".</font> </td><td align=middle height=23>");
                                          out.println("<table width=\"100%\" border=\"0\"><tr><td width=\"40%\" align=\"center\"><input type=\"checkbox\" name=\"checkbox\" value=\""+no+"\"></td>");
                                          out.print("<td width=\"60%\"><b><a href=\""+DefaultURL+"/servlet/ViewAppointGroup?n="+no+"\" ONMOUSEOVER=\"popup(\'Expired\',\'#999999\')\";");
                                          out.println(" ONMOUSEOUT=\"kill()\">");    
                                          out.println("<font size=\"2\" color=#999999>"+title+"</font></a></b></td></tr></table></td>");
                                          out.println("<TD align=middle height=23 width=\"16%\">&nbsp;</TD>");
                                          out.println("<TD align=middle height=23 width=\"14%\">&nbsp; </TD>");
                                          out.println("<td align=middle height=23 width=\"14%\"><table width=\"100%\" border=\"0\"><tr><td width=\"35%\" align=\"center\">&nbsp; </td>");
                                            if (from != null) 
                                          out.println("<td width=\"65%\"><font size=\"2\"><b>"+from+"</b></font></td></tr></table></td></tr>");
                                          else out.println("<td width=\"65%\"><font size=\"2\"><b>"+ fromid+"</b></font></td></tr></table></td></tr>");
                                          Num++;
                                      }
                               }
                  theStatement.close();
                  }  catch (Exception e) { out.println(e.getMessage()); }               
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
                         "select  id from groupcal  where no_group="+no_groupWait );
                            while (theResult.next())
                                { if     ( (!( theResult.getString(1).equals(" "+UserID)) )&& (( EventCalendar.after(CurCalendar))  ||   (EventCalendar.equals(CurCalendar)) ) )
                                      {   out.println("<tr bgcolor=#99CCFF><td align=center height=23  width=\"3%\"><font size=\"2\">"+Num+".</font> </td><td align=middle height=23>");
                                          out.println("<table width=\"100%\" border=\"0\"><tr><td width=\"40%\" align=\"center\"><input type=\"checkbox\" name=\"checkbox\" value=\""+no+"\"></td>");
                                          out.print("<td width=\"60%\"><b><a href=\""+DefaultURL+"/servlet/ViewEventGroup?n="+no+"\" ONMOUSEOVER=\"popup(\'Got Appointment\',\'#959500\')\";");
                                          out.println(" ONMOUSEOUT=\"kill()\">");
                                          out.println("<font size=\"2\" color=#959500>"+title+"</font></a></b></td></tr></table></td>");
                                          out.println("<TD align=middle height=23 width=\"16%\">&nbsp;</TD>");
                                          out.println("<TD align=middle height=23 width=\"14%\">&nbsp; </TD>");
                                          out.println("<td align=middle height=23 width=\"14%\"><table width=\"100%\" border=\"0\"><tr><td width=\"35%\" align=\"center\">&nbsp; </td>");
                                           if (from != null) 
                                          out.println("<td width=\"65%\"><font size=\"2\"><b>"+from+"</b></font></td></tr></table></td></tr>");
                                          else out.println("<td width=\"65%\"><font size=\"2\"><b>"+fromid+"</b></font></td></tr></table></td></tr>");
                                          Num++;
                                          }
                                    if     ((!(theResult.getString(1).equals(" "+UserID))) &&  (CurCalendar.after(EventCalendar)))
                                      {   out.println("<tr bgcolor=#99CCFF><td align=center height=23 width=\"3%\"><font size=\"2\">"+Num+".</font> </td><td align=middle height=23>");
                                          out.println("<table width=\"100%\" border=\"0\"><tr><td width=\"40%\" align=\"center\"><input type=\"checkbox\" name=\"checkbox\" value=\""+no+"\"></td>");
                                          out.print("<td width=\"60%\"><b><a href=\""+DefaultURL+"/servlet/ViewEventGroup?n="+no+"\"  ONMOUSEOVER=\"popup(\'Expired\',\'#999999\')\";");
                                          out.println(" ONMOUSEOUT=\"kill()\">");        
                                          out.println("<font size=\"2\" color=#999999>"+title+"</font></a></b></td></tr></table></td>");
                                          out.println("<TD align=middle height=23 width=\"16%\">&nbsp;</TD>");
                                          out.println("<TD align=middle height=23 width=\"14%\">&nbsp; </TD>");
                                          out.println("<td align=middle height=23 width=\"14%\"><table width=\"100%\" border=\"0\"><tr><td width=\"35%\" align=\"center\">&nbsp; </td>");
                                          if (from != null) 
                                          out.println("<td width=\"65%\"><font size=\"2\"><b>"+from+"</b></font></td></tr></table></td></tr>");
                                          else out.println("<td width=\"65%\" ><font size=\"2\"><b>"+fromid+"</b></font></td></tr></table></td></tr>");
                                          Num++;
                                        }
                                  /*out.println(DBDate+"/"+DBMonth+"/"+DBYear+"<br/>");
                                  out.println(CurDate+"/"+CurMonth+"/"+CurYear+"<br/>");*/
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
                                      {   out.println("<tr bgcolor=#99CCFF><td align=center height=23><font size=\"2\">"+Num+".</font> </td><td align=middle height=23>");
                                          out.println("<table width=\"100%\" border=\"0\"><tr><td width=\"40%\" align=\"center\"><input type=\"checkbox\" name=\"checkbox\" value=\""+no+"\"></td>");
                                          out.print("<td width=\"60%\"><b><a href=\""+DefaultURL+"/servlet/ViewEventGroup?n="+no+"\" ONMOUSEOVER=\"popup(\'Not Answer\',\'black\')\";");
                                          out.println(" ONMOUSEOUT=\"kill()\">");
                                          out.println("<font size=\"2\" color=black>"+title+"</font></a></b></td></tr></table></td>");
                                          out.println("<td align=middle height=23><table width=\"100%\" border=\"0\"><tr><td width=\"35%\" align=\"center\">&nbsp; </td>");
                                           if (from != null) 
                                          out.println("<td width=\"65%\"><font size=\"2\"><b>"+from+"</b></font></td></tr></table></td></tr>");
                                          else out.println("<td width=\"65%\"><font size=\"2\"><b>"+fromid+"</b></font></td></tr></table></td></tr>");
                                          Num++;
                                         /* out.println(DBDate+"/"+DBMonth+"/"+DBYear+"<br/>");
                                           out.println(CurDate+"/"+CurMonth+"/"+CurYear+"<br/>");*/
                                      }
                                    if  ((!(theResult.getString(1).equals(" "+UserID))) && ( CurCalendar.after(EventCalendar)  ) )  
                                      {   out.println("<tr bgcolor=#99CCFF><td align=center height=23><font size=\"2\">"+Num+".</font> </td><td align=middle height=23>");
                                          out.println("<table width=\"100%\" border=\"0\"><tr><td width=\"40%\" align=\"center\"><input type=\"checkbox\" name=\"checkbox\" value=\""+no+"\"></td>");
                                          out.print("<td width=\"60%\"><b><a href=\""+DefaultURL+"/servlet/ViewEventGroup?n="+no+"\" ONMOUSEOVER=\"popup(\'Expired\',\'#999999\')\";");
                                          out.println(" ONMOUSEOUT=\"kill()\">");    
                                          out.println("<font size=\"2\" color=#999999>"+title+"</font></a></b></td></tr></table></td>");
                                          out.println("<td align=middle height=23><table width=\"100%\" border=\"0\"><tr><td width=\"35%\" align=\"center\">&nbsp; </td>");
                                          if (from != null) 
                                          out.println("<td width=\"65%\"><font size=\"2\"><b>"+from+"</b></font></td></tr></table></td></tr>");
                                          else out.println("<td width=\"65%\"><font size=\"2\"><b>"+fromid+"</b></font></td></tr></table></td></tr>");
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
                                      {   out.println("<tr bgcolor=#99CCFF><td align=center height=23><font size=\"2\">"+Num+".</font> </td><td align=middle height=23>");
                                          out.println("<table width=\"100%\" border=\"0\"><tr><td width=\"40%\" align=\"center\"><input type=\"checkbox\" name=\"checkbox\" value=\""+no+"\"></td>");
                                          out.print("<td width=\"60%\"><b><a href=\""+DefaultURL+"/servlet/ViewAppointGroup2?n="+no+"\" ONMOUSEOVER=\"popup(\'Readed Answer\',\'#ff6644\')\";");
                                           out.println(" ONMOUSEOUT=\"kill()\">");              
                                          out.println("<font size=\"2\" color=#ff6644>"+title+"</font></a></b></td></tr></table></td>");
                                          out.println("<td align=middle height=23><table width=\"100%\" border=\"0\"><tr><td width=\"35%\" align=\"center\">&nbsp; </td>");
                                           if (from != null) 
                                          out.println("<td width=\"65%\"><font size=\"2\"><b>"+from+"</b></font></td></tr></table></td></tr>");
                                          else out.println("<td width=\"65%\"><font size=\"2\"><b>"+fromid+"</b></font></td></tr></table></td></tr>");
                                          Num++;
                                         /* out.println(DBDate+"/"+DBMonth+"/"+DBYear+"<br/>");
                                           out.println(CurDate+"/"+CurMonth+"/"+CurYear+"<br/>");*/
                                      }
                                    if  ((theResult.getString(1).equals(" "+UserID)) && ( CurCalendar.after(EventCalendar)  ) ) 
                                      {   out.println("<tr bgcolor=#99CCFF><td align=center height=23><font size=\"2\">"+Num+".</font> </td><td align=middle height=23>");
                                          out.println("<table width=\"100%\" border=\"0\"><tr><td width=\"40%\" align=\"center\"><input type=\"checkbox\" name=\"checkbox\" value=\""+no+"\"></td>");
                                          out.print("<td width=\"60%\"><b><a href=\""+DefaultURL+"/servlet/ViewAppointGroup2?n="+no+"\" ONMOUSEOVER=\"popup(\'Expired\',\'#999999\')\";");
                                          out.println(" ONMOUSEOUT=\"kill()\">");    
                                          out.println("<font size=\"2\" color=#999999>"+title+"</font></a></b></td></tr></table></td>");
                                          out.println("<td align=middle height=23><table width=\"100%\" border=\"0\"><tr><td width=\"35%\" align=\"center\">&nbsp; </td>");
                                          if (from != null) 
                                          out.println("<td width=\"65%\"><font size=\"2\"><b>"+from+"</b></font></td></tr></table></td></tr>");
                                          else out.println("<td width=\"65%\"><font size=\"2\"><b>"+fromid+"</b></font></td></tr></table></td></tr>");
                                          Num++;
                                       }
                                }
                  theStatement.close();
                  }  catch (Exception e) { out.println(e.getMessage()); }           
              }//for
              
              /*------------------------------------------------------------see answer------------------------------------------------------------------*/
              
              /*-------------------------------------------------------------------------table from-----------------------------------------------------*/
              
             //out.println("<tr bgcolor=#99CCFF><td align=center height=23 colspan=\"3\"><font size=\"2\">- No Appointment Data -
             Num=1;
             out.println("</tbody></table><table bgcolor=#ffffff border=0 height=29 width=\"100%\"><tr><td align=middle height=26 colspan=\"3\">&nbsp;</td></tr>");
             out.println("<tr bgcolor=#FFFFCC valign=\"middle\" align=\"center\"><td height=26 colspan=\"3\"><font size=\"2\"><b>Send Appointment</b></font></td>");
             out.println("</tr> <tbody><tr><td align=middle height=26 width=\"8%\" bgcolor=\"#d0d0d0\"><b><font  size=2>No.</font></b></td>");
             out.println("<td align=middle height=26 width=\"32%\" bgcolor=\"#d0d0d0\"><b><font size=2>Title</font></b></td><td align=middle height=26 width=\"32%\" bgcolor=\"#d0d0d0\">");
             out.println("<b><font size=\"2\">To</font></b></td></tr>"); 
             
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
                                      {   out.println("<tr bgcolor=#99CCFF><td align=center height=23><font size=\"2\">"+Num+".</font> </td><td align=middle height=23>");
                                          out.println("<table width=\"100%\" border=\"0\"><tr><td width=\"40%\" align=\"center\"><input type=\"checkbox\" name=\"checkbox\" value=\""+no+"\"></td>");
                                          out.print("<td width=\"60%\"><b><a href=\""+DefaultURL+"/servlet/ViewAppointGroup2?n="+no+"\" ONMOUSEOVER=\"popup(\'Waiting Answer\',\'#ff9900\')\";");
                                          out.println(" ONMOUSEOUT=\"kill()\">");
                                          out.println("<font size=\"2\" color=#ff9900>"+title+"</font></a></b></td></tr></table></td>");
                                          out.println("<td align=middle height=23><table width=\"100%\" border=\"0\"><tr><td width=\"35%\" align=\"center\">&nbsp; </td>");
                                          Mname= theResult.getInt(2);
                                          checkfrom = false;
                                           Num++;
                                            }
                                     if  ((theResult.getString(1).equals(" "+UserID)) && ( CurCalendar.after(EventCalendar)  ) )  
                                      {   out.println("<tr bgcolor=#99CCFF><td align=center height=23><font size=\"2\">"+Num+".</font> </td><td align=middle height=23>");
                                          out.println("<table width=\"100%\" border=\"0\"><tr><td width=\"40%\" align=\"center\"><input type=\"checkbox\" name=\"checkbox\" value=\""+no+"\"></td>");
                                          out.print("<td width=\"60%\"><b><a href=\""+DefaultURL+"/servlet/ViewAppointGroup2?n="+no+"\" ONMOUSEOVER=\"popup(\'Expired\',\'#999999\')\";");
                                          out.println(" ONMOUSEOUT=\"kill()\">");           
                                          out.println("<font size=\"2\" color=#999999>"+title+"</font></a></b></td></tr></table></td>");
                                          out.println("<td align=middle height=23><table width=\"100%\" border=\"0\"><tr><td width=\"35%\" align=\"center\">&nbsp; </td>");
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
                                           out.println("<td width=\"65%\"><font size=\"2\"><b>"+theResult.getString(1)+"</b></font></td></tr></table></td></tr>");
                                            checkfrom =true;
                               }
                      theStatement.close();
                  }  catch (Exception e) { out.println(e.getMessage()); }                   
              }//for
                
             
          
             out.println("</tbody></table></TD></TR><TR align=\"right\"><TD colSpan=3><a href=\"javascript:SetCheck(0)\"><b><font size=2 >Check All</font></b></a> | ");
             out.println("<a href=\"javascript:SetCheck(1)\"><b><font size=2 >Clear</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b><input type=\"submit\" name=\"Submit\" value=\"Delete\">");
             out.println("</TD></TR></table></form></TD>");
         
         
         }     
 
 
 }
 class PrintGroupCalendar {
  public static  void MakeCalendar(String DefaultURL,String []MonthName/*,int CDate,int CMonth,int CYear*/,int GDate,int GMonth,int GYear,PrintWriter out)
                   {   
                   	Calendar GCalendar    = new GregorianCalendar(GYear,GMonth,GDate);  //Calendar  Object For MakeTime
                   	out.println("<TR> <TD vAlign=top ><TABLE border=1 height=\"32%\" width=\"100%\"><TBODY>  ");
                   	out.println("<tr valign=\"center\" align=\"center\" bgcolor=\"#FFFFCC\">");
                     GCalendar = new GregorianCalendar(GYear,GMonth-1,GDate);
                     out.println("<td colspan=\"8\" height=\"28\"><font size=\"2\"><a href =\""+DefaultURL+"/servlet/gCalendar?t="+GCalendar.getTime().getTime()+"\"><b>&lt;&lt;</b></a>");
                     out.println("<b>"+MonthName[GMonth]+" "+GYear+"</b>");
                     GCalendar = new GregorianCalendar(GYear,GMonth+1,GDate);
                     out.println("<a href =\""+DefaultURL+"/servlet/gCalendar?t="+GCalendar.getTime().getTime()+"\"><b> &gt;&gt;</b></font></a></td></tr>"); 
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
		                    if (Days== 1) out.print("color=\"#FF0000\">"+date+"</b></font></a></td>");
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
		                              if (Days == 1 )  out.print("color=\"#FF0000\">"+date+"</font></a></td>");
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
                     /*out.println("<font size=\"2\"><a href =\""+DefaultURL+"/servlet/gCalendar?t="+Calendar.getInstance().getTime().getTime()+"\">Today</a>");
                     out.println(" is : <b> "+Calendar.getInstance().get(Calendar.DATE)+" "+MonthName[Calendar.getInstance().get(Calendar.MONTH)]+" "+Calendar.getInstance().get(Calendar.YEAR)+"</b></font>");*/
                     out.println("<table width=\"100%\"><tr><td width=\"8%\">&nbsp;</td><td><font size=2>");
                     out.println("<a href =\""+DefaultURL+"/servlet/mCalendar?t="+Calendar.getInstance().getTime().getTime()+"\">Today</a>"); 
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
                     out.println("</td></tr></tbody></table>");
                     
          }//MakeCalendar
}//Class  PrintGroupCalendar        

class MainGroup
{ public static void PrintMainGroup(String UserID,Connection theConnection,PrintWriter out,String DefaultURL,int GDate,int GMonth,int GYear,String []MonthName,String []DayName)
       {     int Num = 1;
              String title ="";
              String type ="";
              boolean check = true;
              boolean checkhave =false;
             out.println("<table width=\"100%\" border=\"0\"><tr><td colspan=\"2\"><TBODY><tr bgcolor=\"#6699FF\">");
             out.println("<TD align=middle bgColor=\"#cccccc\" colspan=\"2\">");
             out.println("<table width=\"100%\" border=\"0\" height=\"28\"><tbody><tr> ");
             out.println("<td align=\"right\" bgcolor=\"#FFFFCC\"><font >");
              Calendar GCalendar = new GregorianCalendar(GYear,GMonth,GDate);
              GCalendar = new GregorianCalendar(GYear,GMonth,GDate-1);
              out.print("<a href =\""+DefaultURL+"/servlet/gCalendar?t="+GCalendar.getTime().getTime()+"&s=0\"><b>&lt;&lt;</b></a><font size=2>");
              out.print("  <b>"+DayName[GCalendar.get(GCalendar.DAY_OF_WEEK)-1]+" "+GDate+" "+MonthName[GMonth]+" "+GYear+" </b></font>");
              GCalendar = new GregorianCalendar(GYear,GMonth,GDate+1);
              out.println("<a href =\""+DefaultURL+"/servlet/gCalendar?t="+GCalendar.getTime().getTime()+"&s=0\"><b>&gt;&gt;</b></a>&nbsp;&nbsp;");
              out.println("</td></tr></tbody></table></td></tr><tr><TD vAlign=middle height=\"30\" width=\"62%\">");      
              out.println("<font size=\"2\"> &nbsp;<a href=\""+DefaultURL+"/servlet/mCalendar\"><b>My Calendar</b></a> |<b>");
              out.println("Groups Calendar</b></font>");
              out.println("<TD height=30 vAlign=center width=\"38%\">&nbsp;<font size=\"2\">");
              out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
              out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
              out.println("<a href=\""+DefaultURL+"/servlet/gCalendar?c=1\">View Group</a></font>");
              
              
              out.println("<tr><td colspan=\"2\"><table border=0 height=29 width=\"100%\" bgcolor=\"#FFFFFF\"><tbody>");
              out.println("<tr bgcolor=\"#D0D0D0\">"); 
              out.println("<td width=\"8%\" align=\"center\" height=\"25\"><b><font size=\"2\">No.</font></b></td>");
              out.println("<td align=\"center\" width=\"32%\" height=\"25\"><b><font size=\"2\">Type</font></b></td>");
              out.println("<td align=\"center\" width=\"32%\" height=\"25\"><b><font size=\"2\">Group Name</font></b></td>");
              out.println("<td width=\"28%\" align=\"center\" height=\"25\"><b><font size=\"2\">Member</font></b></td></tr>");
              
               try{                            
                                                //Loading Sun's JDBC ODBC Driver   
                                               Class.forName("oracle.jdbc.driver.OracleDriver");
                                               //Connect to emaildb Data source
                                               theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                               //Select all records from emaillists table.
                                               Statement  theStatement=theConnection.createStatement();
                                               ResultSet theResult = theStatement.executeQuery(  "select groupname,grouptype,membername,no_mem  from member "+
                                               "where idmem <> id and id = ' "+UserID+"' order  by groupname , grouptype");
                                               while (theResult.next()){ 
                                               	if  (title.equals(""))  {   title=theResult.getString(1);  }
                                                                if (title.equals(theResult.getString(1))) 
                                                              	{  if  (type.equals("")) { type = theResult.getString(2);}
                                                              	   if (type.equals(theResult.getString(2)) && (check) ) {
                                                                          out.println("<tr valign=\"middle\"  bgcolor=\"#99CCFF\">"); 
                                                                          out.println("<td width=\"8%\" height=\"23\" align=\"center\"><b><font size=\"2\">"+Num+".</font></b></td>");
                                                                          out.println("<td width=\"32%\" height=\"23\"><b><font size=\"2\">");
                                                                          out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                                                                          out.println(theResult.getString(2)+"</font></b></td>");
                                                                          out.println("<td width=\"32%\" height=\"23\"><b><font size=\"2\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                                                                          out.println("<a href=\""+DefaultURL+"/servlet/ShowUpdateGroup?m="+theResult.getString(4)+"\">");
                                                                          out.println(theResult.getString(1)+"</a></font></b></td>");
                                                                          out.println("<td width=\"28%\" height=\"23\">");
                                                                          out.println("&nbsp;&nbsp;&nbsp;&nbsp;");
                                                                          out.println("<select name=\"select\">");
                                                                          out.println("<option value=\""+theResult.getString(3)+"\">"+theResult.getString(3)+"</option>");
                                                                           check = false;
                                                                          Num++;
                                                                    }//if type1
                                                                   if (type.equals(theResult.getString(2)) && (!check) ) { out.println("<option value=\""+theResult.getString(3)+"\">"+theResult.getString(3)+"</option>");}
                                                             
                                                               if ( !(type.equals(theResult.getString(2))))  {
                                                               	          out.println("</select></td></tr>");
                                                            	          type = theResult.getString(2) ;
                                                                          out.println("<tr valign=\"middle\"  bgcolor=\"#99CCFF\">"); 
                                                                          out.println("<td width=\"8%\" height=\"23\" align=\"center\"><b><font size=\"2\">"+Num+".</font></b></td>");
                                                                          out.println("<td width=\"32%\" height=\"23\"><b><font size=\"2\">");
                                                                          out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                                                                          out.println(theResult.getString(2)+"</font></b></td>");
                                                                          out.println("<td width=\"32%\" height=\"23\"><b><font size=\"2\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                                                                          out.println("<a href=\""+DefaultURL+"/servlet/ShowUpdateGroup?m="+theResult.getString(4)+"\">");
                                                                          out.println(theResult.getString(1)+"</a></font></b></td>");
                                                                          out.println("<td width=\"28%\" height=\"23\">");
                                                                          out.println("&nbsp;&nbsp;&nbsp;&nbsp;");
                                                                          out.println("<select name=\"select\">");
                                                                          out.println("<option value=\""+theResult.getString(3)+"\">"+theResult.getString(3)+"</option>");
                                                                           check = false;
                                                                          Num++;
                                                                    }//if type
                                                              }//if title
                                                  if  ( !(title.equals(theResult.getString(1))) ) {
                                                  	title= theResult.getString(1) ;
                                                  	 if (type.equals(theResult.getString(2)) ) {
                                                                          out.println("</select></td></tr>");
                                                                          out.println("<tr valign=\"middle\"  bgcolor=\"#99CCFF\">"); 
                                                                          out.println("<td width=\"8%\" height=\"23\" align=\"center\"><b><font size=\"2\">"+Num+".</font></b></td>");
                                                                           out.println("<td width=\"32%\" height=\"23\"><b><font size=\"2\">");
                                                                          out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                                                                          out.println(theResult.getString(2)+"</font></b></td>");
                                                                          out.println("<td width=\"32%\" height=\"23\"><b><font size=\"2\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                                                                          out.println("<a href=\""+DefaultURL+"/servlet/ShowUpdateGroup?m="+theResult.getString(4)+"\">");
                                                                          out.println(theResult.getString(1)+"</a></font></b></td>");
                                                                          out.println("<td width=\"28%\" height=\"23\">");
                                                                          out.println("&nbsp;&nbsp;&nbsp;&nbsp;");
                                                                          out.println("<select name=\"select\">");
                                                                          out.println("<option value=\""+theResult.getString(3)+"\">"+theResult.getString(3)+"</option>");
                                                                           check = false;
                                                                          Num++;
                                                                    }//if type1
                                                                 
                                                                    if ( !(type.equals(theResult.getString(2))) ) {
                                                               	          out.println("</select></td></tr>");
                                                            	          type = theResult.getString(2) ;
                                                                          out.println("<tr valign=\"middle\"  bgcolor=\"#99CCFF\">"); 
                                                                          out.println("<td width=\"8%\" height=\"23\" align=\"center\"><b><font size=\"2\">"+Num+".</font></b></td>");
                                                                          out.println("<td width=\"32%\" height=\"23\"><b><font size=\"2\">");
                                                                          out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                                                                          out.println(theResult.getString(2)+"</font></b></td>");
                                                                          out.println("<td width=\"32%\" height=\"23\"><b><font size=\"2\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                                                                          out.println("<a href=\""+DefaultURL+"/servlet/ShowUpdateGroup?m="+theResult.getString(4)+"\">");
                                                                          out.println(theResult.getString(1)+"</a></font></b></td>");
                                                                          out.println("<td width=\"28%\" height=\"23\">");
                                                                          out.println("&nbsp;&nbsp;&nbsp;&nbsp;");
                                                                          out.println("<select name=\"select\">");
                                                                          out.println("<option value=\""+theResult.getString(3)+"\">"+theResult.getString(3)+"</option>");
                                                                           check = false;
                                                                          Num++;
                                                                    }//if type
                                                     }//title
                                           checkhave = true;
                                            }//while
                                       out.println("</select></td></tr>");
                                       theStatement.close();
                                       theConnection.close(); 
                                           }   catch (Exception e)  
                                    {  out.println(e.getMessage());  }
                                 
               title="";
               type="";
               int N=1;
               int no_mem = 0;
               boolean c = false;
                try{                            
                                                //Loading Sun's JDBC ODBC Driver   
                                               Class.forName("oracle.jdbc.driver.OracleDriver");
                                               //Connect to emaildb Data source
                                               theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                               //Select all records from emaillists table.
                                               Statement  theStatement=theConnection.createStatement();
                                               ResultSet theResult = theStatement.executeQuery(  "select groupname,grouptype,no_mem  from member "+
                                               "where id=' "+UserID+"' order  by groupname , grouptype");
                                               while (theResult.next())
                                                  {
                                                      if  (title.equals(""))  {   title=theResult.getString(1);  }
                                                      if (title.equals(theResult.getString(1))) 
                                                          {  if  (type.equals("")) { type = theResult.getString(2);}
                                                             if (no_mem==0) no_mem = theResult.getInt(3);
                                                             if (type.equals(theResult.getString(2)) && (c) ){N++;}
                                                              if (type.equals(theResult.getString(2)) && (!c) ){ c = true; }
                                                              if ( !(type.equals(theResult.getString(2)))) 
                                                                  {  if (N==1) {
                                                                               out.println("<tr valign=\"middle\"  bgcolor=\"#99CCFF\">"); 
                                                                               out.println("<td width=\"8%\" height=\"23\" align=\"center\"><b><font size=\"2\">"+Num+".</font></b></td>");
                                                                               out.println("<td width=\"32%\" height=\"23\"><b><font size=\"2\">");
                                                                               out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                                                                               out.println(type+"</font></b></td>");
                                                                               out.println("<td width=\"32%\" height=\"23\" align=\"left\"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                                                                               out.println("<font size=\"2\"><a href=\""+DefaultURL+"/servlet/ShowUpdateGroup?m="+no_mem+"\">");
                                                                               out.println(title+"</a></font></b></td>");
                                                                               out.println("<td width=\"28%\" height=\"23\" align=\"center\"><font size=\"2\">- No Member -</font></td></tr>");
                                                                               Num++;
                                                                                }
                                                                       N=1;
                                                                       c = true; 
                                                                        type = theResult.getString(2) ; 
                                                                       no_mem = theResult.getInt(3);
                                                                    }//type
                                                          }//title.equals
                                                       if  ( !(title.equals(theResult.getString(1))) )
                                                        {       if (N==1) {
                                                                               out.println("<tr valign=\"middle\"  bgcolor=\"#99CCFF\">"); 
                                                                               out.println("<td width=\"8%\" height=\"23\" align=\"center\"><b><font size=\"2\">"+Num+".</font></b></td>");
                                                                               out.println("<td width=\"32%\" height=\"23\"><b><font size=\"2\">");
                                                                               out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                                                                               out.println(type+"</font></b></td>");
                                                                                out.println("<td width=\"32%\" height=\"23\" align=\"left\"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                                                                               out.println("<font size=\"2\"><a href=\""+DefaultURL+"/servlet/ShowUpdateGroup?m="+no_mem+"\">");
                                                                               out.println(title+"</a></font></b></td>");
                                                                               out.println("<td width=\"28%\" height=\"23\" align=\"center\"><font size=\"2\">- No Member -</font></td></tr>");
                                                                               Num++;
                                                                                }
                                                        	N=1;
                                                                c=true;
                                                  	title= theResult.getString(1) ;
                                                  	no_mem = theResult.getInt(3);
                                                                if ( !(type.equals(theResult.getString(2)))) 
                                                                   {  type = theResult.getString(2) ;      }
                                                        }//title
                                         checkhave= true;
                                          }//while
                              theStatement.close();
                              theConnection.close(); 
                      }   catch (Exception e)  
                                    {  out.println(e.getMessage());  }          
               if ( (N==1)&&(c)   ) {
                                                                               out.println("<tr valign=\"middle\"  bgcolor=\"#99CCFF\">"); 
                                                                               out.println("<td width=\"8%\" height=\"23\" align=\"center\"><b><font size=\"2\">"+Num+".</font></b></td>");
                                                                               out.println("<td width=\"32%\" height=\"23\"><b><font size=\"2\">");
                                                                               out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                                                                               out.println(type+"</font></b></td>");
                                                                                out.println("<td width=\"32%\" height=\"23\" align=\"left\"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                                                                               out.println("<font size=\"2\"><a href=\""+DefaultURL+"/servlet/ShowUpdateGroup?m="+no_mem+"\">");
                                                                               out.println(title+"</a></font></b></td>");
                                                                               out.println("<td width=\"28%\" height=\"23\" align=\"center\"><font size=\"2\">- No Member -</font></td></tr>");
                                 }                      
               if (!checkhave){
               out.println("<TR bgColor=#99ccff vAlign=center align=\"center\">"); 
               out.println("<TD height=23 colspan=\"4\"><font size=\"2\">- No Data -</font></TD>");
               out.println("</TR>");
              }
              out.println(" </tbody></table></td></tr></TD></TR></tbody></TABLE></td>");
                
                   }
 }
 
