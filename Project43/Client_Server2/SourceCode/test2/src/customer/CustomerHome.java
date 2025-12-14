package customer;

import java.rmi.*;
import javax.ejb.*;
import java.util.*;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public interface CustomerHome extends EJBHome {
  public Customer create(String username, String password, String name, String no, String soi, String street, String district, String province, String country, String areaCode, String tel, String fax, String email, String creditId, String userType) throws RemoteException, CreateException;
  public Customer create(String username) throws RemoteException, CreateException;
  public Customer findByPrimaryKey(String primaryKey) throws RemoteException, FinderException;
  public Customer findCreditManager() throws RemoteException, FinderException;
  public Collection findByCondition(String condition) throws RemoteException, FinderException;
  public Collection findAll() throws RemoteException, FinderException;
}