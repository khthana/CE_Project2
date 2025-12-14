import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ConfirmInstall extends HttpServlet {
	class ConfirmInstallException extends Exception {
		ConfirmInstallException(String s) {
			super(s);
		}
	}
	private Connection conn;
	public void init() {
		String data = "jdbc:mysql://localhost/godb";
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(data,"root","admin");
		} catch (Exception e) {
			System.err.println("Error: " + e.toString());
		}
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String providerName = req.getParameter ("providername");
		String serviceName = req.getParameter("servicename");
		String bundleURL = req.getParameter("bundleurl");
		String certURL = req.getParameter("certurl");
		String jesSerial = req.getParameter("jesboxno");
		String custNo = req.getParameter("custno");
		String successURL = req.getParameter("successurl");
		resp.setContentType("text/html");
		ServletOutputStream out = resp.getOutputStream();
		out.println("<html><HEAD><TITLE>Home Connected::Gateway Status Page</TITLE>");
		out.println("<META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset=iso-8859-1\"><style type=\"text/css\">");
		out.println("<!--.style1 { color: #62CCFF;font-family: Georgia, \"Times New Roman\", Times, serif;}.style2 {color: #FF6699}.style3 {color: #FFCC00}.style5 {color: #99FF00}.style6 {color: #CCCC00; font-family: Georgia, \"Times New Roman\", Times, serif; }--></style>");
		out.println("</HEAD><BODY BGCOLOR=#686868><p align=\"center\">");
		out.println("<table border=\"1\" bordercolor=\"#000000\" cellpadding=\"0\" cellspacing=\"0\" width=\"800\" style=\"border-style:outset\" bgcolor=\"#575757\"><tr><td style=\"border-style:inset\">");
		out.println("<TABLE WIDTH=800 BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD COLSPAN=11><IMG SRC=\"images/top.gif\" WIDTH=800 HEIGHT=106></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=106></TD></TR><TR><TD COLSPAN=7 ROWSPAN=2><IMG SRC=\"images/top_1_2_3.gif\" WIDTH=343 HEIGHT=5></TD><TD ROWSPAN=3><a href=\"#\"><IMG SRC=\"images/btn_4.gif\" WIDTH=93 HEIGHT=23 border=\"0\"></a></TD><TD COLSPAN=3><IMG SRC=\"images/top_b5.gif\" WIDTH=364 HEIGHT=4></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=4></TD></TR><TR><TD ROWSPAN=9><IMG SRC=\"images/4b5.gif\" WIDTH=17 HEIGHT=115></TD><TD ROWSPAN=4><a href=\"#\"><IMG SRC=\"images/btn_5.gif\" WIDTH=93 HEIGHT=23 border=\"0\"></a></TD><TD ROWSPAN=9><IMG SRC=\"images/right.gif\" WIDTH=254 HEIGHT=115></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=1></TD></TR><TR><TD COLSPAN=5 ROWSPAN=2><IMG SRC=\"images/left_2.gif\" WIDTH=233 HEIGHT=20></TD><TD ROWSPAN=4><a href=\"#\"><IMG SRC=\"images/btn_3.gif\" WIDTH=93 HEIGHT=23 border=\"0\"></a></TD><TD ROWSPAN=8><IMG SRC=\"images/3b4.gif\" WIDTH=17 HEIGHT=114></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=18></TD></TR><TR><TD ROWSPAN=7><IMG SRC=\"images/ub4.gif\" WIDTH=93 HEIGHT=96></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=2></TD></TR><TR><TD COLSPAN=3 ROWSPAN=3><IMG SRC=\"images/left_3.gif\" WIDTH=132 HEIGHT=20></TD><TD ROWSPAN=4><a href=\"#\"><IMG SRC=\"images/btn_2.gif\" WIDTH=93 HEIGHT=23 border=\"0\"></a></TD><TD ROWSPAN=6><IMG SRC=\"images/2b3.gif\" WIDTH=8 HEIGHT=94></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=2></TD></TR><TR><TD ROWSPAN=5><IMG SRC=\"images/ub5.gif\" WIDTH=93 HEIGHT=92></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=1></TD></TR><TR><TD ROWSPAN=4><IMG SRC=\"images/ub3.gif\" WIDTH=93 HEIGHT=91></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=17></TD></TR><TR><TD ROWSPAN=3><IMG SRC=\"images/left_4.gif\" WIDTH=32 HEIGHT=74></TD><TD ROWSPAN=2><a href=\"index.html\"><IMG SRC=\"images/btn_1.gif\" WIDTH=93 HEIGHT=23 border=\"0\"></a></TD><TD ROWSPAN=3><IMG SRC=\"images/1b2.gif\" WIDTH=7 HEIGHT=74></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=3></TD></TR><TR><TD ROWSPAN=2><IMG SRC=\"images/ub2.gif\" WIDTH=93 HEIGHT=71></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=20></TD></TR><TR><TD><IMG SRC=\"images/ub1.gif\" WIDTH=93 HEIGHT=51></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=51></TD></TR></TABLE><br>");
		out.println("<table border=\"0\" cellpadding=\"5\" cellspacing=\"5\"><tr><td valign=\"top\" width=\"800\"><form name=\"VerifyData\" method=\"post\" action=\"http://161.246.5.114:8001/InstallBundle/InstallBundle\">");
		


		try {
			if (providerName==null || serviceName==null ||bundleURL==null || certURL==null || jesSerial==null || custNo==null) throw new ConfirmInstallException("Invalid form data. Contact your service provider for further assistance.");
			Statement st = conn.createStatement();
			ResultSet rec = st.executeQuery("select serialno from jesbox where custid = '" + custNo + "' and serialno ='" + jesSerial + "' and inused = '1'");
			if (!rec.next()) throw new ConfirmInstallException("Could not find device with serial number: " + jesSerial + ", owned by customer number: "+ custNo + ".<BR>Please go back and ensure the details are correct.");
			rec = st.executeQuery("select firstname fname from customer where custid = '" + custNo + "'");
			if (!rec.next()) throw new ConfirmInstallException("Could not find customer details!");
			String fname = rec.getString("fname");
			st.close();

			out.println("<p align=\"left\"><span class=\"style6\">Hello </span><span class=\"style3\"><em><strong>" + fname + "</strong></em></span><br><br>");
			out.println("<span class=\"style6\">You have been redirected to the <strong><em>home-connected.com</em></strong> gateway operator web site.<br><br>");
			out.println("If you wish to signup for the <strong><em></span><span class=\"style1\">" + serviceName + "</span></em></strong><span class=\"style6\"> service by </span><span class=\"style1\"><em><strong>" + providerName + "</strong></em></span><span class=\"style6\"> ensure your home gateway device is switched on, enter your password below and click the 'Sign-up' button. The software will be immediately installed to your gateway.<br><br>");
			out.println("</span><span class=\"style2\"><strong><em>NOTE: You CANNOT cancel this process once the Signup button has been pressed!</em></strong></span></p>");
			out.println("<p><TABLE width=\"68%\" align=center border=0><TBODY>");
			out.println("<TR><TD height=26><FONT class=\"style6\">Password:</FONT></TD>");
			out.println("<TD><input name=\"password\" type=\"password\" size=\"20\" maxlength=\"15\">");
			out.println("<input name=\"providername\" type=\"hidden\" value=\"" + providerName + "\">");
			out.println("<input name=\"servicename\" type=\"hidden\" value=\"" + serviceName + "\">");
			out.println("<input name=\"bundleurl\" type=\"hidden\" value=\"" + bundleURL + "\">");
			out.println("<input name=\"certurl\" type=\"hidden\" value=\"" + certURL + "\">");
			out.println("<input name=\"custno\" type=\"hidden\" value=\"" + custNo + "\">");
			out.println("<input name=\"jesboxno\" type=\"hidden\" value=\"" + jesSerial + "\">");
			out.println("<input name=\"successurl\" type=\"hidden\" value=\"" + successURL + "\">");
			out.println("<TR><TD height=26 colSpan=\"2\"><center><input name=\"submit\" type=\"submit\" value=\"Sign-up\"></center></TD></TR></TBODY></TABLE></td></tr>");
			out.println("<tr><td valign=\"top\" width=\"800\"><p align=\"center\" class=\"style5\">&copy; 2006 Home Connected All rights reserved.</p></td></tr>");

		} catch (ConfirmInstallException cie) {
				out.println("<p><TABLE width=\"68%\" align=center border=0><TBODY><TR><TD height=26 ><FONT face=\"Arial, Helvetica, sans-serif\" COLOR=\"red\" SIZE=\"3\"><CENTER>" + cie.toString() + "</CENTER></FONT></TD></TR></TBODY></TABLE></td></tr>");
		} catch (SQLException sqle) {
				out.println("<p><TABLE width=\"68%\" align=center border=0><TBODY><TR><TD height=26 ><FONT face=\"Arial, Helvetica, sans-serif\" COLOR=\"red\" SIZE=\"3\"><CENTER>" + sqle.toString() + "</CENTER></FONT></TD></TR></TBODY></TABLE></td></tr>");
		}
			out.println("</table></td></tr></table></p></BODY></HTML>");
	}
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}