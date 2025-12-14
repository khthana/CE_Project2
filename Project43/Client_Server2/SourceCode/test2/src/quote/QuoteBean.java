package quote;

import java.rmi.*;
import javax.ejb.*;
import java.util.*;
import javax.naming.*;
import java.lang.*;
import java.math.*;
import customer.*;
import blueprint.*;
//import base.*;
import javax.rmi.PortableRemoteObject;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public class QuoteBean implements SessionBean {
  private SessionContext sessionContext;
  private Vector lineItems;
  private Customer customer;
  private String userType;
  private double subTotal;
  private double totalPrice;
//  private BuyHome buyHome;
  private CustomerHome customerHome;
  private QuoteLineItemHome qliHome;

  public void ejbCreate(Customer customer) {
    this.customer = customer;
    try {
    this.userType = customer.getUserType();
    } catch (Exception ex) {
      System.out.println("ERROR : CAN NOT FIND USER TYPE IN CUSTOMER DB IN EJBCREATE OF QUOTEBEAN");
      ex.printStackTrace();
    }
    this.lineItems = new Vector();
  }
  public void ejbRemove() {
    Enumeration enum = lineItems.elements();
    while (enum.hasMoreElements()) {
      try {
        QuoteLineItem qli = (QuoteLineItem) enum.nextElement();
        qli.remove();
      } catch(Exception ex) {
        ex.printStackTrace();
      }
    }
  }
  public void ejbActivate() {
  }
  public void ejbPassivate() {
  }
  public void setSessionContext(SessionContext context) {
    sessionContext = context;
    try {
        Context ctx = new InitialContext();
        Object objref = ctx.lookup("MyQuoteLineItem");
           qliHome = (QuoteLineItemHome)PortableRemoteObject.narrow(objref,
                      QuoteLineItemHome.class);
        System.out.println("obtain qliHome ok");
    }
    catch (Exception ex) {
      ex.printStackTrace();
    }
  }
  //***************************************************
/*
    private String genReceiptNo() {
      String newReceiptNo = "00001";
      try {
        Buy buy = buyHome.findMaxReceiptNo();
        if (buy != null) {
          String receiptNo = buy.getReceiptNo();
          int maxReceiptNo = Integer.valueOf(receiptNo).intValue();
          maxReceiptNo++;
          newReceiptNo = Integer.toString(maxReceiptNo);
          int lengthReceiptNo = 5;
          if (newReceiptNo.length()<lengthReceiptNo) {
            char[] c = new char[lengthReceiptNo];
            for (int i=0; i<lengthReceiptNo; i++) c[i] = '0';
            for (int i=0; i<newReceiptNo.length(); i++) {
              c[(lengthReceiptNo-newReceiptNo.length())+i] = newReceiptNo.charAt(i);
            }
          }
        }
      }catch (FinderException f) {
        f.printStackTrace();
      }catch (RemoteException e) {
        e.printStackTrace();
      } return newReceiptNo;
    }
*/
  public String getUserType() {
    return this.userType;
  }
    private QuoteLineItem findLineItem(String productId) {
      Enumeration e = lineItems.elements();
      while (e.hasMoreElements()) {
        QuoteLineItem qli = (QuoteLineItem) e.nextElement();
        try {
          String id = qli.getProductId();
          if (id.equals(productId)) {
            return qli;
          }
        } catch (RemoteException ex) {
          ex.printStackTrace();
        }
      } return null;
    }
    private void printLineItem() {
    System.out.println("in print lineItems");
      for (int i=0; i<lineItems.size(); i++) {
      try {
        QuoteLineItem qli = (QuoteLineItem) lineItems.elementAt(i);
        System.out.println("productId and quantity is "+qli.getProductId()+" : "+qli.getBuyQuantity());
      } catch (RemoteException ex) { ex.printStackTrace();}
      }
    }
    public boolean findProduct(String productId) {
      Enumeration e = lineItems.elements();
      while (e.hasMoreElements()) {
        QuoteLineItem qli = (QuoteLineItem) e.nextElement();
        try {
          String id = qli.getProductId();
          if (id.equals(productId)) {
            System.out.println("found in lineItems");
            return true;
          }
        } catch (RemoteException ex) {
          ex.printStackTrace();
        }
      }
      System.out.println("line items is empty");
      return false;
    }
    public int getNumberOfLineItem(){
      return lineItems.size();
    }
    public Vector getLineItems() {
      return lineItems;
    }
    public void putLineItem(String productId,int quantity) throws RemoteException{
      System.out.println("in put line item");
      QuoteLineItem qli = findLineItem(productId);
      if (qli==null) {
        try {
        if (quantity !=0 ) {
          qli = qliHome.create(productId);
          qli.setBuyQuantity(quantity);
          lineItems.addElement(qli);
        }
        } catch (CreateException e) {
          e.printStackTrace();
        }
      } else {
        if (quantity ==0 ) { removeLineItem(productId); }
        qli.setBuyQuantity(quantity);
      }
    }
    public void removeLineItem(String productId) throws RemoteException{
      for (int i=0; i<lineItems.size(); i++) {
        QuoteLineItem qli = (QuoteLineItem) lineItems.elementAt(i);
        try {
          String id = qli.getProductId();
          if (id.equals(productId)) {
            lineItems.removeElementAt(i);
            break;
          }
        } catch (RemoteException ex) {
          ex.printStackTrace();
        }
      }
    }

    public Customer getCustomer() {
      return customer;
    }
/*
    public double getSubTotal(Blueprint blueprint) throws RemoteException {
      QuoteLineItem qli = findLineItem(blueprint);
      subTotal = blueprint.getSellPrice()*qli.getBuyQuantity();
      return subTotal;
    }
*/
    public double getTotalPrice() throws RemoteException {
      Enumeration enum = lineItems.elements();
      totalPrice = 0;
      while (enum.hasMoreElements()) {
        QuoteLineItem qli = (QuoteLineItem)enum.nextElement();
        Blueprint blueprint = qli.getBlueprint();
        totalPrice = totalPrice+( qli.getBuyQuantity()*blueprint.getSellPrice());
      }
      return totalPrice;
    }
    public int getQuantityOfProduct(String productId) throws RemoteException {
      QuoteLineItem qli = findLineItem(productId);
      return qli.getBuyQuantity();
    }

    public void clear()throws RemoteException {
      for (int i=0;i<lineItems.size();i++) {
        QuoteLineItem qli = (QuoteLineItem) lineItems.elementAt(i);
        try {
          qli.remove();
        } catch (Exception ex) {
          ex.printStackTrace();
        }
      }
      lineItems.clear();
      lineItems = new Vector();
      totalPrice = 0;
    }

}