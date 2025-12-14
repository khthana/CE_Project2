package switchsim;

import java.util.*;
import java.lang.String.*;

public class Generate {

  private Random r = new Random();
  private String mac;

  private boolean unique;
  private int temp0,temp1;
//  private final int num = 14;

  public Generate() {
    temp0 = temp1 = 0;
    unique = false;
  }

  public String genMAC(Vector allMAC) {
    boolean dup;
    do {
      mac = "";
      for (int i=0; i<12; i++) {													// MAC address has 12 digits.
	if ((i%4==0)&&(i!=0))
	  mac=mac+".";														// MAC address has point (.) between 4 digits.
	temp0=r.nextInt(16);
	switch(temp0) {
	  case 10 : mac=mac+"a"; break;
	  case 11 : mac=mac+"b"; break;
          case 12 : mac=mac+"c"; break;
	  case 13 : mac=mac+"d"; break;
	  case 14 : mac=mac+"e"; break;
	  case 15 : mac=mac+"f"; break;
	  default : mac=mac+Integer.toString(temp0);
	}       // end switch
      }         // end for i
      dup = checkMAC(mac, allMAC);
//      System.out.println("checkmac = " + dup);
      if (dup==false) {
        unique = true;
      }
    } while(!unique);
    return mac;
  }       // end genMAC

  public boolean checkMAC(String m, Vector allMAC) {
    boolean dup = false;
    String temp = "";
    int count;

    for (int i = 0; i < allMAC.size(); i++) {
      count = 0;
      temp = (String)allMAC.elementAt(i);
      for (int k=0; k < 14; k++) {
	if ((k != 4) && (k != 9)) {
	  if (temp.charAt(k) != m.charAt(k)) {
	    k = 14;
	  }
	else if (temp.charAt(k) == m.charAt(k))
	  count++;
	}     // end if k
      }       // end for k
      if (count == 12) {
//        System.out.println("This new mac address is not unique.");
        dup = true;
        i = allMAC.size();
      }
      else if (count < 12) {
//	 System.out.println("This new mac address is unique.");
         dup = false;
      }
    }         // end for i
    if (dup == false)
      allMAC.addElement(m);
    return dup;
  }     // end checkMAC()
}

