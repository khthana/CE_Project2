import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class UpdateMemberG  extends HttpServlet
    {   String DefaultURL="http://161.246.5.233:8080/planny"; 
         Connection theConnection;
         protected void doPost(HttpServletRequest req , HttpServletResponse res) throws ServletException, IOException
         {   HttpSession session = req.getSession(true);
              String UserID = (String)session.getValue("login.username");	
              if ( UserID==null  ) {  res.sendRedirect(DefaultURL);  }
              else session.putValue("lgoin.username",UserID);
              String EMName = req.getParameter("EMName");
              String EMStatus = req.getParameter("EMStatus");
              String EMNote = req.getParameter("EMNote");
              String Update = req.getParameter("EMUpdate");
              String Delete = req.getParameter("EMDelete");
              //String Cancel = req.getParameter("EMCancel");
              String Title = req.getParameter("HiddenTitle");
              String Type = req.getParameter("HiddenType");
              int checkNo = Integer.parseInt(req.getParameter("MemberRadio"));
              
              /* PrintWriter out = res.getWriter(); 
             res.setContentType("text/html");
              out.println("EMName = "+EMName+"b<br>");
              out.println("EMStatus = "+EMStatus+"b<br>");
              out.println("EMCheck = "+checkNo+"b<br>");
              out.println("EMNote = "+EMNote+"b<br>");
              out.println("Title = "+Title+"b<br>");
              out.println("Type = "+Type+"b<br>");
             /* out.println("EMUpdate = "+EMUpdate+"b<br>");
              out.println("EMDelete = "+EMDelete+"b<br>");
              out.println("EMCancel = "+EMCancel+"b<br>");*/
               
            
               if  (Update != null ){ 
           	try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                      theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                      Statement  theStatement=theConnection.createStatement();
                      theStatement.executeQuery("update member set membername='"+EMName+"', status='"+EMStatus+"',"
                      +"note='"+EMNote+"' where grouptype='"+Type+"' and groupname='"+Title+"' and no_mem="+checkNo);
                      theStatement.close();//Close statement
                      theConnection.close(); 
                  }   catch (Exception e)  
                                               {    PrintWriter out = res.getWriter(); 
                                                     res.setContentType("text/html");
                    	                                out.println(e.getMessage()); }
                    	               }
            if (Delete != null) {
          	try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                      theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                      Statement  theStatement=theConnection.createStatement();
                      theStatement.executeQuery("delete from member where  no_mem="+checkNo);
                       theStatement.close();//Close statement
                      theConnection.close(); 
                  }   catch (Exception e)  
                                               {    PrintWriter out = res.getWriter(); 
                                                     res.setContentType("text/html");
                    	                                out.println(e.getMessage()); }
                    	               }
       // if (Cancel != null ) { res.sendRedirect(DefaultURL+"/servlet/gCalendar"); }
                          res.sendRedirect(DefaultURL+"/servlet/gCalendar");
          }
     } 