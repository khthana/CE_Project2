package gisonmobile;

import javax.microedition.io.*;
import javax.microedition.io.file.FileSystemRegistry;
import javax.microedition.io.file.FileConnection;
import java.util.*;
import java.io.*;

public class FileConnect
{
	private static String root="";

	public FileConnect()
	{}
	
	public static boolean isExists(String url)
	{
		try 
		{
			  FileConnection fc = (FileConnection)
			  Connector.open(url);
			  return fc.exists();
		  }
		catch (Exception e) {System.out.println(e.getMessage());}
		return false;
	}
	
	public String readFile(String url)
	{
		try 
		{
			  FileConnection fc = (FileConnection)
			  Connector.open(url);
			  if (!fc.exists()) 
			  {
				throw new IOException("File does not exists");
			  }
			  InputStream fis = fc.openInputStream();
			  StringBuffer result = new StringBuffer();
			  byte[] b = new byte[4096];
			  int length ;
			  while((length = fis.read(b, 0, 1024)) > 0)
			  {
				  result.append(new String(b,0,length));
			  }
			  fis.close();
			  fc.close();
			  return result.toString();
		  }
		catch (Exception e) {System.out.println(e.getMessage());}
		return "";
	}

	 public boolean saveFile(String mapString,String url) {
		try
		  {
			 FileConnection fc = (FileConnection)
				Connector.open(url);
			 if(!fc.exists()) 
			{
				fc.create();   
			}else
			{
				fc.delete();
				fc.create();   
			}
			OutputStream os = fc.openOutputStream();
				os.write(mapString.getBytes());
				fc.close();
				os.close();
			 
		  } catch (Exception e) {
			  return false;
		  }
		 return true;
   }
	
	public static boolean checkUsage()
	{
		boolean canUse=false;
		
		// Check that the FileConnection API is implemented
		String v = System.getProperty(
		"microedition.io.file.FileConnection.version" );
		if( v != null ){
			canUse = true;
		} 
			
		return canUse;
	}

   public static String getRoots(){
			try{
			  Enumeration drives = FileSystemRegistry.listRoots();
			  while(drives.hasMoreElements()) {
				 root = (String) drives.nextElement();
			  }
		  }catch(Exception ex)
		  {
		  }
		  return root;
   }
};  
