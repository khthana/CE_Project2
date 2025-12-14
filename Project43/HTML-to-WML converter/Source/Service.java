package com.poqit.wml.Producer;

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

public class Service
{
  //Constants
  private static final String dummy = "dummy";

  //Variables
  private String serviceTitle, serviceURL, overallStart, overallEnd, outputType, wholeTag, result;
  private String currentURL;
  private int piCount;
  private ProcInstruct[] piItem;
  private TempStack tempStack;
  private String html;
  private int currentIndex;
  private String singleTag, doubleTag, noAttribute;
  private XmlDocument mDoc = new XmlDocument();
  private int tagi = 0;
  private Properties tagprop;

  //Constructor
  public Service(String serviceName, Properties properties)
  {
    //Populate all our variables from the values in the extractor properties file
    serviceTitle = properties.getProperty(serviceName);

	result = properties.getProperty(serviceName+".result");
	if (result.equals("yes"))
	{		
		serviceURL = properties.getProperty(serviceName+".url.old");
		currentURL = properties.getProperty(serviceName+".url");
		properties.setProperty(serviceName+".result","no");
	}
	else
	{
		serviceURL = properties.getProperty(serviceName+".url");
		currentURL = properties.getProperty(serviceName+".url");
	}

    overallStart = properties.getProperty(serviceName+".overall.start");
    overallEnd = properties.getProperty(serviceName+".overall.end");
	singleTag = properties.getProperty(serviceName+".single.tags");
	doubleTag = properties.getProperty(serviceName+".double.tags");
	noAttribute = properties.getProperty(serviceName+".attribute.no");

    piCount = Integer.parseInt(properties.getProperty(serviceName+".pi.count"));
    piItem = new ProcInstruct[piCount];

    //For each Processing Instruction - get its details
    for (int i = 0; i < piCount; i++)
    {
      piItem[i] = new ProcInstruct();
      piItem[i].target = properties.getProperty(serviceName+".pi"+i+".target");
      piItem[i].data = properties.getProperty(serviceName+".pi"+i+".data");
    }
  }

  //Methods

  //Read the HTML file into a buffer.
  //Return true if successful, otherwise false
  private boolean readHTML()
  {
    BufferedReader reader;
    String line;
	RadioandCheckbox rc = new RadioandCheckbox();
    try
    {
      //Create the URL object from the xxx.url string specified in the properties file
      URL mURL = new URL(currentURL);
      StringBuffer wholeFile = new StringBuffer();

      try
      {
        //Read the HTML into a StringBuffer, a line at a time
        //Use a StringBuffer, because String appends are slower
        reader = new BufferedReader(new InputStreamReader(mURL.openStream()));
        while ((line = reader.readLine()) != null)
        {
			line = line.trim();
			if (line.lastIndexOf(">") < line.lastIndexOf("<"))
			{
				line = line + " ";
			}
			wholeFile.append(line);
        }
        reader.close();
      }
      catch(IOException ioe)
      {
        System.err.println("Service: the source document " + currentURL + " could not be found or read.");
        return false;
      }

	  //Finally convert StringBuffer to a plainString
      html = wholeFile.toString();
	  System.out.println(html);

      URL nURL = new URL(serviceURL);
	  FormFilter filter = new FormFilter();
	  try
	  {
		filter.execute(nURL,html);
	  }
	  catch (Exception e)
	  {
	  }
	  html = rc.insert(html);
      return true;
    }
    catch(MalformedURLException mue)
    {
      System.err.println("Service: the source URL " + currentURL + " is malformed.");
      return false;
    }
  }

  //Having read the HTML source file into a buffer, we can extract the pertinent data,
  //as directed by the values read in from the extractor properties file. 
  private Document extractAndCreateDOM() throws IOException
  {

	//Overall start point in the HTML
    int startIndex = html.indexOf(overallStart) + overallStart.length();
	if (html.indexOf(overallStart) == -1)
	{
		String htmlLOWER = html.toLowerCase();
		startIndex = htmlLOWER.indexOf(overallStart) + overallStart.length();
	}

    //Overall end point in the HTML
	int endIndex = html.indexOf(overallEnd, startIndex);
	if (html.indexOf(overallEnd) == -1)
	{
		String htmlLOWER = html.toLowerCase();
		endIndex = htmlLOWER.indexOf(overallEnd, startIndex);
	}

	boolean itIsText = false;

	String textNode = "";

	tempStack = new TempStack();

	//Our current position in the HTML
    currentIndex = startIndex;

    Element eb = mDoc.createElement("extractbody");
    mDoc.appendChild(eb);

    //Add the processing instructions, as specified in the extractor properties file
    for (int i = 0; i < piCount; i++)
    {
      ProcessingInstruction pi = mDoc.createProcessingInstruction(piItem[i].target, piItem[i].data);
      mDoc.appendChild(pi);
    }

    //Add a title element, using the title given in the extractor properties file
    Element title = mDoc.createElement("title");
    title.appendChild(mDoc.createTextNode(serviceTitle));
    eb.appendChild(title);

	tempStack.tag = new Element[99];

	tempStack.tag[0] = eb;
	
	String nextTag = searchNextTag();

	int endScript = 0;
	while (currentIndex < endIndex)
    { 
	  itIsText = false;
	  endScript = -4;
	  if (singleTag.indexOf(nextTag+',') != -1) // Is nextTag is in singleTag?
	  {
		Element et = mDoc.createElement(nextTag.substring(1,nextTag.length()));
		tempStack.tag[tagi].appendChild(et);
		tagi++;
		tempStack.tag[tagi] = et;

		if (noAttribute.indexOf(nextTag+',') == -1)
		{
			catchAttribute(nextTag.substring(1,nextTag.length()));
			catchAttr(nextTag.substring(1,nextTag.length()));
		}
		tagi--;
	  }
	  else if (doubleTag.indexOf(nextTag+',') != -1) // Is nextTag is in doubleTag?
	  {
		Element et = mDoc.createElement(nextTag.substring(1,nextTag.length()));
		tempStack.tag[tagi].appendChild(et);
		
		tagi++;
		
		tempStack.tag[tagi] = et;

		if (noAttribute.indexOf(nextTag+',') == -1)
		{
			catchAttribute(nextTag.substring(1,nextTag.length()));
			catchAttr(nextTag.substring(1,nextTag.length()));
		}

		if (nextTag.equals("<script"))
		{
			endScript = html.indexOf("</script>",currentIndex);
			if (endScript == -1)
			{
				endScript = html.indexOf("</SCRIPT>",currentIndex);
			}
			textNode = html.substring(currentIndex+8,endScript);
			textNode = textNode.trim();
			tempStack.tag[tagi].appendChild(mDoc.createTextNode(textNode));
			currentIndex = endScript;
		}

	  }	  
	  else if (nextTag.equals(">"))
	  {
		itIsText = true;

		Element et = mDoc.createElement("text");

		textNode = html.substring(currentIndex+1,html.indexOf("<",currentIndex));
		textNode = textNode.trim();
		et.appendChild(mDoc.createTextNode(textNode));
		
		tempStack.tag[tagi].appendChild(et);
	  }
	  else if (nextTag.substring(0,2).equals("</"))
	  {
		tagi--;
	  }

	  if (currentIndex != endScript)
	  {
		if (itIsText)
		{
			currentIndex = html.indexOf("<",currentIndex);
		}
		else
		{
			currentIndex = html.indexOf(">",currentIndex);
		}
	  }
	  nextTag = searchNextTag();
	} //end while loop end of HTML

	FileOutputStream fout = new FileOutputStream("C:/success/jakarta-tomcat/webapps/cocoon/samples/wap/myService.xml");
	mDoc.write(fout);
	fout.flush();

	return mDoc;
  }

  //Search for next tag
  private String searchNextTag()
  { 
	String nexttag = null;
	if (html.substring(currentIndex,currentIndex+1).equals("<")) //previous item is text
	{
		int space = html.indexOf(' ',currentIndex);
		int rightbracket = html.indexOf('>',currentIndex);
		if ((space < rightbracket) && (space != -1))
		{
			nexttag = html.substring(currentIndex,space); //tag has attributes
		}
		else
		{
			nexttag = html.substring(currentIndex,rightbracket); //tag doesn't have attributes
		}
	}
	else //previous item is not text
	{
		if (html.substring(currentIndex + 1,currentIndex + 2).equals("<")) //there is no text between two tags
		{	currentIndex++;
			int space = html.indexOf(' ',currentIndex);
			int rightbracket = html.indexOf('>',currentIndex);
		 	if ((space < rightbracket) && (space != -1))
			{
				nexttag = html.substring(currentIndex,space); //tag has attributes
			}
			else
			{
				nexttag = html.substring(currentIndex,rightbracket); //tag doesn't have attributes
			}

		}
		else //next item is text
		{
			nexttag = ">";
		}
	}
	String nexttagLOW = nexttag.toLowerCase();
	return nexttagLOW;
  }

  //catch attribute
  public void catchAttribute(String tempCurrentTag)
  {
	//String attribute;
	String currentTag = tempCurrentTag.toLowerCase();
    tagprop = new Properties();
	String valOfAttr = "";
	wholeTag = html.substring(currentIndex,html.indexOf('>',currentIndex)+1);
    try
    {
      FileInputStream tp = new FileInputStream("c:/success/properties/tag&attribute.properties");
      try
      {
        tagprop.load(tp);
      }
      catch(IOException ioe)
      {
        System.err.println("Catching Attribute: IOException reading the properties file '" + tagprop + "'");
        return;
      }
    }
    catch(FileNotFoundException fnfe)
    {
      System.err.println("Catching Attribute: Properties file \"" + tagprop + "\" could not be found");
	  return;
    }

	System.out.println(currentTag);
	int attributecount = Integer.parseInt(tagprop.getProperty("html." + currentTag + ".attributecount"));
	int valStart;
	for (int i=0; i<attributecount; i++)
	{
		String attribute = tagprop.getProperty("html." + currentTag + ".attribute" + i);
		String attributeUP = attribute.toUpperCase();
		if ((wholeTag.indexOf(attribute) != -1) || (wholeTag.indexOf(attributeUP) != -1))
		{
			if (wholeTag.indexOf(attribute) != -1) //attribute is lowercase
			{
				valStart = wholeTag.indexOf(attribute) + attribute.length();
			}
			else //attribute is UPPERCASE
			{
				valStart = wholeTag.indexOf(attributeUP) + attributeUP.length();
			}
			if (wholeTag.substring(valStart,valStart+1).equals("\"")) //attribute value has DOUBLE QUOTE
			{
				valOfAttr = wholeTag.substring(valStart+1,wholeTag.indexOf("\"",valStart+1));
				if (attribute.equals("src=") || attribute.equals("SRC=") || attribute.equals("cite=") || attribute.equals("CITE=") || attribute.equals("action=") || attribute.equals("ACTION=") || attribute.equals("href=") || attribute.equals("HREF="))// && ( (valOfAttr.length() > 7) || (valOfAttr.equals("/") ) )
				{
					if (valOfAttr.length()>6)
					{
						if (!valOfAttr.substring(0,7).equals("http://") && !valOfAttr.substring(0,7).equals("mailto:"))
						{
							valOfAttr = relativeURL(valOfAttr);
						}
						else if (valOfAttr.length()>7)
						{
							if (!valOfAttr.substring(0,8).equals("https://") && !valOfAttr.substring(0,7).equals("http://") && !valOfAttr.substring(0,7).equals("mailto:"))
							{
								valOfAttr = relativeURL(valOfAttr);
							}
							else
							{
								//DO NOTHING
							}
						}
						else
						{
							//DO NOTHING
						}
					}
					else
					{
						valOfAttr = relativeURL(valOfAttr);
					}
				}

				tempStack.tag[tagi].setAttribute(attribute.substring(0,attribute.length()-1),valOfAttr);
			}
			else  //attribute value DOESN'T have DOUBLE QUOTE
			{	
				if ((wholeTag.indexOf(' ',valStart) < wholeTag.indexOf('>',valStart)) && (wholeTag.indexOf(' ',valStart) != -1))
				{
					valOfAttr = wholeTag.substring(valStart,wholeTag.indexOf(' ',valStart));
				}
				else
				{
					valOfAttr = wholeTag.substring(valStart,wholeTag.indexOf('>',valStart));
				}
				if (attribute.equals("src=") || attribute.equals("SRC=") || attribute.equals("cite=") || attribute.equals("CITE=") || attribute.equals("action=") || attribute.equals("ACTION=") || attribute.equals("href=") || attribute.equals("HREF="))
				{
					if (valOfAttr.length()>6)
					{
						if (!valOfAttr.substring(0,7).equals("http://") && !valOfAttr.substring(0,7).equals("mailto:"))
						{
							valOfAttr = relativeURL(valOfAttr);
						}
						else if (valOfAttr.length()>7)
						{
							if (!valOfAttr.substring(0,8).equals("https://") && !valOfAttr.substring(0,7).equals("http://") && !valOfAttr.substring(0,7).equals("mailto:"))
							{
								valOfAttr = relativeURL(valOfAttr);
							}
							else
							{
								//DO NOTHING
							}
						}
						else
						{
							//DO NOTHING
						}
					}
					else
					{
						valOfAttr = relativeURL(valOfAttr);
					}

				}
				tempStack.tag[tagi].setAttribute(attribute.substring(0,attribute.length()-1),valOfAttr);
			}
		}
	}
  }

  public void catchAttr(String tCurrentTag)
  {
	String cTag = tCurrentTag.toLowerCase();
	int attrcount = Integer.parseInt(tagprop.getProperty("html." + cTag + ".attrcount"));
	int valStart;

	for (int i=0; i<attrcount; i++)
	{
		String attr = tagprop.getProperty("html." + cTag + ".attr" + i);
		String attrUP = attr.toUpperCase();
		if ((wholeTag.indexOf(attr) != -1) || (wholeTag.indexOf(attrUP) != -1))
		{
			tempStack.tag[tagi].setAttribute(attr,"yes");
		}
		else
		{
			tempStack.tag[tagi].setAttribute(attr,"no");
		}
	}
  }
  public String relativeURL(String valAttr)
  { 
	String valOfAttrT;
	int countF,startI;
	startI = 0;
	countF = 0;

	if (valAttr.substring(0,1).equals("/"))
	{
		valOfAttrT = serviceURL.substring(0,serviceURL.indexOf("/",8)) + valAttr;
	}
	else if (!valAttr.substring(0,1).equals("/") && valAttr.length()==1)
	{
		valOfAttrT = valAttr;
	}
	else if (valAttr.substring(0,2).equals("./"))
	{
		valOfAttrT = serviceURL.substring(0,serviceURL.lastIndexOf("/")+1) + valAttr.substring(2,valAttr.length());
	}
	else
	{
		valOfAttrT = serviceURL.substring(0,serviceURL.lastIndexOf("/")+1) + valAttr;
	}

	if (valAttr.indexOf("../",startI) != -1)
	{
		String serviceURLt = serviceURL;
		while (valAttr.indexOf("../",startI) != -1)
		{
			countF++;
			startI = valAttr.indexOf("../",startI) + 3;
		}
		for (int i=0; i<countF+1; i++)
		{
			serviceURLt = serviceURLt.substring(0,serviceURLt.lastIndexOf("/",serviceURLt.length()));
		}
		valOfAttrT = serviceURLt + "/" + valAttr.substring(startI,valAttr.length());
	}
	return valOfAttrT;
  }
  //Initiate the HTML reading, and if successful, return the XML document
  public Document getDocument() throws IOException
  {
    if (readHTML())
    {
      return extractAndCreateDOM();
    }
    return null;
  }

  //Convenience inner data classes
  class ProcInstruct
  {
    private String target;
    private String data;
  }

  class TempStack
  {
	private Element[] tag;
  }

}