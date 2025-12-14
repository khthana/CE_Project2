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

public interface Scrollpane2Int extends java.rmi.Remote
{
  public void constructor () throws java.rmi.RemoteException;
  public void setScrollpane(Frame3 f3) throws java.rmi.RemoteException;

}