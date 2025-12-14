

package ssh2;

import java.io.File;

import application.MindTermApp;

import sshcommon.SSHFileTransfer;
import sshcommon.SSHFileTransferFactory;

/**
 * Factory which creates new <code>SSH2SFTPTransfer</code> instances.
 */
public class SSH2SFTPFactory implements SSHFileTransferFactory {
    public SSHFileTransfer create(MindTermApp client, File cwd)
	throws Exception
    {
	return new SSH2SFTPTransfer(cwd, client.getConnection());
    }
}
