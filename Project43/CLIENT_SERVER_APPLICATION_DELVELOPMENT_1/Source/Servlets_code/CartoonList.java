import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class CartoonList extends HttpServlet  {

		public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException {
				Connection	con=null ,conn = null;
				Statement	stmt = null;
				Statement	stmt1 = null;
				ResultSet	rs = null;
				ResultSet	rs1 = null;
				String		st1,st2,st3;

				res.setContentType("text/html;charset=windows-874");
				PrintWriter out = res.getWriter();
				out.println("<BASE HREF=\"http://myproject/\">");
				out.println("<html>");
				out.println("<head>");
				out.println("<link rel=\"stylesheet\" href=\"ftie4style.css\">");
				out.println("	<!-- Infrastructure code for the tree -->");
				out.println("<script src=\"ftiens4.js\"></script>");
				out.println("	<!-- Execution of the code that actually builds the specific tree -->");
				out.println("<script>");
				try {
						Class.forName ("oracle.jdbc.driver.OracleDriver");
						con = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
						stmt = con.createStatement();
						stmt1 = con.createStatement();
						rs = stmt.executeQuery("select distinct book_type from cartoon_details");
						out.println("foldersTree = gFld(\"<i>Cartoon list</i>\")");
						while(rs.next()) {
							st1 = rs.getString("book_type").trim();
							out.println(" aux1 = insFld(foldersTree,gFld(\"" + st1+"\"))");
							rs1 = stmt1.executeQuery("select book_name, book_name_t from cartoon_details where book_type = '"+ st1+"'" );
							while(rs1.next()) {
								st2 = rs1.getString("book_name").trim();st3 = rs1.getString("book_name_t").trim();
								out.println(" insDoc(aux1,gLnk(2,\""+st3+ "\",\"myproject/jservlets/OpenDemo?book_name="+st2+"\"))" );
							}
						}
						out.println("</script>");
						out.println("<script>");
						out.println("		initializeDocument()");
						out.println("</script>");
						out.println("</head>");
						out.println("<BODY>");
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
							if (con != null)
								con.close();
						}
						catch (SQLException ignored)	{	}
				}
	} 
}
