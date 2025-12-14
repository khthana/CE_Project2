import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class CheckOut extends HttpServlet {

		public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
			  String st1 = "",st2 = "",st3="";

			  res.setContentType("text/html");
			  PrintWriter out = res.getWriter();
			  HttpSession session = req.getSession(true);
			  String sum = req.getParameter("sum");
			  out.println("<HTML><HEAD><TITLE>Check out</TITLE></HEAD>");
		  	out.println("<BODY bgcolor=\"#99cccc\"><H1>Check out</H1>");
	  		out.println("<br><center><H2><a href=\"http://myproject/newcustomer.html\" target=\"_blank\">If you are new customer</a></H2></center>");
  			out.println("<form method=\"get\" action=\"http://myproject/jservlets/UserVerify\">");
				out.println("  <table width=\"75%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">");
				out.println("    <tr>");
				out.println("      <td width=\"27%\">&nbsp;</td>");
				out.println("      <td width=\"46%\"><font face=\"MS Sans Serif\" size=\"2\">User name ");
				out.println("        <input type=\"text\" name=\"textfield\" maxlength=\"20\" size=\"20\">");
				out.println("        </font></td>");
				out.println("      <td width=\"27%\"> ");
				out.println("        <div align=\"center\"></div>");
				out.println("     </td>");
				out.println("    </tr>");
				out.println("    <tr> ");
				out.println("      <td width=\"27%\">&nbsp;</td>");
				out.println("      <td width=\"46%\"><font face=\"MS Sans Serif\" size=\"2\">Password&nbsp;&nbsp; ");
				out.println("        <input type=\"password\" name=\"textfield2\" maxlength=\"20\" size=\"20\">");
				out.println("        </font></td>");
				out.println("      <td width=\"27%\">&nbsp;</td>");
				out.println("    </tr>");
				out.println("    <tr> ");
				out.println("      <td width=\"27%\" height=\"41\">&nbsp;</td>");
				out.println("      <td width=\"46%\" height=\"41\" valign=\"bottom\"> ");
				out.println("        <div align=\"center\">");
				out.println("		   <input type=\"hidden\" name=\"sum\" value=\""+sum+"\">");
				out.println("          <input type=\"submit\" name=\"Submit\" value=\"Submit\">");
				out.println("          <input type=\"reset\" name=\"Submit2\" value=\"Reset\">");
				out.println("        </div>");
				out.println("      </td>");
				out.println("      <td width=\"27%\" height=\"41\">&nbsp;</td>");
				out.println("    </tr>");
				out.println("  </table>");
				out.println("  <p>&nbsp; </p>");
				out.println("</form>");
				out.println("</BODY></HTML>");
		}
}
