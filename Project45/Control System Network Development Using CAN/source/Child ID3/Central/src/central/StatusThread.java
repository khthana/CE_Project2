package central;

import java.util.Date;

/**
Thread that show Node status on network
*/

class StatusThread extends Thread {						// Thread thad handle Device Status on network

  private HighLayerBuffer buffer;
  private String str = "";
  private String nowtime;

  StatusThread(String str) {
    super(str);
  }
  public void run() {
    while(true) {
      try {
        buffer = MainFrame.RAx[1].getShareData();				// RAx[1] for only Status Thread
        if ((buffer.getFlag() & 0x40) == 0x40) {				// Do when receive data is a status frame
          str = buffer.getData();
          if ((int)str.charAt(2) == 0) {
            MainFrame.statustab.setDeviceStatus( buffer.getID(), (int) str.charAt(3));
          }
          int MainStatus = 0x01;
          if (CANThread.getCANActive() == 0) {
            MainStatus |= 0x02;
          }
          else if (CANThread.getCANActive() == 1){
            MainStatus |= 0x04;
          }
          MainFrame.statustab.setDeviceStatus(0x00, MainStatus);
          Date now = new Date();
          nowtime = now.toString();
          nowtime = nowtime.substring(11, 19);
          StatusTab.moduletime[buffer.getID() - 1] = nowtime;
          MainFrame.statustab.repaint();	                                // Repaint GUI
        }
      }
      catch(Exception e) {
        System.out.println("Status Thread throw : " + e);
      }
    }
  }
}