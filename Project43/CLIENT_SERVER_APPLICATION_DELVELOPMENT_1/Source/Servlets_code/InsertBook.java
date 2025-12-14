import java.sql.*;
import java.io.* ;
import javax.servlet.* ;
import javax.servlet.http.* ;

public class InsertBook extends HttpServlet {
	public void doGet ( HttpServletRequest req,HttpServletResponse res
	   ) throws ServletException, IOException {


      Statement   stmt = null;
      Statement   stmx = null;
      ResultSet   rss   = null;
      Connection  conn  = null;
      Connection  conx  = null;

      res.setContentType("text/html;charset=windows-874");
      PrintWriter out = res.getWriter();
      out.println("     <HTML><HEAD><TITLE>Insert new book</TITLE></HEAD>       ");
      out.println("    <BODY>                                                ");

      ToUnicode t=new ToUnicode();
      String book_name = req.getParameter("book_name");
      String book_name_t = "";
      String ttt = req.getParameter("book_name_t");
      if (!(ttt.equals(""))){
        book_name_t = t.toUnicode(ttt);
      }
      String book_type = req.getParameter("book_type");
      String book_path = req.getParameter("book_path");
      String book_desc = "";
      String yyy = req.getParameter("book_desc");
      if (!(yyy.equals(""))) {
        book_desc = t.toUnicode(yyy);
      }


      try
			{
        Class.forName ("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
        conx = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
			  stmt = conn.createStatement();
        stmx = conx.createStatement();
        if (!(book_name.equals(""))&& !(book_name_t.equals(""))&& !(book_type.equals(""))&& !(book_path.equals(""))&& !(book_desc.equals(""))){
          rss = stmt.executeQuery("select book_name from cartoon_details where book_name='"+book_name+"'");
          if (rss.next()){
              out.println("<br>Sorry this book is already! ");
          }else{
              stmx.executeUpdate("INSERT INTO cartoon_details VALUES ('"+book_name+"','"+book_name_t+"','"+book_type+"','"+book_path+"','"+book_desc+"'"+")");
              out.println("<br>Insert complete");
              out.println("<br><a href='http://myproject/insertvol.html' target='_parent'>Do you want to insert new volume?</a>");
          }
        }else{out.println("<br>All field must not null");}

        out.println("   </BODY></HTML> ");
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
   } // doGet
} // HelloServlet