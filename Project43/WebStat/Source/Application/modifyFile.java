import java.awt.*;
import java.io.*;

public class modifyFile {

  UpdateRec update;
  NewRec newRec;
  DeleteRec deleteRec;
  
  RandomAccessFile file;
  RecordUrl data;

  public modifyFile(String command,int account,String Url,String email,String pager,String numpager,String icq,String flag)
  {
	try
	{
		file = new RandomAccessFile("fileUrl.dat", "rw");
	}
	catch (IOException e)
	{
		System.err.println(e.toString());
	    System.exit(1);  
	}
	data = new RecordUrl();

    if (command.equals("Insert"))
    {
		newRec = new NewRec(file);
		newRec.account = account;
		newRec.Url = Url;
		newRec.email = email;
		newRec.pager = pager;
		newRec.numpager = numpager;
		newRec.icq = icq;
		newRec.flag = flag;
		newRec.insert();
    }
	else if (command.equals("Delete"))
    {
		deleteRec = new DeleteRec(file);
		deleteRec.account = account;
		deleteRec.Url = Url;
		deleteRec.email = email;
		deleteRec.pager = pager;
		deleteRec.numpager = numpager;
		deleteRec.icq = icq;
		deleteRec.flag = flag;
		deleteRec.delete();
    }
	else if (command.equals("Update"))
    {
    	update = new UpdateRec(file);
		update.account = account;
		update.Url = Url;
		update.email = email;
		update.pager = pager;
		update.numpager = numpager;
		update.icq = icq;
		update.flag = flag;
		update.update();
    }
	cleanup(); 
   }
	public void cleanup()
	{
		try
		{
			file.close();
		}
		catch (IOException e)
		{
			System.err.println(e.toString());
			System.exit(1);
		}
	}

  public static void main (String args[]) {
	 String command = args[0];
	 int account = Integer.parseInt(args[1]);
	 String Url = args[2];
	 String email = args[3];
	 String pager = args[4];
	 String numpager = args[5];
	 String icq = args[6];
	 String flag = args[7];
  
	  modifyFile Mo = new modifyFile(command,account,Url,email,pager,numpager,icq,flag);
  }
}

class NewRec 
{
	RandomAccessFile file;
	int account;
	String Url;
	String email;
	String pager;
	String numpager;
	String icq;
	String flag;
	RecordUrl data;

	public NewRec(RandomAccessFile f)
	{
		file = f;
		data = new RecordUrl();
    }
    public void insert()
	{
 		try
		{
            data.account = account;
			data.Url = Url;
			data.email = email;
			data.pager	 =  pager;
			data.numpager = numpager;
			data.icq	=  icq;
			data.flag	 =  flag;
  		 	file.seek((account-1)*data.size());
			data.write(file);
		}
		catch (IOException e)
		{
			System.out.println("Error reading file");
		}
	}
}

class DeleteRec 
{
	RandomAccessFile file;
	int account;
	String Url;
	String email;
	String pager;
	String numpager;
	String icq;
	String flag;
	RecordUrl data;

	public DeleteRec(RandomAccessFile f)
	{
		file = f;
		data = new RecordUrl();
    }
    public void delete()
	{
 		try
		{
			data.account = 0;
			data.Url = ";";
			data.email = ";";
			data.pager	 =  ";";
			data.numpager = ";";
			data.icq	=  ";";
			data.flag  =  ";";
  		 	file.seek((account-1)*data.size());
			data.write(file);
		}
		catch (IOException e)
		{
			System.out.println("Error reading file");
		}
	}
}

class UpdateRec 
{
	RandomAccessFile file;
	int account;
	String Url;
	String email;
	String pager;
	String numpager;
	String icq;
	String flag;
	RecordUrl data;

	public UpdateRec(RandomAccessFile f)
	{
		file = f;
		data = new RecordUrl();
    }
    public void update()
	{
 		try
		{
            data.account = account;
			data.Url = Url;
			data.email = email;
			data.pager	 =  pager;
			data.numpager = numpager;
			data.icq	=  icq;
			data.flag	=  flag;
  		 	file.seek((account-1)*data.size());
			data.write(file);
		}
		catch (IOException e)
		{
			System.out.println("Error reading file");
		}
	}
}

