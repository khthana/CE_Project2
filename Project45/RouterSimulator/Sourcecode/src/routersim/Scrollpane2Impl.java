package routersim;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */

import java.rmi.UnmarshalException;
import javax.swing.JScrollPane;
import java.rmi.MarshalException;
import java.io.NotSerializableException;

public class Scrollpane2Impl extends java.rmi.server.UnicastRemoteObject
             implements Scrollpane2Int {
  public Scrollpane2Impl() throws java.rmi.RemoteException
  {
   super();
  }
  public void constructor () throws java.rmi.RemoteException
  {
   }
  public void setScrollpane(Frame3 f3) throws java.rmi.RemoteException
  {
    Scrollpane2  sc = new Scrollpane2();
    sc.SetScrollpane(f3);
  }
  }
