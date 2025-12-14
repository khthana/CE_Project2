import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.net.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
public class NewGroup extends HttpServlet
{    String DefaultURL = "http://161.246.5.233:8080/planny";
      protected  void  doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
 {          HttpSession session = req.getSession(true);
            String  UserID = session.getValue("login.username").toString();	
             if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
             Connection theConnection;
             String Type      = req.getParameter("CreateGType");
             String Name      = req.getParameter("CreateGName");
             String Note      = req.getParameter("CreateGNote");
             boolean check = false;
             if (Name.equals("")) Name= "No Name";
             
                try{
                                                //Loading Sun's JDBC ODBC Driver   
                                               Class.forName("oracle.jdbc.driver.OracleDriver");
                                               //Connect to emaildb Data source
                                               theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                               //Select all records from emaillists table.
                                               Statement  theStatement=theConnection.createStatement();
                                               ResultSet theResult = theStatement.executeQuery( 
                                                       "select groupname,grouptype from member where id=' "+UserID+"'");
                                               while(theResult.next())
                                                       { if ( (Name.equals(theResult.getString(1))) && (Type.equals(theResult.getString(2))) ){
                                                             session.putValue("login.messagegroup","<font size=2 Color=red><b>Name Group has exist</b></font>");  
                                                             check = true;
                                                        }
                                                     }//while
                                            theStatement.close();//Close statement
                                                theConnection.close(); 
                       }   catch (Exception e)  
                                    {  res.setContentType("text/html");
                                        PrintWriter out = res.getWriter();
                                        out.println(e.getMessage()); 
                                    }
                                  
             if (!check) {
              try{
                                                //Loading Sun's JDBC ODBC Driver   
                                               Class.forName("oracle.jdbc.driver.OracleDriver");
                                               //Connect to emaildb Data source
                                               theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                               //Select all records from emaillists table.
                                               Statement  theStatement=theConnection.createStatement();
                                                  theStatement.executeQuery(
                                                       "INSERT INTO member"
                                                       +"(no_mem,grouptype,groupname,notegr,no_group,id,idmem,membername)"
                                                       +"values(no_mem.nextval,'"+Type+"','"+Name+"','"+Note+"',1,' "+UserID+"',' "+UserID+"','"+UserID+"')");
                                                theStatement.close();//Close statement
                                                theConnection.close(); 
                       }   catch (Exception e)  
                                    {  res.setContentType("text/html");
                                        PrintWriter out = res.getWriter();
                                        out.println(e.getMessage()); 
                                    }
                          }
                     res.sendRedirect(DefaultURL+ "/servlet/gCalendar");
             }
     }
                                                       
             