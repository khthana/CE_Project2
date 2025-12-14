
package ssh;

import java.io.IOException;
import java.net.Socket;

public class SSHClientUserAdaptor implements SSHClientUser {

  protected String sshHost;
  protected int    sshPort;
  protected SSHInteractor interactor;

  public SSHClientUserAdaptor(String server, int port) {
    this.sshHost = server;
    this.sshPort = port;
    this.interactor = null;
  }

  public SSHClientUserAdaptor(String server) {
    this(server, SSH.DEFAULTPORT);
  }

  public String getSrvHost() {
    return sshHost;
  }

  public int getSrvPort() {
    return sshPort;
  }

  public Socket getProxyConnection() throws IOException {
    return null;
  }

  public String getDisplay() {
    return "";
  }

  public int getMaxPacketSz() {
    return 0;
  }

  public int getAliveInterval() {
    return 0;
  }

  public int getCompressionLevel() {
    return 0;
  }

  public boolean wantX11Forward() {
    return false;
  }

  public boolean wantPTY() {
    return false;
  }

  public SSHInteractor getInteractor() {
      return interactor;
  }

}
