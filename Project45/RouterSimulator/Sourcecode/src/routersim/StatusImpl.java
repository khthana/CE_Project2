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

public class StatusImpl extends java.rmi.server.UnicastRemoteObject
             implements StatusInt{
  Status st;
  public StatusImpl() throws java.rmi.RemoteException
  {
   super();
  }
  public void constructor (String s) throws java.rmi.RemoteException
  {
    st = new Status(s);
  }
  public String getRname() throws java.rmi.RemoteException
  {
    Status s = new Status();
    return s.getRname();
  }
  public String  getS() throws java.rmi.RemoteException
  {
    return st.s;
  }
  public String  getS1() throws java.rmi.RemoteException
  {
    return st.s1;
  }
  public void setS1(String s) throws java.rmi.RemoteException
  {
    st.s1=s;
  }

  }
