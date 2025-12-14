package central;

/**
Buffer that keep data for CAN Protocol
Largest data is 8 Byte
 */

class CANShareBuffer {

  private boolean writeable;
  private int ID, Flag;
  private String str;
  private CANBuffer canbuffer = new CANBuffer();

  CANShareBuffer() {
    ID = -1;
    writeable = true;
    str = "";
  }

  public synchronized void setShareData(CANBuffer canbuffer) throws CANException{
    while (!writeable) {
      try {
        wait();                                                                 // wait if buffer is not get yet
      }
      catch (InterruptedException e) {
        e.printStackTrace();
      }
    }
    try {
      setID(canbuffer.getID());
      setFlag(canbuffer.getFlag());
      setData(canbuffer.getData());
    }
    catch(CANException e) {
      System.out.println("CAN Share Buffer throw : " + e);
    }
    setSuccessful();
    notify();                                                                   // Sync to another Thread for wakeup
  }

  public synchronized CANBuffer getShareData() throws CANException{
    while (writeable) {
      try {
        wait();                                                                 // wait if buffer is not set yet
      }
      catch (InterruptedException e) {
        e.printStackTrace();
      }
    }
    canbuffer.setID(getID());
    canbuffer.setFlag(getFlag());
    canbuffer.setData(getData());
    getSuccessful();
    notify();                                                                   // Sync to another Thread for wakeup
    return canbuffer;
  }

  private void setID(int id) {
    ID = id;
  }

  private int getID() {
    return ID;
  }

  private void setFlag(int idflag){
    idflag &= 0xe0;
    Flag = idflag;
  }

  private int getFlag() {
    return Flag;
  }

  private void setData(String s) throws CANException{
    if (s.length() > 8)
      throw new CANException("CAN Share Buffer Data is too long");
    else
      str = s;
  }

  private String getData() {
    return str;
  }

  private void setSuccessful() {
    writeable = false;
  }

  private void getSuccessful() {
    ID = -1;
    str = "";
    writeable = true;
  }

  public boolean writeable() {
    return writeable;
  }

  public boolean readable() {
    return !writeable;
  }
}