package IsagFtp.ssh;

import java.io.IOException;
import java.net.Socket;

public class SSHFtpListenChannel extends SSHListenChannel {

  public SSHFtpListenChannel(String localHost, int localPort, String remoteHost, int remotePort,
			     SSHChannelController controller)
    throws IOException {
    super(localHost, localPort, remoteHost, remotePort, controller);
  }

  public SSHTunnel newTunnel(Socket ioSocket, int channelId, int remoteChannelId,
			     SSHChannelController controller) throws IOException {
    return new SSHFtpTunnel(ioSocket, channelId, remoteChannelId, controller);
  }

}
