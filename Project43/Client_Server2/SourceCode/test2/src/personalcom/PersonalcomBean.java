package personalcom;

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

public class PersonalcomBean implements EntityBean {
  EntityContext entityContext;
  public String productId;
  public String type;
  public String model;
  public String bus;
  public String interfac;
  public String chipset;
  public String speed;
  public String capacity;
  public String more;
  public String ejbCreate(String productId, String type, String model, String bus, String interfac, String chipset, String speed, String capacity, String more) throws CreateException {
    this.productId = productId;
    this.type = type;
    this.model = model;
    this.bus = bus;
    this.interfac = interfac;
    this.chipset = chipset;
    this.speed = speed;
    this.capacity = capacity;
    this.more = more;
    return null;
  }
  public String ejbCreate(String productId) throws CreateException {
    return ejbCreate(productId, null, null, null, null, null, null, null, null);
  }
  public void ejbPostCreate(String productId, String type, String model, String bus, String interfac, String chipset, String speed, String capacity, String more) throws CreateException {
  }
  public void ejbPostCreate(String productId) throws CreateException {
    ejbPostCreate(productId, null, null, null, null, null, null, null, null);
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
  public String getProductId() {
    return productId;
  }
  public String getType() {
    return type;
  }
  public void setType(String type) {
    this.type = type;
  }
  public String getModel() {
    return model;
  }
  public void setModel(String model) {
    this.model = model;
  }
  public String getBus() {
    return bus;
  }
  public void setBus(String bus) {
    this.bus = bus;
  }
  public String getInterfac() {
    return interfac;
  }
  public void setInterfac(String interfac) {
    this.interfac = interfac;
  }
  public String getChipset() {
    return chipset;
  }
  public void setChipset(String chipset) {
    this.chipset = chipset;
  }
  public String getSpeed() {
    return speed;
  }
  public void setSpeed(String speed) {
    this.speed = speed;
  }
  public String getCapacity() {
    return capacity;
  }
  public void setCapacity(String capacity) {
    this.capacity = capacity;
  }
  public String getMore() {
    return more;
  }
  public void setMore(String more) {
    this.more = more;
  }
}