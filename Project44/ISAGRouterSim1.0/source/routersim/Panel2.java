package routersim;

import java.awt.*;
import java.awt.image.*;
import java.awt.event.*;
import javax.swing.*;
import java.util.*;
import javax.swing.JPanel;
import com.borland.jbcl.layout.*;


public class Panel2 extends JPanel {
  XYLayout xYLayout1 = new XYLayout();
  public static Vector vImg = new Vector();
  RouterImg rimg;
  Image img;
  boolean pressin = false;
  //position of mouse
  int dx,dy;
  JButton jClose = new JButton();
  public Panel2() {
    try {
      jbInit();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }
  void jbInit() throws Exception {
    jClose.setText("Close");
    jClose.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jClose_actionPerformed(e);
      }
    });
    this.setBackground(new Color(195, 222, 251));
    this.setAlignmentX((float) 0.0);
    this.setAlignmentY((float) 0.0);
    this.setSize(690, 379);
    //---------------------------------------Add Listener ---------------------------------------//
    this.addMouseMotionListener(new java.awt.event.MouseMotionAdapter() {
      public void mouseDragged(MouseEvent e) {
        this_mouseDragged(e);
      }
    });
    this.addMouseListener(new java.awt.event.MouseAdapter() {
      public void mouseReleased(MouseEvent e) {
        this_mouseReleased(e);
      }
      public void mousePressed(MouseEvent e) {
        this_mousePressed(e);
      }
    });
    //--------------------------------Layout------------------------------------//
    this.setLayout(xYLayout1);
    if (Frame1.vRouter.size() > 0){
      int type=((Router)Frame1.vRouter.lastElement()).getModel();
      rimg = new RouterImg(type);
      Panel2.vImg.addElement(rimg);
    }
    xYLayout1.setWidth(690);
    xYLayout1.setHeight(379);
    this.add(jClose, new XYConstraints(325, 300, 80, 28));
  }

  //--------------------------Panit-------------------------//
  public void paintComponent(Graphics g){
    super.paintComponent(g);
    g.setColor(Color.black);
    for (int i=0; i < Frame1.vRouter.size(); i++){
      Router rt1 = (Router)Frame1.vRouter.elementAt(i);
      RouterImg r1 = (RouterImg)vImg.elementAt(i);
//      try{
        int x1 = r1.getXPos() + (r1.getWide() / 2);
        int y1 = r1.getYPos() + (r1.getHigh() / 2);
        for (int int1=0; int1 < rt1.getVInt().size(); int1++){
          boolean adj = false;
          Interface i1 = (Interface)rt1.getVInt().elementAt(int1);
          for (int j=0; j < Frame1.vRouter.size(); j++){
            Router rt2 = (Router)Frame1.vRouter.elementAt(j);
            RouterImg r2 = (RouterImg)vImg.elementAt(j);
            int x2 = r2.getXPos() + (r2.getWide() / 2);
            int y2 = r2.getYPos() + (r2.getHigh() / 2);
            for (int int2=0; int2 < rt2.getVInt().size(); int2++){
              Interface i2 = (Interface)rt2.getVInt().elementAt(int2);
              if (i1.getNetAddress().equalsIgnoreCase(i2.getNetAddress()) && (!i1.getIpAddress().equalsIgnoreCase(i2.getIpAddress()))){
                adj = true;
                if (i < j){
                  //----write weight for ospf----//
                  if (rt1.getFlag() == 'o'){
                    //(x1,y1)&(x2,y2)
                    int xpo = ((x2+x1)/2)+10;
                    int ypo = ((y2+y1)/2)-5;
                    String weight="-1";
                    for (int a=0;a < rt1.getHello().size();a++){
                      Hello h = (Hello)rt1.getHello().elementAt(a);
                      if ((h.getStartRouter() != null)&&(h.getDesRouter() != null)){
                        if ((rt1.getName().equalsIgnoreCase(h.getStartRouter().getName()))&&(rt2.getName().equalsIgnoreCase(h.getDesRouter().getName()))){
                          weight = Integer.toString(h.getWeight());
                          g.drawString(weight,xpo,ypo);
                        }//end check from hello
                      }//end hello not null
                    }//end for
                  }//end flag is ospf
                  int xx1=0,xx2=0,yy1=0,yy2=0;
                  if ((i1.getStatus().equals("down"))||(i2.getStatus().equals("down"))){
                    g.setColor(Color.red);
                  }
                  g.drawLine(x1,y1-1,x2,y2-1);
                  g.drawLine(x1,y1,x2,y2);
                  g.drawLine(x1,y1+1,x2,y2+1);
                  //Calculate newx and newy
                  if ((x1 <= x2)&&(y1 <= y2)){
                    if (x1 == x2){
                      x2 = x1+1;
                    }
                    double m = (y2-y1)*1.0/(x2-x1);
                    double b = ((x2*y1)-(x1*y2))*1.0/(x2-x1);
  //                  System.out.println("m="+m+"\nb="+b);
                    double zeta = Math.atan(m);
  //                  System.out.println("zeta="+zeta);
                    double tmpx1 = (5*Math.cos(zeta))+x1;
                    double tmpy1 = (m*tmpx1)+b;
                    int distance = (int)(Math.sqrt(((x2-x1)*(x2-x1))+((y2-y1)*(y2-y1))));
                    double tmpx2 = ((distance-5)*Math.cos(zeta))+x1;
                    double tmpy2 = (m*tmpx2)+b;
                    xx1 = (int)tmpx1-20;
                    yy1 = (int)tmpy1+50;
                    xx2 = (int)tmpx2;
                    yy2 = (int)tmpy2-90;
  //                  System.out.println("x1<x2&&y1<y2");
                  }
                  else if ((x1 <= x2)&&(y1 > y2)){
                    if (x2 == x1){
                      x2 = x1 + 1;
                    }
                    double m = (y2-y1)*1.0/(x2-x1);
                    double b = ((x2*y1)-(x1*y2))*1.0/(x2-x1);
  //                  System.out.println("m="+m+"\nb="+b);
                    double zeta = Math.atan(m);
  //                  System.out.println("zeta="+zeta);
                    double tmpx1 = (5*Math.cos(zeta))+x1;
                    double tmpy1 = (m*tmpx1)+b;
                    int distance = (int)(Math.sqrt(((x2-x1)*(x2-x1))+((y2-y1)*(y2-y1))));
                    double tmpx2 = ((distance-5)*Math.cos(zeta))+x1;
                    double tmpy2 = (m*tmpx2)+b;
                    xx1 = (int)tmpx1+(r1.getWide()/2);
                    yy1 = (int)tmpy1;
                    xx2 = (int)tmpx2-100;
                    yy2 = (int)tmpy2-50;
  //                  System.out.println("x1<x2&&y1>y2");
                  }
                  else if ((x1 > x2)&&(y1 <= y2)){
                    //swap
                    int tempx1 = x2;
                    int tempy1 = y2;
                    int tempx2 = x1;
                    int tempy2 = y1;
                    //cal
                    double m = (tempy2-tempy1)*1.0/(tempx2-tempx1);
                    double b = ((tempx2*tempy1)-(tempx1*tempy2))*1.0/(tempx2-tempx1);
  //                  System.out.println("m="+m+"\nb="+b);
                    double zeta = Math.atan(m);
  //                  System.out.println("zeta="+zeta);
                    double tmpx1 = (5*Math.cos(zeta))+tempx1;
                    double tmpy1 = (m*tmpx1)+b;
                    int distance = (int)(Math.sqrt(((tempx2-tempx1)*(tempx2-tempx1))+((tempy2-tempy1)*(tempy2-tempy1))));
                    double tmpx2 = ((distance-5)*Math.cos(zeta))+tempx1;
                    double tmpy2 = (m*tmpx2)+b;
                    xx1 = (int)tmpx2-100;
                    yy1 = (int)tmpy2;
                    xx2 = (int)tmpx1+20;
                    yy2 = (int)tmpy1-30;
  //                  System.out.println("x1>x2&&y1<y2");
                  }
                  else {
                    // x1 > x2 && y1 > y2
                    //swap between point
                    int tempx1 = x2;
                    int tempy1 = y2;
                    int tempx2 = x1;
                    int tempy2 = y1;
                    //cal
                    double m = (tempy2-tempy1)*1.0/(tempx2-tempx1);
                    double b = ((tempx2*tempy1)-(tempx1*tempy2))*1.0/(tempx2-tempx1);
  //                  System.out.println("m="+m+"\nb="+b);
                    double zeta = Math.atan(m);
  //                  System.out.println("zeta="+zeta);
                    double tmpx1 = (5*Math.cos(zeta))+tempx1;
                    double tmpy1 = (m*tmpx1)+b;
                    int distance = (int)(Math.sqrt(((tempx2-tempx1)*(tempx2-tempx1))+((tempy2-tempy1)*(tempy2-tempy1))));
                    double tmpx2 = ((distance-5)*Math.cos(zeta))+tempx1;
                    double tmpy2 = (m*tmpx2)+b;
                    xx1 = (int)tmpx2-50;
                    yy1 = (int)tmpy2-50;
                    xx2 = (int)tmpx1;
                    yy2 = (int)tmpy1;
  //                  System.out.println("x1>x2&&y1>y2");
                  }

                  g.setColor(Color.blue);
                  g.drawString(i1.getNameInt(),xx1+20,yy1-15);
                  g.drawString(i1.getIpAddress(),xx1,yy1+5);
                  //network down then print string
                  if (i1.getStatus().equalsIgnoreCase("down")){
                    g.setColor(Color.red);
                    g.drawString(i1.getStatus(),xx1+20,yy1+20);
                    g.setColor(Color.black);
                  }
                  g.setColor(Color.blue);
                  g.drawString(i2.getNameInt(),xx2+20,yy2+35);
                  g.drawString(i2.getIpAddress(),xx2,yy2+55);
                  //network down then print string
                  if (i2.getStatus().equalsIgnoreCase("down")){
                    g.setColor(Color.red);
                    g.drawString(i2.getStatus(),xx2+20,yy2+70);
                    g.setColor(Color.black);
                  }
                  g.setColor(Color.black);
                }
              }//end adj
            }//end for interface of router2
          }//end for router 2
          if (!adj){//!adj){
            if (Frame1.vRouter.size() == 1){
              if (i1.getStatus().equalsIgnoreCase("down")){
                g.setColor(Color.red);
              }
              g.drawLine(x1,y1-1,x1-80,y1-61);
              g.drawLine(x1,y1,x1-80,y1-60);
              g.drawLine(x1,y1+1,x1-80,y1-59);
              g.setColor(Color.blue);
              g.drawString(i1.getNameInt(),x1-80,y1-15);
              g.drawString(i1.getIpAddress(),x1-100,y1);
              g.setColor(Color.black);
              if (i1.getStatus().equalsIgnoreCase("down")){
                g.setColor(Color.red);
                g.drawString(i1.getStatus(),x1-80,y1+15);
                g.setColor(Color.black);
              }
            }
            else {
              g.drawLine(x1,y1-1,x1-80,y1-61);
              g.drawLine(x1,y1,x1-80,y1-60);
              g.drawLine(x1,y1+1,x1-80,y1-59);
              g.setColor(Color.blue);
              g.drawString(i1.getNameInt(),x1-80,y1-15);
              g.drawString(i1.getIpAddress(),x1-100,y1);
              g.setColor(Color.black);
              if (i1.getStatus().equalsIgnoreCase("down")){
                g.setColor(Color.red);
                g.drawString(i1.getStatus(),x1-80,y1+15);
                g.setColor(Color.black);
              }
            }
          }
        }//end for interface of router1
        try{
          g.drawImage(r1.getImge(),r1.getXPos(),r1.getYPos(),this);
//          System.out.println(rt1.getName());
//          System.out.println("Model="+rt1.getModel()+"\ni="+i+"\ncolor="+r1.getColors());
          g.drawString(rt1.getName(),r1.getXPos(),r1.getYPos()+r1.getHigh());
        }
        catch(Exception e){
        }
//      }
//      catch (Exception exp){
//      }
    }//end for router 1
  }
  void this_mouseDragged(MouseEvent e) {
    if (pressin){
      // in  Frame
      dx = e.getX();
      dy = e.getY();
      if ((dx < this.getWidth()-60) &&(dx >= 0)&& (dy < this.getHeight()-69) && (dy >= 0)){
        //setposition
        rimg.setXPos(e.getX());
        rimg.setYPos(e.getY());
        repaint();
      }
    }
  }
  //-----------------Mouse Released--------------------//
  void this_mouseReleased(MouseEvent e) {
    pressin = false;
  }
  //-------------------Mouse Pressed----------------------//
  void this_mousePressed(MouseEvent e) {
    //Right Click
    if(true){
      int i = 0;
      pressin = false;
      rimg = null;
      while((i < vImg.size()) &&(!pressin)){
        rimg = (RouterImg)vImg.elementAt(i);
        //position at mouse press
        dx = e.getX();
        dy = e.getY();
        if ((dx < rimg.getXPos()+rimg.getWide()) && (dx > rimg.getXPos()) && (dy > rimg.getYPos()) && (dy < rimg.getYPos() + rimg.getHigh())){
          pressin = true;
        }
        i++;
      }
    }
    else {
//      System.out.println("show menu");
    }
  }
  void jClose_actionPerformed(ActionEvent e) {
    Frame1.closeView();
  }
}