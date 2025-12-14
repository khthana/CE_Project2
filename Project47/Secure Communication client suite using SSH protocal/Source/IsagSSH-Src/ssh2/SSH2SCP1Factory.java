

package ssh2;

import java.io.File;
import java.io.OutputStream;
import java.io.IOException;

import application.MindTermApp;

import sshcommon.SSHFileTransfer;
import sshcommon.SSHFileTransferFactory;

/**
 * Factory which creates <code>SSHFileTransfer</code> objects which
 * use the scp1 protocol.
 */
public class SSH2SCP1Factory implements SSHFileTransferFactory {
    public SSHFileTransfer create(final MindTermApp client, File cwd)
	throws Exception
    {
	OutputStream alertOutput = new OutputStream() {
		public void write(int bb) throws IOException {
		    byte[] buf = new byte[] { (byte)bb };
		    write(buf);
		}
		public void write(byte bb[], int off, int len)
		    throws IOException {
		    client.alert("Remote warning/error: " +
				 new String(bb, off, len));
		}
	    };
	return (new SSH2SCP1Client(cwd, client.getConnection(),
				   alertOutput, false)).scp1();
    }
}
