import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.net.*; 

public class login extends HttpServlet{
                 Connection theConnection;
                 
protected void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
                 String id = req.getParameter("loginname");
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
                                                res.sendRedirect("http://161.246.5.233:8080/planny/servlet/mCalendar");
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
                        } catch(Exception e) {    res.setContentType("text/html");
	                                                 PrintWriter out = res.getWriter();
                        	                           out.println(e.getMessage());   }
                        res.setContentType("text/html");
	   PrintWriter out = res.getWriter();
                        out.println("<html><head><title>Planny Organizer</title><meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"></head>");   
                        out.println("<body bgcolor=\"#FFFFFF\" leftmargin=\"0\" topmargin=\"0\" VLINK=blue LINK=blue><table width=\"100%\" border=\"0\" height=\"100%\">");   
                        out.println("<tr><td height=\"380\" align=\"center\" valign=\"middle\" width=\"21%\"><img src=\"/planny/picture/Welcome.jpg\" width=\"53\" height=\"406\"></td>");   
                        out.println("<td colspan=\"6\" height=\"380\" bgcolor=\"#49B0FC\" valign=\"top\"><table width=\"100%\" border=\"0\" height=\"414\">");   
                        out.println("<tr><td width=\"5%\" height=\"49\">&nbsp;</td><td width=\"92%\" height=\"49\">&nbsp;</td><td height=\"49\" width=\"3%\">&nbsp;</td></tr>");   
                        out.println("<tr><td width=\"5%\" height=\"103\">&nbsp;</td><td width=\"92%\" height=\"103\" align=\"center\"><img src=\"/planny/picture/planny.jpg\" width=\"541\" height=\"101\"></td><td height=\"103\" width=\"3%\">&nbsp;</td></tr>");   
                        out.println("<tr><td width=\"5%\" height=\"41\">&nbsp;</td><td width=\"92%\" height=\"41\">&nbsp;</td><td width=\"3%\" height=\"41\">&nbsp;</td></tr>");   
                        out.println("<tr><td width=\"5%\">&nbsp;</td><td rowspan=\"2\" valign=\"bottom\"><form method=\"post\" action=\"login\" >");
                        out.println("<table width=\"41%\" border=\"0\" height=\"88\" align=\"right\">");   
                        out.println("<tr valign=\"bottom\" bordercolor=\"#FFFFFF\" align=\"center\"><td colspan=\"3\" height=\"32\"><hr color=\"#FFFF99\" noshade>");   
                        out.println("<font face=\"arial\" size=\"4\" color=\"#FFFFFF\">");
                           
                           if (!Cloginname) {out.println("Invalid Planny ID !!!</font> "); }
                                               else   {  out.println(" Invalid Password !!! </font> ");   }
                 
                        out.println("<hr color=\"#FFFF99\" noshade></td></tr>");   
                        out.println("<tr bgcolor=\"#CCFFFF\"><td colspan=\"3\" height=\"5\" valign=\"bottom\"></td></tr>");   
                        out.println("<tr valign=\"top\" bordercolor=\"#FFFFFF\"><td colspan=\"3\" height=\"8\"></td></tr>");   
                        out.println("<tr valign=\"bottom\" align=\"center\"><td height=\"25\" colspan=\"3\"><a href=\"registration.html\"><img src=\"/planny/picture/NewUser.jpg\" width=\"189\" height=\"23\" border=\"0\"></a></td></tr>");   
                        out.println("<tr valign=\"top\"><td colspan=\"3\" height=\"5\" bgcolor=\"#CCFFFF\"></td></tr>");   
                        out.println("<tr valign=\"top\"><td colspan=\"3\" height=\"8\"></td></tr>");   
                        out.println("<tr align=\"center\"><td colspan=\"3\" height=\"25\" valign=\"bottom\"><img src=\"/planny/picture/MemberSignIn.jpg\" width=\"154\" height=\"23\"></td></tr>");   
                        out.println("<tr><td colspan=\"3\" height=\"3\" valign=\"bottom\"></td></tr>");   
                        out.println("<tr><td width=\"37%\" height=\"25\" valign=\"bottom\"><img src=\"/planny/picture/PlannyID.jpg\" width=\"95\" height=\"19\"></td><td width=\"37%\" height=\"25\" valign=\"bottom\"> ");   
                        out.println("<input type=\"text\" name=\"loginname\" maxlength=\"14\" size=\"12\"></td><td width=\"37%\" height=\"25\" valign=\"bottom\">&nbsp;</td></tr>");   
                        out.println("<tr><td width=\"37%\" height=\"25\" valign=\"bottom\"><img src=\"/planny/picture/Password2.jpg\" width=\"95\" height=\"16\">&nbsp;</td>");
                        out.println("<td width=\"37%\" height=\"25\" valign=\"bottom\"><input type=\"password\" name=\"password\" size=\"12\" maxlength=\"14\"></td>");   
                        out.println("<td width=\"37%\" height=\"25\" valign=\"bottom\"><input type=\"submit\" name=\"Submit2\" value=\" Login \"></td></tr>");
                        out.println("<tr><td colspan=\"3\" height=\"3\" valign=\"bottom\"></td></tr>");   
                        out.println("<tr><td colspan=\"3\" height=\"5\" valign=\"bottom\" bgcolor=\"#CCFFFF\"></td></tr></table></td>");
                        out.println("<td width=\"3%\">&nbsp;</td></tr><tr><td width=\"5%\">&nbsp;</td><td width=\"3%\">&nbsp;</td></tr>");   
                        out.println("</table></form></td></tr></table>");
                        out.println("</BODY></HTML>");   
                        
}}                               