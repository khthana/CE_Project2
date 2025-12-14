package ssh;

import java.io.IOException;
import java.util.Hashtable;
import java.util.Enumeration;

public class SSHProtocolPlugin {

  static Hashtable plugins = new Hashtable();

  static {
    SSHProtocolPlugin.addPlugin("general", new SSHProtocolPlugin());
    try {
      SSHProtocolPlugin.addPlugin("ftp", new SSHFtpPlugin());
    } catch (Throwable e) {
      System.out.println("FTP plugin not found, disabled");
    }
  }

  public static SSHProtocolPlugin getPlugin(String name) {
    return (SSHProtocolPlugin)plugins.get(name);
  }

  public static void addPlugin(String name, SSHProtocolPlugin plugin) {
    plugins.put(name, plugin);
  }

  public static void initiateAll(SSHClient client) {
    SSHProtocolPlugin plugin;
    Enumeration e = plugins.elements();
    while(e.hasMoreElements()) {
      plugin = (SSHProtocolPlugin)e.nextElement();
      plugin.initiate(client);
    }
  }

  public void initiate(SSHClient client) {
  }

  public SSHListenChannel localListener(String localHost, int localPort,
					String remoteHost, int remotePort,
					SSHChannelController controller) throws IOException {
    return new SSHListenChannel(localHost, localPort, remoteHost, remotePort, controller);
  }

  public void remoteListener(int remotePort, String localHost, int localPort,
			     SSHChannelController controller) {
  }

}
