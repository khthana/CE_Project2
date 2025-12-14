
package terminal;

public interface TerminalPrinter extends TerminalOutputListener {
    public void printScreen();
    public void startPrinter();
    public void stopPrinter();
}
