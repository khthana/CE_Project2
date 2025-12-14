import java.util.Random;

public class  Util
{

	public static int IPstring2Int(String IPstring)
	{	int IPint=0 ,mask=0x000000ff;
		int lastindex=0;
		for (int i=0;i<IPstring.length() ;i++ )
		{	if (IPstring.charAt(i)=='.')
			{
				IPint=IPint | (mask&Integer.parseInt(IPstring.substring(lastindex,i)));
				IPint=IPint<<8;
				lastindex=i+1;
			}
		}
		IPint=IPint | (mask&Integer.parseInt(IPstring.substring(lastindex,IPstring.length())));
		return IPint;
	}

	public static String IPint2String(int IPint)
	{	byte[] tmp=new byte[4];
		tmp[3]=(byte)IPint;			// tmp[0]= lowest byte of interger  "IPint"
		IPint=IPint >> 8;				// shift right IPint 8 bit
		tmp[2]=(byte)IPint;			// tmp[1]= second byte of interger  "IPint"
		IPint=IPint>> 8;
		tmp[1]=(byte)IPint;			// tmp[2]= third byte of interger  "IPint"
		IPint=IPint >> 8;
		tmp[0]=(byte)IPint;			// tmp[3]= highest byte of interger  "IPint"
		String IPstring=byte2Str(tmp[0])+"."+byte2Str(tmp[1])+"."+byte2Str(tmp[2])+"."+byte2Str(tmp[3]);
		return IPstring;
	}
	
	// Convert short to array of 2 byte
	public static byte[] short2Bytes(short param)
	{	byte[] tmp=new byte[2];
		tmp[1]=(byte)param;			// tmp[0]= lowest byte of interger  "param"
		tmp[0]=(byte)(param >> 8);	// tmp[1]= highest byte of interger  "param"
		return tmp;
	}

	// Convert integer to array of 4 byte
	public static byte[] int2Bytes(int param)
	{	byte[] tmp=new byte[4];
		tmp[3]=(byte)param;			// tmp[0]= lowest byte of interger  "param"
		param=param >> 8;			// shift right param 8 bit
		tmp[2]=(byte)param;			// tmp[1]= second byte of interger  "param"
		param=param >> 8;	
		tmp[1]=(byte)param;			// tmp[2]= third byte of interger  "param"
		param=param >> 8;
		tmp[0]=(byte)param;			// tmp[3]= highest byte of interger  "param"
		return tmp;
	}

	public static byte[] short2BytesSW(short param)
	{	byte[] tmp=new byte[2];
		tmp[0]=(byte)param;			// tmp[0]= lowest byte of interger  "param"
		tmp[1]=(byte)(param >> 8);	// tmp[1]= highest byte of interger  "param"
		return tmp;
	}

	// Convert integer to array of 4 byte
	public static byte[] int2BytesSW(int param)
	{	byte[] tmp=new byte[4];
		tmp[0]=(byte)param;			// tmp[0]= lowest byte of interger  "param"
		param=param >> 8;			// shift right param 8 bit
		tmp[1]=(byte)param;			// tmp[1]= second byte of interger  "param"
		param=param >> 8;	
		tmp[2]=(byte)param;			// tmp[2]= third byte of interger  "param"
		param=param >> 8;
		tmp[3]=(byte)param;			// tmp[3]= highest byte of interger  "param"
		return tmp;
	}

	// swap 2 byte
	public static byte[] swap2Bytes(byte[] param)
	{	byte[] tmp=new byte[2];
		tmp[0]=param[1];
		tmp[1]=param[0];
		return tmp;
	}

	// swap 4 byte
	public static byte[] swap4Bytes(byte[] param)
	{	byte[] tmp=new byte[4];
		tmp[0]=param[3];
		tmp[1]=param[2];
		tmp[2]=param[1];
		tmp[3]=param[0];
		return tmp;
	}

	// Convert byte array to hex string 
	public static String bytes2HxStr(byte[] param)
	{	String ret_str="",str_tmp="";
		int i,int_tmp,len=param.length;
		for (i=0;i<len;i++ )
		{	int_tmp=(int)param[i];
			str_tmp=Integer.toHexString(int_tmp);
			if (str_tmp.length()>2)
				str_tmp=str_tmp.substring(6);    // cut "ffffff"
			if (str_tmp.length()<2)
				str_tmp="0"+str_tmp;			// insert "0"
			ret_str=ret_str+" "+str_tmp;		// concat string
		}
		return ret_str.trim(); 
	}

	// Convert byte array to string 
	public static String bytes2Str(byte[] param)
	{	String ret_str="",str_tmp="";
		int i,int_tmp,len=param.length;
		for (i=0;i<len;i++ )
		{	int_tmp=(int)param[i];
			str_tmp=Integer.toString(int_tmp);
			if (str_tmp.length()>2)	str_tmp=str_tmp.substring(6);    // cut "ffffff"
			if (str_tmp.length()<2) str_tmp="0"+str_tmp;			// insert "0"
			ret_str=ret_str+" "+str_tmp;		// concat string
		}
		return ret_str.trim(); 
	}

	// Convert byte  to string
	public static String byte2Str(byte param)
	{	int j=param&0x0ff;
		String ret_str=""+j;
		return ret_str; 
	}

	public static short bytes2ShortSW(byte[] param)
	{	short ret_short=0,mask=(short)0x00ff;
		ret_short=(short)param[1];
		ret_short=(short)(ret_short<<8);
		ret_short=(short)(ret_short | (mask&(short)param[0]));
		return ret_short;
	}

	public static int bytes2IntSW(byte[] param)
	{	int ret_int=0,mask=0x000000ff;
		ret_int=(int)param[3];
		ret_int=ret_int<<8;
		ret_int=ret_int | (mask&(int)param[2]);
		ret_int=ret_int<<8;
		ret_int=ret_int | (mask&(int)param[1]);
		ret_int=ret_int<<8;
		ret_int=ret_int | (mask&(int)param[0]);
		return ret_int;
	}

	public static short bytes2Short(byte[] param)
	{	short ret_short=0,mask=(short)0x00ff;
		ret_short=(short)param[0];
		ret_short=(short)(ret_short<<8);
		ret_short=(short)(ret_short | (mask&(short)param[1]));
		return ret_short;
	}

	public static int bytes2Int(byte[] param)
	{	int ret_int=0,mask=0x000000ff;
		ret_int=(int)param[0];
		ret_int=ret_int<<8;
		ret_int=ret_int | (mask&(int)param[1]);
		ret_int=ret_int<<8;
		ret_int=ret_int | (mask&(int)param[2]);
		ret_int=ret_int<<8;
		ret_int=ret_int | (mask&(int)param[3]);
		return ret_int;
	}

	public static void copyBytes(byte[] source,int offset,byte[] dest)
	{	int num=dest.length;
		if ((offset+num)>source.length)System.out.println("copy out of source range");
		else 	for(int i=offset,j=0;i<(offset+num);i++,j++)dest[j]=source[i];
	}

	public static byte[] copyBytes(byte[] source,int offset,int num)
	{	byte[] ret_bytes=new byte[num];
		if ((offset+num)>source.length)System.out.println("copy out of source range");
		else 	for(int i=offset,j=0;i<(offset+num);i++,j++)ret_bytes[j]=source[i];
		return ret_bytes;
	}

	public static byte[] joinBytes(byte[] b1 ,byte[] b2)
	{	byte[] tmp = new byte[b1.length + b2.length];
		for (int i = 0 ;i < b1.length ; i++ )
		{	tmp[i] = b1[i];
		}
		int j=0;
		for (int i = b1.length ;i < (b1.length+b2.length) ; i++ )
		{	tmp[i] = b2[j];
			j++;
		}
		return tmp;
	}

	public static short portGen()
	{
    Random portGenerator=new Random(System.currentTimeMillis());
		short port=0;
		while(true)
		{
      port=(short)Math.abs(portGenerator.nextInt());
			if(port > 1024)	break;
		}
		return port;
	}

	public static byte byteRandom()
	{	Random randomGen=new Random(System.currentTimeMillis());
		byte b=0;
		b=(byte)Math.abs(randomGen.nextInt());
		return b;
	}

	public short seqRandom()
	{	Random seqGenerator=new Random(Short.MAX_VALUE);
		return (short)seqGenerator.nextInt();
	}
}