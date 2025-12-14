
package sshcommon;

import util.Progress;

public interface SSHFileTransferProgress extends Progress {
    public void startFile(String file, long size);
    public void startDir(String file);
    public void endFile();
    public void endDir();
}
