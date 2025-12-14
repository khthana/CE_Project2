//import  Libraries;
import java.io.*;
import java.util.*;
import java.lang.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.net.*;
//import org.apache.xerces.dom.*;


public class ContactWap extends HttpServlet
{
	public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		res.setContentType("text/vnd.wap.wml");
		PrintWriter outt = res.getWriter();
		String urll = req.getParameter("url");

		try
		{
			URL url = new URL(urll);
			URLConnection connection = url.openConnection();
			connection.setDoOutput(true);
			
			InputStream in = connection.getInputStream();
			Reader reader = new InputStreamReader(in,"MS874");
			BufferedReader bufferedReader = new BufferedReader(reader);
			FileWriter fout = new FileWriter("c:/html.html");
			BufferedWriter bufferedWriter = new BufferedWriter(fout);
			PrintWriter pout = new PrintWriter(bufferedWriter);

			String line;
			pout.println(urll);
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
}
