import java.io.*;
import java.lang.*;
import java.util.*;

class MakeWellForm
{
	private static boolean IsEmptyTag(String tag)
	{	// CHECK THIS TAG IS  EMPTY TAG?
		String[] emptyTag = {"<area>","<base>","<basefont>","<br>","<col>","<hr>","<img>","<isindex>",
							 "<meta>","<param>","<link>","<input>","<frame>","<!doctype>","<!-->"};
		for (int i=0; i<emptyTag.length; i++)
		{
			if (tag.equals(emptyTag[i]))
			{
				return true;	
			}
		}
		return false;
	}

	public static String MakeWellForm(String str)
	{
		int strLength = str.length();
		String st = "";// Keep Well Form HTML.
		String tagBody = "";// Start Tag.
		String tagBuffer = "";
		String tagClose = "";// Close Tag.
		String[] tagArr = new String[strLength/3];//Keep total tag in file
		int arrIndex = 0;//Index of array
		int index = 0;//Index of String
		int tagLength = 0;
		int count = 0;

	//	strLength--; // Delete '?' out.

		while (index < strLength)
		{	//While not EOF
			if (str.charAt(index) == '<')
			{
				tagBuffer = "<";
				index++;
				while ((str.charAt(index) != '>')&&(str.charAt(index) != ' ')&&(str.charAt(index) != '\r'))
				{	//Get only tag name.
					tagBuffer += str.charAt(index);
					index++;
				}
				if (tagBuffer.regionMatches(0,"<!--",0,4))
				{
					tagBuffer = "<!--";
					index = str.indexOf("-->",index-tagBuffer.length())+2;
				}
				tagBuffer += '>'; // Got tag name etc. <img>
				tagBody = tagBuffer.toLowerCase();
				tagArr[arrIndex] = tagBody;
				index++;
				arrIndex++;
			}
			else index++;
		}
		// Got total tag in array.

		index = arrIndex-1; // 'index' keep number of tags.
		arrIndex = 0;
		while (arrIndex < index)
		{	// Run whole array.
			tagBody = tagArr[arrIndex];
			if ((!(IsEmptyTag(tagBody)))&&(tagBody.charAt(1) != '/'))
			{
				tagLength = tagBody.length();
				tagClose = "</" + tagBody.substring(1,tagLength);
				count = 0;
				for (int i=arrIndex; i<=index; i++)
				{
					if (tagArr[i].equals(tagBody))
					{
						count++;
					}
					else if (tagArr[i].equals(tagClose))
					{
						count--;
					}
					if (count == 0)
					{
						break;
					}
				}
				if (count != 0)
				{
					tagArr[arrIndex] = "1" + tagBody;
				}
			}
			arrIndex++;
		}
		// which tags is not have close tag will have '1' in front of them.
		index = 0;
		arrIndex = 0;
		while (index < strLength)
		{	// Run whole file.
			if (str.charAt(index) == '<')
			{
				if (str.charAt(index+1) != '/')
				{
					tagBuffer = "";
					st += str.charAt(index);//add <
					index++;
					while (str.charAt(index) != '<')//until next tag
					{
						tagBuffer += str.charAt(index);
						index++;
					}
					if (tagBuffer.regionMatches(0,"!--",0,3))
					{
						int closeComment = str.indexOf("-->",index-tagBuffer.length()) + 3;
						st += str.substring(index-tagBuffer.length(),closeComment);
						index = closeComment;
					}
					else
					{	
						 st += tagBuffer;
					}
					if (tagArr[arrIndex].charAt(0) == '1')
					{
						st += " </" + tagArr[arrIndex].substring(2,tagArr[arrIndex].length());
					}
				}
				else
				{
					st += str.charAt(index);//add <
					index++;
					while (str.charAt(index) != '<')
					{	//until next tag
						st += str.charAt(index);
						index++;
						if (index == strLength)
						{
							break;
						}
					}
				}
				arrIndex++;
			}
			else
			{
				st += str.charAt(index);
				index++;
			}
		}

		/*for (int j=0; j<tagArr.length; j++)
		{
			System.out.print(tagArr[j] + ",");
		}*/
		return st;
	}

	public static String ChangeAmp(String xhtml)
	{
		String st2 = "";
		int indexFile = 0;
		String strBuffer = "";
		while (indexFile < xhtml.length())
		{
			if (xhtml.charAt(indexFile) == '<')
			{
				strBuffer = "";
				while (xhtml.charAt(indexFile) != '>')
				{	
					strBuffer += xhtml.charAt(indexFile);
					indexFile++;
				}
				st2 += strBuffer.replaceAll("&","&amp;") + ">";
				indexFile++;
			}
			else
			{
				st2 += xhtml.charAt(indexFile);
				indexFile++;
			}
		}
		return st2;
	}

	public static void main(String args[])
	{
		//FileInputStream input;
	//	FileOutputStream output;
		int readVar = 0;
		String st = "";
		byte[] by;
		try
		{
			InputStream in = new FileInputStream("a.html");
			Reader reader = new InputStreamReader(in,"MS874");
			BufferedReader input = new BufferedReader(reader);

			FileWriter fout = new FileWriter("b.html");
			BufferedWriter bufferedWriter = new BufferedWriter(fout);
			PrintWriter pout = new PrintWriter(bufferedWriter);
			
			while (readVar != -1)
			{
				try
				{
					readVar = input.read();
					st += (char)readVar;
				}
				catch(IOException e)
				{
					System.out.println("Unknow IO erroring file ");
					System.exit(2);
				}
			}
	/*		String stt = UnicodeToMS874(st);*/
			
				pout.print(st);
			
			input.close();
			pout.close();
		}
		catch(IOException e)
		{
			System.out.println("File input not found");
			System.exit(1);
		}
	}
}