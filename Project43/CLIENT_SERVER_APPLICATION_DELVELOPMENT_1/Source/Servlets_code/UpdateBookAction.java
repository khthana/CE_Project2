import java.sql.*;
import java.io.* ;
import javax.servlet.* ;
import javax.servlet.http.* ;

public class UpdateBookAction extends HttpServlet {
	public void doGet ( HttpServletRequest req,HttpServletResponse res
	   ) throws ServletException, IOException {


      Statement   stmt = null;
      Statement   stmx = null;
      ResultSet   rss   = null;
      Connection  conn  = null;
      Connection  conx  = null;


      res.setContentType("text/html;charset=windows-874");
      PrintWriter out = res.getWriter();
      out.println("     <HTML><HEAD><TITLE>Update book</TITLE></HEAD>       ");
      out.println("    <BODY>                                                ");

      ToUnicode t=new ToUnicode();
      String book_name = req.getParameter("book_name").trim();
      String book_name_t = req.getParameter("book_name_t").trim();
      String book_type = req.getParameter("book_type").trim();
      String book_path = req.getParameter("book_path").trim();
      String book_desc = req.getParameter("book_desc").trim();
      String page_quantity = req.getParameter("page_quantity");
      String rent_price = req.getParameter("rent_price");
      String volume = req.getParameter("volume");
      book_name = t.toUnicode(book_name);
      book_name_t = t.toUnicode(book_name_t);
      book_type = t.toUnicode(book_type);
      book_path = t.toUnicode(book_path);
      book_desc = t.toUnicode(book_desc);
      if (!page_quantity.equals("")&& !page_quantity.equals(null)){
        page_quantity = t.toUnicode(page_quantity);
      }
      if (!rent_price.equals("")&& !rent_price.equals(null)){
        rent_price = t.toUnicode(rent_price);
      }
      if (!volume.equals("")&& !volume.equals(null)){
        volume = t.toUnicode(volume);
      }
      if (isNumber(page_quantity)&& isNumber(rent_price)){
      try
			{
        Class.forName ("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
        conx = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
			  stmt = conn.createStatement();
        stmx = conx.createStatement();

        if (!(book_type.equals("")) && !(book_path.equals(""))){
          //conn.setAutoCommit(false);
          stmt.executeUpdate("update cartoon_details set book_name_t='"+book_name_t+"',book_type='"+book_type+"',book_path='"+book_path+"',book_desc='"+book_desc+"' where book_name='"+book_name+"'");
          if (!(page_quantity.equals(""))&& !(rent_price.equals(""))&& !(volume.equals(""))){
            stmt.executeUpdate("update cartoon set page_quantity='"+page_quantity+"',rent_price='"+rent_price+"' where book_name='"+book_name+"' and volume='"+volume+"'");
          }
          //conn.commit();
          out.println("<br>Update complete");
        }else{
          out.println("<br>Sorry must not null!!");
        }
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
      }else{
       out.println("<br>Page quantity or Rent price must be number");
      }
   } // doGet
   public boolean isNumber(String inPut){
          int t=0,index=0;
          t=0;index=0;
          if (!inPut.equals("")) {
            while(index<inPut.length()){
                t=inPut.charAt(index);
                index++;
                if(!(((t-'0')>=0)&&((t-'0')<=9))){
                   return false;
                }
            }
          }
          return true;
   }//isNumber
} // HelloServlet