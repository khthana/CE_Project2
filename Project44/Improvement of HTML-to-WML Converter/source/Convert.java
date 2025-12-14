import java.io.*;
import java.lang.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.net.*;

public class Convert extends HttpServlet
{
	public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		res.setContentType("text/vnd.wap.wml");
		PrintWriter out = res.getWriter();

		FileInputStream input;
		FileInputStream deck1;
		FileOutputStream xml;
		int readVar = 0;
		int readVar1 = 0;
		String st = "";		//aad html to st
		String stx = "";
		String stxh = "";
		String stw = "";
		byte[] by;
		byte[] by1;
		try
		{
			input = new FileInputStream("c:/html.html");
			xml = new FileOutputStream("c:/xml.html");
			while (readVar != -1)
			{
				try
				{
					readVar = input.read();
					st += (char)readVar;
				}
				catch(IOException e)
				{
					System.out.println("Unknow IO erroring file ");
					System.exit(2);
				}
			}
			int indexEnd = st.indexOf("<");
			String url = st.substring(0,indexEnd-2);    // cut url part 
			String url2 = url.substring(7);				// url that cut http://
			String url_s = "";
			int end_st = url2.lastIndexOf("/"); 

			if (url2.lastIndexOf('/') == -1)        // at end of url is not have /
			{
				url_s = url;
				url = url.substring(0,url.length()); 
				url += "/";
			}
			else
			{	
				String url3 = url2.substring(url2.lastIndexOf('/'),url2.length());//url have /   
				int indexdot = url3.indexOf(".");
					if ((url2.lastIndexOf('/')+1 != url2.length())&&(indexdot == -1)) //check url length
					{
						url += '/';
					}
					else 
					{	
						url = "http://"+url2.substring(0,end_st+1);
					}
				url_s = "http://"+ url2.substring(0,url2.indexOf("/"));
			}
			st = st.substring(0,st.length()-1);  // del ? end of string 
		
			st = MakeWellForm.MakeWellForm(st);				// make html to well-form
			edit2XML obj = new edit2XML();
			if (obj.isXhtml(st))
			{									//this homepage is xhtml
				stxh = obj.addURL(st,url,url_s);
				try
				{
					by1 = stxh.getBytes();
					xml.write(by1);
				}
				catch(IOException e)
				{
					System.exit(3);
				}
			}	
			else
			{   // convert html to xml
				st = obj.convToXML(st,url,url_s);	// Convert to XML.
				stx = obj.editEmptyTag(st);	// Convert Empty Tag.
		//		System.out.println("after");
				try
				{
					by1 = stx.getBytes();
					xml.write(by1);
				}
				catch(IOException e)
				{
					System.exit(3);
				}

				Conv2xhtml XtoXH = new Conv2xhtml();			// convert xml to xhtml
				stxh = XtoXH.convert2xhtml(stx);
			}
			// convert xhtml to wml
				stxh = obj.Swap(stxh);
		//		System.out.println("after swap");
				stxh = MakeWellForm.ChangeAmp(stxh);
		//		System.out.println("after change");
				Conv2wml wml = new Conv2wml();
				wml.convert2wml(stxh);
		//		System.out.println("after wml");
				deck1 = new FileInputStream("C:/tomcat4.0/webapps/webdav/deck1.wml");
				while (readVar1 != -1)
				{
					try
					{
						readVar1 = deck1.read();
						stw += (char)readVar1;
					}
					catch(IOException e)
					{
						System.out.println("Unknow IO erroring file ");
						System.exit(2);
					}
				}
		}
		catch(IOException e)
		{
			System.out.println("File input not found");
			System.exit(1);
		}
			stw = stw.substring(0,stw.length()-1);  // del ? end of string 
			out.println(stw);						// output to wml browser
	}
}
