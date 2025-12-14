package routersim;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */
import java.awt.*;
import javax.swing.*;

import java.rmi.UnmarshalException;
import java.rmi.NotBoundException;
import javax.swing.border.*;
import javax.swing.JPanel;
import java.util.Vector;

public interface StatusPanelInt extends java.rmi.Remote

{
  public void constructor () throws java.rmi.RemoteException;
  public void NewStatus () throws java.rmi.RemoteException;
  public void DeleteRouter (int index) throws java.rmi.RemoteException;
  public  JPanel getPanel1() throws java.rmi.RemoteException;
  public JTextArea gettextarea2()throws java.rmi.RemoteException;
  public  void showStatusname(Router r1)throws java.rmi.RemoteException;
  public void registerClient(ChangeStatus st) throws java.rmi.RemoteException;
  public void CallShow(ClientCallbackInt c) throws java.rmi.RemoteException;
  public boolean getshow() throws java.rmi.RemoteException;
  public String getStatus() throws java.rmi.RemoteException;
}
