package picture;

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

public class PictureBean implements EntityBean {
  EntityContext entityContext;
  public String productId;
  public String filePic1;
  public String filePic2;
  public String show;
  public String ejbCreate(String productId, String filePic1, String filePic2, String show) throws CreateException {
    this.productId = productId;
    this.filePic1 = filePic1;
    this.filePic2 = filePic2;
    this.show = show;
    return null;
  }
  public String ejbCreate(String productId) throws CreateException {
    return ejbCreate(productId, null, null, null);
  }
  public void ejbPostCreate(String productId, String filePic1, String filePic2, String show) throws CreateException {
  }
  public void ejbPostCreate(String productId) throws CreateException {
    ejbPostCreate(productId, null, null, null);
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
  public String getFilePic1() {
    return filePic1;
  }
  public void setFilePic1(String filePic1) {
    this.filePic1 = filePic1;
  }
  public String getFilePic2() {
    return filePic2;
  }
  public void setFilePic2(String filePic2) {
    this.filePic2 = filePic2;
  }
  public String getShow() {
    return show;
  }
  public void setShow(String show) {
    this.show = show;
  }
}