package attribute;

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

public interface Attrib extends EJBObject {
  public void deleteCategory(String category) throws RemoteException;

  public String getCategory() throws RemoteException;
  public String getAttribute() throws RemoteException;
  public String getUse() throws RemoteException;
  public void setUse(String use) throws RemoteException;
  public String getNo() throws RemoteException;
  public void setNo(String no) throws RemoteException;
}