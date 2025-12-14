
package ssh;

import java.util.Random;
import java.io.IOException;

public class SSHFtpPlugin extends SSHProtocolPlugin {

  public void initiate(SSHClient client) {
    client.delRemotePortForward("ftp");
    if(client.havePORTFtp) {
      Random rnd = new Random();
      int rndval;
      while((rndval = (rnd.nextInt() & 0xfff0)) < 8192)
	;
      client.firstFTPPort = rndval;
      for(int i = 0; i < SSHFtpTunnel.MAX_REMOTE_LISTEN; i++) {
	client.addRemotePortForward(client.firstFTPPort + i,
				    SSHFtpTunnel.TUNNEL_NAME + i,
				    client.firstFTPPort + i, "ftp");
      }
    }
  }

  public SSHListenChannel localListener(String localHost, int localPort,
					String remoteHost, int remotePort,
					SSHChannelController controller) throws IOException {
    return new SSHFtpListenChannel(localHost, localPort, remoteHost, remotePort, controller);
  }

}
