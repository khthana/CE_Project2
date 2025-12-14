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

public class CustomerBean implements EntityBean {
  EntityContext entityContext;
  public String username;
  public String password;
  public String name;
  public String no;
  public String soi;
  public String street;
  public String district;
  public String province;
  public String country;
  public String areaCode;
  public String tel;
  public String fax;
  public String email;
  public String creditId;
  public String userType;
  public String ejbCreate(String username, String password, String name, String no, String soi, String street, String district, String province, String country, String areaCode, String tel, String fax, String email, String creditId, String userType) throws CreateException {
    this.username = username;
    this.password = password;
    this.name = name;
    this.no = no;
    this.soi = soi;
    this.street = street;
    this.district = district;
    this.province = province;
    this.country = country;
    this.areaCode = areaCode;
    this.tel = tel;
    this.fax = fax;
    this.email = email;
    this.creditId = creditId;
    this.userType = userType;
    return null;
  }
  public String ejbCreate(String username) throws CreateException {
    return ejbCreate(username, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
  }
  public void ejbPostCreate(String username, String password, String name, String no, String soi, String street, String district, String province, String country, String areaCode, String tel, String fax, String email, String creditId, String userType) throws CreateException {
  }
  public void ejbPostCreate(String username) throws CreateException {
    ejbPostCreate(username, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
  }
  public void ejbRemove() throws RemoveException {
  }
  public void ejbActivate() {
  }
  public void ejbPassivate() {
  }
  public void ejbLoad() {
  }
  public void ejbStore() {
  }
  public void setEntityContext(EntityContext entityContext) {
    this.entityContext = entityContext;
  }
  public void unsetEntityContext() {
    entityContext = null;
  }
  public String getUsername() {
    return username;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
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
}