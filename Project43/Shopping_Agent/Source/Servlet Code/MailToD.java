package Sagent2;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
public class MailToD extends HttpServlet{
  String username,password;
  public void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
  {
    PrintWriter writer = res.getWriter();
    res.setContentType("text/html");
    username = req.getParameter("username");
    password = req.getParameter("password");
    HttpSession session = req.getSession(true);
    session.putValue("user.username",username);
    session.putValue("user.password",password);
    res.sendRedirect("http://161.246.5.185:8080/Sagent/servlet/Sagent2.Display");
  }
}
