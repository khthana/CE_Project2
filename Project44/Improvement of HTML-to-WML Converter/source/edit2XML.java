import java.io.*;
import java.lang.*;

class edit2XML
{
	private static int indexFile;
	private static String xml = "";
	private static String current_url = "";
	private static String short_url = "";

	private static String[] EnName = { "&sp;","&excl;","&quot;","&num;","&dollar;","&percnt;","&amp;","&apos;",
							"&lpar;","&rpar;","&ast;","&plus;","&comma;","&hyphen;","&minus;","&period;",
							"&sol;","&colon;","&semi;","&lt;","&equals;","&qt;","&quest;","&commat;",
							"&lsqb;","&bsol;","&rsqb;","&circ;","&lowbar;","&horbar;","&grave;","&lcub;",
							"&verbar;","&rcub;","&tilde;","&lsquor;","&fnof;","&ldquor;","&hellip;","&ldots;",
							"&dagger;","&Dagger;","&permil;","&Scaron;","&lsaquo;","&OElig;","&lsquo;","&rsquor;",
							"&rsquo;","&ldquo;","&rdquor;","&rdquo;","&bull;","&ndash;","&endash;","&mdash;",
							"&emdash;","&trade;","&scaron;","&rsaquo;","&oelig;","&Yuml;","&nbsp;","&iexcl;",
							"&cent;","&pound;","&curren;","&yen;","&brvbar;","&brkbar;","&sect;","&uml;",
							"&die;","&copy;","&ordf;","&laquo;","&not;","&shy;","&reg;","&macr;",
							"&hibar;","&deg;","&plusmn;","&sup2;","&sup3;","&acute;","&micro;","&para;",
							"&middot;","&cedil;","&sup1;","&ordm;","&raquo;","&frac14;","&frac12;","&half;",
							"&frac34;","&iquest;","&Agrave;","&Aacute;","&Acirc;","&Atilde;","&Auml;","&Aring;",
							"&AElig;","&Ccedil;","&Egrave;","&Eacute;","&Ecirc;","&Euml;","&Igrave;","&Iacute;",
							"&Icirc;","&Iuml;","&ETH;","&Ntilde;","&Ograve;","&Oacute;","&Ocirc;","&Otilde;",
							"&Ouml;","&times;","&Oslash;","&Ugrave;","&Uacute;","&Ucirc;","&Uuml;","&Yacute;",
							"&THORN;","&szlig;","&agrave;","&aacute;","&acirc;","&atilde;","&auml;","&aring;",
							"&aelig;","&ccedil;","&egrave;","&eacute;","&ecirc;","&euml;","&igrave;","&iacute;",
							"&icirc;","&iuml;","&eth;","&ntilde;","&ograve;","&oacute;","&ocirc;","&otilde;",
							"&ouml;","&divide;","&oslash;","&ugrave;","&uacute;","&ucirc;","&uuml;","&yacute;",
							"&thorn;","&yuml;"};

	private static String[] DEC ={  "&#032;","&#033;","&#034;","&#035;","&#036;","&#037;","&#038;","&#039;",
								    "&#040;","&#041;","&#042;","&#043;","&#044;","&#045;","&#045;","&#046;",
								    "&#047;","&#058;","&#059;","&#060;","&#061;","&#062;","&#063;","&#064;",
								    "&#091;","&#092;","&#093;","&#094;","&#095;","&#095;","&#096;","&#123;",
								    "&#124;","&#125;","&#126;","&#130;","&#131;","&#132;","&#133;","&#133;",
								    "&#134;","&#135;","&#137;","&#138;","&#139;","&#140;","&#145;","&#145;",
								    "&#146;","&#147;","&#147;","&#148;","&#149;","&#150;","&#150;","&#151;",
								    "&#151;","&#153;","&#154;","&#155;","&#156;","&#159;","&#160;","&#161;",
									"&#162;","&#163;","&#164;","&#165;","&#166;","&#166;","&#167;","&#168;",
									"&#168;","&#169;","&#170;","&#171;","&#172;","&#173;","&#174;","&#175;",
									"&#175;","&#176;","&#177;","&#178;","&#179;","&#180;","&#181;","&#182;",
									"&#183;","&#184;","&#185;","&#186;","&#187;","&#188;","&#189;","&#189;",
									"&#190;","&#191;","&#192;","&#193;","&#194;","&#195;","&#196;","&#197;",
									"&#198;","&#199;","&#200;","&#201;","&#202;","&#203;","&#204;","&#205;",
									"&#206;","&#207;","&#208;","&#209;","&#210;","&#211;","&#212;","&#213;",
									"&#214;","&#215;","&#216;","&#217;","&#218;","&#219;","&#220;","&#221;",
									"&#222;","&#223;","&#224;","&#225;","&#226;","&#227;","&#228;","&#229;",
									"&#230;","&#231;","&#232;","&#233;","&#234;","&#235;","&#236;","&#237;",
									"&#238;","&#239;","&#240;","&#241;","&#242;","&#243;","&#244;","&#245;",
									"&#246;","&#247;","&#248;","&#249;","&#250;","&#251;","&#252;","&#253;",
									"&#254;","&#255;"};
	public static String Swap(String st) 
	{	// swap entity name to character reference (DEC)
	//	System.out.println("before swap");
		for (int i=0; i<DEC.length; i++)
		{
			st=st.replaceAll(EnName[i],DEC[i]);
		}
	//	System.out.println("after swap");
		return st;
	}

	public static boolean isXhtml(String str)
	{   
		boolean boo = false;
		int indexDoctype = str.indexOf("<!DOCTYPE");
		if (indexDoctype == -1)
		{
			return false;
		}
		else
		{
			int indexend = str.indexOf(">",indexDoctype);
			String st = str.substring(indexDoctype,indexend);
			int xhtml = st.indexOf("xhtml");
			if (xhtml != -1)
			{
				return true;
			}
			else return false;
		}
	}

	private static String findTag(String tag)
	{	// FIND TAG NAME
		int index = 0;
		String tagBody = "";
		while ((index<tag.length())&&(tag.charAt(index) != '>')&&(tag.charAt(index) != ' ')&&(tag.charAt(index) != '\r'))
		{	// Get only tag name
			tagBody += tag.charAt(index);
			index++;
		}
		tagBody += ">";
		tagBody = tagBody.toLowerCase();
		if (tagBody.regionMatches(0,"<!--",0,4))
		{
			return "<!-->";
		}
		return tagBody;
	}

	private static boolean IsBooAttr(String tag)
	{
		int count = 0;
		String[] booAttr = {"compact", "nowrap", "ismap", "declare", "noshade", "checked", "disabled", 
							"readonly","multiple", "selected", "noresize","nohref", "defer"};
		for (int i=0; i<booAttr.length; i++)
		{
			if (tag.equals(booAttr[i]))
			{
				return true;
			}
		}
		return false;
	}
	
	private static String convLower(String strbuffer)
	{
		int indexOfBlank = strbuffer.indexOf("\""); //blank = "
		boolean conv = false;
		boolean toLow = false;
		int indexcomment = strbuffer.indexOf("<!--");
		if (indexcomment != -1)
		{	
			strbuffer = strbuffer.substring(0,indexcomment)+"<!-- "+strbuffer.substring(indexcomment+4,strbuffer.length());
			return strbuffer;
		}
		else if (indexOfBlank == -1)
		{
			strbuffer = strbuffer.toLowerCase();
			return strbuffer;
		}
		else
		{
			String buffer = "";
			String attribute = strbuffer.substring(0,indexOfBlank+1);
			attribute = attribute.toLowerCase();
			int indexType = attribute.indexOf("type");
			int indexMethod = attribute.indexOf("method");
			int indexalign = buffer.indexOf("align");
				if ((indexType != -1)||(indexMethod != -1))
				{
					toLow = true;
				}
		/*	int indexName = attribute.indexOf("name");
				if (indexName!=-1)
				{
					attribute = attribute.substring(0,indexName)+"id=\"";
				}*/
			int nextBlank = strbuffer.indexOf("\"",indexOfBlank+1);
			while (nextBlank != -1)
			{
				buffer = strbuffer.substring(indexOfBlank+1,nextBlank+1);
					if (conv)
					{
						buffer = buffer.toLowerCase();
						indexType = buffer.indexOf("type");
						indexMethod = buffer.indexOf("method");
						indexalign = buffer.indexOf("align");
						if ((indexType != -1)||(indexMethod != -1)||(indexalign != -1))
						{
							toLow = true;
						}
				/*		indexName = buffer.indexOf("name");
						if (indexName!=-1)
						{
							buffer = "id=\"";
						}*/
						attribute += buffer.trim();
						conv = false;
					}
					else 
					{
						if (toLow)
						{
							buffer = buffer.toLowerCase();
							toLow = false;
						}
						conv = true;
						attribute += buffer.trim()+" ";
					}
					
				indexOfBlank = nextBlank;
				nextBlank = strbuffer.indexOf("\"",indexOfBlank+1);
			}
			attribute = attribute.substring(0,attribute.length()-1);
			return attribute;
		}
	}
	
	private static String convAttribute(String strbuffer)//add "
	{	
		int indexOfBlank = strbuffer.indexOf(" ");
		if (indexOfBlank == -1)
		{
			return strbuffer;
		}
		else
		{
			boolean plusDq = false;
			String buff = "";
			String buffer = "";
			String buffer2 = "";
			int indexOfEqual = 0;
			int indexOfQuot = 0;
			String attribute = strbuffer.substring(0,indexOfBlank+1);
			int nextBlank = strbuffer.indexOf(" ",indexOfBlank+1);
			while (nextBlank != -1)
			{
				buffer = strbuffer.substring(indexOfBlank+1,nextBlank);
				indexOfEqual = buffer.indexOf("=");
				indexOfQuot = buffer.indexOf("\"");
				if (indexOfEqual == -1)
				{
					buff = buffer;
					buff = buff.toLowerCase();
					buff = buff.trim();
					if (IsBooAttr(buff))
					{
						attribute += buff+"=\""+buff+"\" ";
					}
					else 
					{
						if (indexOfQuot == -1)      //case it not have "
						{   
							if (plusDq)
							{ 
								attribute += "\""+buffer.trim()+"\" ";
								plusDq = false;
							}
							else 
							{
								plusDq = false;
								attribute += buffer.trim();
							}
						}
						else
						{									 //case have "
							attribute += buffer.trim()+" ";
							plusDq = false;
						}
					}
				}
				else{	     //buffer have =
							if (indexOfEqual+1 != buffer.length())
							{
								buffer2 = buffer.substring(indexOfEqual+1,buffer.length());
								indexOfQuot = buffer2.indexOf("\"");
									if (indexOfQuot == -1)
									{								
										attribute += buffer.substring(0,indexOfEqual+1) + "\"" + buffer2 + "\" ";
									}
									else
									{
										attribute += buffer.substring(0,indexOfEqual+1) + buffer2 + " ";
									}
								plusDq = false;
							}
							else 
							{
								attribute += buffer.trim();
								plusDq = true;
							}
							
					}
				indexOfBlank = nextBlank;
				nextBlank = strbuffer.indexOf(" ",indexOfBlank+1);
			}
			buffer = strbuffer.substring(indexOfBlank+1,strbuffer.length());
			indexOfEqual = buffer.indexOf("=");
			indexOfQuot = buffer.indexOf("\"");
			if (indexOfEqual == -1)
			{	
				buff = buffer;
				buff = buff.toLowerCase();
				buff = buff.trim();
				if (IsBooAttr(buff))
				{
					attribute += buff+"=\""+buff+"\" ";
				}
				else 
				{
					if (indexOfQuot == -1)      //case it not have "
					{   
						if (plusDq)
						{
							attribute += "\""+buffer.trim()+"\" ";
							plusDq = false;
						}
						else 
						{
							attribute += buffer.trim();
							plusDq = false;
						}
					}
					else
					{
						attribute += buffer.trim()+" ";
						plusDq = false;
					}
				}
			}
			else     // found =
			{
				buffer2 = buffer.substring(indexOfEqual+1,buffer.length());
				indexOfQuot = buffer2.indexOf("\"");
					if (indexOfQuot == -1)
					{
						attribute += buffer.substring(0,indexOfEqual+1) + "\"" + buffer2 + "\" ";
					}
					else
					{
						attribute += buffer.substring(0,indexOfEqual+1) + buffer2 + " ";
					}
			}
			return attribute;
		}
	}

	private static String plusUrl(String link)
	{
		String link2 = "";
		int indexHttp = link.indexOf("http");
		if (indexHttp == -1)
		{	// Not have "http://"
			if (link.charAt(0) == '/')
			{
				link2 = short_url + link;
			}
			else
			{
				link2 = current_url + link;
			}
		}
		else
		{
			link2 = link;
		}
		return link2;
	}

	private static void convBody(String strBuffer)
	{
		int indexHref = strBuffer.indexOf("background=");
		if (indexHref == -1)
		{
			xml += strBuffer + ">";
		}
		else
		{
			indexHref += 12;
			int indexEnd = strBuffer.indexOf("\"",indexHref);
			String link = strBuffer.substring(indexHref,indexEnd);	// Don't get ".
			link = plusUrl(link);
			xml += strBuffer.substring(0,indexHref) + link + strBuffer.substring(indexEnd,strBuffer.length()) + ">";
		}
	}

	private static void convHref(String strBuffer,String key)
	{
		int indexHref = strBuffer.indexOf("href=");
		if (indexHref == -1)
		{
			xml += key + "href=\"http://161.246.6.222:8080/webdav/nothave.html\">";
		}
		else
		{
			indexHref += 6;
			int indexEnd = strBuffer.indexOf("\"",indexHref);
			String link = strBuffer.substring(indexHref,indexEnd);	// Don't get ".
			link = plusUrl(link);
			xml += strBuffer.substring(0,indexHref) + link + strBuffer.substring(indexEnd,strBuffer.length()) + ">";
		}
	}

	private static void convSrc(String strBuffer,String key)  
	{
		int indexSrc = strBuffer.indexOf("src=");
		if (indexSrc == -1)
		{
			xml += key + "href=\"http://161.246.6.222:8080/webdav/nothave.html\">";
		}
		else
		{
			indexSrc += 5;
			int indexEnd = strBuffer.indexOf("\"",indexSrc);
			String link = strBuffer.substring(indexSrc,indexEnd);	// Don't get ".
			link = plusUrl(link);
			xml += strBuffer.substring(0,indexSrc) + link + strBuffer.substring(indexEnd,strBuffer.length()) + ">";
		}
	}

	private static void convImg(String strBuffer)  
	{
		int indexSrc = strBuffer.indexOf("src=");
		if (indexSrc == -1)
		{
			xml += "<img src=\"http://161.246.6.222:8080/webdav/nothave.gif\">";
		}
		else
		{
			indexSrc += 5;
			int indexEnd = strBuffer.indexOf("\"",indexSrc);
			String link = strBuffer.substring(indexSrc,indexEnd);	// Don't get ".
			link = plusUrl(link);
			xml += strBuffer.substring(0,indexSrc) + link + strBuffer.substring(indexEnd,strBuffer.length()) + ">";
		}
	}

	private static void convInput(String strBuffer)  //edit
	{
		int indexType = strBuffer.indexOf("type=");
		if (indexType == -1)
		{
			xml += "<input type=\"text\" " + strBuffer.substring(7,strBuffer.length()) + ">";
		}
		else 
		{
			indexType += 6;
			int indexEnd = strBuffer.indexOf("\"",indexType+1);
			String type = strBuffer.substring(indexType,indexEnd);
			if (type.equals("image"))
			{
				int indexSrc = strBuffer.indexOf("src=");
				if (indexSrc == -1)
				{
					xml += "<input type=\"image\" src=\"http://161.246.6.222:8080/webdav/nothave.gif\">";
				}
				else
				{
					indexSrc += 5;
					indexEnd = strBuffer.indexOf("\"",indexSrc);
					String link = strBuffer.substring(indexSrc,indexEnd);	// Don't get ".
					link = plusUrl(link);
					xml += strBuffer.substring(0,indexSrc) + link + strBuffer.substring(indexEnd,strBuffer.length()) + ">";
				}
			}
			else
			{
				xml += strBuffer + ">";
			}
		}
	}

	private static void convForm(String strBuffer)  
	{
		int indexAction = strBuffer.indexOf("action=");
		if (indexAction == -1)
		{
			xml += "<form action=\"http://161.246.6.222:8080/webdav/nothave.html\">";
		}
		else
		{
			indexAction += 8;
			int indexEnd = strBuffer.indexOf("\"",indexAction);
			String link = strBuffer.substring(indexAction,indexEnd);	// Don't get ".
			link = plusUrl(link);
			xml += strBuffer.substring(0,indexAction) + link + strBuffer.substring(indexEnd,strBuffer.length()) + ">";
		}
	}

	private static void convHead(String strBuffer)
	{
		int indexHref = strBuffer.indexOf("profile");
		if (indexHref == -1)
		{
			xml += strBuffer + ">";
		}
		else
		{
			indexHref += 9;
			int indexEnd = strBuffer.indexOf("\"",indexHref+1);
			String link = strBuffer.substring(indexHref,indexEnd);	// Don't get ".
			link = plusUrl(link);
			xml += strBuffer.substring(0,indexHref) + link + strBuffer.substring(indexEnd,strBuffer.length()) + ">";
		}
	}

	public static String convToXML(String html,String url,String url_s)
	{	//Convert to XML
		xml = "<?xml version=\"1.0\"?>";
		indexFile = 0;
		current_url = url;
		short_url = url_s;
		String strBuffer = "";
		String tagName = "";
	//	System.out.println("in conv to xml");
		int indexS = html.indexOf('<');
		html = html.substring(indexS,html.length());
		while (indexFile < html.length())
		{
			if (html.charAt(indexFile) == '<')
			{
				strBuffer = "";
				while (html.charAt(indexFile) != '>')
				{	
					strBuffer += html.charAt(indexFile);
					indexFile++;
				}
				indexFile++;
				tagName = findTag(strBuffer);
	//			System.out.println("tag="+tagName);
				if ((!tagName.equals("<!doctype>"))&&(!tagName.equals("<!DOCTYPE>"))&&(!tagName.equals("<!-->")))
				{
					strBuffer = convAttribute(strBuffer);
					strBuffer = convLower(strBuffer);
				}
				// Got tagName and perfect strBuffer.
				if (tagName.equals("<!-->"))
				{	// COMMENT
					int closeComment = html.indexOf("-->",indexFile-strBuffer.length()-1) + 3;
					xml += html.substring(indexFile-strBuffer.length()-1,closeComment);
					indexFile = closeComment;
				}
				else if ((tagName.equals("<!doctype>"))||(tagName.equals("<!DOCTYPE>")))
				{
					xml += strBuffer + ">\n";
				}
				else if (tagName.equals("<base>"))
				{	// <BASE>
					int indexFileName = strBuffer.indexOf("href=") + 6;
					int indexEnd = strBuffer.indexOf("\"",indexFileName+1);
					current_url = strBuffer.substring(indexFileName,indexEnd);
				}
				else if (tagName.equals("<body>"))
				{	// <BODY>
					convBody(strBuffer);
				}
				else if (tagName.equals("<a>"))
				{	// <A>
					convHref(strBuffer,"<a ");
				}
				else if (tagName.equals("<link>"))
				{	// <LINK>
					convHref(strBuffer,"<link ");
				}
				else if (tagName.equals("<img>"))
				{	// <IMG>
					convImg(strBuffer);
				}
				else if (tagName.equals("<frame>"))
				{	// <FRAME>
					convSrc(strBuffer,"<frame ");
				}
				else if (tagName.equals("<iframe>"))
				{	// <IFRAME>
					convSrc(strBuffer,"<iframe ");
				}
				else if (tagName.equals("<form>"))
				{	// <FORM>
					convForm(strBuffer);
				}
				else if (tagName.equals("<input>"))
				{	// <INPUT>
					convInput(strBuffer);
				}
				else if (tagName.equals("<area>"))
				{	// <AREA>
					convHref(strBuffer,"<area ");
				}
				else if (tagName.equals("<head>"))
				{	// <HEAD>
					convHead(strBuffer);
				}
				else
				{	// Not Match Any Tag.
					xml += strBuffer + ">";
				}
			}
			else 
			{	//Not in tag.
				xml += html.charAt(indexFile);
				indexFile++;
			}
		}
		return xml;
	}

	private static boolean IsEmptyTag(String tag)
	{	// CHECK THIS TAG IS  EMPTY TAG?
		String[] emptyTag = {"<area>","<base>","<basefont>","<br>","<col>","<hr>","<img>","<isindex>",
							 "<meta>","<param>","<link>","<input>","<frame>"};
		for (int i=0; i<emptyTag.length; i++)
		{
			if (tag.equals(emptyTag[i]))
			{
				return true;	
			}
		}
		return false;
	}

	public static String editEmptyTag(String html)
	{
		xml = "";
		indexFile = 0;
		String strBuffer = "";
		String tagName = "";
		while (indexFile < html.length())
		{
			if (html.charAt(indexFile) == '<')
			{
				strBuffer = "";
				while (html.charAt(indexFile) != '>')
				{	
					strBuffer += html.charAt(indexFile);
					indexFile++;
				}
				indexFile++;
				tagName = findTag(strBuffer);
//				System.out.println("empty tag="+tagName);
				if (IsEmptyTag(tagName))
				{	// Empty Tag.
					xml += (strBuffer + " />");
				}
				else
				{	// Not Match Any Tag.
					xml += strBuffer + ">";
				}
			}
			else
			{	// Not in tag.
				xml += html.charAt(indexFile);
				indexFile++;
			}
		}
		return xml;
	}

	public static String addURL(String html,String url,String url_s)
	{
		xml = "";
		indexFile = 0;
		current_url = url;
		short_url = url_s;
		String strBuffer = "";
		String tagName = "";
		while (indexFile < html.length())
		{
			if (html.charAt(indexFile) == '<')
			{
				strBuffer = "";
				while (html.charAt(indexFile) != '>')
				{	
					strBuffer += html.charAt(indexFile);
					indexFile++;
				}
				indexFile++;
				tagName = findTag(strBuffer);
				if (tagName.equals("<!-->"))
				{	// COMMENT
					int closeComment = html.indexOf("-->",indexFile-strBuffer.length()-1) + 3;
					xml += html.substring(indexFile-strBuffer.length()-1,closeComment);
					indexFile = closeComment;
				}
				else if ((tagName.equals("<!doctype>"))||(tagName.equals("<!DOCTYPE")))
				{
					xml += strBuffer + ">\n";
				}
				else if (tagName.equals("<base>"))
				{	// <BASE>
					int indexFileName = strBuffer.indexOf("href=") + 6;
					int indexEnd = strBuffer.indexOf("\"",indexFileName+1);
					current_url = strBuffer.substring(indexFileName,indexEnd);
				}
				else if (tagName.equals("<body>"))
				{	// <BODY>
					convBody(strBuffer);
				}
				else if (tagName.equals("<a>"))
				{	// <A>
					convHref(strBuffer,"<a ");
				}
				else if (tagName.equals("<link>"))
				{	// <LINK>
					convHref(strBuffer,"<link ");
				}
				else if (tagName.equals("<img>"))
				{	// <IMG>
					convImg(strBuffer);
				}
				else if (tagName.equals("<frame>"))
				{	// <FRAME>
					convSrc(strBuffer,"<frame ");
				}
				else if (tagName.equals("<iframe>"))
				{	// <IFRAME>
					convSrc(strBuffer,"<iframe ");
				}
				else if (tagName.equals("<form>"))
				{	// <FORM>
					convForm(strBuffer);
				}
				else if (tagName.equals("<input>"))
				{	// <INPUT>
					convInput(strBuffer);
				}
				else if (tagName.equals("<area>"))
				{	// <AREA>
					convHref(strBuffer,"<area ");
				}
				else if (tagName.equals("<head>"))
				{	// <HEAD>
					convHead(strBuffer);
				}
				else
				{	// Not Match Any Tag.
					xml += strBuffer + ">";
				}
			}
			else 
			{	//Not in tag.
				xml += html.charAt(indexFile);
				indexFile++;
			}
		}
		return xml;
	}
}