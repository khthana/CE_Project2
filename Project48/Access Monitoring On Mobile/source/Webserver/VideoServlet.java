/*
 * VideoServlet.java
 *
 * Created on November 3, 2005, 12:00 AM
 */

import java.io.*;
import java.net.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Administrator
 * @version
 */
public class VideoServlet extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    
 
 protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
      response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

  	// กำหนดตัวแปรออปเจ็กต์ต่าง ๆ 
    String message;


	// สร้างออปเจ็กต์ session เป็นเชสชันติดตามการร้องขอ
	// ต่าง ๆ จนกว่าการร้องขอนั้นจะสิ้นสุด
    HttpSession session = request.getSession(true);
    

	// ตรวจสอบว่าใช้เชสชันที่สร้างใหม่หรือไม่
    if (session.getAttribute("login")!= "valid") 
	{
           // ได้รับ userid ในข่าวสารที่ร้องขอจากอุปกรณ์ไร้สาย
      String userValid = request.getParameter("userid");
	  
   
      try{
            Database db = new Database();
            String status = db.Login(request.getParameter("userid"),request.getParameter("password"));
      
            if(status=="valid"){
            session = request.getSession(true);
            session.setMaxInactiveInterval(900);
            out.println("loginvalid");
           session.setAttribute("login","valid");
            }
            else{
                out.println("loginError");

            }
      } catch (Exception e) 
	{
      throw new ServletException(e.getMessage());   
        }
    }      
    
        else 
        {
	  // บรรจุเวลาขณะนั้นของระบบ
      message = Long.toString(System.currentTimeMillis());

	  // กำหนดเวลาของระบบให้แอตทริบิวต์ MESSAGE ของเชสชัน
      session.setAttribute("MESSAGE", message);

	  // กำหนดเวลาของระบบให้แอตทริบิวต์ MESSAGE ของการร้องขอ
      request.setAttribute("MESSAGE", message);
      
      
     String opttst=request.getParameter("id").trim();
     String rec="recently";
        

     //recently check
      if(opttst.equals(rec)){
             try{
                Database db = new Database();
              String urlrec= db.recently();
                out.println(urlrec); 
            } catch (Exception e) 
	{
      throw new ServletException(e.getMessage());   
        }                                                     
     }
       else{
              
          try{
                Database db = new Database();             
                out.println(db.queryevent(request.getParameter("id"))); 
 
                
    } catch (Exception e) 
	{
      throw new ServletException(e.getMessage());   
        }
          
       }
     }
       
  }
    
  
  
 //class close
}
