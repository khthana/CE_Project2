import java.sql.*;
import java.io.* ;
import javax.servlet.* ;
import javax.servlet.http.* ;

public class RemoveBook extends HttpServlet {
	public void doGet ( HttpServletRequest req,HttpServletResponse res
	   ) throws ServletException, IOException {


      Statement   stmt = null;
      //Statement   stmx = null;
      Statement   stmy = null;
      ResultSet   rss   = null;
      ResultSet   rsx   = null;
      Connection  conn  = null;
      //Connection  conx  = null;
      Connection  cony  = null;

      res.setContentType("text/html;charset=windows-874");
      PrintWriter out = res.getWriter();
      out.println("     <HTML><HEAD><TITLE>Remove book</TITLE></HEAD>       ");
      out.println("    <BODY>                                                ");

      //ToUnicode t=new ToUnicode();

      String book_name = req.getParameter("book_name");
      //String volume = req.getParameter("volume");
      String id_book="";
      String temp="";
      boolean ttt=true;
      boolean haveuser=false;

      try
			{
        Class.forName ("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
        //conx = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
        cony = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
			  stmt = conn.createStatement();
        //stmx = conx.createStatement();
        stmy = cony.createStatement();

        if (!(book_name.equals(""))){
         rss = stmt.executeQuery("select id_book from cartoon where book_name = '"+book_name+"'");
outloop: while (rss.next()){
          id_book = rss.getString("id_book");
          rsx = stmy.executeQuery("select user from read where id_book= '"+id_book+"'");
          if (rsx.next()){
            haveuser = true;
            break outloop;
          }
         }
        if (!haveuser){
          rss = stmt.executeQuery("select book_name_t from cartoon_details where book_name='"+book_name+"'");
          if (rss.next()){
            cony.setAutoCommit(false);
            stmy.executeQuery("delete from cartoon_details where book_name='"+book_name+"'");
            rsx = stmt.executeQuery("select id_book from cartoon where book_name='"+book_name+"'");
            if (rsx.next()) {
              stmy.executeQuery("delete from cartoon where book_name='"+book_name+"'");
            }
            cony.commit();
            out.println("<br>Remove complete");
          }else{out.println("<br>No have book_name from cartoon");}
        }else{out.println("<br>The book had rented!!");}
       }else{out.println("<br>book name must not null");}
       out.println("   </BODY></HTML> ");
			}
      catch ( SQLException e ) {
						System.err.println("Could not establish connection.");
            out.println("e1");
			}
			catch ( ClassNotFoundException e ) {
						System.err.println("Could not load database driver.");
            out.println("e2");
      }
			finally {
						try{
							if (conn != null){
								conn.close();cony.close();
                }
							}
						catch (SQLException ignored)	{	}
			}
   } // doGet
} // HelloServlet