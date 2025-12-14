package buy;

import java.rmi.*;
import javax.ejb.*;
import java.math.*;
import java.sql.*;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public interface Buy extends EJBObject {
  public int getNumberOfUnverify() throws RemoteException;
  public void changeVerify(String username,String receiptNo,String verify) throws RemoteException;
  public double getSumTotalImportPrice(String receiptNo,String username) throws RemoteException;
  public double getSumTotalSellPrice(String receiptNo,String username) throws RemoteException;

  public String getUsername() throws RemoteException;
  public String getProductId() throws RemoteException;
  public int getSellQuantity() throws RemoteException;
  public void setSellQuantity(int sellQuantity) throws RemoteException;
  public double getTotalPrice() throws RemoteException;
  public void setTotalPrice(double totalPrice) throws RemoteException;
  public double getTotalImportPrice() throws RemoteException;
  public void setTotalImportPrice(double totalImportPrice) throws RemoteException;
  public Date getSellDate() throws RemoteException;
  public void setSellDate(Date sellDate) throws RemoteException;
  public String getSellTime() throws RemoteException;
  public void setSellTime(String sellTime) throws RemoteException;
  public String getVerify() throws RemoteException;
  public void setVerify(String verify) throws RemoteException;
  public String getReceiptNo() throws RemoteException;
}