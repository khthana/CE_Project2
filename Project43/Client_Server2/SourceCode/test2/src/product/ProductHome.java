package product;

import java.rmi.*;
import javax.ejb.*;
import java.util.*;
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

public interface ProductHome extends EJBHome {
  public Product create(String productId, String category, String brand, int quantity, java.sql.Date lastReceiveDate, double importPrice, double sellPrice,int lowSellQuantity, String sellNow) throws RemoteException, CreateException;
  public Product create(String productId) throws RemoteException, CreateException;
  public Product findByPrimaryKey(String primaryKey) throws RemoteException, FinderException;
  public Collection findByCondition(String condition,Long longTime1,Long longTime2) throws RemoteException, FinderException;
  public Collection findProductZero() throws RemoteException, FinderException;
  public Collection findAll() throws RemoteException, FinderException;
}