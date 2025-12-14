package bank;

import java.rmi.*;
import javax.ejb.*;
import java.util.*;
import java.math.*;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public interface BankHome extends EJBHome {
  public Bank create(String creditId, String password, double balance) throws RemoteException, CreateException;
  public Bank create(String creditId) throws RemoteException, CreateException;
  public Bank findByPrimaryKey(String primaryKey) throws RemoteException, FinderException;
  public Collection findAll() throws RemoteException, FinderException;
}