import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.net.*; 
public class RegisterWap extends HttpServlet 
{       Connection theConnection;
         String DefaultURL= "http://161.246.5.233:8080/planny";
         public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
               {     res.setContentType("text/vnd.wap.wml");
               	PrintWriter out = res.getWriter();
                     out.println("<?xml version=\"1.0\"?>");
                     out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">");
                     out.println("<!-- If WML 1.2 features are required, then use the following DOCTYPE instead: ");
                     out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.2//EN\" \"http://www.wapforum.org/DTD/wml12.dtd\">-->");                 
                     out.println("<wml><!--<head><meta http-equiv = \"Content-Language\" content=\"EN\"/></head>-->");
                     out.println("<card id=\"register\" title=\"Planny Register\" >");
                     out.println("<do type =\"accept\" label=\"Submit\">");
                     out.println("<go href=\"http://161.246.5.233:8080/planny/servlet/RegisterWap\" method=\"post\">");
                     out.println("<postfield name=\"firstname\" value =\"$(fname)\" />");
                     out.println("<postfield name=\"lastname\" value =\"$(lname)\"/>");
                     out.println("<postfield name=\"id\" value =\"$(id)\"/> ");
                     out.println("<postfield name=\"password\" value =\"$(password)\"/> ");
                     out.println("<postfield name=\"repassword\" value=\"$(repasswd)\"/>");
                     out.println("<postfield name=\"sex\" value=\"$(sex)\"/> ");
                     out.println("</go></do>");
                     out.println("<p align = \"center\"><b> Please fill your info </b> <br/></p>");
                     out.println("<p mode=\"nowrap\">");
                     out.println("First name : <input type =\"text\" name=\"fname\"  emptyok = \"false\"/> <br/>");
                     out.println("Last name:  <input type =\"text\" name=\"lname\" emptyok = \"false\"/><br/> ");
                     out.println("ID : <input type =\"text\" name=\"id\" emptyok = \"false\"/><br/>");
                     out.println("Password : <input type =\"password\" name=\"password\" emptyok = \"false\"/><br/>");
                     out.println("RePassword : <input type =\"password\" name=\"repasswd\" emptyok =\"false\"/><br/>");
                     out.println("</p><p align= \"left\">");
                     out.println("<fieldset title=\"sex\">Sex:");
                     out.println("<select name =\"sex\" multiple=\"false\">");
                     out.println("<option value= \"M\" >Male</option><option value= \"F\" >Female</option> ");
                     out.println("</select></fieldset></p>");
                     out.println("</card></wml>");
                     
                }//DoGet 
         
        public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
               {        String login = req.getParameter("id");
	   String passwd= req.getParameter("password");
	   String repasswd=req.getParameter("repassword");
	   String firstname= req.getParameter("firstname");
	   String lastname= req.getParameter("lastname");
	   String sex = req.getParameter("sex");
                        boolean  check = true;
	   boolean  Clogin =false;
	   boolean  Cpasswd=false;
	   boolean  Cfirstname=false;
	   boolean  Clastname=false;
                        boolean  CrepeatID   = true;
                        String Message1="Someone has already chosen that ID Name.";
                        String Message2="Invalid Planny ID";
	   String Message3="Invalid Password";
	   String Message5="Your new password entries did not match.";
                        if ( !(CheckinputWAP.Checkbeginwap(login)) ||  !(CheckinputWAP.CheckJavawap(login))  )
                           { Clogin = true;
                              check  = false;
                            }
                        if ( !(passwd.equals(repasswd))  ||  ! CheckinputWAP.CheckCharwap(passwd) || ( passwd.length() < 3 ))
                          { Cpasswd = true;
                             check  = false; }          
                        if (check)  // all right put data to database 
                                   {  try{
                                               //Loading Sun's JDBC ODBC Driver   
                                               Class.forName("oracle.jdbc.driver.OracleDriver");
                                               //Connect to emaildb Data source
                                               theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                               //Select all records from emaillists table.
                                               Statement  theStatement=theConnection.createStatement();
                                               ResultSet theResult=theStatement.executeQuery("select id  from  userdata");
                                               while(theResult.next() && check  ){
                                               	    if ( theResult.getString(1).substring(1).equals(login) )
                                                               {   Clogin = true;
                                                                   check  = false;
                                                                   CrepeatID = false;
                                                                }
                                                                                                                }
                                                  if(CrepeatID) {  
                                                      theStatement.executeQuery(
                                                        "INSERT INTO userdata "
                                                     + "(id,pwd,firstname,lastname,sex)"
                                                     + "VALUES ( ' "+ login +"' ," + "'" + passwd +"', '" + firstname + "'," + "'" + lastname + "'  ,"
                                                     + "'" +sex + "')");
     	                          HttpSession session = req.getSession(true);
                              	     session.putValue("login.username",login);     // put user ID 
                                   	     res.sendRedirect(DefaultURL+"/wap/main.wml");
     	                               	                                   }
                                   	    theStatement.close();//Close statement
                                               theConnection.close();                                         
                                                      }   catch (Exception e)  
                                                                       {   res.setContentType("text/vnd.wap.wml");
	                                                      PrintWriter out = res.getWriter();
                                                                           out.println(e.getMessage()); 
                                                                        }  
                                 } else {  
                     res.setContentType("text/vnd.wap.wml");
               	PrintWriter out = res.getWriter();
                     out.println("<?xml version=\"1.0\"?>");
                     out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1_1.xml\">");
                     out.println("<!-- If WML 1.2 features are required, then use the following DOCTYPE instead: ");
                     out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.2//EN\" \"http://www.wapforum.org/DTD/wml12.dtd\">-->");                 
                     out.println("<wml><!--<head><meta http-equiv = \"Content-Language\" content=\"EN\"/></head>-->");
                     out.println("<card id=\"register\" title=\"Planny Register\" >");
                     out.println("<do type =\"accept\" label=\"Submit\">");
                     out.println("<go href=\"http://161.246.5.233:8080/planny/servlet/RegisterWap\" method=\"post\">");
                     out.println("<postfield name=\"firstname\" value =\"$(fname)\" />");
                     out.println("<postfield name=\"lastname\" value =\"$(lname)\"/>");
                     out.println("<postfield name=\"id\" value =\"$(id)\"/> ");
                     out.println("<postfield name=\"password\" value =\"$(password)\"/> ");
                     out.println("<postfield name=\"repassword\" value=\"$(repasswd)\"/>");
                     out.println("<postfield name=\"sex\" value=\"$(sex)\"/> ");
                     out.println("</go></do>");
                     out.println("<p align = \"center\" ><b> Please fill your info </b> <br/></p>");
                     out.println("<p mode=\"nowrap\">");
                     out.println("**********************<br/>");
                     if (login.equals("") || !(CheckinputWAP.Checkbeginwap(login)) ||  !(CheckinputWAP.CheckJavawap(login)) )  out.println(Message2+"<br/>");
                     if ( !CrepeatID )  out.println(Message1+"<br/>");
                     if (passwd.equals("") )  out.println(Message3+"<br/>");
                     if ( !passwd.equals(repasswd))   out.println(Message5+"<br/>");
                     out.println("**********************<br/>");
                     out.println("First name : <input type =\"text\" name=\"fname\" emptyok = \"false\"/> <br/>");
                     out.println("Last name:  <input type =\"text\" name=\"lname\" emptyok = \"false\"/><br/> ");
                     out.println("ID : <input type =\"text\" name=\"id\" emptyok = \"false\"/><br/>");
                     out.println("Password : <input type =\"password\" name=\"password\" emptyok = \"false\"/><br/>");
                     out.println("RePassword : <input type =\"password\" name=\"repasswd\" emptyok =\"false\"/><br/>");
                     out.println("</p><p align= \"left\">");
                     out.println("<fieldset title=\"sex\">Sex:");
                     out.println("<select name =\"sex\" multiple=\"false\">");
                     out.println("<option value= \"M\" >Male</option><option value= \"F\" >Female</option> ");
                     out.println("</select></fieldset></p>");
                     out.println("</card></wml>");
                                        	    }//else
                                 	
         }
 }
 class CheckinputWAP
 {  public static boolean  Checkbeginwap(String input)
                  {  String c[ ] = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
                      String UpperString=input.toUpperCase();
  	for ( int i=0;i<c.length;i++ )
 	         {  if ( UpperString.startsWith(c[i]) ) {   return true;  } 
 	         }
                       return false;
                   }
     static boolean CheckJavawap(String input)
                  {  char CharA[]=input.toCharArray();
                  	for ( int i=0;i<CharA.length;i++)
                  	      {  if (  !(Character.isJavaIdentifierPart(CharA[i]) )  )
                  	          return false;
                  	       }  
                                return true;
                    }               
      static boolean CheckCharwap(String input)
                  {  char CharB[]=input.toCharArray();
                  	for ( int i=0;i<CharB.length;i++)
                  	      {  if (  !(Character.isLetterOrDigit(CharB[i]) )  )
                  	          return false;
                  	       }  
                                return true;
                   }               
 }                           