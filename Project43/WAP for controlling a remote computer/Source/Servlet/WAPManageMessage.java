import common.GlobalVariables;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class WAPManageMessage extends HttpServlet
{
	static String EOL = "\r\n";
	public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		PrintWriter out=res.getWriter();
		String gUsername = req.getParameter("user");
		String gFilename = req.getParameter("filename");
		String gTransaction = req.getParameter("tx");
		String gNewFilename = req.getParameter("newfilename");
		String gConfirm = req.getParameter("confirm");
		WriteResponseHeaders(res);
		WriteDeckHeader(out);

		String manage_msg_url = "http://" + GlobalVariables.WEB_SERVER_NAME + "/servlet/WAPManageMessage";
		String path = GlobalVariables.WAP_USER_PATH + gUsername + "\\message\\old";
//-----------------------------------------------------------------------------------------------------------
		if (gTransaction.equals("save"))
		{
			//save as file
			if (gNewFilename!=null)
			{
				if (gNewFilename.trim().equals(""))
				{
					out.println("<card id=\"invalidname\">");
					out.println("<do type=\"accept\" label=\"submit\" optional=\"false\">");
					out.println("<go href=\""+manage_msg_url+"\" method=\"post\" sendreferer=\"false\">");
					out.println("<postfield name=\"user\" value=\""+gUsername+"\"/>");
					out.println("<postfield name=\"filename\" value=\""+gFilename+"\"/>");
					out.println("<postfield name=\"tx\" value=\""+gTransaction+"\"/>");
					out.println("<postfield name=\"newfilename\" value=\"$filename\"/>");
					out.println("</go>");
					out.println("</do>");
					out.println("<p>Invalid filename.<br/>Please type new filename");
					out.println("<input name=\"filename\" maxlength=\"20\" type=\"text\" emptyok=\"false\"/>");
					out.println("</p>");
					out.println("</card>");
				}else{
					File inFile = new File(path, gFilename);
					String out_path_str = GlobalVariables.WAP_USER_PATH + gUsername + "\\file";
					File outPath = new File(out_path_str);
					if (!(outPath.exists()))
					{
						outPath.mkdirs();
					}
					File outFile = new File(outPath, gNewFilename);
					if (!(inFile.exists()))
					{
						out.println("<card id=\"error\">");
						out.println("<p>Message not found.</p>");
						out.println("</card>");
					}else if (outFile.exists())
					{
						if (gConfirm!=null)
						{
							if (gConfirm.equals("yes"))
							{
								save_as_file(out, inFile, outFile);
							}
						}else{
							out.println("<card id=\"existsname\">");
							out.println("<p>"+gNewFilename+" is already exists.<br/>Do you want to replace it?.<br/>");
							out.println("<anchor title=\"replace file\">Yes");
							out.println("<go href=\""+manage_msg_url+"\" method=\"post\">");
							out.println("<postfield name=\"user\" value=\""+gUsername+"\"/>");
							out.println("<postfield name=\"filename\" value=\""+gFilename+"\"/>");
							out.println("<postfield name=\"tx\" value=\""+gTransaction+"\"/>");
							out.println("<postfield name=\"newfilename\" value=\""+gNewFilename+"\"/>");
							out.println("<postfield name=\"confirm\" value=\"yes\"/>");
							out.println("</go>");
							out.println("</anchor>");
							out.println("<anchor title=\"do not replace\">No");
							out.println("<go href=\""+manage_msg_url+"\" method=\"post\">");
							out.println("<postfield name=\"user\" value=\""+gUsername+"\"/>");
							out.println("<postfield name=\"filename\" value=\""+gFilename+"\"/>");
							out.println("<postfield name=\"tx\" value=\""+gTransaction+"\"/>");
							out.println("</go>");
							out.println("</anchor>");
							out.println("</p>");
							out.println("</card>");
						}
					}else{
						save_as_file(out, inFile, outFile);
					}
				}
			}else{
				out.println("<card id=\"inputfilename\">");
				out.println("<do type=\"accept\" label=\"submit\" optional=\"false\">");
				out.println("<go href=\""+manage_msg_url+"\" method=\"post\" sendreferer=\"false\">");
				out.println("<postfield name=\"user\" value=\""+gUsername+"\"/>");
				out.println("<postfield name=\"filename\" value=\""+gFilename+"\"/>");
				out.println("<postfield name=\"tx\" value=\""+gTransaction+"\"/>");
				out.println("<postfield name=\"newfilename\" value=\"$filename\"/>");
				out.println("</go>");
				out.println("</do>");
				out.println("<p>Please type filename");
				out.println("<input name=\"filename\" maxlength=\"20\" type=\"text\" emptyok=\"false\"/>");
				out.println("</p>");
				out.println("</card>");
			}
//-----------------------------------------------------------------------------------------------------------
		}else if (gTransaction.equals("del")){
			//delete message
			File file = new File(path, gFilename);
			if (!(file.exists()))
			{
				out.println("<card id=\"notfound\">");
				out.println("<p>Message not found.</p>");
				out.println("</card>");
			}else{
				if (file.delete())
				{
					out.println("<card id=\"successful\">");
					out.println("<p>Message has been deleted.</p>");
					out.println("</card>");	
				}else{
					out.println("<card id=\"error\">");
					out.println("<p>Cannot delete this message.</p>");
					out.println("</card>");	
				}
			}
//-----------------------------------------------------------------------------------------------------------
		}else if (gTransaction.equals("delall")){
			//delete all message
			if (gConfirm==null)
			{
							out.println("<card id=\"confirm\">");
							out.println("<p>Are you sure to delete all message?<br/>");
							out.println("<anchor title=\"delete all\">Yes");
							out.println("<go href=\""+manage_msg_url+"\" method=\"post\">");
							out.println("<postfield name=\"user\" value=\""+gUsername+"\"/>");
							out.println("<postfield name=\"tx\" value=\""+gTransaction+"\"/>");
							out.println("<postfield name=\"confirm\" value=\"yes\"/>");
							out.println("</go>");
							out.println("</anchor>");
							out.println("</p>");
							out.println("</card>");
			}else{
				if (gConfirm.equals("yes"))
				{
					try
					{
						File pathFile = new File(path);
						String[] filenames = pathFile.list();
						for (int i=0; i<filenames.length; i++)
						{
							File file = new File(pathFile, filenames[i]);
							if (file.isFile())
							{
								file.delete();
							}
						}
						out.println("<card id=\"successful\">");
						out.println("<p>All message have been deleted.</p>");
						out.println("</card>");
					}catch(Exception e){
						out.println("<card id=\"error\">");
						out.println("<p>Error occured. Failed to delete all message.</p>");
						out.println("</card>");
					}
				}
			}
		}
//-----------------------------------------------------------------------------------------------------------
		out.println("</wml>");
	}

	void save_as_file(PrintWriter out, File inFile, File outFile)
	{
		try{
			DataInputStream inStream = new DataInputStream(new FileInputStream(inFile));
			byte[] byte_file = new byte[(new Long(inFile.length())).intValue()];
			inStream.readFully(byte_file);
			inStream.close();
			PrintStream outStream = new PrintStream(new FileOutputStream(outFile));
			outStream.write(byte_file, 0, byte_file.length);
			outStream.close();
		}catch(Exception e){
			out.println("<card id=\"errorreading\">");
			out.println("<p>Error occured while reading file.</p>");
			out.println("</card>");
			return;
		}
		out.println("<card id=\"successful\">");
		out.println("<p>Message has been saved to "+outFile.getName()+"</p>");
		out.println("</card>");
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