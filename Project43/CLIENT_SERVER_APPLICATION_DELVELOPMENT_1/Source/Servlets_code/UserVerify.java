import java.util.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class UserVerify extends HttpServlet {

		public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{

			Connection  conn= null;
			Statement   stmtt = null;
			Statement   stmtx = null;
      Statement   stmt1 = null;
			ResultSet   rss = null;
			String      st1 = "",st2 = "",st3="",cradit="";
			java.util.Date d1 = new java.util.Date();
      java.util.Date d2 = new java.util.Date();
			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			HttpSession session = req.getSession(true);
			String user = req.getParameter("textfield");
			String password =  req.getParameter("textfield2");
			String sum = req.getParameter("sum");
			out.println("<HTML><HEAD><TITLE>User Verify</TITLE>");
      out.println("<script language=\"JavaScript\">");
      out.println("<!--");
      out.println(" function openWindow(url){");
      out.println(" myWin=open(url,\"displayWindow\",\"scrollbars,resizable,width=700,height=500\");");
      out.println("}");
      out.println("</script>");
      out.println("</HEAD>");
			out.println("<BODY bgcolor=\"#99cccc\"><H1>User Verify</H1>");
			try
			{
        Class.forName ("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
				stmtt = conn.createStatement();
				stmtx = conn.createStatement();
        stmt1 = conn.createStatement();
				rss = stmtt.executeQuery("select password,cradit from users where users = '"+user+"'");
				if (rss.next()){
					if ((st1=rss.getString("password").trim()).equals(password)){
						cradit = rss.getString("cradit").trim();
            stmt1.executeUpdate("update users set updatetime = "+d2.getTime()*1+" where users = '"+user+"'");
						int sum_int = Integer.parseInt(sum);
						int cradit_int = Integer.parseInt(cradit);
						if (sum_int<cradit_int)	{
							stmtx.executeUpdate("update users set cradit = cradit - "+sum+" where users = '"+user+"'");
							rss = stmtt.executeQuery("select id_book from read where users = '"+user+"'");
							while (rss.next())
							{
								String[] names = session.getValueNames();
								st2 = rss.getString("id_book").trim();
			 ok_point:for (int i=0;i < names.length ;i++ )
								{
									if (st2.equals(names[i]))													//mm/dd/yy
									{
										stmtx.executeUpdate("update read set expire = '"+(d1.getTime()+(3*24*60*60*1000)+(8*60*60*1000))+"' where users = '"+user+"' and id_book = '"+st2+"'");
										session.removeValue(names[i]);
										break ok_point;
									}
								}
							}
							String[] namesxx = session.getValueNames();
							for (int i =0;i<namesxx.length ;i++ )
							{
								stmtx.executeUpdate("insert into read (id_book,users,expire,mark) values ('"+namesxx[i]+ "','"+user+"','"+(d1.getTime()+(3*24*60*60*1000)+(8*60*60*1000))+"','1')");
							}
							for (int i =0;i<namesxx.length ;i++ )
							{
								session.removeValue(namesxx[i]);
							}
							out.println("Record into your database OK");
							out.println("<BR>Do you want to read ?");
              out.println("<BR>Click Login Button");
							//out.println("<br><a href=\"?\"   onClick=\"openWindow('http://myproject/Read.html')\">Read</a> ");
						}
						else {
							out.println("<h2>Sorry! Now your cradit is not enought.</h2>");
							out.println("<br>Your cradit is "+cradit+" ,but your total price is "+sum);
							out.println("<br><h3>You can select one of below </h3>");
							out.println("<br><a href=\"http://myproject/extend.html\" target=\"_blank\">1.Extend your cradit</a>");
							out.println("<br><a href=\"http://myproject/jservlets/Basket\">2.Remove cartoon book from basket</a>");
						}
					}
					else
							out.println("Sorry it's wrong user or password");
				}
				else
					out.println("Sorry it's wrong user or password");
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