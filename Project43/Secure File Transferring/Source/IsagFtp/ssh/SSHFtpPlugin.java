package IsagFtp.ssh;

import java.util.Random;
import java.io.IOException;

public class SSHFtpPlugin extends SSHProtocolPlugin {

  public void initiate(SSHClient client) {

    if(client.havePORTFtp) {
      Random rnd = new Random();
      int rndval;
      while((rndval = (rnd.nextInt() & 0xfff0)) < 8192)
	;
      client.firstFTPPort = rndval;

    }
  }

  public SSHListenChannel localListener(String localHost, int localPort,
					String remoteHost, int remotePort,
					SSHChannelController controller) throws IOException {
    return new SSHFtpListenChannel(localHost, localPort, remoteHost, remotePort, controller);
  }

}
