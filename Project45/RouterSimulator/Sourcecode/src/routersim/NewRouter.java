package routersim;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 *///
import javax.swing.*;
import javax.swing.event.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.border.*;
import java.lang.String;
import java.util.Enumeration;

import java.util.*;
import java.util.Vector;
import java.io.WriteAbortedException;
import java.io.NotSerializableException;
import java.rmi.UnmarshalException;

public class NewRouter  implements java.io.Serializable{

static  Vector vRouter = new Vector();
static Vector vStatus = new Vector();
static Vector vPanel = new Vector();
static Vector numberOfWire = new Vector();
static Vector[][] pathx;
static int senderNumber;
static int type=0;
static String name="";
static boolean singleMode;
static int maxRouter = 30;
static int number = 1;
static String Rname="";
static Router r1 = new Router();
static Router rt = new Router();


  public NewRouter(int model) {
    type = model;
    jnewinit(model);
  }
  public NewRouter(){

  }

  public void jnewinit(int model) {
    singleMode = false;
    senderNumber = -1;
    int type = model;
    if (type != 0){
      if (vRouter.size() < maxRouter){
        boolean dup = true;
        boolean found = false;
        String name="";
        int i=1;
        while(dup){
          name = "Router" + i;
          found = false;
          System.out.println("at here");
          for(int a=0; a < NewRouter.vRouter.size(); a++){
            String alreadyName = ((Router)NewRouter.vRouter.elementAt(a)).getName();
            System.out.println("**********************************");
            System.out.println("vRoutersize:"+NewRouter.vRouter.size());
            if (alreadyName.equalsIgnoreCase(name)){
              found = true;
            }//end if
          }//end for
          i++;
          dup = found;
        }//end while
        number++;
        Router r1 = new Router(name);
        Rname = name;
        r1.setModel(model);
        // set status_detail
        Status st = new Status();
        st.setInt(r1);
        rt = r1;
        st.s1="";
        NewRouter.vRouter.addElement(r1);
        System.out.print("VRouter:  "+vRouter.size());
        RouterImg rModel = new RouterImg(model);
        switch (model){
          case 1 : r1.setMaxEth(1);
            r1.setMaxSerial(2);
            r1.setMaxToken(0);
            break;
          case 2 : r1.setMaxEth(0);
            r1.setMaxSerial(2);
            r1.setMaxToken(1);
            break;
          case 3 : r1.setMaxEth(1);
            r1.setMaxSerial(1);
            r1.setMaxToken(2);
            break;
          case 4 : r1.setMaxEth(2);
            r1.setMaxSerial(2);
            r1.setMaxToken(0);
            break;
          case 5 : r1.setMaxEth(0);
            r1.setMaxSerial(2);
            r1.setMaxToken(2);
            break;
          case 6 : r1.setMaxEth(10);
            r1.setMaxSerial(10);
            r1.setMaxToken(10);
            break;
          default : break;
        }
        r1.initialInterface();
        Status.setStatus(r1);
      }
    }
  }
  static void setR(Router r){
    r1=r;
  }
  static String getRname(){
    return Rname;
  }
  static int getType(){
    return type;
  }
  static Router getR(){
    return rt;
  }
  public void NewFramer(String name,int model)
  {
    Router r1 = new Router(name);
    Status st = new Status();
    r1.setModel(model);
    st.setInt(r1);
    rt = r1;
    st.s1="";
    NewRouter.vRouter.addElement(r1);
    RouterImg rModel = new RouterImg(model);
    switch (model){
      case 1 : r1.setMaxEth(1);
        r1.setMaxSerial(2);
        r1.setMaxToken(0);
        break;
      case 2 : r1.setMaxEth(0);
        r1.setMaxSerial(2);
        r1.setMaxToken(1);
        break;
      case 3 : r1.setMaxEth(1);
        r1.setMaxSerial(1);
        r1.setMaxToken(2);
        break;
      case 4 : r1.setMaxEth(2);
        r1.setMaxSerial(2);
        r1.setMaxToken(0);
        break;
      case 5 : r1.setMaxEth(0);
        r1.setMaxSerial(2);
        r1.setMaxToken(2);
        break;
      case 6 : r1.setMaxEth(10);
        r1.setMaxSerial(10);
        r1.setMaxToken(10);
        break;
      default : break;
    }
    // -- Initial Interface  ... for wiredialog
    r1.initialInterface();
    Status.setStatus(r1);
  }
  static Vector getvRouter()
  {
    return vRouter;
  }
  static void SingleMode(){
    //--------------Use Single Mode-----------------//
    if (singleMode){
      for (int a=0;a < NewRouter.vRouter.size(); a++){
        Router rout = (Router)NewRouter.vRouter.elementAt(a);
        if (rout.getFlag() == 'r'){
          Rip ripf = (Rip)rout.getRIP();
          if (ripf.isAlive()){
            ripf.stop();
//            System.out.println(rout.getName()+" is stop at single mode");
          }//suspend all
        }//flag 'r'
        else if(rout.getFlag() == 'o'){
          Ospf ospff = (Ospf)rout.getOSPF();
          if (ospff.isAlive()){
//            ospff.stop();
            ospff.suspend();
//            System.out.println(rout.getName()+" is stop at single mode");
          }//suspend all
        }//flag o
      }
//      System.out.println("select");
    }//use singlemode
  }
  static void NormalMode(){
    //-------------Use Normal Mode------------------//
    if(!singleMode){
      singleMode = false;
      for (int a=0;a < NewRouter.vRouter.size(); a++){
        Router rout = (Router)NewRouter.vRouter.elementAt(a);
        if (rout.getFlag() == 'r'){
          Rip ripf = new Rip(rout);
          if(ripf.isAlive()){
            ripf.resume();
//            System.out.println(rout.getName()+" resume single mode");
          }
          else{
            ripf.start();
//            System.out.println(rout.getName()+" start single mode");
          }
        }
        else if (rout.getFlag() == 'o'){
          Ospf ospff = (Ospf)rout.getOSPF();
          ospff.run();
//          System.out.println(rout.getName()+" run single mode");
        }//flag o
      }//router
//      System.out.println("not select");
    }
  }
  static void Next_Step(){
    if(NewRouter.vRouter.size() !=0){
      if(singleMode){
        inc();
        Router sender = (Router)NewRouter.vRouter.elementAt(senderNumber);
        while(sender.getFlag() != 'r'){
          inc();
          sender = (Router)NewRouter.vRouter.elementAt(senderNumber);
        }
        if (sender.getFlag() == 'r'){
          Rip ripf = (Rip)sender.getRIP();
          if (ripf.isAlive()){
            ripf.suspend();
          }//alive
          ripf.run();

        }//flag 'r'
        else if (sender.getFlag() == 'o'){
        }
      }//single mode
    }//end if
  }
  static void setSingleMode(boolean yes){
    singleMode = yes;
  }
  static int getsenderNumber(){
    return senderNumber;
  }

  static void inc(){
    senderNumber++;
    if (senderNumber == NewRouter.vRouter.size()){
      senderNumber=0;
    }
  }
  public void DeleteRouter(int index)
  {
    if(index > NewRouter.vRouter.size()){}
    else
    {
      Router r =(Router)NewRouter.vRouter.elementAt(index);
      if(r.getFlag()=='o') //|| (r.getFlag()=='r'))
      {
        Ospf ospff = (Ospf)r.getOSPF();
        //ospff.suspend();
        ospff.stop();
      }
      if(r.getFlag()=='r') //|| (r.getFlag()=='r'))
      {
        Rip ripf = (Rip)r.getRIP();
        //ripf.suspend();
        ripf.stop();
      }
      NewRouter.vRouter.removeElementAt(index);
    }
  }

}