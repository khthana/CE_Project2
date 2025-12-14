//**************************************
//     
// Name: Calendar Servlet
// Description:This is just a beginners'
//     stuff. I was archiving my old files and 
//     I saw my servlet examples from Java lect
//     ures. I just wanted to post some of them
//     , and gave a start with this piece of co
//     de. Hope beginners find it usefull. This
//     is a servlet, written in IBM Websphere. 
//     It shows a simple calendar. It marks cur
//     rent date with "*", and jumps to a new l
//     ine when the new week starts.
// By: VbNick
//
//This code is copyrighted and has// limited warranties.Please see http://
//     www.1JavaStreet.com/vb/scripts/ShowCode.
//     asp?txtCodeId=4097&lngWId=2//for details.//**************************************
//     

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
* @version 	1.0
* @author Kayhan TANRISEVEN
*/


    public class webStart extends HttpServlet {
    	/**
    	* @see javax.servlet.http.HttpServlet#void (javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
    	*/
    	public void doGet(HttpServletRequest req, HttpServletResponse resp)


        		throws ServletException, IOException {
        			 
        PrintWriter out = resp.getWriter();
        
        	
        	// construct d as current date
        	
        		// d'yi su andaki tarih olarak ata
        		GregorianCalendar d = new GregorianCalendar();
        		int today = d.get(Calendar.DAY_OF_MONTH);
        		int month = d.get(Calendar.MONTH);
        		
        		//set d to start date of the month
        		//d'yi bu ayin basinda baslamak icin hazirla
        		
        		d.set(Calendar.DAY_OF_MONTH,1);
        		
        		int weekday = d.get(Calendar.DAY_OF_WEEK);
        		
        		//print heading
        		//basligi yazdir
        		
        		out.println("Sun Mon Tue Wed Thu Fri Sat");
        		
        		//indent first line of calendar
        		//takvimin ilk satirini bir satir iceriden baslat
        		
        		for (int i = Calendar.SUNDAY; i<weekday;i++)
        		out.print(" ");
        		
        		do


            		{
            			
            			//print day
            			//gunu yazdir
            			
            			int day = d.get(Calendar.DAY_OF_MONTH);
            			if(day<10) out.print(" ");
            			out.print(day);
            			
            			//mark current day with *
            			//su andaki tarihi * ile isaretle
            			
            			if (day == today)
            			 out.print("* ");
            			else
            			 out.print(" ");
            			 
            			 //start new line after every Saturday
            			 //her cumartesinden sonra yeni bir satira gec
            			 
            			 if (weekday == Calendar.SATURDAY)
            			 out.println();
            			 
            			 //advance d to the next day
            			 //d'yi bir sonraki gune ilerlet
            			 
            			 d.add(Calendar.DAY_OF_MONTH,1);
            			 weekday = d.get(Calendar.DAY_OF_WEEK);
            		}
            		
            		while (d.get(Calendar.MONTH) == month);
            		
            		//loop the exits when d is 1 of the next month
            		
            		//print final end of line if necessary
            		
            		if (weekday != Calendar.SUNDAY)
            		out.println();
            		
            
            	}
            	/**
            	* @see javax.servlet.http.HttpServlet#void (javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
            	*/
            	public void doPost(HttpServletRequest req, HttpServletResponse resp)


                		throws ServletException, IOException {
                	}
                	/**
                	* @see javax.servlet.GenericServlet#void ()
                	*/


                    	public void init() throws ServletException {
                    		super.init();
                    	}
                }
