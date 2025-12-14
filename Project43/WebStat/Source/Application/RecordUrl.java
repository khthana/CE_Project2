import java.io.*;

public class RecordUrl 
{
    int account;
	String Url;
	String email;
	String pager;
	String numpager;
	String icq;
	String flag;

	public void read(RandomAccessFile file) throws IOException
	{
		account = file.readInt();

		byte b1[] = new byte[50];
		file.readFully(b1);
		Url = new String(b1,0);

		byte b2[] = new byte[50];
		file.readFully(b2);
		email = new String(b2,0);
		
		byte b3[] =  new byte[5];
		file.readFully(b3);
		pager = new String(b3,0);
		
		byte b4[] = new byte[10];
		file.readFully(b4);
		numpager = new String(b4,0);
		
		byte b5[] =  new byte[15];
		file.readFully(b5);
		icq = new String(b5,0);

		byte b6[] =  new byte[3];
		file.readFully(b6);
		flag = new String(b6,0);
	}

	public void write(RandomAccessFile file) throws IOException
    {
		file.writeInt(account);
	
		byte b1[] = new byte[50];
		if (Url != null)
			Url.getBytes(0,Url.length(),b1,0);
        file.write(b1);
		
		byte b2[] = new byte[50];
		if (email != null)
			email.getBytes(0,email.length(),b2,0);
        file.write(b2);
		
		byte b3[] = new byte[5];
		if (pager != null)
			pager.getBytes(0,pager.length(),b3,0);
        file.write(b3);
		
		byte b4[] = new byte[10];
		if (numpager != null)
			numpager.getBytes(0,numpager.length(),b4,0);
        file.write(b4);

		byte b5[] = new byte[15];
		if (icq != null)
			icq.getBytes(0,icq.length(),b5,0);
        file.write(b5);

		byte b6[] = new byte[3];
		if (flag != null)
			flag.getBytes(0,flag.length(),b6,0);
        file.write(b6);
}

	public int size() {return 150;}
}