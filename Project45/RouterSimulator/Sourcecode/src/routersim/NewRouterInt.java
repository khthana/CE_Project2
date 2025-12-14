package routersim;

import java.util.Vector;
import java.util.Arrays;
import java.rmi.UnmarshalException;

public interface NewRouterInt extends java.rmi.Remote
{
  public void constructor (int series) throws java.rmi.RemoteException;

  public void setvRouter() throws java.rmi.RemoteException;
  public Vector getvRouter() throws java.rmi.RemoteException;
  public Vector getvName() throws java.rmi.RemoteException;
  public void DelRouter(int index)throws java.rmi.RemoteException;
  public Vector getvStatus() throws java.rmi.RemoteException;
  public Vector getvModel() throws java.rmi.RemoteException;
  public void setvFrame(int size) throws java.rmi.RemoteException;
  public void setvModel() throws java.rmi.RemoteException;
  public void showFrame(int index)  throws java.rmi.RemoteException;
  public void showStatus(int index)  throws java.rmi.RemoteException;
  public void NewFrameR(String name,int model) throws java.rmi.RemoteException;
  public  void setCost(int indexr1,int indexr2,int cost) throws java.rmi.RemoteException;
  public  Vector getName() throws java.rmi.RemoteException;
  public  Vector getInt() throws java.rmi.RemoteException;
  public void setMaxr(Router r)throws java.rmi.RemoteException;
  public int getMaxr()throws java.rmi.RemoteException;
  public void setIntName() throws java.rmi.RemoteException;
  public Vector getIntName() throws java.rmi.RemoteException;
  public void setCostOfWire(String R_Source,String R_Dest,int cost) throws java.rmi.RemoteException;
  public void deleteInt( int i , String s ) throws java.rmi.RemoteException;
  public void wireDelete( int index1 , int index2 , String int1 , String int2 , String t ) throws java.rmi.RemoteException;
  public void setsingleMode(boolean yes) throws java.rmi.RemoteException;
  public void singlemode() throws java.rmi.RemoteException;
  public void normalmode() throws java.rmi.RemoteException;
  public void nextstep() throws java.rmi.RemoteException;
  public void deleteAllVector() throws java.rmi.RemoteException;
  public Router getRouter() throws java.rmi.RemoteException;
  public String getrname() throws java.rmi.RemoteException;
  public int gettype() throws java.rmi.RemoteException;
  public void checkVhello(Router rs,Router rd) throws java.rmi.RemoteException;
  public int getCost()throws java.rmi.RemoteException;

}