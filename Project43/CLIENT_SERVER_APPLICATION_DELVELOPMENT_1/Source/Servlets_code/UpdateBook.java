import java.sql.*;
import java.io.* ;
import javax.servlet.* ;
import javax.servlet.http.* ;

public class UpdateBook extends HttpServlet {
	public void doGet ( HttpServletRequest req,HttpServletResponse res
	   ) throws ServletException, IOException {


      Statement   stmt = null;
      Statement   stmx = null;
      ResultSet   rss   = null;
      ResultSet   rsx   = null;
      Connection  conn  = null;
      Connection  conx  = null;

      res.setContentType("text/html;charset=windows-874");
      PrintWriter out = res.getWriter();
      out.println("     <HTML><HEAD><TITLE>Update book</TITLE></HEAD>       ");
      out.println("    <BODY>                                                ");

      //ToUnicode t=new ToUnicode();
      String book_name = req.getParameter("book_name");
      String volume = req.getParameter("volume");
      book_name = book_name.trim();
      volume = volume.trim();

      String book_name_t="";
      String book_type="";
      String book_path="";
      String book_desc="";
      String page_quantity="";
      String rent_price="";

      String temp="";

      if (isNumber(volume)){
      try
			{
        Class.forName ("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
        conx = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
			  stmt = conn.createStatement();
        stmx = conx.createStatement();
        if (!(book_name.equals(""))){
          rss = stmt.executeQuery("select book_name_t,book_type,book_path,book_desc from cartoon_details where book_name='"+book_name+"'");
          if (rss.next()){
            book_name_t = rss.getString("book_name_t").trim();
            book_type = rss.getString("book_type").trim();
            book_path = rss.getString("book_path").trim();
            book_desc = rss.getString("book_desc").trim();
            out.println("<H1>Update book</H1>");
            out.println("<P>");
            out.println("<HR>");
            out.println("<FORM METHOD=get ACTION=\"http://myproject/jservlets/UpdateBookAction\">");
            out.println("Book name:&nbsp;"+book_name);
            out.println("<br>Book name thai:&nbsp;<INPUT TYPE=\"text\" NAME=\"book_name_t\" value=\""+book_name_t+"\">");
            out.println("<br>Book type:&nbsp;<INPUT TYPE=\"text\" NAME=\"book_type\" value=\""+book_type+"\">");
            out.println("<br>Book path:&nbsp;<INPUT TYPE=\"text\" NAME=\"book_path\" value=\""+book_path+"\">");
            out.println("<br>Book description:&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<TEXTAREA NAME=\"book_desc\" ROWS=\"5\" COLS=\"50\">"+book_desc+"</TEXTAREA>");
            out.println("<INPUT TYPE=\"Hidden\" NAME=\"book_name\" value=\""+book_name+"\">");
            out.println("<INPUT TYPE=\"Hidden\" NAME=\"volume\" value=\""+volume+"\">");
            if (!(volume.equals(""))){
              rsx = stmx.executeQuery("select page_quantity,rent_price from cartoon where book_name='"+book_name+"' and volume="+volume);
              if (rsx.next()){
                page_quantity = rsx.getString("page_quantity");
                rent_price = rsx.getString("rent_price");
                out.println("<br>Page quantity:&nbsp;<INPUT TYPE=\"text\" NAME=\"page_quantity\" value=\""+page_quantity+"\">");
                out.println("<br>Rent price:&nbsp;<INPUT TYPE=\"text\" NAME=\"rent_price\" value=\""+rent_price+"\">");
              }
            }else{
                out.println("<INPUT TYPE=\"Hidden\" NAME=\"page_quantity\" value=\"\">");
                out.println("<INPUT TYPE=\"Hidden\" NAME=\"rent_price\" value=\"\">");
            }
            out.println("<br><INPUT TYPE=\"submit\" name=\"Update\" value=\"Update\">");
            out.println("</FORM>");
            out.println("<HR>");
          }else{out.println("<br>Sorry have not a book name");}
        }else{out.println("<br>Sorry book name must not null");}
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
      }else{out.println("<br>Volume must be number");}
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