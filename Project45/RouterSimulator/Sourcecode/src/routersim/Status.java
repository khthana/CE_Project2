package routersim;

import java.awt.*;
import javax.swing.*;
import javax.swing.JTabbedPane;
import javax.swing.JOptionPane;
import com.borland.jbcl.layout.*;
import java.lang.Thread;
import java.util.*;
import java.util.Vector;

public class Status implements java.io.Serializable{

  static String name= "Router";
  static String Name ;
  static Router rt = new Router();
  static String Rname;
  static String s;
  static String s1="";

  static String Name_Int;
  static String IP_Addr;
  static String Net_Addr;
  static String Type;

  public Status() {
    try {
      jbInit();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }
  public Status(Router r) {
  try {
    jbInit1(r);
  }
  catch(Exception ex) {
    ex.printStackTrace();
  }
  }
  public Status(String s) {
   try {

     showInt();
     jbInit();
   }
   catch(Exception ex) {
     ex.printStackTrace();
   }
  }
  void jbInit() throws Exception {
           s ="Label : "+rt.getName()+"\n";
           s+="Model : "+rt.getModel()+"\n";
           Rname = s;
  }
  void jbInit1(Router r) throws Exception {
          s ="Label : "+r.getName()+"\n";
          s+="Model : "+r.getModel()+"\n";
          Rname = s;
  }
  static String getRname(){
    return Rname;
  }
  static void setInt(Router router){
  rt = router;
  }
  static void showInt(){
    for(int i=0;i<rt.getVInt().size();i++)
    {
    Interface intf = (Interface)rt.getVInt().elementAt(i);
    String s =  intf.getType() +":"+ " " + intf.getNameInt() + "  " + intf.getIpAddress() + "  "+intf.getStatus()+"\n";
    s1=s1+s;
    }
  }
  static  void setStatus(Router router){
   rt= router;
  }

}