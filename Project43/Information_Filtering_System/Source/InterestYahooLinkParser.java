import java.net.*;
import java.io.*;
import java.util.*;

public class  InterestYahooLinkParser
{
	public static int interestLink = 3;
	public static int totalLink = 10;
	public static Vector usedLink = new Vector();

	public static Vector iinterest = new Vector();
	public static Vector titleinterest = new Vector();
	public static Vector detailinterest = new Vector();
	public static Vector directory = new Vector();
	public static Vector subDirectory = new Vector();

	public Vector subDirectorytemp = new Vector();

	public String thisDir;
	String dir[] = new String[3];
	String subdir[] = new String[3];
	String textURL;

	public InterestYahooLinkParser(String textURL) throws IOException
	{
		System.out.println("First Constructor & textURL is " + textURL);		
		this.thisDir = textURL;
//		getUsedLink();
		dissect ("http://dir.yahoo.com/" + textURL);
		grab();

//		System.out.println("(Constructor)iinterst.size() is " + iinterest.size());
	}

	public InterestYahooLinkParser(String[] dir, String[] subdir) throws IOException 
	{
		this.dir = dir; 
		this.subdir = subdir;
		System.out.println("Second Constructor & initial all static value");
		initial();

		if (dir[2] != "")
		{
			textURL = dir[0] + "/" + dir[1] + "/" + dir[2] + "/";
			this.thisDir = textURL;
//			getUsedLink();
			dissect ("http://dir.yahoo.com/" + textURL);
			grab();
		}
		else
		{
			textURL = dir[0] + "/" + dir[1] + "/" ;
			this.thisDir = textURL;
			dissect ("http://dir.yahoo.com/" + textURL);
			grab();
			int i = 0;
			
			while ((i < 3) && (iinterest.size() < totalLink))
			{
				textURL = dir[0] + "/" + dir[1] + "/" + subdir[i] + "/";
				InterestYahooLinkParser interestParser = new InterestYahooLinkParser(textURL);

				while (interestParser.subDirectory.size() > 0)
				{
					subDirectorytemp.addElement(interestParser.subDirectory.elementAt(0));
					interestParser.subDirectory.removeElementAt(0);
				}
			}
		}

		considerLink();		
		showInterestResult();
	}

	public InterestYahooLinkParser(String[][] sortdir) throws IOException
	{
		System.out.println("Third Constructor & initial all static value");
		initial();
		int dirindex = 0;
		if (sortdir[2][0] == "")
		{
			interestLink = 10;
		}

		while ((iinterest.size() < totalLink)&&(dirindex < 100)&&(sortdir[dirindex][0] != ""))
		{
			if (sortdir[dirindex][2] == "")
			{
				textURL = sortdir[dirindex][0] + "/" + sortdir[dirindex][1] + "/";
				this.thisDir = textURL;
//				getUsedLink();
				dissect ("http://dir.yahoo.com/" + textURL);
				grab();
				interestLink = iinterest.size()+3;
				if (interestLink > totalLink)
				{
					interestLink = totalLink;
				}
				System.out.println("sub 3 is \"\" & iinterest.size() is " + iinterest.size());
			}
			else
			{
				textURL = sortdir[dirindex][0] + "/" + sortdir[dirindex][1] + "/" + sortdir[dirindex][2] + "/";
				this.thisDir = textURL;
				dissect ("http://dir.yahoo.com/" + textURL);
				grab();
				System.out.println("sub 3 has some term & iinterest.size() is " + iinterest.size());
				considerLink();		
				interestLink = iinterest.size()+3;
				if (interestLink > totalLink)
				{
					interestLink = totalLink;
				}
				System.out.println("sub 3 has some term & iinterest.size() is " + iinterest.size());
			}
			dirindex++;
		}
		showInterestResult();
	}


	protected void initial()
	{
		totalLink = 10;
		interestLink = 3;
		while (iinterest.size() > 0)
		{
			iinterest.removeElementAt(0);
		}
		while (titleinterest.size() > 0)
		{
			titleinterest.removeElementAt(0);
		}
		while (detailinterest.size() > 0)
		{
			detailinterest.removeElementAt(0);
		}
		while (subDirectory.size() > 0)
		{
			subDirectory.removeElementAt(0);
		}
		while (directory.size() > 0)
		{
			directory.removeElementAt(0);
		}
		while (subDirectorytemp.size() > 0)
		{
			subDirectorytemp.removeElementAt(0);
		}
	}


// getUsedLink() method must be in inform class....this is original
	protected static void getUsedLink() throws IOException
	{
		System.out.println("Entered ReadFile in getUsedLink()");

	    FileInputStream fin = new FileInputStream("interestTest.dat");
		BufferedInputStream bin = new BufferedInputStream(fin);
		DataInputStream din = new DataInputStream(bin);

		String s;

		while ((s = din.readLine()) != null)
		{
			usedLink.addElement(new String(s));
		}
		din.close();
		System.out.println("End of GetUsedLink method of InterestYahooLinkParser");
	}
	
	
	protected String host,file;
	protected int port;

	protected void dissect (String textURL) throws MalformedURLException
	{
		URL url = new URL (textURL);
		host = url.getHost();
		port = url.getPort();
		if (port == -1)
		{
			port = 80;
		}
		file = textURL;
	}

	public void grab() throws IOException
	{
		connect();
		try
		{
			fetch();
		}
		finally
		{
			disconnect();
		}
	}
	
	protected Writer writer;
	protected BufferedReader reader;

	protected void connect() throws IOException 
	{
		Socket socket = new Socket (host, port);

		OutputStream out = socket.getOutputStream();
		writer = new OutputStreamWriter(out, "Latin1");

		InputStream in = socket.getInputStream();
		Reader reader = new InputStreamReader(in, "Latin1");
		this.reader = new BufferedReader (reader);
//		System.out.println("End of connect Process of InterestYahooLinkParser");
	}

	protected void fetch() throws IOException
	{
		writer.write("GET " + file + " HTTP/1.0\r\n\n");// + "User-Agent: Mozilla/4.03 (en) (Win95; l)\n" + "Accept: image/gif, image/jpeg, */* \n"+"Accept-Language: en \n" + "Accept-Charset: iso-8859-1,*,utf-8\n" + "Cache-Control: max-age=259200\n\n");
		writer.flush();

		System.out.println("Hello... this in fetch method & file is " + file);

		String input,tempst,interestlinkResult, s, substrCat, catlink;
		StringBuffer sb = new StringBuffer();
		int hrefIndex, indexofendoftd, indexofli, indexofnextli, indexofpop, indexofCat, indexofendCat, indexofbclearall, temp, tempint;

		while ((input = reader.readLine()) != null)
		{
			sb.append(input);
		}

		String ss = new String(sb);
		
		s = ss.substring(0,200);//--------------Test input header
		System.out.println("s is " + s);//--------------Test input header

		boolean flagdir = true;

		indexofbclearall = ss.indexOf("<br clear=all>");
		indexofCat = ss.indexOf("<b>Categories</b></font>");
		if (indexofCat != -1)
		{
			indexofendCat = ss.indexOf("</td></tr></table>",indexofCat);
			indexofendCat = ss.indexOf("<a href=\"",indexofendCat);

			substrCat = ss.substring(indexofCat,indexofendCat);
			ss = ss.substring(indexofendCat-20);
			indexofli = substrCat.indexOf("<li><a href=");
			indexofnextli = substrCat.indexOf("<li><a href=",indexofli + 1);
			while (indexofnextli != -1)
			{
				indexofendCat = substrCat.indexOf(">",indexofli + 12);
				catlink = substrCat.substring(indexofli + 12,indexofendCat);
				if (catlink.startsWith("/"))
				{
					//--------- nothing to do----------
				}
				else
				{
					flagdir = true;
					for (int c = 0; c<3; c++)
					{
						if (catlink.equalsIgnoreCase(subdir[c]))
						{
							flagdir = false;
						}
					}
					if (flagdir)
					{
						catlink = thisDir + catlink;
						subDirectory.addElement(catlink);
					}
				}
				indexofli = indexofnextli;
				indexofnextli = substrCat.indexOf("<li><a href=",indexofli + 1);
			}
			indexofendCat = substrCat.indexOf(">",indexofli + 12);
			catlink = substrCat.substring(indexofli + 12,indexofendCat);
			if (catlink.startsWith("/"))
			{
				//--------nothing to do------------
			}
			else
			{
				flagdir = true;
				for (int c = 0; c<3; c++)
				{
					if (catlink.equalsIgnoreCase(subdir[c]))
					{
						flagdir = false;
					}
				}
				if (flagdir)
				{
					catlink = thisDir + catlink;
					subDirectory.addElement(catlink);
				}
			}
		}

		indexofpop = ss.indexOf("Most Pop");
		if (indexofpop != -1)
		{			
			indexofli = ss.indexOf("<li><a href=",indexofpop);
			indexofnextli = ss.indexOf("<li><a href=",indexofli + 1);

			while ((indexofnextli != -1)&&(iinterest.size() < interestLink))
			{
				interestlinkResult = ss.substring(indexofli+12,indexofnextli);
				detailFilter(interestlinkResult);

				indexofli = indexofnextli;
				indexofnextli = ss.indexOf("<li><a href=\"",indexofli + 1);
			}
			if (indexofnextli == -1)
			{
				temp = ss.indexOf("</ul>",indexofli);
				interestlinkResult = ss.substring(indexofli + 12, temp);
				detailFilter(interestlinkResult);
			}
		}
		else//------------means that there's not "Most Popular"
		{
			if (ss.indexOf("<br clear=all>") == -1)
			{
				//----theres isn't any link----------
			}
			else
			{
				indexofli = ss.indexOf("<li><a href=\"http");
				indexofnextli = ss.indexOf("<li><a href=\"http",indexofli + 1);
	
				while ((indexofnextli != -1)&&(iinterest.size() < interestLink))
				{
					interestlinkResult = ss.substring(indexofli+12,indexofnextli);
					detailFilter(interestlinkResult);
					indexofli = indexofnextli;
					indexofnextli = ss.indexOf("<li><a href=",indexofli + 1);
				}
				if (indexofnextli == -1)
				{
					temp = ss.indexOf("</ul>",indexofli);
					interestlinkResult = ss.substring(indexofli + 12, temp);
					detailFilter(interestlinkResult);
				}
			}
		}
//		System.out.println("End of fetch Process of InterestYahooLinkParser");
	}
	
	protected void disconnect() throws IOException 
	{
		reader.close();
//		System.out.println("End of disconnect Process");
	}


// usedLink variable for this method is inform.usedLink ....
	protected boolean compareUsedLink(String Link)
	{
//		System.out.println("In compareUsedLink");
		boolean flag = false;
		for (int i = 0; i < usedLink.size(); i++)
		{
			if (Link.equalsIgnoreCase(usedLink.elementAt(i).toString()))
			{
				flag = true;
				break;
			}
		}
		return flag;
	}


	protected void detailFilter(String input) throws IOException
	{
		String inputURL, strfiltemp, strfiltemp1, strfiltemp2, temp_, temp_1, temp_2;
		int tempIndex, temp2Index, idxofendtag, idxof_;

//		System.out.println("In detailFilter method ");

		if (input.startsWith("\""))
		{
			tempIndex = input.indexOf("*",10);
			inputURL = input.substring(tempIndex + 1);
			tempIndex = inputURL.indexOf(">");
			strfiltemp = inputURL.substring(0,tempIndex);
			while (strfiltemp.indexOf("\"") != -1)
			{
				strfiltemp1 = strfiltemp.substring(0,strfiltemp.indexOf("\""));
				strfiltemp2 = strfiltemp.substring(strfiltemp.indexOf("\"") + 1);
				strfiltemp = strfiltemp1 + strfiltemp2;
			}
			if (!(compareUsedLink(strfiltemp)))
			{
				iinterest.addElement(new String(strfiltemp));
				idxof_ = thisDir.indexOf("_");
				temp_ = thisDir;
//				System.out.println("temp is ...... " + temp_);
				while (idxof_ != -1)
				{
//					System.out.println("idxof_ is " + idxof_);
					temp_1 = temp_.substring(0,idxof_);
					temp_2 = temp_.substring(idxof_+1);
					temp_ = temp_1 + " " + temp_2;
					idxof_ = temp_.indexOf("_");
				}
				directory.addElement(temp_);
				System.out.println("& temp_ is " + temp_);
	
				temp2Index = inputURL.indexOf("</a>");
				strfiltemp = inputURL.substring(tempIndex+1,temp2Index);
				while (strfiltemp.indexOf("<") != -1) 
				{
					idxofendtag = strfiltemp.indexOf(">",strfiltemp.indexOf("<"));
					strfiltemp1 = strfiltemp.substring(0,strfiltemp.indexOf("<"));
					strfiltemp2 = strfiltemp.substring(idxofendtag + 1);
					strfiltemp = strfiltemp1 + strfiltemp2;
				}
				titleinterest.addElement(new String(strfiltemp));			
	
				strfiltemp = inputURL.substring(temp2Index+4);
				while (strfiltemp.indexOf("<") != -1) 
				{
					idxofendtag = strfiltemp.indexOf(">",strfiltemp.indexOf("<"));
					strfiltemp1 = strfiltemp.substring(0,strfiltemp.indexOf("<"));
					strfiltemp2 = strfiltemp.substring(idxofendtag + 1);
					strfiltemp = strfiltemp1 + strfiltemp2;
				}
	
				detailinterest.addElement(new String(strfiltemp));
			}
		}else
		{
			if (!(input.startsWith("/")))
			{
				tempIndex = input.indexOf(">");
				strfiltemp = input.substring(0,tempIndex);
				subDirectory.addElement(thisDir+strfiltemp);
				System.out.println("not Begin with \" and then subDirectory is " + thisDir + strfiltemp);
			}
		}
	
//		System.out.println("End of detailFilter Process");
	}

	protected void considerLink() throws IOException
	{
		String tmp;
//		System.out.println("Begin of considerLink method of InterestYahooLinkParser");
		while (iinterest.size() < interestLink)//------------If iinterest less than interestLink
		{
			int ii;
			double dd;
			float ff;

			if (subDirectory.size() > 0)
			{				
				dd = Math.random();
				dd = dd*(subDirectory.size()-1);
				ff = Math.round(dd);
				ii = Math.round(ff);
				tmp = subDirectory.elementAt(ii).toString();
				subDirectory.removeElementAt(ii);
				
				InterestYahooLinkParser interestLinkParser = new InterestYahooLinkParser(tmp);
//				System.out.println("interestLinkParser.subDirectory.size() of " + subDirectory.elementAt(ii).toString() + " is " + interestLinkParser.subDirectory.size());

				while (interestLinkParser.subDirectory.size() > 0)
				{
//					System.out.println("iLink.subDir.size = " + interestLinkParser.subDirectory.size() + " & it is " + interestLinkParser.subDirectory.elementAt(0));
					subDirectorytemp.addElement(interestLinkParser.subDirectory.elementAt(0));
					interestLinkParser.subDirectory.removeElementAt(0);
				}
				System.out.println("i.size() is " + iinterest.size());
				considerLink();
			}
			else
			{
				if (subDirectorytemp.size() > 0)
				{
					subDirectory.addElement(subDirectorytemp.elementAt(0));
					subDirectorytemp.removeElementAt(0);
				}
				else
				{
					System.out.println("------break------");
					break;
				}
			}
		}
//		System.out.println("End of considerLink method of InterestYahooLinkParser");
	}

	protected void showInterestResult() throws IOException
	{
		int a = 0;
		
		//System.out.println("Begin of ShowInterestResult Process");
		while( a < iinterest.size())
		{
			System.out.println("link: " + iinterest.elementAt(a) + " & directory: " + directory.elementAt(a));
//			System.out.println("detail is " + detailinterest.elementAt(a));
//			System.out.println("iinterest(" + a + ") is " + iinterest.elementAt(a));
//			System.out.println("titleinterest(" + a + ") is " + titleinterest.elementAt(a));
//			System.out.println("detailinterest(" + a + ") is " + detailinterest.elementAt(a));
			a++;
		}
		
//		for (int z = 0; z < subDirectory.size(); z++)
//		{
//			System.out.println("SubDirectory("+z+") is ......." + subDirectory.elementAt(z));
//		}
//		for (int z = 0; z < subDirectorytemp.size(); z++)
//		{
//			System.out.println("SubDirectorytemp(" + z + ") is.." + subDirectorytemp.elementAt(z));
//		}
		System.out.println("iinterest.size() is " + iinterest.size());
//		System.out.println("End of ShowInterestResult Process of InterestYahooLinkParser");
	}

	public static void main(String[] args) throws IOException
	{
		try
			{	
				InterestYahooLinkParser interestParser = new InterestYahooLinkParser (args[0]);
				System.out.println("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
				interestParser.considerLink();
				interestParser.showInterestResult();
			}
			catch (IOException ex)
			{
				//ex.printStackTrace();
			}
		System.out.println (" - InterestYahooLinkParser OK - " );
	}
}
