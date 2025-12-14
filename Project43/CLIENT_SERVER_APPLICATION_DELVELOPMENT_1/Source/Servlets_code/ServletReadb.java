import java.io.*;
import java.util.*;
import java.util.Date;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ServletReadb extends HttpServlet{

		Connection conn = null;
		Statement  stmt = null;
		Statement  stmt2 = null;
		Statement  stmt3 = null;
		Statement  stmt4 = null;
		Statement  stmt5 = null;
    Statement  stmt6 = null;
		ResultSet  rss  = null;
		ResultSet  rss2 = null;
		ResultSet  rss3 = null;
		ResultSet  rss4 = null;

	public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		String username = req.getParameter("user");
		String password = req.getParameter("password");
		String remove_user	= req.getParameter("remove_user");
		String remove_id_book	= req.getParameter("remove_id_book");
		String mark_user = req.getParameter("mark_user");
		String mark_id_book = req.getParameter("mark_id_book");
		String mark_page = req.getParameter("mark_page");
    //String mark_page = req.getParameter("pic");
		Properties p1 = new Properties();
		Properties p2 = new Properties();
		ObjectOutputStream out = new ObjectOutputStream(res.getOutputStream());

		try
			{
        Class.forName ("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
				String book_name = "Doramon";//rss2.getString(1);
				String volume = "1";//rss2.getString(2);
				String expire = "12345";//rss2.getString(3);
				String id_book = "0";
				String book_mark = "1";
				String page_quantity = "1";
				String book_path = "doramon";
				String str_mix = "";
				p2.put("status", "Wrong");
				stmt = conn.createStatement();
				stmt2 = conn.createStatement();
				stmt3 = conn.createStatement();
				stmt4 = conn.createStatement();
				stmt5 = conn.createStatement();
        stmt6 = conn.createStatement();
			int cgmt=0;
			Date d1,d2,d3;Long lg;String exp1="",exp2="";
			if (username!=null){
				rss = stmt.executeQuery("select password from users where users = '"+username+"'");
				if (rss.next())	{
					String ps_table = rss.getString("password").trim();
					if (ps_table.equals(password))	{
            d3 = new Date();
            stmt6.executeUpdate("update users set updatetime = "+d3.getTime()+" where users = '"+username+"'");
						rss2 = stmt2.executeQuery("select id_book, expire, mark from read where users = '"+username+"'");
						int count =0;
						while (rss2.next()){
								id_book = rss2.getString(1).trim();
								expire = rss2.getString(2).trim();
								book_mark = rss2.getString(3).trim();
								rss3 = stmt3.executeQuery("select book_name, volume, page_quantity from cartoon where id_book = "+id_book);
								if (rss3.next()){
									book_name = rss3.getString(1).trim();
									rss4 = stmt4.executeQuery("select book_path from cartoon_details where book_name = '"+book_name+"'");
									if (rss4.next()){
										book_path = rss4.getString(1).trim();
									}
									volume = rss3.getString(2).trim();
									page_quantity = rss3.getString(3).trim();
								}
								//expire = expire+"L";
								lg = new Long(expire);
								d1 = new Date(lg.longValue());
								d2 = new Date();
								if (d1.before(d2)){
									exp2 = "expired";
								}
								else{
									exp1 = d1.toString();
									cgmt = exp1.indexOf("GMT",0);
									exp2 = exp1.substring(0,cgmt);
								}
								str_mix = book_name+"+"+volume+"+"+page_quantity+"+"+book_path+"+"+book_mark+"+"+exp2+"+"+id_book;
								count++;
								p1.put(count+"",str_mix);

						}

						out.writeObject(p1);
					}
					else{
						out.writeObject(p2);
					}
				}
				else {
					out.writeObject(p2);
				}
			}
			if (remove_user!=null){
				stmt.executeUpdate("delete from read where users = '"+remove_user+"' and id_book= '"+remove_id_book+"'");
				out.writeObject("Remove compleate");
			}
			if (mark_page!=null)
				{
					stmt5.executeUpdate("update read set mark = '"+mark_page+"' where id_book = '"+mark_id_book+"' and users = '"+mark_user+"'");
					out.writeObject("Mark compleate");
				}

			}
			catch ( SQLException e ) {
						System.err.println("Could not establish connection.");
			}
			catch ( ClassNotFoundException e ) {
						System.err.println("Could not load database driver.");
			}
			finally {try{
							if (conn != null)
								conn.close();
						}
						catch (SQLException ignored)	{	}
			}
	}
};
