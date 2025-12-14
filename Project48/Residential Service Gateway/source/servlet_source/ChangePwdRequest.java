import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ChangePwdRequest extends HttpServlet {
	class ChangePwdRequestException extends Exception {
			ChangePwdRequestException(String s) {
				super(s);
			}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String custid = req.getParameter("custid");
		String oldpassword = req.getParameter("oldpassword");
		resp.setContentType("text/html");
		ServletOutputStream out = resp.getOutputStream();
		out.println("<html><HEAD><TITLE>Home Connected::Change Password Request Page</TITLE>");
		out.println("<META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset=iso-8859-1\"><style type=\"text/css\">");
		out.println("<!--.style1 { color: #FF99CC;font-family: Georgia, \"Times New Roman\", Times, serif;}.style3 {color: #FFCC00}.style5 {color: #99FF00}.style6 {color: #CCCC00; font-family: Georgia, \"Times New Roman\", Times, serif; }--></style>");
		out.println("</HEAD><BODY BGCOLOR=#686868><p align=\"center\">");
		out.println("<table border=\"1\" bordercolor=\"#000000\" cellpadding=\"0\" cellspacing=\"0\" width=\"800\" style=\"border-style:outset\" bgcolor=\"#575757\"><tr><td style=\"border-style:inset\">");
		out.println("<TABLE WIDTH=800 BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD COLSPAN=11><IMG SRC=\"images/top.gif\" WIDTH=800 HEIGHT=106></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=106></TD></TR><TR><TD COLSPAN=7 ROWSPAN=2><IMG SRC=\"images/top_1_2_3.gif\" WIDTH=343 HEIGHT=5></TD><TD ROWSPAN=3><a href=\"#\"><IMG SRC=\"images/btn_4.gif\" WIDTH=93 HEIGHT=23 border=\"0\"></a></TD><TD COLSPAN=3><IMG SRC=\"images/top_b5.gif\" WIDTH=364 HEIGHT=4></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=4></TD></TR><TR><TD ROWSPAN=9><IMG SRC=\"images/4b5.gif\" WIDTH=17 HEIGHT=115></TD><TD ROWSPAN=4><a href=\"#\"><IMG SRC=\"images/btn_5.gif\" WIDTH=93 HEIGHT=23 border=\"0\"></a></TD><TD ROWSPAN=9><IMG SRC=\"images/right.gif\" WIDTH=254 HEIGHT=115></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=1></TD></TR><TR><TD COLSPAN=5 ROWSPAN=2><IMG SRC=\"images/left_2.gif\" WIDTH=233 HEIGHT=20></TD><TD ROWSPAN=4><a href=\"#\"><IMG SRC=\"images/btn_3.gif\" WIDTH=93 HEIGHT=23 border=\"0\"></a></TD><TD ROWSPAN=8><IMG SRC=\"images/3b4.gif\" WIDTH=17 HEIGHT=114></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=18></TD></TR><TR><TD ROWSPAN=7><IMG SRC=\"images/ub4.gif\" WIDTH=93 HEIGHT=96></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=2></TD></TR><TR><TD COLSPAN=3 ROWSPAN=3><IMG SRC=\"images/left_3.gif\" WIDTH=132 HEIGHT=20></TD><TD ROWSPAN=4><a href=\"http://161.246.5.114:8001/operator/Login.html\"><IMG SRC=\"images/btn_2.gif\" WIDTH=93 HEIGHT=23 border=\"0\"></a></TD><TD ROWSPAN=6><IMG SRC=\"images/2b3.gif\" WIDTH=8 HEIGHT=94></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=2></TD></TR><TR><TD ROWSPAN=5><IMG SRC=\"images/ub5.gif\" WIDTH=93 HEIGHT=92></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=1></TD></TR><TR><TD ROWSPAN=4><IMG SRC=\"images/ub3.gif\" WIDTH=93 HEIGHT=91></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=17></TD></TR><TR><TD ROWSPAN=3><IMG SRC=\"images/left_4.gif\" WIDTH=32 HEIGHT=74></TD><TD ROWSPAN=2><a href=\"http://161.246.5.114:8001/operator/index.html\"><IMG SRC=\"images/btn_1.gif\" WIDTH=93 HEIGHT=23 border=\"0\"></a></TD><TD ROWSPAN=3><IMG SRC=\"images/1b2.gif\" WIDTH=7 HEIGHT=74></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=3></TD></TR><TR><TD ROWSPAN=2><IMG SRC=\"images/ub2.gif\" WIDTH=93 HEIGHT=71></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=20></TD></TR><TR><TD><IMG SRC=\"images/ub1.gif\" WIDTH=93 HEIGHT=51></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=51></TD></TR></TABLE><br>");
		out.println("<table border=\"0\" cellpadding=\"5\" cellspacing=\"5\"><tr><td valign=\"top\" width=\"800\"><form name=\"PwdChange\" method=\"post\" action=\"http://161.246.5.114:8001/PwdChange/PwdChange\">");
		out.println("<center><span class=\"style1\"><i>Ensure your new password must exceed 5 charactor.</i></span></center><p>");
		out.println("<TABLE width=\"68%\" align=center border=0><TBODY>");
		out.println("<TR><TD height=26><FONT class=\"style6\">Customer ID</FONT></TD>");
		out.println("<TD><FONT class=\"style3\">"+custid+"</FONT></TD></TR>");
		out.println("<TR><TD height=26><FONT class=\"style6\">Current Password</FONT></TD>");
		out.println("<TD><input name=\"oldpasswordinput\" type=\"password\" size=\"20\" maxlength=\"15\"></TD></TR>");
		out.println("<TR><TD height=26><FONT class=\"style6\">New Password</FONT></TD>");
		out.println("<TD><input name=\"newpassword1\" type=\"password\" size=\"20\" maxlength=\"15\"></TD></TR>");
		out.println("<TR><TD height=26><FONT class=\"style6\">Repeat New Password</FONT></TD>");
		out.println("<TD><input name=\"newpassword2\" type=\"password\" size=\"20\" maxlength=\"15\"></TD></TR>");
		out.println("<TR><TD>&nbsp;</TD></TR>");
		out.println("<TR><TD colSpan=\"2\"><center><input name=\"submit\" type=\"submit\" value=\"Change\">&nbsp;<input type=\"reset\" value=\"Reset\" name=\"reset\"></center>");
		out.println("<input name=\"custid\" type=\"hidden\" value=\"" + custid + "\"></TD></TR>");
		out.println("</TBODY></TABLE></td></tr>");
		out.println("<tr><td valign=\"top\" width=\"800\"><p align=\"center\" class=\"style5\">&copy; 2006 Home-Connected All rights reserved.</p></td></tr>");
		out.println("</table></td></tr></table></p></BODY></HTML>");

	}

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}