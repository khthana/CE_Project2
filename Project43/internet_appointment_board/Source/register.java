import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class register extends HttpServlet
{   String DefaultURL="http://161.246.5.233:8080/planny";
     protected void doGet(HttpServletRequest req , HttpServletResponse res) throws ServletException, IOException
                      {     res.sendRedirect(DefaultURL+"/registration.html");    }
     protected  void  doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{     boolean  check = true;
	       boolean  Clogin =false;
	       boolean  Cpasswd=false;
	       boolean  Cfirstname=false;
	       boolean  Clastname=false;
	       boolean  Cbirthday=false;
	       boolean  Cemail=false;
	       boolean  Cocc = false;
	       boolean  Czipcode = false;
	       boolean  Cpnumber = false;
	       boolean  Cmobilenumber = false;
	       boolean  Cicq = false;
	       boolean  CrepeatID   = true;
	       boolean  Cpwmobile = false;
	       boolean  Cpwpager   = false;
	       
	       String Message1="We either had trouble understanding those fields, or need additional information.";
	       String Message2="Someone has already chosen that ID Name. Please choose another ID name, be imaginative, try adding a number to the end of the name that you might remember. ";
                            String Message3="<font color=red><b>Planny ID</b></font>: Begin with a letter and use only letters (a-z,A-Z), numbers (0-9), the underscore (_), and no spaces.";
	       String Message4="<font color=red><b>Password</b></font>: Your Password may contain numbers (0-9) and upper and lowercase letters (A-Z, a-z), but no spaces. ";
	       String Message5="Please specify your ";
	       String Message6="You didn't specify an understandable";
	       String Message7="Your <font color=red><b>confirm password </b></font>entries did not match.";
	       String Message8="Your <font color=red><b>pager confirm password </b></font>entries did not match.";
	       String Message9="Your <font color=red><b>Mobile confirm password </b></font>entries did not match.";
	       Connection theConnection;
	       String loginname      = req.getParameter("loginname");
	       String passwd           = req.getParameter("passwd");
	       String repasswd       = req.getParameter("repasswd");
                            String firstname         = req.getParameter("firstname");
                            String lastname    = req.getParameter("lastname");
	       String gender        = req.getParameter("gender");
	       String bmonth       = req.getParameter("bmonth");
	       String bday            = req.getParameter("bday");
                            String  byear          = req.getParameter("byear");
                            String country    = req.getParameter("country");
	       String zipcode        = req.getParameter("zipcode");
	       String occupation       = req.getParameter("occupation");
	       String email            = req.getParameter("email");
	       String pager      = req.getParameter("pager");
	       String pnumber      = req.getParameter("pagernumber");
                            String  pw162          = req.getParameter("pw162");
                            String  repw162          = req.getParameter("repw162");
                            String  mobilenumber    = req.getParameter("mobilenumber");
	       String  mobilepw        = req.getParameter("mobilepw");
	       String  remobilepw        = req.getParameter("remobilepw");
	       String icqnumber       = req.getParameter("icqnumber");
	       
	                                     
                               if (loginname.equals("") ||  !(Checkinput.Checkbegin(loginname)) ||  !(Checkinput.CheckJava(loginname))  )
                                    { Clogin = true;
                                       check  = false;
                                     }
                              if ( passwd.equals("") || repasswd.equals("") ||  !(passwd.equals(repasswd)) 
                                  ||  ! Checkinput.CheckChar(passwd) || ( passwd.length() < 3 ))
                                    { Cpasswd = true;
                                        check  = false; }          
                              if ( firstname.equals("") )
                                    { Cfirstname = true;
                                       check  = false; }          
                              if ( lastname.equals("") )
                                    { Clastname = true;
                                       check  = false; }          
                              if ( bmonth.equals("0") || bday.equals("0") || byear.equals("0") )
                                    { Cbirthday = true;
                                       check  = false; }          
                              if ( email.equals("") )
                                    { Cemail = true;
                                       check  = false; }         
                               if ( occupation.equals("0") )
                                    { Cocc = true;
                                       check  = false; }                        
                               if ( !Checkinput.CheckDigit(zipcode))
                                    { Czipcode = true;
                                       check  = false; 
                                    }
                               if ( !Checkinput.CheckDigit(pnumber))
                                    { Cpnumber = true;
                                       check  = false;
                                     }                                      
                              if ( !Checkinput.CheckDigit(mobilenumber))
                                    { Cmobilenumber = true;
                                       check  = false;
                                     }                                                                             
                              if ( !Checkinput.CheckDigit(icqnumber))
                                    { Cicq = true;
                                       check  = false;
                                     }                              
                              if (!(pw162.equals(repw162))) 
                                    { Cpwpager = true;
                                       check  = false;
                                     }       
                              if (!(mobilepw.equals(remobilepw)) )
                                    { Cpwmobile = true;
                                       check  = false;
                                     }                 
                              if (check)  // all right put data to database 
                                   {      
                                   	try{
                                               //Loading Sun's JDBC ODBC Driver   
                                               Class.forName("oracle.jdbc.driver.OracleDriver");
                                               //Connect to emaildb Data source
                                               theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                               //Select all records from emaillists table.
                                               Statement  theStatement=theConnection.createStatement();
                                               ResultSet theResult=theStatement.executeQuery("select id  from  userdata");
                                               while(theResult.next() && check  ){
                                                             if ( theResult.getString(1).substring(1).equals(loginname) )
                                                               {  Clogin = true;
                                                                   check  = false;
                                                                   CrepeatID = false;
                                                                }
                                                                                                                }
                                                  if(CrepeatID) {  
                                                      theStatement.executeQuery(
                                                        "INSERT INTO userdata "
                                                     + "(id,pwd,firstname,lastname,sex,bmonth,bday,byear,email,occupation,country,zipcode,icqnumber,pager,pagernumber,pagerpwd,mobile,mobilepwd)"
                                                     + "VALUES ( ' "+ loginname +"' ," + "'" + passwd +"', '" + firstname + "'," + "'" + lastname + "'  ,"
                                                     + "'" +gender + "' ," + "'" +bmonth + "' , " + "'" + bday + "' ," + "'" + byear + "' ," + "'" + email + " ' ," + "'" + occupation + " ' ," +"'"+country+ "' ,"
                                                     + "'" + zipcode + "' ,"+"'"+icqnumber+"' ,"+ "'"+pager+"' , " +"'"+ pnumber+ "' ,"+ " '" +pw162 + " '," + "'" + mobilenumber + "' ," +"'" + mobilepw + " ')"); 
     	                          HttpSession session = req.getSession(true);
                              	     session.putValue("login.username",loginname);     // put user ID 
                                   	     res.sendRedirect(DefaultURL+"/servlet/Success");
     	                               	                                   }
                                   	    theStatement.close();//Close statement
                                               theConnection.close();                                         
                                                      }   catch (Exception e)  
                                               {  res.setContentType("text/html");
	                             PrintWriter out = res.getWriter();
                                                  out.println(e.getMessage()); 
                                               }  
                                    }  
                             if ( !check )  {       
                             res.setContentType("text/html");
	        PrintWriter out = res.getWriter();
                             out.println("<html>");
	        out.println("<head>");
	        out.println("<title>Registration</title>");
	        out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
	        out.println("</head>");
	        out.println("<body bgcolor=\"#FFFFFF\">");
	        out.println("<table width=\"75%\"  align=\"center\"  >");
	        out.println("<form method=\"post\" action=\""+DefaultURL+"/servlet/register\" >");
	        out.println("<tr><td colspan=\"2\" height=\"50\" align=\"center\"><img src=\"../picture/Logo.jpg\" width=\"390\" height=\"77\" align=\"bottom\"></td></tr>");
	        out.println(" <tr ><td colspan=\"2\" height=\"35\" valign=\"bottom\" bgcolor=\"#FFFFFF\"></td></tr>");
	        out.println("<tr valign=\"bottom\"><td colspan=\"2\" height=\"32\" bgcolor=\"#F72626\">&nbsp;&nbsp;&nbsp;<img src=\"../picture/error.jpg\" width=\"362\" height=\"18\"></td></tr>");
	        out.println("<tr><td colspan=\"2\" height=\"20\" valign=\"bottom\">");
	        out.println("<tr><td colspan=\"2\" height=\"28\" valign=\"bottom\"><hr noshade size=\"4\"  Color=\"#FFCCCC\"></td></tr>");
                             if (!check)   {
                              out.println("<tr valign=\"bottom\"><td height=\"20\" colspan=\"2\"><p><font face=\"Arial\" size=\"-2\">");
                              out.println("<b>"+Message1+"</b></p></font><ul>");
                                     if  (loginname.equals("") )  
                                         { out.println("<li><font size=\"-2\" face=\"Arial\">"+Message5+"<font color=red><b> ID name</b></font></font>") ;  }       
                                     if ( !CrepeatID) 
                                         { out.println("<li><font size=\"-2\" face=\"Arial\">"+Message2+"</font>") ;  }                                                                                   
                                     if  ( !(Checkinput.Checkbegin(loginname)) ||  !(Checkinput.CheckJava(loginname))  )
                                         {out.println("<li><font size=\"-2\" face=\"Arial\">"+Message3+"</font>") ; }    
                                     if  (passwd.equals(""))     
                                         { out.println("<li><font size=\"-2\" face=\"Arial\">"+Message4+"</font>") ;  } 
                                     if  ( !(passwd.equals(repasswd)) )    
                                        {out.println("<li><font size=\"-2\" face=\"Arial\">"+Message7+"</font>") ; }    
                                     if  ( firstname.equals("") )   
                                         {out.println("<li><font size=\"-2\" face=\"Arial\">"+Message5+"<font color=red><b> First name</b></font></font>") ;  }  
                                     if  ( lastname.equals("") )   
                                         {out.println("<li><font size=\"-2\" face=\"Arial\">"+Message5+"<font color=red><b> Last name</b></font></font>") ;  }     
                                     if ( bmonth.equals("0") || bday.equals("0") || byear.equals("0") )               
                                          {out.println("<li><font size=\"-2\" face=\"Arial\">"+Message5+"<font color=red><b> Birthday</b></font></font>") ;  }     
                                     if ( email.equals("") )         
                                          {out.println("<br><li><font size=\"-2\" face=\"Arial\">"+Message5+"<font color=red><b> Email</b></font></font>") ;  }     
                                     if ( occupation.equals("0") ) 
                                          {out.println("<li><font size=\"-2\" face=\"Arial\">"+Message5+"<font color=red><b> Occupation</b></font></font>") ;  }     
                                     if ( !Checkinput.CheckDigit(zipcode))                                
                                          {out.println("<li><font size=\"-2\" face=\"Arial\">"+Message6+"<font color=red><b> Zipcode</b></font></font>") ;  }     
                                     if ( !Checkinput.CheckDigit(pnumber))                               
                                          {out.println("<li><font size=\"-2\" face=\"Arial\">"+Message6+"<font color=red><b> Pager Number</b></font></font>") ;  }     
                                     if ( !Checkinput.CheckDigit(mobilenumber))                               
                                          {out.println("<li><font size=\"-2\" face=\"Arial\">"+Message6+"<font color=red><b> Mobile Number</b></font></font>") ;  }                               
                                     if ( !Checkinput.CheckDigit(icqnumber))                               
                                          {out.println("<li><font size=\"-2\" face=\"Arial\">"+Message6+"<font color=red><b> ICQ Number</b></font></font>") ;  }                               
                                     if  (!(pw162.equals(repw162)) )                             
                                          {out.println("<li><font size=\"-2\" face=\"Arial\">"+Message8+"</font>") ;  }                               
                                     if  (!(mobilepw.equals(remobilepw))  )                             
                                          {out.println("<li><font size=\"-2\" face=\"Arial\">"+Message9+"</font>") ;  }                               
                            out.println("</ul><hr noshade size=\"4\"  Color=\"#FFCCCC\"></td></tr>");
                                                             } 
                            out.println("<tr><td width=\"43%\" height=\"37\" align=\"right\" valign=\"bottom\">");
                                    if ( Clogin )
                                       {    out.println("<font face=\"Arial\" color=\"#FF0033\">Planny ID</font></td>");       
                                            out.println("<td width=\"57%\" height=\"37\" valign=\"bottom\"><input type=\"text\" name=\"loginname\" size=\"15\" maxlength=\"20\"></td></tr>");
                                        } else  
                                       {   out.println("<font face=\"Arial\" color=\"#49B0FC\">Planny ID</font></td>");          
                                            out.println("<td width=\"57%\" height=\"37\" valign=\"bottom\"><input type=\"text\" name=\"loginname\"  value=\""+ loginname+"\"></td></tr>");
                                        }
                                  if ( Cpasswd )
                                       {    out.println("<tr><td width=\"43%\" height=\"37\" align=\"right\" valign=\"bottom\">")  ;
                                            out.println("<font face=\"Arial\" color=\"#FF0033\">Password</font></td>");
                                            out.println("<td width=\"57%\" height=\"37\" valign=\"bottom\"><input type=\"password\" name=\"passwd\" size=\"15\" maxlength=\"20\"></td></tr>");
                                            out.println("<tr><td width=\"43%\" height=\"37\" align=\"right\" valign=\"bottom\">")  ;
                                            out.println("<font face=\"Arial, Helvetica, sans-serif\" color=\"#FF0033\">Re-enter Password</font></font></td>"); 
              		 out.println(" <td width=\"57%\" height=\"37\" valign=\"bottom\"><input type=\"password\" name=\"repasswd\" size=\"15\" maxlength=\"20\"></td></tr>"); 		                                               
                                        }       else  {
                                            out.println("<tr><td width=\"43%\" height=\"37\" align=\"right\" valign=\"bottom\">")  ;
                                            out.println("<font face=\"Arial, Helvetica, sans-serif\" color=\"#49B0FC\">Password</font></td>");
                                            out.println("<td width=\"57%\" height=\"37\" valign=\"bottom\"><input type=\"password\" name=\"passwd\" size=\"15\" maxlength=\"20\" value=\""+passwd+"\"></td></tr>");
                                            out.println("<tr><td width=\"43%\" height=\"37\" align=\"right\" valign=\"bottom\">")  ;
                                            out.println("<font face=\"Arial, Helvetica, sans-serif\" color=\"#49B0FC\">Re-enter Password</font></font></td>"); 
              		 out.println(" <td width=\"57%\" height=\"37\" valign=\"bottom\"><input type=\"password\" name=\"repasswd\" size=\"15\" maxlength=\"20\" value=\""+repasswd+"\"></td></tr>"); 
                                                           }
                                 out.println("<tr><td colspan=\"2\" height=\"28\" valign=\"bottom\"><hr noshade size=\"4\" color=\"#FFCCCC\"></td></tr>");
                                 out.println("<tr><td width=\"43%\" height=\"37\" align=\"right\" valign=\"bottom\">");
                                 if ( Cfirstname )
                                       {   out.println("<font face=\"Arial, Helvetica, sans-serif\" color=\"#FF0033\">First Name</font></td>");       
                                            out.println("<td width=\"57%\" height=\"37\" valign=\"bottom\"><input type=\"text\" name=\"firstname\" ></td></tr>");
                                        } else  
                                       {   out.println("<font face=\"Arial, Helvetica, sans-serif\" color=\"#49B0FC\">First Name</font></td>");          
                                            out.println("<td width=\"57%\" height=\"37\" valign=\"bottom\"><input type=\"text\" name=\"firstname\"  value=\""+ firstname+"\"></td></tr>");
                                        }                                                      
                                 out.println("<tr><td width=\"43%\" height=\"37\" align=\"right\" valign=\"bottom\">");       
                                 if ( Clastname )
                                       {   out.println("<font face=\"Arial, Helvetica, sans-serif\" color=\"#FF0033\">Last Name</font></td>");       
                                            out.println("<td width=\"57%\" height=\"37\" valign=\"bottom\"><input type=\"text\" name=\"lastname\" ></td></tr>");
                                        } else  
                                       {   out.println("<font face=\"Arial, Helvetica, sans-serif\" color=\"#49B0FC\">Last Name</font></td>");          
                                            out.println("<td width=\"57%\" height=\"37\" valign=\"bottom\"><input type=\"text\" name=\"lastname\"  value=\""+lastname+"\"></td></tr>");
                                        }         
                                out.println("<tr><td width=\"43%\" height=\"37\" align=\"right\" valign=\"bottom\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#49B0FC\">Gendar</font></td>");
                                out.println("<td width=\"57%\" height=\"37\" valign=\"bottom\"><input Checked type=\"radio\" name=\"gender\" value=\"female\">");
                                out.println("<font face=\"Arial, Helvetica, sans-serif\"><b><font color=\"#666666\">Female</font></b></font><font face=\"Arial, Helvetica, sans-serif\" color=\"#666666\"> &nbsp;&nbsp;</font>");
                                out.println("<font color=\"#666666\"><input type=\"radio\" name=\"gender\" value=\"male\"><font face=\"Arial, Helvetica, sans-serif\"><b>Male</b> </font></font></td></tr> ");
                                 if  ( Cbirthday )
      	                  { out.println("<tr><td width=\"43%\" height=\"37\" align=\"right\" valign=\"bottom\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#FF0033\">Birthday</font></td>");
      	                     out.println("<td width=\"57%\" height=\"37\" valign=\"bottom\"><select name=\"bmonth\">");
                                          out.println("<option value=\"0\" selected>Month </option>");
                                          out.println("<option value=\"January \">January </option>");
                                          out.println("<option value=\"February\">February </option>");
                                          out.println("<option value=\"March\">March </option>");
                                          out.println("<option value=\"April\">April </option>");
                                          out.println("<option value=\"May\">May </option>");
                                          out.println("<option value=\"June\">June </option>");
                                          out.println("<option value=\"July\">July </option>");
                                          out.println("<option value=\"August\">August </option>");
                                          out.println("<option value=\"September\">September </option>");
                                          out.println("<option value=\"October\">October </option>");
                                          out.println("<option value=\"November\">November </option>");
                                          out.println("<option value=\"December\">December</option></select>");
                                          out.println("<select name=\"bday\"><option value=\"0\" selected>Day</option>");
                                          out.println("<option value=\"01\">01</option><option value=\"02\">02</option><option value=\"03\">03</option>");
                                          out.println("<option value=\"04\">04</option><option value=\"05\">05</option><option value=\"06\">06</option>");
                                          out.println("<option value=\"07\">07</option><option value=\"08\">08</option><option value=\"09\">09</option>");
                                          out.println("<option value=\"10\">10</option><option value=\"11\">11</option><option value=\"12\">12</option>");
                                          out.println("<option value=\"13\">13</option><option value=\"14\">14</option><option value=\"15\">15</option>");
                                          out.println("<option value=\"16\">16</option><option value=\"17\">17</option><option value=\"18\">18</option>");
                                          out.println("<option value=\"19\">19</option><option value=\"20\">20</option><option value=\"21\">21</option>");
                                          out.println("<option value=\"22\">22</option><option value=\"23\">23</option><option value=\"24\">24</option>");
                                          out.println("<option value=\"25\">25</option><option value=\"26\">26</option><option value=\"27\">27</option>");
                                          out.println("<option value=\"28\">28</option><option value=\"29\">29</option><option value=\"30\">30</option>");
                                          out.println("<option value=\"31\">31</option></select> ,");
                                          out.println("<select name=byear><option selected value=0>Year</option>");
                                          out.println("<option  value=1987>1987</option><option value=1986>1986</option>");
                out.println("<option  value=1985>1985</option><option value=1984>1984</option><option  value=1983>1983</option>");
                out.println("<option  value=1982>1982</option><option  value=1981>1981</option><option value=1980>1980</option>");
                out.println("<option  value=1979>1979</option> <option value=1978>1978</option><option value=1977>1977</option>");
                out.println("<option value=1976>1976</option> <option value=1975>1975</option><option value=1974>1974</option>");
                out.println("<option  value=1973>1973</option><option value=1972>1972</option><option  value=1971>1971</option>");
                out.println("<option value=1970>1970</option><option  value=1969>1969</option><option value=1968>1968</option>");
                out.println("<option  value=1967>1967</option><option value=1966>1966</option><option  value=1965>1965</option>");
                out.println("<option value=1964>1964</option> <option  value=1963>1963</option><option value=1962>1962</option>");
                out.println("<option value=1961>1961</option><option value=1960>1960</option><option value=1959>1959</option>");
                out.println("<option value=1958>1958</option><option value=1957>1957</option><option value=1956>1956</option>");
                out.println("<option value=1955>1955</option><option value=1954>1954</option><option  value=1953>1953</option>");
                out.println("<option value=1952>1952</option><option value=1951>1951</option><option value=1950>1950</option>");
                out.println("<option  value=1949>1949</option><option value=1948>1948</option><option  value=1947>1947</option>");
                out.println("<option value=1946>1946</option><option  value=1945>1945</option><option value=1944>1944</option>");
                out.println("<option value=1943>1943</option><option value=1942>1942</option><option value=1941>1941</option>");
                out.println("<option value=1940>1940</option><option value=1939>1939</option><option value=1938>1938</option>");
                out.println("<option value=1937>1937</option><option value=1936>1936</option><option  value=1935>1935</option>");
                out.println("<option value=1934>1934</option><option value=1933>1933</option><option value=1932>1932</option>");
                out.println("<option value=1931>1931</option><option value=1930>1930</option><option  value=1929>1929</option>");
                out.println("<option value=1928>1928</option><option  value=1927>1927</option><option value=1926>1926</option>");
                out.println("<option value=1925>1925</option><option value=1924>1924</option><option  value=1923>1923</option>");
                out.println("<option value=1922>1922</option><option value=1921>1921</option><option value=1920>1920</option>");
                out.println("<option value=1919>1919</option><option value=1918>1918</option><option value=1917>1917</option>");
                out.println("<option value=1916>1916</option><option  value=1915>1915</option><option value=1914>1914</option>");
                out.println("<option  value=1913>1913</option><option value=1912>1912</option><option value=1911>1911</option>");
                out.println("<option value=1910>1910</option><option  value=1909>1909</option><option value=1908>1908</option>");
                out.println("<option value=1907>1907</option><option value=1906>1906</option><option  value=1905>1905</option>");
                out.println("<option value=1904>1904</option><option  value=1903>1903</option><option value=1902>1902</option>");
                out.println("<option  value=1901>1901</option><option  value=1900>1900</option></select></td></tr>");
      	                }	   else
      	                        {  out.println("<tr><td width=\"43%\" height=\"37\" align=\"right\" valign=\"bottom\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#49B0FC\">Birthday</font></td>");
      	                            out.println("<td width=\"57%\" height=\"37\" valign=\"bottom\"><input type=\"text\" name=\"bmonth\" size=\"6\" maxlength=\"8\" value=\""+bmonth+"\">");
                                                 out.println("<input type=\"text\" name=\"bday\" size=\"1\" maxlength=\"2\" value=\""+bday+"\">,");
                                                 out.println("<input type=\"text\" name=\"byear\" size=\"4\" maxlength=\"4\" value=\""+byear+"\"></td></tr>");
        	                        }                                              
                              out.println("<tr><td width=\"43%\" height=\"37\" align=\"right\" valign=\"bottom\">");                        
                              if ( Cemail )
                                       {   out.println("<font face=\"Arial, Helvetica, sans-serif\" color=\"#FF0033\">E-mail Address</font></td>");       
                                            out.println("<td width=\"57%\" height=\"37\" valign=\"bottom\"><input type=\"text\" name=\"email\" ></td></tr>");
                                        } else  
                                       {   out.println("<font face=\"Arial, Helvetica, sans-serif\" color=\"#49B0FC\">E-mail Address</font></td>");          
                                            out.println("<td width=\"57%\" height=\"37\" valign=\"bottom\"><input type=\"text\" name=\"email\"  value=\""+email+"\"></td></tr>");
                                        }                                                                                       
                                    out.println("<tr><td width=\"43%\" height=\"37\" valign=\"bottom\" align=\"right\">");                          
                             if ( Cocc )
                                       {  out.println("<font face=\"Arial, Helvetica, sans-serif\" color=\"#FF0033\">Occupation</font></td><td width=\"57%\" height=\"37\" valign=\"bottom\">"); 
                                           out.println("<select name=occupation><option value=\"0\">(Select Occupation)</option><option value=\"Accounting/Finance\">Accounting/Finance </option>");
                                           out.println("<option value=\"Computer related (IS, MIS, DP) \">Computer related (IS, MIS, DP) </option><option value=\"Computer related (WWW) \">Computer related (WWW)</option>");
                                           out.println("<option value=\"Customer service/support \">Customer service/support </option><option value=\"Education/Research\">Education/Research</option>");
                                           out.println("<option value=\"Engineering /Construction\">Engineering /Construction</option><option value=\"Entertainment/Media/Publishing\">Entertainment/Media/Publishing</option>");
                                           out.println("<option value=\"Executive/Senior management \">Executive/Senior management </option><option value=\"Government/Military \">Government/Military </option>");
                                           out.println("<option value=\"Manufacturing/Production\">Manufacturing/Production</option><option value=\"Medical/Health services\">Medical/Health services </option>");
                                           out.println("<option value=\"Retired \">Retired </option><option value=\"Self-employed/owner \">Self-employed/owner </option><option value=\"Student \">Student </option>");
                                           out.println("<option value=\"Others\">Others</option></select></td></tr>");                         
                                      } else  {
                                           out.println("<font ><font face=\"Arial, Helvetica, sans-serif\" color=\"#49B0FC\">Occupation</font></td>");
                                           out.println("<td width=\"57%\" height=\"37\" valign=\"bottom\"><input type=\"text\" name=\"occupation\" maxlength=\"28\" size=\"29\" value=\""+occupation+"\"></td></tr>");          
                                        }
                            
                               out.println("<tr><td colspan=\"2\" height=\"28\" valign=\"bottom\"><hr noshade  size=\"4\" Color=\"#FFCCCC\"></td></tr>");
                               out.println("<tr><td width=\"43%\" height=\"37\" align=\"right\" valign=\"bottom\">");
                 
                               if  ( Czipcode )
                                   {   out.println("<font face=\"Arial, Helvetica, sans-serif\" color=\"#FF0033\">Zip Code</font></td>");
                                       out.println("<td width=\"57%\" height=\"37\" valign=\"bottom\"><input type=\"text\" name=\"zipcode\" size=\"10\" maxlength=\"10\" ><font color=\"#FF9900\">( optional )</font> </td> </tr>");
                                    }
                                    else { 
                                         out.println("<font face=\"Arial, Helvetica, sans-serif\" color=\"#49B0FC\">Zip Code</font></td>");
                                         out.println("<td width=\"57%\" height=\"37\" valign=\"bottom\"><input type=\"text\" name=\"zipcode\" size=\"10\" maxlength=\"10\" value=\""+zipcode+"\"><font size=\"2\" color=\"#FF9900\">( optional )</font> </td> </tr>");
                                              }
                               out.println("<tr><td width=\"43%\" height=\"37\" valign=\"bottom\" align=\"right\">");
                                   if ( Cpnumber)  
                                       {
                               out.println("<font face=\"Arial, Helvetica, sans-serif\" color=\"#FF0033\">Pager Number </font></td>");
                               out.println("<td width=\"57%\" height=\"38\" valign=\"bottom\"><select name=\"pager\" size=1>");
                               out.println("<option value=0>Pager</option><option value=142>142 </option><option value=152>152 </option><option value=162>162</option>");
                               out.println("<option value=1144>1144 </option><option value=1188>1188 </option></select>");
                               out.println("<b><font face=\"Arial, Helvetica, sans-serif\" color=\"#666666\">- </font></b>&nbsp;<input type=\"text\" name=\"pagernumber\" maxlength=\"8\" size=\"8\">");
                                        }else {
                               out.println("<font face=\"Arial, Helvetica, sans-serif\" color=\"#49B0FC\">Pager Number </font></td>");
                               out.println("<td width=\"57%\" height=\"38\" valign=\"bottom\"><select name=\"pager\" size=1>");
                               out.println("<option value=0>Pager</option><option value=142>142 </option><option value=152>152 </option><option value=162>162</option>");
                               out.println("<option value=1144>1144 </option><option value=1188>1188 </option></select>");
                               out.println("<b><font face=\"Arial, Helvetica, sans-serif\" color=\"#666666\">- </font></b>&nbsp;<input type=\"text\" name=\"pagernumber\" maxlength=\"8\" size=\"8\"  value=\""+pnumber+"\">");                	
                                                   } 
                               out.println("<font size=\"2\" color=\"#FF9900\">( optional )</font><font color=\"#996600\"></font></td></tr>");
                               out.println("<tr><td width=\"43%\" height=\"38\" valign=\"bottom\" align=\"right\">");
                               out.println("<font face=\"Arial, Helvetica, sans-serif\" color=\"#49B0FC\">Pager 162 - Password</font></td>");
                               out.println("<td width=\"57%\" height=\"38\" valign=\"bottom\">");
                               
                               if (Cpwpager) {
                               out.println("<input type=\"password\" name=\"pw162\" size=\"2\" maxlength=\"4\" >");
                               out.println("<b><font size=\"2\" color=\"#49B0FC\">Confirm</font></b> <font color=\"#FF9900\">"); 
                               out.println("<input type=\"password\" name=\"repw162\" size=\"2\" maxlength=\"4\"><font size=\"2\">( optional )</font></font></td></tr>");
                                }else {
                               out.println("<input type=\"password\" name=\"pw162\" size=\"2\" maxlength=\"4\" value="+pw162+">");
                               out.println("<b><font size=\"2\" color=\"#49B0FC\">Confirm</font></b> <font color=\"#FF9900\">"); 
                               out.println("<input type=\"password\" name=\"repw162\" size=\"2\" maxlength=\"4\" value="+repw162+"><font size=\"2\">( optional )</font></font></td></tr>");
                                     }                              
                               out.println("<tr><td width=\"43%\" height=\"38\" valign=\"bottom\" align=\"right\">");
                                     if ( Cmobilenumber )
                                     {
                               out.println("<font face=\"Arial, Helvetica, sans-serif\" color=\"#FF0033\">Mobile Phone Number</font></td>");
                               out.println("<td width=\"57%\" height=\"38\" valign=\"bottom\"> <b><font face=\"Arial, Helvetica, sans-serif\" color=\"#666666\">&nbsp;01 -</font></b> ");
                               out.println("<input type=\"text\" name=\"mobilenumber\" size=\"7\" maxlength=\"7\">");
                                     }  else  {
                                out.println("<font face=\"Arial, Helvetica, sans-serif\" color=\"#49B0FC\">Mobile Phone Number</font></td>");
                               out.println("<td width=\"57%\" height=\"38\" valign=\"bottom\"> <b><font face=\"Arial, Helvetica, sans-serif\" color=\"#666666\">&nbsp;01 -</font></b> ");
                               out.println("<input type=\"text\" name=\"mobilenumber\" size=\"7\" maxlength=\"7\" value=\""+mobilenumber+"\">");
                                    }                   
                               out.println("<font color=\"#FF9900\" size=\"2\">( optional ) </font></td></tr>");
                               out.println("<tr><td width=\"43%\" height=\"38\" valign=\"bottom\" align=\"right\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#49B0FC\"><font >Mobile Phone Password</font></td>");
                               out.println("<td width=\"57%\" height=\"38\" valign=\"bottom\">");
                                     if (Cpwmobile) {
                               out.println("<input type=\"password\" name=\"mobilepw\" size=\"2\" maxlength=\"6\" >");
                               out.println("<b><font size=\"2\" color=\"#49B0FC\">Confirm</font></b> <font color=\"#FF9900\">"); 
                               out.println("<input type=\"password\" name=\"remobilepw\" size=\"2\" maxlength=\"6\"><font size=\"2\">( optional )</font></font></td></tr>");
                                     }else {
                               out.println("<input type=\"password\" name=\"mobilepw\" size=\"2\" maxlength=\"6\" value=\""+mobilepw+"\">");
                               out.println("<b><font size=\"2\" color=\"#49B0FC\">Confirm</font></b> <font color=\"#FF9900\">"); 
                               out.println("<input type=\"password\" name=\"remobilepw\" size=\"2\" maxlength=\"6\" value=\""+remobilepw+"\"><font size=\"2\">( optional )</font></font></td></tr>");	
                                     }  if ( Cicq  )      
                                      {
                               out.println("<tr><td width=\"43%\" height=\"38\" valign=\"bottom\" align=\"right\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#FF0033\">ICQ  Number </font></td>");
                               out.println("<td width=\"57%\" height=\"38\" valign=\"bottom\"><input type=\"text\" name=\"icqnumber\" size=\"10\" maxlength=\"10\">");
                                       }else{
                               out.println("<tr><td width=\"43%\" height=\"38\" valign=\"bottom\" align=\"right\"><font face=\"Arial, Helvetica, sans-serif\" color=\"#49B0FC\">ICQ  Number </font></td>");
                               out.println("<td width=\"57%\" height=\"38\" valign=\"bottom\"><input type=\"text\" name=\"icqnumber\" size=\"10\" maxlength=\"10\" value=\""+icqnumber+"\">");    
                                      }
                              out.println("<font color=\"#FF9900\" size=\"2\">( optional )</font> </td></tr>");  
                              out.println("<tr><td colspan=\"2\" height=\"22\" valign=\"bottom\" align=\"right\">"); 
                              out.println("<hr align=\"center\"  size=\"4\" color=\"#FFCCCC\"  noshade></td></tr></table>");
                              out.println("<tr><td width=\"50%\">&nbsp;</td><td width=\"50%\">&nbsp;</td></tr>");
	         out.println("<table width=\"74%\" border=\"0\" align=\"center\"><tr><td width=\"50%\" align=\"center\">");
                              out.println("<input type=\"hidden\" name=\"country\" value=\""+country+"\">");
                              out.println("<input type=\"submit\" name=\"Submit\" value=\"     Accept    \"></td><td width=\"50%\" align=\"center\">");
                              out.println("<input type=\"reset\" name=\"Submit2\" value=\"    Decline    \"></td></tr>");
                              out.println("<tr><td width=\"50%\">&nbsp;</td><td width=\"50%\">&nbsp;</td></tr></table>");
                              out.println("</form></body>");
	         out.println("</html>");
	                 
	}   
  } 
 public static String OutPut(String InputTest) 
    { int nut=0;
       if(InputTest.indexOf('&')!= -1) {
       nut=0;
       while(true) {
            InputTest=InputTest.substring(0,InputTest.indexOf('&',nut)).concat("&amp;"+InputTest.substring((InputTest.indexOf('&',nut)+1)));
            nut = InputTest.indexOf('&',nut);
            if (nut == InputTest.lastIndexOf('&') )  break;
            nut =nut+1;
                           } }
      if(InputTest.indexOf('<')!= -1) {
       nut=0;
       while(true) {
            if (InputTest.lastIndexOf('<')==-1 )  break;
            InputTest=InputTest.substring(0,InputTest.indexOf('<',nut)).concat("&lt;"+InputTest.substring((InputTest.indexOf('<',nut)+1)));
                             } }                                                        
        if(InputTest.indexOf('>')!= -1) {
       nut=0;
       while(true) {
            if (InputTest.lastIndexOf('>')==-1 )  break;
            InputTest=InputTest.substring(0,InputTest.indexOf('>',nut)).concat("&gt;"+InputTest.substring((InputTest.indexOf('>',nut)+1)));
                             } }                                                          
       if(InputTest.indexOf(" ")!= -1) {
       nut=0;
       while(true) {
            if (InputTest.lastIndexOf(" ")==-1 )  break;
            InputTest=InputTest.substring(0,InputTest.indexOf(" ",nut)).concat("&nbsp;"+InputTest.substring((InputTest.indexOf(" ",nut)+1)));
                             } }                                            
       return InputTest;
       }  
}
class Checkinput 
 {  public static boolean  Checkbegin(String input)
                  {  String c[ ] = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
                      String UpperString=input.toUpperCase();
  	for ( int i=0;i<c.length;i++ )
 	         {  if ( UpperString.startsWith(c[i]) ) {   return true;  } 
 	         }
                       return false;
                   }
     static boolean CheckJava(String input)
                  {  char CharA[]=input.toCharArray();
                  	for ( int i=0;i<CharA.length;i++)
                  	      {  if (  !(Character.isJavaIdentifierPart(CharA[i]) )  )
                  	          return false;
                  	       }  
                                return true;
                    }               
      static boolean CheckChar(String input)
                  {  char CharB[]=input.toCharArray();
                  	for ( int i=0;i<CharB.length;i++)
                  	      {  if (  !(Character.isLetterOrDigit(CharB[i]) )  )
                  	          return false;
                  	       }  
                                return true;
                   }               
      static boolean CheckDigit(String input)
                  {  char CharC[]=input.toCharArray();
                  	for ( int i=0;i<CharC.length;i++)
                  	      {  if (  !(Character.isDigit(CharC[i]) )  )
                  	          return false;
                  	       }  
                                return true;
                   }               
  
 }                    

              
                           