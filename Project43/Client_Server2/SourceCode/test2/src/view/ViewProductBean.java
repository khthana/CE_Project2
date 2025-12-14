package view;
import java.rmi.*;
import javax.ejb.*;
import java.util.*;
import javax.naming.*;
import java.lang.*;
import java.math.*;
import customer.*;
import blueprint.*;
import javax.rmi.PortableRemoteObject;
import quote.*;

public class ViewProductBean {
  private BlueprintHome blueprintHome;
  Quote quote;
  public ViewProductBean() {
  System.out.println("in ViewProductBean constructor");
    try {
        Context ctx = new InitialContext();
        Object objref = ctx.lookup("MyBlueprint");
           blueprintHome = (BlueprintHome)PortableRemoteObject.narrow(objref,
                            BlueprintHome.class);
        System.out.println("obtain blueprint ok");
    } catch (Exception ex) {ex.printStackTrace();}

  }
  public String getCustomerName() {
    try {
    Customer customer = quote.getCustomer();
    return customer.getUsername();
    } catch (RemoteException ex) {
      ex.printStackTrace();
    }return "";
  }
  public boolean checkLineItems(String productId) {
    boolean check = false;
    try {
      check = quote.findProduct(productId);
    } catch (RemoteException ex) {
      System.out.println("remote error");
      ex.printStackTrace();
    }
    return check;
  }

  public void setQuote(Quote quote) { this.quote = quote; }
  public Quote getQuote() { return quote;}
}