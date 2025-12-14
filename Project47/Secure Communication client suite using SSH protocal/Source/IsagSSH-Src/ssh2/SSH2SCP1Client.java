
package ssh2;

import java.io.File;
import java.io.OutputStream;

import sshcommon.SSHSCP1;

/**
 * Creates a window in which gives us a command-line interface to scp1.
 */
public final class SSH2SCP1Client extends SSH2ConsoleRemote {

    private SSHSCP1 scp1;

    /**
     * @param cwd Name of current working directory.
     * @param connection Connection object to run over.
     * @param stderr Stream to output error messages on
     * @param verbose Verbose flag
     */
    public SSH2SCP1Client(File cwd, SSH2Connection connection,
			  OutputStream stderr, boolean verbose) {
	super(connection, null, stderr);
	this.scp1 = new SSHSCP1(cwd, this, verbose);
    }

    /**
     * Get the underlying <code>SSHSCP1</code> object.
     */
    public SSHSCP1 scp1() {
	return scp1;
    }

}
