import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class ShowUpdateGroup extends HttpServlet
 {   String DefaultURL="http://161.246.5.233:8080/planny"; 
      Connection theConnection;
      static final int  CurDate      =  Calendar.getInstance().get(Calendar.DAY_OF_MONTH); 
      static final int  CurMonth   =  Calendar.getInstance().get(Calendar.MONTH); 
      static final int  CurYear      =  Calendar.getInstance().get(Calendar.YEAR); 
      static final int  CurHour      =  Calendar.getInstance().get(Calendar.HOUR_OF_DAY); 
      static final  String [] MonthName = {"January","February","March","April","May", "June","July","August","September","October","November","December"};
      static final String  []DayName={"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"} ; 
      protected void doGet(HttpServletRequest req , HttpServletResponse res) throws ServletException, IOException
       {     HttpSession session = req.getSession(true);
             String UserID = (String)session.getValue("login.username");
              String title ="";
              String type ="";
              String note="";
              boolean check = false;
              if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
               else session.putValue("lgoin.username",UserID);
             int NoNum = Integer.parseInt(req.getParameter("m")); 
             String GiveTime = req.getParameter("t");
                 int GDate= CurDate;
                 int GMonth=CurMonth;
                 int GYear=CurYear;
                 int GHour=CurHour;
                 
                  if (GiveTime!=null) {
                 Date MakeDate = new Date(Long.parseLong(GiveTime));
                 Calendar GCalendar = new GregorianCalendar();
                 GCalendar.setTime(MakeDate);
                 GDate = GCalendar.get(GCalendar.DAY_OF_MONTH); 
                 GMonth = GCalendar.get(GCalendar.MONTH);
                 GYear = GCalendar.get(GCalendar.YEAR);
                 GHour = GCalendar.get(GCalendar.HOUR_OF_DAY);                                
                                }
                          
             res.setContentType("text/html");
             PrintWriter out = res.getWriter(); 
             out.println("<HTML><HEAD><TITLE>Planny Organizer</TITLE>");
             out.println("<META content=\"text/html; charset=windows-874\" http-equiv=Content-Type>");
             out.println("<STYLE type=text/css>BODY {MARGIN: 0px; PADDING-BOTTOM: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; PADDING-TOP: 0px}");
             out.println("A:link {Color: #005ca2; TEXT-DECORATION: none}");
             out.println("A:visited {Color: #005ca2; TEXT-DECORATION: none}");
             out.println("A:active {Color: #0099ff; TEXT-DECORATION: underline}");
             out.println("A:hover {Color: #0099ff; TEXT-DECORATION: underline}");
             out.println("</STYLE><META content=\"MSHTML 5.00.2614.3500\" name=GENERATOR>");
             //++++++++++++++++java script +++++++++++++++++++
                 out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
                 out.println("<!--");
                 out.println("function SetCheck(val) {");
                 out.println("dml=document.GA;");
                 out.println("len = dml.elements.length;");
                 out.println("var i=0;");
                 out.println("for( i=0 ; i<len; i++) {");
                 out.println("if(val==0) dml[i].checked=true;");
                 out.println("else dml[i].checked=false;");
                 out.println("}}");
                 out.println("//--></script>");
                 //+++++++++++++++++++++++++++++++++++
            out.println("</HEAD><BODY bgColor=#ffffff>");
            out.println("<TABLE border=0 height=\"100%\" width=\"100%\"><TBODY>");
            out.println("<TR><TD bgColor=#49b0fc height=84 rowSpan=3 width=\"19%\">&nbsp;</TD>");
            out.println("<TD height=25 width=\"17%\">&nbsp;</TD>");
            out.println("<TD height=25 width=\"64%\">&nbsp;</TD></TR>");
            out.println("<TR><TD align=middle colSpan=2 height=57 vAlign=center><IMG height=51 src=\"/planny/picture/logo4.jpg\" width=360></TD></TR>");
             out.println("<TR><TD colSpan=2 height=365 vAlign=top>");
             
             out.println("<FORM action="+DefaultURL+"/servlet/UpdateGroup  method=post>");
             out.println("<TABLE border=0 width=\"100%\"><TBODY>");
             out.println("<TR><TD height=25 width=65>&nbsp;</TD>");
             out.println("<TD height=25 width=165>&nbsp;</TD>");
             out.println("<TD height=25 width=155>&nbsp;</TD>");
             out.println("<TD height=25 width=174>&nbsp;</TD>");
             out.println("<TD height=25 width=58>&nbsp;</TD></TR>");
             out.println("<TR><TD height=25 width=65>&nbsp;</TD>");
             out.println("<TD bgColor=#94b7f1 colSpan=3 height=25>"); 
             out.println("<TABLE border=0 width=\"100%\"><TBODY>");
             out.println("<TR><TD bgColor=#ccffff height=23 vAlign=center>&nbsp; <Font  face=Arial size=2>&nbsp;<B>Edit Group </B></FONT></TD>");
             out.println("</TR></TBODY></TABLE></TD><TD height=25 width=58>&nbsp;</TD></TR><TR><TD height=25 width=65>&nbsp;</TD>");
             out.println("<TD align=middle bgColor=#49b0fc colSpan=3 rowSpan=3 height=178><table width=\"100%\" border=\"0\">");
             out.println("<tr><td width=\"7%\">&nbsp;</td><td width=\"18%\" valign=\"bottom\"><b><font size=\"2\">Group Name</font></b></td>");
                 try{  Class.forName("oracle.jdbc.driver.OracleDriver");
                          theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                          Statement  theStatement=theConnection.createStatement();
                          ResultSet theResult = theStatement.executeQuery(  "select groupname,grouptype,notegr from member where no_mem="+NoNum);
                          while (theResult.next()){
                          	title=theResult.getString(1);
                          	type=theResult.getString(2);
             out.println("<td width=\"75%\" valign=\"bottom\"><input type=\"text\" name=\"EGName\" size=\"30\" value=\""+theResult.getString(1)+"\"></td></tr><tr> <td width=\"7%\">&nbsp;</td> ");
             out.println("<td valign=\"bottom\" width=\"18%\"><b><font size=\"2\">Group Type</font></b></td><td valign=\"bottom\" width=\"75%\">");
             out.println("<select name=\"EGType\" size=\"1\">");
             out.print("<option value=\"Other\" selected");
             if(theResult.getString(2).equals("Other")) out.print("selected");
             out.println(">Other</option>");
             out.print("<option value=\"Chat\""); 
             if(theResult.getString(2).equals("Chat")) out.print("selected");
             out.println(">Chat</option>");
             out.print("<option value=\"Clubs\"");
             if(theResult.getString(2).equals("Clubs")) out.print("selected");
             out.println(">Clubs</option>");
             out.print("<option value=\"Games\"");
             if(theResult.getString(2).equals("Games")) out.print("selected");
             out.println(">Games</option>");
             out.print("<option value=\"Friends\"");
             if(theResult.getString(2).equals("Friends")) out.print("selected");
             out.println(">Friends</option>");
             out.print("<option value=\"Sports\"");
             if(theResult.getString(2).equals("Sports")) out.print("selected");
             out.println(">Sports</option>");
             out.println("</select></td></tr>");
               }//while
               theStatement.close();//Close statement
               theConnection.close();
                   }   catch (Exception e)   {
                       out.println(e.getMessage()); } 
             out.println("<tr><td width=\"7%\">&nbsp;</td><td width=\"18%\" valign=\"bottom\">");
             out.println("<font size=\"2\"><b>Member</b></font></td><td width=\"75%\" valign=\"bottom\">");
             out.println("<select name=\"EGMember\" size=\"1\">");        
                try{     Class.forName("oracle.jdbc.driver.OracleDriver");
                            theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                            Statement  theStatement=theConnection.createStatement();
                            ResultSet theResult = theStatement.executeQuery(  "select groupname,grouptype,membername,no_mem,notegr  from member "+
                                  "where id <> idmem and id = ' "+UserID+"' order  by groupname , grouptype");
                               while (theResult.next()){ 
                                             if (title.equals(theResult.getString(1)) && type.equals(theResult.getString(2))  )
                                             { out.println("<option value=\""+theResult.getInt(4)+"\">"+theResult.getString(3)+"</option>");
                                                note=theResult.getString(5);
                                                check = true; } 
                                          }//while
                    theStatement.close();//Close statement
                    theConnection.close();
                   }   catch (Exception e)   {
              out.println(e.getMessage()); }   
              if (!check)   out.println("<option value=\"0\">-</option>");                                            
             out.println("</select></td>");
             out.println("</tr><tr><td width=\"7%\">&nbsp;</td><td valign=\"top\" width=\"18%\"><font size=\"2\"><b>Note</b></font></td><td width=\"75%\">"); 
             if (note!=null) {
             out.println("<TextArea name=\"EGNote\" rows=\"2\" cols=\"30\">"+note+"</textarea></td></tr><tr valign=\"bottom\"><td width=\"7%\" height=\"35\">&nbsp;</td>");}
             else{ out.println("<TextArea name=\"EGNote\" rows=\"2\" cols=\"30\"></textarea></td></tr><tr valign=\"bottom\"><td width=\"7%\" height=\"35\">&nbsp;</td>");}
             out.println("<td colspan=\"2\" align=\"right\" height=\"35\"><input type=\"hidden\" name=\"HiddenTitle\" value=\""+title+"\">");
             out.println("<input type=\"hidden\" name=\"HiddenType\" value=\""+type+"\">");
             out.println("<input name=EGUpdate type=submit value=\"  Update   \">&nbsp;<input name=EGDelete type=submit value=\"  Delete   \">");
             out.println("<input name=EGCancel type=submit value=\"  Cancel  \"></td></tr></table></TD><TD height=25 width=58>&nbsp;</TD></TR>");
             out.println("<TR><TD height=25 width=65>&nbsp;</TD><TD height=25 width=58>&nbsp;</TD></TR><TR><TD height=25 width=65>&nbsp;</TD>");
             out.println("<TD height=25 width=58>&nbsp;</TD></TR></TBODY></TABLE></FORM>");
             
             out.println("<FORM action=\""+DefaultURL+"/servlet/UpdateMemberG\"  method=post>");
             out.println("<TABLE border=0 width=\"100%\"><TBODY><TR><TD height=25 width=60>&nbsp;</TD>");
             out.println("<TD bgColor=#94b7f1 colSpan=3 height=25><TABLE border=0 width=\"100%\"><TBODY>"); 
             out.println("<TR><TD bgColor=#ccffff height=23 vAlign=center>&nbsp; <FONT face=Arial size=2>&nbsp;<B>Edit Member</B></FONT></TD>");
             out.println("</TR></TBODY></TABLE></TD><TD height=25 width=56>&nbsp;</TD></TR>");
             check = false;
              
              try{     Class.forName("oracle.jdbc.driver.OracleDriver");
                            theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                            Statement  theStatement=theConnection.createStatement();
                            ResultSet theResult = theStatement.executeQuery(  "select groupname,grouptype,membername,no_mem,note,idmem,status  from member "+
                                  "where id <> idmem and id = ' "+UserID+"' order  by groupname , grouptype");
                               while (theResult.next()){ 
                                              if (title.equals(theResult.getString(1)) && type.equals(theResult.getString(2))  )
                                             { out.println("<TR> <TD height=25 width=60>&nbsp;</TD><TD colSpan=3><table border=0 width=\"100%\"><tbody><tr><td bgcolor=#49b0fc height=100 valign=top>");
                                                out.println("<table border=0 width=\"100%\">");
                                                out.println("<tbody><tr><td align=right height=30><font size=2></font></td><td height=25 valign=bottom width=\"38%\"><font size=2>"); 
                                                out.print("<input name=MemberRadio type=\"radio\" value=\""+theResult.getInt(4)+"\"");
                                                 out.println("><b>Planny ID : </b>"+theResult.getString(6)+"</font></td>");
                                                out.println("<td height=25 valign=bottom width=\"2%\">&nbsp;</td><td height=25 valign=bottom width=\"54%\"><font  size=2><b>Member Name</b><br>");
                                                out.println("<input name=EMName size=28  value=\""+theResult.getString(3)+"\"></font></td></tr><tr> <td align=right><font size=2></font></td>");
                                                out.println("<td height=25 valign=bottom width=\"38%\"><font size=2><b>Status</b><br><input name=EMStatus size=28  value=\""+theResult.getString(7)+"\">");
                                                out.println("</font></td><td height=25 valign=bottom width=\"2%\">&nbsp;</td>");
                                                out.println("<input type=\"hidden\" name=\"HiddenTitle\" value=\""+title+"\"><input type=\"hidden\" name=\"HiddenType\" value=\""+type+"\">");
                                                if (theResult.getString(5) != null) {
                                                out.println("<td height=25 valign=bottom width=\"54%\"><font size=2><b>Note<br>");
                                                out.println("</b><input name=EMNote size=28  value=\""+theResult.getString(5)+"\"></font></td></tr></tbody></table></td></tr></tbody></table>");
                                                 
                                                                                                        }
                                                else {
                                                	out.println("<td height=25 valign=bottom width=\"54%\"><font size=2><b>Note<br>");
                                                                out.println("</b><input name=EMNote size=28  ></font></td></tr></tbody></table></td></tr></tbody></table>");
                                                          }
                                                check = true; } //if
                                                  }//while
                    
                    theStatement.close();//Close statement
                    theConnection.close();
                   }   catch (Exception e)   {
              out.println(e.getMessage()); }   
              
              if (!check)  { out.println("<TR align=center><TD height=28 width=60>&nbsp;</TD>");
                                     out.println("<TD colSpan=3 height=\"28\" bgcolor=\"#49b0fc\"><font size=2>- No Member Data -</font></TD>");
                                     out.println("<TD height=28 width=56>&nbsp;</TD></TR></TBODY></TABLE></FORM>");
                                   }
             else {  
                          out.println("<table border=0 width=\"100%\"><tbody><tr><td align=right colspan=2><font face=Arial size=2>");
                         out.println("<input name=EMUpdate type=submit value=\"  Update   \">");
                         out.println("<input name=EMDelete type=submit value=\"  Delete   \">");
                         out.println("<input name=Cancel type=reset  value=\"  Clear  \">");
                         out.println("</font></td></tr></tbody></table>");  
                         out.println("</TD><TD height=25 width=56>&nbsp;</TD></TR></TBODY></TABLE></FORM><a name=\"App\"></a>"); 
                      }           
                 if (!check)  { 
                 //+++++++++++++++++++++   havenn' t  Member ++++++++++++++++++++++++
                 out.println("<FORM action=\""+DefaultURL+"/servlet/GroupAppoint\" method=post name=GroupApp>");
                 out.println("<table border=0 width=\"100%\"><tbody><tr><td height=30 width=58>&nbsp;</td><td bgcolor=#94b7f1 colspan=3 height=30> ");
                 out.println("<table border=0 width=\"100%\"><tbody><tr><td bgcolor=#ccffff height=23 valign=center>&nbsp; <font  face=Arial size=2>&nbsp;<b>Group Appointment</b></font></td>");
                 out.println("</tr></tbody></table></td><td height=30 width=56>&nbsp;</td></tr>");
                 out.println("<TR><TD height=28 width=58>&nbsp;</TD>"); 
                 out.println("<TD align=center bgColor=#49b0fc valign=\"middle\" colSpan=3>"); 
                 out.println("<font size=\"2\">- No Member Data -</font></TD>");
                 out.println("<TD height=28 width=56>&nbsp;</TD></TR>");
                 out.println("</TR></TBODY></TABLE></FORM></TR></TBODY></TABLE></BODY></HTML>");
                 
                //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
                  } else  {
                 //+++++++++++++++++++++   Have Member ++++++++++++++++++++++++
                    out.println("<FORM action=\""+DefaultURL+"/servlet/GroupAppoint\" method=post  name=GA>");
                 out.println("<table border=0 width=\"100%\"><tbody><tr><td height=30 width=58>&nbsp;</td><td bgcolor=#94b7f1 colspan=3 height=30> ");
                 out.println("<table border=0 width=\"100%\"><tbody><tr><td bgcolor=#ccffff height=23 valign=center>&nbsp; <font  face=Arial size=2>&nbsp;<b>Group Appointment</b></font></td>");
                 out.println("</tr></tbody></table></td><td height=30 width=56>&nbsp;</td></tr>");
                  out.println("<tr><td height=25 width=58>&nbsp;</td><td bgcolor=#49b0fc align=\"center\" colspan=\"3\"><b><font size=\"2\">");
                 Calendar GCalendar    = new GregorianCalendar(GYear,GMonth,GDate,GHour,0);
                 GCalendar.add(GCalendar.DATE,-1);
                 out.println("<a href=\""+DefaultURL+"/servlet/ShowUpdateGroup?m="+NoNum+"&t="+GCalendar.getTime().getTime()+"#App\"><font color=black>&lt;&lt;</font></a>");
                 GCalendar.add(GCalendar.DATE,1);
                 out.println("<a href =\""+DefaultURL+"/servlet/ShowUpdateGroup?m="+NoNum+"&t="+Calendar.getInstance().getTime().getTime()+"#App\"><font color=black>");
                 out.print(DayName[GCalendar.get(GCalendar.DAY_OF_WEEK)-1]+" "+GCalendar.get(GCalendar.DATE)+" "+MonthName[GCalendar.get(GCalendar.MONTH)]+" "+GCalendar.get(GCalendar.YEAR));
                 out.println("</font></a>  ");
                 GCalendar.add(GCalendar.DATE,1);
                 out.println(" <a href=\""+DefaultURL+"/servlet/ShowUpdateGroup?m="+NoNum+"&t="+GCalendar.getTime().getTime()+"#App\"><font color=black>&gt;&gt;</font></a>"); 
                 out.println("</font></b></td><td height=25  width=56>&nbsp;</td></tr><tr><td height=25 width=58>&nbsp;</td>");
                 out.println("<td align=center bgcolor=#49b0fc  ><b><font size=\"2\">");
                 GCalendar    = new GregorianCalendar(GYear,GMonth,GDate,0,0);
                 out.println("<a href=\""+DefaultURL+"/servlet/ShowUpdateGroup?m="+NoNum+"&t="+GCalendar.getTime().getTime()+"#App\"><font color=black>");
                 out.println("A.M</font></a> | ");
                 GCalendar    = new GregorianCalendar(GYear,GMonth,GDate,12,0);
                 out.println("<a href=\""+DefaultURL+"/servlet/ShowUpdateGroup?m="+NoNum+"&t="+GCalendar.getTime().getTime()+"#App\"><font color=black>");
                 out.println("P.M</font></a></font></b></td><td align=\"center\" bgcolor=#49b0fc><b><font size=\"2\">");
                 GCalendar = new GregorianCalendar(GYear,GMonth,GDate,0,0); 
                 GCalendar.add(GCalendar.DATE,-7);
                 out.println("<a href=\""+DefaultURL+"/servlet/ShowUpdateGroup?m="+NoNum+"&t="+GCalendar.getTime().getTime()+"#App\"><font color=black>&lt;&lt;</font></a>");
                 out.print("Week");
                 GCalendar = new GregorianCalendar(GYear,GMonth,GDate,0,0); 
                 GCalendar.add(GCalendar.DATE,7);
                  out.println(" <a href=\""+DefaultURL+"/servlet/ShowUpdateGroup?m="+NoNum+"&t="+GCalendar.getTime().getTime()+"#App\"><font color=black>&gt;&gt;</font></a>"); 
                 out.println("</font></b></td><td align=\"center\" bgcolor=#49b0fc><b><font size=\"2\">");
                 GCalendar = new GregorianCalendar(GYear,GMonth,GDate,0,0); 
                 GCalendar.add(GCalendar.MONTH,-1);
                 out.println("<a href=\""+DefaultURL+"/servlet/ShowUpdateGroup?m="+NoNum+"&t="+GCalendar.getTime().getTime()+"#App\"><font color=black>&lt;&lt;</font></a>");
                 out.print(" Month  ");
                 GCalendar.add(GCalendar.MONTH,2);
                 out.println("<a href=\""+DefaultURL+"/servlet/ShowUpdateGroup?m="+NoNum+"&t="+GCalendar.getTime().getTime()+"#App\"><font color=black>&gt;&gt;</font></a>"); 
                 out.println("</font></b></td><td height=25   width=56>&nbsp;</td></tr><tr><td height=25 width=58>&nbsp;</td><td align=\"center\" colspan=\"3\">");
                 out.println("<table width=\"100%\" border=\"0\">");
                 String MName="";
                 boolean Temp= true ;
                 GCalendar = new GregorianCalendar(GYear,GMonth,GDate,GHour,0); 
                 if (GCalendar.get(GCalendar.HOUR_OF_DAY) <12 ) Temp = true;
                 else Temp = false;
                 
                  int FDate = 0;
                  int FMonth = 0;
                  int FYear = 0 ; 
                  int FHour = 0;
                  int UDate = 0;
                  int UMonth = 0;
                  int UYear = 0 ; 
                  int UHour = 0;
                  int TDate = 0;
                  int TMonth = 0;
                  int TYear = 0 ; 
                  int THour = 0;
                  int SDate = 0;
                  int []free= {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 };
                  int Temp2=0;
                 boolean Carray=true;
                 boolean Print=true; 
                 String  MID="";
                 String TMID="";
                 Calendar FCalendar = new GregorianCalendar();
                  try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                            theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                        }  catch (Exception e) { out.println(e.getMessage()); }
                  try{  Statement  theStatement=theConnection.createStatement();      
                           ResultSet theResult = theStatement.executeQuery(    
                           "select  freq_rep,to_time,id,time  from calendar where id in "+
                           "(select idmem from member where idmem <> id and id = ' "+UserID+"'"+
                           " and groupname ='"+title+"' and grouptype = '"+type+"' )"+
                            " and "+
                           "freq_rep  >=  to_date('"+GDate+"/"+(GMonth+1)+"/"+GYear+"  00:00','dd/mm/yyyy hh24:mi')"+
                           "and freq_rep  <=  to_date('"+GDate+"/"+(GMonth+1)+"/"+GYear+"  23:59','dd/mm/yyyy hh24:mi')"
                           +" order by id" );
                          while(theResult.next())
                      {       MID=theResult.getString(3);                                                           
                              FCalendar.setTime(theResult.getDate(1));   
                               FDate = FCalendar.get(FCalendar.DATE);
                               FMonth = FCalendar.get(FCalendar.MONTH);
                               FYear = FCalendar.get(FCalendar.YEAR);
                               FCalendar.setTime(theResult.getTime(1));
                               FHour =  FCalendar.get(FCalendar.HOUR_OF_DAY);                       
                              
                               GCalendar.setTime(theResult.getDate(4));
                               SDate = GCalendar.get(GCalendar.DATE);
                               
                               GCalendar.setTime(theResult.getDate(2));
                               UDate = GCalendar.get(GCalendar.DATE);
                               UMonth = GCalendar.get(GCalendar.MONTH);
                               UYear = GCalendar.get(GCalendar.YEAR);
                               GCalendar.setTime(theResult.getTime(2));
                               UHour =  GCalendar.get(GCalendar.HOUR_OF_DAY);     
                             
                               if (TMID.equals(MID) ) {   
                                           Print=false;
                                 	GCalendar = new GregorianCalendar(FYear,FMonth,FDate,FHour,0); 
                                           if ( (FYear == GYear ) && (FMonth == GMonth ) )    
                                                  {    while(Temp2<=24 ) {
                                                  if ( (GCalendar.get(GCalendar.DATE) == GDate) )
                                                       {     if( (UYear==GYear)&&(UMonth==GMonth)&&(UDate==GDate)&&(UDate!=SDate) )
                                                               { for(int i=0;i<=UHour;i++)   free[i]=1; } else {
                                                                  free[GCalendar.get(GCalendar.HOUR_OF_DAY)] = 1; } }   
                                                           GCalendar.add(GCalendar.HOUR_OF_DAY,1);
                                                           TDate=GCalendar.get(GCalendar.DATE);
                                                           TMonth=GCalendar.get(GCalendar.MONTH);
                                                           TYear=GCalendar.get(GCalendar.YEAR);
                                                           THour=GCalendar.get(GCalendar.HOUR_OF_DAY);
                                                           if ( (TYear == UYear ) && ( TMonth == UMonth ) && ( TDate == UDate ) && (THour > UHour )  )                
                                                           { break; } 
                                                           if( (TYear == GYear ) && (TMonth == GMonth ) && (TDate != GDate ) )                
                                                           { break; } 
                                                           Temp2++; }
                                                }//if +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
                             } else {   if(Carray==true)
                                              {    GCalendar = new GregorianCalendar(FYear,FMonth,FDate,FHour,0); 
                                                    if ( (FYear == GYear ) && (FMonth == GMonth ) )    
                                                        {    while(Temp2<=24 ) {
                                                             if ( (GCalendar.get(GCalendar.DATE) == GDate) )
                                                           {   if( (UYear==GYear)&&(UMonth==GMonth)&&(UDate==GDate) &&(UDate!=SDate) )
                                                                 {  for(int i=0;i<=UHour;i++)   free[i]=1;  } else {
                                                                  free[GCalendar.get(GCalendar.HOUR_OF_DAY)] = 1; } }
                                                           GCalendar.add(GCalendar.HOUR_OF_DAY,1);
                                                           TDate=GCalendar.get(GCalendar.DATE);
                                                           TMonth=GCalendar.get(GCalendar.MONTH);
                                                           TYear=GCalendar.get(GCalendar.YEAR);
                                                           THour=GCalendar.get(GCalendar.HOUR_OF_DAY);
                                                           if ( (TYear == UYear ) && ( TMonth == UMonth ) && ( TDate == UDate ) && (THour > UHour )  )                
                                                           { break; } 
                                                           if( (TYear == GYear ) && (TMonth == GMonth ) && (TDate != GDate ) )                
                                                           { break; } 
                                                           Temp2++; }
                                                           Carray=false;
                                                           Print=false;
                                                           TMID=MID;
                                                        
                                                   }//if +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
                                             }else{    try {   theResult = theStatement.executeQuery(    
                                             	       "select membername from member where idmem ='"+TMID+"' and groupname = '"+title+
                                             	       "' and grouptype ='"+type+"' and id =' "+UserID+"'");
                                             	     while (theResult.next()) {MName = theResult.getString(1);}
                                             	    // theResult.close();
                                             	    // theStatement.close();
                                             	    }
                                             	  catch (Exception e)   {out.println(e.getMessage()); }   
                                                               out.println("<tr><td width=\"7%\" rowspan=\"2\" align=\"center\" bgcolor=\"#49b0fc\"> ");
                                                               out.println("<input type=\"checkbox\" name=\"member\" value=\""+TMID+"\">");
                                                               out.println("</td><td width=\"14%\" rowspan=\"2\" align=\"center\" bgcolor=\"#49b0fc\"><b><font size=\"2\">"+MName+"</font></b></td>");
                                                               if (Temp)  {
                                                                         for (int i=0;i<=5;i++) {
                                                                                 if (free[i]==1 ) out.print("<td align=\"center\"  bgcolor=\"#CCFFCC\">");
                                                                                                            else out.print("<td align=\"center\"  bgcolor=\"#99CCFF\">");
                                                                         out.print("<b><font size=\"2\">");
                                                                         if(i<10) out.print("0");
                                                                         out.println(i+":00</font></b></td>");  }
                                                                         out.println("</tr><tr>"); 
                                                                         for (int i=6;i<=11;i++) {
                                                                         if (free[i]==1 ) out.print("<td align=\"center\"  bgcolor=\"#CCFFCC\">");
                                                                                         else out.print("<td align=\"center\"  bgcolor=\"#99CCFF\">");
                                                                         out.print("<b><font size=\"2\">");
                                                                         if(i<10) out.print("0");
                                                                         out.println(i+":00</font></b></td>");  }
                                                                         out.println("</tr>");    }//if
                                                                  else  {  for (int i=12;i<=17;i++) {
                                                                                 if (free[i]==1 ) out.print("<td align=\"center\"  bgcolor=\"#CCFFCC\">");
                                                                                                 else out.print("<td align=\"center\"  bgcolor=\"#99CCFF\">");
                                                                                 out.print("<b><font size=\"2\">");
                                                                                 out.println(i+":00</font></b></td>");  }
                                                                                 out.println("</tr><tr>"); 
                                                                                 for (int i=18;i<=23;i++) {
                                                                                 if (free[i]==1 ) out.print("<td align=\"center\"  bgcolor=\"#CCFFCC\">");
                                                                                 else out.print("<td align=\"center\"  bgcolor=\"#99CCFF\">");
                                                                                 out.print("<b><font size=\"2\">");
                                                                                 out.println(i+":00</font></b></td>");  }
                                                                                 out.println("</tr>");    }//else
                                                                 for(int i=0;i<=23;i++)  free[i]=0;    
                                                                Print=true;
                                                                Carray=true;
                                                                //*********************
                                                                GCalendar = new GregorianCalendar(FYear,FMonth,FDate,FHour,0); 
                                                                if ( (FYear == GYear ) && (FMonth == GMonth ) )    
                                                                         {   while(Temp2<=24 ) {
                                                                                            if ( (GCalendar.get(GCalendar.DATE) == GDate) )
                                                                                            {   if( (UYear==GYear)&&(UMonth==GMonth)&&(UDate==GDate)&&(UDate!=SDate) )
                                                                                                 { for(int i=0;i<=UHour;i++)  free[i]=1;    } else {                                  	                                                  	
                                                                                                free[GCalendar.get(GCalendar.HOUR_OF_DAY)] = 1; }}
                                                                                                GCalendar.add(GCalendar.HOUR_OF_DAY,1);
                                                                                                TDate=GCalendar.get(GCalendar.DATE);
                                                                                                TMonth=GCalendar.get(GCalendar.MONTH);
                                                                                                TYear=GCalendar.get(GCalendar.YEAR);
                                                                                                THour=GCalendar.get(GCalendar.HOUR_OF_DAY);
                                                                                                 if ( (TYear == UYear ) && ( TMonth == UMonth ) && ( TDate == UDate ) && (THour > UHour )  )                
                                                                                                { break; } 
                                                                                               if( (TYear == GYear ) && (TMonth == GMonth ) && (TDate != GDate ) )                
                                                                                               { break; } 
                                                                                                Temp2++; }
                                                                                                 Print = false;      
                                                                          }//if +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++                       
                                                   TMID=MID;
                                                
                                                    }//Check Array
                               }//Else
                             /* out.println("Freq ="+theResult.getDate(1)+" Time = ");
                              out.println(theResult.getTime(1)+"<br>");
                              out.println("To Time ="+theResult.getDate(2)+"Time = ");
                              out.println(theResult.getTime(2)+"<br>");
                              out.println("Time ="+theResult.getDate(4)+"Time = ");
                              out.println(theResult.getTime(4)+"<br><br>");*/
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++               
                      }//while
                      theResult.close();
                      theStatement.close();    
                      }  catch (Exception e) { out.println(e.getMessage()); }                  
                if (!Print ) 
                       {    try {   Statement  theStatement=theConnection.createStatement();      
                                      ResultSet theResult = theStatement.executeQuery(        
                                             	       "select membername from member where idmem ='"+MID+"' and groupname = '"+title+
                                             	       "' and grouptype ='"+type+"' and id =' "+UserID+"'");
                                             	     while (theResult.next()) {MName = theResult.getString(1);}
                                             	    // theResult.close();
                                             	    // theStatement.close();
                                             	    }
                                             	  catch (Exception e)   {out.println(e.getMessage()); }    
                          out.println("<tr><td width=\"7%\" rowspan=\"2\" align=\"center\" bgcolor=\"#49b0fc\"> ");
                            out.println("<input type=\"checkbox\" name=\"member\" value=\""+MID+"\">");
                            out.println("</td><td width=\"14%\" rowspan=\"2\" align=\"center\" bgcolor=\"#49b0fc\"><b><font size=\"2\">"+MName+"</font></b></td>");
                            if (Temp)  {
                                     for (int i=0;i<=5;i++) {
                                     if (free[i]==1 ) out.print("<td align=\"center\"  bgcolor=\"#CCFFCC\">");
                                           else out.print("<td align=\"center\"  bgcolor=\"#99CCFF\">");
                                     out.print("<b><font size=\"2\">");
                                     if(i<10) out.print("0");
                                     out.println(i+":00</font></b></td>");  }
                                     out.println("</tr><tr>"); 
                                     for (int i=6;i<=11;i++) {
                                     if (free[i]==1 ) out.print("<td align=\"center\"  bgcolor=\"#CCFFCC\">");
                                         else out.print("<td align=\"center\"  bgcolor=\"#99CCFF\">");
                                     out.print("<b><font size=\"2\">");
                                     if(i<10) out.print("0");
                                          out.println(i+":00</font></b></td>");  }
                                    out.println("</tr>");    }//if
                                    else  {  for (int i=12;i<=17;i++) {
                                           if (free[i]==1 ) out.print("<td align=\"center\"  bgcolor=\"#CCFFCC\">");
                                                  else out.print("<td align=\"center\"  bgcolor=\"#99CCFF\">");
                                                  out.print("<b><font size=\"2\">");
                                                  out.println(i+":00</font></b></td>");  }
                                                  out.println("</tr><tr>"); 
                                                  for (int i=18;i<=23;i++) {
                                                  if (free[i]==1 ) out.print("<td align=\"center\"  bgcolor=\"#CCFFCC\">");
                                                         else out.print("<td align=\"center\"  bgcolor=\"#99CCFF\">");
                                                  out.print("<b><font size=\"2\">");
                                                  out.println(i+":00</font></b></td>");  }
                                                  out.println("</tr>");    }//else
                 }//if Print
                
                
                
                
                 try{  Statement  theStatement=theConnection.createStatement();      
                           ResultSet theResult = theStatement.executeQuery(    
                         "select idmem,membername  from member where idmem not in ("+
                          " select id from calendar"+
                           " where freq_rep >= to_date('"+GDate+"/"+(GMonth+1)+"/"+GYear+" 00:00','dd/mm/yyyy hh24:mi')"+
                           "  and freq_rep  <=  to_date('"+GDate+"/"+(GMonth+1)+"/"+GYear+"  23:59','dd/mm/yyyy hh24:mi')"+
                            " group by id )"+
                         " and groupname ='"+title+"' and grouptype = '"+type+"'"+
                         "  and idmem <> id and id =' "+UserID+"'");
                         
                          while(theResult.next())
                      {  out.println("<tr><td width=\"7%\" rowspan=\"2\" align=\"center\" bgcolor=\"#49b0fc\"> ");
                            out.println("<input type=\"checkbox\" name=\"member\" value=\""+theResult.getString(1)+"\">");
                            out.println("</td><td width=\"14%\" rowspan=\"2\" align=\"center\" bgcolor=\"#49b0fc\"><b><font size=\"2\">"+theResult.getString(2)+"</font></b></td>");
                            if (Temp)  {
                                     for (int i=0;i<=5;i++) {
                                     out.print("<td align=\"center\"  bgcolor=\"#99CCFF\">");
                                     out.print("<b><font size=\"2\">");
                                     if(i<10) out.print("0");
                                     out.println(i+":00</font></b></td>");  }
                                     out.println("</tr><tr>"); 
                                     for (int i=6;i<=11;i++) {
                                     out.print("<td align=\"center\"  bgcolor=\"#99CCFF\">");
                                     out.print("<b><font size=\"2\">");
                                     if(i<10) out.print("0");
                                          out.println(i+":00</font></b></td>");  }
                                    out.println("</tr>");    }//if
                                    else  {  for (int i=12;i<=17;i++) {
                                                  out.print("<td align=\"center\"  bgcolor=\"#99CCFF\">");
                                                  out.print("<b><font size=\"2\">");
                                                  out.println(i+":00</font></b></td>");  }
                                                  out.println("</tr><tr>"); 
                                                  for (int i=18;i<=23;i++) {
                                                  out.print("<td align=\"center\"  bgcolor=\"#99CCFF\">");
                                                  out.print("<b><font size=\"2\">");
                                                  out.println(i+":00</font></b></td>");  }
                                                  out.println("</tr>");   }//else
                                 }//while
                 theStatement.close();
                 theResult.close();
                 }  catch (Exception e) { out.println(e.getMessage()); }      
                
                out.println("<TR>");
                out.println("<TD  align=middle colspan=\"4\" bgColor=#49b0fc>");
                out.println("<a href=\"javascript:SetCheck(0)\"><font size=2 color=black><b>Check All</b></font></a> <font size=2 color=black><b>|</b></font>");
                out.println("<a href=\"javascript:SetCheck(1)\"><font size=2 color=black><b>Clear</b></font></a></TD>");
                
                out.println("<TD align=center colspan=\"2\" valign=\"middle\" bgColor=#99ccff><b><font size=\"2\">Free Time </font></b></TD>");
                out.println("<TD align=center colspan=\"2\" valign=\"middle\" bgColor=#ccffcc><b><font size=\"2\">Busy</font></b></TD></TR>");
                out.println("</table></td><td height=25 width=56>&nbsp;</td></tr>");   
                 out.println("<tr><td height=25 width=58>&nbsp;</td><td bgcolor=#49b0fc colspan=3> ");
                out.println("<table border=0 width=\"100%\"><tbody>");
               
                out.println("<tr><td width=\"6%\">&nbsp;</td><td valign=bottom width=\"27%\"><b><font size=2>Title</font></b></td>");
                 out.println("<td valign=bottom width=\"67%\"><input name=GATitle size=30></td></tr><tr><td width=\"6%\">&nbsp;</td><td valign=bottom width=\"27%\"><b><font size=2>Place</font></b></td>");
                 out.println("<td width=\"67%\"><input name=GAPlace size=30></td></tr><tr><td width=\"6%\">&nbsp;</td><td valign=bottom width=\"27%\"><b><font  size=2>Type</font></b></td>");
                 out.println("<td valign=bottom width=\"67%\"><select name=GAType size=1>");
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
                 out.println("<option value=\"Wedding\">Wedding</option>");                     
                 out.println("</select></td></tr><tr><td width=\"6%\">&nbsp;</td><td valign=bottom width=\"27%\"><font size=2><b>Start Date</b></font></td>");
                  out.println("<td valign=bottom width=\"67%\"><select name=GADay>");
                  for (int i=1;i<=31;i++)   {
                  out.print("<option value="+i);
                  if (GDate==i) out.print(" selected");
                  out.print(">");
                  if (i<10)out.print("0");
                  out.println(i+"</option>");  }
                  out.println("</select><select name=GAMonth>");
                  for (int i=0;i<=11;i++) { out.print("<option value="+i);
                   if (GMonth==i)out.print(" selected");
                  out.println(">"+MonthName[i]+"</option>"); }
                  out.println("</select> <select name=GAYear>");
                  for (int i=2001;i<=2003;i++)
                  {out.print("<option  value="+i);
                    if (GYear==i)out.print(" selected"); 
                    out.println(">"+i+"</option>"); }
                    out.println("</select><font size=2><b> - </b><select name=GAHour>");
                    for (int i=0;i<=23;i++){
                     out.print("<option value="+i);
                     if (GHour==i)out.print(" selected"); 
                     out.print(">");
                     if (i<10) out.print("0");
                     out.println(i+"</option>");  }
                     out.println("</select><font size=2><b> : </b></font><select name=GAMin>");  
                     out.println("<option selected value=0>00</option>");
                     out.println("<option  value=15>15</option>");
                     out.println("<option  value=30>30</option>");
                     out.println("<option  value=45>45</option>");
                     out.println("</select></td></tr>");
                                       
                    out.println("<tr><td width=\"6%\">&nbsp;</td><td valign=bottom width=\"27%\"><font size=2><b>Final Date & Time</b></font></td>");
                  out.println("<td valign=bottom width=\"67%\"><select name=GAFDay>");
                  for (int i=1;i<=31;i++)   {
                  out.print("<option value="+i);
                  if (GDate==i) out.print(" selected");
                  out.print(">");
                  if (i<10)out.print("0");
                  out.println(i+"</option>");  }
                  out.println("</select><select name=GAFMonth>");
                  for (int i=0;i<=11;i++) { out.print("<option value="+i);
                   if (GMonth==i)out.print(" selected");
                  out.println(">"+MonthName[i]+"</option>"); }
                  out.println("</select> <select name=GAFYear>");
                  for (int i=2001;i<=2003;i++)
                  {out.print("<option  value="+i);
                    if (GYear==i)out.print(" selected"); 
                    out.println(">"+i+"</option>"); }
                    out.println("</select><font size=2><b> - </b><select name=GAFHour>");
                    for (int i=0;i<=23;i++){
                     out.print("<option value="+i);
                     if (GHour==i)out.print(" selected"); 
                     out.print(">");
                     if (i<10) out.print("0");
                     out.println(i+"</option>");  }
                     out.println("</select><font size=2><b> : </b></font><select name=GAFMin>");  
                     out.println("<option selected value=0>00</option>");
                     out.println("<option  value=15>15</option>");
                     out.println("<option  value=30>30</option>");
                     out.println("<option  value=45>45</option>");
                     out.println("</select></td></tr>");
                    
                    
                     out.println("<tr><td width=\"6%\">&nbsp;</td><td valign=top width=\"27%\"><font size=2><b>Note</b></font></td>");
                     out.println("<td width=\"67%\"><textarea cols=30 name=GANote></textarea></td></tr><tr><td width=\"6%\">&nbsp;</td>");
                     out.println("<td valign=bottom width=\"27%\"><b><font size=2>From</font></b></td><td width=\"67%\"><input name=GAFrom size=30>");
                     out.println("</td></tr><tr><td height=35 width=\"6%\">&nbsp;</td><td align=right colspan=2 height=35 valign=bottom>");
                     //out.println("<input type=\"hidden\" name=\"HiddenNo\" value=\""+NoNum+"\">");
                     out.println("<input type=\"hidden\" name=\"Title\" value=\""+title+"\">");
                     out.println("<input type=\"hidden\" name=\"Type\" value=\""+type+"\">");
                     out.println("<input name=Submit type=submit value=\"  Submit   \">");
                     out.println("<input name=SubmitAnother type=submit value=\"Submit And Add Another\">");
                     out.println("<input name=Cancel type=reset value=\"  Clear  \">");
                     out.println("</td></tr></tbody></table>");
                     out.println("</TD><TD height=25 >&nbsp;</TD></TR>");
                     out.println("</TBODY></TABLE></FORM>");
                     out.println("</TD></TR></TBODY></TABLE></BODY></HTML>");
                }
                
        }//DoPost
  }//ShowUpdateGroup
  
  
   