package coreservlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */

public class ThreeParams extends HttpServlet {
  static final private String CONTENT_TYPE = "text/html; charset=MS874";
  //Initialize global variables
  public void init() throws ServletException {
  }
  //Process the HTTP Get request
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType(CONTENT_TYPE);
    PrintWriter out = response.getWriter();
    out.println("<html>");
    out.println("<head><title>ThreeParams</title></head>");
    out.println("<body>");
    out.println("param1"+request.getParameter("param1"));
    out.println("<p>The servlet has received a GET. This is the reply.</p>");
    out.println("</body></html>");
  }
  //Clean up resources
  public void destroy() {
  }
}