package teller;

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

public interface TellerHome extends EJBHome {
  public Teller create() throws RemoteException, CreateException;
}