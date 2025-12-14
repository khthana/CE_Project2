package quote;

import java.rmi.*;
import javax.ejb.*;
import javax.naming.*;
import javax.rmi.*;
import blueprint.*;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public class QuoteLineItemBean implements SessionBean {
  private SessionContext sessionContext;
  private String productId;
  private Blueprint blueprint;
  private BlueprintHome blueprintHome;
  private int quantity;
  public void ejbCreate(String productId) {
    this.productId = productId;
    this.quantity = 0;
    try {
    this.blueprint = blueprintHome.create(productId);
    } catch (Exception ex) {
      System.out.println(ex.getMessage().toString());
    }
  }
  public void ejbRemove() {
  }
  public void ejbActivate() {
  }
  public void ejbPassivate() {
  }
  public void setSessionContext(SessionContext context) {
    sessionContext = context;
    try {
        Context ctx = new InitialContext();
        Object objref = ctx.lookup("MyBlueprint");
           blueprintHome = (BlueprintHome)PortableRemoteObject.narrow(objref,
                            BlueprintHome.class);
        System.out.println("obtain blueprint ok");
    } catch (Exception ex) {ex.printStackTrace();}
  }
  ///////////////////////////////////////////////////////////
  public String getProductId() {
    return productId;
  }
  public void setBuyQuantity(int quantity) {
    this.quantity = quantity;
  }
  public int getBuyQuantity() {
    return quantity;
  }
  public Blueprint getBlueprint() {
    return blueprint;
  }

}