import java.rmi.Remote;
import java.rmi.RemoteException;

public interface AgentInf extends Remote {

  public String getStatus() throws RemoteException;
  public void recieve(String data,String sender) throws RemoteException;
  public void setKey(String key) throws RemoteException;
}