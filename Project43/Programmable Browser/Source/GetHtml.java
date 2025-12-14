import java.net.*;
import java.io.*;
import java.lang.*;

class GetHtml
{
	BufferedReader  in;
	GetHtml(String strUrl) throws MalformedURLException,IOException
	{
		URL url = new URL(strUrl);		
		in = new BufferedReader(new InputStreamReader(url.openConnection().getInputStream())); 
		FileOutputStream fos = new FileOutputStream("d://search_result.html",false);
	 
		boolean more= true;
		while (more)
		{
			String str = in.readLine();
			if (str == null){more = false;}
			else {
				str = str+"\n";
				fos.write(str.getBytes());
			}
		}		
		fos.close();	
	}
}

	