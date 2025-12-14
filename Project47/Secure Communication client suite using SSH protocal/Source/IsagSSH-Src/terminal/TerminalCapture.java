
package terminal;

import java.io.OutputStream;
import java.io.IOException;

public final class TerminalCapture implements TerminalOutputListener {

    private OutputStream captureTarget;
    private Terminal     terminal;

    public TerminalCapture(OutputStream captureTarget) {
	this.captureTarget = captureTarget;
    }

    public void startCapture(Terminal terminal) {
	this.terminal = terminal;
	terminal.addOutputListener(this);
    }

    public void endCapture() {
	terminal.removeOutputListener(this);
    }

    public OutputStream getTarget() {
	return captureTarget;
    }

    public void write(char c) {
	write(new byte[] { (byte)c }, 0, 1);
    }

    private void write(byte[] c, int off, int len) {
	try {
	    captureTarget.write(c, off, len);
	} catch (IOException e) {
	    // !!! TODO report this to someone...
	}
    }

}
