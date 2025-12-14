package add;
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
import base.*;

public class AddProductBean {
   String productId;
   String category = null;
   String brand;
   String quantity;
   int quan;
   Date lastReceiveDate;
   String dd;
   String mm;
   String yy;
   int d;
   int m;
   int y;
   String importPrice;
   double importp;
   String sellPrice;
   double sellp;
   String lowSellQuantity;
   int lowQuan;
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

   ProductHome productHome;
   PersonalcomHome personalcomHome;
   NotebookHome notebookHome;
   boolean firstAccess=true;
   boolean createProduct;
   Product product;
   Notebook notebook;
   Personalcom personalcom;
   String form;

  public AddProductBean() {
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
      System.out.println("obtained entity Home object");
    } catch (Exception re) {
      System.err.println ("Couldn't locate entity Home");
      re.printStackTrace();
    }
    reset();
  }
  public void initial() {
    System.out.println("in initial category:"+category);
    createProduct = false;
    if (firstAccess) reset();
    if (verifyInput()) {
    System.out.println("verify is true");
    createProduct();}
  }

  public void createProduct() {
    BaseAttribute baseAttribute = BaseAttribute.getBaseAttribute();
    form = baseAttribute.getForm(category);
    if (form != null) {

        try {
        lastReceiveDate = new Date(y-1900,m-1,d);
        long time = lastReceiveDate.getTime();
        product = productHome.create(productId.trim(),category.trim(),
                      brand.trim(),quan,(new java.sql.Date(time)),
                      importp,sellp,lowQuan,sellNow.trim());
        if (form.equals("1")) {
        System.out.println("will create personal");
          personalcom = personalcomHome.create(productId.trim(),
                        type.trim(),model.trim(),bus.trim(),
                        interfac.trim(),chipset.trim(),speed.trim(),
                        capacity.trim(),more.trim());
        System.out.println("create personalcom ok");
        }
        if (form.equals("2")) {
          notebook = notebookHome.create(productId.trim(),cpu.trim(),
                   ram.trim(),hdd.trim(),cdRom.trim(),fdd.trim(),
                   display.trim(),faxModem.trim(),more.trim());
        }
        createProduct = true;
        firstAccess = true;
        System.out.println("create product ok");
        } catch(CreateException e) {
            System.out.println("create error");
            e.printStackTrace();
        } catch(RemoteException e) {
            System.out.println("remote error");
            e.printStackTrace();
        }
    } else { System.out.println("Sorry,I don't know where I put in Database Table"); }

  }
  public boolean verifyInput() {
      if (firstAccess) { return false; }
      if (productId.trim().equals("") ) { return false;      }
      try {
        product = productHome.findByPrimaryKey(productId.trim());
        return false;
      } catch (Exception ex) {
      }
      try {
        quan = Integer.valueOf(quantity).intValue();
      } catch (Exception ex) {
        return false;
      }
      try {
        importp = Double.valueOf(importPrice).doubleValue();
      } catch (Exception ex) {
        return false;
      }
      try {
        sellp = Double.valueOf(sellPrice).doubleValue();
      } catch (Exception ex) {
        return false;
      }
  System.out.println("lowSellQuantity:"+lowSellQuantity);
      try {
        lowQuan = Integer.valueOf(lowSellQuantity).intValue();
        if (lowQuan>0) { return false; }
      } catch (Exception ex) {
        return false;
      }
  System.out.println("dd:"+dd);
      try {
        d = Integer.valueOf(dd).intValue();
        if (d>31) { return false; }
      } catch (Exception ex) {
        System.out.println("occur exception in dd");
        return false;
      }
  System.out.println("mm:"+mm);
      try {
        m = Integer.valueOf(mm).intValue();
        if (m>12) { return false; }
      } catch (Exception ex) {
        System.out.println("occur exception in mm");
        return false;
      }
  System.out.println("yy:"+yy);
      try {
        y = Integer.valueOf(yy).intValue();
        if (y<1900) { return false; }
      } catch (Exception ex) {
        System.out.println("occur exception in yy");
        return false;
      }
    return true;
  }
  public boolean productIdNull() {
        if (productId.trim().equals("") ) { return true; }
        return false;
  }
  public boolean findProductId() {
      try {
        product = productHome.findByPrimaryKey(productId);
      } catch (Exception ex) {
        return false;
      }
      return true;
  }
  public boolean quantityInt() {
      try {
        quan = Integer.valueOf(quantity).intValue();
      } catch (Exception ex) {
        return false;
      }
    return true;
  }
  public boolean importPriceDouble() {
      try {
        importp = Double.valueOf(importPrice).doubleValue();
      } catch (Exception ex) {
        return false;
      }
    return true;
  }
  public boolean sellPriceDouble() {
      try {
        sellp = Double.valueOf(sellPrice).doubleValue();
      } catch (Exception ex) {
        return false;
      }
    return true;
  }
  public boolean lowSellQuantityInt() {
      try {
        lowQuan = Integer.valueOf(lowSellQuantity).intValue();
        if (lowQuan>0) { return false; }
      } catch (Exception ex) {
        return false;
      }
      return true;
  }
  public boolean ddInt() {
      try {
        d = Integer.valueOf(dd).intValue();
        if (d>31) return false;
      } catch (Exception ex) {
        return false;
      }
    return true;
  }
  public boolean mmInt() {
      try {
        m = Integer.valueOf(mm).intValue();
        if (m>12) return false;
      } catch (Exception ex) {
        return false;
      }
    return true;
  }
  public boolean yyInt() {
      try {
        y = Integer.valueOf(yy).intValue();
        if (y<1900) return false;
      } catch (Exception ex) {
        return false;
      }
    return true;
  }

  public boolean getCreateProduct() {
    return createProduct;
  }

  private void reset() {
    System.out.println("in reset");
    final String emptyString = "";
      setProductId(emptyString);
//      setCategory(emptyString);
      setBrand(emptyString);
      setQuantity(emptyString);
      setDd(emptyString);
      setMm(emptyString);
      setYy(emptyString);
      setImportPrice(emptyString);
      setSellPrice(emptyString);
      setLowSellQuantity(emptyString);
      setSellNow(emptyString);
      setType(emptyString);
      setModel(emptyString);
      setBus(emptyString);
      setInterfac(emptyString);
      setChipset(emptyString);
      setSpeed(emptyString);
      setCapacity(emptyString);
      setMore(emptyString);
      setCpu(emptyString);
      setRam(emptyString);
      setHdd(emptyString);
      setCdRom(emptyString);
      setFdd(emptyString);
      setDisplay(emptyString);
      setFaxModem(emptyString);
  }
  public String getFollowAttribute(String s) {
  String emptyString = "";
    if (s.equals("Type") ) {return type;} else
    if (s.equals("Model") ) {return model;} else
    if (s.equals("BUS") ) {return bus;} else
    if (s.equals("Interface") ) {return interfac;} else
    if (s.equals("Chipset") ) {return chipset;} else
    if (s.equals("Speed") ) {return speed;} else
    if (s.equals("Capacity") ) {return capacity;} else
    if (s.equals("More") ) {return more;} else
    if (s.equals("CPU") ) {return cpu;} else
    if (s.equals("RAM") ) {return ram;} else
    if (s.equals("HDD") ) {return hdd;} else
    if (s.equals("CD ROM") ) {return cdRom;} else
    if (s.equals("FDD") ) {return fdd;} else
    if (s.equals("Display") ) {return display;} else
    if (s.equals("Fax Modem") ) {return faxModem;} else
    return emptyString;
  }

  public boolean getFirstAccess() {    return firstAccess;  }
  public void setFirstAccess(boolean firstAccess) {    this.firstAccess = firstAccess;  }
///////////////////   GET & SET  Method  /////////////////////////
  public String getProductId() {    return productId;  }
  public void setProductId(String productId) {    this.productId = productId;  }
  public String getCategory() {    return category;  }
  public void setCategory(String category) {    this.category = category;  }
  public String getBrand() {    return brand;  }
  public void setBrand(String brand) {    this.brand = brand;  }
  public String getQuantity() {    return quantity;  }
  public void setQuantity(String quantity) {    this.quantity = quantity;  }
  public String getImportPrice() {    return importPrice;  }
  public void setImportPrice(String importPrice) {    this.importPrice = importPrice;  }
  public String getSellPrice() {    return sellPrice;  }
  public void setSellPrice(String sellPrice) {    this.sellPrice = sellPrice;  }
  public String getDd() { return dd; }
  public void setDd(String dd) {this.dd = dd;}
  public String getMm() { return mm; }
  public void setMm(String mm) {this.mm = mm;}
  public String getYy() { return yy; }
  public void setYy(String yy) {this.yy = yy;}
  public String getLowSellQuantity() {    return lowSellQuantity;  }
  public void setLowSellQuantity(String lowSellQuantity) {    this.lowSellQuantity = lowSellQuantity;  }
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