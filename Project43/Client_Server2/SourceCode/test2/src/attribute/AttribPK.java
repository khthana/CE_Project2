package attribute;

import java.io.*;

/**
 * Title:        
 * Description:  
 * Copyright:    Copyright (c) 2001
 * Company:      
 * @author 
 * @version 1.0
 */

public class AttribPK implements Serializable {

  public String category;
  public String attribute;

  public AttribPK() {
  }

  public AttribPK(String category, String attribute) {
    this.category = category;
    this.attribute = attribute;
  }
  public boolean equals(Object obj) {
    if (this.getClass().equals(obj.getClass())) {
      AttribPK that = (AttribPK) obj;
      return this.category.equals(that.category) && this.attribute.equals(that.attribute);
    }
    return false;
  }
  public int hashCode() {
    return (category + attribute).hashCode();
  }
}