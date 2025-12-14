import java.awt.*;
import java.io.*;
import java.util.*;
import java.net.*;

//TimerAgent Class : manage time for running many function ...
public class TimerAgent implements Runnable
{
	
	Date time;
	String str;
	String url = "";
	String function = "";

	static SwingBrowser browser[] = new SwingBrowser[10]; //user can open 10 browsers
	static boolean running = false;
	static Hashtable variableString;
	static int index = 0;

	int auto;
	int x;
	int waitTime;
	int alarmMid = 0;

	boolean tomorrow = false;
	boolean wait = false;	

	public void setTime(Date t)		{time=t;}	//set time's Agent
	public void setMid(int mid)		{alarmMid = mid;}
	public void setString(String s) { str=s; }

//show amount of browser
	public void getIndex(int browserNo) { index = browserNo; }
	public void setWait(int time)
	{
		wait = true;
		waitTime = time;
	}
	public void getVarStr(Hashtable variable) { variableString = variable; }
	public void getTomorrow(boolean tm) { tomorrow = tm; }

//process for run thread : parameter<int>
	public void process(int i)
	{
		running = true;
		auto = i;
		Thread runnit = new Thread(this);
		runnit.start();
	}

//process for run thread: parameter<str>
	public void process(String tmpUrl)
	{
		running = true;
		url = tmpUrl;
		auto = 3;
		Thread runnit = new Thread(this);
		runnit.start();
	}

	public void processSearch(String functionCmd)
	{
		running = true;
		function = functionCmd;
		auto = 4;
		Thread runnit = new Thread(this);
		runnit.start();
	}

	public void processCGI(String functionCmd)
	{
		running = true;
		function = functionCmd;
		auto = 5;
		Thread runnit = new Thread(this);
		runnit.start();
	}

	public void processNews(String functionCmd)
	{
		running = true;
		function = functionCmd;
		auto = 6;
		Thread runnit = new Thread(this);
		runnit.start();
	}


	public void run()
	{		
		long delta;
		try
		{
			if (!wait)
			{
				Calendar now = Calendar.getInstance();
				Calendar alarm = Calendar.getInstance();
				alarm.setTime(time);
				int curHour = now.get(Calendar.HOUR);
				int curMid = now.get(Calendar.AM_PM);

				if (curMid == 1) { curHour = curHour + 12; }

				int alarmHour = alarm.get(Calendar.HOUR);

				if (alarmMid == 1) { alarmHour = alarmHour + 12; }
				if (tomorrow)
				{
					alarmHour = alarmHour + 24;
					tomorrow = false;
				}
				
				int deltaHour = ((alarmHour-curHour)%24)*60;				
				int curMin = now.get(Calendar.MINUTE);
				int alarmMin = alarm.get(Calendar.MINUTE);
				long deltaMin = (alarmMin-curMin)%60;
				delta = (deltaHour+deltaMin)*60*1000;				
			}//end if !wait
			else 
			{
				delta = waitTime*60*1000;
			}
			//running = true;
			if ( delta >= 0 )
			{
				Thread.sleep(delta);
			}else {auto = 0;}

		}
		catch (InterruptedException e) {	}
		executeCmd();
		running = false;
	}

//run function
	public void executeCmd()
	{
		if (auto == 1)//open browser & URL-Name : Default
		{
			System.out.println("old index : <open> : "+index);
			SwingBrowser brOpen = new SwingBrowser("");
			browser[index] = brOpen;
			index++;
			System.out.println("new index : <open> : "+index);
			brOpen.setVisible(true);
		}
		if (auto == 2)//close browser
		{
			System.out.println("old index : <close> : "+index);
			if (index>0)
			{
				SwingBrowser a = browser[index-1];
				a.dispose();
				index--;
				System.out.println("new index : <close> : "+index);
			}
			else System.out.println("Can't close,have no more browser!!!");
						
		}
		if (auto == 3 )//open browser & set URL-Name
		{
			System.out.println("old index : <open> : "+index);
			SwingBrowser brOpen = new SwingBrowser(url);
			browser[index] = brOpen;
			index++;
			System.out.println("new index : <open> : "+index);
			brOpen.setVisible(true);
			
		}
		if (auto == 4) { search();  }

		if (auto == 5) { cgiProc(); }
		if (auto == 6) { news(); 	}
		if (auto == 7)
		{
			try
			{
				NewsMenu a = new NewsMenu("News Reader");
				a.setBackground(Color.lightGray);
				a.setSize(530,555);
				a.show();
				a.setVisible(true);
			}
			catch (Exception e) { System.out.println(e); }			
		}
		System.out.println("Agent Work!!");

	}

	void news()
	{
		StringTokenizer paramNews = new StringTokenizer(function,"(");
		String commandNews = paramNews.nextToken();
		String param = paramNews.nextToken();
		StringTokenizer paramTok = new StringTokenizer(param,",");
		String newsServer = paramTok.nextToken();
		String newsGp = paramTok.nextToken();
		String send2Friend = paramTok.nextToken();		

		send2Friend = send2Friend.substring(0,send2Friend.length()-1);

		try {
				NewsMenu a = new NewsMenu(newsServer,newsGp,send2Friend);
		}
		catch (Exception err) {
			System.out.println(err);
		}	
	}

	void search()
	{
		String temp = function.substring(7,function.length()-1);
			String keyword="";
			int i=0;
			while (i < temp.length())
			{
				if (temp.charAt(i)=='+')		{keyword = keyword + "%2B";}
				else if (temp.charAt(i)=='"')	{keyword = keyword + "%22";}
				else {keyword = keyword + temp.charAt(i);}
				i++;
			}
			System.out.println("keyword : "+keyword);			
			System.out.println("old index : <open> : "+index);
			SwingBrowser brOpen = new SwingBrowser("search.yahoo.com/bin/query?p="+keyword);
			browser[index] = brOpen;
			index++;
			System.out.println("new index : <open> : "+index);
			brOpen.setVisible(true);
			try
			{
				GetHtml url = new GetHtml("http://search.yahoo.com/bin/query?p="+keyword);	
			}
			catch (MalformedURLException me)
			{ System.out.println("MalformedURLException occurs!!!"); }
			catch (IOException ioe)
			{ System.out.println("IOException occurs!!!"); }
	}

	void cgiProc()
	{
		
		String pagerUrl="";
		 
		StringTokenizer cgiProcOrder = new StringTokenizer(function,"(");
		String cgiProcUrl = cgiProcOrder.nextToken();
		String paramProc = cgiProcOrder.nextToken();

		System.out.println(cgiProcUrl);
		System.out.println(paramProc);


		StringTokenizer cgiProcPath = new StringTokenizer(cgiProcUrl,"/");
		String cgiProcComm="";
		while (cgiProcPath.hasMoreTokens())
		{
			cgiProcComm = cgiProcPath.nextToken();
		}

		if (cgiProcComm.equals("page"))
		{

			System.out.println("cgi Procedure : pager");
			StringTokenizer cgiProcParam = new StringTokenizer(paramProc,",");
			String service = "";
			String company = cgiProcParam.nextToken();
			String num = cgiProcParam.nextToken();
			String passwd = cgiProcParam.nextToken();
			String messg = cgiProcParam.nextToken();
			String tempmsg = "";

			messg = messg.substring(0,messg.length()-1);

			System.out.println(company);
			System.out.println(num);
			System.out.println(passwd);
			System.out.println(messg);
			if ( company.equals("142") )
			{ 
				service = "0";
			}else if ( company.equals("152") )
			{
				service = "1";
			}else if ( company.equals("162") )
			{
				service = "2";
			}else if ( company.equals("1144") )
			{
				service = "3";
			}else if ( company.equals("1188") )
			{
				service = "4";
			}

			if (variableString.containsKey(messg))
			{
				String messg1 = (String)variableString.get(messg);
				System.out.println("++++++++++ message before change : "+messg1);
				int msgLen = messg1.length();
				int count = 0;
				while ( count < msgLen )
				{
					if (messg1.charAt(count) == ' ')
					{
						tempmsg = tempmsg + "+";
					}else {
						tempmsg = tempmsg + messg1.charAt(count);
					}
					count++;
				}
				
				System.out.println("Get String from Variable : "+tempmsg);
//				pagerUrl = cgiProcUrl+".cgi?number="+num+"&password="+passwd+"&msg="+tempmsg;
			}
			else tempmsg = messg;
			
		//	System.out.println(messg);

			System.out.println(pagerUrl);
			//agent.process("161.246.10.21");
			//agent.process(pagerUrl);			
			try
			{
				URL url = new URL ("http://161.246.4.3/~s0010892/pager.cgi");	
				URLConnection connection = url.openConnection();
				connection.setDoOutput(true);
				OutputStream out = connection.getOutputStream();
				Writer writer = new OutputStreamWriter (out,"latin1");

				writer.write( "company="+URLEncoder.encode(service) );
				writer.write( "&number="+URLEncoder.encode(num) );
				writer.write( "&password="+URLEncoder.encode(passwd) );
				writer.write( "&message="+URLEncoder.encode(tempmsg) );
				writer.write( "&from="+URLEncoder.encode("agent") );
				writer.close();

				InputStream in = connection.getInputStream();
				
				Reader reader = new InputStreamReader (in , "latin1");
				BufferedReader bufferedreader = new BufferedReader (reader);

				PrintWriter console = new PrintWriter ( new FileOutputStream("d://post_result.html") );

				String line;
				while ( ( line = bufferedreader.readLine() ) != null )
				{
					console.println(line);
				}//end while
				console.flush();
				bufferedreader.close();
			}
			catch (MalformedURLException me)
			{ System.out.println("MalformedURLException occurs!!!"); }
			catch (IOException ioe)
			{ System.out.println("IOException occurs!!!"); }

		}

	

	}

}
