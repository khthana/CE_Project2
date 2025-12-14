package blueprint;

import java.rmi.*;
import javax.ejb.*;
import java.util.*;
import java.lang.*;
import javax.naming.*;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public interface Blueprint extends EJBObject {
  public String[][] sortAttribute(Vector cat) throws RemoteException;
  public void updateBlueprint(String[][] s) throws RemoteException;
  public void updateProduct() throws RemoteException;
  public void deleteProduct() throws RemoteException;

  public String getProductId() throws RemoteException;
  public void setProductId(String productId)  throws RemoteException;
  public String getCategory()  throws RemoteException;
  public void setCategory(String category) throws RemoteException;
  public String getBrand()  throws RemoteException;
  public void setBrand(String brand) throws RemoteException;
  public int getQuantity()  throws RemoteException;
  public void setQuantity(int quantity)  throws RemoteException;
  public Date getLastReceiveDate() throws RemoteException;
  public void setLastReceiveDate(Date lastReceiveDate) throws RemoteException;
  public int getLowSellQuanity() throws RemoteException;
  public void setLowSellQuantity(int lowSellQuantity) throws RemoteException;
  public double getImportPrice() throws RemoteException;
  public void setImportPrice(double importPrice) throws RemoteException;
  public double getSellPrice() throws RemoteException;
  public void setSellPrice(double sellPrice) throws RemoteException;
  public String getSellNow() throws RemoteException;
  public void setSellNow(String sellNow) throws RemoteException;
  public String getType() throws RemoteException;
  public void setType(String type) throws RemoteException;
  public String getModel() throws RemoteException;
  public void setModel(String model) throws RemoteException;
  public String getBus() throws RemoteException;
  public void setBus(String bus) throws RemoteException;
  public String getInterfac()  throws RemoteException;
  public void setInterfac(String interfac) throws RemoteException;
  public String getChipset() throws RemoteException;
  public void setChipset(String chipset) throws RemoteException;
  public String getSpeed() throws RemoteException;
  public void setSpeed(String speed)  throws RemoteException;
  public String getCapacity() throws RemoteException;
  public void setCapacity(String capacity) throws RemoteException;
  public String getMore()  throws RemoteException;
  public void setMore(String more)  throws RemoteException;
  public String getCpu() throws RemoteException;
  public void setCpu(String cpu)  throws RemoteException;
  public String getRam() throws RemoteException;
  public void setRam(String ram)  throws RemoteException;
  public String getHdd()  throws RemoteException;
  public void setHdd(String hdd)  throws RemoteException;
  public String getCdRom() throws RemoteException;
  public void setCdRom(String cdRom)  throws RemoteException;
  public String getFdd() throws RemoteException;
  public void setFdd(String fdd) throws RemoteException;
  public String getDisplay()  throws RemoteException;
  public void setDisplay(String display) throws RemoteException;
  public String getFaxModem() throws RemoteException;
  public void setFaxModem(String faxModem) throws RemoteException;
}