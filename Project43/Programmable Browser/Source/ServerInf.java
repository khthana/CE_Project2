import java.rmi.Remote;
import java.rmi.RemoteException;

public interface ServerInf extends Remote 
{
	public void register(AgentInf agent,String name) throws RemoteException;
	public void getName(String name) throws RemoteException;
	public void remove(String name) throws RemoteException;
	public void sendMessage(String sender,String name,String message,String newsDetail) throws RemoteException;
}
