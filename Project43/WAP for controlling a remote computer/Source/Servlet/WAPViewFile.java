import common.GlobalVariables;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class WAPViewFile extends HttpServlet
{
	static String EOL = "\r\n";
	String gWAPUser=null;
	String gWAPPswd=null;
	String gFilename=null;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		PrintWriter out=res.getWriter();
		gWAPUser = req.getParameter("wapname");
		gWAPPswd = req.getParameter("wappswd");
		gFilename = req.getParameter("filename");
		WriteResponseHeaders(res);
		WriteDeckHeader(out);

		if (gFilename==null)
		{
			select_file(out);
		}else{
			view_file(out);
		}
		out.print("</wml>");
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
//******************************************************************

	void select_file(PrintWriter out)
	{
		String path = GlobalVariables.WAP_USER_PATH + gWAPUser + "\\file";
		File pathFile = new File(path);
		if (!(pathFile.exists()))
		{
			out.print("<card id=\"nofile\" newcontext=\"false\" ordered=\"true\">" + EOL);
			out.print("<p>There is <b>no file</b> to view.</p>" + EOL);
			out.print("</card>" + EOL);
		}else
		{
			String[] filenames = pathFile.list();
			if (filenames.length==0)
			{
				out.print("<card id=\"nofile\" newcontext=\"false\" ordered=\"true\">" + EOL);
				out.print("<p>There is <b>no file</b> to view.</p>" + EOL);
				out.print("</card>" + EOL);
			}else{
				out.print("<card id=\"selectfile\" newcontext=\"false\" ordered=\"true\">" + EOL);

				out.print("<do type=\"accept\" label=\"OK\" optional=\"false\">" + EOL);
				out.print("<go href=\"http://"+GlobalVariables.WEB_SERVER_NAME+"/servlet/WAPViewFile\" method=\"post\" sendreferer=\"false\">" + EOL);
				out.print("<postfield name=\"wapname\" value=\""+gWAPUser+"\"/>" + EOL);
				out.print("<postfield name=\"wappswd\" value=\""+gWAPPswd+"\"/>" + EOL);
				out.print("<postfield name=\"filename\" value=\"$filename\"/>" + EOL);
				out.print("</go>" + EOL);
				out.print("</do>" + EOL);

				out.print("<p mode=\"nowrap\">" + EOL);
				out.print("<select name=\"filename\" multiple=\"false\">" + EOL);
				int count=0;
				for (int i=0; i < filenames.length; i++)
				{
					if ((new File(path,filenames[i])).isFile())
					{
						int size=Math.round((new File(path,filenames[i])).length() / 1024);
						if ((new File(path,filenames[i])).length() % 1024 >0){ size++; }
						out.print("<option value=\""+filenames[i]+"\">" + filenames[i]+"("+size+"KB)"+ "</option>" + EOL);
						count++;
					}
				}
				if (count==0){out.print("<option value=\"\">no file</option>" + EOL);}
				out.print("</select>" + EOL);
				out.print("</p>" + EOL);
				out.print("</card>" + EOL);
			}
		}
	}

	void view_file(PrintWriter out)
	{
		String path = GlobalVariables.WAP_USER_PATH + gWAPUser + "\\file";
		File file = new File(path, gFilename);
		if (!(file.exists()))
		{
			out.print("<card id=\"error\">");
			out.print("<p mode=\"nowrap\">File not found.<br/>("+gFilename+")</p>");
			out.print("</card>");
		}else{
			int dot_index = gFilename.lastIndexOf('.');
			if (dot_index!=-1)
			{
				String file_extension = gFilename.substring(dot_index + 1).toLowerCase();
				if (file_extension.equals("wbmp"))
				{
					try{
						File pathFile = new File("c:\\javawebserver2.0\\public_html\\WAP\\image\\");
						if (!(pathFile.exists())){
							pathFile.mkdirs();
						}
						File outFile = new File(pathFile, gWAPUser + "_" + gFilename);
						PrintStream outStream = new PrintStream(new FileOutputStream(outFile));
						DataInputStream inStream = new DataInputStream(new FileInputStream(file));
						byte[] byte_file = new byte[(new Long(file.length())).intValue()];
						inStream.readFully(byte_file);
						outStream.write(byte_file, 0, byte_file.length);
						outStream.close();
					}catch(Exception e){e.printStackTrace();}
					out.print("<card id=\"viewimage\">" + EOL);
					out.print("<do type=\"accept\" label=\"OK\" optional=\"false\">" + EOL);
					out.print("<go href=\"http://" +GlobalVariables.WEB_SERVER_NAME+ "/servlet/WAPLogin\" method=\"post\" sendreferer=\"false\">" + EOL);
					out.print("<postfield name=\"login\" value=\"" + gWAPUser + "\"/>" + EOL);
					out.print("<postfield name=\"passwd\" value=\"" + gWAPPswd + "\"/>" + EOL);
					out.print("</go>" + EOL);
					out.print("</do>" + EOL);
					out.print("<p>" + EOL);
					out.print("<img alt=\""+gWAPUser + "_" + gFilename+"\" src=\"http://"+GlobalVariables.WEB_SERVER_NAME+"/WAP/image/"+gWAPUser + "_" + gFilename+"\"/>" + EOL);
					out.print("</p>" + EOL);
					out.print("</card>" + EOL);
					return;
				}
				if ((file_extension.equals("jpg")) || (file_extension.equals("jpeg")) || (file_extension.equals("bmp")) || (file_extension.equals("gif")))
				{
					try
					{
						File pathFile = new File("c:\\javawebserver2.0\\public_html\\WAP\\image\\");
						if (!(pathFile.exists())){
							pathFile.mkdirs();
						}
						String name=gFilename.substring(0,dot_index);
						Runtime r = Runtime.getRuntime();
						if (file.length()<10240)
						{
							Process p = r.exec("e:\\wap_inst\\wbmpconv\\wbmpconv.exe -c wbmp -W 160 " + file.getAbsolutePath() + " c:\\javawebserver2.0\\public_html\\WAP\\image\\" +gWAPUser+"_"+name+".wbmp");
							p.waitFor();
						}else{
							Process p = r.exec("e:\\wap_inst\\wbmpconv\\wbmpconv.exe -c wbmp -W 140 " + file.getAbsolutePath() + " c:\\javawebserver2.0\\public_html\\WAP\\image\\" +gWAPUser+"_"+name+".wbmp");
							p.waitFor();
						}
						out.print("<card id=\"viewimage\">" + EOL);
						out.print("<do type=\"accept\" label=\"OK\" optional=\"false\">" + EOL);
						out.print("<go href=\"http://" +GlobalVariables.WEB_SERVER_NAME+ "/servlet/WAPLogin\" method=\"post\" sendreferer=\"false\">" + EOL);
						out.print("<postfield name=\"login\" value=\"" + gWAPUser + "\"/>" + EOL);
						out.print("<postfield name=\"passwd\" value=\"" + gWAPPswd + "\"/>" + EOL);
						out.print("</go>" + EOL);
						out.print("</do>" + EOL);
						out.print("<p>" + EOL);
						out.print("<img alt=\""+gFilename+"\" src=\"http://"+GlobalVariables.WEB_SERVER_NAME+"/WAP/image/"+gWAPUser+"_"+name+".wbmp\"/>" + EOL);
						out.print("</p>" + EOL);
						out.print("</card>" + EOL);
					}catch(Exception e){ e.printStackTrace(); }
					return;
				}
			}
			try
			{
				FileInputStream fileInStream = new FileInputStream(file);
				DataInputStream inStream = new DataInputStream(fileInStream);
				String line = null;
				String text = "";
				while((line=inStream.readLine())!=null)
				{
					text = text + line + "\n";
				}
				fileInStream.close();
				MessageScanner scanner = new MessageScanner();
				text = scanner.scan(text);
				out.print("<card id=\"viewfile\" newcontext=\"false\" ordered=\"true\">" + EOL);
				out.print("<do type=\"accept\" label=\"OK\" optional=\"false\">" + EOL);
				out.print("<go href=\"http://" +GlobalVariables.WEB_SERVER_NAME+ "/servlet/WAPLogin\" method=\"post\" sendreferer=\"false\">" + EOL);
				out.print("<postfield name=\"login\" value=\"" + gWAPUser + "\"/>" + EOL);
				out.print("<postfield name=\"passwd\" value=\"" + gWAPPswd + "\"/>" + EOL);
				out.print("</go>" + EOL);
				out.print("</do>" + EOL);
				out.print("<p>"+text+"</p>");
				out.print("</card>" + EOL);
			}catch(Exception e){
				out.print("<card id=\"error\">");
				out.print("<p>Error occur while reading file.</p>");
				out.print("</card>");			
			}
		}
	}

}