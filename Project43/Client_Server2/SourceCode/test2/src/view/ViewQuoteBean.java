package view;
import java.rmi.*;
import javax.ejb.*;
import java.util.*;
import javax.naming.*;
import java.lang.*;
import java.math.*;
import customer.*;
import base.*;
import javax.rmi.PortableRemoteObject;
import quote.*;

public class ViewQuoteBean {
  private QuoteLineItemHome qliHome;
  private QuoteHome quoteHome;
  private Quote quote;
  public ViewQuoteBean() {
    try {
        Context ctx = new InitialContext();
        Object objref = ctx.lookup("MyQuote");
           quoteHome = (QuoteHome)PortableRemoteObject.narrow(objref,
                        QuoteHome.class);
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

  public void setQuote(Quote quote) { this.quote = quote; }
  public Quote getQuote() { return quote;}
}