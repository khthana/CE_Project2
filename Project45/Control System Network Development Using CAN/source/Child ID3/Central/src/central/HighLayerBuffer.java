package central;

/**
Buffer that keep data for Assembly
Largeest Data is 256 Byte
 */

class HighLayerBuffer {

  private int ID, Flag;
  private String str;

  HighLayerBuffer() {
    ID = -1;
    str = "";
    ID = 0;
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
    if (s.length() > 256)
      throw new CANException("PBuffer Data is too big");
    else {
      str = s;
    }
  }

  public String getData(){
    return str;
  }
}