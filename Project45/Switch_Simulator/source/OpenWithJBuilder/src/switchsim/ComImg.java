package switchsim;

import java.awt.*;
import java.awt.image.*;
import java.awt.event.*;
import javax.swing.*;
import java.lang.*;
import java.util.*;

public class ComImg {
  private int xpos,ypos;
  private int width,height;
  private Image img;

  public ComImg() {
    width = 36;
    height = 40;
    xpos = 60*(Panel2.vImgCom.size()+1);
    ypos = 30*(Panel2.vImgCom.size()+1)+30;
    img = Toolkit.getDefaultToolkit().getImage(ComImg.class.getResource("workstation.gif"));
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
  public Image getImage(){
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