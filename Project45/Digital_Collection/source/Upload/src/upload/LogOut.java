package upload;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class LogOut extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=MS874";
    //Initialize global variables
    public void init() throws ServletException {
    }
    //Process the HTTP Get request
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();

        //check cookies============================================================
        CheckCookies ck = new CheckCookies();

        Cookie[] cookies = request.getCookies();
        if (ck.IsCookies(request)) {
            System.err.println("found");
            for(int i=0;i<cookies.length;i++){
                Cookie cookie = cookies[i];
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
            response.sendRedirect("Buttom.html");

        }
        else {
            System.err.println("not found");
            response.sendRedirect("error/nocookie.html");
        }

        out.println("<html>");
        out.println("<head><title>LogOut</title></head>");
        out.println("<body bgcolor=\"#ffffff\">");
        out.println("<p>The servlet has received a GET. This is the reply.</p>");
        out.println("</body></html>");
    }
    //Process the HTTP Post request
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>LogOut</title></head>");
        out.println("<body bgcolor=\"#ffffff\">");
        out.println("<p>The servlet has received a POST. This is the reply.</p>");
        out.println("</body></html>");
    }
    //Clean up resources
    public void destroy() {
    }
}