package Sagent2;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class Logout extends HttpServlet {

  //Initialize global variables
  public void init(ServletConfig config) throws ServletException {
    super.init(config);
  }

  //Process the HTTP Post request
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession(true);
    session.invalidate();
    response.sendRedirect("http://161.246.5.185:8080/Sagent/bye.html");
  }

  //Get Servlet information
  public String getServletInfo() {
    return "Sagent2.Logout Information";
  }
} 