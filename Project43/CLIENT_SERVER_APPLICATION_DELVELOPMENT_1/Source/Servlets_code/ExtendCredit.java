import java.util.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ExtendCredit extends HttpServlet {

		public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{

			Connection conn = null;
			Statement  stmt = null;
			ResultSet  rss = null;
			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			String user = req.getParameter("textfield1");
			String password =  req.getParameter("textfield2");
			String cradit_card =  req.getParameter("textfield3");
			String cradit_size = req.getParameter("select4");

			int cradit_sizex = Integer.parseInt(cradit_size);

			out.println("<HTML><HEAD><TITLE>New Member</TITLE></HEAD>");
			out.println("<BODY><H1>Extend Cradit</H1>");

			try
			{
       Class.forName ("oracle.jdbc.driver.OracleDriver");
       conn = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
				stmt = conn.createStatement();
				boolean err_all=false;
				boolean err_blank_user=false,err_blank_password=false,err_blank_cradit_card=false;
				//Check blank
				if (user.equals("")){
					err_blank_user = true;
					err_all = true;
				}
				if (password.equals("")){
					err_blank_password = true;
					err_all = true;
				}
				if (cradit_card.equals("")){
					err_blank_cradit_card = true;
					err_all = true;
				}
				//end check blank

				if (!err_blank_user && !err_blank_password && !err_blank_cradit_card){
					rss = stmt.executeQuery("select user from users where users='"+user+"' and password='"+password+"'");
					if (!rss.next())
					{
						err_all=true;
						out.println("<br>No user and password there!!");
					}
				}
				if (!err_all){
					stmt.executeUpdate("update users set cradit = cradit + "+cradit_size+" where users = '"+user+"'");

					out.println("<br>Your cradit was extended<br><br>");
					out.println("<br><INPUT type=\"button\" name=\"bClose\" value=\"Close window\" onClick=\"self.close()\">");
				}
				else
				{
					int n=0;
					//begin blank
					if (err_blank_user)
						out.println("<br> "+(++n)+" User name must not blank");
					if (err_blank_password)
						out.println("<br> "+(++n)+" Password must not blank");
					if (err_blank_cradit_card)
						out.println("<br> "+(++n)+" Cradit card number must not blank");
					//end blank
				}
				out.println("</BODY></HTML>");
			}
			catch ( SQLException e ) {
						System.err.println("Could not establish connection.");
				}
				catch ( ClassNotFoundException e ) {
						System.err.println("Could not load database driver.");
				}
				finally {
						try{
							if (conn != null)
								conn.close();
							}
						catch (SQLException ignored)	{	}
				}
		}
}