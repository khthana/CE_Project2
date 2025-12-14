
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.util.*;
public class  Login extends HttpServlet
{
    public void   doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
    resp.setContentType("text/html");
    PrintWriter out = resp.getWriter();
    HttpSession session = req.getSession(true);
    String username ;
    String password ;
    out.println(session.getId());
    username = req.getParameter("username");
    password = req.getParameter("password");
    session.putValue("username",username);
    session.putValue("password",password);
    out.println("<html>");
    out.println("<head>");
    out.println("<title> Test Login </title>");
	  out.println("</head>");
    out.println("<body>");
    out.println("</body>");
    out.println("</html>");
    }
}

