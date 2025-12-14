package personalcom;

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

public class PersonalcomBeanBMP extends PersonalcomBean {
  DataSource dataSource;
  public String ejbCreate(String productId, String type, String model, String bus, String interfac, String chipset, String speed, String capacity, String more) throws CreateException {
    super.ejbCreate(productId, type, model, bus, interfac, chipset, speed, capacity, more);
    System.out.println("in create");
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
      statement = connection.prepareStatement("INSERT INTO PERSONALCOM (PRODUCT_ID, TYPE, MODEL, BUS, INTERFAC, CHIPSET, SPEED, CAPACITY, MORE) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
      statement.setString(1, productId);
      statement.setString(2, type);
      statement.setString(3, model);
      statement.setString(4, bus);
      statement.setString(5, interfac);
      statement.setString(6, chipset);
      statement.setString(7, speed);
      statement.setString(8, capacity);
      statement.setString(9, more);
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
      throw new EJBException("Error executing SQL INSERT INTO PERSONALCOM (PRODUCT_ID, TYPE, MODEL, BUS, INTERFAC, CHIPSET, SPEED, CAPACITY, MORE) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?): " + e.toString());
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
    return ejbCreate(productId, null, null, null, null, null, null, null, null);
  }
  public void ejbRemove() throws RemoveException {
    super.ejbRemove();
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      connection = dataSource.getConnection();
      statement = connection.prepareStatement("DELETE FROM PERSONALCOM WHERE PRODUCT_ID = ?");
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
      throw new EJBException("Error executing SQL DELETE FROM PERSONALCOM WHERE PRODUCT_ID = ?: " + e.toString());
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
      statement = connection.prepareStatement("SELECT TYPE, MODEL, BUS, INTERFAC, CHIPSET, SPEED, CAPACITY, MORE FROM PERSONALCOM WHERE PRODUCT_ID = ?");
      statement.setString(1, productId);
      ResultSet resultSet = statement.executeQuery();
      if (!resultSet.next()) {
        throw new NoSuchEntityException("Row does not exist");
      }
      type = resultSet.getString(1);
      model = resultSet.getString(2);
      bus = resultSet.getString(3);
      interfac = resultSet.getString(4);
      chipset = resultSet.getString(5);
      speed = resultSet.getString(6);
      capacity = resultSet.getString(7);
      more = resultSet.getString(8);
      statement.close();
      statement = null;
      connection.close();
      connection = null;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL SELECT TYPE, MODEL, BUS, INTERFAC, CHIPSET, SPEED, CAPACITY, MORE FROM PERSONALCOM WHERE PRODUCT_ID = ?: " + e.toString());
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
      statement = connection.prepareStatement("UPDATE PERSONALCOM SET TYPE = ?, MODEL = ?, BUS = ?, INTERFAC = ?, CHIPSET = ?, SPEED = ?, CAPACITY = ?, MORE = ? WHERE PRODUCT_ID = ?");
      statement.setString(1, type);
      statement.setString(2, model);
      statement.setString(3, bus);
      statement.setString(4, interfac);
      statement.setString(5, chipset);
      statement.setString(6, speed);
      statement.setString(7, capacity);
      statement.setString(8, more);
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
      throw new EJBException("Error executing SQL UPDATE PERSONALCOM SET TYPE = ?, MODEL = ?, BUS = ?, INTERFAC = ?, CHIPSET = ?, SPEED = ?, CAPACITY = ?, MORE = ? WHERE PRODUCT_ID = ?: " + e.toString());
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
      statement = connection.prepareStatement("SELECT PRODUCT_ID FROM PERSONALCOM WHERE PRODUCT_ID = ?");
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
      throw new EJBException("Error executing SQL SELECT PRODUCT_ID FROM PERSONALCOM WHERE PRODUCT_ID = ?: " + e.toString());
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
      statement = connection.prepareStatement("SELECT PRODUCT_ID FROM PERSONALCOM");
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
      throw new EJBException("Error executing SQL SELECT PRODUCT_ID FROM PERSONALCOM: " + e.toString());
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
  public Collection ejbFindByConditionInGroup(String sqlWhere,Vector productIdFromProductTB) {
    String inGroup=null;
    if (productIdFromProductTB.size()!=0) {
      inGroup = "'"+(String)productIdFromProductTB.elementAt(0)+"'";
      for (int i=1; i<productIdFromProductTB.size(); i++) {
        inGroup = inGroup+",'"+(String)productIdFromProductTB.elementAt(i)+"'";
      }
    if (sqlWhere!=null && !sqlWhere.equals("")) { sqlWhere=sqlWhere+" and ";}
    sqlWhere = sqlWhere + "product_id in ("+inGroup+")";
    } else {
      if (sqlWhere!=null && !sqlWhere.equals("")) { sqlWhere=sqlWhere+" and ";}
      sqlWhere = sqlWhere + "product_id in ('')";
    }
    if (sqlWhere!=null && !sqlWhere.equals("")) {
      sqlWhere = " where "+sqlWhere;
    } else { sqlWhere = ""; }
    Connection connection = null;
    PreparedStatement statement = null;
    try {
      connection = dataSource.getConnection();
      System.out.println("where sql in personalcom :"+sqlWhere);
      statement = connection.prepareStatement("SELECT PRODUCT_ID FROM PERSONALCOM "+sqlWhere);
      ResultSet resultSet = statement.executeQuery();
      Vector keys = new Vector();
      while (resultSet.next()) {
        String productId = resultSet.getString(1);
        System.out.println("productId in personalcom :"+productId);
        keys.addElement(productId);
      }
      statement.close();
      statement = null;
      connection.close();
      connection = null;
      return keys;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL SELECT PRODUCT_ID FROM NOTEBOOK: " + e.toString());
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
      statement = connection.prepareStatement("DELETE FROM PERSONALCOM WHERE PRODUCT_ID = ?");
      statement.setString(1, productId);
      statement.executeUpdate();
      statement.close();
      statement = null;
      connection.close();
      connection = null;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL DELETE FROM PERSONALCOM WHERE PRODUCT_ID = ?: " + e.toString());
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