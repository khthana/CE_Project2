package dtw.webmail.util;

import java.util.Properties;
import java.net.*;
import java.io.*;

 public class PropertiesLoader {
 
	 public static Properties loadProperties(String url) 
	 		throws MalformedURLException, IOException {
	 		
		return loadProperties(new URL(url));
	 }//loadProperties(String)

	 public static Properties loadProperties(URL url) throws IOException 
         {
          Properties newprops=new Properties();
          InputStream in=url.openStream();
          newprops.load(in);
          in.close();
          return newprops;
	 }//loadProperties(URL)
	 
}//class PropertiesLoader