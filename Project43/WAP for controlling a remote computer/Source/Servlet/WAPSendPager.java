import java.io.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class WAPSendPager extends HttpServlet
{
	static String EOL = "\r\n";
	String gService = null;
	String gNumber = null;
	String gPasswd = null;
	String gBody = null;
	String gFrom = null;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		PrintWriter out=res.getWriter();
		gService = req.getParameter("service");
		gNumber = req.getParameter("no");
		gPasswd = req.getParameter("passwd");
		gBody = req.getParameter("body");
		gFrom = req.getParameter("from");

		String post_message = "from="+gFrom+"&service="+gService+"&no="+gNumber+"&passwd="+gPasswd+"&count="+gBody.length()+"&body="+gBody;
		post_message = post_message+"&days=now&months=now&years=now&hour=now&min=now&temp_type=main&submit.x=0&submit.y=0";

		String hostName = "www.sabye.com";
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
		outbound.writeBytes("POST /pager/cgi-bin/pager.cgi HTTP/1.1\r\n");
		outbound.writeBytes("Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/vnd.ms-excel, application/msword, application/vnd.ms-powerpoint, */*\r\n");
		outbound.writeBytes("Accept-Language: th\r\n");
		outbound.writeBytes("Content-Type: application/x-www-form-urlencoded\r\n");
		outbound.writeBytes("Content-Length: " + post_message.length() + "\r\n");
		outbound.writeBytes("Accept-Encoding: gzip, deflate\r\n");
		outbound.writeBytes("User-Agent: Mozilla/4.0 (compatible; MSIE 5.0; Windows 98; DigExt)\r\n");
		outbound.writeBytes("Host: "+hostName+"\r\n");
		outbound.writeBytes("Referer: http://www.sabye.com/pager/\r\n");
		outbound.writeBytes("Connection: Keep-Alive\r\n");
		outbound.writeBytes("\r\n");
		outbound.writeBytes(post_message);
	
		String text="";
		String responseLine=null;
		while ((responseLine = inbound.readLine()) != null)
		{
			text = text + responseLine;
		}

		// Clean up
		outbound.close();
		inbound.close();
		clientSocket.close();
		String result = getResult(text);
		out.println("<card id=\"sent\">");
		out.println("<p>" + result + "</p>");
		out.println("</card>");
		}catch(Exception e){
			e.printStackTrace();
			out.println("<card id=\"error\">");
			out.println("<p>Error occured while sending message.</p>");
			out.println("</card>");
		}
		out.println("</wml>");
	}

	String getResult(String text)
	{
		int start_index=0;
		for (int i=0; i<3; i++)
		{
			int index = text.indexOf("<TD>", start_index);
			if (index == -1)
			{
				return("Unknown error occurred.");
			}
			start_index = index + (new String("<TD>")).length();
		}
		start_index = text.indexOf("<center>", start_index);
		start_index = start_index + (new String("<center>")).length();
		if (start_index == -1)
		{
			return("Unknown error occurred.");
		}
		int end_index = text.indexOf("</CENTER>", start_index);
		if (end_index == -1)
		{
			return("Unknown error occurred");
		}
		String result = text.substring(start_index, end_index);
		if (result.equals("<!-- Status -->ส่งได้"))
		{
			return("Message has been sent");		
		}else if (result.equals("ส่งได้"))
		{
			return("Message has been sent");
		}else if (result.equals("มีข้อผิดพลาดครับ"))
		{
			return("Server is not ready");
		}else if (result.equals("ไม่ได้สมัคร"))
		{
			return("You must subscribe with your pager provider");
		}else if (result.equals("ระงับใช้"))
		{
			return("Pager is held over");
		}else if (result.equals("ห้ามส่งครับ"))
		{
			return("Pager is not allowed");
		}else if (result.equals("ส่งไม่ได้"))
		{
			return("Network error. Try sneding again");
		}else if (result.equals("เกินลิมิต"))
		{
			return("Over pager limit");
		}else if (result.equals("Server down"))
		{
			return("Server down");
		}else{
			return("Unknown error occurred");
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
//******************************************************************
}
