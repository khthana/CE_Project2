import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class loginwap2 extends HttpServlet 
{
	public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		res.setContentType("text/vnd.wap.wml");
		PrintWriter out = res.getWriter();
		String login = req.getParameter("login");
                                           String passwd = req.getParameter("password");
                                           boolean check = true;
                                           boolean Cpasswd=true;
                                           boolean Cloginname=false;
                                         /*   try{  Class.forName("oracle.jdbc.driver.OracleDriver");
                                           theConnection = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.233:1521:kate","scott","tiger");
                                           Statement  theStatement=theConnection.createStatement();
                                           ResultSet theResult=theStatement.executeQuery("select *  from  userdata ");
                                            while(theResult.next() && check  ){
                                                        if ( theResult.getString(1).substring(1).equals(id) ) 
                                                      {  if (theResult.getString(2).equals(pwd))  //all true
                                                       {   HttpSession session = req.getSession(true);
                              	     session.putValue("login.username",id);
                                                res.sendRedirect("http://161.246.5.233:8080/planny/wap/main.wml");
                                            }  //if       
                                           else {  Cpasswd=false;
                                                        Cloginname=true;
                                                        break;
                                                   } //else
                                     }//if
                                                                                     }//while
                          theResult.close();//Close the result set
                          theStatement.close();//Close statement
                          theConnection.close(); //Close database Connection
                        } catch(Exception e) {    res.setContentType("text/vnd.wap.wml");
	                                                 PrintWriter out = res.getWriter();
                        	                           out.println(e.getMessage());   }*/
                        	                              out.println( "<?xml version=\"1.0\"?> "+ 
                                         "<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" " +
                                           "\"http://www.wapforum.org/DTD/wml_1_1.xml\"> "+
		"<wml><card id='card1' title='card1'><p>"+
		   "kate"+login+" "+passwd+"</p></card></wml>");
             }
         }