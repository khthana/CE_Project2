package customer;

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

public interface Customer extends EJBObject {
  public void deleteUsername(String username) throws RemoteException;

  public String getUsername() throws RemoteException;
  public String getPassword() throws RemoteException;
  public void setPassword(String password) throws RemoteException;
  public String getName() throws RemoteException;
  public void setName(String name) throws RemoteException;
  public String getNo() throws RemoteException;
  public void setNo(String no) throws RemoteException;
  public String getSoi() throws RemoteException;
  public void setSoi(String soi) throws RemoteException;
  public String getStreet() throws RemoteException;
  public void setStreet(String street) throws RemoteException;
  public String getDistrict() throws RemoteException;
  public void setDistrict(String district) throws RemoteException;
  public String getProvince() throws RemoteException;
  public void setProvince(String province) throws RemoteException;
  public String getCountry() throws RemoteException;
  public void setCountry(String country) throws RemoteException;
  public String getAreaCode() throws RemoteException;
  public void setAreaCode(String areaCode) throws RemoteException;
  public String getTel() throws RemoteException;
  public void setTel(String tel) throws RemoteException;
  public String getFax() throws RemoteException;
  public void setFax(String fax) throws RemoteException;
  public String getEmail() throws RemoteException;
  public void setEmail(String email) throws RemoteException;
  public String getCreditId() throws RemoteException;
  public void setCreditId(String creditId) throws RemoteException;
  public String getUserType() throws RemoteException;
  public void setUserType(String userType) throws RemoteException;
}