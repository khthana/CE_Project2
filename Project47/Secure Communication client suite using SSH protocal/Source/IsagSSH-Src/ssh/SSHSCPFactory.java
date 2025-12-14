
package ssh;

import java.io.File;

import application.MindTermApp;

import sshcommon.SSHFileTransfer;
import sshcommon.SSHFileTransferFactory;

public class SSHSCPFactory implements SSHFileTransferFactory {
    public SSHFileTransfer create(final MindTermApp client, File cwd)
	throws Exception
    {
	SSHInteractor interactAdapter = new SSHInteractorAdapter() {
		public void alert(String msg) {
		    client.alert(msg);
		}
	    };
	SSHInteractiveClient ic = (SSHInteractiveClient)client;
	SSHSCPClient scpClient = new SSHSCPClient(client.getHost(),
						  client.getPort(),
						  ic.propsHandler,
						  interactAdapter,
						  cwd, false);
	scpClient.setClientUser(ic.propsHandler);
	return scpClient.scp1();
    }
}
