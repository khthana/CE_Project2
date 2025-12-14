import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Handlerwap extends HttpServlet 
{
	private Properties xprop;
	public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		res.setContentType("text/vnd.wap.wml");
		PrintWriter out = res.getWriter();
		String url = req.getParameter("url");
		String cgi = req.getParameter("action");

		xprop = new Properties();
		FileInputStream propFile = new FileInputStream("C:/success/properties/extractor.properties");	
		try
		{
			xprop.load(propFile);
		}
		catch(Exception e)
		{
			System.err.println("Catching Attribute: IOException reading the properties file '" + xprop + "'");
			System.err.println(e);
			return;
		}
		
		String link;
		if (url.equals("file:///c:/result.html"))
		{
			xprop.setProperty("distributors.result","yes");
			xprop.setProperty("distributors.url",url);
			if (cgi != null)
			{
				xprop.setProperty("distributors.url.old",cgi);
			}
		}
		else 
		{
			xprop.setProperty("distributors.result","no");

			String url1= url.substring(7);
			int sla = url1.lastIndexOf('/');
			if (sla==-1)
			{
				url = url1 + "/index.html";
				url = "http://" + url;
			}
			else
			{
				link = url1.substring(sla);
				int l = link.length();
				int servlet = url1.indexOf("servlet");
				if (servlet ==-1)
				{
			
					if (link.indexOf(".")==-1)
						{
							if (l == 1)
							{
								url = url1+ "index.html";
							}
							else
								url = url1+ "/index.html";
							url = "http://" + url;
						}
				}
			}
			xprop.setProperty("distributors.url",url);


		}
		FileOutputStream propFileout = new FileOutputStream("C:/success/properties/extractor.properties");
		xprop.store(propFileout,"");
		res.sendRedirect("http://161.246.5.113:8080/cocoon/cocoon.xml?producer=ProducerFromHTML&service=distributors&extractorprops=extractor.properties");
	
	}
}
