package personalcom;

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

public interface Personalcom extends EJBObject {
  public void deleteProduct(String productId) throws RemoteException;

  public String getProductId() throws RemoteException;
  public String getType() throws RemoteException;
  public void setType(String type) throws RemoteException;
  public String getModel() throws RemoteException;
  public void setModel(String model) throws RemoteException;
  public String getBus() throws RemoteException;
  public void setBus(String bus) throws RemoteException;
  public String getInterfac() throws RemoteException;
  public void setInterfac(String interfac) throws RemoteException;
  public String getChipset() throws RemoteException;
  public void setChipset(String chipset) throws RemoteException;
  public String getSpeed() throws RemoteException;
  public void setSpeed(String speed) throws RemoteException;
  public String getCapacity() throws RemoteException;
  public void setCapacity(String capacity) throws RemoteException;
  public String getMore() throws RemoteException;
  public void setMore(String more) throws RemoteException;
}