import java.net.*;
import java.io.*;
public class TelnetServer 
{	
	private Socket incoming;
	private int couter;
	
	public TelnetServer(){
		System.out.println("Server is Running!");
		int i = 1;
		try
		{
			ServerSocket s = new ServerSocket(6666);
			for (; ; )
			{
				Socket incoming = s.accept();
				System.out.println(" Spawning "+i);
				new TelnetHandler(incoming,i).start();
				i++;
			}//end for
		}//end try
		catch (Exception e)
		{
			System.out.println(e);
		}//end catch
	}
	/*
	public static void main(String[] args) 
	{
		System.out.println("Server is Running!");
		int i = 1;
		try
		{
			ServerSocket s = new ServerSocket(6666);
			for (; ; )
			{
				Socket incoming = s.accept();
				System.out.println(" Spawning "+i);
				new TelnetHandler1(incoming,i).start();
				i++;
			}//end for
		}//end try
		catch (Exception e)
		{
			System.out.println(e);
		}//end catch
	}//end main
	*/
}//end TelnetServer
//----------------------------------------
