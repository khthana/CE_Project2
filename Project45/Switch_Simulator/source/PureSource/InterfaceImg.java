package switchsim;

import java.awt.*;
import java.awt.image.*;
import java.awt.event.*;
import javax.swing.*;
import java.lang.*;
import java.util.*;

public class InterfaceImg {
  private int xpos1,xpos2,ypos1,ypos2;
  private int type; // sw-sw -> 1, sw-com -> 2
  private Interface int1;
  private Interface int2;
  private Workstation com;

  public InterfaceImg() {
  }

  public int getXPos1(){
    return xpos1;
  }
  public void setXPos1(int n){
    xpos1 = n;
  }

  public int getXPos2(){
    return xpos2;
  }
  public void setXPos2(int n){
    xpos2 = n;
  }

  public int getYPos1(){
    return ypos1;
  }
  public void setYPos1(int n){
    ypos1 = n;
  }

  public int getYPos2(){
    return ypos2;
  }
  public void setYPos2(int n){
    ypos2 = n;
  }

  public int getType() {
    return type;
  }
  public void setIntSwToSw() {
    type = 1;
  }
  public void setIntSwToCom() {
    type = 2;
  }

  public Interface getInt1() {
    return int1;
  }
  public void setInt1(Interface i) {
    int1 = i;
  }

  public Interface getInt2() {
    return int2;
  }
  public void setInt2(Interface i) {
    int2 = i;
  }

  public Workstation getWorkstation() {
    return com;
  }
  public void setWorkstation(Workstation c) {
    com = c;
  }
  public boolean isSelected(int x, int y) {
    int newx = x, newx1 = this.xpos1, newx2 = this.xpos2;
    int newy = y*(-1);
    int newy1 = this.ypos1*(-1);
    int newy2 = this.ypos2*(-1);
    double m, c;
    if ((newx1==newx2) &&
        (((newy>newy1) && (newy<newy2)) || ((newy>newy2) && (newy<newy1))) &&
        ((newx==newx1) || (newx==newx1-1) || (newx==newx1+1) || (newx==newx1-2) || (newx==newx1+2)|| (newx==newx1-3) || (newx==newx1+3))) {
//      System.out.println("Condition [1]");
      return true;
    }
    if ((newy1==newy2) &&
        (((newx>newx1) && (newx<newx2)) || ((newx>newx2) && (newx<newx1))) &&
        ((newy==newy1) || (newy==newy1-1) || (newy==newy1+1) || (newy==newy1-2) || (newy==newy1+2)|| (newy==newy1-3) || (newy==newy1+3))) {
//      System.out.println("Condition [2]");
      return true;
    }
    m = (1.0)*(newy2-newy1)/(newx2-newx1);
    c = newy1-(m*newx1);
    System.out.println(xpos1+", "+ypos1+" : "+xpos2+", "+ypos2);
    System.out.println(x+", "+y+" : "+(int)((-1)*(m*newx+c)));
//    System.out.println(newx1+", "+newy1+" : "+newx2+", "+newy2);
//    System.out.println(m+" "+c);
    if (((newx>=newx1) && (newx<=newx2) && (newy>=newy1) && (newy<=newy2)) ||
        ((newx>=newx2) && (newx<=newx1) && (newy>=newy1) && (newy<=newy2)) ||
        ((newx>=newx1) && (newx<=newx2) && (newy>=newy2) && (newy<=newy1)) ||
        ((newx>=newx2) && (newx<=newx1) && (newy>=newy2) && (newy<=newy1))) {
      if (newy == (int)(m*newx+c)) {
//        System.out.println("Condition [3]");
        return true;
      }
      newx1 = this.xpos1-1; newy1 = this.ypos1*(-1);
      newx2 = this.xpos2-1; newy2 = this.ypos2*(-1);
      m = (1.0)*(newy2-newy1)/(newx2-newx1);
      c = newy1-(m*newx1);
      if (newy == (int)(m*newx+c)) {
//        System.out.println("Condition [4]");
        return true;
      }
      newx1 = this.xpos1+1; newy1 = this.ypos1*(-1);
      newx2 = this.xpos2+1; newy2 = this.ypos2*(-1);
      m = (1.0)*(newy2-newy1)/(newx2-newx1);
      c = newy1-(m*newx1);
      if (newy == (int)(m*newx+c)) {
//        System.out.println("Condition [5]");
        return true;
      }
      newx1 = this.xpos1; newy1 = (this.ypos1-1)*(-1);
      newx2 = this.xpos2; newy2 = (this.ypos2-1)*(-1);
      m = (1.0)*(newy2-newy1)/(newx2-newx1);
      c = newy1-(m*newx1);
      if (newy == (int)(m*newx+c)) {
//        System.out.println("Condition [6]");
        return true;
      }
      newx1 = this.xpos1; newy1 = (this.ypos1+1)*(-1);
      newx2 = this.xpos2; newy2 = (this.ypos2+1)*(-1);
      m = (1.0)*(newy2-newy1)/(newx2-newx1);
      c = newy1-(m*newx1);
      if (newy == (int)(m*newx+c)) {
//        System.out.println("Condition [7]");
        return true;
      }
      newx1 = this.xpos1-2; newy1 = this.ypos1*(-1);
      newx2 = this.xpos2-2; newy2 = this.ypos2*(-1);
      m = (1.0)*(newy2-newy1)/(newx2-newx1);
      c = newy1-(m*newx1);
      if (newy == (int)(m*newx+c)) {
//        System.out.println("Condition [8]");
        return true;
      }
      newx1 = this.xpos1+2; newy1 = this.ypos1*(-1);
      newx2 = this.xpos2+2; newy2 = this.ypos2*(-1);
      m = (1.0)*(newy2-newy1)/(newx2-newx1);
      c = newy1-(m*newx1);
      if (newy == (int)(m*newx+c)) {
//        System.out.println("Condition [9]");
        return true;
      }
      newx1 = this.xpos1; newy1 = (this.ypos1-2)*(-1);
      newx2 = this.xpos2; newy2 = (this.ypos2-2)*(-1);
      m = (1.0)*(newy2-newy1)/(newx2-newx1);
      c = newy1-(m*newx1);
      if (newy == (int)(m*newx+c)) {
//        System.out.println("Condition [10]");
        return true;
      }
      newx1 = this.xpos1; newy1 = (this.ypos1+2)*(-1);
      newx2 = this.xpos2; newy2 = (this.ypos2+2)*(-1);
      m = (1.0)*(newy2-newy1)/(newx2-newx1);
      c = newy1-(m*newx1);
      if (newy == (int)(m*newx+c)) {
//        System.out.println("Condition [11]");
        return true;
      }
      newx1 = this.xpos1-3; newy1 = this.ypos1*(-1);
      newx2 = this.xpos2-3; newy2 = this.ypos2*(-1);
      m = (1.0)*(newy2-newy1)/(newx2-newx1);
      c = newy1-(m*newx1);
      if (newy == (int)(m*newx+c)) {
//        System.out.println("Condition [12]");
        return true;
      }
      newx1 = this.xpos1+3; newy1 = this.ypos1*(-1);
      newx2 = this.xpos2+3; newy2 = this.ypos2*(-1);
      m = (1.0)*(newy2-newy1)/(newx2-newx1);
      c = newy1-(m*newx1);
      if (newy == (int)(m*newx+c)) {
//        System.out.println("Condition [13]");
        return true;
      }
      newx1 = this.xpos1; newy1 = (this.ypos1-3)*(-1);
      newx2 = this.xpos2; newy2 = (this.ypos2-3)*(-1);
      m = (1.0)*(newy2-newy1)/(newx2-newx1);
      c = newy1-(m*newx1);
      if (newy == (int)(m*newx+c)) {
//        System.out.println("Condition [14]");
        return true;
      }
      newx1 = this.xpos1; newy1 = (this.ypos1+3)*(-1);
      newx2 = this.xpos2; newy2 = (this.ypos2+3)*(-1);
      m = (1.0)*(newy2-newy1)/(newx2-newx1);
      c = newy1-(m*newx1);
      if (newy == (int)(m*newx+c)) {
//        System.out.println("Condition [15]");
        return true;
      }
      newx1 = this.xpos1-4; newy1 = this.ypos1*(-1);
      newx2 = this.xpos2-4; newy2 = this.ypos2*(-1);
      m = (1.0)*(newy2-newy1)/(newx2-newx1);
      c = newy1-(m*newx1);
      if (newy == (int)(m*newx+c)) {
//        System.out.println("Condition [16]");
        return true;
      }
      newx1 = this.xpos1+4; newy1 = this.ypos1*(-1);
      newx2 = this.xpos2+4; newy2 = this.ypos2*(-1);
      m = (1.0)*(newy2-newy1)/(newx2-newx1);
      c = newy1-(m*newx1);
      if (newy == (int)(m*newx+c)) {
//        System.out.println("Condition [17]");
        return true;
      }
      newx1 = this.xpos1; newy1 = (this.ypos1-4)*(-1);
      newx2 = this.xpos2; newy2 = (this.ypos2-4)*(-1);
      m = (1.0)*(newy2-newy1)/(newx2-newx1);
      c = newy1-(m*newx1);
      if (newy == (int)(m*newx+c)) {
//        System.out.println("Condition [18]");
        return true;
      }
      newx1 = this.xpos1; newy1 = (this.ypos1+4)*(-1);
      newx2 = this.xpos2; newy2 = (this.ypos2+4)*(-1);
      m = (1.0)*(newy2-newy1)/(newx2-newx1);
      c = newy1-(m*newx1);
      if (newy == (int)(m*newx+c)) {
//        System.out.println("Condition [19]");
        return true;
      }

      newx1 = this.xpos1-5; newy1 = this.ypos1*(-1);
      newx2 = this.xpos2-5; newy2 = this.ypos2*(-1);
      m = (1.0)*(newy2-newy1)/(newx2-newx1);
      c = newy1-(m*newx1);
      if (newy == (int)(m*newx+c)) {
//        System.out.println("Condition [20]");
        return true;
      }
      newx1 = this.xpos1+5; newy1 = this.ypos1*(-1);
      newx2 = this.xpos2+5; newy2 = this.ypos2*(-1);
      m = (1.0)*(newy2-newy1)/(newx2-newx1);
      c = newy1-(m*newx1);
      if (newy == (int)(m*newx+c)) {
//        System.out.println("Condition [21]");
        return true;
      }
      newx1 = this.xpos1; newy1 = (this.ypos1-5)*(-1);
      newx2 = this.xpos2; newy2 = (this.ypos2-5)*(-1);
      m = (1.0)*(newy2-newy1)/(newx2-newx1);
      c = newy1-(m*newx1);
      if (newy == (int)(m*newx+c)) {
//        System.out.println("Condition [22]");
        return true;
      }
      newx1 = this.xpos1; newy1 = (this.ypos1+5)*(-1);
      newx2 = this.xpos2; newy2 = (this.ypos2+5)*(-1);
      m = (1.0)*(newy2-newy1)/(newx2-newx1);
      c = newy1-(m*newx1);
      if (newy == (int)(m*newx+c)) {
//        System.out.println("Condition [23]");
        return true;
      }
    }
    return false;
  }
}