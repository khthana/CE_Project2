package personalcom;

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

public interface PersonalcomHome extends EJBHome {
  public Personalcom create(String productId, String type, String model, String bus, String interfac, String chipset, String speed, String capacity, String more) throws RemoteException, CreateException;
  public Personalcom create(String productId) throws RemoteException, CreateException;
  public Personalcom findByPrimaryKey(String primaryKey) throws RemoteException, FinderException;
  public Collection findByConditionInGroup(String sqlWhere,Vector productIdFromProductTB) throws RemoteException, FinderException;
  public Collection findAll() throws RemoteException, FinderException;
}