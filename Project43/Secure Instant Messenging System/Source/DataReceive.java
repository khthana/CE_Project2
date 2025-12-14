

public class DataReceive
{
  short  type=0;
  String message;
  String fileName;
  int    fileSize;
  boolean fileAbort=false;

  DataReceive(short type)
  {
      this.type=type;
  }

  public void setMessage(String message)
  {
      this.message=message;
  }

  public void setFileName(String fileName)
  {
      this.fileName=fileName;
  }

  public void setFileSize(int fileSize)
  {
      this.fileSize=fileSize;
  }

  public String getMessage()
  {
      return message;
  }

  public String getFileName()
  {
      return fileName;
  }

  public int getFileSize()
  {
      return fileSize;
  }

  public short getDataType()
  {
      return type;
  }
}