import java.io.*;
import java.lang.*;

class Conv2xhtml
{
	private static String title;
	private static int baseSize = 2;
	private static int indexArr;
	private static String[] tagArr = new String[256];//Keep total tag in file
	private static int tagRemain;         //deprecateted tag

	private static boolean IsTag(String tag)
	{
		boolean boo = false; //html<tag>
		String[] tagList = {"<a>","<abbr>","<acronym>","<address>","<b>","<bdo>","<big>","<blockquote>",
							"<body>","<button>","<caption>","<cite>","<code>","<col>","<colgroup>","<dd>",
							"<del>","<dfn>","<div>","<dl>","<dt>","<em>","<fieldset>","<form>","<frame>",
							"<frameset>","<h1>","<h2>","<h3>","<h4>","<h5>","<h6>","<head>","<html>","<i>",
							"<iframe>","<input>","<ins>","<kbd>","<label>","<legend>","<li>","<link>",
							"<map>","<meta>","<noframes>","<noscript>","<object>","<ol>","<optgroup>",
							"<option>","<p>","<param>","<pre>","<q>","<samp>","<script>","<select>",
							"<small>","<span>","<strong>","<style>","<sub>","<sup>","<table>","<tbody>",
							"<td>","<textarea>","<tfoot>","<th>","<thead>","<title>","<tr>","<tt>","<ul>",
							"<var>","<?xml>","<!doctype>","<!DOCTYPE>","<applet>","<basefont>","<center>",
							"<dir>","<font>","<isindex>","<listing>","<menu>","<plaintext>","<s>","<strike>",
							"<u>","<xmp>","<audioscope>","<abbrev>","<app>","<au>","<abstract>","<added>",
							"<bannner>","<bgsound>","<blackface>","<blink>","<bq>","<credit>","<changed>",
							"<comment>","<embed>","<fig>","<footnote>","<fn>","<hpn>","<htmlplus>","<image>",
							"<interpret>","<ismap>","<keygen>","<lh>","<l>","<layer>","<lang>","<lit>",
							"<limittext>","<math>","<mh>","<margin>","<marquee>","<multicol>","<nextid>",
							"<note>","<nolayer>","<nobr>","<noembed>","<nosmartquotes>","<overlay>","<online>",
							"<person>","<printed>","<quote>","<range>","<render>","<removed>","<rt>","<search>",
							"<server>","<shadow>","<sherlockitem>","<sidebar>","<sound>","<spot>","<spacer>",
							"<tab>","<textflow>","<tfoot>","<thead>","<wbr>","<xblk>","<xblu>","<xgrn>","<xml>",
							"<xred>","<xwhi>","<xyel>"};
		for (int i=0; i<tagList.length; i++)
		{
			if (tag.equals(tagList[i]))
			{
				boo = true;
			}
		}
		return boo;
	}

	private static boolean IsEmptyTag(String tag)
	{
		boolean boo = false;
		String[] emptyTag = {"<area>","<base>","<br>","<hr>","<img>","<!-->","<isindex>","<basefont>",
							 "<col>","<meta>","<param>","<link>","<frame>","<input>","<bgsound>","<overlay>",
							 "<tab>","<ismap>","<rt>"};
		for (int i=0; i<emptyTag.length; i++)
		{
			if (tag.equals(emptyTag[i]))
			{
				boo = true;	
			}
		}
		return boo;
	}

	private static boolean NotStandardTag(String tag)
	{
		boolean boo = false;
		String[] notStandardTag = {"<audioscope>","<abbrev>","<app>","<au>","<abstract>","<added>","<bannner>",
								   "<blackface>","<blink>","<bq>","<credit>","<changed>","<comment>","<embed>",
								   "<fig>","<footnote>","<fn>","<hpn>","<htmlplus>","<image>","<interpret>",
								   "<keygen>","<lh>","<l>","<layer>","<lang>","<lit>","<limittext>","<math>",
								   "<mh>","<margin>","<marquee>","<multicol>","<nextid>","<note>","<nolayer>",
								   "<nobr>","<noembed>","<nosmartquotes>","<online>","<person>","<printed>",
								   "<quote>","<range>","<render>","<removed>","<search>","<server>","<shadow>",
								   "<sherlockitem>","<sidebar>","<sound>","<spot>","<spacer>","<textflow>",
								   "<tfoot>","<thead>","<wbr>","<xblk>","<xblu>","<xgrn>","<xml>","<xred>",
								   "<xwhi>","<xyel>"};
		for (int i=0; i<notStandardTag.length; i++)
		{
			if (tag.equals(notStandardTag[i]))
			{
				boo = true;	
			}
		}
		return boo;
	}

	private static boolean NotConvert(String tag)
	{
		boolean boo = true;			//deprecated tag 
		String[] depreTag = {"<applet>","<basefont>","<center>","<dir>","<font>","<isindex>","<listing>",
							 "<menu>","<plaintext>","<s>","<strike>","<u>","<xmp>"};
		for (int i=0; i<depreTag.length; i++)
		{
			if (tag.equals(depreTag[i]))
			{
				boo = false;	
			}
		}
		return boo;
	}

	private static void FindClose(String str)
	{
		int strLength = str.length();
		String st = "";//Well Form HTML
		String tagBody = "";//Start Tag
		String tagClose = "";//Close Tag
		String[] tempTagArr = new String[256];//Keep total tag in file
		int arrIndex = 0;//Index of array
		int index = 0;//Index of String
		int tagLength = 0;
		int count = 0;

		/*************************/
		//Put total tag to array //
		/*************************/
		while (index < strLength)
		{
			if (str.charAt(index) == '<')
			{
				tagBody = "<";
				index++;
				while ((str.charAt(index) != '>')&&(str.charAt(index) != ' ')&&(index<strLength))//Get only tag name
				{
					tagBody += str.charAt(index);
					index++;
					count++;
				}
				if (index == strLength)
				{
					System.out.println("ERROR! please replace < with &lt");
					System.exit(1);
				}
				tagBody += '>';
				if (IsTag(tagBody))
				{
					tempTagArr[arrIndex] = tagBody;
				}
				else if (tagBody.regionMatches(0,"<!--",0,4))
				{
					tempTagArr[arrIndex] = "<!-->";
					index = str.indexOf("-->",index-tagBody.length())+2;
				}
				else if (IsEmptyTag(tagBody))
				{
					tempTagArr[arrIndex] = tagBody;
				}
				else if (tagBody.charAt(1) == '/')
				{
					tempTagArr[arrIndex] = tagBody;
				}
				else
				{
					System.out.println("ERROR! tag doesn't have in html tag");
					System.out.println(tagBody);
					System.exit(1);
				}
				index++;
				arrIndex++;
			}
			else index++;
		}
		/********************************/
		//Check how many same tag in it //
		/********************************/
		index = arrIndex-1; //Set index to number of total tag
		arrIndex = 0;
		int count2; //How many same tag in this tag
		while (arrIndex < index)
		{
			tagBody = tempTagArr[arrIndex];
			if ((!(IsEmptyTag(tagBody)))&&(tagBody.charAt(1) != '/'))
			{
				tagLength = tagBody.length();
				tagClose = "</" + tagBody.substring(1,tagLength);
				count = 0;
				count2 = -1;
				for (int i=arrIndex; i<=index; i++)
				{
					if (tempTagArr[i].equals(tagBody))
					{
						count2++;
						count++;
					}
					else if (tempTagArr[i].equals(tagClose))
					{
						count--;
					}
					if (count == 0)
					{
						break;
					}
				}
				tempTagArr[arrIndex] = count2 + tagBody;
			}
			arrIndex++;
		}

		int in = 0;
		count = 0;
		while (tempTagArr[count] != null)
		{
			if ((tempTagArr[count].charAt(1) != '/')||(tempTagArr[count].equals("</form>")))
			{
				tagArr[in] = tempTagArr[count];
				in++;
			}
			count++;
		}
	}

	private static String head(String str)  
	{
		int indexClose = 0;
		int indexStart = 0;
		
			indexStart = str.indexOf("<html");
			indexStart = str.indexOf(">",indexStart);
			indexClose = str.indexOf("</html>");

			while (indexClose < str.length()-18)
			{
				indexClose = str.indexOf("</html>",indexClose+1);
			}
			String st = str.substring(indexStart+1,indexClose);
			st += "</html>";
			return st;
	}

	private static String findTag(String tag)
	{	// FIND TAG NAME
		int index = 0;
		String tagBody = "";
		while ((index<tag.length())&&(tag.charAt(index) != '>')&&(tag.charAt(index) != ' ')&&(tag.charAt(index) != '\r'))
		{	//Get only tag name
			tagBody += tag.charAt(index);
			index++;
		}
		tagBody += ">";
		if (tagBody.regionMatches(0,"<!--",0,4))
		{
			return "<!-->";
		}
		return tagBody;
	}

	private static int convsize(String s) 
	{
		int size = 0;
		char g = s.charAt(0);
	    switch (g)
	    {
			case '0': size = 10;
					  break;
			case '1': size = 10;
					  break;
			case '2': size = 12;
					  break;
			case '3': size = 16;
					  break;
			case '4': size = 18;
					  break;
			case '5': size = 24;
					  break;
			case '6': size = 32;
					  break;
			case '7': size = 48;
					  break;
			default : size = 48;
	    }
		return size;
	}

	private static Doc convTag(Doc doc,String tagName,String html,int type,String element)
	{
		doc.indexFile++;
		int indexClose = 0;
		String tagClose = "</" + tagName.substring(1,tagName.length());

			int num = (int)tagArr[indexArr].charAt(0);
			num -= 48;
			indexClose = doc.indexFile;
			for (int i=0; i<=num; i++)
			{
				indexClose = html.indexOf(tagClose,indexClose+1);
			}
			String inTag = "";
		//	System.out.println("indexclose"+indexClose);
			if (indexClose != -1)
			{
				inTag = html.substring(doc.indexFile,indexClose);
				indexArr++;
				inTag = convert(inTag);
				doc.indexFile = indexClose+tagClose.length();
			}
			else 
			{
				indexArr++;
				doc.indexFile += tagClose.length(); 
			}
			/*inTag = html.substring(doc.indexFile,indexClose);
			indexArr++;
			inTag = convert(inTag);*/
			//doc.indexFile = indexClose+tagClose.length();
			switch (type)
			{
				case 0: if (tagName.equals("<style>"))
						{	
					//		System.out.println("go in style");
							indexArr++;
						}
						doc.wmlFile += element;		//Convert to Same
						doc.wmlFile += inTag + tagClose;
						break;
				case 1: if ((tagName.equals("<strike>"))||(tagName.equals("<s>")))
						{
							doc.wmlFile += "<del>";				
							doc.wmlFile += inTag+"</del>";
						}
						else if (tagName.equals("<center>"))
						{
							doc.wmlFile += "<p align=\"center\">";			
							doc.wmlFile += inTag+"</p>";
						}
						else
						{
							doc.wmlFile += "<p style=\"text-decoration: underline\">";				
							doc.wmlFile += inTag+"</p>";
						}
						break;
				case 2: doc.wmlFile += "<pre>";				//Convert to pre
						doc.wmlFile += inTag + "</pre>";
						break;
				case 3: doc.wmlFile += "<ul>";				//Convert to ul
						doc.wmlFile += inTag + "</ul>";
						break;
				case 4:	break;								//Delete All
				case 5: 	
							int indexCode = element.indexOf("code");
							int indexWidth = element.indexOf("width");
							int indexHeight = element.indexOf("height");
							int indexAlt = element.indexOf("alt");
							int indexCodebase = element.indexOf("codebase");
							int indexName = element.indexOf("name");
							int indexAlign = element.indexOf("align");
							int indexVspace = element.indexOf("vspace");
							int indexHspace = element.indexOf("hspace");
							int indexArchive = element.indexOf("archive");
							int indexObject = element.indexOf("object");

								doc.wmlFile += "<object ";
									
								if (indexCode != -1)
								{   
									int indexEnd = element.indexOf(" ",indexCode+1);
									if (indexEnd == -1)
									{
									  indexEnd = element.length()-2;
									}
									else { indexEnd--; } 
									doc.wmlFile += "classid=\"java:" + element.substring(indexCode+6,indexEnd) + "\" ";
								}
								if (indexWidth != -1)
								{
									int indexEnd = element.indexOf(" ",indexWidth+1);
									if (indexEnd == -1)
									{
									  indexEnd = element.length()-2;
									}
									else { indexEnd--; }
									doc.wmlFile += "width=\"" + element.substring(indexWidth+7,indexEnd) + "\" ";
								}
								if (indexHeight != -1)
								{   
									int indexEnd = element.indexOf(" ",indexHeight+1);
									if (indexEnd == -1)
									{
									  indexEnd = element.length()-2;
									}
									else { indexEnd--; } 
									doc.wmlFile += "height=\"" + element.substring(indexHeight+8,indexEnd) + "\" ";
								}
								if (indexAlt != -1)
								{
									int indexEnd = element.indexOf(" ",indexAlt+1);
									if (indexEnd == -1)
									{
									  indexEnd = element.length()-2;
									}
									else { indexEnd--; }
									doc.wmlFile += "standby=\"" + element.substring(indexAlt+5,indexEnd) + "\" ";
								}
								if (indexCodebase != -1)
								{   
									int indexEnd = element.indexOf(" ",indexCodebase+1);
									if (indexEnd == -1)
									{
									  indexEnd = element.length()-2;
									}
									else { indexEnd--; } 
									doc.wmlFile += "codebase=\"" + element.substring(indexCodebase+10,indexEnd) + "\" ";
								}
								if (indexName != -1)
								{
									int indexEnd = element.indexOf(" ",indexName+1);
									if (indexEnd == -1)
									{
									  indexEnd = element.length()-2;
									}
									else { indexEnd--; }
									doc.wmlFile += "title=\"" + element.substring(indexName+6,indexEnd) + "\" ";
								}
								if (indexAlign != -1)
								{   
									int indexEnd = element.indexOf(" ",indexAlign+1);
									if (indexEnd == -1)
									{
									  indexEnd = element.length()-2;
									}
									else { indexEnd--; } 
									doc.wmlFile += "align=\"" + element.substring(indexAlign+7,indexEnd) + "\" ";
								}
								if (indexVspace != -1)
								{
									int indexEnd = element.indexOf(" ",indexVspace+1);
									if (indexEnd == -1)
									{
									  indexEnd = element.length()-2;
									}
									else { indexEnd--; }
									doc.wmlFile += "vspace=\"" + element.substring(indexVspace+8,indexEnd) + "\" ";
								}
								if (indexHspace != -1)
								{   
									int indexEnd = element.indexOf(" ",indexHspace+1);
									if (indexEnd == -1)
									{
									  indexEnd = element.length()-2;
									}
									else { indexEnd--; } 
									doc.wmlFile += "hspace=\"" + element.substring(indexHspace+8,indexEnd) + "\" ";
								}
								if (indexArchive != -1)
								{
									int indexEnd = element.indexOf(" ",indexArchive+1);
									if (indexEnd == -1)
									{
									  indexEnd = element.length()-2;
									}
									else { indexEnd--; }
									doc.wmlFile += "archive=\"" + element.substring(indexArchive+9,indexEnd) + "\" ";
								}
								if (indexObject != -1)
								{   
									int indexEnd = element.indexOf(" ",indexObject+1);
									if (indexEnd == -1)
									{
									  indexEnd = element.length()-2;
									}
									else { indexEnd--; } 
									doc.wmlFile += "classid=\"" + element.substring(indexObject+8,indexEnd) + "\"";
								}
						doc.wmlFile += ">";
						doc.wmlFile += inTag + "</object>";		//Convert to object
						break;
				case 6: doc.wmlFile += "<p style=\"";
							int fsize = 16;
							int indexSize = element.indexOf("size");
							int indexFace = element.indexOf("face");
							int indexColor = element.indexOf("color");
								if (indexSize != -1)
								{
									int indexEnd = element.indexOf(" ",indexSize+1);
									if (indexEnd == -1)
									{
									  indexEnd = element.length()-2;
									}
									else { indexEnd--; } 
									String Rsize = element.substring(indexSize+6,indexEnd);

									if (Rsize.charAt(0) == '+')
									{   // del + 
										String x = element.substring(indexSize+7,indexEnd);
										int i = 0;
										try	
										{
											i = Integer.parseInt(x.trim());	
										}
										catch (NumberFormatException e)
										{
											System.out.println("Error can not parse");
											System.exit(2);
										}
										i += baseSize; 
										Rsize = Integer.toString(i); 
									}
									else if (Rsize.charAt(0) == '-')
									{   // del -
										String x = element.substring(indexSize+7,indexEnd);
										int i = 0;
										try	
										{
											i = Integer.parseInt(x.trim());	
										}
										catch (NumberFormatException e)
										{
											System.out.println("Error can not parse");
											System.exit(4);
										}
										i -= baseSize; 
										Rsize = Integer.toString(i); 
									}
									fsize = convsize(Rsize);
									doc.wmlFile +="font-size:" + fsize + "; ";
								}
								if (indexFace != -1)
								{   
									int indexEnd = element.indexOf(" ",indexFace+1);
									if (indexEnd == -1)
									{
									  indexEnd = element.length()-2;
									}
									else { indexEnd--; } 

									doc.wmlFile +="font-family:" + element.substring(indexFace+6,indexEnd) + "; ";
								}
								if (indexColor != -1)
								{
									int indexEnd = element.indexOf(" ",indexColor+1);
									if (indexEnd == -1)
									{
									  indexEnd = element.length()-2;
									}
									else { indexEnd--; }

									doc.wmlFile +="color:" + element.substring(indexColor+7,indexEnd) + ";";
								}
						doc.wmlFile +="\">";	
						doc.wmlFile += inTag + "</p>";	    //Convert to style
						break;
			}//end of switch
	
		return doc;
	}
/******************************************************************************/
	private static String convert(String html)
	{
		Doc doc = new Doc();
		String strBuffer = "";
		String tagName = "";
		String completeTag = "";
		int noFile = 1;
		while (doc.indexFile < html.length())
		{
			if (html.charAt(doc.indexFile) == '<')
			{
				strBuffer = "";
				while (html.charAt(doc.indexFile) != '>')
				{	
					strBuffer += html.charAt(doc.indexFile);
					doc.indexFile++;
				}
				tagName = findTag(strBuffer);
			//	System.out.print("tagname ="+tagName+" ");
			//	System.out.println(tagArr[indexArr]);
				completeTag = strBuffer+">";
				if (tagName.equals("</html>"))
				{	//END FILE
					doc.wmlFile += "</html>";
					break;
				}
				else if (tagName.equals("<!-->"))
				{	//COMMENT
					int closeComment = html.indexOf("-->",doc.indexFile-strBuffer.length()-1) + 3;
					doc.wmlFile += html.substring(doc.indexFile-strBuffer.length(),closeComment);
					doc.indexFile = closeComment;
					indexArr++;
				}
				else if (tagName.equals("<meta>"))
				{	//<META>
					doc.wmlFile += strBuffer + ">";
					indexArr++;
					doc.indexFile++;
				}
				else if ((NotStandardTag(tagName)))
				{	//this tag is not standard of www
					tagRemain++;
					convTag(doc,tagName,html,4,completeTag);
					tagRemain--;
				}
				else if ((NotConvert(tagName))&&(!IsEmptyTag(tagName)))
				{
		//			System.out.println("notConvert ="+tagName);
					tagRemain++;
					convTag(doc,tagName,html,0,completeTag);
					tagRemain--;
				}
				else if (IsEmptyTag(tagName))
				{		
		//			System.out.println("empty tag="+tagName);
						doc.wmlFile += strBuffer;
						doc.wmlFile += ">";
					indexArr++;
					doc.indexFile++;
				}
				else if ((tagName.equals("<strike>"))||(tagName.equals("<s>"))||(tagName.equals("<center>"))||(tagName.equals("<u>")))
				{	//<dir><menu><listing><plaintext><xmp><strike><s>
					tagRemain++;
					convTag(doc,tagName,html,1,completeTag);
					tagRemain--;
				}
				else if ((tagName.equals("<listing>"))||(tagName.equals("<plaintext>"))||(tagName.equals("<xmp>")))
				{	//<font>
					tagRemain++;
					convTag(doc,tagName,html,2,completeTag);
					tagRemain--;
				}
				else if ((tagName.equals("<dir>"))||(tagName.equals("<menu>")))
				{	//<basefont>
					tagRemain++;
					convTag(doc,tagName,html,3,completeTag);
					tagRemain--;
				}
				else if (tagName.equals("<basefont>"))
				{	//<basefont> to <style>
					int fsize = 16;
					int indexSize = strBuffer.indexOf("size");
					int indexFace = strBuffer.indexOf("face");
					int indexColor = strBuffer.indexOf("color");

						doc.wmlFile += "<style type=\"text/css\"><!-- body {";	//insert <script>
						if (indexSize != -1)
						{
							int indexEnd = strBuffer.indexOf("\"",indexSize+1);
							if (indexEnd == -1)
							{
							  indexEnd = strBuffer.length()-2;
							}
							else { indexEnd--; } 
							String Rsize = strBuffer.substring(indexSize+6,indexEnd);
						
							int i = 0;

							try
							{
								i = Integer.parseInt(Rsize.trim());	
							}
							catch (NumberFormatException e)
							{
								System.out.println("Error can not parse");
								System.exit(2);
							}
							baseSize = i;
							  //set baseSize
							fsize = convsize(Rsize);                   //convertSize
							doc.wmlFile += "font-size:" + fsize + "; ";
						}
						if (indexFace != -1)
						{   
							int indexEnd = strBuffer.indexOf("\"",indexFace+1);
							if (indexEnd == -1)
							{
							  indexEnd = strBuffer.length()-2;
							}
							else { indexEnd--; } 
							doc.wmlFile += "font-family:" + strBuffer.substring(indexFace+6,indexEnd) + "; ";
						}
						if (indexColor != -1)
						{
							int indexEnd = strBuffer.indexOf("\"",indexColor+1);
							if (indexEnd == -1)
							{
							  indexEnd = strBuffer.length()-2;
							}
							else { indexEnd--; }
							doc.wmlFile +="color:" + strBuffer.substring(indexColor+7,indexEnd) + ";";
						}
						doc.wmlFile +="} --></style>";
						indexArr++;
						doc.indexFile++;
				}
				else if (tagName.equals("<applet>"))
				{	//<applet>
					tagRemain++;
					convTag(doc,tagName,html,5,completeTag);
					tagRemain--;
				}
				else if (tagName.equals("<font>"))
				{	//<font>
					tagRemain++;
					convTag(doc,tagName,html,6,completeTag);
					tagRemain--;
				}
				else
				{	//Not Match any tag
					indexArr++;
					doc.indexFile++;
				}
			}
			else  //Not in tag
			{	
				doc.wmlFile += html.charAt(doc.indexFile);
				doc.indexFile++;
			}
		}
		return doc.wmlFile;
	}

	public static String convert2xhtml(String html)
	{
		FileOutputStream output;
		tagRemain = 0;
		String st = html;
		String stout = "<?xml version=\"1.0\" encoding=\"MS874\"?>\n<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Frameset//EN\"\n\"http://www.w3.org/TR/xhtml1/DTD/frameset.dtd\">\n";
		byte[] by;
		try
		{
			output = new FileOutputStream("c:/xhtml.html");
			stout += "<html>";
			int stoutlength = stout.length();
			/***************************/
			FindClose(st);
			st = head(st);
			
				indexArr = 0;
				while (!tagArr[indexArr].equals("0<html>"))
				{
					indexArr++;
				}
				indexArr++;
				stout += convert(st);
			
			/***************************/
			try
			{
				by = stout.getBytes();
				output.write(by);
			}
			catch(IOException e)
			{
				System.exit(3);
			}
		}
		catch(IOException e)
		{
			System.out.println("File input not found");
			System.exit(1);
		}
		return stout;
	}

}
