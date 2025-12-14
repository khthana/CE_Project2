import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.net.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
public class Creatememwap extends HttpServlet
{    String DefaultURL = "http://161.246.5.233:8080/planny";
      protected  void  doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
 {          HttpSession session = req.getSession(true);
            String  UserID = session.getValue("login.username").toString();	
             if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
             Connection theConnection;
             boolean check = false;
             boolean c = true;
             boolean checkmatch = true;
             boolean checkmid = false;
             boolean checklogin = true;
             String Memname      = req.getParameter("namemem");
             String Status      = req.getParameter("statusgr");
             String MemID      = req.getParameter("Memidgr");
             String Note      = req.getParameter("notegr");
             String Namegr      = req.getParameter("grname");
             String Typegr = req.getParameter("typegr");
             
             if (Memname.equals("")) Memname= "No Name";
             if (Status.equals("")) Status="No Status";
           try{                            
                                                //Loading Sun's JDBC ODBC Driver   
                                               Class.forName("oracle.jdbc.driver.OracleDriver");
                                               //Connect to emaildb Data source
                                               theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                               //Select all records from emaillists table.
                                               Statement  theStatement=theConnection.createStatement();
                                               ResultSet theResult = theStatement.executeQuery(  "select groupname,grouptype,id  from member where id=' "+UserID+"'");
                                               while (theResult.next()){ 
                                                if (  (Namegr.equals( theResult.getString(1))) && (Typegr.equals(theResult.getString(2)))&& (!(MemID.equals(theResult.getString(3).substring(1))))   ) {  
                                                    	                                                                            check = true;
                                                                                                                                }
                                                  if ( (Namegr.equals( theResult.getString(1))) && (Typegr.equals(theResult.getString(2))))  checkmatch=false;
                                                                        }//while
                                 theStatement.close();
                                 theConnection.close(); 
                                 }   catch (Exception e)  
                             {  res.setContentType("text/html");
                                  PrintWriter out = res.getWriter();
                                 out.println(e.getMessage()); 
                             }
                   if(checkmatch)   session.putValue("login.messagegroup","<font size=2 Color=red><b>Name Group not match Type Group</b></font>");  
                         try{                            
                                                //Loading Sun's JDBC ODBC Driver   
                                               Class.forName("oracle.jdbc.driver.OracleDriver");
                                               //Connect to emaildb Data source
                                               theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                               //Select all records from emaillists table.
                                               Statement  theStatement=theConnection.createStatement();
                                               ResultSet theResult = theStatement.executeQuery(  "select id from userdata");
                                               while (theResult.next()) {
                                                 if (MemID.equals(theResult.getString(1).substring(1))) checklogin= false;
                                                                                           }//while
                              theStatement.close();
                              theConnection.close(); 
                                                 }   catch (Exception e)  
                                    {  res.setContentType("text/html");
                                        PrintWriter out = res.getWriter();
                                        out.println(e.getMessage()); 
                                    }
                                                 if(checklogin)   session.putValue("login.messagegroup","<font size=2 Color=red><b>Invalid Member ID </b></font>");  
                            
                                     
                         try{                            
                                                //Loading Sun's JDBC ODBC Driver   
                                               Class.forName("oracle.jdbc.driver.OracleDriver");
                                               //Connect to emaildb Data source
                                               theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                               //Select all records from emaillists table.
                                               Statement  theStatement=theConnection.createStatement();
                                               ResultSet theResult = theStatement.executeQuery(  "select idmem from member where groupname='"+Namegr+"' and grouptype='"+Typegr+"' and id=' "+UserID+"'");
                                               while (theResult.next()) {               
                                                   if (MemID.equals(theResult.getString(1).substring(1))) {
                                                   	c = false;
                                                   	session.putValue("login.messagegroup","<font size=2 Color=red><b>Member ID has exist</b></font>");  
                                                   }
                                                  }//while	
                              theStatement.close();
                                                  theConnection.close(); 
                                                 }   catch (Exception e)  
                                    {  res.setContentType("text/html");
                                        PrintWriter out = res.getWriter();
                                        out.println(e.getMessage()); 
                                    }
                                     
                                     
                                               if  ((check)&& (c)) { 
                                               	     try{                            
                                                                               Class.forName("oracle.jdbc.driver.OracleDriver");
                                                                               theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                                                               Statement  theStatement=theConnection.createStatement();
                                                                                 theStatement.executeQuery(        
                                                                                    "INSERT INTO member"
                                                                                     +"(no_mem,grouptype,groupname,note,no_group,id,idmem,status,membername)"
                                                                                      +"values(no_mem.nextval,'"+Typegr+"','"+Namegr+"','"+Note+"',1,' "+UserID+"',' "+MemID+"','"
                                                                                      +Status+"','"+Memname+"')");
                                                                                       theStatement.close();//Close statement
                                                                                       theConnection.close(); 
                                                                        }   catch (Exception e)  
                                                                       {    res.setContentType("text/html");
                                                                             PrintWriter out = res.getWriter();
                                                                        out.println(e.getMessage()); 
                                                                        }
                                                              }
                     res.sendRedirect(DefaultURL+ "/servlet/mainwap?s=6");
             }
     }
                                                       
             