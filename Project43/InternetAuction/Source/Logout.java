
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Logout extends HttpServlet implements Serializable
{
    public void   doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
      java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
      resp.setContentType("text/html");
      HttpSession session = req.getSession(true);
      session.invalidate();
      resp.sendRedirect("../index.html");
    }

}



