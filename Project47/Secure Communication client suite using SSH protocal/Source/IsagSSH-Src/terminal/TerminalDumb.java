
package terminal;

public final class TerminalDumb extends TerminalInterpreter {

  public String terminalType() {
    return "DUMB";
  }

  public int interpretChar(char c) {
    switch(c) {
    case 7: // BELL
      term.doBell();
      break;
    case 8: // BS/CTRLH
      term.doBS();
      break;
    case '\t':
      term.doTab();
      break;
    case '\r':
      term.doLF();
      break;
    case '\n':
      term.doCR();
      break;
    default:
      return (int)c;
    }
    return IGNORE;
  }

}
