package edit;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import java.rmi.RemoteException;
import java.util.*;
import javax.servlet.*;
import javax.ejb.*;
import javax.servlet.http.*;
import java.io.*;
import javax.naming.*;

import product.*;
import personalcom.*;
import notebook.*;
import buy.*;
import blueprint.*;
import base.*;

public class EditProductBean {
   String productId;
   String category = null;

   ProductHome productHome;
   PersonalcomHome personalcomHome;
   NotebookHome notebookHome;
   BuyHome buyHome;
   BlueprintHome blueprintHome;
   Blueprint blueprint;
   boolean firstAccess=true;
   String message;
   Product product;
   Notebook notebook;
   Personalcom personalcom;

  public EditProductBean() {
    try {
      Context ic = new InitialContext();
      java.lang.Object objref = ic.lookup("MyProduct");
      productHome = (ProductHome) PortableRemoteObject.narrow(objref,
                           ProductHome.class);
      objref =  ic.lookup("MyPersonalcom");
      personalcomHome = (PersonalcomHome) PortableRemoteObject.narrow(objref,
                           PersonalcomHome.class);
      objref =  ic.lookup("MyNotebook");
      notebookHome = (NotebookHome) PortableRemoteObject.narrow(objref,
                           NotebookHome.class);
      objref =  ic.lookup("MyBuy");
      buyHome = (BuyHome) PortableRemoteObject.narrow(objref,
                 BuyHome.class);
      objref =  ic.lookup("MyBlueprint");
      blueprintHome = (BlueprintHome) PortableRemoteObject.narrow(objref,
                       BlueprintHome.class);
      System.out.println("obtained entity Home object");
    } catch (Exception re) {
      System.err.println ("Couldn't locate entity Home");
      re.printStackTrace();
    }
  }
  public Blueprint getBlueprint(String productId) {
  try {
    blueprint = blueprintHome.create(productId);
    return blueprint;
  } catch (Exception ex) {
    ex.printStackTrace();
  }
  return null;
  }

  public boolean findProductId(String productId) {
      try {
        product = productHome.findByPrimaryKey(productId);
      } catch (Exception ex) {
        return false;
      }
      return true;
  }

  public boolean getFirstAccess() {    return firstAccess;  }
  public void setFirstAccess(boolean firstAccess) {    this.firstAccess = firstAccess;  }
///////////////////   GET & SET  Method  /////////////////////////
  public String getProductId() {    return productId;  }
  public void setProductId(String productId) {    this.productId = productId;  }
  public String getCategory() {    return category;  }
  public void setCategory(String category) {    this.category = category;  }

}