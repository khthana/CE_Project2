import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.net.*;
import com.home.impl.manager.*;

public class InstallBundle extends HttpServlet {
	class InstallBundleException extends Exception {
		InstallBundleException(String s) {
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
		String providerName = req.getParameter("providername");
		String serviceName = req.getParameter("servicename");
		String bundleURL = req.getParameter("bundleurl");
		String certURL = req.getParameter("certurl");
		String jesSerial = req.getParameter("jesboxno");
		String custNo = req.getParameter("custno");
		String custPass = req.getParameter("password");
		String successURL = req.getParameter("successurl");
		resp.setContentType("text/html");
		ServletOutputStream out = resp.getOutputStream();
		out.println("<html><HEAD><TITLE>Home Connected::Gateway Status Page</TITLE>");
		out.println("<META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset=iso-8859-1\"><style type=\"text/css\">");
		out.println("<!--.style1 { color: #62CCFF;font-family: Georgia, \"Times New Roman\", Times, serif;}.style2 {color: #FF6699}.style3 {color: #FFCC00}.style5 {color: #99FF00}.style6 {color: #CCCC00; font-family: Georgia, \"Times New Roman\", Times, serif; }--></style>");
		out.println("</HEAD><BODY BGCOLOR=#686868><p align=\"center\">");
		out.println("<table border=\"1\" bordercolor=\"#000000\" cellpadding=\"0\" cellspacing=\"0\" width=\"800\" style=\"border-style:outset\" bgcolor=\"#575757\"><tr><td style=\"border-style:inset\">");
		out.println("<TABLE WIDTH=800 BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD COLSPAN=11><IMG SRC=\"images/top.gif\" WIDTH=800 HEIGHT=106></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=106></TD></TR><TR><TD COLSPAN=7 ROWSPAN=2><IMG SRC=\"images/top_1_2_3.gif\" WIDTH=343 HEIGHT=5></TD><TD ROWSPAN=3><a href=\"#\"><IMG SRC=\"images/btn_4.gif\" WIDTH=93 HEIGHT=23 border=\"0\"></a></TD><TD COLSPAN=3><IMG SRC=\"images/top_b5.gif\" WIDTH=364 HEIGHT=4></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=4></TD></TR><TR><TD ROWSPAN=9><IMG SRC=\"images/4b5.gif\" WIDTH=17 HEIGHT=115></TD><TD ROWSPAN=4><a href=\"#\"><IMG SRC=\"images/btn_5.gif\" WIDTH=93 HEIGHT=23 border=\"0\"></a></TD><TD ROWSPAN=9><IMG SRC=\"images/right.gif\" WIDTH=254 HEIGHT=115></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=1></TD></TR><TR><TD COLSPAN=5 ROWSPAN=2><IMG SRC=\"images/left_2.gif\" WIDTH=233 HEIGHT=20></TD><TD ROWSPAN=4><a href=\"#\"><IMG SRC=\"images/btn_3.gif\" WIDTH=93 HEIGHT=23 border=\"0\"></a></TD><TD ROWSPAN=8><IMG SRC=\"images/3b4.gif\" WIDTH=17 HEIGHT=114></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=18></TD></TR><TR><TD ROWSPAN=7><IMG SRC=\"images/ub4.gif\" WIDTH=93 HEIGHT=96></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=2></TD></TR><TR><TD COLSPAN=3 ROWSPAN=3><IMG SRC=\"images/left_3.gif\" WIDTH=132 HEIGHT=20></TD><TD ROWSPAN=4><a href=\"http://161.246.5.114:8001/operator/Login.html\"><IMG SRC=\"images/btn_2.gif\" WIDTH=93 HEIGHT=23 border=\"0\"></a></TD><TD ROWSPAN=6><IMG SRC=\"images/2b3.gif\" WIDTH=8 HEIGHT=94></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=2></TD></TR><TR><TD ROWSPAN=5><IMG SRC=\"images/ub5.gif\" WIDTH=93 HEIGHT=92></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=1></TD></TR><TR><TD ROWSPAN=4><IMG SRC=\"images/ub3.gif\" WIDTH=93 HEIGHT=91></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=17></TD></TR><TR><TD ROWSPAN=3><IMG SRC=\"images/left_4.gif\" WIDTH=32 HEIGHT=74></TD><TD ROWSPAN=2><a href=\"http://161.246.5.114:8001/operator/index.html\"><IMG SRC=\"images/btn_1.gif\" WIDTH=93 HEIGHT=23 border=\"0\"></a></TD><TD ROWSPAN=3><IMG SRC=\"images/1b2.gif\" WIDTH=7 HEIGHT=74></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=3></TD></TR><TR><TD ROWSPAN=2><IMG SRC=\"images/ub2.gif\" WIDTH=93 HEIGHT=71></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=20></TD></TR><TR><TD><IMG SRC=\"images/ub1.gif\" WIDTH=93 HEIGHT=51></TD><TD><IMG SRC=\"images/spacer.gif\" WIDTH=1 HEIGHT=51></TD></TR></TABLE><br>");
		out.println("<table border=\"0\" cellpadding=\"5\" cellspacing=\"5\"><tr><td valign=\"top\" width=\"800\">");

		try {
			if (providerName==null || serviceName==null ||bundleURL==null || certURL==null || jesSerial==null || custNo==null || custPass==null) throw new InstallBundleException("Invalid form data. Contact your service provider for further assistance.");
			Statement st = conn.createStatement();
			ResultSet rec = st.executeQuery("select cust.password passwd , jb.ipaddress ipaddr , jb.services serv from jesbox jb, customer cust where cust.custid = jb.custid and jb.serialno = '" + jesSerial + "' and cust.custid = '" + custNo + "'");
			if (!rec.next()) throw new InstallBundleException("Supplied data is incorrect, please go back and verify all information.");
			String ipAddress = rec.getString("ipaddr");
			String password = rec.getString("passwd");
			String installed_service = rec.getString("serv");
			st.close();
			if (!custPass.equals(password)) throw new InstallBundleException("Passwords do not match!");
			// Now we need to contact the JES box!
			Socket sock = null;
			ObjectInputStream ois = null;
			ObjectOutputStream oos = null;
			out.println("<p align=\"center\"><span class=\"style1\"><em><strong>"+ serviceName +"</em> Install Status</strong></span></p><BR>");
			try {
				sock = new Socket(ipAddress, 888);
				ois = new ObjectInputStream(sock.getInputStream());
				oos = new ObjectOutputStream(sock.getOutputStream());
				} catch (IOException ioe) {
					throw new InstallBundleException("Could not connect to specified home gateway. Please ensure it is switched on, if it is please call technical support!");
				}
			out.println("<p align=\"center\"><span class=\"style6\">");
			out.println("Connecting to home gateway...<br><br>");
			out.println("Issuing software install request...<br><br>");
			InstallBundleRequest ibr = new InstallBundleRequest(bundleURL, certURL);
			try {
				oos.writeObject(ibr);
				} catch (IOException ioe) {
					throw new InstallBundleException("Could not send install request to home gateway. Please ensure it is switched on, if it is please call technical support!");
				}
			out.println("Waiting for gateway response...<br><br>");
			Object obj = null;
			try {
				obj = ois.readObject();
			} catch (ClassNotFoundException cnfe) {
				throw new InstallBundleException("An internal server error. Please contact us immediately.");
			} catch (IOException ioe) {
				throw new InstallBundleException("Could not get install response from home gateway. Please ensure it is switched on, if it is please call technical support!");
			}
			if(!obj.getClass().getName().equals("com.home.impl.manager.InstallBundleResponse")) throw new InstallBundleException("Unexpected object returned:" + obj.getClass().getName());
			InstallBundleResponse ibresp =(InstallBundleResponse) obj;
			if (!ibresp.getInstallOk()) {
				throw new InstallBundleException("Gateway reported error while installing service:" + ibresp.getErrorMessage());
			}

			out.println("</span>");
			out.println("<span class=\"style3\"><em><strong>" + serviceName + "</strong></em></span><span class=\"style6\"> installed successfully!<br><br>");
			out.println("Starting: <em><strong></span><span class=\"style3\">" + serviceName + "</span></strong></em><span class=\"style6\">...<br><br>");
			StartBundleRequest sbr = new StartBundleRequest(bundleURL);
			try {
				oos.writeObject(sbr);
			} catch (IOException ioe) {
				throw new InstallBundleException("Could not send start request to home gateway. Please ensure it is switched on, if it is please call technical support!");
			}
			out.println("Waiting for gateway response...<br><br>");
			try {
				obj = ois.readObject();
			} catch (ClassNotFoundException cnfe) {
				throw new InstallBundleException("An internal server error. Please contact us immediately.");
			} catch (IOException ioe) {
				throw new InstallBundleException("Could not get start response from home gateway. Please ensure it is switched on, if it is please call technical support!");
			}
			if(!obj.getClass().getName().equals("com.home.impl.manager.StartBundleResponse")) throw new InstallBundleException("Unexpected object returned: "+ obj.getClass().getName());
			StartBundleResponse sbresp =(StartBundleResponse) obj;
			if (!sbresp.getStatusOk()) {
				throw new InstallBundleException("Gateway reported error while starting service :" + sbresp.getErrorMessage());
			}

			if (installed_service!= null) installed_service+=", "+providerName+".inc "+serviceName;
			else installed_service=providerName+".inc "+serviceName;

			Statement st2 = conn.createStatement();
			int numRecs = st2.executeUpdate("update jesbox set services = '" + installed_service + "' where serialno = '" + jesSerial + "'");
			st2.close();

			out.println("</span><span class=\"style3\"><em><strong>" + serviceName + "</strong></em></span><span class=\"style6\"> started successfully!<br><br>");
			out.println("</p><BR><BR><center></span><span class=\"style1\"><em><strong>" + serviceName + " by " + providerName + " has been installed and is ready for use!<br><br></span>");
			out.println("<BR><BR><em><strong><A HREF=\"" + successURL + "\"><span class=\"style2\">TO CONTINUE CLICK HERE!</A></strong></em></FONT></center></td></tr>");
			try {
				ois.close();
				oos.close();
				sock.close();
			} catch (IOException ioe) {
				throw new InstallBundleException("Error reported while disconnecting. Please contact technical support for further assistance.");
			}
		} catch (InstallBundleException ibe) {
			out.println("<center><FONT face=\"Arial, Helvetica, sans-serif\" COLOR=\"red\" SIZE=\"3\"><CENTER>" + ibe.toString() + "</CENTER></FONT></td></tr>");
		} catch (SQLException sqle) {
			out.println("<center><FONT face=\"Arial, Helvetica, sans-serif\" COLOR=\"red\" SIZE=\"3\"><CENTER>" + sqle.toString() + "</CENTER></FONT></td></tr>");
		}

			out.println("<tr><td valign=\"top\" width=\"800\"><p align=\"center\" class=\"style5\">&copy; 2006 Home Connected All rights reserved.</p></td></tr>");
			out.println("</table></td></tr></table></p></BODY></HTML>");
	}

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
