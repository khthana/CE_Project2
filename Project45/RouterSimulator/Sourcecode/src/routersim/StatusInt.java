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

public interface StatusInt extends java.rmi.Remote

{
  public void constructor (String s) throws java.rmi.RemoteException;
  public String  getRname() throws java.rmi.RemoteException;
  public String  getS() throws java.rmi.RemoteException;
  public String  getS1() throws java.rmi.RemoteException;
  public void setS1(String s) throws java.rmi.RemoteException;

}