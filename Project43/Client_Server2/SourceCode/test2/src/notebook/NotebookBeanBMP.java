package notebook;

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

public class NotebookBeanBMP extends NotebookBean {
  DataSource dataSource;
  public String ejbCreate(String productId, String cpu, String ram, String hdd, String cdRom, String fdd, String display, String faxModem, String more) throws CreateException {
    super.ejbCreate(productId, cpu, ram, hdd, cdRom, fdd, display, faxModem, more);
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
      statement = connection.prepareStatement("INSERT INTO NOTEBOOK (PRODUCT_ID, CPU, RAM, HDD, CD_ROM, FDD, DISPLAY, FAX_MODEM, MORE) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
      statement.setString(1, productId);
      statement.setString(2, cpu);
      statement.setString(3, ram);
      statement.setString(4, hdd);
      statement.setString(5, cdRom);
      statement.setString(6, fdd);
      statement.setString(7, display);
      statement.setString(8, faxModem);
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
      throw new EJBException("Error executing SQL INSERT INTO NOTEBOOK (PRODUCT_ID, CPU, RAM, HDD, CD_ROM, FDD, DISPLAY, FAX_MODEM, MORE) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?): " + e.toString());
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
      statement = connection.prepareStatement("DELETE FROM NOTEBOOK WHERE PRODUCT_ID = ?");
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
      throw new EJBException("Error executing SQL DELETE FROM NOTEBOOK WHERE PRODUCT_ID = ?: " + e.toString());
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
      statement = connection.prepareStatement("SELECT CPU, RAM, HDD, CD_ROM, FDD, DISPLAY, FAX_MODEM, MORE FROM NOTEBOOK WHERE PRODUCT_ID = ?");
      statement.setString(1, productId);
      ResultSet resultSet = statement.executeQuery();
      if (!resultSet.next()) {
        throw new NoSuchEntityException("Row does not exist");
      }
      cpu = resultSet.getString(1);
      ram = resultSet.getString(2);
      hdd = resultSet.getString(3);
      cdRom = resultSet.getString(4);
      fdd = resultSet.getString(5);
      display = resultSet.getString(6);
      faxModem = resultSet.getString(7);
      more = resultSet.getString(8);
      statement.close();
      statement = null;
      connection.close();
      connection = null;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL SELECT CPU, RAM, HDD, CD_ROM, FDD, DISPLAY, FAX_MODEM, MORE FROM NOTEBOOK WHERE PRODUCT_ID = ?: " + e.toString());
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
      statement = connection.prepareStatement("UPDATE NOTEBOOK SET CPU = ?, RAM = ?, HDD = ?, CD_ROM = ?, FDD = ?, DISPLAY = ?, FAX_MODEM = ?, MORE = ? WHERE PRODUCT_ID = ?");
      statement.setString(1, cpu);
      statement.setString(2, ram);
      statement.setString(3, hdd);
      statement.setString(4, cdRom);
      statement.setString(5, fdd);
      statement.setString(6, display);
      statement.setString(7, faxModem);
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
      throw new EJBException("Error executing SQL UPDATE NOTEBOOK SET CPU = ?, RAM = ?, HDD = ?, CD_ROM = ?, FDD = ?, DISPLAY = ?, FAX_MODEM = ?, MORE = ? WHERE PRODUCT_ID = ?: " + e.toString());
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
      statement = connection.prepareStatement("SELECT PRODUCT_ID FROM NOTEBOOK WHERE PRODUCT_ID = ?");
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
      throw new EJBException("Error executing SQL SELECT PRODUCT_ID FROM NOTEBOOK WHERE PRODUCT_ID = ?: " + e.toString());
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
      statement = connection.prepareStatement("SELECT PRODUCT_ID FROM NOTEBOOK");
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
      statement = connection.prepareStatement("DELETE FROM NOTEBOOK WHERE PRODUCT_ID = ?");
      statement.setString(1, productId);
      statement.executeUpdate();
      statement.close();
      statement = null;
      connection.close();
      connection = null;
    }
    catch(SQLException e) {
      throw new EJBException("Error executing SQL DELETE FROM NOTEBOOK WHERE PRODUCT_ID = ?: " + e.toString());
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
      System.out.println("where sql in notebook :"+sqlWhere);
      statement = connection.prepareStatement("SELECT PRODUCT_ID FROM NOTEBOOK "+sqlWhere);
      ResultSet resultSet = statement.executeQuery();
      Vector keys = new Vector();
      while (resultSet.next()) {
        String productId = resultSet.getString(1);
        System.out.println("productId in notebook : "+productId);
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