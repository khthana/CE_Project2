import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Basket extends HttpServlet {

		public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{

			Connection  conn= null;
			Statement   stmtt = null;
			ResultSet   rss = null;
			String      st1 = "",st2 = "",st3="";
			int         sum = 0;

			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			HttpSession session = req.getSession(true);
			String buttons = req.getParameter("Submit");
			String[] items =  req.getParameterValues("checkbox");
			String buttonsremove = req.getParameter("Submitr");
			String[] itemsremove =  req.getParameterValues("checkremove");
 		  out.println("<HTML><HEAD><TITLE>Your Basket Now</TITLE></HEAD>");
			out.println("<BODY bgcolor=\"#99cccc\"><H1>Your basket now!!</H1>");

			try
			{
        Class.forName ("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
				stmtt = conn.createStatement();
					if (items != null)
						if (buttons.equals("Add to basket"))
						{
						Integer count = new Integer(0);
						for (int i = 0;i < items.length ;i++ )
								session.putValue(items[i],count);
						}
					if (itemsremove != null)
						if (buttonsremove.equals("Remove that select"))
						{
							for (int i = 0;i < itemsremove.length ;i++ )
								session.removeValue(itemsremove[i]);
						}
				out.println("<form method=\"get\" action=\"http://myproject/jservlets/Basket\">");
				out.println("<table width=\"62%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">");
				out.println("  <tr>");
				out.println("    <td height=\"30\" width=\"13%\">");
				out.println("      <div align=\"center\"><b><font face=\"MS Sans Serif\" size=\"2\">Order</font></b></div>");
				out.println("    </td>");
				out.println("    <td height=\"30\" width=\"26%\">");
				out.println("      <div align=\"center\"><font face=\"MS Sans Serif\" size=\"2\"><b>Name</b></font></div>");
				out.println("    </td>");
				out.println("    <td height=\"30\" width=\"18%\">");
				out.println("      <div align=\"center\"><b><font face=\"MS Sans Serif\" size=\"2\">Volume</font></b></div>");
				out.println("    </td>");
				out.println("    <td height=\"30\" width=\"17%\"> ");
				out.println("      <div align=\"center\"><font face=\"MS Sans Serif\" size=\"2\"><b>Price</b></font></div>");
				out.println("    </td>");
				out.println("    <td height=\"30\" width=\"26%\"> ");
				out.println("      <div align=\"center\"></div>");
				out.println("    </td>");
				out.println("  </tr>");
				String[] names = session.getValueNames();
				for (int i =0;i<names.length ;i++ )
				{
					rss = stmtt.executeQuery("select book_name, volume, rent_price from cartoon where id_book = "+names[i]);
					while(rss.next()){
						out.println("<tr> ");
						out.println("    <td height=\"28\" width=\"13%\">");
						out.println("      <div align=\"center\"><font face=\"MS Sans Serif\" size=\"2\">"+(i+1)+"</font></div>");
						out.println("    </td>");
						out.println("    <td height=\"28\" width=\"26%\">");
						out.println("      <div align=\"center\"><font face=\"MS Sans Serif\" size=\"2\">"+rss.getString("book_name").trim()+"</font></div>");
						out.println("    </td>");
						out.println("    <td height=\"28\" width=\"18%\">");
						out.println("      <div align=\"center\"><font face=\"MS Sans Serif\" size=\"2\">"+rss.getString("volume").trim()+"</font></div>");
						out.println("    </td>");
						out.println("    <td height=\"28\" width=\"17%\">");
						st1 = rss.getString("rent_price").trim();
						sum += Integer.parseInt(st1);
						out.println("      <div align=\"center\"><font face=\"MS Sans Serif\" size=\"2\">"+st1+"</font></div>");
						out.println("    </td>");
						out.println("    <td height=\"28\" width=\"26%\" valign=\"middle\" align=\"left\">");
						out.println("      <p> ");
						out.println("        <input type=\"checkbox\" name=\"checkremove\" value=\""+names[i]+"\">");
						out.println("        <font face=\"MS Sans Serif\" size=\"2\">Remove</font></p>");
						out.println("    </td>");
						out.println("  </tr>");
					}
				}
				out.println("<table width=\"53%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" height=\"21\">");
				out.println("  <tr>");
				out.println("    <td width=\"16%\">&nbsp;</td>");
				out.println("    <td width=\"20%\">&nbsp;</td>");
				out.println("    <td width=\"10%\">");
				out.println("      <div align=\"center\"><b><font face=\"MS Sans Serif\" size=\"2\">Total</font></b></div>");
				out.println("    </td>");
				out.println("    <td width=\"18%\">");
				out.println("      <div align=\"center\"><font face=\"MS Sans Serif\" size=\"2\">"+sum+"</font></div>");
				out.println("    </td>");
				out.println("    <td width=\"5%\">");
				out.println("      <div align=\"center\"><b><font face=\"MS Sans Serif\" size=\"2\">Baht</font></b></div>");
				out.println("    </td>");
				out.println("  </tr>");
				out.println("</table>");
				out.println("  <input type=\"submit\" name=\"Submitr\" value=\"Remove that select\">");
				out.println("</form>");

				out.println("<form method=\"get\" action=\"http://myproject/jservlets/CheckOut\">");
				out.println("<input type=\"hidden\" name=\"sum\" value=\""+sum+"\">");
				out.println("  <input type=\"submit\" name=\"Submit\" value=\"Check out\">");
				out.println("</form>");
				out.println("</TABLE>");
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
						catch (SQLException ignored)	{ }
				}
		}
}
