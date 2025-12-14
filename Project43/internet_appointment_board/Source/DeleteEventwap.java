import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
public class DeleteEventwap extends HttpServlet
{  String DefaultURL="http://161.246.5.233:8080/planny"; 
    Connection theConnection;
  protected  void  doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {    HttpSession session = req.getSession(true);
         String UserID =session.getValue("login.username").toString();
         if ( UserID==null  ) {  res.sendRedirect(DefaultURL+"/wap/login.wml");  }
         int No          =  Integer.parseInt(req.getParameter("n"));
        int No_rep = 0;
        int No_rem = 0;
           try{                             Class.forName("oracle.jdbc.driver.OracleDriver");
                                               theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                      }   catch (Exception e) {
                   	                      res.setContentType("text/vnd.wap.wml");
                                            PrintWriter out = res.getWriter(); 
                    	                      out.println(e.getMessage());   }
                      try {  Statement  theStatement=theConnection.createStatement();
                                ResultSet theResult =     theStatement.executeQuery(
                                "select no_rep,no_rem from calendar where no_cal ="+No);
                                 while (theResult.next()) { No_rep = theResult.getInt(1);
                       		                No_rem = theResult.getInt(2);  }
	    theResult.close();
	    theStatement.close();
	    }    catch (Exception e) {
                   	         res.setContentType("text/vnd.wap.wml");
                               PrintWriter out = res.getWriter(); 
                    	          out.println(e.getMessage());   }           		               
                     Calendar CalTemp = new GregorianCalendar();
               Calendar CalTemp2 = new GregorianCalendar();
               Calendar CalTemp3 = new GregorianCalendar();
              
                	                                              int newDay = 0;
                                                                   int newMonth = 0;
                                                                   int newYear = 0;
                                                                   int newHour = 0;
                                                                   int newMin = 0; 
                                                                   int newDay2 = 0;
                                                                   int newMonth2 = 0;
                                                                   int newYear2 = 0;
                                                                   int newHour2 = 0;
                                                                  int newMin2 = 0; 
                                                                  int newDay3 = 0;
                                                                  int newMonth3 = 0;
                                                                  int newYear3 = 0;
                                                                 int newHour3 = 0;
                                                                 int newMin3 = 0; 
                                                                boolean chpassday = false;
                         try{  
                          Statement  theStatement=theConnection.createStatement();
                          ResultSet theResult =     theStatement.executeQuery("select freq_rep,to_time,time  from calendar  where no_cal = "+No    );
                          while(theResult.next()) 
                          {                                CalTemp.setTime(theResult.getDate(1));
                                                            newDay = CalTemp.get(CalTemp.DATE);
                                                            newMonth = CalTemp.get(CalTemp.MONTH)+1;
                                                            newYear  = CalTemp.get(CalTemp.YEAR);
                                                             CalTemp.setTime(theResult.getTime(1));
                                                            newHour = CalTemp.get(CalTemp.HOUR_OF_DAY);
                                                            newMin = CalTemp.get(CalTemp.MINUTE);
                                                             CalTemp2.setTime(theResult.getDate(2));
                                                            newDay2 = CalTemp2.get(CalTemp2.DATE);
                                                            newMonth2 = CalTemp2.get(CalTemp2.MONTH)+1;
                                                            newYear2  = CalTemp2.get(CalTemp2.YEAR);
                                                             CalTemp2.setTime(theResult.getTime(2));
                                                            newHour2 = CalTemp2.get(CalTemp2.HOUR_OF_DAY);
                                                            newMin2 = CalTemp2.get(CalTemp2.MINUTE);
                                                              CalTemp3.setTime(theResult.getDate(3));
                                                            newDay3 = CalTemp3.get(CalTemp3.DATE);
                                                            newMonth3 = CalTemp3.get(CalTemp3.MONTH)+1;
                                                            newYear3  = CalTemp3.get(CalTemp3.YEAR);
                                                             CalTemp3.setTime(theResult.getTime(3));
                                                            newHour3 = CalTemp3.get(CalTemp3.HOUR_OF_DAY);
                                                            newMin3 = CalTemp3.get(CalTemp3.MINUTE);
                                                           }
                                    theResult.close();
                                    theStatement.close();//Close statement
                                   }   catch (Exception e)   
                                               {   PrintWriter out = res.getWriter(); 
                                                    res.setContentType("text/html");
                                                    out.println(e.getMessage()); } 
                             chpassday = false;
                	      CalTemp3 =  new GregorianCalendar(newYear3,newMonth3-1,newDay3);
                           CalTemp2 =  new GregorianCalendar(newYear2,newMonth2-1,newDay2);                                       
                           if  (!(CalTemp3.equals(CalTemp2)))      chpassday = true;       
                 
                 /*-----------------------------------------------------------------------------N=1------------------------------------------------------------------------------*/
                   
                  if ((No_rep == 1) && (No_rem==1)) {
                  	PrintWriter out = res.getWriter(); 
                        if  ((chpassday) ||  (!chpassday)) 
                  	                            { try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                                                                 theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                                                Statement  theStatement=theConnection.createStatement();
                                                                 theStatement.executeQuery(
                                                                "delete from calendar  where id = ' "+UserID+"' and no_cal = "+No );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    //PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); } 
                    	      }//if 
                    	   
                         }//if            N==1
                         
                         /*----------------------------------------------------------------------No_rep > 1 & No_rem =1---------------------------------------------*/
                	   int count1 = 0;
                	   int count2 = 0;
                	   int count3 = 0;
                	   int count4 = 0;
                	   if ((No_rep > 1) && (No_rem == 1))  {
                	             try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                                                                 theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                                                Statement  theStatement=theConnection.createStatement();
                                                                 theStatement.executeQuery(
                                                                "delete from calendar  where id = ' "+UserID+"' and no_cal = "+No );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }  
                	             try{   Statement  theStatement=theConnection.createStatement();
                	             		 ResultSet theResult =     theStatement.executeQuery(
                                                                   "select count(*)  from calendar  where  no_rep = "+No_rep);
                	                                             while (theResult.next()) { count1 = theResult.getInt(1) ;       }
                	                                            theStatement.close();//Close statement
                	                                                  }   catch (Exception e)   {    PrintWriter out = res.getWriter(); 
                                                                                                                         res.setContentType("text/html");
                    	                                                                                                    out.println(e.getMessage()); }
                	            if (count1 ==0)   { try{   Statement  theStatement=theConnection.createStatement();
                	            		            theStatement.executeQuery(
                	            		            "delete from repeat where no_rep = "+No_rep );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }  
                	            		       }//	if Deletesome
                	    
                	  
                     }// Delete No_rep
                  /*-----------------------------------------------------------No_rem>1 & No_rep = 1------------------------------------------------------*/   	            
           int countrem = 0;
           if ((No_rem > 1) && (No_rep == 1)) {
           	 PrintWriter out = res.getWriter(); 
           	//out.println(chpassday);
                   if (!chpassday) {
            	 try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from calendar  where no_cal = "+No );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    //PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }   
                	         try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from remind  where no_rem = "+No_rem+" or root = "+No_rem );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {   // PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }         	 
                	  }
                	else if  (chpassday)     	 
                	            {     try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "update calendar set no_rem = 1 where no_rem ="+No_rem );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    //PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                       out.println(e.getMessage()); }   
                    	                   try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from  calendar  where no_cal ="+No );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    //PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                       out.println(e.getMessage()); }   
                    	                   try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from remind  where no_rem = "+No_rem+" or root = "+No_rem );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {   // PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }         
                    	             }//if
                    	             
                   }//if No_rem > 1 & No_rep = 1
                    	           
                /*-------------------------------------No_rep > 1 & No_rem > 1---------------------------------------------------------------------------*/    	           
                    	           
                    	   count1 = 0;
                	   count2 = 0;
                	   count3 = 0;
                	   count4 = 0;
                	   countrem = 0;
                	   if ((No_rep > 1) && (No_rem > 1))  {
                	      try{    Statement  theStatement=theConnection.createStatement();
                                                           ResultSet theResult =     theStatement.executeQuery("select count(*)  from calendar  where no_rep = "+No_rep+
                                                          " and  time = to_date('"+newDay+"/" +newMonth+"/"+newYear+"  "
                                                           +newHour+":"+newMin+"','dd/mm/yyyy hh24:mi') and  freq_rep =  to_date('"+newDay+"/"+newMonth+"/"+newYear+ " "+ newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')"
                                                           +" and  to_time = to_date('"+newDay2+"/"+newMonth2+"/"+newYear2+ " "+ newHour2+":"+newMin2+"','dd/mm/yyyy hh24:mi')");
                                                          while (theResult.next())   { count3 = theResult.getInt(1) ; }
                                                          theStatement.close();
                                                           theResult.close();
                                                     } catch (Exception e) {   PrintWriter out = res.getWriter(); 
                                                                                                   res.setContentType("text/html");
                    	                                                                             out.println(e.getMessage()); }   
                    	   try {    Statement  theStatement=theConnection.createStatement();
                                                        ResultSet theResult =     theStatement.executeQuery("select count(*)  from calendar  where no_rep = "+No_rep +
                                                         " and  time <  to_date('"+newDay+"/" +newMonth+"/"+newYear+"  "
                                                           +newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')");
                                                         while (theResult.next())    { count4 = theResult.getInt(1) ; }
                                                        theStatement.close();
                                                        theResult.close();
                                                   } catch (Exception e) { PrintWriter out = res.getWriter(); 
                                                                                               res.setContentType("text/html");
                    	                                                                         out.println(e.getMessage()); }   
                	      if  (!chpassday) {
                	              try{   Class.forName("oracle.jdbc.driver.OracleDriver");
                                                                 theConnection = DriverManager.getConnection("jdbc:oracle:thin:@kate:1521:kate","scott","tiger");
                                                                Statement  theStatement=theConnection.createStatement();
                                                                 theStatement.executeQuery(
                                                                "delete from calendar  where id = ' "+UserID+"' and no_cal = "+No );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }  
                    	              
                	             try{   Statement  theStatement=theConnection.createStatement();
                	             		 ResultSet theResult =     theStatement.executeQuery(
                                                                   "select count(*)  from calendar  where  no_rep = "+No_rep);
                	                                             while (theResult.next()) { count1 = theResult.getInt(1) ;       }
                	                                            theStatement.close();//Close statement
                	                                                  }   catch (Exception e)   {    PrintWriter out = res.getWriter(); 
                                                                                                                         res.setContentType("text/html");
                    	                                                                                                    out.println(e.getMessage()); }
                	            if (count1 ==0)   { try{   Statement  theStatement=theConnection.createStatement();
                	            		            theStatement.executeQuery(
                	            		            "delete from repeat where no_rep = "+No_rep );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }  
			  try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from remind  where no_rem = "+No_rem );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {   PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }                           	                                                                                                      
                	            		}//if
                	            if (count4 > 0 ) {   try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from remind  where root = "+No_rem +" and no_cal="+No );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }      
                    	                                                     }//if
                	           }//Deletesome & !chpassday
                	           
                	           if  (chpassday) {    
                	             
                	               try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "update calendar set no_rem = 1 where no_rem ="+No_rem+
                	            		            "and  time = to_date('"+newDay3+"/" +newMonth3+"/"+newYear3+"  "
                                                                             +newHour3+":"+newMin3+"','dd/mm/yyyy hh24:mi') and  freq_rep >=  to_date('"+newDay+"/"+newMonth+"/"+newYear+ " "+ newHour+":"+newMin+"','dd/mm/yyyy hh24:mi')"
                                                                              +" and  to_time = to_date('"+newDay2+"/"+newMonth2+"/"+newYear2+ " "+ newHour2+":"+newMin2+"','dd/mm/yyyy hh24:mi')"); 
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                       out.println(e.getMessage()); }   
                    	                   try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from  calendar  where no_cal ="+No );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                       out.println(e.getMessage()); }   
                    	                  
                	                 try{   Statement  theStatement=theConnection.createStatement();
                	             		 ResultSet theResult =     theStatement.executeQuery(
                                                                   "select count(*)  from calendar  where  no_rep = "+No_rep);
                	                                             while (theResult.next()) { count1 = theResult.getInt(1) ;       }
                	                                            theStatement.close();//Close statement
                	                                                  }   catch (Exception e)   {    PrintWriter out = res.getWriter(); 
                                                                                                                         res.setContentType("text/html");
                    	                                                                                                    out.println(e.getMessage()); }
                	            if (count1 ==0)   { try{   Statement  theStatement=theConnection.createStatement();
                	            		            theStatement.executeQuery(
                	            		            "delete from repeat where no_rep = "+No_rep );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }
                    	                                              try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from remind  where no_rem = "+No_rem );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }                                                                
                	          		}
                	            if ((count3==1) && (count4> 0))  {
                    	                                       try{   Statement  theStatement=theConnection.createStatement();
                	            	      	       theStatement.executeQuery(
                	            		            "delete from remind  where  root = "+No_rem+" and no_cal="+No );    
                                                                 theStatement.close();//Close statement
                                                                       }   catch (Exception e)    {    PrintWriter out = res.getWriter(); 
                                                                                                                           res.setContentType("text/html");
                    	                                                                                                      out.println(e.getMessage()); }        
                	          	}//if count3
                	}   //Deletesome & chpassday       
                	          
                           
                   }//if No_rep >1 & No_rem > 1         
            
                   res.sendRedirect(DefaultURL+"/servlet/mainwap?s=d");                                
                              }
        }
         