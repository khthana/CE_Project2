//import  Libraries;
import java.io.*;
import java.util.*;
import java.lang.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.net.*;

public class ContactForm extends HttpServlet
{
	public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		res.setContentType("text/vnd.wap.wml");
		PrintWriter outt = res.getWriter();
		String url2 = "";
		String urlName ="";
		String name[];
		String value[];
		int i =0;
		Enumeration paramNames =req.getParameterNames();
		while (paramNames.hasMoreElements())
		{
			String paramName = (String)paramNames.nextElement();
			String paramValue = req.getParameter(paramName);
			if (paramName.equals("url"))
			{
				urlName =paramValue+"?";
			}
			else 
			{
				url2 += paramName+"="+paramValue+"&";
			}
		}
		urlName += url2;
		urlName =urlName.substring(0,urlName.length()-1);
	//	System.out.println("urlName="+urlName);
		
		try
		{		
			URL url = new URL(urlName);
			URLConnection connection = url.openConnection();
			connection.setDoOutput(true);
			
			InputStream in = connection.getInputStream();
			Reader reader = new InputStreamReader(in,"MS874");
			BufferedReader bufferedReader = new BufferedReader(reader);
			FileWriter fout = new FileWriter("c:/html.html");
			BufferedWriter bufferedWriter = new BufferedWriter(fout);
			PrintWriter pout = new PrintWriter(bufferedWriter);

			String line;
			pout.println(urlName);
			while ((line = bufferedReader.readLine()) != null)
			{
				pout.println(line);
			}
			bufferedReader.close();
			pout.close();
			res.sendRedirect("http://161.246.6.222:8080/webdav/servlet/Convert");
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
	}

	public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		doGet(req,res);
	}
}
