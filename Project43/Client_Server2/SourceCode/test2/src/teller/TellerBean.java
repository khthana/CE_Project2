package teller;

import java.rmi.*;
import javax.ejb.*;
import javax.naming.*;
import javax.rmi.*;
import bank.*;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public class TellerBean implements SessionBean {
  private SessionContext sessionContext;
  private BankHome bankHome;
  public void ejbCreate() {
  }
  public void ejbRemove() {
  }
  public void ejbActivate() {
  }
  public void ejbPassivate() {
  }
  public void setSessionContext(SessionContext context) {
    sessionContext = context;
  try {
    Context ctx = new InitialContext();
    Object obj = ctx.lookup("MyBank");
      bankHome = (BankHome) PortableRemoteObject.narrow(obj,
                  BankHome.class);
    System.out.println("obtain bankHome");
  } catch (Exception ex) {
    ex.printStackTrace();
  }
  }
////////////////////////////////////////////////////////////////
  private Bank findAccount(String creditId) {
  try {
    Bank bank = bankHome.findByPrimaryKey(creditId);
    return bank;
  } catch (Exception ex) {
  }
  return null;
  }
  private boolean verifyPassword(String creditId,String password)
        throws RemoteException {
    Bank bank = findAccount(creditId);
    System.out.println("find account accept");
    if (bank!=null) {
      String pass = bank.getPassword();
      if (password==null) password = "";
      if (pass==null) pass="";
      if (password.equals(pass)) return true;
    }
    return false;
  }
  public double getBalance(String creditId,String password)
      throws RemoteException, TellerException{
    double balance = 0;
    Bank bank = findAccount(creditId);
    if (bank!=null) {
    if (verifyPassword(creditId,password)) {
      try {
        balance = bank.getBalance();
      } catch(Exception ex) {
      throw new TellerException("cann't get Balance");
      }
    } else throw new TellerException("password isn't correct");
    } else throw new TellerException("this account isn't Exit");
    return balance;
  }
  public String getPassword(String creditId)
      throws RemoteException, TellerException{
    String password = "";
    Bank bank = findAccount(creditId);
    if (bank!=null) {
      try {
        password = bank.getPassword();
      } catch(Exception ex) {
      throw new TellerException("cann't get Password");
      }
    } else throw new TellerException("this account isn't Exit");
    return password;
  }

  public void createAccount(String creditId,String password)
      throws RemoteException, TellerException{
    Bank bank = findAccount(creditId);
    if (bank==null) {
    try {
      bank = bankHome.create(creditId,password,0);
    } catch (Exception ex) {
      throw new TellerException("Cann't create this account");
    }
    } else throw new TellerException("this account isn't Exit");
  }
  public void closeAccount(String creditId,String password)
      throws RemoteException, TellerException{
    Bank bank = findAccount(creditId);
    if (bank!=null) {
    if (verifyPassword(creditId,password)) {
      try {
      bank.deleteAccount(creditId);
      } catch(Exception ex) {
      throw new TellerException("cann't delect this Account");
      }
    } else throw new TellerException("password isn't correct");
    } else throw new TellerException("this account isn't Exit");
  }
  public void checkBalance(String creditId,String password,double funds)
      throws RemoteException, TellerException{
    Bank bank = findAccount(creditId);
    double totalPrice = 0;
    if (bank!=null) {
    if (verifyPassword(creditId,password)) {
      try {
        totalPrice = bank.getBalance()-funds;
        if (totalPrice<0) {
          throw new TellerException("your balance not enough to withdraw");
        }
      } catch(RemoteException ex) {
      throw new TellerException("cann't check your balance");
      }
    } else throw new TellerException("password isn't correct");
    } else throw new TellerException("this account isn't Exit");
  }
  public double deposit(String creditId,String password,double funds)
      throws RemoteException, TellerException{
    System.out.println(">>c>>>"+creditId+"<<<p<<"+password);
    Bank bank = findAccount(creditId);
    double totalPrice = 0;
    if (bank!=null) {
    if (verifyPassword(creditId,password)) {
      try {
      System.out.println("password is correct");
        totalPrice = bank.getBalance()+funds;
      System.out.println("totalPrice :"+totalPrice);
        bank.setBalance(totalPrice);
      } catch(RemoteException ex) {
      throw new TellerException("cann't deposit this funds");
      }
    } else throw new TellerException("password isn't correct");
    } else throw new TellerException("this account isn't Exit");
    return totalPrice;
  }
  public double withdraw(String creditId,String password,double funds)
      throws RemoteException, TellerException{
    Bank bank = findAccount(creditId);
    double totalPrice = 0;
    if (bank!=null) {
    if (verifyPassword(creditId,password)) {
      try {
        totalPrice = bank.getBalance()-funds;
        if (totalPrice<0) {
          throw new TellerException("your balance not enough to withdraw");
        }
        bank.setBalance(totalPrice);
      } catch(RemoteException ex) {
      throw new TellerException("cann't withdraw this funds");
      }
    } else throw new TellerException("password isn't correct");
    } else throw new TellerException("this account isn't Exit");
    return totalPrice;
  }
  public void transfer(String creditId,String password,String toCreditId,double funds)
      throws RemoteException, TellerException{
    Bank bank = findAccount(creditId);
    Bank toBank = findAccount(toCreditId);
    double totalPrice = 0;
    if (bank!=null) {
    if (toBank!=null) {
    if (verifyPassword(creditId,password)) {
      try {
        totalPrice = bank.getBalance()-funds;
        if (totalPrice<0) { throw new TellerException("your balance not enough to withdraw");}
        bank.setBalance(totalPrice);
        toBank.setBalance(toBank.getBalance()+funds);
      } catch(RemoteException ex) {
      throw new TellerException("cann't withdraw this funds");
      }
    } else throw new TellerException("password isn't correct");
    } else throw new TellerException("account of transfer isn't Exit");
    } else throw new TellerException("your account isn't Exit");
  }


}