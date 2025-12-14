package buy;

import java.io.*;

/**
 * Title:        
 * Description:  
 * Copyright:    Copyright (c) 2001
 * Company:      
 * @author 
 * @version 1.0
 */

public class BuyPK implements Serializable {

  public String username;
  public String productId;
  public String receiptNo;

  public BuyPK() {
  }

  public BuyPK(String username, String productId, String receiptNo) {
    this.username = username;
    this.productId = productId;
    this.receiptNo = receiptNo;
  }
  public boolean equals(Object obj) {
    if (this.getClass().equals(obj.getClass())) {
      BuyPK that = (BuyPK) obj;
      return this.username.equals(that.username) && this.productId.equals(that.productId) && this.receiptNo.equals(that.receiptNo);
    }
    return false;
  }
  public int hashCode() {
    return (username + productId + receiptNo).hashCode();
  }
}