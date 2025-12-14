package IsagFtp.terminal;

import java.io.IOException;

public interface TerminalListener {
  public void typedChar(char c) throws IOException;
  public void sendBytes(byte[] b) throws IOException;
  public void signalWindowChanged(int rows, int cols, int vpixels, int hpixels);
}
