import java.rmi.*;
import java.util.*;

public interface ServerInterface extends Remote  
{
	public void login(String username, String password, ClientInterface client) throws RemoteException;		//PC
	public void register(String username, String password, ClientInterface client) throws RemoteException;	//PC
	public void logout(String username) throws RemoteException;												//PC
	public void authorize(String[] auth_list, String username) throws RemoteException;						//PC
	public void unauthorize(String[] unauth_list, String username) throws RemoteException;					//PC
	public boolean getPostIt(String to, String from, String subject, String msg) throws RemoteException;	//PC
	public Hashtable getPCList() throws RemoteException;													//Mobile
	public void updatePC(String pcname) throws RemoteException;												//Mobile
	public boolean sendPostIt(String from, String to, String subject, String message) throws RemoteException;	//Mobile
	public String transferFile(String current_path, String[] filenames, String direction, String wapname, String pcname, String wappswd) throws RemoteException;	//Mobile
	public Vector getPCListFile(String current_path, String directory, String pcname) throws RemoteException;	//Mobile
	public String sendCommand(String command, String wapname, String wappswd, String pcname) throws RemoteException;	//Mobile
}
