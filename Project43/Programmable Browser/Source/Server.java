import java.rmi.*;
import java.rmi.server.*;
import java.util.*;
import java.io.*;


public class Server extends UnicastRemoteObject implements ServerInf {

  AgentInf agent;
  String naming;
  String key;
  Hashtable agentAll = new Hashtable();
  int id=0;

  public Server() throws RemoteException {
  }
  
  public void register(AgentInf agent,String name) throws RemoteException {		
		this.agent = (AgentInf)agent;
		naming = name;
		agentAll.put(name,agent);		
  }

  public void getName(String name) throws RemoteException {
		naming = name;
  }

  public void remove(String name) throws RemoteException {
		agentAll.remove(name);		
  }

  public void sendMessage(String sender,String name,String message,String newsDetail) throws RemoteException {
	   try
	   {
	   		if (agentAll.containsKey(name))
		   {
			   AgentInf friend = (AgentInf)agentAll.get(name);
			   if ((friend.getStatus()).equals(message))
			   {
				   friend.recieve(newsDetail,sender);				   
			   }			   
		   };
	   }
	   catch (Exception e) { System.out.println(e); }	   
  }

  public static void main (String[] args) throws Exception {
    Server agentServer = new Server();
    Naming.bind ("Agent Server", agentServer);
  }
}