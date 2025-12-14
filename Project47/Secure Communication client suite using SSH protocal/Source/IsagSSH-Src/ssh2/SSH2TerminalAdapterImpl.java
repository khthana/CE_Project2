
package ssh2;

import java.io.OutputStream;
import java.io.IOException;

import terminal.Terminal;
import terminal.TerminalWin;
import terminal.TerminalInputChaff;

/**
 * Adapter class which interfaces between terminal windows and ssh2.
 */
public class SSH2TerminalAdapterImpl extends TerminalInputChaff
    implements SSH2TerminalAdapter, SSH2ChannelCloseListener
{
    private TerminalWin        terminal;
    private SSH2SessionChannel session;
    private TerminalOutStream  stdout;
    private boolean            minimumLatency;

    final class TerminalOutStream extends OutputStream {
	public void write(int b) throws IOException {
	    terminal.write((char)b);
	}
	public void write(byte b[], int off, int len) throws IOException {
	    terminal.write(b, off, len);
	}
    }

    /**
     * Constructor.
     *
     * @param terminal Terminal window to use.
     */
    public SSH2TerminalAdapterImpl(TerminalWin terminal) {
	this.terminal = terminal;
	this.stdout   = new TerminalOutStream();
    }

    public Terminal getTerminal() {
	return terminal;
    }

    public void attach(SSH2SessionChannel session) {
	this.session   = session;
	minimumLatency =
	    "true".equals(session.getConnection().getPreferences().
			  getPreference(SSH2Preferences.TERM_MIN_LAT));
	session.changeStdOut(this.stdout);
	terminal.addInputListener(this);
    }

    public void detach() {
	if(terminal != null) {
	    terminal.removeInputListener(this);
	}
	// !!! TODO want to do this ?
	// session.changeStdOut(
    }

    public void startChaff() {
	session.addCloseListener(this);
	super.startChaff();
    }

    public void stopChaff() {
	super.stopChaff();
    }

    public void closed(SSH2Channel channel) {
	stopChaff();
    }

    /**
     * Send an actually typed character.
     *
     * @param c The typed character to send.
     */
    protected void sendTypedChar(int c) {
	if(minimumLatency) {
	    session.stdinWriteNoLatency((int)c);
	} else {
	    try {
		session.getStdIn().write((int)c);
	    } catch (IOException e) {
		session.getConnection().getLog().error(
		    "SSH2TerminalAdapterImpl", "typedChar",
		    "error writing to stdin: " + e.getMessage());
	    }
	}
    }

    /**
     * Send a fake character. Sends a packet which is the same size as
     * a real keypress packet but it contains no data.
     */
    protected void sendFakeChar() {
	/*
	 * 5 bytes of "ignore-payload" makes packet same size as one byte
	 * channel data (i.e. a key-press).
	 */
	byte[] chaff = new byte[] { 1, 2, 3, 4, 5 };
	session.getConnection().getTransport().sendIgnore(chaff);
    }

    /**
     * Send a number of bytes.
     *
     * @param b Array of bytes to send.
     */
    public void sendBytes(byte[] b) {
	try {
	    session.getStdIn().write(b, 0, b.length);
	} catch (IOException e) {
	    session.getConnection().getLog().error("SSH2TerminalAdapterImpl",
					      "sendBytes",
					      "error writing to stdin: " +
					      e.getMessage());
	}
    }

    /**
     * This function should be called by the actual terminal window
     * whenever it is resized.
     */
    public void signalWindowChanged(int rows, int cols,
				    int vpixels, int hpixels) {
	session.sendWindowChange(rows, cols);
    }

}
