package IsagFtp.terminal;

public abstract class TerminalInterpreter {

  protected Terminal term;

  public final static int IGNORE = -1;

  abstract public String terminalType();
  abstract public int interpretChar(char c);

  public void vtReset() {
  }

  public void keyHandler(int virtualKey, int gMode) {
  }

  public void mouseHandler(int x, int y, boolean press, int modifiers) {
  }

  public final void setTerminal(Terminal term) {
    this.term = term;
  }

}
