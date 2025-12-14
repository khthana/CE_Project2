package switchsim;

import java.util.*;

public class Vlan {

  private int vlanID;
  private String vlanName;
  private String status;
  private String type;
  private Vector switchMember = new Vector();
  private Vector interfMember  = new Vector();
  private SpanningTree pvstp = new SpanningTree();

  public Vlan() {
  }
  public Vlan(int id) {
    vlanID = id;
  }
  public Vlan(String n) {
    vlanName = n;
  }
  public Vlan(int id, String n) {
    vlanID = id;
    vlanName = n;
  }

  public void setVlanID(int id) {
    vlanID = id;
  }
  public int getVlanID() {
    return vlanID;
  }

  public void setVlanName(String n) {
    vlanName = n;
  }
  public String getVlanName() {
    return vlanName;
  }

  public SpanningTree getPVSTP() {
    return pvstp;
  }

  public String getPvstpStatus() {
    String str = pvstp.getStatus();
    return str;
  }

  public void del_sw_member(Switch sw) {
    Switch s1 = new Switch();

    for (int i = 0; i < switchMember.size(); i++) {
      s1 = (Switch)switchMember.elementAt(i);
      System.out.println("before del: switch size = " + switchMember.size());
      if ((s1.getMACAddress() == sw.getMACAddress())) {
        switchMember.removeElementAt(i);
        interfMember.removeElementAt(i);
        System.out.println("after del: switch size = " + switchMember.size());
      }
    }
  }

  public void del_interface_member(Switch sw, Interface interf) {
    Switch s1 = new Switch();
    Interface inf = new Interface();

    for (int i = 0; i < switchMember.size(); i++) {
      s1 = (Switch)switchMember.elementAt(i);
      inf = (Interface)interfMember.elementAt(i);
      if ((s1.getMACAddress() == sw.getMACAddress()) && (inf.getNameInt().equals(interf.getNameInt()))) {
        switchMember.removeElementAt(i);
        interfMember.removeElementAt(i);
      }
    }
  }

  public void del_switch(Switch sw) {
    Vlan vlan1 = new Vlan();
    Vlan vlan2 = new Vlan();
    Vector vList = new Vector();
    Switch st = new Switch();
    Interface it = new Interface();

    vList = sw.getVlanList();
    for (int x = 0; x < vList.size(); x++) {
      vlan1 = (Vlan)vList.elementAt(x);
      for (int y = 0; y < Frame1.vVlan.size(); y++) {
        vlan2 = (Vlan)Frame1.vVlan.elementAt(y);
        if(vlan1.getVlanID() == vlan2.getVlanID()) {
          System.out.println("vlan " + vlan2.getVlanID());
          System.out.println("del switch " + sw.getName());
          vlan2.del_sw_member(sw);
          vlan2.del_sw_member(sw);
        }
      }
    }
  }

  public void del_interface(Switch sw, Interface interf) {
    Vlan vlan1 = new Vlan();
    Vlan vlan2 = new Vlan();
    Vector vList = new Vector();
    Switch st = new Switch();
    Interface it = new Interface();

    vList = sw.getVlanList();
    for (int x = 0; x < vList.size(); x++) {
      vlan1 = (Vlan)vList.elementAt(x);
      for (int y = 0; y < Frame1.vVlan.size(); y++) {
        vlan2 = (Vlan)Frame1.vVlan.elementAt(y);
        if(vlan1.getVlanID() == vlan2.getVlanID()) {
          vlan2.del_interface_member(sw,interf);
          vlan2.del_interface_member(sw,interf);
        }
      }
    }
  }

  public boolean isVlanExist(int vid) {
    boolean isExist = false;
    Vlan thisV = new Vlan();

    for (int i = 0; i < Frame1.vVlan.size(); i++) {
      thisV = (Vlan)Frame1.vVlan.elementAt(i);
      if (thisV.getVlanID() == vid) {
        isExist = true;
        i = Frame1.vVlan.size();
      }
    }
    return isExist;
  }

  public Vlan findVlan(int vid) {
    Vlan v = new Vlan();
    Vlan thisOne = new Vlan();

    for (int i = 0; i < Frame1.vVlan.size(); i++) {
      v = (Vlan)Frame1.vVlan.elementAt(i);
      if (v.getVlanID() == vid) {
        thisOne = (Vlan)Frame1.vVlan.elementAt(i);
        i = Frame1.vVlan.size();
      }
    }
    return thisOne;
  }

  public void addMember(Switch sw, Interface interf) {
//    boolean isOld = false;
    Interface newInt = new Interface();
    Interface oldInt = new Interface();
    Switch newSwitch = new Switch();
    Switch oldSwitch = new Switch();

//    System.out.println("receive switch " + sw.getName());
//    System.out.println("receive interface " + interf.getNameInt());

    for (int i = 0; i < switchMember.size(); i++) {
      oldSwitch = (Switch)switchMember.elementAt(i);
      oldInt = (Interface)interfMember.elementAt(i);
      if ((oldSwitch.getName().equals(sw.getName())) && (oldInt.getNameInt().equals(interf.getNameInt()))) {
        newSwitch = (Switch)switchMember.elementAt(i);
        switchMember.removeElementAt(i);

        newInt = (Interface)interfMember.elementAt(i);
        interfMember.removeElementAt(i);
//        isOld = true;
      }
    }

    switchMember.addElement(sw);
    interfMember.addElement(interf);
  }

  public void addSwitch(Switch sw) {
    switchMember.addElement(sw);
  }
  public void addInterface(Interface interf) {
    interfMember.addElement(interf);
  }

  public Vector getSwitchMember() {
    return switchMember;
  }
  public Vector getInterfMem() {
    return interfMember;
  }

/*
  public void addSwitch(Switch sw) {
    boolean isOld = false;
    Switch newSwitch = new Switch();
    Switch oldSwitch = new Switch();
    for (int i = 0; i < switchMember.size(); i++) {
      oldSwitch = (Switch)switchMember.elementAt(i);
      if (oldSwitch.getName().equals(sw.getName())) {
        isOld = true;
//      newSwitch = (Switch)switchMember.elementAt(i);
//      switchMember.removeElementAt(i);
      }
    }
    if (!isOld) {
      switchMember.addElement(sw);
    }
  }
*/

  public void toAddVlan(Switch sw, int id, String n) {
    boolean isOld = false;
    Vlan newVlan = new Vlan();
    Vlan oldVlan = new Vlan();

    for (int i = 0; i < Frame1.vVlan.size(); i++) {
      oldVlan = (Vlan)Frame1.vVlan.elementAt(i);
      if (oldVlan.getVlanID() == id) {
        System.out.println("old vlan = " + oldVlan.getVlanName());
        isOld = true;
//        newVlan = (Vlan)Frame1.vVlan.elementAt(i);
//        Frame1.vVlan.removeElementAt(i);
        oldVlan.addSwitch(sw);
      }
    }
    if (!isOld) {
      newVlan.setVlanID(id);
      newVlan.setVlanName(n);
      System.out.println("new vlan = " + newVlan.getVlanID());
      Frame1.vVlan.addElement(newVlan);
    }
  }
}

/*------------------------------------------------------------------------------
    String n1 = "";
    Vlan temp = new Vlan();

    if (Frame1.vVlan.size() == 0) {
      Frame1.vVlan.addElement(v);
      System.out.println("*** New Vlan = " + v.getVlanID());
    }
    else {
      for (int i = 0; i < Frame1.vVlan.size(); i++) {
        temp = (Vlan)Frame1.vVlan.elementAt(i);
        System.out.println("*** Old Vlan = " + temp.getVlanID());
        if (temp.getVlanID() == v.getVlanID()) {
          i = Frame1.vVlan.size();
        }
        else if (i == Frame1.vVlan.size()) {
          Frame1.vVlan.addElement(v);
          System.out.println("*** New Vlan = " + v.getVlanID());
        }
      }
    }
//------------------------------------------------------------------------------
  public void addMember(Switch sw, Interface interf) {
    boolean isExist = false;
    Interface intMem = new Interface();
    Switch swMem = new Switch();
    Vector vInt = new Vector();

    for (int i = 0; i < switchMember.size(); i++) {
      swMem = (Switch)switchMember.elementAt(i);
      if (swMem.getName().equals(sw.getName())) {
        vInt = sw.getVInt();
        for (int j = 0; j < vInt.size(); j++) {
          intMem = (Interface)vInt.elementAt(i);
          if (intMem.getNameInt().equals(interf.getNameInt())) {
            isExist = true;
            j = vInt.size();
            i = switchMember.size();
          }
        }
      }
    }

    if (!isExist) {
      addSwitch(sw);
      addInterface(interf);
    }
  }


*/