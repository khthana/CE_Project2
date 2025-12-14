package terminal;

public interface TerminalInputListener {
    public void typedChar(char c);
    public void sendBytes(byte[] b);
    public void signalWindowChanged(int rows, int cols,
				    int vpixels, int hpixels);
}
