package buy;

import java.rmi.*;
import javax.ejb.*;
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

public class BuyBean implements EntityBean {
  EntityContext entityContext;
  public String username;
  public String productId;
  public int sellQuantity;
  public double totalPrice;
  public double totalImportPrice;
  public Date sellDate;
  public String sellTime;
  public String verify;
  public String receiptNo;
  public BuyPK ejbCreate(String username, String productId, int sellQuantity, double totalPrice, double totalImportPrice, java.sql.Date sellDate, String sellTime, String verify, String receiptNo) throws CreateException {
    this.username = username;
    this.productId = productId;
    this.sellQuantity = sellQuantity;
    this.totalPrice = totalPrice;
    this.totalImportPrice = totalImportPrice;
    this.sellDate = sellDate;
    this.sellTime = sellTime;
    this.verify = verify;
    this.receiptNo = receiptNo;
    return null;
  }
  public BuyPK ejbCreate(String username, String productId, String receiptNo) throws CreateException {
    return ejbCreate(username, productId, 0, 0, 0, null, null, null, receiptNo);
  }
  public void ejbPostCreate(String username, String productId, int sellQuantity, double totalPrice, double totalImportPrice, java.sql.Date sellDate, String sellTime, String verify, String receiptNo) throws CreateException {
  }
  public void ejbPostCreate(String username, String productId, String receiptNo) throws CreateException {
    ejbPostCreate(username, productId, 0, 0, 0, null, null, null, receiptNo);
  }
  public void ejbRemove() throws RemoveException {
  }
  public void ejbActivate() {
  }
  public void ejbPassivate() {
  }
  public void ejbLoad() {
  }
  public void ejbStore() {
  }
  public void setEntityContext(EntityContext entityContext) {
    this.entityContext = entityContext;
  }
  public void unsetEntityContext() {
    entityContext = null;
  }
  public String getUsername() {
    return username;
  }
  public String getProductId() {
    return productId;
  }
  public int getSellQuantity() {
    return sellQuantity;
  }
  public void setSellQuantity(int sellQuantity) {
    this.sellQuantity = sellQuantity;
  }
  public double getTotalPrice() {
    return totalPrice;
  }
  public void setTotalPrice(double totalPrice) {
    this.totalPrice = totalPrice;
  }
  public double getTotalImportPrice() {
    return totalImportPrice;
  }
  public void setTotalImportPrice(double totalImportPrice) {
    this.totalImportPrice = totalImportPrice;
  }
  public Date getSellDate() {
    return sellDate;
  }
  public void setSellDate(Date sellDate) {
    this.sellDate = sellDate;
  }
  public String getSellTime() {
    return sellTime;
  }
  public void setSellTime(String sellTime) {
    this.sellTime = sellTime;
  }
  public String getVerify() {
    return verify;
  }
  public void setVerify(String verify) {
    this.verify = verify;
  }
  public String getReceiptNo() {
    return receiptNo;
  }
}