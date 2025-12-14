package base;

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
import attribute.*;

public class BaseAttribute {
  private Collection attributeCollection;
  private Collection categoryCollection;
  private String categoryForm[][];
  private int numberOfCategory;
  private AttribHome attribHome;
  private Vector attribuetVector;
  private Vector categoryVector;
  private static boolean change=true;
  private String[][] attributeRef = {
//******* Attribute Name, DB Name, Print Output Name *******//
      {"productId","product_id","Product ID"}, //0
      {"category","category","Category"},
      {"brand","brand","Brand"},
      {"quantity","quantity","Quantity"},
      {"lastReceiveDate","last_receive_date","Last Receive Date"},
      {"importPrice","import_price","Import Price"},
      {"sellPrice","sell_price","Sell Price"},
      {"lowSellQuantity","low_sell_quantity","Low Sell Quantity"},
      {"sellNow","sell_now","Sell Now"},
      {"type","type","Type"}, //8
      {"model","model","Model"},
      {"bus","bus","BUS"},
      {"interfac","interfac","Interface"},
      {"chipset","chipset","Chipset"},
      {"speed","speed","Speed"},
      {"capacity","capacity","Capacity"},
      {"more","more","More"}, //15
      {"cpu","cpu","CPU"},
      {"ram","ram","RAM"},
      {"hdd","hdd","HDD"},
      {"cdRom","cd_rom","CD ROM"},
      {"fdd","fdd","FDD"},
      {"display","display","Display"},
      {"faxModem","fax_modem","FAX Modem"}, //22
  };

  private static BaseAttribute baseAttribute = new BaseAttribute();

  public static BaseAttribute getBaseAttribute() {
    if (change) {
      baseAttribute = new BaseAttribute();
    }
    return baseAttribute;
  }

  public BaseAttribute() {
    try {
    System.out.println("in constructor BaseAttribute");
      Context ic = new InitialContext();
      Object objref =  ic.lookup("MyAttribute");
      attribHome = (AttribHome) PortableRemoteObject.narrow(objref,
                           AttribHome.class);
      System.out.println("obtained attribHome object");
      if (change) {
      System.out.println("connect dataBase");
        attributeCollection = attribHome.findAll();
        categoryCollection = attribHome.findByCategory();
        Iterator i = categoryCollection.iterator();
        this.categoryVector = new Vector();
        this.numberOfCategory = categoryCollection.size();
        this.categoryForm = new String[numberOfCategory][2];
        for (int a=0; a<numberOfCategory; a++) {
          categoryForm[a][0] = new String();
          categoryForm[a][1] = new String();
        }
        int a = 0;
        while (i.hasNext()) {
          Attrib attrib = (Attrib)i.next();
          try {
            String category = ((AttribPK)attrib.getPrimaryKey()).category;
            this.categoryVector.addElement(category);
            categoryForm[a][0] = category;
            categoryForm[a][1] = attrib.getNo();
          } catch (Exception ex) {
              ex.printStackTrace();
          }
          a++;
        }
        setChange(false);
      }
    } catch (Exception re) {
      System.err.println ("Couldn't locate attribHome");
      re.printStackTrace();
    }
  }
  /**Process the HTTP Get request*/
  public String[][] getAttributeRef() {
    return attributeRef;
  }
  public String getForm(String category) {
    Iterator i = categoryCollection.iterator();
    String form;
    while (i.hasNext()) {
      try {
        Attrib attrib = (Attrib)i.next();
        String cat = ((AttribPK)attrib.getPrimaryKey()).category;
        if (category.equals(cat)) {
          form = attrib.getNo();
          return form;
        }
      } catch (Exception ex) {
        ex.printStackTrace();
      }
    }
    return null;
  }
  public String[][] getCategoryForm() {
    return categoryForm;
  }
  public int getNumberOfCategory() {
    return numberOfCategory;
  }
  public Vector getCategory() {
    return categoryVector;
  }
  public Vector getAttribOfProduct(String category) {
    Iterator i = attributeCollection.iterator();
    Vector attributeVector = new Vector();
    String s;
    try {
    while (i.hasNext()) {
      Attrib attrib = (Attrib)i.next();
      s = ((AttribPK)attrib.getPrimaryKey()).category;
      if (category.equals(s)) {
        if (attrib.getUse().equals("true"))
        attributeVector.addElement(((AttribPK)attrib.getPrimaryKey()).attribute);
      }
    }
    } catch (RemoteException ex) {
      ex.printStackTrace();
    }
    return attributeVector;
  }
  public void setChange(boolean change){
    this.change = change;
  }

}