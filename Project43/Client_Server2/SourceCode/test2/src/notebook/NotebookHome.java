package notebook;

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

public interface NotebookHome extends EJBHome {
  public Notebook create(String productId, String cpu, String ram, String hdd, String cdRom, String fdd, String display, String faxModem, String more) throws RemoteException, CreateException;
  public Notebook create(String productId) throws RemoteException, CreateException;
  public Notebook findByPrimaryKey(String primaryKey) throws RemoteException, FinderException;
  public Collection findByConditionInGroup(String sqlWhere,Vector productIdFromProductTB) throws RemoteException, FinderException;
  public Collection findAll() throws RemoteException, FinderException;
}