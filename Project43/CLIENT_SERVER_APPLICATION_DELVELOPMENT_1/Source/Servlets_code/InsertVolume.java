import java.sql.*;
import java.io.* ;
import javax.servlet.* ;
import javax.servlet.http.* ;

public class InsertVolume extends HttpServlet {
	public void doGet ( HttpServletRequest req,HttpServletResponse res
	   ) throws ServletException, IOException {


      Statement   stmt = null;
      Statement   stmx = null;
      ResultSet   rss   = null;
      ResultSet   rsx   = null;
      ResultSet   rsy   = null;
      Connection  conn  = null;
      Connection  conx  = null;

      res.setContentType("text/html;charset=windows-874");
      PrintWriter out = res.getWriter();
      out.println("     <HTML><HEAD><TITLE>Insert New Volume</TITLE></HEAD>       ");
      out.println("    <BODY>                                                ");

      String book_name = req.getParameter("book_name").trim();
      String volume = req.getParameter("volume").trim();
      String page_quantity = req.getParameter("page_quantity").trim();
      String rent_price = req.getParameter("rent_price").trim();
      long id_book=0;
      String id_book_name ="";
      if(isNumber(volume)&&isNumber(page_quantity)&&isNumber(rent_price)){
      try
			{
        Class.forName ("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
        conx = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
			  stmt = conn.createStatement();
        stmx = conx.createStatement();

        if (!(book_name.equals(""))&& !(volume.equals(""))&& !(page_quantity.equals(""))&& !(rent_price.equals(""))){
          rss = stmt.executeQuery("select book_name from cartoon_details where book_name='"+book_name+"'");
          if (rss.next()){

            rsx = stmx.executeQuery("select volume from cartoon where volume="+volume+" and book_name='"+book_name+"'");
            if (!rsx.next()){
              rsy = stmx.executeQuery("select max(id_book) from cartoon");
              if (rsy.next()){
                id_book = rsy.getLong("max(id_book)");
                ++id_book;
                id_book_name = Long.toString(id_book);
              }
              if (!(page_quantity.equals("") && rent_price.equals(""))){
                stmx.executeUpdate("INSERT INTO cartoon VALUES ("+id_book_name+",'"+book_name+"',"+volume+","+page_quantity+","+rent_price+")");
                out.println("<br>Insert new volume complete");
              }else{
                out.println("<br>Sorry page quantity or rent price must not null!!");
              }
            }else{
              out.println("<br>Sorry this volume is already!!");
            }
          }else{
            out.println("<br>Sorry you must insert new book before!!");
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
      }else{
           out.println("Error<br>");
           if(!isNumber(volume))
              out.println("INPUT volume is not Number!<br>");
           if(!isNumber(page_quantity))
              out.println("INPUT page_quantity is not Number!<br>");
           if(!isNumber(rent_price))
              out.println("INPUT rent_price is not Number!<br>");
           out.println("</BODY></HTML> ");
       }
   } // doGet
   public boolean isNumber(String inPut){
          int t=0,index=0;
          t=0;index=0;
          while(index<inPut.length()){
                t=inPut.charAt(index);
                index++;
                if(!(((t-'0')>=0)&&((t-'0')<=9))){
                   return false;
                }
          }
          return true;
   }//isNumber
} // HelloServlet