
package isnetworks.ssh;

import java.util.Vector;

import ssh.*;

public abstract class AbstractFileBrowser implements FileBrowser {

    /**
     * AWT components responsible for GUI representation of file system
     */
    public FileDisplay mFileDisplay;

    public Vector dirs;
    public Vector files;

    public AbstractFileBrowser(FileDisplay fileDisplay) {
	mFileDisplay = fileDisplay;
	mFileDisplay.setFileBrowser(this);
	dirs  = new Vector(32);
	files = new Vector(256);
    }

    public void disconnect() {
    }

}
