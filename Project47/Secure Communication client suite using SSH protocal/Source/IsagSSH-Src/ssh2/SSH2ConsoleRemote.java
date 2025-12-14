
package ssh2;

import java.io.InputStream;
import java.io.OutputStream;

import sshcommon.SSHConsoleRemote;

import terminal.Terminal;

/**
 * This class implements a console to a remote command or shell. The underlying
 * mechanism is a session channel which is created on demand from the provided
 * connection layer. It can be used to execute single commands and/or control
 * input/output to/from a shell. It is for example extended to control an SCP1
 * client in the class <code>SSH2SCP1Client</code>.
 * <p>
 * To create a <code>SSH2ConsoleRemote</code> instance a complete connected ssh2
 * stack is needed from which one provides the <code>SSH2Connection</code> to
 * the constructor.
 *
 * @see SSH2Connection
 * @see SSH2SimpleClient
 */
public class SSH2ConsoleRemote implements SSHConsoleRemote {

    protected SSH2Connection     connection;
    protected SSH2SessionChannel session;
    protected OutputStream       stdout;
    protected OutputStream       stderr;

    /**
     * Basic constructor.
     *
     * @param connection connected connection layer
     */
    public SSH2ConsoleRemote(SSH2Connection connection) {
	this(connection, null, null);
    }

    /**
     * Constructor to be used to preset the stdout and/or stderr output streams
     * to which the correspondings streams should be redirected to (i.e. the
     * streams doesn't have to be passed to the <code>command()</code> method).
     *
     * @param connection connected connection layer
     * @param stdout the output stream to redirect stdout to (can be null)
     * @param stderr the output stream to redirect stderr to (can be null)
     */
    public SSH2ConsoleRemote(SSH2Connection connection,
			     OutputStream stdout, OutputStream stderr) {
	this.connection = connection;
	this.stdout     = stdout;
	this.stderr     = stderr;
    }

    /**
     * Runs single command on server.
     *
     * @param command command line to run
     *
     * @return a boolean indicating success or failure
     */
    public boolean command(String command) {
	return command(command, this.stdout);
    }

    /**
     * Runs single command on server.
     *
     * @param command command line to run
     * @param pty whether to allocate a pty or not
     *
     * @return a boolean indicating success or failure
     */
    public boolean command(String command, boolean pty) {
	return command(command, this.stdout, pty);
    }

    /**
     * Runs single command on server and redirects stdout to the given
     * <code>OutputStream</code>.
     *
     * @param command command line to run
     * @param stdout the output stream to redirect stdout to
     *
     * @return a boolean indicating success or failure
     */
    public boolean command(String command, OutputStream stdout) {
	return command(command, stdout, this.stderr);
    }

    /**
     * Runs single command on server and redirects stdout to the given
     * <code>OutputStream</code>.
     *
     * @param command command line to run
     * @param stdout the output stream to redirect stdout to
     * @param pty whether to allocate a pty or not
     *
     * @return a boolean indicating success or failure
     */
    public boolean command(String command, OutputStream stdout, boolean pty) {
	return command(command, stdout, this.stderr, pty);
    }

    /**
     * Runs single command on server and redirects stdout to the given
     * <code>OutputStream</code>. This method also redirects stderr to the given
     * <code>OutputStream</code>.
     *
     * @param command command line to run
     * @param stdout the output stream to redirect stdout to (can be null)
     * @param stderr the output stream to redirect stderr to (can be null)
     *
     * @return a boolean indicating success or failure
     */
    public boolean command(String command, OutputStream stdout,
			   OutputStream stderr)
    {
        return command(command, stdout, stderr, false);
    }
    
    /**
     * Runs single command on server and redirects stdout to the given
     * <code>OutputStream</code>. This method also redirects stderr to the given
     * <code>OutputStream</code>.
     *
     * @param command command line to run
     * @param stdout the output stream to redirect stdout to (can be null)
     * @param stderr the output stream to redirect stderr to (can be null)
     * @param pty whether to allocate a pty or not
     *
     * @return a boolean indicating success or failure
     */
    public boolean command(String command, OutputStream stdout,
			   OutputStream stderr, boolean pty) 
    {
        return command(command, stdout, stderr, pty, "dumb", 0, 0);
    }

    /**
     * Runs single command on server and redirects stdout to the given
     * <code>OutputStream</code>. This method also redirects stderr to the given
     * <code>OutputStream</code>.
     *
     * @param command command line to run
     * @param stdout the output stream to redirect stdout to (can be null)
     * @param stderr the output stream to redirect stderr to (can be null)
     * @param pty whether to allocate a pty or not
     * @param termType indicates which terminal type to request
     * @param rows indicates the number of rows on the terminal
     * @param cols indicates the number of columns on the terminal
     *
     * @return a boolean indicating success or failure
     */
    public boolean command(String command, OutputStream stdout,
			   OutputStream stderr, boolean pty, 
                           String termType, int rows, int cols)
    {
	session = connection.newSession();
	if(pty) {
	    if(!session.requestPTY(termType, rows, cols, null)) {
		return false;
	    }
	}
	if(stdout != null) {
	    session.changeStdOut(stdout);
	}
	if(stderr != null) {
	    session.changeStdErr(stderr);
	}
	return session.doSingleCommand(command);
    }

    /**
     * Starts an interactive shell on the server, note that no PTY is allocated.
     *
     * @return a boolean indicating success or failure
     */
    public boolean shell() {
	return shell(false);
    }

    /**
     * Starts an interactive shell on the server. The parameter
     * <code>pty</code> indicates whether to allocate a PTY or not.
     *
     * @param pty indicates whether to allocate a PTY or not
     *
     * @return a boolean indicating success or failure
     */
    public boolean shell(boolean pty) {
        return shell(pty, "dumb", 0, 0);
    }
    
    /**
     * Starts an interactive shell on the server. The parameter
     * <code>pty</code> indicates whether to allocate a PTY or not.
     *
     * @param pty indicates whether to allocate a PTY or not
     * @param termType indicates which terminal type to request
     * @param rows indicates the number of rows on the terminal
     * @param cols indicates the number of columns on the terminal
     *
     * @return a boolean indicating success or failure
     */
    public boolean shell(boolean pty, String termType, int rows, int cols) {
	session = connection.newSession();
	if(pty) {
	    if(!session.requestPTY(termType, rows, cols, null)) {
		return false;
	    }
	}
	if(stdout != null) {
	    session.changeStdOut(stdout);
	}
	if(stderr != null) {
	    session.changeStdErr(stderr);
	}
	return session.doShell();
    }

    /**
     * Start an interactive shell on the server and connect it to the
     * given terminal.
     *
     * @param termAdapter identifies the terminal window to associate
     *                    the shell with.
     *
     * @return a boolean indicating success or failure
     */
    public boolean terminal(SSH2TerminalAdapter termAdapter) {
	Terminal terminal = termAdapter.getTerminal();
	session = connection.newTerminal(termAdapter);
	if(!session.requestPTY(terminal.terminalType(),
			       terminal.rows(),
			       terminal.cols(),
			       null)) {
	    return false;
	}
	return session.doShell();
    }

    
    /**
     * Run a command on the server and connect it to the
     * given terminal.
     *
     * @param termAdapter identifies the terminal window to associate
     *                    the shell with.
     * @param command command line to run
     *
     * @return a boolean indicating success or failure
     */
    public boolean commandWithTerminal(SSH2TerminalAdapter termAdapter, String command) {
	Terminal terminal = termAdapter.getTerminal();
	session = connection.newTerminal(termAdapter);
	if(!session.requestPTY(terminal.terminalType(),
			       terminal.rows(),
			       terminal.cols(),
			       null)) {
	    return false;
	}
	return session.doSingleCommand(command);
    }

    /**
     * Retrieves the exit status reported by the command/shell run. Note that
     * this call blocks until the remote command/shell really exits or the
     * session is canceled (e.g. by calling <code>close()</code>) in which case
     * the status returned will be -1.
     *
     * @return the exit status reported
     */
    public int waitForExitStatus() {
	int status = session.waitForExit();
	if(session != null) {
	    session.waitUntilClosed();
	}
	return status;
    }

    /**
     * Send a BREAK to the remote session 
     *  (see draft-ietf-secsh-break for more information)
     *
     * @param length the BREAK length (ms)
     *
     * @return a boolean indicating success or failure
     */
    public boolean sendBreak(int length) {
        return (session != null) ? session.doBreak(length) : false;
    }

    /**
     * Closes the session channel (i.e. cancels a command/shell in progress if
     * it hasn't already exited).
     */
    public void close() {
	if(session != null) {
	    session.close();
	}
	session = null;
    }

    /**
     * Changes the output stream where stdout is written to in the underlying
     * session channel.
     *
     * @param out new stdout stream
     */
    public void changeStdOut(OutputStream out) {
	session.changeStdOut(out);
    }

    /**
     * Gets the stdout stream of the underlying session channel. Note, this is
     * an input stream since one wants to <b>read</b> from stdout.
     *
     * @return the input stream of stdout stream
     */
    public InputStream getStdOut() {
	return session.getStdOut();
    }

    /**
     * Gets the stdin stream of the underlying session channel. Note, this is
     * an output stream since one wants to <b>write</b> to stdin.
     *
     * @return the input stream of stdout stream
     */
    public OutputStream getStdIn() {
	return session.getStdIn();
    }

}
