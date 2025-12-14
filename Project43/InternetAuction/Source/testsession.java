import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
public  class testsession extends HttpServlet
{
    public void   doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
    Specification spectest = new Specification();
    resp.setContentType("text/html");
    PrintWriter out = resp.getWriter();
    HttpSession session = req.getSession(true);
    out.println("<html>");
    out.println("<head>");
    out.println("<title> Employee List </title>");
	  out.println("</head>");
    out.println("<body>");
    String dd = "dffd"  ;
    session.putValue("dd",dd);
    out.println("<h1> SPEC add </h1>");
       session.invalidate();
    out.println("<h1> SUCCESS HAS INVALIDATE </h1>");
    out.println("</body>");
    out.println("</html>");
    }
}
