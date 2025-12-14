
package sshcommon;

import java.io.IOException;

public interface SSHFileTransfer {
    public void setProgress(SSHFileTransferProgress progress);
    public void copyToRemote(String[] localFiles, String remoteFile,
			     boolean recursive)
	throws IOException;
    public void copyToLocal(String localFile, String remoteFiles[],
			    boolean recursive)
	throws IOException;
    public void abort();
}
