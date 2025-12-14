package quote;

import java.rmi.*;
import javax.ejb.*;
import java.util.*;
import customer.*;
//import base.*;
/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public interface Quote extends EJBObject {
    public boolean findProduct(String productId) throws RemoteException;
    public String getUserType() throws RemoteException;
    public int getNumberOfLineItem() throws RemoteException;
    public Vector getLineItems() throws RemoteException;
    public void putLineItem(String productId,int quantity) throws RemoteException;
    public void removeLineItem(String productId) throws RemoteException;
    public Customer getCustomer() throws RemoteException;
//    public double getSubTotal(String productId) throws RemoteException;
    public double getTotalPrice() throws RemoteException ;
    public int getQuantityOfProduct(String productId) throws RemoteException;
    public void clear()throws RemoteException ;
//    public void purchase()throws RemoteException;



}