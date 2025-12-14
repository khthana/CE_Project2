import java.net.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class  WAPSendMail extends HttpServlet
{
	static String EOL = "\r\n";
	String gFrom = null;
	String gTo = null;
	String gSubject = null;
	String gMessage = null;
	PrintWriter out = null;
	String result = "";
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		out=res.getWriter();
		gFrom = req.getParameter("from");
		gTo = req.getParameter("to");
		gSubject = req.getParameter("subject");
		gMessage = req.getParameter("message");

		String post_message = "FromAddr="+gFrom+"&ToAddr="+gTo+"&Subject="+gSubject+"&Detail="+gMessage;
		String hostName = "161.246.4.3";
		int port = 80;

		WriteResponseHeaders(res);
		WriteDeckHeader(out);

		try{
		// Open a client socket connection
		Socket clientSocket = new Socket(hostName, port);
		// Acquire the input and output streams
		DataOutputStream outbound = new DataOutputStream( clientSocket.getOutputStream() );
		BufferedReader inbound = new BufferedReader( new InputStreamReader(clientSocket.getInputStream()) );
		// Write the HTTP request to the server
		outbound.writeBytes("POST /~s0010705/mail-form.cgi HTTP/1.1\r\n");
		outbound.writeBytes("Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/vnd.ms-excel, application/msword, application/vnd.ms-powerpoint, */*\r\n");
		outbound.writeBytes("Accept-Language: th\r\n");
		outbound.writeBytes("Content-Type: application/x-www-form-urlencoded\r\n");
		outbound.writeBytes("Content-Length: " + post_message.length() + "\r\n");
		outbound.writeBytes("Accept-Encoding: gzip, deflate\r\n");
		outbound.writeBytes("User-Agent: Mozilla/4.0 (compatible; MSIE 5.0; Windows 98; DigExt)\r\n");
		outbound.writeBytes("Host: "+hostName+"\r\n");
		outbound.writeBytes("Connection: Keep-Alive\r\n");
		outbound.writeBytes("\r\n");
		outbound.writeBytes(post_message);
	
		String responseLine=null;
		while ((responseLine = inbound.readLine()) != null)
		{
			// skip
		}
		// Clean up
		outbound.close();
		inbound.close();
		clientSocket.close();
		out.println("<card id=\"sent\">");
		out.println("<p>Mail has been sent.</p>");
		out.println("</card>");
		}catch(Exception e){
			e.printStackTrace();
			out.println("<card id=\"error\">");
			out.println("<p>Error occured while sending mail.</p>");
			out.println("</card>");
		}
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