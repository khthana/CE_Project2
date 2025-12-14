package com.poqit.wml.Producer;

//Import Java Libraries
import java.io.*;
import javax.servlet.http.*;

//Import Cocoon Libraries
import org.apache.cocoon.producer.*;
import org.apache.cocoon.framework.*;

//Import W3C DOM Libraries
import org.w3c.dom.*;

public class ProducerFromHTML extends AbstractProducer implements Status
{
  //Methods

  //Never called - just here to satisfy AbstractProducer implementation
  public Reader getStream(HttpServletRequest request) throws IOException
  {
    return new StringReader(null);
  }

  //This is the method that Cocoon calls when directed to use
  //the ProducerFromHTML producer in a URL.
  public Document getDocument(HttpServletRequest request) throws IOException
  {
	System.err.println(request.getServletPath());
	System.err.println(request.getPathInfo());

	//Read the parameters specified in the URL
    String serviceName = request.getParameter("service");
    String propertiesFile = request.getParameter("extractorprops");
	System.err.println(request.getRequestURI());

	propertiesFile = "c:/success/properties/" + propertiesFile;
	
	//Create the HTMLExtractor, passing in the properties filename from the URL
    HTMLExtractor mHTMLExtractor = new HTMLExtractor(propertiesFile);

    //Create the Service via the HTMLExtractor
    Service mService = mHTMLExtractor.getService(serviceName);

    //Finally get the XML document, and return it to Cocoon for XSLT processing
    return mService.getDocument();
  }

  public String getPath(HttpServletRequest request)
  {
    return "";
  }

  //For information only
  public String getStatus()
  {
    return "ProducerFromHTML";
  }
  
}
