package product;

import java.sql.*;
import javax.ejb.*;
import javax.sql.DataSource;
import java.math.*;
import java.util.*;
import javax.servlet.http.*;
import javax.servlet.*;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public class ProductBeanBMP extends ProductBean {
  DataSource dataSource;
  public String ejbCreate(String productId, String category, String brand, int quantity, java.sql.Date lastReceiveDate, double importPrice, double sellPrice, int lowSellQuantity, String sellNow) throws CreateException {
    super.ejbCreate(productId, category, brand, quantity, lastReceiveDate, importPrice, sellPrice, lowSellQuantity, sellNow);
    try {
      //First see if the object already exists
      ejbFindByPrimaryKey(productId);
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
      statement = connection.prepareStatement("INSERT INTO PRODUCT (PRODUCT_ID, CATEGORY, BRAND, QUANTITY, LAST_RECEIVE_DATE, IMPORT_PRICE, SELL_PRICE, LOW_SELL_QUANTITY, SELL_NOW) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
      statement.setString(1, productId);
      statement.setString(2, category);
      statement.setString(3, brand);
      statement.setInt(4, quantity);
      statement.setDate(5, lastReceiveDate);
      statement.setDouble(6, importPrice);
      statement.setDouble(7, sellPrice);
      statement.setInt(8,lowSellQuantity);
      statement.setString(9, sellNow);
      if (statement.executeUpdate() != 1) {
        throw new CreateException("Error adding row");
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
      return productId;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL INSERT INTO PRODUCT (PRODUCT_ID, CATEGORY, BRAND, QUANTITY, LAST_RECEIVE_DATE, IMPORT_PRICE, SELL_PRICE, LOW_SELL_QUANTITY, SELL_NOW) VALUES (?, ?, ?, ?, ?, ?, ?): " + e.toString());
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
  public String ejbCreate(String productId) throws CreateException {
    return ejbCreate(productId, null, null, 0, null, 0, 0, 0, null);
  }
  public void ejbRemove() throws RemoveException {
    super.ejbRemove();
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("DELETE FROM PRODUCT WHERE PRODUCT_ID = ?");
      statement.setString(1, productId);
      if (statement.executeUpdate() < 1) {
        throw new RemoveException("Error deleting row");
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL DELETE FROM PRODUCT WHERE PRODUCT_ID = ?: " + e.toString());
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
    productId = (String) entityContext.getPrimaryKey();
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("SELECT CATEGORY, BRAND, QUANTITY, LAST_RECEIVE_DATE, IMPORT_PRICE, SELL_PRICE, LOW_SELL_QUANTITY, SELL_NOW FROM PRODUCT WHERE PRODUCT_ID = ?");
      statement.setString(1, productId);
      ResultSet resultSet = statement.executeQuery();
      if (!resultSet.next()) {
        throw new NoSuchEntityException("Row does not exist");
      }
      category = resultSet.getString(1);
      brand = resultSet.getString(2);
      quantity = resultSet.getInt(3);
      lastReceiveDate = resultSet.getDate(4);
      importPrice = resultSet.getDouble(5);
      sellPrice = resultSet.getDouble(6);
      lowSellQuantity = resultSet.getInt(7);
      sellNow = resultSet.getString(8);
      statement.close();
      statement = null;
      connection.close();
      connection = null;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL SELECT CATEGORY, BRAND, QUANTITY, LAST_RECEIVE_DATE, IMPORT_PRICE, SELL_PRICE, LOW_SELL_QUANTITY, SELL_NOW FROM PRODUCT WHERE PRODUCT_ID = ?: " + e.toString());
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
      statement = connection.prepareStatement("UPDATE PRODUCT SET CATEGORY = ?, BRAND = ?, QUANTITY = ?, LAST_RECEIVE_DATE = ?, IMPORT_PRICE = ?, SELL_PRICE = ?, LOW_SELL_QUANTITY = ?, SELL_NOW = ? WHERE PRODUCT_ID = ?");
      statement.setString(1, category);
      statement.setString(2, brand);
      statement.setInt(3, quantity);
      statement.setDate(4, lastReceiveDate);
      statement.setDouble(5, importPrice);
      statement.setDouble(6, sellPrice);
      statement.setInt(7,lowSellQuantity);
      statement.setString(8, sellNow);
      statement.setString(9, productId);
      if (statement.executeUpdate() < 1) {
        throw new NoSuchEntityException("Row does not exist");
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL UPDATE PRODUCT SET CATEGORY = ?, BRAND = ?, QUANTITY = ?, LAST_RECEIVE_DATE = ?, IMPORT_PRICE = ?, SELL_PRICE = ?, LOW_SELL_QUANTITY = ?, SELL_NOW = ? WHERE PRODUCT_ID = ?: " + e.toString());
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
  public String ejbFindByPrimaryKey(String key) throws ObjectNotFoundException {
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("SELECT PRODUCT_ID FROM PRODUCT WHERE PRODUCT_ID = ?");
      statement.setString(1, key);
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
      throw new EJBException("Error executing SQL SELECT PRODUCT_ID FROM PRODUCT WHERE PRODUCT_ID = ?: " + e.toString());
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
      statement = connection.prepareStatement("SELECT PRODUCT_ID FROM PRODUCT");
      ResultSet resultSet = statement.executeQuery();
      Vector keys = new Vector();
      while (resultSet.next()) {
        String productId = resultSet.getString(1);
        keys.addElement(productId);
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
      return keys;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL SELECT PRODUCT_ID FROM PRODUCT: " + e.toString());
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
    String arbitary;
    if (condition==null || condition.equals("")) {
      arbitary = "";
    } else {
      arbitary = " WHERE "+condition;
    }
    try {
      connection = dataSource.getConnection();
      System.out.println("arbitary : "+ arbitary);
      statement = connection.prepareStatement("SELECT PRODUCT_ID FROM PRODUCT"+arbitary);
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
        String productId = resultSet.getString(1);
        System.out.println("productId in product : "+productId);
        keys.addElement(productId);
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
      return keys;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL SELECT PRODUCT_ID FROM PRODUCT: "+arbitary + e.toString());
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
  public Collection ejbFindProductZero() {
    Connection connection = null;
    PreparedStatement statement = null;
    String arbitary;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("select product_id from product where quantity < 0");
      ResultSet resultSet = statement.executeQuery();
      Vector keys = new Vector();
      while (resultSet.next()) {
        String productId = resultSet.getString(1);
        System.out.println("productZero in product : "+productId);
        keys.addElement(productId);
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
      return keys;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL select product_id from product where quantity < 0" + e.toString());
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
  public int getQuantityProductZero() {
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("select count(*) from product where quantity < 0");
      ResultSet resultSet = statement.executeQuery();
      int quantity = 0;
      if (resultSet.next()) {
        quantity = resultSet.getInt(1);
        System.out.println("quantity product ZERO = "+quantity);
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
      return quantity;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL select count(*) from product where quantity < 0 " + e.toString());
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
  public void deleteProduct(String productId) {
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("DELETE FROM PRODUCT WHERE PRODUCT_ID = ?");
      statement.setString(1, productId);
      statement.executeUpdate();
      statement.close();
      statement = null;
      connection.close();
      connection = null;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL DELETE FROM PRODUCT WHERE PRODUCT_ID = ?: " + e.toString());
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