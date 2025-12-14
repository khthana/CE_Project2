package buy;

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

public interface BuyHome extends EJBHome {
  public Buy create(String username, String productId, int sellQuantity, double totalPrice, double totalImportPrice, java.sql.Date sellDate, String sellTime, String verify, String receiptNo) throws RemoteException, CreateException;
  public Buy create(String username, String productId, String receiptNo) throws RemoteException, CreateException;
  public Buy findByPrimaryKey(BuyPK primaryKey) throws RemoteException, FinderException;
  public Buy findMaxReceiptNo() throws RemoteException, FinderException;
  public Buy findByUsername(String username) throws RemoteException, FinderException;
  public Buy findByProductId(String productId) throws RemoteException, FinderException;
  public Buy findByCategory(String category) throws RemoteException, FinderException;
  public Collection findNewSell() throws RemoteException, FinderException;
  public Collection findByCondition(String condition,Long longTime1,Long longTime2) throws RemoteException, FinderException;
  public Collection findAll() throws RemoteException, FinderException;
}