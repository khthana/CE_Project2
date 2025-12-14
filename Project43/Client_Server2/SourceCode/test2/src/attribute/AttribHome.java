package attribute;

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

public interface AttribHome extends EJBHome {
  public Attrib create(String category, String attribute, String use, String no) throws RemoteException, CreateException;
  public Attrib create(String category, String attribute) throws RemoteException, CreateException;
  public Attrib findByPrimaryKey(AttribPK primaryKey) throws RemoteException, FinderException;
  public Collection findByCategory() throws RemoteException, FinderException;
  public Collection findByCategory(String cat,String orderBy) throws RemoteException, FinderException;
  public Attrib findByForm(String category) throws RemoteException, FinderException;
  public Collection findByCondition(String condition) throws RemoteException, FinderException;
  public Collection findAll() throws RemoteException, FinderException;
}