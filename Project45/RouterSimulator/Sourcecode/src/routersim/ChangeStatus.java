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
import java.awt.*;
import javax.swing.*;
public interface ChangeStatus extends java.rmi.Remote {
public void setStatus(JPanel jp) throws java.rmi.RemoteException;
public void showdebugrip(String output,int index) throws java.rmi.RemoteException;
public void stopdebugrip(int index) throws java.rmi.RemoteException;
public void showprompt(int index) throws java.rmi.RemoteException;
public void setFrameTitle(String name,int index) throws java.rmi.RemoteException;
public void setCost(int  s_index,int  d_index,int cost)throws java.rmi.RemoteException;
public void setIndex(int index)throws java.rmi.RemoteException;
}