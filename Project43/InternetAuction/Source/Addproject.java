import  java.sql.*;
import  oracle.jdbc.driver.*;
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.util.*;
public class Addproject extends HttpServlet
{
    public void   doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
    String Projectname  = req.getParameter("Projectname");
    String Projectdescription  = req.getParameter("Projectdescription");
    String Enddate   = req.getParameter("Enddate");
    String Maxprice  = req.getParameter("Maxprice");
    String Partname  = req.getParameter("Partname");
    String Policy    = req.getParameter("Policy");
    String Description  = req.getParameter("Description");
    java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
    resp.setContentType("text/html");
    out.println("<html>");
    out.println("<head>");
    out.println("<title>Untitled Document</title>");
    out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
    out.println("</head>");
    out.println("<body bgcolor=\"#FFFFFF\">");
    out.println("Projectname  " + Projectname);
    out.println("Projectdescription  " + Projectdescription);
    out.println("Enddate  " + Enddate);
    out.println("Maxprice  " + Maxprice);
    out.println("Partname  " + Partname);
    out.println("Policy  " + Policy);
    out.println("Description  " + Description);
    out.println("</body>");
    out.println("</html>");
    out.flush();

    }
}
