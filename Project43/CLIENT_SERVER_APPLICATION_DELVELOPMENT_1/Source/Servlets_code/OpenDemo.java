import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class OpenDemo extends HttpServlet{
        Connection	conn= null;
				Connection	connn = null;
        Connection	conx = null;
				Statement	  stmtt = null;
				Statement	  stmtt1 = null;
        Statement	  stmx = null;
				ResultSet	  rss = null;
				ResultSet	  rss1 = null;
        ResultSet	  rsx = null;
				String		  book_name_t = "";
				String		  book_desc   = "";
				String		  book_path	= "";
				String[]	  st4 = new String[20];
        String      book_name = "";
        String      temp="";
				int			    countbook = 0;

		public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException {

        String		book_name_temp = req.getParameter("book_name");
        book_name = book_name_temp;

				res.setContentType("text/html;charset=windows-874");
				PrintWriter out = res.getWriter();
 				try {
						Class.forName ("oracle.jdbc.driver.OracleDriver");
						conn = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
						connn = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
            conx = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
						findDesc();
            stmx = conx.createStatement();
						out.println("<BASE HREF=\"http://myproject/\">");
						out.println("<html>");
						out.println("<head>");
						out.println("<title>Untitled Document</title>");
						out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">");
						out.println("</head>");
						out.println("<body bgcolor=\"#99cccc\">");
						out.println("<table width=\"96%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">");
						out.println("  <tr> ");
						out.println("    <td colspan=\"2\">");
						out.println("      <p align=\"center\"><font face=\"MS Sans Serif\"><b>"+book_name_t+"</b></font></p>");
						out.println("      <hr align=\"center\">");
						out.println("    </td>");
						out.println("  </tr>");
						out.println("  <tr> ");
						out.println("    <td rowspan=\"2\" align=\"left\" valign=\"top\" width=\"49%\">");
						out.println("      <div align=\"center\"><img src=\"images/"+book_path+"/demo.jpg\" width=\"353\" height=\"527\">&nbsp;&nbsp;</div>");
						out.println("    </td>");
						out.println("    <td width=\"51%\" height=\"173\" align=\"left\" valign=\"top\">");
						out.println("      <p>&nbsp;&nbsp;<font face=\"MS Sans Serif\" size=\"3\"><b>Description :</b></font></p>");
						out.println("      <p><font face=\"MS Sans Serif\" size=\"2\">"+book_desc+"</font></p>");
						out.println("      <p>&nbsp;</p>");
						out.println("    </td>");
						out.println("  </tr>");
						out.println("  <tr> ");
						out.println("    <td width=\"51%\" height=\"288\" align=\"left\" valign=\"top\">");
						out.println("      <p>&nbsp;&nbsp;&nbsp;<b><font face=\"MS Sans Serif\" size=\"3\">Select the book</font></b></p>");
						out.println("      <form method=\"get\" action=\"http://myproject/jservlets/Basket\">");
						out.println("        <p> <font face=\"MS Sans Serif\" size=\"2\">");
						for (int i=1;i<=countbook ;i++ )
						{
							out.println("          <input type=\"checkbox\" name=\"checkbox\" value=\""+st4[i]+"\">");
              rsx = stmx.executeQuery("select volume from cartoon where id_book="+st4[i]);
              if (rsx.next()){
                temp = rsx.getString("volume");
							  out.println("          Book "+temp+" ");
              }
						}
            countbook = 0;
						out.println("        <p> <font face=\"MS Sans Serif\" size=\"2\">");
						out.println("          <input type=\"submit\" name=\"Submit\" value=\"Add to basket\">");
						out.println("          <input type=\"submit\" name=\"Submit\" value=\"Check basket\">");
						out.println("          </font></p>");
						out.println("        </form>");
						out.println("    </td>");
						out.println("  </tr>");
						out.println("</table>");
						out.println("<div align=\"center\"></div>");
						out.println("</body>");
						out.println("</html>");
				}
				catch ( SQLException e ) {
						System.err.println("Could not establish connection.");
				}
				catch ( ClassNotFoundException e ) {
						System.err.println("Could not load database driver.");
				}
 				finally {
						try{
							if (conn != null){
								conn.close();connn.close();
								}
						}
						catch (SQLException ignored)	{ }
				}

	}
  	public void findDesc(){

        try {
            stmtt = conn.createStatement();
						stmtt1 = connn.createStatement();

						rss = stmtt.executeQuery("select book_name_t, book_desc, book_path from cartoon_details where book_name = '"+book_name+"'");
						while(rss.next()){
							book_name_t = rss.getString("book_name_t").trim();
							book_desc = rss.getString("book_desc").trim();
							book_path = rss.getString("book_path").trim();
						}

						rss1 = stmtt1.executeQuery("select id_book from cartoon where book_name = '"+book_name+"'");
						while(rss1.next()){
							st4[countbook + 1] = rss1.getString("id_book").trim();
							countbook += 1;
						}
        }
       catch ( SQLException e ) {
						System.err.println("Could not establish connection.");

  			}

	  }
}
