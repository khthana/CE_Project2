package central;

/**
Buffer that keep data for Assembly
Largeest data is 256 Byte
 */

class HighLayerShareBuffer {

  private int index;
  private boolean writeable;
  private int ID, Flag;
  private String str;
  private HighLayerBuffer canbuffer = new HighLayerBuffer();

  HighLayerShareBuffer() {
    ID = -1;
    str = "";
    index = 0;
    writeable = true;
  }

  public synchronized void setShareData(HighLayerBuffer highbuffer) throws CANException{
    while (!writeable) {
      try {
        wait();                                                                 // wait if buffer is not get yet
      }
      catch (InterruptedException e) {
        e.printStackTrace();
      }
    }
    try {									// Update data
      setID(highbuffer.getID());
      setFlag(highbuffer.getFlag());
      setData(highbuffer.getData());
    }
    catch(CANException e) {
      System.out.println("High Layer Share Buffer throw : " + e);
    }
    setSuccessful();
    notify();                                                                   // Sync to another Thread for wakeup
  }

  public synchronized HighLayerBuffer getShareData() throws CANException{
    while (writeable) {
      try {
        wait();                                                                 // wait if buffer is not get yet
      }
      catch (InterruptedException e) {
        e.printStackTrace();
      }
    }
    String str = "";							        // Get data
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

  private void setFlag(int idflag) {
    idflag &= 0xe0;
    Flag = idflag;
  }

  private int getFlag() {
    return Flag;
  }

  private void setData(String s) throws CANException{
    if (s.length() > 256)
      throw new CANException("High layer Buffer Data is too big");
    else {
      str = s;
    }
  }

  private String getData() throws CANException {
    return str;
  }

  private void setSuccessful() {
    writeable = false;
    index = 0;
  }

  private void getSuccessful() {
    writeable = true;
    ID = -1;
    str = "";
  }

   public boolean writeable() {
     return writeable;
   }

   public boolean readable() {
     return !writeable;
   }
}