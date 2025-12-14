package attribute;

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

public class AttribBean implements EntityBean {
  EntityContext entityContext;
  public String category;
  public String attribute;
  public String use;
  public String no;
  public AttribPK ejbCreate(String category, String attribute, String use, String no) throws CreateException {
    this.category = category;
    this.attribute = attribute;
    this.use = use;
    this.no = no;
    return null;
  }
  public AttribPK ejbCreate(String category, String attribute) throws CreateException {
    return ejbCreate(category, attribute, null, null);
  }
  public void ejbPostCreate(String category, String attribute, String use, String no) throws CreateException {
  }
  public void ejbPostCreate(String category, String attribute) throws CreateException {
    ejbPostCreate(category, attribute, null, null);
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
  public String getCategory() {
    return category;
  }
  public String getAttribute() {
    return attribute;
  }
  public String getUse() {
    return use;
  }
  public void setUse(String use) {
    this.use = use;
  }
  public String getNo() {
    return no;
  }
  public void setNo(String no) {
    this.no = no;
  }
}