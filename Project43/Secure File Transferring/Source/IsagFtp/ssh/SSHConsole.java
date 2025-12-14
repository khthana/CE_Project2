package IsagFtp.ssh;

import IsagFtp.terminal.Terminal;
import IsagFtp.security.Cipher;

public interface SSHConsole {
  public Terminal getTerminal();

  public void stdoutWriteString(byte[] str);
  public void stderrWriteString(byte[] str);

  public void print(String str);
  public void println(String str);

  public void serverConnect(SSHChannelController controller, Cipher sndCipher);
  public void serverDisconnect(String reason);
}
