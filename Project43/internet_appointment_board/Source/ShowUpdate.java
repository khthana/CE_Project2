 import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
public class ShowUpdate extends HttpServlet
{   static final  String [] MonthName = {"January","February","March","April","May", "June","July","August","September","October","November","December"};
     String DefaultURL="http://161.246.5.233:8080/planny";
     protected  void  doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {    HttpSession session = req.getSession(true);
         String UserID =session.getValue("login.username").toString();
          /*if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }*/
          Connection theConnection;
            try{                   if (Title.equals("") )Title="No Title";
                                              Class.forName("oracle.jdbc.driver.OracleDriver");
                                               //Connect to emaildb Data source
                                               theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                               //Select all records from emaillists table.
                                               Statement  theStatement=theConnection.createStatement();
                                                ResultSet theResult = theStatement.executeQuery(
                                                " Select  (title,priority,note) from todo"  )
                                                