
package ssh;

import java.io.File;
import java.io.IOException;

import sshcommon.SSHSCP1;

public class SSHSCPClient extends SSHConsoleClient {

    private SSHSCP1 scp1;

    public SSHSCPClient(String sshHost, int port,
			SSHAuthenticator authenticator,
			SSHInteractor interactor,
			File cwd, boolean verbose)
	throws IOException
    {
	super(sshHost, port, authenticator, interactor,
	      SSHSCP1.DEFAULT_COPY_BUFFER_SZ);
	this.scp1 = new SSHSCP1(cwd, this, verbose);
    }

    public SSHSCP1 scp1() {
	return scp1;
    }

}
