package edit;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import java.rmi.RemoteException;
import javax.servlet.http.*;
import javax.ejb.*;
import customer.*;

public class EditCustomerBean {
  private String username;
  private String password;
  private String confirmPassword;
  private String name;
  private String no;
  private String soi;
  private String street;
  private String district;
  private String province;
  private String country;
  private String areaCode;
  private String tel;
  private String fax;
  private String email;
  private String creditId;
  private String userType = "Customer";
  private boolean firstAccess = true;
    private CustomerHome customerHome;
    private Customer customer;
    private boolean createCustomer;
  /**Constructor*/
  public EditCustomerBean() {
           System.out.println("in Constructor editCustomerBean");
  System.out.println("firstAccess "+firstAccess);
           try {
              Context ic = new InitialContext();
              java.lang.Object objref = ic.lookup("MyCustomer");
              customerHome = (CustomerHome) PortableRemoteObject.narrow(objref,
                                          CustomerHome.class);
              System.out.println("obtained customerHome object");
           } catch (Exception re) {
              System.err.println ("Couldn't locate Customer Home");
              re.printStackTrace();
           }
  }
  public void init(String username) {
    try {
              customer = customerHome.findByPrimaryKey(username);
              setUsername((String)customer.getPrimaryKey());
              setPassword(customer.getPassword());
              setConfirmPassword(password);
              setName(customer.getName());
              setNo(customer.getNo());
              setSoi(customer.getSoi());
              setStreet(customer.getStreet());
              setDistrict(customer.getDistrict());
              setProvince(customer.getProvince());
              setCountry(customer.getCountry());
              setAreaCode(customer.getAreaCode());
              setTel(customer.getTel());
              setFax(customer.getFax());
              setEmail(customer.getEmail());
              setCreditId(customer.getCreditId());
              setUserType(customer.getUserType());
    } catch (Exception ex) {ex.printStackTrace();}
  }
  public void putToDB() {
System.out.println("in putToDB");
      createCustomer = false;
      if (verifyInput()) {
          try
          {
System.out.println("verify true and username = "+username);
              customer = customerHome.findByPrimaryKey(username);
              customer.setPassword(password);
              customer.setName(name.trim());
              customer.setNo(no.trim());
              customer.setSoi(soi.trim());
              customer.setStreet(street.trim());
              customer.setDistrict(district.trim());
              customer.setProvince(province.trim());
              customer.setCountry(country.trim());
              customer.setAreaCode(areaCode.trim());
              customer.setTel(tel.trim());
              customer.setFax(fax.trim());
              customer.setEmail(email.trim());
              customer.setCreditId(creditId.trim());
              customer.setUserType(userType);
              System.out.println("update user ok");
              createCustomer = true;
//              reset();
          }
          catch (Exception ex) {
            ex.printStackTrace();
          }
      } else {              System.out.println("verify fail");
      }
  }
  public boolean verifyInput() {
      if (firstAccess) { return false; }
      if (!findUsername()) {return false;}
      if (password.trim().equals("") ) { return false;      }
      if (confirmPassword==null) confirmPassword="";
      if (!confirmPassword.equals(password)) { return false;      }
      if (no.trim().equals("") ) { return false;      }
      if (street.trim().equals("") ) { return false;      }
      if (province.trim().equals("") ) { return false;      }
      if (country.trim().equals("") ) { return false;      }
      if (areaCode.trim().equals("") ) { return false;      }
      if (creditId.trim().equals("") ) { return false;      }
      return true;
  }
  /**Access verify property*/
  public boolean findUsername() {
      try {
        customer = customerHome.findByPrimaryKey(username);
      } catch (Exception ex) {
        return false;
      }
      return true;
  }
  public boolean findUsername(String s){
    try {
      customer = customerHome.findByPrimaryKey(s);
      return true;
    } catch (Exception ex) {
      ex.printStackTrace();
      return false;
    }
  }
  public boolean passwordNull() {
        if (password.trim().equals("") ) { return true; }
        return false;
  }
  public boolean matchPassword() {
        if (!confirmPassword.equals(password)) { return true; }
        return false;
  }
  public boolean nameNull() {
        if (name.trim().equals("") ) { return true; }
        return false;
  }
  public boolean noNull() {
        if (no.trim().equals("") ) { return true; }
        return false;
  }
  public boolean streetNull() {
        if (street .trim().equals("") ) { return true; }
        return false;
  }
  public boolean provinceNull() {
        if (province.trim().equals("") ) { return true; }
        return false;
  }
  public boolean countryNull() {
        if (country.trim().equals("") ) { return true; }
        return false;
  }
  public boolean areaCodeNull() {
        if (areaCode.trim().equals("") ) { return true; }
        return false;
  }
  public boolean creditIdNull() {
        if (creditId.trim().equals("") ) { return true; }
        return false;
  }
/*** get and set variable method */
  public boolean getCreateCustomer() {
    return createCustomer;
  }
  public String getUsername() {
    return username;
  }
  public void setUsername(String username) {
    this.username = username;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  public String getConfirmPassword() {
    return confirmPassword;
  }
  public void setConfirmPassword(String confirmPassword) {
    this.confirmPassword = confirmPassword;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getNo() {
    return no;
  }
  public void setNo(String no) {
    this.no = no;
  }
  public String getSoi() {
    return soi;
  }
  public void setSoi(String soi) {
    this.soi = soi;
  }
  public String getStreet() {
    return street;
  }
  public void setStreet(String street) {
    this.street = street;
  }
  public String getDistrict() {
    return district;
  }
  public void setDistrict(String district) {
    this.district = district;
  }
  public String getProvince() {
    return province;
  }
  public void setProvince(String province) {
    this.province = province;
  }
  public String getCountry() {
    return country;
  }
  public void setCountry(String country) {
    this.country = country;
  }
  public String getAreaCode() {
    return areaCode;
  }
  public void setAreaCode(String areaCode) {
    this.areaCode = areaCode;
  }
  public String getTel() {
    return tel;
  }
  public void setTel(String tel) {
    this.tel = tel;
  }
  public String getFax() {
    return fax;
  }
  public void setFax(String fax) {
    this.fax = fax;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getCreditId() {
    return creditId;
  }
  public void setCreditId(String creditId) {
    this.creditId = creditId;
  }
  public String getUserType() {
    return userType;
  }
  public void setUserType(String userType) {
    this.userType = userType;
  }
  public boolean getFirstAccess() {
    return firstAccess;
  }
  public void setFirstAccess(boolean firstAccess) {
    this.firstAccess = firstAccess;
  }
  public void reset() {
       System.out.println("Calling reset()");
       final String emptyString = "";
       setPassword(emptyString);
       setConfirmPassword(emptyString);
       setName(emptyString);
       setNo(emptyString);
       setSoi(emptyString) ;
       setStreet(emptyString);
       setDistrict(emptyString);
       setProvince(emptyString) ;
       setCountry(emptyString);
       setAreaCode(emptyString) ;
       setTel(emptyString) ;
       setFax(emptyString) ;
       setEmail(emptyString) ;
       setCreditId(emptyString) ;
  }

}