package com.poqit.wml.Producer;

//Import Java Libraries
import java.io.*;
import java.util.*;
import com.poqit.wml.Producer.*;

//Import W3C DOM Libraries
import org.w3c.dom.*;

public class HTMLExtractor
{
  // Class Variables
  private Properties properties = new Properties();

  //Constructor
  public HTMLExtractor(String propertiesFile)
  {
    //Read the extractor properties file
    try
    {
      FileInputStream sf = new FileInputStream(propertiesFile);
      try
      {
        properties.load(sf);
      }
      catch(IOException ioe)
      {
        System.err.println("Constructor: IOException reading the properties file '" + propertiesFile + "'");
        return;
      }
    }
    catch(FileNotFoundException fnfe)
    {
      System.err.println("Constructor: Properties file \"" + propertiesFile + "\" could not be found");
	  return;

    }
  }

  //Methods
  public Service getService(String serviceName) throws IOException
  {
    Service mService= null;
    //Make sure our service is defined in the extractor properties file
    if (properties.getProperty(serviceName) == null)
    {
      System.err.println("The service \"" + serviceName + "\" was not found in the extractor properties file");

	  return null;
    }
    else
    {
      //Our service is defined, so create a Service object, and populate it
      mService = new Service(serviceName, properties);
    }
    return mService;
  }

  //Main method for testing from command line, or IDE
  public static void main(String[] args) throws IOException
  {
    //Check both args have been specified on cammand line
    if (args.length < 2)
    {
      System.err.println("Usage: java HTMLExtractor serviceName extractorPropertiesFileName");
      return;
    }
    //Create the HTMLExtractor
    HTMLExtractor mHTMLExtractor = new HTMLExtractor(args[1]);

    //Create the Service via the HTMLExtractor
    Service mService = mHTMLExtractor.getService(args[0]);

    //If everything went well, then get the XML document
    if (mService != null)
    {
      Document mDoc = mService.getDocument();
      //If XML document was created successfully, print a line to System.out for confirmation
      if (mDoc != null)
      {
        System.out.println("XML Document created successfully - uncomment the lines in Service.createDOM to see raw result.");
      }
    }
  }
}