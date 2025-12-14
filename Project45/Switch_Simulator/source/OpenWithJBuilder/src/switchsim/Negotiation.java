package switchsim;

/**
 * Title:        Switch Simulator
 * Description:
 * Copyright:    Copyright (c) 2003
 * Company:      ISAG
 * @author ammii
 * @version 1.0
 */

public class Negotiation extends Thread {
  boolean done = false;
  Interface inf;

  public Negotiation(Interface i) {
    inf = i;
  }

  public void run() {
    if (!done) {
      System.out.println("Negotiation is running...");
      try {
        sleep(60000);
      }
      catch (Exception exp) {}
      System.out.println("Negotiation is checking...");
      if (inf.getSwitch()!=null) {
        Switch sw1 = null;
        boolean found = false;
        for (int i=0; i<Frame1.vSwitch.size(); i++) {
          Switch sw = (Switch)Frame1.vSwitch.elementAt(i);
          for (int j=0; j<sw.getVIntSwitch().size(); j++) {
            Interface inf_tmp = (Interface)sw.getVIntSwitch().elementAt(j);
            if (inf_tmp.equals(inf)) {
              sw1 = sw;
              found = true;
            }
          }
        }
        for (int i=0; i<Frame1.vSwitch.size(); i++) {
          Switch sw = (Switch)Frame1.vSwitch.elementAt(i);
          if (sw.equals(inf.getSwitch())) {
            for (int j=0; j<sw.getVIntSwitch().size(); j++) {
              Interface inf_tmp = (Interface)sw.getVIntSwitch().elementAt(j);
              if ((found) && (inf_tmp.getSwitch().equals(sw1)) && (inf_tmp.getVLANLink()!=1)) {
                inf.setVLANLink(2);
                System.out.println("[1] Trunk is Error..");
              }
            }
          }
        }
      }
      else if (inf.getCom()!=null) {
        inf.setVLANLink(2);
        System.out.println("[2] Trunk is Error..");
      }
      done = true;
      System.out.println("Negotiation finish...");
    }
  }
}