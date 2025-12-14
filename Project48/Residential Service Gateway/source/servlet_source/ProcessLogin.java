import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ProcessLogin extends HttpServlet {
	class ProcessLoginException extends Exception {
			ProcessLoginException(String s) {
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
		String custid = req.getParameter("custid");
		String password = req.getParameter("password");
		resp.setContentType("text/html");
		ServletOutputStream out = resp.getOutputStream();
		out.println("<html><HEAD><TITLE>Home Connected::Gateway Status Page</TITLE>");
		out.println("<META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset=iso-8859-1\"><style type=\"text/css\">");
		out.println("<!--.style1 { color: #62CCFF;font-family: Georgia, \"Times New Roman\", Times, serif;}.style2 {color: #CCCC00}.style3 {color: #FFCC00}.style5 {color: #99FF00}.style6 {color: #CCCC00; font-family: Georgia, \"Times New Roman\", Times, serif; }--></style>");
		out.println("</HEAD><BODY BGCOLOR=#686868><p align=\"center\">");
		out.println("<table border=\"1\" bordercolor=\"#000000\" cellpadding=\"0\" cellspacing=\"0\" width=\"800\" style=\"border-style:outset\" bgcolor=\"#575757\"><tr><td style=\"border-style:inset\">");
		out.println("<TABLE WIDTH=800 BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD COLSPAN=11><IMG SRC=\"images/top.gif\" WIDTH=800 HEIGHT=106></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=106></TD></TR><TR><TD COLSPAN=7 ROWSPAN=2><IMG SRC=\"images/top_1_2_3.gif\" WIDTH=343 HEIGHT=5></TD><TD ROWSPAN=3><a href=\"#\"><IMG SRC=\"images/btn_4.gif\" WIDTH=93 HEIGHT=23 border=\"0\"></a></TD><TD COLSPAN=3><IMG SRC=\"images/top_b5.gif\" WIDTH=364 HEIGHT=4></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=4></TD></TR><TR><TD ROWSPAN=9><IMG SRC=\"images/4b5.gif\" WIDTH=17 HEIGHT=115></TD><TD ROWSPAN=4><a href=\"#\"><IMG SRC=\"images/btn_5.gif\" WIDTH=93 HEIGHT=23 border=\"0\"></a></TD><TD ROWSPAN=9><IMG SRC=\"images/right.gif\" WIDTH=254 HEIGHT=115></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=1></TD></TR><TR><TD COLSPAN=5 ROWSPAN=2><IMG SRC=\"images/left_2.gif\" WIDTH=233 HEIGHT=20></TD><TD ROWSPAN=4><a href=\"#\"><IMG SRC=\"images/btn_3.gif\" WIDTH=93 HEIGHT=23 border=\"0\"></a></TD><TD ROWSPAN=8><IMG SRC=\"images/3b4.gif\" WIDTH=17 HEIGHT=114></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=18></TD></TR><TR><TD ROWSPAN=7><IMG SRC=\"images/ub4.gif\" WIDTH=93 HEIGHT=96></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=2></TD></TR><TR><TD COLSPAN=3 ROWSPAN=3><IMG SRC=\"images/left_3.gif\" WIDTH=132 HEIGHT=20></TD><TD ROWSPAN=4><a href=\"http://161.246.5.114:8001/operator/Login.html\"><IMG SRC=\"images/btn_2.gif\" WIDTH=93 HEIGHT=23 border=\"0\"></a></TD><TD ROWSPAN=6><IMG SRC=\"images/2b3.gif\" WIDTH=8 HEIGHT=94></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=2></TD></TR><TR><TD ROWSPAN=5><IMG SRC=\"images/ub5.gif\" WIDTH=93 HEIGHT=92></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=1></TD></TR><TR><TD ROWSPAN=4><IMG SRC=\"images/ub3.gif\" WIDTH=93 HEIGHT=91></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=17></TD></TR><TR><TD ROWSPAN=3><IMG SRC=\"images/left_4.gif\" WIDTH=32 HEIGHT=74></TD><TD ROWSPAN=2><a href=\"http://161.246.5.114:8001/operator/index.html\"><IMG SRC=\"images/btn_1.gif\" WIDTH=93 HEIGHT=23 border=\"0\"></a></TD><TD ROWSPAN=3><IMG SRC=\"images/1b2.gif\" WIDTH=7 HEIGHT=74></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=3></TD></TR><TR><TD ROWSPAN=2><IMG SRC=\"images/ub2.gif\" WIDTH=93 HEIGHT=71></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=20></TD></TR><TR><TD><IMG SRC=\"images/ub1.gif\" WIDTH=93 HEIGHT=51></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=51></TD></TR></TABLE><br>");
		out.println("<table border=\"0\" cellpadding=\"5\" cellspacing=\"5\"><tr><td valign=\"top\" width=\"800\"><center><span class=\"style6\"><em><strong>Gateway Status</strong></em></span></center><p>");
		out.println("<TABLE width=\"68%\" align=center border=0><TBODY>");

		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select firstname,surname,address1,address2,city,postalcode,telephoneno from customer  where custid = '" + custid + "' and password = '" + password + "'");
			if (!rs.next()) throw new ProcessLoginException("Error: invalid customerid and password");
			Statement st2 = conn.createStatement();
			ResultSet rs2 = st2.executeQuery("select serialno , ipaddress , services  from jesbox  where custid = '" + custid + "' and inused = '1'");
			if (!rs2.next()) throw new ProcessLoginException("Could not find device owned by customer number: "+ custid + ". Contact our technical support for further assistance.");
			String firstname = rs.getString("firstname");
			String surname = rs.getString("surname");
			String address1 = rs.getString("address1");
			String address2 = rs.getString("address2");
			String city = rs.getString("city");
			String postalcode = rs.getString("postalcode");
			String telephoneno = rs.getString("telephoneno");
			String serialno = rs2.getString("serialno");
			String ipaddress = rs2.getString("ipaddress");
			String services = rs2.getString("services");
			st.close();
			st2.close();

			out.println("<TR><TD height=26><FONT class=\"style6\">Gateway Serialno.</FONT></TD>");
			out.println("<TD><FONT class=\"style3\">"+serialno+"</FONT></TD></TR>");
			out.println("<TR><TD height=26><FONT class=\"style6\">IP Address</FONT></TD>");
			out.println("<TD><FONT class=\"style3\">"+ipaddress+"</FONT></TD></TR>");	
			out.println("<TR><TD height=26><FONT class=\"style6\">Owned by Customer ID</FONT></TD>");
			out.println("<TD><FONT class=\"style3\">"+custid+"</FONT></TD></TR>");
			out.println("<TR><TD height=26><FONT class=\"style6\">Firstname</FONT></TD>");
			out.println("<TD><FONT class=\"style3\">"+firstname+"</FONT></TD></TR>");
			out.println("<TR><TD height=26><FONT class=\"style6\">Surname</FONT></TD>");
			out.println("<TD><FONT class=\"style3\">"+surname+"</FONT></TD></TR>");
			out.println("<TR><TD height=26><FONT class=\"style6\">Address1</FONT></TD>");
			out.println("<TD><FONT class=\"style3\">"+address1+"</FONT></TD></TR>");
			out.println("<TR><TD height=26><FONT class=\"style6\">Address2</FONT></TD>");
			out.println("<TD><FONT class=\"style3\">"+address2+"</FONT></TD></TR>");
			out.println("<TR><TD height=26><FONT class=\"style6\">City</FONT></TD>");
			out.println("<TD><FONT class=\"style3\">"+city+"</FONT></TD></TR>");
			out.println("<TR><TD height=26><FONT class=\"style6\">Postal Code</FONT></TD>");
			out.println("<TD><FONT class=\"style3\">"+postalcode+"</FONT></TD></TR>");
			out.println("<TR><TD height=26><FONT class=\"style6\">Telephone No.</FONT></TD>");
			out.println("<TD><FONT class=\"style3\">"+telephoneno+"</FONT></TD></TR>");
			out.println("<TR><TD height=26 colSpan=\"2\"><FONT class=\"style6\">");
			out.println("<em><strong><center>Services Installed in Gateway</center></strong></em></FONT></TD></TR>");

			if (services!=null){
				out.println("<TR><TD height=26 colSpan=\"2\"><FONT class=\"style3\">");
				out.println("<I>"+services+"</I></FONT></TD></TR></TBODY></TABLE></td></tr>");
			}
			else {
				out.println("<TR><TD height=26 colSpan=\"2\"><FONT class=\"style3\">");
				out.println("<I>None of ISP service installed</I></FONT></TD></TR></TBODY></TABLE></td></tr>");
			}

			out.println("<tr><td valign=\"top\" width=\"800\"><form name=\"ChangePwdRequest\" method=\"post\" action=\"http://161.246.5.114:8001/ChangePwdRequest/ChangePwdRequest\">");
			out.println("<DIV align=center class=\"style1\">Contact gateway operator to change customer information.<BR>If you want to change account password please click the 'Change Password' below.<BR><BR></FONT></DIV>");
			out.println("<input name=\"custid\" type=\"hidden\" value=\"" + custid + "\">");
			out.println("<center><input name=\"submit\" type=\"submit\" value=\"Change Password\"></center>");
			out.println("</form></td></tr>");

			out.println("<tr><td valign=\"top\" width=\"800\"><p align=\"center\" class=\"style5\">&copy; 2006 Home Connected All rights reserved.</p></td></tr>");



			
		} catch (ProcessLoginException ple) {
			out.println("<TR><TD height=26 ><FONT face=\"Arial, Helvetica, sans-serif\" COLOR=\"red\" SIZE=\"3\"><CENTER>" + ple.toString() + "</CENTER></FONT></TD></TR></TBODY></TABLE></td></tr>");
		} catch (SQLException sqle) {
			out.println("<TR><TD height=26 ><FONT face=\"Arial, Helvetica,	sans-serif\" COLOR=\"red\" SIZE=\"3\"><CENTER>" + sqle.toString() + "</CENTER></FONT></TD></TR></TBODY></TABLE></td></tr>");
		}
		out.println("</table></td></tr></table></p></BODY></HTML>");
	}

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}


