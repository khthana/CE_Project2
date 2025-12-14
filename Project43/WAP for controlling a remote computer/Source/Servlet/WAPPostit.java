import common.GlobalVariables;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.rmi.Naming;
public class WAPPostit extends HttpServlet 
{
	static String EOL = "\r\n";
	static final String url = GlobalVariables.RMI_URL;
	public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
		doPost (req, res );
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		String gWapname = req.getParameter ( "wapname" );
		String gPcname = req.getParameter ( "pcname" );
		String gSubject = req.getParameter ( "subject" );
		String gMessage = req.getParameter ( "message" );

		Connection con=null;

		PrintWriter out=res.getWriter();

		WriteResponseHeaders(res);
		WriteDeckHeader(out);

		// Check wether pcname exists.
		boolean pc_exists = false;
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:WAP_DB","user","passwd");
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("SELECT * FROM PC_User WHERE user_name='" + gPcname.toUpperCase() + "'");
			if (rs.next()){
				pc_exists = true;
			}
		}
		catch (ClassNotFoundException e){
			out.println("Could'n load database driver: " + e.getMessage());
		}
		catch (SQLException e){
			out.println("SQLException caught: " + e.getMessage());
		}
		finally {
			try{
				if (con!=null) con.close();
			}
			catch (SQLException ignored){
			}
		}

		// if exists, post message
		if (pc_exists)
		{
			try{
				ServerInterface server = (ServerInterface)Naming.lookup(url);
				boolean post_ok = server.sendPostIt(gWapname, gPcname, gSubject, gMessage);
				if (post_ok){
					// OK
					out.print("<card>" + EOL);
					out.print("<p>Message has been sent.</p>" + EOL);
					out.print("</card>" + EOL);
				}else{
					// PC is not online
					out.print("<card>" + EOL);
					out.print("<p>" + gPcname + " does not online.</p>" + EOL);
					out.print("<p>This message will be sent when " + gPcname + " online.</p>" + EOL);
					out.print("</card>" + EOL);
					saveMessage(gWapname, gPcname, gSubject, gMessage);
				}
			}catch(Exception e){e.printStackTrace();}	
		}else{
			out.print("<card>" + EOL);
			out.print("<p>" + gPcname + " does not exists.</p>");
			out.print("</card>" + EOL);
		}
		out.print("</wml>");
	}

//******************************************************************
// WriteResponseHeaders
//
// Output the HTTP headers for this response.
//******************************************************************

    public void WriteResponseHeaders
    ( 
    HttpServletResponse res
    )
    throws
    IOException
    {
// Output the content type.
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

  public void WriteDeckHeader
    ( 
    PrintWriter out
    )
    throws
    IOException
    {

    out.println ( 
      "<?xml version=\"1.0\"?>" + EOL +
      "<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\"" + EOL +
      "\"http://www.wapforum.org/DTD/wml_1.1.xml\">" + EOL +
      "<wml>"
    );      
  }
//*******************************************************************
	void saveMessage(String gWapname, String gPcname, String gSubject, String gMessage)
	{
		try
		{
			String path = GlobalVariables.PC_USER_PATH + gPcname;
			File outPath = new File(path);
			if (!(outPath.exists()))
			{
				outPath.mkdirs();
			}
			File outFile = new File(outPath, "test.xml");
			PrintStream outStream = new PrintStream(new FileOutputStream(outFile));
			outStream.println("<?xml version=\"1.0\"?>");
			outStream.println("<note date=\"" + (new java.util.Date()).toGMTString() + "\">");
			outStream.println("<from>" + gWapname + "</from>");
			outStream.println("<to>" + gPcname + "</to>");
			outStream.println("<head>" + gSubject + "</head>");
			outStream.println("<body>" + gMessage + "</body>");
			outStream.println("</note>");
			outStream.close();
		}catch(IOException ioe){
			System.out.println(ioe);
		}
	}

}
