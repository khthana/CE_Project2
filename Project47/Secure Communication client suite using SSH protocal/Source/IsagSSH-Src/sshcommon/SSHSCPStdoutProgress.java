
package sshcommon;

public class SSHSCPStdoutProgress implements SSHFileTransferProgress {
    public void startFile(String file, long size) {
	System.out.print("Transfering " + file + " (" + size + " bytes)...");
    }
    public void startDir(String file) {
	System.out.println("Entering directory " + file);
    }
    public void endFile() {
	System.out.println("done");
    }
    public void endDir() {
    }
    public void progress(int size) {
    }
}
