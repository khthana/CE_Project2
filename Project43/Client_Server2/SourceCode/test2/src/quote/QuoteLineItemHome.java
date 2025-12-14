package quote;

import java.rmi.*;
import javax.ejb.*;
//import base.*;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public interface QuoteLineItemHome extends EJBHome {
  public QuoteLineItem create(String productId) throws RemoteException, CreateException;
}