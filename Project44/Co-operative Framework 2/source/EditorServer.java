// EditorServer.java
import java.rmi.*;

public interface EditorServer extends Remote{
		//this sent the Document data to the user
//		public DocumentData requestDocumentData() throws RemoteException;

		//this provide the request lock to lock or not
//		public boolean requestLock(String username,int page,int line) throws RemoteException;

		//this provide the request to send from user to server
		public int Register(Agent agent) throws RemoteException;
		public void  sendDocumentData(int ID, String lineNo, String document)  throws RemoteException;
		public String getlineData(String lineNo) throws RemoteException;
		public int[] get_user() throws RemoteException;
		public String[] get_status() throws RemoteException;
		public void dead_user(int ID) throws RemoteException;
		//String refresh() throws RemoteException;
		public boolean lock(int ID, String line) throws RemoteException; 
		public boolean unlock(int ID, String line) throws RemoteException;
		public int getlock_user(String lineNo) throws RemoteException;
		//this provide the request to login from user to server
//		public boolean login(String username) throws RemoteException;

		//this provide the request to logout from user to server
//		public boolean logout(String username) throws RemoteException;

}