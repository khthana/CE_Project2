 import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.sql.*;

public class UpdateToDowap  extends HttpServlet
{   static final  String [] MonthName = {"January","February","March","April","May", "June","July","August","September","October","November","December"};
     String DefaultURL="http://161.246.5.233:8080/planny";
     protected  void  doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
         {   HttpSession session = req.getSession(true);
              String UserID =session.getValue("login.username").toString();
              if ( UserID==null  ) {  res.sendRedirect(DefaultURL+"/wap/login.wml");  }
              res.setContentType("text/vnd.wap.wml");
              PrintWriter out = res.getWriter();
              out.println("<?xml version=\"1.0\"?>");
              out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">"); 
              out.println("<wml><card  id = \"insertToDo\" title=\"Update To Do\"><p align =\"center\">");
              out.println("</p><p> ");
              out.println("<do type =\"accept\" label=\"UpdateToDo\">");
              out.println("<go href=\""+DefaultURL+"/servlet/UpdateToDowap\" method=\"post\">");
              out.println("<postfield name=\"title\" value =\"$(title)\" />"); 
              out.println("<postfield name=\"priority\" value =\"$(priority)\"/> ");
              out.println("<postfield name=\"date\" value =\"$(date)\"/>");
              out.println("<postfield name=\"month\" value =\"$(month)\"/>");
              out.println("<postfield name=\"year\" value =\"$(year)\"/>");
              out.println("</go></do>");
              out.println("Title : <input type=\"text\" name=\"title\" emptyok=\"true\"/>");
              out.println("priority  : <select name= \"priority\">");
              out.println("<option value =\"4\">Most</option>");
              out.println("<option value =\"3\">Medium</option>");
              out.println("<option value =\"2\">Less</option>");
              out.println("<option value =\"1\">No Identify</option>");
              out.println("</select>");
              out.println("Date : <select name=\"date\" value=\""+Calendar.getInstance().get(Calendar.DAY_OF_MONTH)+"\">");
                   for(int i=1;i<=31;i++)
                        {  out.print("<option value=\""+i+"\">");
                            if (i<10) out.print("0");
                            out.println(i+"</option>");
                         }
              out.println("</select>");
              out.println("Month :  <select name=\"month\" value=\""+(Calendar.getInstance().get(Calendar.MONTH)+1)+"\">");
                  for(int i=1;i<=12;i++)
                      { out.print("<option value=\"");
                         out.print(i+"\">");
                         out.println(MonthName[i-1]+"</option>"); }   
              out.println("</select>");
              out.println("Year : <select name=\"year\" value=\""+Calendar.getInstance().get(Calendar.YEAR)+"\">");
              out.println("<option value=\"2001\">2001</option><option value=\"2002\">2002</option><option value=\"2003\">2003</option>");
              out.println("</select>");
              out.println("</p><do type =\"prev\"><prev/> </do>");
              out.println("</card></wml>");
          }
     protected  void  doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {    HttpSession session = req.getSession(true);
         String UserID =session.getValue("login.username").toString();
          if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
          String  No = (String)session.getValue("ToDo.No");
          int NoNum = Integer.parseInt(No);
         Connection theConnection;
          String Title                  = req.getParameter("title");
          String DateStr                  = req.getParameter("date");
          String MonthStr                  =req.getParameter("month");
          String YearStr                  = req.getParameter("year");
          String PriorityStr                         = req.getParameter("priority");  
           int Priority =0;
           int Datetodo = 0;
           int Monthtodo = 0;
           int Yeartodo = 0;
            try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                      theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                      Statement  theStatement=theConnection.createStatement();
                      ResultSet theResult = theStatement.executeQuery(
                                                " Select title,priority,timeout  from todo where id = ' "+UserID+"'  and no_todo = '"+No+"'"  );
                    while (theResult.next())   {
                    String title = theResult.getString(1);
                     int priority = theResult.getInt(2);
                     Calendar DBCalendar = new GregorianCalendar();
                                                            DBCalendar.setTime(theResult.getDate(3));
                                                            int DBDate = DBCalendar.get(DBCalendar.DATE);
                                                            int DBMonth = DBCalendar.get(DBCalendar.MONTH);
                                                            int DBYear = DBCalendar.get(DBCalendar.YEAR);
          if (Title.equals("") ) Title=title;
          if (PriorityStr.equals(""))  Priority=priority;
           else  Priority = Integer.parseInt(PriorityStr);
          if(DateStr.equals("")) Datetodo=DBDate;
          else  Datetodo = Integer.parseInt(DateStr);
          if(MonthStr.equals(""))Monthtodo=DBMonth+1;
           else Monthtodo = Integer.parseInt(MonthStr);
          if(YearStr.equals(""))Yeartodo=DBYear;
          else    Yeartodo = Integer.parseInt(YearStr);
                }//while
          theStatement.close();//Close statement
            theConnection.close();                                               
        }   catch (Exception e) {   res.setContentType("text/vnd.wap.wml");
                                                       PrintWriter out = res.getWriter();
        	                                  out.println(e.getMessage());  }       
        Calendar DBCalendar = new GregorianCalendar(Yeartodo,Monthtodo-1,Datetodo);
        Datetodo = DBCalendar.get(DBCalendar.DAY_OF_MONTH);
        Monthtodo = DBCalendar.get(DBCalendar.MONTH)+1;
        Yeartodo = DBCalendar.get(DBCalendar.YEAR);
         try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                      theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                      Statement  theStatement=theConnection.createStatement();
                      theStatement.executeQuery(
                                                " Update todo set title = '"+Title+"',priority = "+Priority+", timeout = to_date('"+Datetodo+"/"+Monthtodo+"/"+Yeartodo+"','dd/mm/yyyy')"+
                                                "  where id = ' "+UserID+"' and no_todo = "+ NoNum  );
                     }   catch (Exception e)  
                                               {       res.setContentType("text/vnd.wap.wml");
                                                       PrintWriter out = res.getWriter();
                                                    out.println(e.getMessage());  }    
                 res.sendRedirect(DefaultURL+"/servlet/mainwap");
                             }
     }                  