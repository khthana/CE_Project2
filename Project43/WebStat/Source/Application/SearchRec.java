import java.io.*;

public class SearchRec 
{
  RandomAccessFile file;
  RecordUrl data;
  String temp = "";
  long record=0;

  public SearchRec()
  {
	try
	{
		file = new RandomAccessFile("fileUrl.dat", "rw");
		file.seek(file.length());
		record =  (file.getFilePointer()+13)/150;
	}
	catch (IOException e)
	{
		System.err.println(e.toString());
	    System.exit(1);  
	}
	data = new RecordUrl();
  }

	public String getUrl(int account) 
	{ 
		try
		{
			file.seek((account-1)*data.size());
			data.read(file);
		}
		catch (IOException e)
		{
			System.out.println("Error reading file");
		}
		temp = data.Url;
        temp = temp.substring(0,temp.indexOf(";"));
	   return temp;
   }

	public String getEmail(int account) 
	{ 
		try
		{
			file.seek((account-1)*data.size());
			data.read(file);
		}
		catch (IOException e)
		{
			System.out.println("Error reading file");
		}
		temp = data.email;
        temp = temp.substring(0,temp.indexOf(";"));
	   return temp;
   }

	public String getPager(int account) 
	{ 
		try
		{
			file.seek((account-1)*data.size());
			data.read(file);
		}
		catch (IOException e)
		{
	  		System.out.println("Error reading file");
		}
		temp = data.pager;
        temp = temp.substring(0,temp.indexOf(";"));
	   return temp;
   }
	
	public String getNumpager(int account) 
	{ 
		try
		{
			file.seek((account-1)*data.size());
			data.read(file);
		}
		catch (IOException e)
		{
		   System.out.println("Error reading file");
		}
		temp = data.numpager;
        temp = temp.substring(0,temp.indexOf(";"));
	   return temp;
   }
	public String getIcq(int account) 
	{ 
		try
		{
			file.seek((account-1)*data.size());
			data.read(file);
		}
		catch (IOException e)
		{
			System.out.println("Error reading file");
		}
		temp = data.icq;
        temp = temp.substring(0,temp.indexOf(";"));
	   return temp;
   }

	public String getFlag(int account) 
	{ 
		try
		{
			file.seek((account-1)*data.size());
			data.read(file);
		}
		catch (IOException e)
		{
			System.out.println("Error reading file");
		}
		temp = data.flag;
        temp = temp.substring(0,temp.indexOf(";"));
	   return temp;
   }
    
	public long getRecord()
	{
		return record;
	}

}

