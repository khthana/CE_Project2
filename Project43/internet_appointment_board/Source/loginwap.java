import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class loginwap extends HttpServlet 
{                    String Def="http://161.246.5.233:8080/planny";
	Connection theConnection;
	public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{                    String id = req.getParameter("login");
                                           String pwd = req.getParameter("password");
                                           boolean check = true;
                                           boolean Cpasswd=true;
                                           boolean Cloginname=false;
                                          try{  Class.forName("oracle.jdbc.driver.OracleDriver");
                                           theConnection = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.233:1521:kate","scott","tiger");
                                           Statement  theStatement=theConnection.createStatement();
                                           ResultSet theResult=theStatement.executeQuery("select *  from  userdata ");
                                            while(theResult.next() && check  ){
                                                        if ( theResult.getString(1).substring(1).equals(id) ) 
                                                      {  if (theResult.getString(2).equals(pwd))  //all true
                                                       {   HttpSession session = req.getSession(true);
                              	     session.putValue("login.username",id);
                                                res.sendRedirect(Def+"/servlet/mainwap");
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
                        	                           out.println(e.getMessage());   }
                     res.setContentType("text/vnd.wap.wml");
                     PrintWriter out = res.getWriter();
                    out.println( "<?xml version=\"1.0\"?> "+ 
                                         "<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" " +
                                           "\"http://www.wapforum.org/DTD/wml_1_1.xml\"> "+
		"<wml><card id=\"login\" title=\"Welcome To Planny\"> ");
                    out.println("<p align=\"center\">");
                    out.println("<strong>www.planny.com</strong><br/>");
                    out.println("</p>");
                    out.println("<p align =\"center\">"); 
                    out.println("<a href=\"#register\"> New User </a><br/>");
                      if (!Cloginname) {out.println("Invalid Planny ID !!! "); }
                                               else   {  out.println(" Invalid Password !!! ");   }
                    out.println("</p> ");
                    out.println("<p>");
                    out.println("<do type =\"accept\" label=\"login\">");
                    out.println("<go href=\""+Def+"/servlet/loginwap\" method=\"post\">");
                    out.println("<postfield name=\"login\" value=\"$(login)\"/>");
                    out.println("<postfield name=\"password\" value=\"$(password)\"/>");
                    out.println("</go>");
                    out.println("</do>");
                    out.println("login : <input type=\"text\" name=\"login\" format=\"A*a\" emptyok=\"false\" size=\"10\" maxlength=\"10\"/>");
                    out.println(" password : <input type=\"password\" name=\"password\" emptyok=\"false\" size=\"10\" maxlength=\"10\"/>");
                    out.println(" </p>");
                    out.println(" </card>");
                    out.println("<card id=\"register\" title=\"Planny Register\" ontimer=\"#login\" >");
                   out.println("<timer name=\"check\" value=\"600\"/> "); 
                   out.println("<do type =\"accept\" label=\"Submit\"> ");
                   out.println("<go href=\"http://161.246.5.233:8080/planny/servlet/RegisterWap\" method=\"post\">");
                  out.println("<postfield name=\"firstname\" value =\"$(fname)\" /> ");
                  out.println(" <postfield name=\"lastname\" value =\"$(lname)\"/> ");
                  out.println("<postfield name=\"id\" value =\"$(id)\"/> ");
                  out.println("<postfield name=\"password\" value =\"$(password)\"/>"); 
                  out.println("<postfield name=\"repassword\" value=\"$(repasswd)\"/>");
                  out.println("<postfield name=\"sex\" value=\"$(sex)\"/> ");
                  out.println("</go> ");
                  out.println("</do>");
                 out.println("<p align = \"center\">");
                 out.println("<b> Please fill your info </b> <br/>");
                 out.println("</p>");
                 out.println("<p mode=\"nowrap\">");
                out.println(" First name : <input type =\"text\" name=\"fname\" emptyok = \"false\"/> <br/>");
                out.println("  Last name:  <input type =\"text\" name=\"lname\" emptyok =\"false\"/><br/> ");
                out.println("ID : <input type =\"text\" name=\"id\" emptyok = \"false\"/><br/>");
                out.println("Password : <input type =\"password\" name=\"password\" emptyok = \"false\"/><br/>");
                out.println("RePassword : <input type =\"password\" name=\"repasswd\" emptyok =\"false\"/><br/>");
                out.println("</p>");
                out.println("<p align= \"left\"> ");
                out.println(" <fieldset title=\"sex\">");   
                out.println("Sex:");
                out.println("<select name =\"sex\" multiple=\"false\"> ");
               out.println("<option value= \"M\" >Male</option>");
               out.println(" <option value=\"F\" >Female</option> ");
               out.println("</select>");
              out.println("</fieldset>"); 
              out.println("</p>");
              out.println("<do type =\"prev\">");
             out.println("<prev/>");
             out.println("</do>");
            out.println("</card>");
                    out.println("</wml> ");
                 }
         }