import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
public class ShowUpdateToDowap extends HttpServlet
{   static final  String [] MonthName = {"January","February","March","April","May", "June","July","August","September","October","November","December"};
     String DefaultURL="http://161.246.5.233:8080/planny";
     protected  void  doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
       {  HttpSession session = req.getSession(true);
           String UserID =session.getValue("login.username").toString();
            if ( UserID==null  ) {  res.sendRedirect(DefaultURL+"/wap/login.wml");  }
           String No = req.getParameter("n");
           session.putValue("ToDo.No",No);
           Connection theConnection;
           res.setContentType("text/vnd.wap.wml");
           PrintWriter out = res.getWriter();
           out.println("<?xml version=\"1.0\"?>");
          out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">");
           out.println("<wml><card  id = \"insertToDo\" title=\"To Do\"><p align =\"center\">");
           out.println("<a href=\""+DefaultURL+"/servlet/UpdateToDowap\">UpdateToDo</a><br/>");
           out.println("<a href=\""+DefaultURL+"/servlet/DeleteToDowap\">DeleteToDo</a><br/>");
           try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                      theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                      Statement  theStatement=theConnection.createStatement();
                      ResultSet theResult = theStatement.executeQuery(
                                                " Select title,priority,timeout  from todo where id = ' "+UserID+"'  and no_todo = '"+No+"'"  );
                    while (theResult.next())   {
                    String title = CShowUpdate(theResult.getString(1));
                    out.println(" <b>Title : "+title+"</b><br/>");
                    int priority = theResult.getInt(2);
                    out.print("Priority  : ");
                     if (priority == 4) out.println("Most<br/>");
                    if (priority == 3) out.println("Medium<br/>");
                    if (priority == 2) out.println("Less<br/>");
                    if (priority == 1) out.println("No Identify<br/>");
                    
                                     	Calendar DBCalendar = new GregorianCalendar();
                                                            DBCalendar.setTime(theResult.getDate(3));
                                                            int DBDate = DBCalendar.get(DBCalendar.DATE);
                                                            int DBMonth = DBCalendar.get(DBCalendar.MONTH);
                                                            int DBYear = DBCalendar.get(DBCalendar.YEAR);
        out.println(" Date : "+DBDate+"<br/>");
        out.println("Month :  "+MonthName[DBMonth]+"<br/>");
        out.println("Year : "+DBYear+"<br/>");
       }//while
            out.println("</p><do type =\"prev\"><prev/></do></card></wml>");
            out.flush();
           out.close();
            theStatement.close();//Close statement
            theConnection.close();                                               
             }   catch (Exception e) { out.println(e.getMessage());  }                   
      }
 public String CShowUpdate(String InputTest) 
    {  int nut=0;
       if(InputTest.indexOf('&')!= -1) {
       nut=0;
       while(true) {
            InputTest=InputTest.substring(0,InputTest.indexOf('&',nut)).concat("&amp;"+InputTest.substring((InputTest.indexOf('&',nut)+1)));
            System.out.println(InputTest);
            nut = InputTest.indexOf('&',nut);
            if (nut == InputTest.lastIndexOf('&') )  break;
            nut =nut+1;
                           } }
       if(InputTest.indexOf('\'')!= -1) {
       nut=0;
       while(true) {
            if ( InputTest.indexOf('\'')== -1)  break;
            InputTest=InputTest.substring(0,InputTest.indexOf('\'',nut)).concat("&apos;"+InputTest.substring((InputTest.indexOf('\'',nut)+1)));
            System.out.println(InputTest);                              
                              } }                
       if(InputTest.indexOf('"')!= -1) {
       nut=0;
       while(true) {
            if (InputTest.lastIndexOf('"')== -1 )  break;
            InputTest=InputTest.substring(0,InputTest.indexOf('"',nut)).concat("&quot;"+InputTest.substring((InputTest.indexOf('"',nut)+1)));
            System.out.println(InputTest);
                             } }                                         
       if(InputTest.indexOf('<')!= -1) {
       nut=0;
       while(true) {
            if (InputTest.lastIndexOf('<')==-1 )  break;
            InputTest=InputTest.substring(0,InputTest.indexOf('<',nut)).concat("&lt;"+InputTest.substring((InputTest.indexOf('<',nut)+1)));
            System.out.println(InputTest);
                              } }                                                        
        if(InputTest.indexOf('>')!= -1) {
       nut=0;
       while(true) {
            if (InputTest.lastIndexOf('>')==-1 )  break;
            InputTest=InputTest.substring(0,InputTest.indexOf('>',nut)).concat("&gt;"+InputTest.substring((InputTest.indexOf('>',nut)+1)));
            System.out.println(InputTest);
                              } }                                                          
       if(InputTest.indexOf(" ")!= -1) {
       nut=0;
       while(true) {
            if (InputTest.lastIndexOf(" ")==-1 )  break;
            InputTest=InputTest.substring(0,InputTest.indexOf(" ",nut)).concat("&nbsp;"+InputTest.substring((InputTest.indexOf(" ",nut)+1)));
            System.out.println(InputTest);
                              } }                                            
       if(InputTest.indexOf('-')!= -1) {
       nut=0;
       while(true) {
            if (InputTest.lastIndexOf('-')==-1 )  break;
            InputTest=InputTest.substring(0,InputTest.indexOf('-',nut)).concat("&shy;"+InputTest.substring((InputTest.indexOf('-',nut)+1)));
            System.out.println(InputTest);
                               } }                                                        
       return InputTest;   
     }//Output Check 

}