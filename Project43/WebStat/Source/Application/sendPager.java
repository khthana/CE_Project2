import java.io.*; 
import java.net.*; 

public class sendPager
{
	public static void main(String[] args) throws Exception 
	{ 

		URL url = new URL("http://www.ppapager.com/pagers.cgi");

		String Pager = args[0];
		String NumPager = args[1];

		HttpURLConnection connection = (HttpURLConnection)url.openConnection(); 

		connection.setDoOutput(true); 
		connection.setRequestMethod("POST"); 

		PrintWriter out = new PrintWriter(connection.getOutputStream()); 
		out.print("EnvID="+Pager+"+"+NumPager+"&EnvDayWeek=&EnvUserName="+
		"&EnvPassword=&EnvSend=closeButton&EnvImpressFile=&EnvTimerday=&EnvTimerhour=&EnvTimerminute="+
		"&Env1188account=&Env1188password=&Submit=Submit&company="+Pager+"&number="+NumPager+"&password=&messagelen=4+chars"+
		"&EnvMessage=¢≥–π’ÈWebsite¢Õß∑Ë“π°”≈—ß¡’ª—≠À“°√ÿ≥“µ√«® Õ∫Website¢Õß∑Ë“π&EnvFrom=webStat&others=&EnvDay=This&EnvMonth=This&EnvYear=This&EnvHour=This&EnvMinute=This");
		out.flush(); 
		out.close(); 

    	BufferedReader in = new BufferedReader( new   InputStreamReader(connection.getInputStream())); 
		String inputLine; 
		
		System.out.println(Pager);
		System.out.println(NumPager);
//		System.out.println(a);
		while ((inputLine = in.readLine()) != null) 
					System.out.println(inputLine);
					in.close(); 
	} 
} 

