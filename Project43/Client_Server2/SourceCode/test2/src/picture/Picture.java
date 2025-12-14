package picture;

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

public interface Picture extends EJBObject {
  public String getProductId() throws RemoteException;
  public String getFilePic1() throws RemoteException;
  public void setFilePic1(String filePic1) throws RemoteException;
  public String getFilePic2() throws RemoteException;
  public void setFilePic2(String filePic2) throws RemoteException;
  public String getShow() throws RemoteException;
  public void setShow(String show) throws RemoteException;
  public void deleteProductId(String productId) throws RemoteException;
}