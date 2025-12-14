package quote;

import java.rmi.*;
import javax.ejb.*;
import blueprint.*;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public interface QuoteLineItem extends EJBObject {
  public String getProductId() throws RemoteException;
  public void setBuyQuantity(int quantity) throws RemoteException;
  public int getBuyQuantity() throws RemoteException;
  public Blueprint getBlueprint() throws RemoteException;
}