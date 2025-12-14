package IsagFtp.ssh;

import java.io.*;
import java.math.BigInteger;

public class SSHDataInputStream extends DataInputStream {

  SSHDataInputStream(InputStream in) {
    super(in);
  }

  public BigInteger readBigInteger() throws IOException {
    short  bits = readShort();
    byte[] raw  = new byte[(bits + 7) / 8 + 1];

    raw[0] = 0;
    read(raw, 1, raw.length - 1);

    return new BigInteger(raw);
  }

  public String readString() throws IOException {
    int    len = readInt();
    byte[] raw = new byte[len];
    read(raw, 0, raw.length);
    return new String(raw);
  }

  public byte[] readStringAsBytes() throws IOException {
    int    len = readInt();
    byte[] raw = new byte[len];
    read(raw, 0, raw.length);
    return raw;
  }

}
