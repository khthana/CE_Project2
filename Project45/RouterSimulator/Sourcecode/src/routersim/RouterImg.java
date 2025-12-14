package routersim;
import java.awt.*;
import java.awt.image.*;
import java.awt.event.*;
import javax.swing.*;
import java.lang.*;
import java.util.*;
import java.io.WriteAbortedException;
import java.io.NotSerializableException;
import java.rmi.UnmarshalException;

public class RouterImg {
  private int xpos,ypos;
  private int width,height;
  private Image img;
  private String color;
  private int Type;
  private Vector rlink = new Vector();
  static Vector routerImg = new Vector();

  public RouterImg() {
    width = 50;
    height = 40;
    xpos = 120;
    ypos = 115;
    color="none";

  }
  public RouterImg(int type) {
    System.out.println("type"+type);
    switch (type){
      case 1 : img = Toolkit.getDefaultToolkit().getImage(RouterImg.class.getResource("bluerouter.gif"));color="red";break;
      case 2 : img = Toolkit.getDefaultToolkit().getImage(RouterImg.class.getResource("grayrouter.gif"));color="pupil";break;
      case 3 : img = Toolkit.getDefaultToolkit().getImage(RouterImg.class.getResource("greenrouter.gif"));color="green";break;
      case 4 : img = Toolkit.getDefaultToolkit().getImage(RouterImg.class.getResource("pupilrouter.gif"));color="gray";break;
      case 5 : img = Toolkit.getDefaultToolkit().getImage(RouterImg.class.getResource("redrouter.gif"));color="pink";break;
      case 6 : img = Toolkit.getDefaultToolkit().getImage(RouterImg.class.getResource("pinkrouter.gif"));color="blue";break;
      default :img = Toolkit.getDefaultToolkit().getImage(RouterImg.class.getResource("pinkrouter.gif"));color="blue";break;
    }
//    System.out.println("RouterImg->"+color);
    width = 50;
    height = 40;
    xpos = 120;
    ypos = 115;
    Type =type;

  }

  public String getColors(){
    return color;
  }
  public int getXPos(){
    return xpos;
  }
  public int getType(){
    return Type;
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
    return img;
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