package loadFile;

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

public interface LoadFileAdvertise extends EJBObject {
  public void loadFileAdvertise(String productId) throws RemoteException;
  public String getHead() throws RemoteException;
  public String getAbstracts() throws RemoteException;
  public String getTextfield() throws RemoteException;
}