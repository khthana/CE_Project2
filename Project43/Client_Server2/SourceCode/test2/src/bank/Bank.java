package bank;

import java.rmi.*;
import javax.ejb.*;
import java.math.*;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public interface Bank extends EJBObject {
  public String getCreditId() throws RemoteException;
  public String getPassword() throws RemoteException;
  public void setPassword(String password) throws RemoteException;
  public double getBalance() throws RemoteException;
  public void setBalance(double balance) throws RemoteException;
  public void deleteAccount(String creditId) throws RemoteException;
}