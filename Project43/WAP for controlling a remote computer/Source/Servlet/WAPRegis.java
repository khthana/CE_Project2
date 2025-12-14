import common.GlobalVariables;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class  WAPRegis extends HttpServlet {
	static String EOL = "\r\n";
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		PrintWriter out=res.getWriter();

		WriteResponseHeaders(res);
		WriteDeckHeader(out);
		try{
			String gLogin = req.getParameter ( "login" );
			String gPasswd = req.getParameter ( "passwd" );

			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:WAP_DB","user","passwd");
			stmt=con.createStatement();
			rs=stmt.executeQuery("SELECT * FROM WAP_User WHERE user_name='" + gLogin.toUpperCase() + "'");
			if (rs.next()){
				out.println("<p>" + gLogin+ " is duplicate.<br/>Select another Login name.");
			}else {
				MessageScanner scanner = new MessageScanner();
				if (scanner.verifyLogin(gLogin)){
					Statement stmt2=con.createStatement();
					int count=stmt2.executeUpdate("INSERT INTO WAP_User VALUES ('" + gLogin.toUpperCase() + "','" + gPasswd + "')");
					out.println("<p>Register Successful.<br/>Login name : " + gLogin + "<br/>Password : " + gPasswd);
				}else{
					out.println("<p><i>Login name Error</i><br/>Please create name with only<br/>[A-Z],[a-z],[0-9],_.");
				}
			}
		}
		catch (ClassNotFoundException e){
			out.println("<p>Could'n load database driver: " + e.getMessage());
		}
		catch (SQLException e){
			out.println("<p>SQLException caught: " + e.getMessage());
		}
		finally {
			out.print("<do type=\"accept\" label=\"OK\" optional=\"false\">" + EOL);
			out.print("<go href=\"http://"+GlobalVariables.WEB_SERVER_NAME+"/WAP/index.wml\" method=\"get\" sendreferer=\"false\">" + EOL);
			out.print("</go>" + EOL + "</do>");
		    out.print("</p>" + EOL + "</card>" + EOL + "</wml>" );
			try{
				if (con!=null) con.close();
			}
			catch (SQLException ignored){
			}
		}
	}

//******************************************************************
// WriteResponseHeaders
//
// Output the HTTP headers for this response.
//******************************************************************

    public void WriteResponseHeaders(HttpServletResponse res)throws IOException{
// Output the content type

	res.setContentType("text/vnd.wap.wml");

// Output the cache control header first.

    res.setHeader ( "Cache-Control", "no-cache" );

 // Output the Date header.
    
    java.util.Date now     = new java.util.Date ();
    long nowTime = now.getTime ();
    res.setDateHeader ( "Date", nowTime );
	}



//******************************************************************
// WriteDeckheader
//
// Output the beginning of a WML deck.
//******************************************************************

  public void WriteDeckHeader(PrintWriter out)throws IOException{
    out.println ( 
      "<?xml version=\"1.0\"?>" + EOL +
      "<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\"" + EOL +
      "\"http://www.wapforum.org/DTD/DTD/wml_1.1.xml\">" + EOL +
      "<wml>" + EOL +
      "<card id=\"searchResult\" >"
    );      
  }

}
