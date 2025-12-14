import java.rmi.*;

public interface Agent extends Remote { 
	public void update( String content []) throws RemoteException;
}