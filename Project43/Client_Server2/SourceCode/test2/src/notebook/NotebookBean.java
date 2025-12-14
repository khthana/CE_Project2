package notebook;

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

public class NotebookBean implements EntityBean {
  EntityContext entityContext;
  public String productId;
  public String cpu;
  public String ram;
  public String hdd;
  public String cdRom;
  public String fdd;
  public String display;
  public String faxModem;
  public String more;
  public String ejbCreate(String productId, String cpu, String ram, String hdd, String cdRom, String fdd, String display, String faxModem, String more) throws CreateException {
    this.productId = productId;
    this.cpu = cpu;
    this.ram = ram;
    this.hdd = hdd;
    this.cdRom = cdRom;
    this.fdd = fdd;
    this.display = display;
    this.faxModem = faxModem;
    this.more = more;
    return null;
  }
  public String ejbCreate(String productId) throws CreateException {
    return ejbCreate(productId, null, null, null, null, null, null, null, null);
  }
  public void ejbPostCreate(String productId, String cpu, String ram, String hdd, String cdRom, String fdd, String display, String faxModem, String more) throws CreateException {
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
  public String getCpu() {
    return cpu;
  }
  public void setCpu(String cpu) {
    this.cpu = cpu;
  }
  public String getRam() {
    return ram;
  }
  public void setRam(String ram) {
    this.ram = ram;
  }
  public String getHdd() {
    return hdd;
  }
  public void setHdd(String hdd) {
    this.hdd = hdd;
  }
  public String getCdRom() {
    return cdRom;
  }
  public void setCdRom(String cdRom) {
    this.cdRom = cdRom;
  }
  public String getFdd() {
    return fdd;
  }
  public void setFdd(String fdd) {
    this.fdd = fdd;
  }
  public String getDisplay() {
    return display;
  }
  public void setDisplay(String display) {
    this.display = display;
  }
  public String getFaxModem() {
    return faxModem;
  }
  public void setFaxModem(String faxModem) {
    this.faxModem = faxModem;
  }
  public String getMore() {
    return more;
  }
  public void setMore(String more) {
    this.more = more;
  }
}