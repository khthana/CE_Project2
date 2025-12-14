package routersim;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */

import java.awt.*;
import java.awt.image.*;
import java.awt.event.*;
import javax.swing.*;
import java.lang.*;
import java.util.*;

public class WireImage {

  private int xpos,ypos;
  private int Left,Right;
  private int width,height;
  private Image img;
  private String color;
  private int Type;

  public WireImage() {

    width = 84;
    height = 16;
    xpos = 200;
    ypos = 200;
    color= "white";
  }

  public WireImage( int type ) {
    switch ( type ) {
      case 1 : img = Toolkit.getDefaultToolkit().getImage(WireImage.class.getResource("eth.gif"));break;
      case 2 : img = Toolkit.getDefaultToolkit().getImage(WireImage.class.getResource("ser.gif"));break;
      case 3 : img = Toolkit.getDefaultToolkit().getImage(WireImage.class.getResource("tok.gif"));break;
      default : color="none";break;
       }
       width = 84;
       height = 16;
       xpos = 200;
       ypos = 200;
       Type = type;
  }
  public int getType(){
    return Type;
  }
  public void setType(int type){
    Type = type;
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