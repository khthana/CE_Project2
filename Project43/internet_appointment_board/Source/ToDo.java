import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.util.*;
public class ToDo extends HttpServlet
{   static final  String [] MonthName = {"January","February","March","April","May", "June","July","August","September","October","November","December"};
     String DefaultURL="http://161.246.5.233:8080/planny";
     public  void  doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
HttpSession session = req.getSession(true);
String UserID =session.getValue("login.username").toString();
/*if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }*/
res.setContentType("text/html");
PrintWriter out = res.getWriter();
out.println("<html><head><title>Planny Organizer</title>");
out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\"><style type=\"text/css\">");
out.println("<!-- body {  margin: 0px  0px; padding: 0px  0px}");
out.println("a:link { color: #005CA2; text-decoration: none}");
out.println("a:visited { color: #005CA2; text-decoration: none}");
out.println("a:active { color: #0099FF; text-decoration: underline}");
out.println("a:hover { color: #0099FF; text-decoration: underline}-->");
out.println("</style></head>");
out.println("<body bgcolor=\"#FFFFFF\"><table width=\"100%\" border=\"0\" height=\"100%\">");
//out.println("<from method=\"post\" action=\"ManageToDo\">");
out.println(" <tr> <td height=\"84\" rowspan=\"3\" bgcolor=\"#49B0FC\" width=\"19%\">&nbsp;</td>");
out.println("<td height=\"25\" width=\"17%\">&nbsp;</td>");
out.println("<td height=\"25\" width=\"64%\">&nbsp;</td></tr>");
out.println(" <tr> <td height=\"57\" colspan=\"2\" align=\"center\" valign=\"middle\">");
out.println("<img src=\"/planny/picture/logo4.jpg\" width=\"360\" height=\"51\"></td> </tr>");
out.println("<tr> <td colspan=\"2\" valign=\"top\" height=\"365\"> ");
out.println("<form method=\"post\" action=\""+DefaultURL+"/servlet/ManageToDo\" >");
out.println("<table width=\"100%\" border=\"0\"><tr> <td width=\"65\" height=\"25\">&nbsp;</td>");
out.println("  <td height=\"25\" width=\"165\">&nbsp;</td>");
out.println("<td height=\"25\" width=\"155\">&nbsp;</td>");
out.println("  <td height=\"25\" width=\"174\">&nbsp;</td>");
out.println("<td width=\"58\" height=\"25\">&nbsp;</td></tr>");
out.println("<tr> <td width=\"65\" height=\"25\">&nbsp;</td>");
out.println(" <td bgcolor=\"#94B7F1\" colspan=\"3\" height=\"25\"> ");
out.println("<table width=\"100%\" border=\"0\"> <tr> <td bgcolor=\"#CCFFFF\" height=\"23\" valign=\"middle\">&nbsp;");
out.println("<font size=\"2\" face=\"Arial\">&nbsp;<b>Add To Do List</b></font></td>");
out.println("</tr></table></td>");
out.println("<td width=\"58\" height=\"25\">&nbsp;</td></tr>");
out.println("<tr>  <td width=\"65\" height=\"25\">&nbsp;</td>");
out.println("<td height=\"187\" colspan=\"3\" rowspan=\"3\" bgcolor=\"#49B0FC\" align=\"center\"> ");
out.println("<table width=\"100%\" border=\"0\" height=\"50%\"><tr> ");
out.println("<td colspan=\"2\" align=\"right\" height=\"30\"><font size=\"2\"></font></td>");
out.println("<td width=\"6%\" valign=\"bottom\" height=\"30\">&nbsp;</td>");
out.println("<td width=\"38%\" valign=\"bottom\" height=\"30\"><font size=\"2\"></font><font size=\"2\"></font><font size=\"2\"> ");
out.println("<b>Title</b><br><input type=\"text\" name=\"TitleToDo\" size=\"28\"></font></td>");
out.println(" <td width=\"4%\" valign=\"bottom\" height=\"30\">&nbsp;</td>");
out.println(" <td width=\"52%\" valign=\"bottom\" height=\"30\"><font size=\"2\"><b>D</b></font><font size=\"2\"><b>ate</b></font><br>");
out.println("<font face=\"Arial,Helvetica\" size=1>");
out.println("<select name=\"dateToDo\">");
final int  CurDate      =  Calendar.getInstance().get(Calendar.DAY_OF_MONTH); 
final int  CurMonth    =  Calendar.getInstance().get(Calendar.MONTH); 
final int  CurYear      =  Calendar.getInstance().get(Calendar.YEAR); 
for (int i=1;i<=31;i++)  
          {          out.print("<option value=\"");
          	 if ( i<10 )      out.print("0");
          	 out.print(i+"\"");
          	 if ( CurDate == i ) out.print("selected");   
          	 out.println(">"+i+"</option>"); 
           }
out.println("</select></font><font face=\"Arial,Helvetica\" size=1> ");
out.println("<select name=\"MonthToDo\">");
for (int i=1;i<=12;i++)  
          {          out.print("<option value=\"");
          	 if ( i<10 )      out.print("0");
          	 out.print(i+"\"");
          	 if ( CurMonth == i-1 ) out.print("selected");   
          	 out.println(">"+MonthName[i-1]+"</option>"); 
           }
out.println("</select></font><select name=\"YearToDo\">");
for(int i=2001;i<=2003;i++)
           {        out.print("<option value=\"");
                     out.print(i+"\"");
          	 if ( CurYear == i ) out.print("selected");   
          	 out.println(">"+i+"</option>"); 
            }
out.println(" </td> </tr>");
out.println("<tr><td colspan=\"2\" align=\"right\"><font size=\"2\"> </font></td>");
out.println(" <td width=\"6%\" valign=\"bottom\">&nbsp;</td>");
out.println(" <td width=\"38%\" valign=\"bottom\"><font size=\"2\"> </font><font size=\"2\"> <b>Priority</b><br>");
out.println("<input type=\"radio\" name=\"radiobutton\" value=\"4\"> Most<br>");
out.println("<input type=\"radio\" name=\"radiobutton\" value=\"3\"> Medium<br>");
out.println("<input type=\"radio\" name=\"radiobutton\" value=\"2\"> Less</font><font size=\"2\"> <br>");
out.println("<input type=\"radio\" name=\"radiobutton\" value=\"1\" checked> No Identify</font><font size=\"2\"></font><font size=\"2\"> </font></td>");
out.println("<td width=\"4%\" valign=\"bottom\">&nbsp;</td>");
out.println("<td width=\"52%\" valign=\"bottom\"><font size=\"2\"><b>Note</b></font><br><textarea name=\"NoteToDo\" rows=\"5\" cols=\"28\"></textarea>");
out.println(" </td></tr>");
out.println("   <tr> <td colspan=\"2\" align=\"right\"><font size=\"2\"></font></td>");
out.println("  <td width=\"6%\" valign=\"bottom\">&nbsp;</td>");
out.println("   <td width=\"38%\" valign=\"bottom\"><font face=\"Arial,Helvetica\" size=1> </font></td>");
out.println(" <td width=\"4%\" valign=\"bottom\">&nbsp;</td>");
out.println("<td width=\"52%\" valign=\"bottom\">&nbsp;</td></tr>");

out.println("<tr><td colspan=\"2\">&nbsp;</td>");
out.println("<td width=\"6%\" valign=\"bottom\">&nbsp;</td>");          
out.println("<td colspan=\"3\" valign=\"bottom\">");
out.println("<input type=\"submit\" name=\"SubmitSave\" value=\"  Save  \">");
out.println("<input type=\"submit\" name=\"SubmitSaveAnother\" value=\"Save And Add Another\">");
out.println("<input type=\"submit\" name=\"Cancel\" value=\"  Cancel  \"></td></tr>");
out.println("  <tr> <td colspan=\"2\">&nbsp;</td>");
out.println("<td width=\"6%\" valign=\"bottom\">&nbsp;</td>");
out.println("<td width=\"38%\" valign=\"bottom\">&nbsp;</td>");
out.println("<td width=\"4%\" valign=\"bottom\">&nbsp;</td>");
out.println("<td width=\"52%\">&nbsp;</td>");
out.println("  </tr> </table></td>");
out.println("<td width=\"58\" height=\"25\">&nbsp;</td></tr>");
out.println("<tr> <td width=\"65\" height=\"25\">&nbsp;</td><td width=\"58\" height=\"25\">&nbsp;</td></tr>");
out.println(" <tr> <td width=\"65\" height=\"25\">&nbsp;</td><td width=\"58\" height=\"25\">&nbsp;</td></tr>");
out.println("<tr><td width=\"65\" height=\"25\">&nbsp;</td><td height=\"25\" width=\"165\">&nbsp;</td>");
out.println("<td height=\"25\" width=\"155\">&nbsp;</td>  <td height=\"25\" width=\"174\">&nbsp;</td> ");
out.println("<td width=\"58\" height=\"25\">&nbsp;</td></tr>");
out.println(" </table> </td></tr></form></table></body></html>");
out.flush();
out.close();

}
}