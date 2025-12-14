
package ssh;

import java.io.OutputStream;
import java.io.InputStream;
import java.io.IOException;
import java.net.Socket;

import terminal.Terminal;
import util.InputStreamPipe;
import util.OutputStreamPipe;
import sshcommon.SSHConsoleRemote;

public class SSHConsoleClient extends SSHClientUserAdaptor
    implements SSHConsole, SSHConsoleRemote
{
    public final static int DEFAULT_COPY_BUFFER_SZ = 16384;

    protected SSHClient         client;
    protected SSHClientUser     proxyUser;

    protected String sshHost;

    protected InputStreamPipe   inTop;
    protected OutputStreamPipe  inBottom;
    protected OutputStream      stdout;
    protected TerminalOutStream stdin;

    final class TerminalOutStream extends OutputStream {
	public void write(int b) throws IOException {
	    byte[] buf = new byte[1];
	    buf[0] = (byte)b;
	    client.stdinWriteString(buf);
	}
	public void write(byte b[], int off, int len) throws IOException {
	    client.stdinWriteString(b, off, len);
	}
    }

    public SSHConsoleClient(String sshHost, int port,
			    SSHAuthenticator authenticator,
			    SSHInteractor interactor)
	throws IOException
    {
	this(sshHost, port, authenticator, interactor, DEFAULT_COPY_BUFFER_SZ);
    }

    public SSHConsoleClient(String sshHost, int port,
			    SSHAuthenticator authenticator,
			    SSHInteractor interactor, int bufferSize)
	throws IOException
    {
	super(sshHost, port);

	// OUCH: Note must be set before constructing SSHClient since
	// its constructor calls getInteractor to fetch this
	//
	this.interactor = interactor;

	client         = new SSHClient(authenticator, this);
	inTop          = new InputStreamPipe(bufferSize);
	inBottom       = new OutputStreamPipe(inTop);
	stdin          = new TerminalOutStream();
	this.sshHost   = sshHost;

	stdout = inBottom;

	client.setConsole(this);
	client.activateTunnels = false;
    }

    public boolean command(String command) {
	try {
	    client.doSingleCommand(command, true, 0);
	} catch (IOException e) {
	    if(interactor != null) {
		interactor.alert("Error connecting: " + e.getMessage());
	    }
	    return false;
	}
	return true;
    }

    public boolean shell() {
	try {
	    client.bootSSH(false);
	} catch (IOException e) {
	    if(interactor != null) {
		interactor.alert("Error connecting: " + e.getMessage());
	    }
	    return false;
	}
	return true;
    }

    public void close() {
	interactor = null;
	client.forcedDisconnect();
	try {
	    stdout.close();
	} catch (IOException e) {
	    // !!!
	}
    }

    public void changeStdOut(OutputStream out) {
	this.stdout = out;
	inBottom    = null;
	inTop       = null;
    }

    public OutputStream getStdIn() {
	return stdin;
    }

    public InputStream getStdOut() {
	return inTop;
    }

    public void setClientUser(SSHClientUser proxyUser) {
	this.proxyUser = proxyUser;
    }

    public void stdoutWriteString(byte[] str) {
	try {
	    stdout.write(str);
	} catch(IOException e) {
	    try {
		stdout.close();
	    } catch (IOException ee) {
		// !!!
	    }
	    if(interactor != null)
		interactor.alert("Error writing data to stdout-pipe");
	}
    }

    public void stderrWriteString(byte[] str) {
	if(interactor != null)
	    interactor.alert("Remote warning/error: " + new String(str));
    }

    public Terminal getTerminal() {
	return null;
    }
    public void print(String str) {
    }
    public void println(String str) {
    }
    public void serverConnect(SSHChannelController controller,
			      SSHCipher sndCipher) {
    }
    public void serverDisconnect(String reason) {
        try {
            stdout.close();
        } catch (IOException e) {
        }
    }
    public boolean wantPTY() {
	return false;
    }
    public Socket getProxyConnection() throws IOException {
	if(proxyUser != null) {
	    return proxyUser.getProxyConnection();
	}
	return null;
    }

}
