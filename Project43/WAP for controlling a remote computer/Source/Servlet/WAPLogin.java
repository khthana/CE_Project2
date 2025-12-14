import common.GlobalVariables;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.rmi.Naming;
public class  WAPLogin extends HttpServlet {
	static String EOL = "\r\n";
	static final String url = GlobalVariables.RMI_URL;
	public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
		doPost (req, res );
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;

		PrintWriter out=res.getWriter();

		try{
			String gLogin = req.getParameter ( "login" );
			String gPasswd = req.getParameter ( "passwd" );

			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:WAP_DB","user","passwd");
			stmt=con.createStatement();
			rs=stmt.executeQuery("SELECT * FROM WAP_User WHERE user_name='" + gLogin.toUpperCase() + "' AND password='" + gPasswd + "'");
			WriteResponseHeaders(res);
			WriteDeckHeader(out);
			if (rs.next()){
				showService(out, con, gLogin, gPasswd);
			}else out.println("<card id=\"fail\"><p>Wrong username or password.</p></card>");
		}
		catch (ClassNotFoundException e){
			out.println("Could'n load database driver: " + e.getMessage());
		}
		catch (SQLException e){
			out.println("SQLException caught: " + e.getMessage());
		}
		finally {
		     out.print ( "</wml>" );
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

	void showService(PrintWriter out, Connection con, String WAP_name, String WAP_passwd)throws IOException
	{
		String path = GlobalVariables.WAP_USER_PATH + WAP_name + "\\message";
		File pathFile = new File(path);
		int msg_count=0;
		if (pathFile.exists())
		{
			String[] files = pathFile.list();
			for (int i=0; i<files.length; i++)
			{
				if ((new File(path, files[i])).isFile())
				{
					msg_count++;
				}
			}
		}
		String read_msg_url = "http://" + GlobalVariables.WEB_SERVER_NAME + "/servlet/WAPListMessage";
		out.print("<card id=\"service\" newcontext=\"false\" ordered=\"true\">" + EOL);
		out.print("<p align=\"left\">Select Service :-" + EOL);
		out.print("<br/>" + EOL);
		out.print("<anchor title=\"read message\">Unread Message[" + (new Integer(msg_count)).toString() + "]" + EOL);
		out.print("<go href=\""+read_msg_url+"\" method=\"post\">" + EOL);
		out.print("<postfield name=\"user\" value=\""+WAP_name+"\"/>" + EOL);
		out.print("<postfield name=\"type\" value=\"new\"/>" + EOL);
		out.print("</go>" + EOL);
		out.print("</anchor>" + EOL);

		out.print("<anchor title=\"read message\">Old Message" + EOL);
		out.print("<go href=\""+read_msg_url+"\" method=\"post\">" + EOL);
		out.print("<postfield name=\"user\" value=\""+WAP_name+"\"/>" + EOL);
		out.print("<postfield name=\"type\" value=\"old\"/>" + EOL);
		out.print("</go>" + EOL);
		out.print("</anchor>" + EOL);

		out.print("<a href=\"#postit\" title=\"post message\">Post It</a>" + EOL);
		out.print("<a href=\"http://" + GlobalVariables.WEB_SERVER_NAME + "/WAP/sendmail.wml\" title=\"send e-mail\">Send Mail</a>" + EOL);
		out.print("<a href=\"http://" + GlobalVariables.WEB_SERVER_NAME + "/WAP/sendpager.wml\" title=\"send pager\">Send Pager</a>" + EOL);
		out.print("<a href=\"#transferfile\" title=\"transfer file\">Transfer File</a>" + EOL);

		String view_file_url = "http://" + GlobalVariables.WEB_SERVER_NAME + "/servlet/WAPViewFile";
		out.print("<anchor title=\"view file\">View File" + EOL);
		out.print("<go href=\""+view_file_url+"\" method=\"post\">" + EOL);
		out.print("<postfield name=\"wapname\" value=\""+WAP_name+"\"/>" + EOL);
		out.print("<postfield name=\"wappswd\" value=\""+WAP_passwd+"\"/>" + EOL);
		out.print("</go>" + EOL);
		out.print("</anchor>" + EOL);

		String exec_command_url = "http://" + GlobalVariables.WEB_SERVER_NAME + "/servlet/WAPExecCommand";
		out.print("<anchor title=\"execute command\">Command" + EOL);
		out.print("<go href=\""+exec_command_url+"\" method=\"post\">" + EOL);
		out.print("<postfield name=\"wapname\" value=\""+WAP_name+"\"/>" + EOL);
		out.print("<postfield name=\"wappswd\" value=\""+WAP_passwd+"\"/>" + EOL);
		out.print("</go>" + EOL);
		out.print("</anchor>" + EOL);

		out.print("</p>");
		out.print("</card>" + EOL);

		// Post It Card
		out.print("<card id=\"postit\" newcontext=\"false\" ordered=\"true\">" + EOL);
		out.print("<do type=\"accept\" label=\"submit\" optional=\"false\">" + EOL);
		out.print("<go href=\"http://"+GlobalVariables.WEB_SERVER_NAME+"/servlet/WAPPostit\" method=\"post\" sendreferer=\"false\">" + EOL);
		out.print("<postfield name=\"wapname\" value=\"" + WAP_name  + "\"/>" + EOL);
		out.print("<postfield name=\"pcname\" value=\"$pcname\"/>" + EOL);
		out.print("<postfield name=\"subject\" value=\"$subject\"/>" + EOL);
		out.print("<postfield name=\"message\" value=\"$message\"/>" + EOL);
		out.print("</go>" + EOL);
		out.print("</do>" + EOL);
		out.print("<p align=\"left\">PC&apos;s name" + EOL);
		out.print("<br/><input name=\"pcname\" type=\"text\" emptyok=\"false\"/>" + EOL);
		out.print("Subject :" + EOL);
		out.print("<br/><input name=\"subject\" type=\"text\" emptyok=\"false\"/>" + EOL);
		out.print("Message :" + EOL);
		out.print("<br/><input name=\"message\" type=\"text\" emptyok=\"false\"/>" + EOL);
		out.print("</p>" + EOL);
		out.print("</card>" + EOL);

		// File Transfer Card
		out.print("<card id=\"transferfile\" newcontext=\"false\" ordered=\"true\">" + EOL);
		out.print("<p align=\"center\"><i>Transfer file</i></p>");
		out.print("<p>");
		out.print("<anchor title=\"Transfer file to PC\">To PC" + EOL);
		out.print("<go href=\"http://"+GlobalVariables.WEB_SERVER_NAME+"/servlet/WAPFileTransfer\" method=\"post\" sendreferer=\"false\">" + EOL);
		out.print("<postfield name=\"wapname\" value=\"" + WAP_name + "\"/>" + EOL);
		out.print("<postfield name=\"wappswd\" value=\"" + WAP_passwd + "\"/>" + EOL);
		out.print("<postfield name=\"transfertype\" value=\"topc\"/>" + EOL);
		out.print("</go>" + EOL);
		out.print("</anchor>" + EOL);

		out.print("<anchor title=\"Transfer file from PC\">From PC" + EOL);
		out.print("<go href=\"http://"+GlobalVariables.WEB_SERVER_NAME+"/servlet/WAPFileTransfer\" method=\"post\" sendreferer=\"false\">" + EOL);
		out.print("<postfield name=\"wapname\" value=\"" + WAP_name + "\"/>" + EOL);
		out.print("<postfield name=\"wappswd\" value=\"" + WAP_passwd + "\"/>" + EOL);
		out.print("<postfield name=\"transfertype\" value=\"frompc\"/>" + EOL);
		out.print("</go>" + EOL);
		out.print("</anchor>" + EOL);
		out.print("</p>");
		out.print("</card>" + EOL);
	}
}
