import java.net.*;
import java.io.*;

public class  MetacrawlerLinkParserThread
{
	public static String dir[][][] = new String[40][40][3];
	public static int subdirNum[][] = new int[40][40];
	public static int dirNum[] = new int[40];
	public static boolean getdiralready[] = new boolean[40];
	public static boolean setalready = false;
	boolean full = false;
	String llink[] = new String[40];
	String titlelink[] = new String[40];
	String detaillink[] = new String[40];
	String linkgetdir[] = new String[40];
	int	weightMeta[] = new int[40];
	int linkNum;

	public MetacrawlerLinkParserThread (String textURL) throws IOException
	{
		linkNum = 0;
		for (int a = 0; a<40; a++)
		{
			getdiralready[a] = false;
			dirNum[a] = 0;
			llink[a] = null;
			titlelink[a] = null;
			detaillink[a] = null;
			linkgetdir[a] = null;
			weightMeta[a] = 0;
			for (int b = 0; b<20; b++)
			{
				subdirNum[a][b] = 0;
				for (int c = 0; c<3; c++)
				{
					dir[a][b][c] = null;
				}
			}
		}
		dissect (textURL);
//		System.out.println("End of Constructor");
	}
	
	protected String host,file;
	protected int port;

	protected void dissect (String textURL) throws MalformedURLException
	{
		textURL = "http://search.metacrawler.com/crawler?general=" + textURL;
		URL url = new URL (textURL + "&method=0&redirect=&region=0&rpp=40&timeout=0&hpe=10&sort=0&power=0&refer=mc-search");
		host = url.getHost();
		port = url.getPort();
		if (port == -1)
		{
			port = 80;
		}
		file = textURL+ "&method=0&redirect=&region=0&rpp=40&timeout=0&hpe=10&sort=0&power=0&refer=mc-result1";
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
//		System.out.println("End of connect Process of MetacrawlerLinkParserThread");
	}

	protected void fetch() throws IOException
	{
		String input, linkURL, linkResult, s;
		StringBuffer sb = new StringBuffer();
		int indexofdt, tempIndex, temp2Index, temp3Index, lastindexofdt;

		System.out.println("In fetch method ");
		writer.write("GET " + file + " HTTP/1.0\n\n");// + "User-Agent: Mozilla/4.03 (en) (Win95; l) Blash/2.13 libwww/2.17b3 \n" + "referer: http://www.metacrawler.com\n" + "Accept: text/html, image/gif, image/jpeg, */* \n" + "Accept-Language: en \n" + "Accept-Charset: iso-8859-1,*,utf-8\n" + "Cache-Control: max-age=259200\n\n");//"Referer :http://www.metacrawler.com/metacrawler.html\n"
		writer.flush();

		System.out.println("file is " + file);

		while ((input = reader.readLine()) != null)
		{
			sb.append(input);
		}
		String ss = new String(sb);
		indexofdt = ss.indexOf("<dt>");
		s = ss.substring(0,300);
		System.out.println("s is " + s);//--------------------test respone from server
		if (indexofdt > 0)
		{//means that MetaCrawler have link for the query...
			linkResult = ss.substring(indexofdt);
			lastindexofdt = linkResult.lastIndexOf("<dt>");
			linkNum = 0;
			indexofdt = 0;
			while (!(indexofdt == -1))
			{// loop until last of <dt>
				indexofdt = indexofdt+37;
				tempIndex = linkResult.indexOf("</dl>",indexofdt);
				linkURL = linkResult.substring(indexofdt,tempIndex);

				linkFilter(linkURL);

				indexofdt = linkResult.indexOf("<dt>",tempIndex);
			}

			//--------------- Begin to wait result of thread-------------------

			boolean full = false;
			do
			{
			}
			while (!(setalready));//-----------------wait until first thread come
			while (!full)//-----------------------wait until all thread came
			{
				full = true;
				for (int temp=0; temp<linkNum; temp++)
				{
					full = (full && (getdiralready[temp]));
				}
			}

						
		} else { System.out.println("MetaCrawler doesn't have links for this link");}

//		System.out.println("End of fetch Process of MetacrawlerLinkParser");
	}
	protected void disconnect() throws IOException 
	{
		reader.close();
//System.out.println("End of disconnect Process of MetacrawlerLinkParserThread");
	}

	protected void linkFilter(String inputURL) throws IOException
	{
//		System.out.println("inputURL is----------> " + inputURL);
		int idxtmp1, idxtmp2, idxtmp3, idxoftag1, idxoftag2, idxofendtag1, idxofendtag2, idxofand, idxofendand,a ,b ,indexoflastslash, tttemp;
		idxtmp1 = inputURL.indexOf("://",0);
		idxtmp2 = inputURL.indexOf("/",idxtmp1+4);
		idxtmp3 = 0;
		String lgd, tempstr1, tempstr2, tempstr3;
		String s = new String(inputURL);
		idxtmp1 = s.indexOf("&to=");
		idxtmp2 = s.indexOf("\"",idxtmp1);
//		String ss = new String(s.substring(idxtmp1+4,idxtmp2);
		String ss = new String(s.substring(idxtmp1+4));
		idxtmp1 = s.indexOf("://",0);
		idxtmp2 = s.indexOf("/",idxtmp1+4);
		idxtmp3 = 0;
		String sss = new String(ss.substring(idxtmp1+3));
		System.out.println("sss is ......." + sss);

		if (sss.startsWith("click.go2net"))
		{
			lgd = null;			
		}
		else
		if (sss.startsWith("click.hotbot"))
		{
			idxtmp1 = ss.indexOf("&target",idxtmp2);
			idxtmp1 = ss.indexOf("http",idxtmp1);
			idxtmp2 = ss.indexOf("&query",idxtmp1);
			lgd = ss.substring(idxtmp1,idxtmp2);
		}
		else 
		{
			idxtmp1 = ss.indexOf("\">");
			lgd = ss.substring(0,idxtmp1-1);
		}
		if (lgd != null)
		{
			idxtmp1 = ss.indexOf("\">");
//			llink[linkNum] = inputURL.substring(0,idxtmp1-1);
			llink[linkNum] = lgd;
			tttemp = llink[linkNum].indexOf("://",0);
			indexoflastslash = llink[linkNum].lastIndexOf("/");
			if (indexoflastslash == (tttemp+2))
			{
				lgd = llink[linkNum];
			}else
			{
				lgd = llink[linkNum].substring(0,indexoflastslash+1);
			}
			linkgetdir[linkNum] = lgd;
//			System.out.println("linkgetdir[" + linkNum + "] is " + lgd);

//			System.out.println("llink[" + linkNum + "] is " + llink[linkNum]);
		
			idxtmp2 = ss.indexOf("</a>",idxtmp1);
			titlelink[linkNum] = ss.substring(idxtmp1+1,idxtmp2);			
			idxoftag1 = titlelink[linkNum].indexOf("<");
			while (idxoftag1 != -1) 
			{
				idxoftag2 = titlelink[linkNum].indexOf(">",idxoftag1);
				tempstr1 = titlelink[linkNum].substring(0,idxoftag1);
				tempstr2 = titlelink[linkNum].substring(idxoftag2 + 1);
				titlelink[linkNum] = tempstr1+tempstr2;
				idxoftag1 = titlelink[linkNum].indexOf("<");
			}
			
			idxofand = titlelink[linkNum].indexOf("&",0);
//			System.out.println("idxofand is " + idxofand);
			while (idxofand != -1)
			{
				if ((idxofand + 7)< titlelink[linkNum].length())
				{
					tempstr1 = titlelink[linkNum].substring(idxofand,idxofand + 7);
					if (tempstr1.indexOf(";") != -1)
					{
						idxofendand = titlelink[linkNum].indexOf(";",idxofand);
					tempstr1 = titlelink[linkNum].substring(0,idxofand);
					tempstr2 = titlelink[linkNum].substring(idxofendand + 1);
					titlelink[linkNum] = tempstr1+tempstr2;
					}
				}
				idxofand = titlelink[linkNum].indexOf("&",idxofand+1);
			}
//			System.out.println("titlelink[" + linkNum + "] is " + titlelink[linkNum]);


			idxtmp1 = ss.indexOf("<dd>",idxtmp2);
			idxtmp2 = ss.indexOf("<br>",idxtmp1);
			detaillink[linkNum] = ss.substring(idxtmp1+4,idxtmp2);
			idxoftag1 = detaillink[linkNum].indexOf("<");
			while (idxoftag1 != -1) 
			{
				idxoftag2 = detaillink[linkNum].indexOf(">",idxoftag1);
				tempstr1 = detaillink[linkNum].substring(0,idxoftag1);
				tempstr2 = detaillink[linkNum].substring(idxoftag2 + 1);
				detaillink[linkNum] = tempstr1 + tempstr2;
				idxoftag1 = detaillink[linkNum].indexOf("<");
			}

			idxofand = detaillink[linkNum].indexOf("&",0);
			while (idxofand != -1)
			{
//				System.out.println("indxofand = " + idxofand);
//				System.out.println("detaillink["+linkNum+"].length() is " + detaillink[linkNum].length());
				if ((idxofand + 7) < detaillink[linkNum].length())
				{
					tempstr1 = detaillink[linkNum].substring(idxofand,idxofand + 7);
					if (tempstr1.indexOf(";") != -1)
					{
						idxofendand = detaillink[linkNum].indexOf(";",idxofand);
						tempstr1 = detaillink[linkNum].substring(0,idxofand);
						tempstr2 = detaillink[linkNum].substring(idxofendand + 1);
						detaillink[linkNum] = tempstr1+tempstr2;
						idxofand = detaillink[linkNum].indexOf("&");
					}
				}
				idxofand = detaillink[linkNum].indexOf("&",idxofand+1);
			}
//			System.out.println("detaillink[" + linkNum + "] is " + detaillink[linkNum]);

			idxtmp1 = ss.indexOf("<font size=",idxtmp2);
			idxtmp2 = ss.indexOf(",",idxtmp1);
			tempstr1 = ss.substring(idxtmp1 + 16,idxtmp2);
			weightMeta[linkNum] = Integer.parseInt(tempstr1);

			callYahooThread();
			
			linkNum++;
		}
		
//		System.out.println("End of linkFilter Process of MetacrawlerLinkParserThread");
	}
	protected void callYahooThread() 
	{
		try
		{
//			System.out.println("try loop... linkgetdir is " + linkgetdir[linkNum] + " & linkNum = " + linkNum);
			YahooDirParserThread yahoodirparser = new YahooDirParserThread(linkgetdir[linkNum],linkNum);
			yahoodirparser.start();
		}
		catch (IOException ex)
		{
			ex.printStackTrace();
		}
	}

	protected void showLinkResult() throws IOException
	{
		int a, b;
		try 
		{
			FileOutputStream f = new FileOutputStream("testMetacrawler.dat");
			PrintStream ps = new PrintStream(f);
			ps.println("#  Output of MetacrawlerLinkParserThread.class");
			ps.println("linkNum is ........" + linkNum);

			for (int linkcount = 0; linkcount < linkNum; linkcount++)
			{
//				ps.println("linkgetdir[" + linkcount + "] = " + linkgetdir[linkcount]);
//				ps.println("llink[" + linkcount + "]  = " + llink[linkcount]);
				ps.println(linkgetdir[linkcount] + " & dir is " + dir[linkcount][0][0]);
//				ps.println("titlelink[" + linkcount + "]  = " + titlelink[linkcount]);			
//				ps.println("detaillink[" + linkcount + "]  = " + detaillink[linkcount]);
//				ps.println("weightMeta[" + linkcount + "]  = " + weightMeta[linkcount]);
				a=0;
//				ps.println("dirNum[" + linkcount + "] is " + dirNum[linkcount]);
//				ps.println(linkcount + " order of link's directories");
				while((a < dirNum[linkcount]))
				{
					b=0;
//					ps.print("- ");
					while ((b < subdirNum[linkcount][a]))
					{
//						ps.print(dir[linkcount][a][b] + "> ");
						b++;
					}
					ps.println();
					a++;
				}
			}
			
//			System.out.println("Done writing to output file.");
			ps.close();
			f.close();
		} catch (Exception E) {
//        System.out.println("can not process the file testMetacrawlerLinkParserThread");
    }
	}

	public static String decodeSting (String str)
	{
		String replaced = str.replace('+',' ');
		StringBuffer result = new StringBuffer();
		int idx, odx = 0;
		while ((idx = str.indexOf('%', odx)) != -1)
		{
			result.append(replaced.substring(odx,idx));
			try
			{
				result.append((char) Integer.parseInt(str.substring(idx+1,idx+3),16));
			}
			catch (NumberFormatException ex)
			{
				System.out.println(ex);
			}
			odx = idx + 3;
		}
		result.append(replaced.substring(odx));
		return result.toString();
	}

	public static void main(String[] args) throws IOException
	{
		try
			{
				MetacrawlerLinkParserThread linkParser = new MetacrawlerLinkParserThread (args[0]);
				linkParser.grab();
				System.out.println("Show result of set of Link :");
				linkParser.showLinkResult();
			}
			catch (IOException ex)
			{
				ex.printStackTrace();
			}
		System.out.println (" -MetacrawlerLinkParserThread OK - " );
	}
}
