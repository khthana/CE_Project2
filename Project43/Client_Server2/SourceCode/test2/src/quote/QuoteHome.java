package quote;

import java.rmi.*;
import javax.ejb.*;
import customer.*;
//import base.*;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public interface QuoteHome extends EJBHome {
  public Quote create(Customer customer) throws RemoteException, CreateException;
}