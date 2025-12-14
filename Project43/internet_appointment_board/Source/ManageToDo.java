  import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

public class ManageToDo extends HttpServlet
{   static final  String [] MonthName = {"January","February","March","April","May", "June","July","August","September","October","November","December"};
     String DefaultURL="http://161.246.5.233:8080/planny";
      static final int  CurDate      =  Calendar.getInstance().get(Calendar.DAY_OF_MONTH); 
      static final int  CurMonth   =  Calendar.getInstance().get(Calendar.MONTH); 
      static final int  CurYear      =  Calendar.getInstance().get(Calendar.YEAR); 
        Connection theConnection;
     protected  void  doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {    HttpSession session = req.getSession(true);
         String UserID =session.getValue("login.username").toString();
           if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
        
          if (req.getParameter("Cancel") != null ) {res.sendRedirect(DefaultURL+"/servlet/mCalendar");} else  {
          String Title                    = req.getParameter("TitleToDo");
          String ErToDo   ="<font size=2 Color=red><b>Invalid Add Time ToDo</b></font>";
          String ErOverToDo   ="<font size=2 Color=red><b>Too Much ToDo. Please select delete ToDo</b></font>";
          int Freqdate          = Integer.parseInt(req.getParameter("dateToDo"));
          int FreqMonth       = Integer.parseInt(req.getParameter("MonthToDo"));
          int FreqYear          = Integer.parseInt(req.getParameter("YearToDo"));
          int no = 0;
          String Priority               = req.getParameter("radiobutton");
          String Note                   = req.getParameter("NoteToDo");
         String Save                  = req.getParameter("SubmitSave");
          String SaveAnother  = req.getParameter("SubmitSaveAnother");
          Calendar DBCalendar = new GregorianCalendar(FreqYear,FreqMonth-1,Freqdate);
          Freqdate = DBCalendar.get(DBCalendar.DAY_OF_MONTH);
          FreqMonth = DBCalendar.get(DBCalendar.MONTH)+1;
          FreqYear = DBCalendar.get(DBCalendar.YEAR);
         Calendar CurCalendar = new GregorianCalendar(CurYear,CurMonth,CurDate,0,0);
            try{    Class.forName("oracle.jdbc.driver.OracleDriver");
                                     theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                    }  catch (Exception e) {   res.setContentType("text/html");
                                                    	   PrintWriter out = res.getWriter();
                    			   out.println(e.getMessage()); }
         
           try{        Statement theStatement = theConnection.createStatement ();
                                              ResultSet theResult=theStatement.executeQuery(
                                              "select  count(*)  from  todo where id = ' "+UserID+"'");
                                     	   while (theResult.next()) { no = theResult.getInt(1);}
                                       theResult.close();
                                       theStatement.close();//Close statement
                                   }   catch (Exception e)  
                                               {    res.setContentType("text/html");
                                                    PrintWriter out = res.getWriter();
                                                    out.println(e.getMessage());  }          	   
         
                                  if (no >= 15) session.putValue("login.message",ErOverToDo);
         else {  
              if   (  (CurCalendar.before(DBCalendar)) || (CurCalendar.equals(DBCalendar))  ) { 
          
                     try{                   if (Title.equals("") )Title="No Title";
                                               Statement  theStatement=theConnection.createStatement();
                                                theStatement.executeQuery(
                                                "INSERT INTO todo"
                                                           + "(no_todo,timeout,id,title,note,priority)"
                                                           + "values( no_todo.nextval, to_date(' "+Freqdate+"/"+FreqMonth+"/" +FreqYear+"',"
                                                           +" 'dd/mm/yyyy'),' "+UserID+"','"+Title+"','"+ Note+" ',' "+Priority+"')");
                                                theStatement.close();//Close statement
                                                theConnection.close();                                         
                             }   catch (Exception e)  
                                               {    res.setContentType("text/html");
                                                    PrintWriter out = res.getWriter();
                                                    out.println(e.getMessage());  }  
               }//if
               else session.putValue("login.message",ErToDo);
             }
         
           
    if (Save != null ) { res.sendRedirect(DefaultURL+"/servlet/mCalendar"); }   
   else if (SaveAnother != null ) { res.sendRedirect(DefaultURL+"/servlet/ToDo"); }
    }//Cancel                               
}
}