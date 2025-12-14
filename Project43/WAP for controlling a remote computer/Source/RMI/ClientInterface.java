import java.util.*;
import java.io.*;
import java.rmi.*;

public interface ClientInterface extends Remote
{
	public void loginSuccessed(String username) throws RemoteException;
	public void showMessage(String msg) throws RemoteException;
	public void updateList(Vector authorizedList, Vector unauthorizedList) throws RemoteException;
	public void showPostIt(String post_msg) throws RemoteException;
	public void showPostIt(String from, String subject, String date, String message) throws RemoteException;
	public void recieveFile(Hashtable files, String wapname) throws RemoteException;
	public Hashtable sendFile(String current_path, String[] filenames, String wapname) throws RemoteException;
	public Vector listFilename(String current_path, String directory) throws RemoteException;
	public String executeCommand(String command, String wapname) throws RemoteException;
}
