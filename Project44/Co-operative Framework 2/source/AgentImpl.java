//AgentImpl.java
import java.rmi.*;
import java.rmi.server.*;
import java.util.*;
import java.io.*;
import java.net.*;

public class AgentImpl extends UnicastRemoteObject implements Agent
{
	final String FILE_NAME = "tag.txt";
	private String[] Str1 = new String[12];
	public AgentImpl() throws RemoteException {
		super();
	}
	public void update(String[] content) throws RemoteException {
		Str1 = content;
		try
		{
			System.out.println("Update() was called");
			writeFile(FILE_NAME, content);
		}
		catch (IOException e)
		{
			System.out.println("Error writing file");
		}
	}
	private void writeFile(String fileName, String[] content) throws IOException {
		FileWriter fo = new FileWriter(fileName);
		BufferedWriter buf = new BufferedWriter (fo);
		PrintWriter pw = new PrintWriter (buf);
//		System.out.println("loop repeat = "+content.length);
		for (int i=0; i<content.length; i++ ) {
			if (content[i].equals(""))	{
				System.out.println("empty line: "+i);
				pw.print("<FONT=\"Arial\"\"14\"><PLAIN><BLACK></BLACK></PLAIN></FONT><BR>"); //default tag
			}
			else {
				System.out.println("full line: "+i);
				pw.print(content[i]+"<BR>"); //+ "<FONT=\"Arial\"\"14\"><PLAIN><BLACK></BLACK></PLAIN></FONT><BR>");
			}
		}
		pw.close();
	}
};