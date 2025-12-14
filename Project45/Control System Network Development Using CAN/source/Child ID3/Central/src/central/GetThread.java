package central;

/**
Provide only complete packet from Assembly Thread to Application Bufer (RAx)
*/

class GetThread extends Thread{

  private HighLayerBuffer buffer;

  GetThread(String s) {
    super(s);
    MainFrame.getthreadtxt.setText("running");
  }

  public void run() {
    while (true)
    {
      MainFrame.getthreadtxt.setText("wait");
      try {
        buffer = MainFrame.RBx.getShareData();                                  // get data from RBx Share buffer
        MainFrame.getthreadtxt.setText("running");
        buffer.setData(TrimPad(buffer));                                        // Trim Padding
        if (TryChecksum(buffer)) {                                              // calculate checksum
//          TryChangBus(buffer);
          for (int i = 0; i < MainFrame.RAx.length; i++) {
            MainFrame.RAx[i].setShareData(buffer);                              // copy data to Application
          }
        }
        else {
          if (buffer.getID() == 1 || buffer.getID() == 2 || buffer.getID() == 3) {
            MainFrame.messagestatus.setText(MainFrame.messagestatus.getText() + "Data Error Message ID " + (buffer.getID() | 0x80) + " Frame number " + AcknowledgeThread.sequence[buffer.getID() - 1].getValue() + "\n");
            MainFrame.sendstatus.sendStatus(buffer.getID(), 0x01, MainFrame.acknowledgethread.sequence[buffer.getID() - 1].getValue());
          }
        }
      }
      catch(Exception e)
      {
        System.out.println("Get Thread throw : " + e);
      }
    }
  }

  private boolean TryChecksum(HighLayerBuffer buffer) {
    boolean correct = false;
    int sum = 0;
    int length = buffer.getData().length();
    String data = buffer.getData();
    if (((buffer.getFlag()) & 0x7f) == 0x00) {                                  // Checksum for data frame
      sum += (int) data.charAt(0);
      sum += (((int) data.charAt(1)) * 256);
      for (int i = 2; i < length; i++)
      {
        try {
          sum += (int) data.charAt(i);
          sum &= 0x0ffff;
        }
        catch(Exception e) {
          System.out.println("TryChecksum in Get Thread throw : " + e);
        }
      }
    }
    else {                                                                      // // Checksum for status frame
      sum += (((int) data.charAt(0)) * 256);
      for (int i = 1; i < length; i++)
      {
        try {
          sum += (int) data.charAt(i);
          sum &= 0x0ffff;
        }
        catch(Exception e) {
          System.out.println("TryChecksum in Get Thread throw : " + e);
        }
      }
    }
    if (sum == 0)
      correct = true;
    return correct;
  }

  private String TrimPad(HighLayerBuffer buffer) {
    String str = "";
    if ((buffer.getFlag() & 0x40) == 0x00) {
      str = buffer.getData().substring(0, ((int)buffer.getData().charAt(0)) + 3);
    }
    else {
//        if (((int)buffer.getData().charAt(1)) != 5 || ((int)buffer.getData().charAt(1)) != 6) {
      str = buffer.getData().substring(0, 4);
//        }
//        else {
//          str = buffer.getData().substring(0, 10);
//        }
    }
    return str;
  }
}