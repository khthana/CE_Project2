import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.util.*;
import	java.lang.*;
import  java.net.URL;
import  java.net.MalformedURLException;
import	org.xml.sax.*;
import	org.xml.sax.helpers.XMLReaderFactory;

public class show1 extends HttpServlet
{
    URL url;
	String last = "";
	
	public void doGet (HttpServletRequest req, HttpServletResponse res)
	throws ServletException, IOException
	{	
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		ContentHandler contenthandler = new MyContentHandler(out);
		String address = req.getParameter("URL");		
		out.println("<HTML><HEAD><TITLE>SEARCH RESULT</TITLE></HEAD>");
		out.println("<BODY>");

		try 
		{
			XMLReader parser = 
            XMLReaderFactory.createXMLReader("org.apache.xerces.parsers.SAXParser");
            parser.setContentHandler(contenthandler);
//          parser.setErrorHandler(errorHandler);    
			try
			{
				url = new URL (address); 
			}
			catch(MalformedURLException e){}
			try 
			{
				parser.parse(new InputSource(url.openStream()));
			}
			catch(SAXException e){}
//			parser.parse(uri);
			read_data();
			out.println("<BR><BR><B>DESCRIPTION</B><BR>"+last);
        } 
		catch (IOException e) 
		{
            System.out.println("Error reading URI: " + e.getMessage());
        } 
		catch (SAXException e) 
		{
            System.out.println("Error in parsing: " + e.getMessage());
        }
		
		out.println("</BODY></HTML>");
	}

	public void read_data()
	{
		try
		{	
			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
			try
			{
				String line = "";				
				int bit = 0;
				while ((line = br.readLine()) != null)
				{
					if (line.indexOf("</description>") != -1)
					{
						int index = line.indexOf("</description>");
						line = line.substring(0,index)+"\n";
						last = last + line;
						bit = 0;
						break;
					}
					if ((line.indexOf("<description>") != -1) || 
						(bit == 1))
					{
						bit = 1;
						int index = line.indexOf("<description>");
						if (index != -1)
						{
							index = index+13;
							if (index == line.length())
							{
								continue;
							}
							if (line.length() > index)
							{
								line = line.substring(index,line.length());
							}
						}
						line = line+"\n";
						last = last+line;
					}
				}
			}
			catch (IOException ex) {}			
		}
		catch (IOException io) {}
	}	
		

}
class MyContentHandler implements ContentHandler
{
	PrintWriter out;
	private Locator locator;
	char abit='0';
	char tbit='0';
	char dbit='0';
	//public String data="";

	MyContentHandler(PrintWriter out)
	{
		this.out = out;
	}
	public void setDocumentLocator(Locator locator) 
	{
		this.locator = locator;
    }

	public void startDocument() throws SAXException 
	{
    }

    public void endDocument() throws SAXException 
	{
    }
    
	public void processingInstruction(String target, String data) throws SAXException 
	{
		System.out.println("PI: Target:" + target + " and Data:" + data);
    }
  
	public void startPrefixMapping(String prefix, String uri) 
	{
        System.out.println("Mapping starts for prefix " + prefix + " mapped to URI " + uri);
    }

    public void endPrefixMapping(String prefix) 
	{
        System.out.println("Mapping ends for prefix " + prefix);
    }
	public void startElement(String namespaceURI, String localName,String rawName, Attributes atts)
        throws SAXException 
	{
       if(localName.startsWith("abstract"))
       {      
			abit='1'; 
	   }	
	   if(localName.startsWith("title"))
	   {
			tbit='1';
	   }
	   if(localName.startsWith("description"))
	   {
			dbit='1';
	   }
	}
 
    public void endElement(String namespaceURI, String localName,String rawName) 
        throws SAXException 
	{
	}

	public void characters(char[] ch, int start, int end) 
        throws SAXException 
	{
		if ( abit == '1')
		{
	        String s = new String(ch, start, end);
			out.println("<BR><BR><B>ABSTRACT</B><BR> "+s);		
			//data=s;
			abit='0';
		}

		if ( tbit == '1')
		{
			String s = new String(ch, start, end);
			out.println("<B>TITLE</B><BR>"+s);
			tbit='0';
		}		
    }

    public void ignorableWhitespace(char[] ch, int start, int end)
        throws SAXException 
	{
        String s = new String(ch, start, end);
        System.out.println("ignorableWhitespace: [" + s + "]");
    }

	public void skippedEntity(String name) throws SAXException 
	{
        System.out.println("Skipping entity " + name);
    }
}

