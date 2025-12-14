import common.GlobalVariables;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class WAPListMessage extends HttpServlet
{
	static String EOL = "\r\n";
	public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
		PrintWriter out=res.getWriter();
		String gUsername = req.getParameter("user");
		String gType = req.getParameter("type");
		WriteResponseHeaders(res);
		WriteDeckHeader(out);
		out.println("<card id=\"MessageIndex\">");
		out.print("<p align=\"center\"><i>");
		if (gType.equals("new")){
			out.print("New Message");
		}else if (gType.equals("old")){
			out.print("Old Message");
		}
		out.println("</i></p>");
		out.println("<p><small>");
		out.println("<table columns=\"2\">");
		out.println("<tr><td>Sender</td><td>Subject</td></tr>");
		String path=null;
		if (gType.equals("new"))
		{
			path = GlobalVariables.WAP_USER_PATH + gUsername + "\\message";
		}else if (gType.equals("old")){
			path = GlobalVariables.WAP_USER_PATH + gUsername + "\\message\\old";	
		}
		File pathFile = new File(path);
		if (pathFile.exists())
		{
			String[] files = pathFile.list();
			for (int i=0; i<files.length; i++)
			{
				File file = new File(path, files[i]);
				if (file.isFile())
				{
					FileInputStream fileInStream = new FileInputStream(file);
					DataInputStream inStream = new DataInputStream(fileInStream);
					String line = null;
					String message = "";
					while((line=inStream.readLine())!=null)
					{
						message = message + line;
					}
					MessageParser parser = new MessageParser(message);
					String from_str = parser.get("from");
					String subject_str = parser.get("subject");
					MessageScanner scanner = new MessageScanner();
					subject_str = scanner.scan(subject_str);
					out.println("<tr><td>");
					out.println("<anchor title=\"Read "+from_str+"'s msg\">" + from_str);
					out.println("<go href=\"http://"+GlobalVariables.WEB_SERVER_NAME+"/servlet/WAPReadMessage\" method=\"post\">");
					out.println("<postfield name=\"user\" value=\""+gUsername+"\"/>");
					out.println("<postfield name=\"filename\" value=\""+files[i]+"\"/>");
					if (gType.equals("new"))
					{
						out.println("<postfield name=\"type\" value=\"new\"/>");
					}else if (gType.equals("old")){
						out.println("<postfield name=\"type\" value=\"old\"/>");
					}
					out.println("</go>");
					out.println("</anchor>");
					out.println("</td><td>"+subject_str+"</td></tr>");
					fileInStream.close();
				}
			}
		}
		out.println("</table>");
		out.println("</small></p>");
		out.println("</card>");
		out.println("</wml>");
	}
//******************************************************************
// WriteResponseHeaders
//
// Output the HTTP headers for this response.
//******************************************************************

	public void WriteResponseHeaders(HttpServletResponse res)throws IOException
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

	public void WriteDeckHeader(PrintWriter out)throws IOException
    {
	    out.println (
		  "<?xml version=\"1.0\"?>" + EOL +
	      "<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\"" + EOL +
		  "\"http://www.wapforum.org/DTD/wml_1.1.xml\">" + EOL +
	      "<wml>"
		);      
	}
}
