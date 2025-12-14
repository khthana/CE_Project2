package central;

import javax.swing.*;

/**
Thread that snoop packat on networkThread that provide
*/

class SnoopThread extends Thread{

  private HighLayerBuffer highbuffer;

  SnoopThread(String s) {
    super(s);
  }

  public void run() {
    while (true)
    {
      try {
        highbuffer = MainFrame.RAx[0].getShareData();		                // Get Share data RAx[0] for only Snoop Thread
      }
      catch(Exception e) {
        System.out.println("Snoop Thread throw : " + e);
      }
      if (SnoopTab.fidtxt.isEditable()) {					// If user enable ID filter
        int ID = -1;
        try {
          ID = Integer.parseInt(SnoopTab.fidtxt.getText());
        }
        catch(Exception e) {
          System.out.println("Snoop Thread throw : " + e);
        }
        if (ID == highbuffer.getID()) {
          if ((highbuffer.getFlag() & 0x40) == 0x00) {		                // For Data frame
            SnoopTab.ridtxt.setText(Integer.toString(highbuffer.getID()));
            SnoopTab.rtypetxt.setText("");
            SnoopTab.rlengthtxt.setText(Integer.toString(highbuffer.getData().charAt(0)));
            int checksum = ((int) highbuffer.getData().charAt(1) * 256) + (int) highbuffer.getData().charAt(2);
            SnoopTab.rchecksumtxt.setText(Integer.toString(checksum));
            SnoopTab.rdatatxt.setText(highbuffer.getData().substring(3, ((int)highbuffer.getData().charAt(0)) + 3));
          }
          else {								// For Status frame
            SnoopTab.ridtxt.setText(Integer.toString(highbuffer.getID()));
            int checksum = ((int) highbuffer.getData().charAt(0) * 256) + (int) highbuffer.getData().charAt(1);
            SnoopTab.rchecksumtxt.setText(Integer.toString(checksum));
            SnoopTab.rtypetxt.setText(Integer.toString(highbuffer.getData().charAt(2)));
            SnoopTab.rcodetxt.setText(Integer.toString(highbuffer.getData().charAt(3)));
            SnoopTab.rlengthtxt.setText("");
            SnoopTab.rdatatxt.setText("");
          }
        }
        else {
          SnoopTab.ridtxt.setText("");
          SnoopTab.rchecksumtxt.setText("");
          SnoopTab.rtypetxt.setText("");
          SnoopTab.rlengthtxt.setText("");
          SnoopTab.rdatatxt.setText("");
        }
      }
      else {									// For ID Filter Disable
        if ((highbuffer.getFlag() & 0x40) == 0x00) {		                // For Data frame
          SnoopTab.ridtxt.setText(Integer.toString(highbuffer.getID()));
          SnoopTab.rtypetxt.setText("");
          SnoopTab.rlengthtxt.setText(Integer.toString(highbuffer.getData().charAt(0)));
          int checksum = ((int) highbuffer.getData().charAt(1) * 256) + (int) highbuffer.getData().charAt(2);
            SnoopTab.rchecksumtxt.setText(Integer.toString(checksum));
          SnoopTab.rdatatxt.setText(highbuffer.getData().substring(3, highbuffer.getData().length()));
        }
        else {									// For status frame
          SnoopTab.ridtxt.setText(Integer.toString(highbuffer.getID()));
          int checksum = ((int) highbuffer.getData().charAt(0) * 256) + (int) highbuffer.getData().charAt(1);
          SnoopTab.rchecksumtxt.setText(Integer.toString(checksum));
          SnoopTab.rtypetxt.setText(Integer.toString(highbuffer.getData().charAt(2)));
          SnoopTab.rcodetxt.setText(Integer.toString(highbuffer.getData().charAt(3)));
          SnoopTab.rlengthtxt.setText("");
          SnoopTab.rdatatxt.setText("");
        }
      }
    }
  }
}