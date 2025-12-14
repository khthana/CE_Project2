import java.net.*;
import java.io.*;

public class  YahooDirParserThread extends Thread
{
	public int dirNum = 0 , dirlayer = 3;
	public int subdirNum[] = new int[40];
	public String dir[][] = new String[40][3];
	public String textURL;
	protected int linkorder;

	public YahooDirParserThread (String textURL, int linkorder) throws IOException
	{
		this.textURL = textURL; this.linkorder = linkorder;
		dissect ("http://search.yahoo.com/bin/search?p=" + textURL);
	}
	
	protected String host,file;
	protected int port;

	protected void dissect (String textURL) throws MalformedURLException
	{
		URL url = new URL (textURL);
		host = url.getHost();
//		System.out.print("Host = " + host + "  ");
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
		System.out.println("End of connect Process of YahooDirParserThread");
	}

	protected void fetch() throws IOException
	{
		writer.write("GET " + file + " HTTP/1.0\r\n" + "User-Agent: Mozilla/4.03 (en) (Win95; l)\n" + "Accept: image/gif, image/jpeg, */* \n"+"Accept-Language: en \n" + "Accept-Charset: iso-8859-1,*,utf-8\n" + "Cache-Control: max-age=259200\n\n");
		writer.flush();

		PrintWriter console = new PrintWriter(System.out);
		String input,tempst,dirResult,s;
		StringBuffer sb = new StringBuffer();
		int hrefIndex, tIndex1, tIndex2, indexofdt;

		while ((input = reader.readLine()) != null)
		{
			//console.println(input);
			sb.append(input);
			//console.flush();
		}
		String ss = new String(sb);
		indexofdt = ss.indexOf("<dt>");
		if (indexofdt > 0)
		{
			dirResult = ss.substring(indexofdt);
			int lastindexofdt = ss.lastIndexOf("<dt>");
			
			dirNum = 0;
			if (indexofdt > 0)
			{//means that Yahoo! have directory for the link
				if (!(indexofdt == lastindexofdt))
				{// this means that there's "<dt>" more than one.
					lastindexofdt = dirResult.lastIndexOf("<dt>");
					indexofdt = 0;
					while (!(indexofdt == -1))
					{//loop until last of "<dt>"
						hrefIndex = dirResult.indexOf("<a href",indexofdt);
						tempst = dirResult.substring(indexofdt+29,hrefIndex);
						tIndex1 = dirResult.indexOf(">",hrefIndex);
						tIndex2 = dirResult.indexOf("<",tIndex1);
						tempst += dirResult.substring(tIndex1 + 1, tIndex2) + " &gt; ";

						dirFilter(tempst);//-------------send to get directory of this link from Yahoo!
						dirNum++;

						indexofdt = dirResult.indexOf("<dt>",hrefIndex);
					}
					
					MetacrawlerLinkParserThread.dirNum[linkorder] = dirNum;

				}else
				{	
					indexofdt = 0;
					hrefIndex = dirResult.indexOf("<a href",indexofdt);
					tempst = dirResult.substring(indexofdt+29,hrefIndex);
					tIndex1 = dirResult.indexOf(">",hrefIndex);
					tIndex2 = dirResult.indexOf("<",tIndex1);
					tempst += dirResult.substring(tIndex1 + 1, tIndex2) + " &gt; ";

					dirFilter(tempst);//-------------send to get directory of this link from Yahoo!
					dirNum++;

					MetacrawlerLinkParserThread.dirNum[linkorder] = dirNum;
				}
			}
	
		} else { System.out.println("Yahoo doesn't have directory for this link");}

		MetacrawlerLinkParserThread.getdiralready[linkorder] = true;
		MetacrawlerLinkParserThread.setalready = true;
//		System.out.println("End of fetch Process of YahooDirParserThread");
	}
	protected void disconnect() throws IOException 
	{
		reader.close();
//		System.out.println("End of disconnect Process");
	}

	protected void dirFilter(String inputURL) throws IOException
	{
		String strfiltemp = new String();
		int beginIndex, tempIndex, lastIndex, x;
		beginIndex = 0;
		x = 0;
		tempIndex = inputURL.indexOf(" &gt; ");
		lastIndex = inputURL.lastIndexOf(" &gt; ");
		if (!(inputURL.startsWith("Regional")))
		{
			while ( x < dirlayer )
			{
				MetacrawlerLinkParserThread.dir[linkorder][dirNum][x] = inputURL.substring(beginIndex,tempIndex);
				dir[dirNum][x] = inputURL.substring(beginIndex,tempIndex);
//				System.out.println("dir[" + dirNum + "][" + x + "] is " + dir[dirNum][x]);

				beginIndex = tempIndex + 6;
				tempIndex = inputURL.indexOf(" &gt; ",beginIndex);
				if (tempIndex == -1)
				{
					x = dirlayer;
				}
				x++;
			}
		}else // means that inputURL startsWith "Regional"
		{
			while ( x < dirlayer )
			{
				MetacrawlerLinkParserThread.dir[linkorder][dirNum][x] = inputURL.substring(beginIndex,tempIndex);
				dir[dirNum][x] = inputURL.substring(beginIndex,tempIndex);

				beginIndex = tempIndex + 6;
				tempIndex = inputURL.indexOf(" &gt; ",beginIndex);
				if (tempIndex == -1)
				{
					x = dirlayer;
				}
				x++;
			}

			while (tempIndex != -1)//-----------check exists
			{
				strfiltemp = inputURL.substring(beginIndex,tempIndex);
//				System.out.println("strfiltemp is ....." + strfiltemp);
				if ((strfiltemp.startsWith("Art")) || (strfiltemp.startsWith("Business"))
		  		|| (strfiltemp.startsWith("Computer")) || (strfiltemp.startsWith("Education")) 
				|| (strfiltemp.startsWith("Entertain")) || (strfiltemp.startsWith("Govern")) 
				|| (strfiltemp.startsWith("Health")) || (strfiltemp.startsWith("News")) 
				|| (strfiltemp.startsWith("Recreation")) || (strfiltemp.startsWith("Reference")) 
				|| (strfiltemp.startsWith("Science")) || (strfiltemp.startsWith("Social")) 
				|| (strfiltemp.startsWith("Society")))
				{
//					dirNum++;
					x=0;
					while ( x < dirlayer )
					{
//						System.out.println("dirNum ========> " + dirNum);
						MetacrawlerLinkParserThread.dir[linkorder][dirNum][x] = inputURL.substring(beginIndex,tempIndex);
						dir[dirNum][x] = inputURL.substring(beginIndex,tempIndex);

						beginIndex = tempIndex + 6;
						tempIndex = inputURL.indexOf(" &gt; ",beginIndex);
						if (tempIndex == -1)
						{
							x = dirlayer;
						}
						x++;
					}
					tempIndex = -1;
				}
				else 
				{
					beginIndex = tempIndex + 6;
					tempIndex = inputURL.indexOf(" &gt; ",beginIndex);
				}
			}
		}
//		System.out.println("End of dirFilter Process");
	}

	

	protected void showDirResult() throws IOException
	{
		int a,b;
//		System.out.println("Begin of ShowDirResult Process");
		
		try 
		{
			FileOutputStream f = new FileOutputStream("testYahoo.dat");
			PrintStream ps = new PrintStream(f);
			a=0;
			ps.println("#  Output of YahooDirParserThread.class");
			ps.println("keyword is " + textURL);
			ps.println("dirNum is " + dirNum);
			while( a < dirNum )
			{
				b=0;
				ps.print(" -");
				while ( (b < dir[a].length) && (dir[a][b] != null))
				{
					ps.print(dir[a][b] + " > ");
					b++;
				}
				MetacrawlerLinkParserThread.subdirNum[linkorder][a] = b;
				subdirNum[a] = b;

				ps.println("\t & dirNum is " + dirNum);
				a++;
			}

			System.out.println("Done writing to output file.");
			ps.close();
			f.close();
		} catch (Exception E) 
		{
			System.out.println("can not process the file testMetacrawlerLinkParserThread");
		}
	}

	public void run()
	{
		try
		{
//			YahooDirParserThread dirParser = new YahooDirParserThread (args[0],args[1]);//---------test in application
//			dirParser.grab();//---------test in application
//			dirParser.showDirResult();//---------test in application
			grab();//-----------in thread
			showDirResult();//--------------in thread
		}
		catch (IOException ex)
		{
			//ex.printStackTrace();
		}
		System.out.println (" - YahooDirParserThread OK - " );
	}
}
