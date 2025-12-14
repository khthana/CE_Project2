package blueprint;

import java.util.*;
import java.lang.*;
import java.rmi.*;
import javax.rmi.PortableRemoteObject;
import javax.naming.*;
import javax.ejb.*;
import java.math.*;

import product.*;
import personalcom.*;
import notebook.*;
import attribute.*;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public class BlueprintBean implements SessionBean {
   String productId;
   String category = null;
   String brand;
   int    quantity;
   Date lastReceiveDate;
   double importPrice;
   double sellPrice;
   int lowSellQuantity;
   String sellNow;
   String type;
   String model;
   String bus;
   String interfac;
   String chipset;
   String speed;
   String capacity;
   String more;
   String cpu;
   String ram;
   String hdd;
   String cdRom;
   String fdd;
   String display;
   String faxModem;
  private ProductHome productHome;
  private PersonalcomHome personalcomHome;
  private NotebookHome notebookHome;
  private AttribHome attribHome;
  private SessionContext sessionContext;

  public void ejbCreate(String productId) {
    try {
    System.out.println("in ejbCreate Blueprint productId="+productId);
      setProductId(productId);
      String pk = productId;
      Product product = (Product)productHome.findByPrimaryKey(pk);
      String categoryTemp = product.getCategory();
      setCategory(categoryTemp);
      setBrand(product.getBrand());
      setQuantity(product.getQuantity());
      setImportPrice(product.getImportPrice());
      setSellPrice(product.getSellPrice());
      setLastReceiveDate(new Date((product.getLastReceiveDate()).getTime()));
      setLowSellQuantity(product.getLowSellQuantity());
      setSellNow(product.getSellNow());
      System.out.println("make productBlueprint ok");
      Attrib attrib = attribHome.findByForm(categoryTemp);
      String form = attrib.getNo();
      System.out.println("pk : "+pk+" and form : "+form);
      if (form.equals("1")) {
        Personalcom personalcom = personalcomHome.findByPrimaryKey(pk);
        setType(personalcom.getType());
        setModel(personalcom.getModel());
        setBus(personalcom.getBus());
        setInterfac(personalcom.getInterfac());
        setChipset(personalcom.getChipset());
        setSpeed(personalcom.getSpeed());
        setCapacity(personalcom.getCapacity());
        setMore(personalcom.getMore());
      System.out.println("make personalcom blueprint ok");
      }
      if (form.equals("2")) {
        Notebook notebook = notebookHome.findByPrimaryKey(pk);
        setCpu(notebook.getCpu());
        setRam(notebook.getRam());
        setHdd(notebook.getHdd());
        setCdRom(notebook.getCdRom());
        setFdd(notebook.getFdd());
        setDisplay(notebook.getDisplay());
        setFaxModem(notebook.getFaxModem());
        setMore(notebook.getMore());
      System.out.println("make notebook blueprint ok");
      }
    } catch (Exception ex) {
      ex.printStackTrace();
    }
  }
  public void ejbRemove() {
  }
  public void ejbActivate() {
  }
  public void ejbPassivate() {
  }
  public void setSessionContext(SessionContext context) {
    sessionContext = context;
    try {
      Context ic = new InitialContext();
      java.lang.Object objref = ic.lookup("MyProduct");
      productHome = (ProductHome) PortableRemoteObject.narrow(objref,
                     ProductHome.class);
      objref = ic.lookup("MyNotebook");
      notebookHome = (NotebookHome) PortableRemoteObject.narrow(objref,
                      NotebookHome.class);
      objref = ic.lookup("MyPersonalcom");
      personalcomHome = (PersonalcomHome) PortableRemoteObject.narrow(objref,
                         PersonalcomHome.class);
      objref = ic.lookup("MyAttribute");
      attribHome = (AttribHome) PortableRemoteObject.narrow(objref,
                    AttribHome.class);
      System.out.println("get home ok");
    } catch (Exception ex) {ex.printStackTrace();}
  }


  public String[][] sortAttribute(Vector cat) {
    String attribute[][] = new String[24][3];
    for (int j=0; j<3; j++)
    for (int i=0; i<24; i++) {
      attribute[i][j] = new String();
    }
    for (int i=0; i<24; i++) {
      attribute[i][2] = "false";
    }
        attribute[0][0]="Product ID";
        attribute[0][1]=productId;
        attribute[0][2]="true";
        attribute[1][0]="Category";
        attribute[1][1]=category;
        attribute[1][2]="true";
        attribute[2][0]="Brand";
        attribute[2][1]=brand;
        attribute[2][2]="true";
    Enumeration e = cat.elements();
    while (e.hasMoreElements()) {
      String s = (String)e.nextElement();
      if (s.equals("Model") ) {
        attribute[3][0]="Model";
        attribute[3][1]=model;
        attribute[3][2]="true";
      } else
      if (s.equals("Type") ) {
        attribute[4][0]="Type";
        attribute[4][1]=type;
        attribute[4][2]="true";
      } else
      if (s.equals("BUS") ) {
        attribute[5][0]="BUS";
        attribute[5][1]=bus;
        attribute[5][2]="true";
      } else
      if (s.equals("Interface") ) {
        attribute[6][0]="Interface";
        attribute[6][1]=interfac;
        attribute[6][2]="true";
      } else
      if (s.equals("Chipset") ) {
        attribute[7][0]="Chipset";
        attribute[7][1]=chipset;
        attribute[7][2]="true";
      } else
      if (s.equals("Speed") ) {
        attribute[8][0]="Speed";
        attribute[8][1]=speed;
        attribute[8][2]="true";
      } else
      if (s.equals("Capacity") ) {
        attribute[9][0]="Capacity";
        attribute[9][1]=capacity;
        attribute[9][2]="true";
      } else
      if (s.equals("CPU") ) {
        attribute[10][0]="CPU";
        attribute[10][1]=cpu;
        attribute[10][2]="true";
      } else
      if (s.equals("RAM") ) {
        attribute[11][0]="RAM";
        attribute[11][1]=ram;
        attribute[11][2]="true";
      } else
      if (s.equals("HDD") ) {
        attribute[12][0]="HDD";
        attribute[12][1]=hdd;
        attribute[12][2]="true";
      } else
      if (s.equals("CD ROM") ) {
        attribute[13][0]="CD ROM";
        attribute[13][1]=cdRom;
        attribute[13][2]="true";
      } else
      if (s.equals("FDD") ) {
        attribute[14][0]="FDD";
        attribute[14][1]=fdd;
        attribute[14][2]="true";
      } else
      if (s.equals("Display") ) {
        attribute[15][0]="Display";
        attribute[15][1]=display;
        attribute[15][2]="true";
      } else
      if (s.equals("Fax Modem") ) {
        attribute[16][0]="FAX Modem";
        attribute[16][1]=faxModem;
        attribute[16][2]="true";
      } else
      if (s.equals("More") ) {
        attribute[17][0]="More";
        attribute[17][1]=more;
        attribute[17][2]="true";
      }
        attribute[18][0]="Quantity";
        attribute[18][1]=(new Integer(quantity)).toString();
        attribute[18][2]="true";
        attribute[19][0]="Import Price";
        attribute[19][1]=(new Double(importPrice)).toString();
        attribute[19][2]="true";
        attribute[20][0]="Sell Price";
        attribute[20][1]=(new Double(sellPrice)).toString();
        attribute[20][2]="true";
        attribute[21][0]="Last Receive Date";
        String dd = (new Integer(lastReceiveDate.getDate()).toString());
        String mm = (new Integer(lastReceiveDate.getMonth()+1).toString());
        String yy = (new Integer(lastReceiveDate.getYear()+1900).toString());
        attribute[21][1]=dd+"/"+mm+"/"+yy;
        attribute[21][2]="true";
        attribute[22][0]="Low Sell Quantity";
        attribute[22][1]=(new Integer(lowSellQuantity).toString());
        attribute[22][2]="true";
        attribute[23][0]="Sell Now";
        attribute[23][1]=sellNow;
        attribute[23][2]="true";
    }
    return attribute;
  }
  public void updateBlueprint(String[][] s) {
    productId = s[0][1];
    category = s[1][1];
    brand = s[2][1];
    model = s[3][1];
    type = s[4][1];
    bus = s[5][1];
    interfac = s[6][1];
    chipset = s[7][1];
    speed = s[8][1];
    capacity = s[9][1];
    cpu = s[10][1];
    ram = s[11][1];
    hdd = s[12][1];
    cdRom = s[13][1];
    fdd = s[14][1];
    display = s[15][1];
    faxModem =s[16][1];
    more  = s[17][1];
    try {
    quantity = Integer.valueOf(s[18][1]).intValue();
    importPrice = Double.valueOf(s[19][1]).doubleValue();
    sellPrice = Double.valueOf(s[20][1]).doubleValue();
    lowSellQuantity = Integer.valueOf(s[22][1]).intValue();
    } catch (Exception e) {
      System.out.println("ERROR : CANN'T CHANGE STRING TO NUMBER");
      e.printStackTrace();
    }
    lastReceiveDate = stringToDate(s[21][1]);
    sellNow = s[23][1];
  }
  public Date stringToDate(String s) {
    int a = s.indexOf('/',0);
    int b = s.indexOf('/',a+1);
    int d = Integer.valueOf(s.substring(0,a)).intValue();
    int m = Integer.valueOf(s.substring(a+1,b)).intValue();
    int y = Integer.valueOf(s.substring(b+1)).intValue();
    return new Date(y,m,d);
  }

  public void updateProduct() {
    try {
    System.out.println("in updateProduct Blueprint productId="+productId);
      Product product = (Product)productHome.findByPrimaryKey(productId);
      String categoryTemp = product.getCategory();
      product.setBrand(getBrand());
      product.setQuantity(getQuantity());
      product.setImportPrice(getImportPrice());
      product.setSellPrice(getSellPrice());
      product.setLastReceiveDate(new java.sql.Date(getLastReceiveDate().getTime()));
      product.setLowSellQuantity(getLowSellQuanity());
      product.setSellNow(getSellNow());
      System.out.println("update product blueprint ok");
      Attrib attrib = attribHome.findByForm(categoryTemp);
      String form = attrib.getNo();
      System.out.println("productId : "+productId+" and form : "+form);
      if (form.equals("1")) {
        Personalcom personalcom = personalcomHome.findByPrimaryKey(productId);
        personalcom.setType(getType());
        personalcom.setModel(getModel());
        personalcom.setBus(getBus());
        personalcom.setInterfac(getInterfac());
        personalcom.setChipset(getChipset());
        personalcom.setSpeed(getSpeed());
        personalcom.setCapacity(getCapacity());
        personalcom.setMore(getMore());
      System.out.println("update personalcom blueprint ok");
      }
      if (form.equals("2")) {
        Notebook notebook = notebookHome.findByPrimaryKey(productId);
        notebook.setCpu(getCpu());
        notebook.setRam(getRam());
        notebook.setHdd(getHdd());
        notebook.setCdRom(getCdRom());
        notebook.setFdd(getFdd());
        notebook.setDisplay(getDisplay());
        notebook.setFaxModem(getFaxModem());
        notebook.setMore(getMore());
      System.out.println("update notebook blueprint ok");
      }
    } catch (Exception ex) {
      ex.printStackTrace();
    }
  }
  public void deleteProduct() {
    System.out.println("in deleteProduct Blueprint productId="+productId);
    try {
      Product product = (Product)productHome.findByPrimaryKey(productId);
      String categoryTemp = product.getCategory();
      Attrib attrib = attribHome.findByForm(categoryTemp);
      String form = attrib.getNo();
      System.out.println("productId : "+productId+" and form : "+form);
      if (form.equals("1")) {
        try {
          Personalcom personalcom = personalcomHome.findByPrimaryKey(productId);
          personalcom.deleteProduct(productId);
        } catch (Exception ex) {
          ex.printStackTrace();
        }
      }
      if (form.equals("2")) {
        try {
          Notebook notebook = notebookHome.findByPrimaryKey(productId);
          notebook.deleteProduct(productId);
        } catch (Exception ex) {
          ex.printStackTrace();
        }
      }
      product.deleteProduct(productId);
    } catch (Exception ex) {
      ex.printStackTrace();
    }

  }




  public String getProductId() {    return productId;  }
  public void setProductId(String productId) {    this.productId = productId;  }
  public String getCategory() {    return category;  }
  public void setCategory(String category) {    this.category = category;  }
  public String getBrand() {    return brand;  }
  public void setBrand(String brand) {    this.brand = brand;  }
  public int getQuantity() {    return quantity;  }
  public void setQuantity(int quantity) {    this.quantity = quantity;  }
  public Date getLastReceiveDate() {    return lastReceiveDate;  }
  public void setLastReceiveDate(Date lastReceiveDate) {    this.lastReceiveDate = lastReceiveDate;  }
  public double getImportPrice() {    return importPrice;  }
  public void setImportPrice(double importPrice) {    this.importPrice = importPrice;  }
  public double getSellPrice() {    return sellPrice;  }
  public void setSellPrice(double sellPrice) {    this.sellPrice = sellPrice;  }
  public int getLowSellQuanity() {    return lowSellQuantity;  }
  public void setLowSellQuantity(int lowSellQuantity) {    this.lowSellQuantity = lowSellQuantity;  }
  public String getSellNow() {    return sellNow;  }
  public void setSellNow(String sellNow) {    this.sellNow = sellNow;  }
  public String getType() {    return type;  }
  public void setType(String type) {    this.type = type;  }
  public String getModel() {    return model;  }
  public void setModel(String model) {   this.model = model;  }
  public String getBus() {    return bus;  }
  public void setBus(String bus) {    this.bus = bus;  }
  public String getInterfac() {    return interfac;  }
  public void setInterfac(String interfac) {    this.interfac = interfac;  }
  public String getChipset() {    return chipset;  }
  public void setChipset(String chipset) {    this.chipset = chipset;  }
  public String getSpeed() {    return speed;  }
  public void setSpeed(String speed) {    this.speed = speed;  }
  public String getCapacity() {    return capacity;  }
  public void setCapacity(String capacity) {   this.capacity = capacity;  }
  public String getMore() {    return more;  }
  public void setMore(String more) {    this.more = more;  }
  public String getCpu() {    return cpu;  }
  public void setCpu(String cpu) {    this.cpu = cpu;  }
  public String getRam() {    return ram;  }
  public void setRam(String ram) {    this.ram = ram;  }
  public String getHdd() {    return hdd;  }
  public void setHdd(String hdd) {    this.hdd = hdd;  }
  public String getCdRom() {    return cdRom;  }
  public void setCdRom(String cdRom) {    this.cdRom = cdRom;  }
  public String getFdd() {    return fdd;  }
  public void setFdd(String fdd) {    this.fdd = fdd;  }
  public String getDisplay() {    return display;  }
  public void setDisplay(String display) {    this.display = display;  }
  public String getFaxModem() {    return faxModem;  }
  public void setFaxModem(String faxModem) {this.faxModem = faxModem; }

}