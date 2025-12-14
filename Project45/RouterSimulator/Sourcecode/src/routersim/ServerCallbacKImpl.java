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
import java.rmi.server.UnicastRemoteObject;
import javax.swing.JPanel;

public class ServerCallbackImpl extends UnicastRemoteObject implements ServerCallbackInt {
  static JPanel panel1;
  public ServerCallbackImpl()  throws RemoteException
  {
    super();
  }
   public void CallShow(ClientCallbackInt c) throws java.rmi.RemoteException
   {
     c.callShowStatus(StatusPanel.jPanel1);
   }
   public void setPanel(JPanel panel)
   {
   }

}