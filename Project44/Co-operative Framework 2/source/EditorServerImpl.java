//EditorServerImpl.java
import java.rmi.*;
import java.rmi.server.*;
import java.util.*;
import java.io.*;
import java.net.*;

public class EditorServerImpl extends UnicastRemoteObject implements EditorServer
{
	final int NOOFLINE = 12;
	private String currentData[] = new String[12];
	private int information_user[] = new int[10];
	private String[] status = new String[10];
	int[] linelocked = new int[NOOFLINE];
	int lastID = 0,index = 0,indexof_status=0;

	Vector allAgent = new Vector();
	
	public EditorServerImpl() throws RemoteException
	{
		super();
		System.out.println("Editor Server Created");
		for (int i = 0; i < NOOFLINE; i++)
		{
			currentData[i] = "";
		}
	}

	public int Register(Agent agent) throws RemoteException {
		System.out.println("New client registered " + agent);
		synchronized(this) {
			allAgent.add(agent);
			lastID++;
		}
		information_user[index] = lastID;  index++;
		return lastID;
	}
	
	private void refresh() throws RemoteException
	{
		Collection col = allAgent;
		for (Iterator iterAgent = col.iterator(); iterAgent.hasNext(); ) {
			Agent curragent = (Agent) iterAgent.next();
			curragent.update(currentData);
		}
	}
	public boolean lock(int ID, String lineNum) throws RemoteException
	{
		int line = Integer.parseInt(lineNum);
		if (linelocked[line] != 0) { 
			return false;
		}
		else {
			linelocked[line] = ID;
			System.out.println("line #" + line + " was locked by Agent#" + ID);
			status[ID]="UserID#"+ID+" lock lineNo :"+lineNum;
	//		indexof_status++;
			return true;
		}
	}
	
	public boolean unlock (int ID, String lineUnlock) throws RemoteException
	{
       int line = Integer.parseInt(lineUnlock);
	   if (linelocked[line] == ID)
	   {
			linelocked[line] = 0;
			System.out.println("line #" + line + " was unlocked by Agent#" + ID);
			status[ID]="";
			return true;
	   }
	   else {
			System.out.println("line #" + line + " wasn't locked by you");
			return false;
	   }
	}

	public int getlock_user(String lineNo) throws RemoteException
	{
		int line = Integer.parseInt(lineNo);
		int getlock=0;
		getlock=linelocked[line];
		return getlock;
	}
	
	public String[] get_status() throws RemoteException
	{
		System.out.println("You have Status"+status);
		return status;	
	}

	public void sendDocumentData(int ID, String lineNo, String document) throws RemoteException
	{
		int line = Integer.parseInt(lineNo);
		if ( linelocked[line] == ID) {
			System.out.println("Update data at line " + lineNo);
			currentData[line] = document;
			refresh();
		}
		else {
			System.out.println("Cannot update, the line wasn't locked");
		}
	}
	public String getlineData(String lineNo) throws RemoteException
	{
		int line = Integer.parseInt(lineNo);
		String temp = currentData[line];
		String str="";
		int len = temp.length();
		int get=0;
		for (int i=0;i<len;i++)
		{
			if (get==3) 
			{
				str+=temp.charAt(i);
				if (temp.charAt(i)=='<') {get++;}
			}
			if (temp.charAt(i)=='>') {get++;}
//			if (get==3) 
//			{
//				str+=temp.charAt(i);
//				if (temp.charAt(i)=='<') {get++;}
//			}
		}
		String str1 = str.substring(0,str.length()-1);
//		System.out.println("String of line = "+str1);
		return str1;
	}

	public int[] get_user() throws RemoteException
	{
/*		for (int i=0;i<information_user.length;i++)
		{
			System.out.print("User Information is : ");
			System.out.print(information_user[i]+"  ");
		}*/
		return information_user;
	}

	public void dead_user(int ID) throws RemoteException
	{
		System.out.println("Dead user");
		for (int i=0;i<information_user.length;i++)
		{
			if (information_user[i] == ID)
			{
				information_user[i]=0;
			}
		}
		status[ID]="";
	}

	public static void main(String args[] ) throws Exception
	{
		 System.err.println("Initializing server : please wait");

	     EditorServerImpl edit = new EditorServerImpl();

		 String serverObjectName = "EditorServer";
		 Naming.rebind(serverObjectName, edit);
		 System.out.println(
			 "EditorServerImpl is up and running.");
	}
}