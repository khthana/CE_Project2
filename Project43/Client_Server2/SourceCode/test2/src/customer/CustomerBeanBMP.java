package customer;

import java.sql.*;
import javax.ejb.*;
import javax.sql.DataSource;
import java.util.*;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public class CustomerBeanBMP extends CustomerBean {
  DataSource dataSource;
  public String ejbCreate(String username, String password, String name, String no, String soi, String street, String district, String province, String country, String areaCode, String tel, String fax, String email, String creditId, String userType) throws CreateException {
    super.ejbCreate(username, password, name, no, soi, street, district, province, country, areaCode, tel, fax, email, creditId, userType);
    try {
      //First see if the object already exists
      ejbFindByPrimaryKey(username);
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
      statement = connection.prepareStatement("INSERT INTO CUSTOMER (USERNAME, PASSWORD, NAME, NO, SOI, STREET, DISTRICT, PROVINCE, COUNTRY, AREA_CODE, TEL, FAX, EMAIL, CREDIT_ID, USER_TYPE) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
      statement.setString(1, username);
      statement.setString(2, password);
      statement.setString(3, name);
      statement.setString(4, no);
      statement.setString(5, soi);
      statement.setString(6, street);
      statement.setString(7, district);
      statement.setString(8, province);
      statement.setString(9, country);
      statement.setString(10, areaCode);
      statement.setString(11, tel);
      statement.setString(12, fax);
      statement.setString(13, email);
      statement.setString(14, creditId);
      statement.setString(15, userType);
      if (statement.executeUpdate() != 1) {
        throw new CreateException("Error adding row");
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
      return username;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL INSERT INTO CUSTOMER (USERNAME, PASSWORD, NAME, NO, SOI, STREET, DISTRICT, PROVINCE, COUNTRY, AREA_CODE, TEL, FAX, EMAIL, CREDIT_ID, USER_TYPE) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?): " + e.toString());
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
  public String ejbCreate(String username) throws CreateException {
    return ejbCreate(username, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
  }
  public void ejbRemove() throws RemoveException {
    super.ejbRemove();
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("DELETE FROM CUSTOMER WHERE USERNAME = ?");
      statement.setString(1, username);
      if (statement.executeUpdate() < 1) {
        throw new RemoveException("Error deleting row");
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL DELETE FROM CUSTOMER WHERE USERNAME = ?: " + e.toString());
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
    username = (String) entityContext.getPrimaryKey();
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("SELECT PASSWORD, NAME, NO, SOI, STREET, DISTRICT, PROVINCE, COUNTRY, AREA_CODE, TEL, FAX, EMAIL, CREDIT_ID, USER_TYPE FROM CUSTOMER WHERE USERNAME = ?");
      statement.setString(1, username);
      ResultSet resultSet = statement.executeQuery();
      if (!resultSet.next()) {
        throw new NoSuchEntityException("Row does not exist");
      }
      password = resultSet.getString(1);
      name = resultSet.getString(2);
      no = resultSet.getString(3);
      soi = resultSet.getString(4);
      street = resultSet.getString(5);
      district = resultSet.getString(6);
      province = resultSet.getString(7);
      country = resultSet.getString(8);
      areaCode = resultSet.getString(9);
      tel = resultSet.getString(10);
      fax = resultSet.getString(11);
      email = resultSet.getString(12);
      creditId = resultSet.getString(13);
      userType = resultSet.getString(14);
      statement.close();
      statement = null;
      connection.close();
      connection = null;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL SELECT PASSWORD, NAME, NO, SOI, STREET, DISTRICT, PROVINCE, COUNTRY, AREA_CODE, TEL, FAX, EMAIL, CREDIT_ID, USER_TYPE FROM CUSTOMER WHERE USERNAME = ?: " + e.toString());
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
      statement = connection.prepareStatement("UPDATE CUSTOMER SET PASSWORD = ?, NAME = ?, NO = ?, SOI = ?, STREET = ?, DISTRICT = ?, PROVINCE = ?, COUNTRY = ?, AREA_CODE = ?, TEL = ?, FAX = ?, EMAIL = ?, CREDIT_ID = ?, USER_TYPE = ? WHERE USERNAME = ?");
      statement.setString(1, password);
      statement.setString(2, name);
      statement.setString(3, no);
      statement.setString(4, soi);
      statement.setString(5, street);
      statement.setString(6, district);
      statement.setString(7, province);
      statement.setString(8, country);
      statement.setString(9, areaCode);
      statement.setString(10, tel);
      statement.setString(11, fax);
      statement.setString(12, email);
      statement.setString(13, creditId);
      statement.setString(14, userType);
      statement.setString(15, username);
      if (statement.executeUpdate() < 1) {
        throw new NoSuchEntityException("Row does not exist");
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL UPDATE CUSTOMER SET PASSWORD = ?, NAME = ?, NO = ?, SOI = ?, STREET = ?, DISTRICT = ?, PROVINCE = ?, COUNTRY = ?, AREA_CODE = ?, TEL = ?, FAX = ?, EMAIL = ?, CREDIT_ID = ?, USER_TYPE = ? WHERE USERNAME = ?: " + e.toString());
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
      statement = connection.prepareStatement("SELECT USERNAME FROM CUSTOMER WHERE USERNAME = ?");
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
      throw new EJBException("Error executing SQL SELECT USERNAME FROM CUSTOMER WHERE USERNAME = ?: " + e.toString());
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
  public String ejbFindCreditManager() {
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("SELECT USERNAME FROM CUSTOMER WHERE USER_TYPE = 'Manager'");
      ResultSet resultSet = statement.executeQuery();
      String username=null;
      if (resultSet.next()) {
        username = resultSet.getString(1);
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
      return username;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL SELECT USERNAME FROM CUSTOMER WHERE USERNAME = ?: " + e.toString());
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
      statement = connection.prepareStatement("SELECT USERNAME FROM CUSTOMER");
      ResultSet resultSet = statement.executeQuery();
      Vector keys = new Vector();
      while (resultSet.next()) {
        String username = resultSet.getString(1);
        keys.addElement(username);
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
      return keys;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL SELECT USERNAME FROM CUSTOMER: " + e.toString());
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
  public Collection ejbFindByCondition(String condition) {
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
      statement = connection.prepareStatement("SELECT USERNAME FROM CUSTOMER"+arbitary+" order by username");
      ResultSet resultSet = statement.executeQuery();
      Vector keys = new Vector();
      while (resultSet.next()) {
        String username = resultSet.getString(1);
        System.out.println("username in customer : "+username);
        keys.addElement(username);
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
      return keys;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL SELECT USERNAME FROM CUSTOMER: "+arbitary + e.toString());
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
  public void deleteUsername(String username) {
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("DELETE FROM CUSTOMER WHERE USERNAME = ?");
      statement.setString(1, username);
      statement.executeUpdate();
      statement.close();
      statement = null;
      connection.close();
      connection = null;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL DELETE FROM BANK WHERE CREDIT_ID = ?: " + e.toString());
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