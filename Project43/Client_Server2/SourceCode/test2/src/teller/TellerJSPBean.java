package teller;
import java.rmi.*;
import javax.ejb.*;
import javax.naming.*;
import javax.rmi.*;
import teller.*;


public class TellerJSPBean {
  String creditId;
  String password;
  double balance;
  TellerHome tellerHome;
  Teller teller;
  String error;

  public TellerJSPBean() {
  try {
    Context ctx = new InitialContext();
    Object obj = ctx.lookup("MyTeller");
      tellerHome = (TellerHome) PortableRemoteObject.narrow(obj,
                    TellerHome.class);
    System.out.println("obtain tellerHome");
      teller = tellerHome.create();
  } catch (Exception ex) {
    ex.printStackTrace();
  }
  }

  public boolean createAccount(String creditId,String password) {
  try {
    System.out.println("create creditId and password ="+creditId+" : "+password);
    if (creditId!=null && !creditId.trim().equals("")) {
    if (password!=null && !password.trim().equals("")) {
    teller.createAccount(creditId,password);
    error = "create "+creditId+" ok. Please login";
    return true;
    } else error = "please put password";
    } else error = "please put creditId";
  } catch (TellerException tx) {
    error = tx.getMessage();
    return false;
  } catch (Exception ex) {
    ex.printStackTrace();
  } return false;
  }
  public boolean login(String creditId,String password) {
  if (creditId!=null && !creditId.trim().equals("")) {
  if (password!=null && !password.trim().equals("")) {
  try {
  System.out.println("before teller.getPassword");
    String pass = teller.getPassword(creditId);
  System.out.println("after teller.getPassword");
    if (pass!=null)
    if (pass.equals(password)) {
      return true;
    } else {
      error = "password isn't correct";
      return false;
    } else error = "";
  } catch (TellerException tx) {
    error = tx.getMessage();
    return false;
  } catch (Exception ex) {
    ex.printStackTrace();
  }
  } else error = "please put password";
  } else error = "please put creditId";
  return false;
  }
  public boolean deposit(double funds) {
  try {
    this.balance = teller.deposit(creditId,password,funds);
    return true;
  } catch (TellerException tx) {
    error = tx.getMessage();
    return false;
  } catch (Exception ex) {
    ex.printStackTrace();
  } return false;
  }
  public boolean withdraw(double funds) {
  try {
    this.balance = teller.withdraw(creditId,password,funds);
    return true;
  } catch (TellerException tx) {
    error = tx.getMessage();
    return false;
  } catch (Exception ex) {
    ex.printStackTrace();
  } return false;
  }
  public boolean transfer(double funds,String toCreditId) {
  try {
    teller.transfer(creditId,password,toCreditId,funds);
    this.balance = teller.getBalance(creditId,password);
    return true;
  } catch (TellerException tx) {
    error = tx.getMessage();
    return false;
  } catch (Exception ex) {
    ex.printStackTrace();
  } return false;
  }
  public double getTotalPrice() {
  try {
    this.balance = teller.getBalance(creditId,password);
    return balance;
  } catch (TellerException tx) {
    error = tx.getMessage();
    return 0;
  } catch (Exception ex) {
    ex.printStackTrace();
  } return 0;
  }
  public boolean removeCreditId() {
  try {
  System.out.println("hello "+creditId+":"+password);
    teller.closeAccount(creditId,password);
    return true;
  } catch (TellerException tx) {
    error = tx.getMessage();
    return false;
  } catch (Exception ex) {
    ex.printStackTrace();
  } return false;
  }

  public String getError() {return this.error;}
  public void setCreditId(String creditId) {this.creditId = creditId;}
  public String getCreditId() { return this.creditId; }
  public void setPassword(String password) {this.password = password;}
  public String getPassword() { return this.password; }
  public void setBalance() { this.balance = balance; }
  public double getBalance() { return this.balance; }

}