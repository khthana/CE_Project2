package loadFile;

import java.rmi.*;
import javax.ejb.*;

/**
 * Title:        
 * Description:  
 * Copyright:    Copyright (c) 2001
 * Company:      
 * @author 
 * @version 1.0
 */

public interface LoadFileAdvertiseHome extends EJBHome {
  public LoadFileAdvertise create() throws RemoteException, CreateException;
}