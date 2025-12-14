package buy;

import java.sql.*;
import javax.ejb.*;
import javax.sql.DataSource;
import java.math.*;
import java.util.*;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public class BuyBeanBMP extends BuyBean {
  DataSource dataSource;
  public BuyPK ejbCreate(String username, String productId, int sellQuantity, double totalPrice, double totalImportPrice, java.sql.Date sellDate, String sellTime, String verify, String receiptNo) throws CreateException {
    super.ejbCreate(username, productId, sellQuantity, totalPrice, totalImportPrice, sellDate, sellTime, verify, receiptNo);
    try {
      //First see if the object already exists
      ejbFindByPrimaryKey(new buy.BuyPK(username, productId, receiptNo));
      //If so, then we have to throw an exception
      throw new DuplicateKeyException("Primary key already exists");
    }
    catch(ObjectNotFoundException e) {
      //Otherwise we can go ahead and create it...
    }
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("INSERT INTO BUY (USERNAME, PRODUCT_ID, SELL_QUANTITY, TOTAL_PRICE, TOTAL_IMPORT_PRICE, SELL_DATE, SELL_TIME, VERIFY, RECEIPT_NO) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
      statement.setString(1, username);
      statement.setString(2, productId);
      statement.setInt(3, sellQuantity);
      statement.setDouble(4, totalPrice);
      statement.setDouble(5,totalImportPrice);
      statement.setDate(6, sellDate);
      statement.setString(7,sellTime);
      statement.setString(8, verify);
      statement.setString(9, receiptNo);
      if (statement.executeUpdate() != 1) {
        throw new CreateException("Error adding row");
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
      return new BuyPK(username, productId, receiptNo);
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL INSERT INTO BUY (USERNAME, PRODUCT_ID, SELL_QUANTITY, TOTAL_PRICE, TOTAL_IMPORT_PRICE, SELL_DATE, SELL_TIME, VERIFY, RECEIPT_NO) VALUES (?, ?, ?, ?, ?, ?, ?, ?): " + e.toString());
    }
    finally {
      try {
        if (statement != null) {
          statement.close();
        }
      }
      catch(SQLException e) {
      }
      try {
        if (connection != null) {
          connection.close();
        }
      }
      catch(SQLException e) {
      }
    }
  }
  public BuyPK ejbCreate(String username, String productId, String receiptNo) throws CreateException {
    return ejbCreate(username, productId, 0, 0, 0, null, null, null, receiptNo);
  }
  public void ejbRemove() throws RemoveException {
    super.ejbRemove();
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("DELETE FROM BUY WHERE USERNAME = ? AND PRODUCT_ID = ? AND RECEIPT_NO = ?");
      statement.setString(1, username);
      statement.setString(2, productId);
      statement.setString(3, receiptNo);
      if (statement.executeUpdate() < 1) {
        throw new RemoveException("Error deleting row");
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL DELETE FROM BUY WHERE USERNAME = ? AND PRODUCT_ID = ? AND RECEIPT_NO = ?: " + e.toString());
    }
    finally {
      try {
        if (statement != null) {
          statement.close();
        }
      }
      catch(SQLException e) {
      }
      try {
        if (connection != null) {
          connection.close();
        }
      }
      catch(SQLException e) {
      }
    }
  }
  public void ejbLoad() {
    BuyPK key = (BuyPK) entityContext.getPrimaryKey();
    username = key.username;
    productId = key.productId;
    receiptNo = key.receiptNo;
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("SELECT SELL_QUANTITY, TOTAL_PRICE, TOTAL_IMPORT_PRICE, SELL_DATE, SELL_TIME, VERIFY FROM BUY WHERE USERNAME = ? AND PRODUCT_ID = ? AND RECEIPT_NO = ?");
      statement.setString(1, username);
      statement.setString(2, productId);
      statement.setString(3, receiptNo);
      ResultSet resultSet = statement.executeQuery();
      if (!resultSet.next()) {
        throw new NoSuchEntityException("Row does not exist");
      }
      sellQuantity = resultSet.getInt(1);
      totalPrice = resultSet.getDouble(2);
      totalImportPrice = resultSet.getDouble(3);
      sellDate = resultSet.getDate(4);
      sellTime = resultSet.getString(5);
      verify = resultSet.getString(6);
      statement.close();
      statement = null;
      connection.close();
      connection = null;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL SELECT SELL_QUANTITY, TOTAL_PRICE, TOTAL_IMPORT_PRICE, SELL_DATE, VERIFY FROM BUY WHERE USERNAME = ? AND PRODUCT_ID = ? AND RECEIPT_NO = ?: " + e.toString());
    }
    finally {
      try {
        if (statement != null) {
          statement.close();
        }
      }
      catch(SQLException e) {
      }
      try {
        if (connection != null) {
          connection.close();
        }
      }
      catch(SQLException e) {
      }
    }
    super.ejbLoad();
  }
  public void ejbStore() {
    super.ejbStore();
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("UPDATE BUY SET SELL_QUANTITY = ?, TOTAL_PRICE = ?, TOTAL_IMPORT_PRICE = ?, SELL_DATE = ?, SELL_TIME = ?, VERIFY = ? WHERE USERNAME = ? AND PRODUCT_ID = ? AND RECEIPT_NO = ?");
      statement.setInt(1, sellQuantity);
      statement.setDouble(2, totalPrice);
      statement.setDouble(3,totalImportPrice);
      statement.setDate(4, sellDate);
      statement.setString(5,sellTime);
      statement.setString(6, verify);
      statement.setString(7, username);
      statement.setString(8, productId);
      statement.setString(9, receiptNo);
      if (statement.executeUpdate() < 1) {
        throw new NoSuchEntityException("Row does not exist");
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL UPDATE BUY SET SELL_QUANTITY = ?, TOTAL_PRICE = ?, TOTAL_IMPORT_PRICE = ?, SELL_DATE = ?, SELL_TIME = ?, VERIFY = ? WHERE USERNAME = ? AND PRODUCT_ID = ? AND RECEIPT_NO = ?: " + e.toString());
    }
    finally {
      try {
        if (statement != null) {
          statement.close();
        }
      }
      catch(SQLException e) {
      }
      try {
        if (connection != null) {
          connection.close();
        }
      }
      catch(SQLException e) {
      }
    }
  }
  public BuyPK ejbFindByPrimaryKey(BuyPK key) throws ObjectNotFoundException {
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("SELECT USERNAME FROM BUY WHERE USERNAME = ? AND PRODUCT_ID = ? AND RECEIPT_NO = ?");
      statement.setString(1, key.username);
      statement.setString(2, key.productId);
      statement.setString(3, key.receiptNo);
      ResultSet resultSet = statement.executeQuery();
      if (!resultSet.next()) {
        throw new ObjectNotFoundException("Primary key does not exist");
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
      return key;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL SELECT USERNAME FROM BUY WHERE USERNAME = ? AND PRODUCT_ID = ? AND RECEIPT_NO = ?: " + e.toString());
    }
    finally {
      try {
        if (statement != null) {
          statement.close();
        }
      }
      catch(SQLException e) {
      }
      try {
        if (connection != null) {
          connection.close();
        }
      }
      catch(SQLException e) {
      }
    }
  }
  public Collection ejbFindAll() {
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("SELECT USERNAME, PRODUCT_ID, RECEIPT_NO FROM BUY");
      ResultSet resultSet = statement.executeQuery();
      Vector keys = new Vector();
      while (resultSet.next()) {
        String username = resultSet.getString(1);
        String productId = resultSet.getString(2);
        String receiptNo = resultSet.getString(3);
        keys.addElement(new BuyPK(username, productId, receiptNo));
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
      return keys;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL SELECT USERNAME, PRODUCT_ID, RECEIPT_NO FROM BUY: " + e.toString());
    }
    finally {
      try {
        if (statement != null) {
          statement.close();
        }
      }
      catch(SQLException e) {
      }
      try {
        if (connection != null) {
          connection.close();
        }
      }
      catch(SQLException e) {
      }
    }
  }
  public Collection ejbFindByCondition(String condition,Long longTime1,Long longTime2) {
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("SELECT USERNAME, PRODUCT_ID, RECEIPT_NO FROM BUY"+condition+" order by username,receipt_no,product_id");
      System.out.println("longTime1 = "+longTime1);
      System.out.println("longTime2 = "+longTime2);
      if (longTime1 != null) {
        statement.setDate(1,new java.sql.Date(longTime1.longValue()));
      if (longTime2 != null) {
        statement.setDate(2,new java.sql.Date(longTime2.longValue()));
      }
      }
      ResultSet resultSet = statement.executeQuery();
      Vector keys = new Vector();
      while (resultSet.next()) {
        String username = resultSet.getString(1);
        String productId = resultSet.getString(2);
        String receiptNo = resultSet.getString(3);
        keys.addElement(new BuyPK(username, productId, receiptNo));
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
      return keys;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL SELECT USERNAME, PRODUCT_ID, RECEIPT_NO FROM BUY: " + e.toString());
    }
    finally {
      try {
        if (statement != null) {
          statement.close();
        }
      }
      catch(SQLException e) {
      }
      try {
        if (connection != null) {
          connection.close();
        }
      }
      catch(SQLException e) {
      }
    }
  }
  public Collection ejbFindNewSell() {
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("select username, min(product_id), receipt_no from buy "+
                                              " where verify = 'false' group by receipt_no,username ");

      ResultSet resultSet = statement.executeQuery();
      Vector keys = new Vector();
      while (resultSet.next()) {
        String username = resultSet.getString(1);
        String productId = resultSet.getString(2);
        String receiptNo = resultSet.getString(3);
        keys.addElement(new BuyPK(username, productId, receiptNo));
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
      return keys;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL select username, min(product_id), receipt_no from buy "+
                             " where verify = 'false' group by receipt_no,username " + e.toString());
    }
    finally {
      try {
        if (statement != null) {
          statement.close();
        }
      }
      catch(SQLException e) {
      }
      try {
        if (connection != null) {
          connection.close();
        }
      }
      catch(SQLException e) {
      }
    }
  }
  public BuyPK ejbFindMaxReceiptNo() {
    Connection connection = null;
    PreparedStatement statement = null;
    BuyPK key = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("SELECT USERNAME, PRODUCT_ID, RECEIPT_NO FROM BUY WHERE RECEIPT_NO IN (SELECT MAX(RECEIPT_NO) FROM BUY)");
      ResultSet resultSet = statement.executeQuery();
      if (resultSet.next()) {
        String username = resultSet.getString(1);
        String productId = resultSet.getString(2);
        String receiptNo = resultSet.getString(3);
        key = new BuyPK(username,productId,receiptNo);
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
      return key;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL SELECT DISTINCT RECEIPT_NO FROM BUY: " + e.toString());
    }
    finally {
      try {
        if (statement != null) {
          statement.close();
        }
      }
      catch(SQLException e) {
      }
      try {
        if (connection != null) {
          connection.close();
        }
      }
      catch(SQLException e) {
      }
    }
  }
  public BuyPK ejbFindByUsername(String username) throws ObjectNotFoundException {
    Connection connection = null;
    PreparedStatement statement = null;
    BuyPK key = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("SELECT USERNAME, PRODUCT_ID, RECEIPT_NO FROM BUY WHERE USERNAME = ? ");
      statement.setString(1, username);
      ResultSet resultSet = statement.executeQuery();
      if (resultSet.next()) {
        String user = resultSet.getString(1);
        String productId = resultSet.getString(2);
        String receiptNo = resultSet.getString(3);
        key = new BuyPK(user,productId,receiptNo);
      } else {
        throw new ObjectNotFoundException("Username is does not exist");
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
      return key;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL SELECT USERNAME FROM BUY WHERE USERNAME = ? AND PRODUCT_ID = ? AND RECEIPT_NO = ?: " + e.toString());
    }
    finally {
      try {
        if (statement != null) {
          statement.close();
        }
      }
      catch(SQLException e) {
      }
      try {
        if (connection != null) {
          connection.close();
        }
      }
      catch(SQLException e) {
      }
    }
  }
  public BuyPK ejbFindByProductId(String productId) throws ObjectNotFoundException {
    Connection connection = null;
    PreparedStatement statement = null;
    BuyPK key = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("SELECT USERNAME, PRODUCT_ID, RECEIPT_NO FROM BUY WHERE PRODUCT_ID = ? ");
      statement.setString(1, productId);
      ResultSet resultSet = statement.executeQuery();
      if (resultSet.next()) {
        String user = resultSet.getString(1);
        String pId = resultSet.getString(2);
        String receiptNo = resultSet.getString(3);
        key = new BuyPK(user,pId,receiptNo);
      } else {
        throw new ObjectNotFoundException("Product_id is does not exist");
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
      return key;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL SELECT USERNAME FROM BUY WHERE USERNAME = ? AND PRODUCT_ID = ? AND RECEIPT_NO = ?: " + e.toString());
    }
    finally {
      try {
        if (statement != null) {
          statement.close();
        }
      }
      catch(SQLException e) {
      }
      try {
        if (connection != null) {
          connection.close();
        }
      }
      catch(SQLException e) {
      }
    }
  }
  public BuyPK ejbFindByCategory(String category) throws ObjectNotFoundException {
    Connection connection = null;
    PreparedStatement statement = null;
    BuyPK key = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("select t1.USERNAME, t1.PRODUCT_ID, t1.RECEIPT_NO "+
                                              " from buy t1, product t2 "+
                                              " where t1.product_id = t2.product_id and t2.category =  ? ");
      statement.setString(1, category);
      ResultSet resultSet = statement.executeQuery();
      if (resultSet.next()) {
        String user = resultSet.getString(1);
        String pId = resultSet.getString(2);
        String receiptNo = resultSet.getString(3);
        key = new BuyPK(user,pId,receiptNo);
      } else {
        throw new ObjectNotFoundException("Product_id is does not exist");
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
      return key;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL SELECT USERNAME FROM BUY WHERE USERNAME = ? AND PRODUCT_ID = ? AND RECEIPT_NO = ?: " + e.toString());
    }
    finally {
      try {
        if (statement != null) {
          statement.close();
        }
      }
      catch(SQLException e) {
      }
      try {
        if (connection != null) {
          connection.close();
        }
      }
      catch(SQLException e) {
      }
    }
  }
  public int getNumberOfUnverify() {
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      int number = 0;
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("select count(distinct(receipt_no)) from buy where verify = 'false'");

      ResultSet resultSet = statement.executeQuery();
      if (resultSet.next()) {
        number = resultSet.getInt(1);
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
      return number;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL select count(distinct(receipt_no)) from buy where verify = 'false'" + e.toString());
    }
    finally {
      try {
        if (statement != null) {
          statement.close();
        }
      }
      catch(SQLException e) {
      }
      try {
        if (connection != null) {
          connection.close();
        }
      }
      catch(SQLException e) {
      }
    }
  }
  public void changeVerify(String username,String receiptNo,String verify) {
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("UPDATE BUY SET VERIFY = ? WHERE USERNAME = ? AND RECEIPT_NO = ?");
      statement.setString(1,verify);
      statement.setString(2,username);
      statement.setString(3,receiptNo);

      if (statement.executeUpdate() < 1) {
        throw new NoSuchEntityException("Row does not exist");
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL select count(distinct(receipt_no)) from buy where verify = 'false'" + e.toString());
    }
    finally {
      try {
        if (statement != null) {
          statement.close();
        }
      }
      catch(SQLException e) {
      }
      try {
        if (connection != null) {
          connection.close();
        }
      }
      catch(SQLException e) {
      }
    }
  }
  public double getSumTotalImportPrice(String receiptNo,String username)  {
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      double totalImport = 0;
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("select sum(total_import_price) from buy where receipt_no = ? and username = ?");
      statement.setString(1,receiptNo);
      statement.setString(2,username);

      ResultSet resultSet = statement.executeQuery();
      if (resultSet.next()) {
        totalImport = resultSet.getDouble(1);
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
      return totalImport;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL sselect sum(total_import_price) from buy where receipt_no = ? and username = ?" + e.toString());
    }
    finally {
      try {
        if (statement != null) {
          statement.close();
        }
      }
      catch(SQLException e) {
      }
      try {
        if (connection != null) {
          connection.close();
        }
      }
      catch(SQLException e) {
      }
    }
  }
  public double getSumTotalSellPrice(String receiptNo,String username) {
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      double totalSell = 0;
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("select sum(total_price) from buy where receipt_no = ? and username = ?");
      statement.setString(1,receiptNo);
      statement.setString(2,username);

      ResultSet resultSet = statement.executeQuery();
      if (resultSet.next()) {
        totalSell = resultSet.getDouble(1);
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
      return totalSell;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL select sum(total_price) from buy where receipt_no = ? and username = ?" + e.toString());
    }
    finally {
      try {
        if (statement != null) {
          statement.close();
        }
      }
      catch(SQLException e) {
      }
      try {
        if (connection != null) {
          connection.close();
        }
      }
      catch(SQLException e) {
      }
    }
  }

  public void setEntityContext(EntityContext entityContext) {
    super.setEntityContext(entityContext);
    try {
      javax.naming.Context context = new javax.naming.InitialContext();
      dataSource = (DataSource) context.lookup("java:comp/env/jdbc/DataSource");
    }
    catch(Exception e) {
      throw new EJBException("Error looking up dataSource:" + e.toString());
    }
  }
}