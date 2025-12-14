

public class DataFromServer
{
  byte[] data;
  int    dataID;

  public DataFromServer(byte[] data,int dataID)
  {
     this.data=data;
     this.dataID=dataID;
  }

  public byte[] getData()
  {
    return data;
  }

  public int getID()
  {
    return dataID;
  }

} 