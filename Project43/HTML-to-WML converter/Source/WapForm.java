import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

//Import Java Libraries
import java.net.*;
import java.util.*;
import java.io.*;
//Import Xerces Libraries
import org.apache.xerces.dom.*;
//Import W3C DOM Libraries
import org.w3c.dom.*;
//Optional import of Sun XML parser Libraries
import com.sun.xml.tree.*;

public class WapForm extends HttpServlet 
{
	public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		Properties tagprop;
		String action,method,variable,value,cgi;
		int count;

		res.setContentType("text/wml");
		PrintWriter outt = res.getWriter();
		
		tagprop = new Properties();
		FileInputStream tp = new FileInputStream("c:/success/properties/form.properties");
        tagprop.load(tp);

		action = tagprop.getProperty("form0.action");
		cgi = action;

		method = tagprop.getProperty("form0.method");
		count = Integer.parseInt(tagprop.getProperty("form0.variable.count"));

		method = method.toLowerCase();
		if ( method.equals("post"))
			{
				try
					{
						URL url = new URL(action);
						URLConnection connection = url.openConnection();
						connection.setDoOutput(true);
						OutputStream out = connection.getOutputStream();
						Writer writer = new OutputStreamWriter(out);
						variable = tagprop.getProperty("form0.variable"+0);
						value = tagprop.getProperty("form0.value0");
	
						if (value.equals(""))
						{
							writer.write(variable + "=" + URLEncoder.encode(req.getParameter(variable)));
												}
						else
						{
							writer.write(variable + "=" + URLEncoder.encode(value));
						}
						
			
						if (count>0)
							{
				
								for (int i=1; i<count; i++)
								{
									variable = tagprop.getProperty("form0.variable"+i);
									value = tagprop.getProperty("form0.value"+i);
									if (value.equals(""))
									{
										writer.write("&" + variable + "=" + URLEncoder.encode(req.getParameter(variable)));
									}
									else
									{
										writer.write("&" + variable + "=" + URLEncoder.encode(value));
									}
								}	
							}

						writer.close();
			
						InputStream in = connection.getInputStream();
						Reader reader = new InputStreamReader(in,"latin1");
						BufferedReader bufferedReader = new BufferedReader(reader);
						FileWriter fout = new FileWriter("c:/result.html");
						BufferedWriter bufferedWriter = new BufferedWriter(fout);
						PrintWriter pout = new PrintWriter(bufferedWriter);
						String line;
						while ((line = bufferedReader.readLine()) != null)
						{
							pout.println(line);
						}
						bufferedReader.close();
						pout.close();
				}	
				catch (Exception e)
				{
					System.out.println(":( - - Post");
				}


	
		}
		else
			{
				try
					{
						variable = tagprop.getProperty("form0.variable"+0);
						value = tagprop.getProperty("form0.value0");
						if (value.equals(""))
						{
							action = action + "?" + variable + "=" + req.getParameter(variable);
						}
						else
						{
							action = action + "?" + variable + "=" + value;
						}				
						if (count>0)
						{
							for (int i=1; i<count; i++)
							{
								variable = tagprop.getProperty("form0.variable"+i);
								value = tagprop.getProperty("form0.value"+i);
								if (value.equals(""))
								{
									action = action + "&" + variable + "=" + req.getParameter(variable);
								}
								else
								{
									action = action + "&" + variable + "=" + value;
								}
							}
						}
						URL url = new URL(action);
						URLConnection connection = url.openConnection();
						connection.setDoOutput(true);
		
						InputStream in = connection.getInputStream();
						Reader reader = new InputStreamReader(in,"latin1");
						BufferedReader bufferedReader = new BufferedReader(reader);
						FileWriter fout = new FileWriter("c:/result.html");
						BufferedWriter bufferedWriter = new BufferedWriter(fout);
						PrintWriter pout = new PrintWriter(bufferedWriter);
						String line;
						while ((line = bufferedReader.readLine()) != null)
						{
							pout.println(line);
						}
						bufferedReader.close();
						pout.close();

			}
			catch (Exception e)
				{
					System.out.println(":( - - get");
				}

	}

	res.sendRedirect("http://161.246.5.113:8080/test/servlet/Handlerwap?url=file:///c:/result.html&action=" + cgi);
	}
}
