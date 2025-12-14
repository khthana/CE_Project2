package Sagent2;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class SendRedirect extends HttpServlet {
   String url;
   public void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {
      PrintWriter writer = res.getWriter();
	    res.setContentType("text/html");
      url = req.getParameter("url");
      res.sendRedirect(url);
    }
}