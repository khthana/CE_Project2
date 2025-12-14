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
import java.util.Vector;

import java.rmi.UnmarshalException;
import java.rmi.NotBoundException;
import javax.swing.JPanel;


public class StatusPanelImpl extends java.rmi.server.UnicastRemoteObject
             implements StatusPanelInt{
  StatusPanel st=null;
  static Vector ClientList = new Vector();
  public StatusPanelImpl() throws java.rmi.RemoteException
  {
   super();
  }
  public void constructor () throws java.rmi.RemoteException
  {
   st = new StatusPanel();
  }
  public void NewStatus()throws java.rmi.RemoteException
  {
    st  = new StatusPanel();
    st.New_Status();
  }
   public void DeleteRouter (int index) throws java.rmi.RemoteException
   {
     StatusPanel.Delete_Router(index);
   }
   public  JPanel getPanel1() throws java.rmi.RemoteException
   {
     return StatusPanel.jPanel1;
   }
   public JTextArea gettextarea2()throws java.rmi.RemoteException
   {
     return st.getTextarea2();
  }
  public  void showStatusname(Router r1)throws java.rmi.RemoteException
  {
         st.showStatus_name(r1);
  }
  public void registerClient(ChangeStatus st) throws java.rmi.RemoteException
  {
      StatusPanel.registerClientList(st);
  }
  public void CallShow(ClientCallbackInt c) throws java.rmi.RemoteException
  {

      StatusPanel.setObject(c);
  }
   public boolean getshow() throws java.rmi.RemoteException{
     return StatusPanel.show;
  }
    public String getStatus() throws java.rmi.RemoteException{
      return StatusPanel.status;
    }


             }