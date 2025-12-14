import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Comparator;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.net.*; 

public class view  extends HttpServlet{
       Connection theConnection;


public void service (HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
    res.setContentType("text/html");
   PrintWriter out = res.getWriter();
   out.println("<HTML><HEAD><TITLE>Data</TITLE>");
   out.println("</HEAD>");
   out.println("<BODY>");
   out.println("<P align=center><FONT face=Helvetica><BIG>List of User.</BIG></FONT></P>");
   out.println("<P align=center>");
   out.println("<FONT size=\"-1\" color=blue>");
   out.println("<TABLE align=center border=1 cellPadding=1 cellSpacing=1>");
    try {    
                 Class.forName("oracle.jdbc.driver.OracleDriver");
                  theConnection = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.233:1521:kate","scott","tiger");
                 Statement	theStatement=theConnection.createStatement();
                 ResultSet theResult=theStatement.executeQuery("select * from calendar order by time ");
                 while(theResult.next()){
                
                out.println();
                out.println("<TR>");
                out.println("<TD><font color=blue>" + theResult.getString(1) + "</font></TD>");
                out.println("<TD><font color=blue>" + theResult.getString(2) + "</font></TD>");
               out.println("<TD><font color=blue>" + theResult.getString(3) + "</TD>");
                out.println("<TD><font color=blue>" + theResult.getString(4) + "</TD>");
                out.println("<TD><font color=blue>" + theResult.getString(5) + "</TD>");
                out.println("<TD><font color=blue>" + theResult.getString(6) + "</TD>");
               out.println("<TD>" + theResult.getString(7) + "</TD>");
                out.println("<TD>" + theResult.getString(8) + "</TD>");
                out.println("<TD>" + theResult.getString(9) + "</TD>");
                out.println("<TD>" + theResult.getString(10) + "</TD>");
                out.println("<TD>" + theResult.getString(11) + "</TD>");
                out.println("<TD>" + theResult.getString(12) + "</TD>");
                out.println("<TD>" + theResult.getString(13) + "</TD>");
                out.println("<TD>" + theResult.getString(14) + "</TD>");
                out.println("<TD>" + theResult.getString(15) + "</TD>");
                /*out.println("<TD>" + theResult.getString(16) + "</TD>");
                out.println("<TD>" + theResult.getString(17) + "</TD>");
                out.println("<TD>" + theResult.getString(18) + "</TD><TR>");*/
                out.println("<tr></tr>");
                
                /*Calendar GCalendar = new GregorianCalendar();
                GCalendar.setTime(theResult.getDate(2));
                
                out.println(GCalendar.get(GCalendar.DATE));
                out.println(GCalendar.get(GCalendar.MONTH));
                out.println(GCalendar.get(GCalendar.YEAR));
                if (Calendar.getInstance().getTime().getTime() > GCalendar.getTime().getTime() )
                  {out.println("Yeah
                  ");}*/
                
                              } 
           
                theResult.close();//Close the result set
                theStatement.close();//Close statement
                theConnection.close(); //Close database Connection
                out.close();
                                                         }
                catch(Exception e)  { out.println(e.getMessage());  }
                out.println("</TABLE></P>");
                out.println("<P>&nbsp;</P></FONT>");
                out.println("</BODY></HTML>");   
         
 }

 }





