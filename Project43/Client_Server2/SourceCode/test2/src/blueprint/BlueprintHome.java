package blueprint;

import java.rmi.*;
import javax.ejb.*;
import java.util.*;
import java.lang.*;
import java.rmi.*;
import javax.naming.*;
import javax.ejb.*;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public interface BlueprintHome extends EJBHome {
  public Blueprint create(String productId) throws RemoteException, CreateException;
}