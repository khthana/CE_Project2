package upload;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.rmi.*;
import javax.naming.*;
import javax.rmi.PortableRemoteObject;
import javax.ejb.*;
import picture.*;
import product.*;
import loadFile.*;

public class UploadFileBean {
  PictureHome pictureHome;
  ProductHome productHome;
  LoadFileAdvertiseHome loadFileAdvertiseHome;
  private final String rootPath = "/pic";
  String head = "";
  String abstracts = "";
  String textfield = "";

  public UploadFileBean() {
    try {
      Context ic = new InitialContext();
      java.lang.Object objref = ic.lookup("MyPicture");
      pictureHome = (PictureHome) PortableRemoteObject.narrow(objref,
                           PictureHome.class);
      objref = ic.lookup("MyProduct");
      productHome = (ProductHome) PortableRemoteObject.narrow(objref,
                           ProductHome.class);
      objref =  ic.lookup("MyLoadFileAdvertise");
      loadFileAdvertiseHome = (LoadFileAdvertiseHome) PortableRemoteObject.narrow(objref,
                     LoadFileAdvertiseHome.class);
      System.out.println("obtain pictureHome object in UploadFileBean(jsp)");
    } catch (Exception ex) {ex.printStackTrace();}
  }
  public boolean findPicId(String productId) {
    try {
      Picture picture = pictureHome.findByPrimaryKey(productId);
      return true;
    } catch(Exception ex) {
      System.out.println("return false");
      return false;
    }
  }
  public boolean findProductId(String productId) {
    try {
      Product product = productHome.findByPrimaryKey(productId);
      return true;
    } catch(Exception ex) {
      return false;
    }
  }
  public void loadFilePic(String productId) {
  System.out.println("in loadfilePic of uploadFileBean");
  head = "";
  abstracts = "";
  textfield = "";
      try {
        LoadFileAdvertise loadfile = loadFileAdvertiseHome.create();
        loadfile.loadFileAdvertise(productId);
        head = loadfile.getHead();
        abstracts = loadfile.getAbstracts();
        textfield = loadfile.getTextfield();
      } catch (Exception ex) {
        ex.printStackTrace();
      }
  }
  public String getHead() {return head;}
  public String getAbstracts() {return abstracts;}
  public String getTextfield() {return textfield;}
}