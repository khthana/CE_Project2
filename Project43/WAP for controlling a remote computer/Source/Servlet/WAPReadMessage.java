import common.GlobalVariables;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class WAPReadMessage extends HttpServlet
{
	static String EOL = "\r\n";
	public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		PrintWriter out=res.getWriter();
		String gUsername = req.getParameter("user");
		String gFilename = req.getParameter("filename");
		String gType = req.getParameter("type");
		WriteResponseHeaders(res);
		WriteDeckHeader(out);

		String path=null;
		if (gType.equals("new"))
		{
			path = GlobalVariables.WAP_USER_PATH + gUsername + "\\message";
		}else if (gType.equals("old")){
			path = GlobalVariables.WAP_USER_PATH + gUsername + "\\message\\old";	
		}
		File file = new File(path, gFilename);
		if (file.exists())
		{
			FileInputStream fileInStream = new FileInputStream(file);
			DataInputStream inStream = new DataInputStream(fileInStream);
			String line = null;
			String message = "";
			while((line=inStream.readLine())!=null)
			{
				message = message + line + EOL;
			}
			fileInStream.close();
			MessageParser parser = new MessageParser(message);
			String from_str = parser.get("from");
			String subject_str = parser.get("subject");
			String date_str = parser.get("date");
			String msg_str = parser.get("message");
			MessageScanner scanner = new MessageScanner();
			subject_str = scanner.scan(subject_str);
			msg_str = scanner.scan(msg_str);

			out.println("<card id=\"Message\">");
			out.println("<p mode=\"wrap\">");
			out.println("<b>From</b>: " + from_str + "<br/>");
			out.println("<b>Subject</b>: " + subject_str + "<br/>");
			out.println("<b>Date</b>: " + date_str + "<br/>");
			out.println("<b>Message</b>: " + msg_str);
			out.println("</p>");
			out.println("<p>");
			String manage_msg_url = "http://" + GlobalVariables.WEB_SERVER_NAME + "/servlet/WAPManageMessage";
			out.println("<anchor title=\"save message as file\">Save As File..");
			out.println("<go href=\""+manage_msg_url+"\" method=\"post\">");
			out.println("<postfield name=\"user\" value=\""+gUsername+"\"/>");
			out.println("<postfield name=\"filename\" value=\""+gFilename+"\"/>");
			out.println("<postfield name=\"tx\" value=\"save\"/>");
			out.println("</go>");
			out.println("</anchor>");
			out.println("<anchor title=\"delete message\">Delete");
			out.println("<go href=\""+manage_msg_url+"\" method=\"post\">");
			out.println("<postfield name=\"user\" value=\""+gUsername+"\"/>");
			out.println("<postfield name=\"filename\" value=\""+gFilename+"\"/>");
			out.println("<postfield name=\"tx\" value=\"del\"/>");
			out.println("</go>");
			out.println("</anchor>");
			if (gType.equals("old"))
			{
				out.println("<anchor title=\"delete all message\">Delete All");
				out.println("<go href=\""+manage_msg_url+"\" method=\"post\">");
				out.println("<postfield name=\"user\" value=\""+gUsername+"\"/>");
				out.println("<postfield name=\"tx\" value=\"delall\"/>");
				out.println("</go>");
				out.println("</anchor>");
			}
			out.println("</p>");
			out.println("</card>");
			out.println("</wml>");
			if (gType.equals("new"))
			{
				// move message to old directory
				String oldMsg_path = GlobalVariables.WAP_USER_PATH + gUsername + "\\message\\old";
				File old_path = new File(oldMsg_path);
				if (!(old_path.exists()))
				{
					old_path.mkdir();
				}
				File oldMsg = new File(old_path, gFilename);
				FileInputStream fileInStream2 = new FileInputStream(file);
				DataInputStream inStream2 = new DataInputStream(fileInStream2);
				byte[] byte_file = new byte[(new Long(file.length())).intValue()];
				inStream2.readFully(byte_file);
				fileInStream2.close();
				PrintStream outStream = new PrintStream(new FileOutputStream(oldMsg));
				outStream.write(byte_file, 0, byte_file.length);
				outStream.close();
				file.delete();
			}
		}else{
			out.println("<card id=\"error\">");
			out.println("<p>Message not found.</p>");
			out.println("</card>");
			out.println("</wml>");
		}
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
