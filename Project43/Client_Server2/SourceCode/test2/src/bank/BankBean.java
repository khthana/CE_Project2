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

public class BankBean implements EntityBean {
  EntityContext entityContext;
  public String creditId;
  public String password;
  public double balance;
  public String ejbCreate(String creditId, String password, double balance) throws CreateException {
    this.creditId = creditId;
    this.password = password;
    this.balance = balance;
    return null;
  }
  public String ejbCreate(String creditId) throws CreateException {
    return ejbCreate(creditId, null, 0);
  }
  public void ejbPostCreate(String creditId, String password, double balance) throws CreateException {
  }
  public void ejbPostCreate(String creditId) throws CreateException {
    ejbPostCreate(creditId, null, 0);
  }
  public void ejbRemove() throws RemoveException {
  }
  public void ejbActivate() {
  }
  public void ejbPassivate() {
  }
  public void ejbLoad() {
  }
  public void ejbStore() {
  }
  public void setEntityContext(EntityContext entityContext) {
    this.entityContext = entityContext;
  }
  public void unsetEntityContext() {
    entityContext = null;
  }
  public String getCreditId() {
    return creditId;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  public double getBalance() {
    return balance;
  }
  public void setBalance(double balance) {
    this.balance = balance;
  }
}