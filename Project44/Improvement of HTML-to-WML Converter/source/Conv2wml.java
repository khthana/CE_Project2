import java.io.*;
import java.lang.*;

public class Conv2wml
{
	private static String title;
	private static String frame;
	private static int indexArr;
	private static String[] tagArr = new String[1500];//Keep total tag in file
	private static int tagRemain;
	private static int numColumn;
	private static int noFile = 1;

	private static boolean IsTag(String tag)
	{	// CHECK THIS TAG IS IN XHTML TAG?
		boolean boo = false;
		String[] tagList = {"<a>","<abbr>","<acronym>","<address>","<b>","<bdo>","<big>","<blockquote>",
							"<body>","<button>","<caption>","<cite>","<code>","<col>","<colgroup>","<dd>",
							"<del>","<dfn>","<div>","<dl>","<dt>","<em>","<fieldset>","<form>","<frame>",
							"<frameset>","<h1>","<h2>","<h3>","<h4>","<h5>","<h6>","<head>","<html>",
							"<i>","<iframe>","<ins>","<kbd>","<label>","<legend>","<li>","<link>",
							"<map>","<noframes>","<noscript>","<object>","<ol>","<optgroup>",
							"<option>","<p>","<param>","<pre>","<q>","<samp>","<script>","<select>",
							"<small>","<span>","<strong>","<style>","<sub>","<sup>","<table>","<tbody>",
							"<td>","<textarea>","<tfoot>","<th>","<thead>","<title>","<tr>","<tt>","<ul>",
							"<var>","<?xml>","<!DOCTYPE>"};
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
	{	// CHECK THIS TAG IS  EMPTY TAG?
		String[] emptyTag = {"<area>","<base>","<br>","<hr>","<img>","<!-->","<meta>","<input>"};
		for (int i=0; i<emptyTag.length; i++)
		{
			if (tag.equals(emptyTag[i]))
			{
				return true;	
			}
		}
		return false;
	}

	public static void FindClose(String str)
	{
		int strLength = str.length();
		String st = "";//Well Form HTML
		String tagBody = "";//Start Tag
		String tagClose = "";//Close Tag
		String[] tempTagArr = new String[1500];//Keep total tag in file
		int arrIndex = 0;//Index of array
		int index = 0;//Index of String
		int tagLength = 0;
		int count = 0;

		//strLength--;
		/*************************/
		//Put total tag to array //
		/*************************/
		while (index < strLength)
		{
			if (str.charAt(index) == '<')
			{
				tagBody = "<";
				index++;
				while ((str.charAt(index) != '>')&&(str.charAt(index) != ' ')&&(index<strLength)&&(str.charAt(index) != '\r'))
				{	//Get only tag name
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
					System.out.println("ERROR! tag isn't XHTML tag");
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
			if ((tempTagArr[count].charAt(1) != '/')||(tempTagArr[count].equals("</form>"))||(tempTagArr[count].equals("</td>"))||(tempTagArr[count].equals("</tr>"))||(tempTagArr[count].equals("</th>"))||(tempTagArr[count].equals("</table>")))
			{
				tagArr[in] = tempTagArr[count];
				in++;
			}
			count++;
		}
	}

	private static String head(String str)  
	{	// CUT ABOVE <BODY>. REMAIN  ONLY <BODY> TO </BODY>. AND COMVERT FRAME.
		int indexClose = 0;
		int indexStart = str.indexOf("<title");
		if (indexStart != -1)
		{
			indexStart = str.indexOf(">",indexStart);
			indexClose = str.indexOf("</title>");
			title = str.substring(indexStart+1,indexClose);
		}
		else title = "title";

		frame = "";
		String inFrame = "";
		String linkName = "";
		indexStart = str.indexOf("<frame ");
		while (indexStart != -1)
		{
			inFrame = str.substring(indexStart,str.indexOf(">",indexStart));
			linkName = inFrame.substring(inFrame.indexOf("src=")+5,inFrame.indexOf("\"",inFrame.indexOf("src=")+6));
			frame += "<br/>\n<anchor>"+linkName+"<br/>";
			frame += "\n<go method=\"get\" href=\"http://161.246.6.222:8080/webdav/servlet/ContactWap\">\n";
			frame += "<postfield name=\"url\" value=\""+linkName+"\"/>\n</go>\n</anchor>\n";
			indexStart = str.indexOf("<frame ",indexStart+1);
		}
		if (frame.equals(""))
		{
			indexStart = str.indexOf("<body");
			indexStart = str.indexOf(">",indexStart);
			indexClose = str.indexOf("</body>");
			while (indexClose < str.length()-25)
			{
				indexClose = str.indexOf("</body>",indexClose+1);
			}
			String st = str.substring(indexStart+1,indexClose);
			st += "</body>";
			return st;
		}
		else return "";
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

	private static Doc convTag(Doc doc,String tagName,String html,int type)
	{	// CONVERT XHTML TAG
		doc.indexFile++;
		String tagClose = "</" + tagName.substring(1,tagName.length());
		int num = (int)tagArr[indexArr].charAt(0);
		num -= 48;
		int indexClose = doc.indexFile;
		for (int i=0; i<=num; i++)
		{
			indexClose = html.indexOf(tagClose,indexClose+1);
		}
		String inTag = "";
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
		switch (type)
		{
			case 0: doc.wmlFile += tagName;				//Convert to Same
					doc.wmlFile += inTag + tagClose;
					break;
			case 1: if (tagName.equals("<li>"))
					{
						doc.wmlFile += "<br/>  -";				
						doc.wmlFile += inTag + "\n";
					}
					else if ((tagName.equals("<dt>")||tagName.equals("<dd>")))
					{
						doc.wmlFile += "<br/>";				
						doc.wmlFile += inTag;
					}
					else
					{
						doc.wmlFile += "<br/>";				
						doc.wmlFile += inTag + "<br/>";
					}
					break;
			case 2: doc.wmlFile += "<br/><i>";			//Convert to I
					doc.wmlFile += inTag + "</i><br/>";
					break;
			case 3: doc.wmlFile += "<big>";				//Convert to BIG
					doc.wmlFile += inTag + "</big>";
					break;
			case 4:	break;								//Delete All
		}
		return doc;
	}
/********************CONVERT FORM**********************************************/
/******************************************************************************/
	private static Doc convForm(Doc doc,String buffer,String html)
	{	//CONVERT TAG <FORM>
		doc.indexFile++;
		indexArr++;
		String prevName = "";
		String strBuffer = "";
		String tagName = "";
		String type,name,value,maxLength;
		boolean checkbox = false;
		boolean radio = false;
		int tempIndex = 0;
		int index = buffer.indexOf("method=\"post\"");
		if (index == -1)
		{
			strBuffer = "get";
		}
		else strBuffer = "post";
		index = buffer.indexOf("action=") + 7;
		String actionSt = buffer.substring(index,buffer.indexOf("\"",index+2)+1);
		String postField = "<br/><anchor>SUBMIT<go method=\"" + strBuffer + "\" href=\"http://161.246.6.222:8080/webdav/servlet/ContactForm\">\n";
		postField += "<postfield name=\"url\" value=" + actionSt + "/>\n";
		index = html.indexOf("</form>",doc.indexFile) + 7;
		while (doc.indexFile < index)
		{
			if (html.charAt(doc.indexFile) == '<')
			{
				strBuffer = "";
				while (html.charAt(doc.indexFile) != '>')
				{	
					strBuffer += html.charAt(doc.indexFile);
					doc.indexFile++;
				}
				//System.out.println(tagArr[indexArr]+indexArr);
				tagName = findTag(strBuffer);
				//System.out.println(tagName);
				if (tagName.equals("<input>"))
				{	//<INPUT>
					doc.indexFile++;
					tempIndex = strBuffer.indexOf("type=") + 6;
					type = strBuffer.substring(tempIndex,strBuffer.indexOf("\"",tempIndex+1));
					tempIndex = strBuffer.indexOf("name=") + 6;
					name = strBuffer.substring(tempIndex,strBuffer.indexOf("\"",tempIndex+1));
					if ((type.equals("text"))||(type.equals("password")))
					{	//TYPE = TEXT AND PASSWORD
						if (checkbox||radio)
						{
							doc.wmlFile += "</select><br/>\n";
							checkbox = false;
							radio = false;
						}
						doc.wmlFile += "<br/><input name=\"" + name + "\" type=\"" + type + "\"";
						tempIndex = strBuffer.indexOf("value=");
						if (tempIndex != -1)
						{
							value = strBuffer.substring(tempIndex+6,strBuffer.indexOf("\"",tempIndex+7));
							doc.wmlFile += " value=" + value + "\"";
						}
						tempIndex = strBuffer.indexOf("maxlength=");
						if (tempIndex != -1)
						{
							maxLength = strBuffer.substring(tempIndex+10,strBuffer.indexOf("\"",tempIndex+12));
							doc.wmlFile += " maxlength=" + maxLength + "\"";
						}
						doc.wmlFile += "/>\n";
						postField += "<postfield name=\"" + name + "\" value=\"$" + name + "\"/>\n";
					}
					else if (type.equals("hidden"))
					{	//TYPE = HIDDEN
						if (checkbox||radio)
						{
							doc.wmlFile += "</select><br/>\n";
							checkbox = false;
							radio = false;
						}
						postField += "<postfield name=\"" + name + "\" value=\"$" + name + "\"/>\n";
					}
					else if (type.equals("checkbox"))
					{	//TYPE = CHECKBOX
						if (!prevName.equals(name))
						{
							if (checkbox||radio)
							{
								if (radio)
								{
									radio = false;
								}
								doc.wmlFile += "</select><br/>\n";
							}
							doc.wmlFile += "<br/>\n<select multiple=\"true\" name=\"" + name + "\">\n";
							postField += "<postfield name=\"" + name + "\" value=\"$" + name + "\"/>\n";
							prevName = name;
							checkbox = true;
						}

						tempIndex = strBuffer.indexOf("value=");
						value = strBuffer.substring(tempIndex+6,strBuffer.indexOf("\"",tempIndex+8));
						doc.wmlFile += "<option value=" + value + "\">";
						while ((html.charAt(doc.indexFile) != '<')&&(html.charAt(doc.indexFile) != '\n'))
						{
							doc.wmlFile += html.charAt(doc.indexFile);
							doc.indexFile++;
						}
						doc.wmlFile += "</option>\n";
					}
					else if (type.equals("radio"))
					{	//TYPE = RADIO
						if (!prevName.equals(name))
						{
							if (checkbox||radio)
							{
								if (checkbox)
								{
									checkbox = false;
								}
								doc.wmlFile += "</select><br/>\n";
							}
							doc.wmlFile += "<br/>\n<select multiple=\"false\" name=\"" + name + "\">\n";
							postField += "<postfield name=\"" + name + "\" value=\"$" + name + "\"/>\n";
							prevName = name;
							radio = true;
						}

						tempIndex = strBuffer.indexOf("value=");
						value = strBuffer.substring(tempIndex+6,strBuffer.indexOf("\"",tempIndex+8));
						doc.wmlFile += "<option value=" + value + "\">";
						while ((html.charAt(doc.indexFile) != '<')&&(html.charAt(doc.indexFile) != '\n'))
						{
							doc.wmlFile += html.charAt(doc.indexFile);
							doc.indexFile++;
						}
						doc.wmlFile += "</option>\n";
					}
					indexArr++;
				}
				else if (tagName.equals("<select>"))
				{	//<SELECT>
					if (checkbox||radio)
					{
						doc.wmlFile += "</select><br/>\n";
						checkbox = false;
						radio = false;
					}
					doc.indexFile++;
					tempIndex = strBuffer.indexOf("name=") + 6;
					name = strBuffer.substring(tempIndex,strBuffer.indexOf("\"",tempIndex+1));
					postField += "<postfield name=\"" + name + "\" value=\"$" + name + "\"/>\n";
					tempIndex = strBuffer.indexOf("multiple");
					if (tempIndex != -1)
					{
						doc.wmlFile += "<br/>\n<select multiple=\"true\" name=\"" + name + "\">\n";
					}
					else doc.wmlFile += "<br/>\n<select multiple=\"false\" name=\"" + name + "\">\n";
					while (!strBuffer.equals("</select>"))
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
							if (tagName.equals("<option>"))
							{
								tempIndex = strBuffer.indexOf("value=");
								value = strBuffer.substring(tempIndex+6,strBuffer.indexOf("\"",tempIndex+8));
								doc.wmlFile += "<option value=" + value + "\">";
								doc.indexFile++;
								while ((html.charAt(doc.indexFile) != '<')&&(html.charAt(doc.indexFile) != '\n'))
								{
									doc.wmlFile += html.charAt(doc.indexFile);
									doc.indexFile++;
								}
								doc.wmlFile += "</option>\n";
								indexArr++;
							}
							else if (tagName.equals("<optgroup>"))
							{
								tempIndex = strBuffer.indexOf("label=");
								name = strBuffer.substring(tempIndex+6,strBuffer.indexOf("\"",tempIndex+8));
								doc.wmlFile += "<optgroup title=" + name + "\">\n";
								indexArr++;
								doc.indexFile++;
							}
							else if (tagName.equals("</optgroup>"))
							{
								doc.wmlFile += tagName;
								doc.indexFile++;
							}
							else if (tagName.equals("</select>"))
							{
								doc.wmlFile += tagName;
								doc.indexFile++;
								break;
							}
							else
							{	//Not Match any tag
								if ((tagName.charAt(1) != '/')||(tagName.equals("</form>"))||(tagName.equals("</td>"))||(tagName.equals("</tr>"))||(tagName.equals("</th>"))||(tagName.equals("</table>")))
								{
									indexArr++;
								}
								doc.indexFile++;
							}
						}
						else
						{	//Not In Tag
							doc.wmlFile += html.charAt(doc.indexFile);
							doc.indexFile++;
						}
					}
					indexArr++;
				}
				else if (tagName.equals("<textarea>"))
				{	//<TEXTAREA>
					if (checkbox||radio)
					{
						doc.wmlFile += "</select><br/>\n";
						checkbox = false;
						radio = false;
					}
					doc.indexFile++;
					String val = html.substring(doc.indexFile,html.indexOf("</textarea>",doc.indexFile));
					val = val.trim();
					doc.indexFile = html.indexOf("</textarea>",doc.indexFile) + 11;
					tempIndex = strBuffer.indexOf("name=") + 6;
					name = strBuffer.substring(tempIndex,strBuffer.indexOf("\"",tempIndex+1));
					postField += "<postfield name=\"" + name + "\" value=\"$" + name + "\"/>\n";
					doc.wmlFile += "<br/><input name=\"" + name + "\" type=\"text\" value=\"" + val + "\"/>\n";
					indexArr++;
				}
				else if (tagName.equals("<br>"))
				{	//<BR>
					if (checkbox||radio)
					{
						doc.wmlFile += "</select><br/>\n";
						checkbox = false;
						radio = false;
					}
					doc.wmlFile += "<br/>";
					indexArr++;
					doc.indexFile++;
				}
				else if (tagName.equals("<hr>"))
				{	//<HR>
					if (checkbox||radio)
					{
						doc.wmlFile += "</select><br/>\n";
						checkbox = false;
						radio = false;
					}
					doc.wmlFile += "<br/>---------------------<br/>";
					indexArr++;
					doc.indexFile++;
				}
				else if (tagName.equals("<!-->"))
				{	//COMMENT
					if (checkbox||radio)
					{
						doc.wmlFile += "</select><br/>\n";
						checkbox = false;
						radio = false;
					}
					int closeComment = html.indexOf("-->",doc.indexFile-strBuffer.length()-1) + 3;
					doc.wmlFile += html.substring(doc.indexFile-strBuffer.length(),closeComment);
					doc.indexFile = closeComment;
					indexArr++;
				}
				else if (tagName.equals("<meta>"))
				{	//<META>
					if (checkbox||radio)
					{
						doc.wmlFile += "</select><br/>\n";
						checkbox = false;
						radio = false;
					}
					doc.wmlFile += strBuffer + ">";
					indexArr++;
					doc.indexFile++;
				}
				else if ((tagName.equals("<b>"))||(tagName.equals("<big>"))||(tagName.equals("<i>"))||(tagName.equals("<small>"))||(tagName.equals("<em>"))||(tagName.equals("<strong>")))
				{	//<B>,<BIG>,<I>,<SMALL>,<EM>,<HEAD>,<STRONG>
					if (checkbox||radio)
					{
						doc.wmlFile += "</select><br/>\n";
						checkbox = false;
						radio = false;
					}
					tagRemain++;
					convTag(doc,tagName,html,0);
					tagRemain--;
				}
				else if ((tagName.equals("<dt>"))||(tagName.equals("<dd>"))||(tagName.equals("<li>"))||(tagName.equals("<ul>"))||(tagName.equals("<ol>"))||(tagName.equals("<dl>")))
				{	//<DT>, <DD>, <LI>, <UL>, <OL>, <DL>
					if (checkbox||radio)
					{
						doc.wmlFile += "</select><br/>\n";
						checkbox = false;
						radio = false;
					}
					tagRemain++;
					convTag(doc,tagName,html,1);
					tagRemain--;
				}
				else if ((tagName.equals("<h1>"))||(tagName.equals("<h2>"))||(tagName.equals("<h3>"))||(tagName.equals("<h4>"))||(tagName.equals("<h5>"))||(tagName.equals("<h6>")))
				{	//H1, H2, H3, H4, H5, H6
					if (checkbox||radio)
					{
						doc.wmlFile += "</select><br/>\n";
						checkbox = false;
						radio = false;
					}
					tagRemain++;
					convTag(doc,tagName,html,3);
					tagRemain--;
				}
				else if ((tagName.equals("<script>"))||(tagName.equals("<style>")))
				{	//<SCRIPT>, <STYLE>
					if (checkbox||radio)
					{
						doc.wmlFile += "</select><br/>\n";
						checkbox = false;
						radio = false;
					}
					tagRemain++;
					convTag(doc,tagName,html,4);
					tagRemain--;
				}
				else if (tagName.equals("<img>"))
				{	//<IMG/>
					int indexFileName = strBuffer.indexOf("src=") + 4;
					int indexEnd = strBuffer.indexOf("\"",indexFileName+1);
					doc.wmlFile += "<img src=" + strBuffer.substring(indexFileName,indexEnd+1) + " alt=";
					int indexAlt = strBuffer.indexOf("alt=");
					if (indexAlt == -1)
					{
						doc.wmlFile += strBuffer.substring(indexFileName,indexEnd+1);
					}
					else
					{
						doc.wmlFile += strBuffer.substring(indexAlt+4,strBuffer.indexOf("\"",indexAlt+5)+1);
					}
					int indexWidth = strBuffer.indexOf("width=");
					if (indexWidth == -1)
					{
						doc.wmlFile += " width=\"100\"";
					}
					else
					{
						indexWidth += 7;
						indexEnd = strBuffer.indexOf("\"",indexWidth);
						String width = strBuffer.substring(indexWidth,indexEnd);
						int intWidth = 0;
						try
						{
							intWidth = Integer.parseInt(width);
						}
						catch (NumberFormatException e)
						{
							System.out.println("Format of width error!");
						}
						if (intWidth >= 100)
						{
							doc.wmlFile += " width=\"100\"";
						}
						else
						{
							doc.wmlFile += " width=\"" + width + "\"";
						}
					}
					int indexHeight = strBuffer.indexOf("height=");
					if (indexHeight == -1)
					{
						doc.wmlFile += " height=\"100\"";
					}
					else
					{
						indexHeight += 8;
						indexEnd = strBuffer.indexOf("\"",indexHeight);
						String Height = strBuffer.substring(indexHeight,indexEnd);
						int intHeight = 0;
						try
						{
							intHeight = Integer.parseInt(Height);
						}
						catch (NumberFormatException e)
						{
							System.out.println("Format of Height error!");
						}
						if (intHeight >= 100)
						{
							doc.wmlFile += " height=\"100\"";
						}
						else
						{
							doc.wmlFile += " height=\"" + Height + "\"";
						}
					}
					doc.wmlFile += " />";
					indexArr++;
					doc.indexFile++;
				}
				else if (tagName.equals("<a>"))
				{	//<A>
					if (checkbox||radio)
					{
						doc.wmlFile += "</select><br/>\n";
						checkbox = false;
						radio = false;
					}
					tagRemain++;
					int indexCloseA = html.indexOf("</a>",doc.indexFile);
					String intag = html.substring(doc.indexFile+1,indexCloseA);
					doc.wmlFile += "<br/>\n<anchor>"+intag+"<br/>";
					doc.wmlFile += "\n<go method=\"get\" href=\"http://161.246.6.222:8080/webdav/servlet/ContactWap\">\n";
					int indexHref = strBuffer.indexOf("href=");
					String url = strBuffer.substring(indexHref+6,strBuffer.indexOf("\"",indexHref+6));
					doc.wmlFile += "<postfield name=\"url\" value=\""+url+"\"/>\n</go>\n</anchor>";
					doc.indexFile = indexCloseA+4;
					indexArr++;
					tagRemain--;
				}
				else if (tagName.equals("</form>"))
				{	// </FORM>
					indexArr++;
					if (radio||checkbox)
					{
						doc.wmlFile += "</select><br/>\n";
					}
					doc.indexFile++;
					break;
				}
				else
				{	//Not Match any tag
					if (checkbox||radio)
					{
						doc.wmlFile += "</select><br/>\n";
						checkbox = false;
						radio = false;
					}
					if ((tagName.charAt(1) != '/')||(tagName.equals("</form>"))||(tagName.equals("</td>"))||(tagName.equals("</tr>"))||(tagName.equals("</th>"))||(tagName.equals("</table>")))
					{
						indexArr++;
					}
					doc.indexFile++;
				}
			}
			else
			{	//Not In Tag
				doc.wmlFile += html.charAt(doc.indexFile);
				doc.indexFile++;
			}
		}
		doc.wmlFile += postField + "</go></anchor><br/>";
		return doc;
	}
////////////////////////END CONVERT FORM////////////////////

/////////////////////CONVERT TABLE//////////////////////////
	private static boolean notAllowInTable(String tag)
	{	// CHECK THIS TAG IS ALLOW TAG?
		String[] notAllowTag = {"<area>","<base>","<button>","<dd>","<dl>","<dt>","<form>","<frame>",
							    "<frameset>","<hr>","<iframe>","<input>","<label>","<legend>","<li>",
								"<link>","<map>","<noframe>","<noscript>","<object>","<ol>","<optgroup>",
								"<option>","<p>","<param>","<script>","<select>","<span>","<style>",
								"<table>","<textarea>","<title>","<ul>"};
		for (int i=0; i<notAllowTag.length; i++)
		{
			if (tag.equals(notAllowTag[i]))
			{
				return true;
			}
		}
		return false;
	}

	private static boolean tableGroup(String tag)
	{	// CHECK THIS TAG IS IN TABLE GROUP?
		String[] tableGroup = {"<caption>","<thead>","<tfoot>","<tbody>","<colgroup>","<col>","<tr>",
							   "<td>","<th>",};
		for (int i=0; i<tableGroup.length; i++)
		{
			if (tag.equals(tableGroup[i]))
			{
				return true;
			}
		}
		return false;
	}

	private static boolean canConvert(String inTable)
	{
		int index = indexArr;
		int numCol;
		int numTag = 0;
		boolean yes = true;
		while (!tagArr[index].equals("</table>"))
		{	//CHECK IF THERE IS TAG THAT NOT ALLOW IN TABLE?
			if (notAllowInTable(tagArr[index].substring(1,tagArr[index].length())))
			{
				return false;//YES THERE IS NOT ALLOW TAG IN IT!
			}
			index++;
		}
		index = indexArr;
		while (!tagArr[index].equals("</table>"))
		{	//CHECK IF THERE ARE TOO MUCH TAG IN EACH CELL?
			numCol = 0;
			while (!tagArr[index].equals("</tr>"))
			{
				while ((!tagArr[index].substring(1,4).equals("<td"))&&(!tagArr[index].substring(1,4).equals("<th"))&&(tagArr[index].length() < 6))
				{
					index++;
				}
				numCol++;
				numTag = 0;
				while ((!tagArr[index].equals("</td>"))&&(!tagArr[index].equals("</th>")))
				{
					numTag++;
					index++;
				}
				if (numTag > 4)
				{
					yes = false;
				}
				index++;
			}
			if (numColumn < numCol)
			{
				numColumn = numCol;
			}
			index++;
		}
		return yes;
	}

	private static Doc convTable(Doc doc,String html)
	{
		numColumn = 0;
		doc.indexFile++;
		int num = (int)tagArr[indexArr].charAt(0);
		num -= 48;
		int indexClose = doc.indexFile;
		for (int i=0; i<=num; i++)
		{
			indexClose = html.indexOf("</table>",indexClose+1);
		}
		String inTable = html.substring(doc.indexFile,indexClose); // Got in table
		indexArr++;
		if ((!canConvert(inTable))||(numColumn == 1))
		{	//CAN NOT CONVERT
			doc.indexFile += inTable.length()+8;
			inTable = convert(inTable);
			indexArr++;
			doc.wmlFile += inTable;
		}
		else
		{	//CAN CONVERT
			doc.wmlFile += "<br/>\n<table columns=";
			if (numColumn >= 3)
			{
				doc.wmlFile += "\"3\">\n";
				num = 3;
			}
			else 
			{
				doc.wmlFile += "\"" + numColumn + "\">\n";
				num = 2;
			}
			String strBuffer;
			String tagName;
			String caption = "";
			String inCol = "";
			int no = 0;
			int tempIndex = 0;
			while (doc.indexFile < indexClose)
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
					if (tagName.equals("<th>"))
					{
						doc.indexFile++;
						if (no == 0)
						{
							doc.wmlFile += "<tr>\n";
						}
						else if (no == num)
						{
							doc.wmlFile += "</tr>\n<tr>\n";
							no = 0;
						}
						tagRemain++;
						tempIndex = html.indexOf("</th>",doc.indexFile);
						inCol = html.substring(doc.indexFile,tempIndex);
						indexArr++;
						inCol = convert(inCol);
						doc.wmlFile += "<td><b>" + inCol + "</b></td>\n";
						tagRemain--;
						doc.indexFile = tempIndex;
						no++;
					}
					else if (tagName.equals("<td>"))
					{
						doc.indexFile++;
						if (no == 0)
						{
							doc.wmlFile += "<tr>\n";
						}
						else if (no == num)
						{
							doc.wmlFile += "</tr>\n<tr>\n";
							no = 0;
						}
						tagRemain++;
						tempIndex = html.indexOf("</td>",doc.indexFile);
						inCol = html.substring(doc.indexFile,tempIndex);
						indexArr++;
						inCol = convert(inCol);
						doc.wmlFile += "<td>" + inCol + "</td>\n";
						tagRemain--;
						doc.indexFile = tempIndex;
						no++;
					}
					else if (tagName.equals("<caption>"))
					{
						tagRemain++;
						doc.indexFile++;
						tempIndex = html.indexOf("</caption>",doc.indexFile);
						caption = html.substring(doc.indexFile,tempIndex);
						indexArr++;
						caption = convert(caption);
						doc.indexFile = tempIndex + 10;
						tagRemain--;
					}
					else if (tagName.equals("<br>"))
					{	//<BR>
						doc.wmlFile += "<br/>";
						indexArr++;
						doc.indexFile++;
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
					else if ((tagName.equals("<b>"))||(tagName.equals("<big>"))||(tagName.equals("<i>"))||(tagName.equals("<small>"))||(tagName.equals("<em>"))||(tagName.equals("<strong>")))
					{	//<B>,<BIG>,<I>,<SMALL>,<EM>,<STRONG>
						tagRemain++;
						convTag(doc,tagName,html,0);
						tagRemain--;
					}
					else if ((tagName.equals("<cite>"))||(tagName.equals("<dfn>"))||(tagName.equals("<var>"))||(tagName.equals("<address>")))
					{	//<CITE>, <DFN>, <VAR>, <ADDRESS>
						tagRemain++;
						convTag(doc,tagName,html,2);
						tagRemain--;
					}
					else if ((tagName.equals("<h1>"))||(tagName.equals("<h2>"))||(tagName.equals("<h3>"))||(tagName.equals("<h4>"))||(tagName.equals("<h5>"))||(tagName.equals("<h6>")))
					{	//H1, H2, H3, H4, H5, H6
						tagRemain++;
						convTag(doc,tagName,html,3);
						tagRemain--;
					}
					else if (tagName.equals("<img>"))
					{	//<IMG/>
						int indexFileName = strBuffer.indexOf("src=") + 4;
						int indexEnd = strBuffer.indexOf("\"",indexFileName+1);
						doc.wmlFile += "<img src=" + strBuffer.substring(indexFileName,indexEnd+1) + " alt=";
						int indexAlt = strBuffer.indexOf("alt=");
						if (indexAlt == -1)
						{
							doc.wmlFile += strBuffer.substring(indexFileName,indexEnd+1);
						}
						else
						{
							doc.wmlFile += strBuffer.substring(indexAlt+4,strBuffer.indexOf("\"",indexAlt+5)+1);
						}
						int indexWidth = strBuffer.indexOf("width=");
						if (indexWidth == -1)
						{
							doc.wmlFile += " width=\"100\"";
						}
						else
						{
							indexWidth += 7;
							indexEnd = strBuffer.indexOf("\"",indexWidth);
							String width = strBuffer.substring(indexWidth,indexEnd);
							int intWidth = 0;
							try
							{
								intWidth = Integer.parseInt(width);
							}
							catch (NumberFormatException e)
							{
								System.out.println("Format of width error!");
							}
							if (intWidth >= 100)
							{
								doc.wmlFile += " width=\"100\"";
							}
							else
							{
								doc.wmlFile += " width=\"" + width + "\"";
							}
						}
						int indexHeight = strBuffer.indexOf("height=");
						if (indexHeight == -1)
						{
							doc.wmlFile += " height=\"100\"";
						}
						else
						{
							indexHeight += 8;
							indexEnd = strBuffer.indexOf("\"",indexHeight);
							String Height = strBuffer.substring(indexHeight,indexEnd);
							int intHeight = 0;
							try
							{
								intHeight = Integer.parseInt(Height);
							}
							catch (NumberFormatException e)
							{
								System.out.println("Format of Height error!");
							}
							if (intHeight >= 100)
							{
								doc.wmlFile += " height=\"100\"";
							}
							else
							{
								doc.wmlFile += " height=\"" + Height + "\"";
							}
						}
						doc.wmlFile += " />";
						indexArr++;
						doc.indexFile++;
					}
					else if (tagName.equals("<a>"))
					{	//<A>
						tagRemain++;
						int indexCloseA = html.indexOf("</a>",doc.indexFile);
						String intag = html.substring(doc.indexFile+1,indexCloseA);
						indexArr++;
						intag = convert(intag);
						if (intag.indexOf("<") == -1)
						{
							doc.wmlFile += "<br/>\n<anchor>"+intag+"<br/>";
						}
						else
						{
							doc.wmlFile += intag + "<br/>\n<anchor>PicLink";
						}
						doc.wmlFile += "\n<go method=\"get\" href=\"http://161.246.6.222:8080/webdav/servlet/ContactWap\">\n";
						int indexHref = strBuffer.indexOf("href=");
						String url = strBuffer.substring(indexHref+6,strBuffer.indexOf("\"",indexHref+6));
						doc.wmlFile += "<postfield name=\"url\" value=\""+url+"\"/>\n</go>\n</anchor>";
						doc.indexFile = indexCloseA+4;
						tagRemain--;
					}
					else
					{	//Not Match any tag
						if ((tagName.charAt(1) != '/')||(tagName.equals("</form>"))||(tagName.equals("</td>"))||(tagName.equals("</tr>"))||(tagName.equals("</th>"))||(tagName.equals("</table>")))
						{
							indexArr++;
						}
						doc.indexFile++;
					}
				}
				else  //Not in tag
				{	
					doc.wmlFile += html.charAt(doc.indexFile);
					doc.indexFile++;
				}
			}
			if (!caption.equals(""))
			{
				doc.wmlFile += "</tr>\n</table>\n<br/><b>CAPTION :\"" + caption + "\"</b><br/>";
			}
			else doc.wmlFile += "</tr>\n</table>\n<br/>";
		}

		return doc;
	}
//////////////////END CONVERT TABLE//////////////////////////

	private static String convert(String html)
	{
		Doc doc = new Doc();
		String strBuffer = "";
		String tagName = "";
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
				if (tagName.equals("<br>"))
				{	//<BR>
					doc.wmlFile += "<br/>";
					indexArr++;
					doc.indexFile++;
				}
				else if (tagName.equals("<hr>"))
				{	//<HR>
					doc.wmlFile += "<br/>---------------------<br/>";
					indexArr++;
					doc.indexFile++;
				}
				else if (tagName.equals("</body>"))
				{	//END FILE
					doc.wmlFile += "<do type=\"prev\" label=\"Back\">\n<prev/></do>\n";
					doc.wmlFile += "</p>\n</card>\n</wml>";
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
				else if ((tagName.equals("<dt>"))||(tagName.equals("<dd>"))||(tagName.equals("<li>"))||(tagName.equals("<ul>"))||(tagName.equals("<ol>"))||(tagName.equals("<dl>")))
				{	//<DT>, <DD>, <LI>, <UL>, <OL>, <DL>
					tagRemain++;
					convTag(doc,tagName,html,1);
					tagRemain--;
				}
				else if ((tagName.equals("<b>"))||(tagName.equals("<big>"))||(tagName.equals("<i>"))||(tagName.equals("<small>"))||(tagName.equals("<em>"))||(tagName.equals("<strong>")))
				{	//<B>,<BIG>,<I>,<SMALL>,<EM>,<STRONG>
					tagRemain++;
					convTag(doc,tagName,html,0);
					tagRemain--;
				}
				else if ((tagName.equals("<cite>"))||(tagName.equals("<dfn>"))||(tagName.equals("<var>"))||(tagName.equals("<address>")))
				{	//<CITE>, <DFN>, <VAR>, <ADDRESS>
					tagRemain++;
					convTag(doc,tagName,html,2);
					tagRemain--;
				}
				else if ((tagName.equals("<h1>"))||(tagName.equals("<h2>"))||(tagName.equals("<h3>"))||(tagName.equals("<h4>"))||(tagName.equals("<h5>"))||(tagName.equals("<h6>")))
				{	//H1, H2, H3, H4, H5, H6
					tagRemain++;
					convTag(doc,tagName,html,3);
					tagRemain--;
				}
				else if ((tagName.equals("<script>"))||(tagName.equals("<style>")))
				{	//<SCRIPT>, <STYLE>
					tagRemain++;
					convTag(doc,tagName,html,4);
					tagRemain--;
				}
				else if (strBuffer.regionMatches(0,"<p ",0,3))
				{	//<P>...</P>
					tagRemain++;
					doc.wmlFile += "<br/></p>";
					doc.indexFile++;
					int indexAlign = strBuffer.indexOf("align=");
					if (indexAlign == -1)
					{
						doc.wmlFile += "<p>";
					}
					else
					{
						int indexEnd = strBuffer.indexOf(" ",indexAlign+1);
						if (indexEnd == -1)
						{
							indexEnd = strBuffer.length();
						}
						doc.wmlFile += "<p " + strBuffer.substring(indexAlign,indexEnd) + ">";
					}
					String tagClose = "</" + tagName.substring(1,tagName.length());
					int num = (int)tagArr[indexArr].charAt(0);
					num -= 48;
					int indexClose = doc.indexFile;
					for (int i=0; i<=num; i++)
					{
						indexClose = html.indexOf(tagClose,indexClose+1);
					}
					String inTag = html.substring(doc.indexFile,indexClose);
					indexArr++;
					inTag = convert(inTag);
					doc.indexFile = indexClose+tagClose.length();
					doc.wmlFile += inTag + "<br/></p>\n<p>";
					tagRemain--;
				}
				else if (tagName.equals("<img>"))
				{	//<IMG/>
					int indexFileName = strBuffer.indexOf("src=") + 4;
					int indexEnd = strBuffer.indexOf("\"",indexFileName+1);
					doc.wmlFile += "<img src=" + strBuffer.substring(indexFileName,indexEnd+1) + " alt=";
					int indexAlt = strBuffer.indexOf("alt=");
					if (indexAlt == -1)
					{
						doc.wmlFile += strBuffer.substring(indexFileName,indexEnd+1);
					}
					else
					{
						doc.wmlFile += strBuffer.substring(indexAlt+4,strBuffer.indexOf("\"",indexAlt+5)+1);
					}
					int indexWidth = strBuffer.indexOf("width=");
					if (indexWidth == -1)
					{
						doc.wmlFile += " width=\"100\"";
					}
					else
					{
						indexWidth += 7;
						indexEnd = strBuffer.indexOf("\"",indexWidth);
						String width = strBuffer.substring(indexWidth,indexEnd);
						int intWidth = 0;
						try
						{
							intWidth = Integer.parseInt(width);
						}
						catch (NumberFormatException e)
						{
							System.out.println("Format of width error!");
						}
						if (intWidth >= 100)
						{
							doc.wmlFile += " width=\"100\"";
						}
						else
						{
							doc.wmlFile += " width=\"" + width + "\"";
						}
					}
					int indexHeight = strBuffer.indexOf("height=");
					if (indexHeight == -1)
					{
						doc.wmlFile += " height=\"100\"";
					}
					else
					{
						indexHeight += 8;
						indexEnd = strBuffer.indexOf("\"",indexHeight);
						String Height = strBuffer.substring(indexHeight,indexEnd);
						int intHeight = 0;
						try
						{
							intHeight = Integer.parseInt(Height);
						}
						catch (NumberFormatException e)
						{
							System.out.println("Format of Height error!");
						}
						if (intHeight >= 100)
						{
							doc.wmlFile += " height=\"100\"";
						}
						else
						{
							doc.wmlFile += " height=\"" + Height + "\"";
						}
					}
					doc.wmlFile += " />";
					indexArr++;
					doc.indexFile++;
				}
				else if (tagName.equals("<a>"))
				{	//<A>
					tagRemain++;
					int indexCloseA = html.indexOf("</a>",doc.indexFile);
					String intag = html.substring(doc.indexFile+1,indexCloseA);
					indexArr++;
					intag = convert(intag);
					if (intag.indexOf("<") == -1)
					{
						doc.wmlFile += "<br/>\n<anchor>"+intag+"<br/>";
					}
					else
					{
						doc.wmlFile += intag + "<br/>\n<anchor>PicLink";
					}
					doc.wmlFile += "\n<go method=\"get\" href=\"http://161.246.6.222:8080/webdav/servlet/ContactWap\">\n";
					int indexHref = strBuffer.indexOf("href=");
					String url = strBuffer.substring(indexHref+6,strBuffer.indexOf("\"",indexHref+6));
					doc.wmlFile += "<postfield name=\"url\" value=\""+url+"\"/>\n</go>\n</anchor>";
					doc.indexFile = indexCloseA+4;
					tagRemain--;
				}
				else if (tagName.equals("<form>"))
				{	//<FORM>
					tagRemain++;
					convForm(doc,strBuffer,html);
					tagRemain--;
				}
				else if (tagName.equals("<table>"))
				{	//<TABLE>
					convTable(doc,html);
				}
				else
				{	//Not Match any tag
					if ((tagName.charAt(1) != '/')||(tagName.equals("</form>"))||(tagName.equals("</td>"))||(tagName.equals("</tr>"))||(tagName.equals("</th>"))||(tagName.equals("</table>")))
					{
						indexArr++;
					}
					doc.indexFile++;
				}
				/**********************/
				//CHECK TO CUT DECK	  //
				/**********************/
				strBuffer = doc.wmlFile;
				if ((strBuffer.length() > 1100)&&(tagRemain == 0))
				{
					String fileName = "C:/tomcat4.0/webapps/webdav/deck" + noFile + ".wml";
					//System.out.println(strBuffer.length());
					String stout = "<?xml version=\"1.0\"?>\n<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\"\n\"http://www.wapforum.org/DTD/wml_1.1.wml\">\n";
					stout += "<wml>\n<card id=\"card1\">\n<p>\n";
					noFile++;
					String fileNameNext = "deck" + noFile + ".wml";
					doc.wmlFile += "\n<br/>\n<anchor>\nMore...<go href=\"http://161.246.6.222:8080/webdav/" + fileNameNext + "\">\n</go>\n</anchor>";
					doc.wmlFile += "<do type=\"prev\" label=\"Back\">\n<prev/></do>\n";
					doc.wmlFile += "</p>\n</card>\n</wml>";
					stout += doc.wmlFile;
					FileOutputStream output;
					byte[] by;
					try
					{
						output = new FileOutputStream(fileName);
						by = stout.getBytes();
						output.write(by);
					}
					catch(IOException e)
					{
						System.exit(3);
					}
					doc.wmlFile = "";
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

	public static void convert2wml(String st)
	{
		tagRemain = 0;
		noFile = 1;
		FileOutputStream output;
		int readVar = 0;
		byte[] by;
		try
		{
			String stout = "<?xml version=\"1.0\"?>\n<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\"\n\"http://www.wapforum.org/DTD/wml_1.1.wml\">\n";
			stout += "<wml>\n<card id=\"card1\">\n<p>\n";
			int stoutlength = stout.length();
			/***************************/
			FindClose(st);
			/*for (int i=0; i<tagArr.length; i++)
			{
				System.out.print(tagArr[i]+i+", ");
			}
			//System.out.println("\n");*/
			st = head(st);
			if (!frame.equals(""))
			{
				stout += frame;
				stout += "\n</p>\n</card>\n</wml>";
			}
			else
			{
				indexArr = 0;
				while (!tagArr[indexArr].equals("0<body>"))
				{
					indexArr++;
				}
				indexArr++;
				stout += convert(st);
				System.out.println(tagArr[indexArr]);
			}
			/***************************/
			output = new FileOutputStream("C:/tomcat4.0/webapps/webdav/deck" + noFile + ".wml");
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
	}
}

class Doc
{
	Doc()
	{
		indexFile = 0;
		wmlFile = "";
	}
	int indexFile;
	String wmlFile;
}