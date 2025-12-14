package login;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.servlet.http.*;
import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import customer.*;
import quote.*;

public class LoginBean {
  private String username;
  private String password;
  private String error;
  private CustomerHome customerHome;
  private Customer customer;
  private QuoteHome quoteHome;
  private boolean firstAccess;
  public LoginBean() {
    System.out.println("in Constructor LoginBean");
    try {
      Context ic = new InitialContext();
      java.lang.Object objref = ic.lookup("MyCustomer");
      customerHome = (CustomerHome) PortableRemoteObject.narrow(objref,
                      CustomerHome.class);
      objref = ic.lookup("MyQuote");
      quoteHome = (QuoteHome) PortableRemoteObject.narrow(objref,
                      QuoteHome.class);
      System.out.println("obtained customerHome object");
    } catch (Exception re) {
      System.err.println ("Couldn't locate Customer Home");
      re.printStackTrace();
    }
    reset();
    firstAccess = true;
  }
  public boolean verifyPassword() {
    error = "";
    if (username!=null && !username.trim().equals("")) {
    if (password!=null && !password.trim().equals("")) {
    try {
      customer = customerHome.findByPrimaryKey(username);
    } catch (FinderException e) {
      System.out.println("username isn't exit");
      error = "This username isn't exit,You must register before login";
      return false;
    } catch (RemoteException e) {
      System.out.println("occur remote exception");
      e.printStackTrace();
    }
    try {
      String pass = customer.getPassword();
      if (pass.equals(password)) {
        return true;
      } else error = "passwor is not correct";
    } catch (RemoteException e) {
      e.printStackTrace();
    }
    } else error = "please type password";
    } else error = "please type username";
    return false;
  }
  public Quote getNewQuote() {
    Quote quote = null;
    try {
    quote = quoteHome.create(customer);
    } catch (Exception e) {e.printStackTrace();}
    return quote;
  }


  private void reset() {
    setUsername("");
    setPassword("");
  }
  public void setFirstAccess(boolean firstAccess) {this.firstAccess = firstAccess;}
  public boolean getFirstAccess() {return this.firstAccess;}
  public void setUsername(String username) {this.username = username;}
  public String getUsername() {return this.username;}
  public void setPassword(String password) {this.password = password;}
  public String getPassword() {return this.password;}
  public void setError(String error) {this.error = error;}
  public String getError() {return this.error;}
}