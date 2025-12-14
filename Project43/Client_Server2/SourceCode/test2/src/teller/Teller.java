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

public interface Teller extends EJBObject {
  public void createAccount(String creditId,String password) throws RemoteException, TellerException;
  public void closeAccount(String creditId,String password) throws RemoteException, TellerException;
  public double getBalance(String creditId,String password) throws RemoteException, TellerException;
  public String getPassword(String creditId) throws RemoteException, TellerException;
  public void checkBalance(String creditId,String password,double funds) throws RemoteException, TellerException;
  public double deposit(String creditId,String password,double funds) throws RemoteException, TellerException;
  public double withdraw(String creditId,String password,double funds) throws RemoteException, TellerException;
  public void transfer(String creditId,String password,String toCreditId,double funds) throws RemoteException, TellerException;

}