import java.sql.*;
import java.io.* ;
import javax.servlet.* ;
import javax.servlet.http.* ;

public class RemoveVolume extends HttpServlet {
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
      out.println("     <HTML><HEAD><TITLE>Remove book volume</TITLE></HEAD>       ");
      out.println("    <BODY>                                                ");

      //ToUnicode t=new ToUnicode();

      String book_name = req.getParameter("book_name");
      String volume = req.getParameter("volume");
      String id_book="";
      String temp="";
      boolean ttt=true;

      try
			{
        Class.forName ("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
        //conx = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
        cony = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
			  stmt = conn.createStatement();
        //stmx = conx.createStatement();
        stmy = cony.createStatement();

        if (!(book_name.equals("")) && !(volume.equals(""))){
          rss = stmt.executeQuery("select id_book from cartoon where book_name='"+book_name+"' and volume="+volume);
          if (rss.next()){
            id_book = rss.getString("id_book");
            //out.println("<br>id_book :"+id_book);
            rsx = stmt.executeQuery("select users from read where id_book='"+id_book+"'");
            if (rsx.next()) {
              out.println("<br>Can not remove because of have user rented it ");
              out.println("<br> * "+rsx.getString("users"));
              while (rsx.next()){
                //temp = rsx.getString("users");

                out.println("<br> * "+rsx.getString("users"));
              }
            }else{
              stmy.executeQuery("delete from cartoon where book_name='"+book_name+"' and volume="+volume);
              out.println("<br>Remove complete");
            }
          }else{out.println("<br>No have book_name and volume from cartoon");}
        }else{out.println("<br>book_name or volume must not null");}
        //out.println("Hello");
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
								conn.close();
                }
							}
						catch (SQLException ignored)	{	}
			}
   } // doGet
} // HelloServlet