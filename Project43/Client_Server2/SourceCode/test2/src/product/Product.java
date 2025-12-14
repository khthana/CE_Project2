package product;

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

public interface Product extends EJBObject {
  public void deleteProduct(String productId) throws RemoteException;
  public int getQuantityProductZero() throws RemoteException;

  public String getProductId() throws RemoteException;
  public String getCategory() throws RemoteException;
  public void setCategory(String category) throws RemoteException;
  public String getBrand() throws RemoteException;
  public void setBrand(String brand) throws RemoteException;
  public int getQuantity() throws RemoteException;
  public void setQuantity(int quantity) throws RemoteException;
  public Date getLastReceiveDate() throws RemoteException;
  public void setLastReceiveDate(Date lastReceiveDate) throws RemoteException;
  public double getImportPrice() throws RemoteException;
  public void setImportPrice(double importPrice) throws RemoteException;
  public double getSellPrice() throws RemoteException;
  public void setSellPrice(double sellPrice) throws RemoteException;
  public int getLowSellQuantity() throws RemoteException;
  public void setLowSellQuantity(int lowSellQuantity) throws RemoteException;
  public String getSellNow() throws RemoteException;
  public void setSellNow(String sellNow) throws RemoteException;
}