
package ssh;

import terminal.Terminal;

public interface SSHConsole {
  public Terminal getTerminal();

  public void stdoutWriteString(byte[] str);
  public void stderrWriteString(byte[] str);

  public void print(String str);
  public void println(String str);

  public void serverConnect(SSHChannelController controller,
			    SSHCipher sndCipher);
  public void serverDisconnect(String reason);
}
