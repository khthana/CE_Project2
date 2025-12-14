import java.util.Date;
import java.io.*;
class LogFileWriter
{
	String filename = "access.log";
	public LogFileWriter()
	{
	}
	public LogFileWriter(String filename)
	{
		this.filename = filename;
	}
	public synchronized void writeLog(String log_string)
	{
		File log_file = new File(filename);
		if (log_file.exists())
		{
			try
			{
				FileInputStream fileInStream = new FileInputStream(log_file);
				DataInputStream inStream = new DataInputStream(fileInStream);
				byte[] byte_file = new byte[(new Long(log_file.length())).intValue()];
				inStream.readFully(byte_file);
				fileInStream.close();
				FileOutputStream fileOutStream = new FileOutputStream(log_file);
				PrintStream outStream = new PrintStream(fileOutStream);
				outStream.write(byte_file, 0, byte_file.length);
				outStream.println();
				outStream.print((new java.util.Date()).toLocaleString() + " " + log_string);
				outStream.close();
				fileOutStream.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}else{
			try
			{
				FileOutputStream fileOutStream = new FileOutputStream(log_file);
				PrintStream outStream = new PrintStream(fileOutStream);
				outStream.print((new java.util.Date()).toLocaleString() + " " + log_string);
				outStream.close();
				fileOutStream.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
}
