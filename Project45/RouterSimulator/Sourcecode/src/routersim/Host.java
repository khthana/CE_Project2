package routersim;

import java.util.Vector;
import java.awt.*;
import java.awt.image.*;
import java.awt.event.*;
import javax.swing.*;
import java.lang.*;
import java.util.*;
import java.io.*;
import java.util.*;

public class Host {

    static Vector vHost = new Vector();
    private String hostName;
    private String ipaddress;
    private int wireIndex = -1;

    private Image image1;
    private int xpos,ypos;
    private int width,height;

    final private String hostname = "history1.dat";

    public Host() {

      hostName= "";
      ipaddress = "";
      initialImage();
    }

    public Host(String name) {

      hostName=name;
      ipaddress = "";
      initialImage();
    }

    public void initialImage(){

      width = 32;
      height = 32;
      xpos = 200;
      ypos = 100;
      image1 = Toolkit.getDefaultToolkit().getImage(Frame3.class.getResource("pc.png"));
    }

    public String getIP(){

      return ipaddress;
    }

    public void setIP(String ip){

      ipaddress=ip;
    }

    public int getWireIndex(){

      return wireIndex;
    }

    public void  setWireIndex( int i ){

      wireIndex = i;
    }

   public String getHostName(){

     return hostName;
   }

   public void  setHostName(String Hname){

     hostName= Hname;
   }

   public int getXPos(){

     return xpos;
   }

  public int getYPos(){

    return ypos;
  }

  public int getWide(){

    return width;
  }

  public int getHigh(){

    return height;
  }
  public Image getImge(){

    return image1;
  }

  public void setXPos(int n){

    xpos = n;
  }

  public void setYPos(int n){

    ypos = n;
  }

  public void setWide(int n){

    width = n;
  }

  public void setHigh(int n){

    height = n;
  }
}