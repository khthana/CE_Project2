package IsagFtp.ssh;

import java.io.*;
import java.math.BigInteger;

public class SSHDataOutputStream extends DataOutputStream {

  SSHDataOutputStream(OutputStream out) {
    super(out);
  }

  public void writeBigInteger(BigInteger bi) throws IOException {
    short bytes = (short)((bi.bitLength() + 7) / 8);
    byte[] raw  = bi.toByteArray();
    writeShort(bi.bitLength());
    if(raw[0] == 0)
      write(raw, 1, bytes);
    else
      write(raw, 0, bytes);
  }

  public void writeString(String str) throws IOException {
    byte[] raw = str.getBytes();
    writeInt(raw.length);
    write(raw);
  }
}
