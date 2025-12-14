package notebook;

import java.rmi.*;
import javax.ejb.*;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public interface Notebook extends EJBObject {
  public void deleteProduct(String productId) throws RemoteException;

  public String getProductId() throws RemoteException;
  public String getCpu() throws RemoteException;
  public void setCpu(String cpu) throws RemoteException;
  public String getRam() throws RemoteException;
  public void setRam(String ram) throws RemoteException;
  public String getHdd() throws RemoteException;
  public void setHdd(String hdd) throws RemoteException;
  public String getCdRom() throws RemoteException;
  public void setCdRom(String cdRom) throws RemoteException;
  public String getFdd() throws RemoteException;
  public void setFdd(String fdd) throws RemoteException;
  public String getDisplay() throws RemoteException;
  public void setDisplay(String display) throws RemoteException;
  public String getFaxModem() throws RemoteException;
  public void setFaxModem(String faxModem) throws RemoteException;
  public String getMore() throws RemoteException;
  public void setMore(String more) throws RemoteException;
}