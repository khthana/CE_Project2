package picture;

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

public interface PictureHome extends EJBHome {
  public Picture create(String productId, String filePic1, String filePic2, String show) throws RemoteException, CreateException;
  public Picture create(String productId) throws RemoteException, CreateException;
  public Picture findByPrimaryKey(String primaryKey) throws RemoteException, FinderException;
  public Collection findByCondition(String condition) throws RemoteException, FinderException;
  public Collection findAll() throws RemoteException, FinderException;
}