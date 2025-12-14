

package ssh;

import java.net.*;
import java.io.*;

public interface SSHClientUser {
  public String  getSrvHost() throws IOException;
  public int     getSrvPort();
  public Socket  getProxyConnection() throws IOException;
  public String  getDisplay();
  public int     getMaxPacketSz();
  public int     getAliveInterval();
  public int     getCompressionLevel();

  public boolean wantX11Forward();
  public boolean wantPTY();

  public SSHInteractor getInteractor();
}
