package routersim;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */
import java.rmi.*;

public interface ServerCallbackInt extends java.rmi.Remote{
  public void CallShow(ClientCallbackInt c) throws java.rmi.RemoteException;
}