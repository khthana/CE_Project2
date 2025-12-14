package central;

/**
Buffer that keep data from CAN Protocol
Largest frame is 8 Byte
 */

class CANBuffer {

  private int ID, Flag;
  private String str;

  CANBuffer() {
    ID = -1;
    Flag = 0;
    str = "";
  }

  public void setID(int id) {
    ID = id;
  }

  public int getID() {
    return ID;
  }

  public void setFlag(int idflag) {
    idflag &= 0xe0;
    Flag = idflag;
  }

  public int getFlag() {
    return Flag;
  }

  public void setData(String s) throws CANException{
    if (s.length() > 8)
      throw new CANException("CANBuffer Data is too Big");
    else
      str = s;
  }

  public String getData() {
    return str;
  }
}