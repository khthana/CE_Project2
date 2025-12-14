
package ssh;

import java.io.*;

public interface SSHPdu {
  public void   writeTo(OutputStream out) throws IOException;
  public void   readFrom(InputStream in) throws IOException;
  public SSHPdu createPdu() throws IOException;

  public byte[] rawData();
  public void   rawSetData(byte[] raw);
  public int    rawOffset();
  public int    rawSize();
  public void   rawAdjustSize(int size);

  //  public SSHPdu preProcess();
  //  public SSHPdu postProcess();
}
