import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class ManageFindwap extends HttpServlet
 {   String DefaultURL="http://161.246.5.233:8080/planny";
       static final  String [] MonthName = {"January","February","March","April","May", "June","July","August","September","October","November","December"};
      Connection theConnection;
      protected void doPost(HttpServletRequest req , HttpServletResponse res) throws ServletException, IOException
       {    HttpSession session = req.getSession(true);
             String UserID = (String)session.getValue("login.username");	
             if ( UserID==null  ) {  res.sendRedirect(DefaultURL+"/wap/login.wml");  }
             else session.putValue("login.username",UserID);
             res.setContentType("text/vnd.wap.wml");
             PrintWriter out = res.getWriter();
             out.println("<?xml version=\"1.0\"?>");
             out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">");
             out.println("<wml><card id=\"find\" title=\"Result Find\"><p align=\"center\" mode=\"nowrap\"><table columns=\"3\">");
             out.println("<tr><td>No</td><td>Title</td><td>Type</td></tr>"); 
             String Title = req.getParameter("title");
             String Type = req.getParameter("type");
             Calendar FindCalendar = new GregorianCalendar();
             int Num =1;
             try{    Class.forName("oracle.jdbc.driver.OracleDriver");
                       theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                       Statement theStatement=theConnection.createStatement();
                       ResultSet  theResult;
                       if  (Title.equals(""))  Title="No Title"; 
                       theResult=theStatement.executeQuery("select  title,type, no_cal  from calendar where id=' "+UserID+"' and ( title= '"+Title+"'  or type= '"+Type+"') order by time"); 
                       while (theResult.next()) {
                                                            out.print("<tr><td>"+Num+"</td><td>");
                                                            out.println("<a href=\""+DefaultURL+"/servlet/ShowEventwap?n="+theResult.getInt(3)+"\">"+CheckInput(theResult.getString(1))+"</a></td><td>"+theResult.getString(2)+"</td></tr>");
                               Num++;                          
                                               }//while
                        theResult.close();
                        theStatement.close();
                }  catch (Exception e) { out.println(e.getMessage()); }
                
                out.println("</table><do type =\"prev\"><prev/></do></p></card></wml>");
            }
public String CheckInput(String InputTest) 
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


}//class