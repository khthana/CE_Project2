

package ssh2;

import isnetworks.ssh.AbstractFileBrowser;
import isnetworks.ssh.FileListItem;
import isnetworks.ssh.FileDisplay;

/**
 * Implements a file browser which browses files through an SFTP connection.
 */
public class SSH2SFTPFileBrowser extends AbstractFileBrowser {

    private SSH2Connection connection;
    private SSH2SFTPClient client;
    private String         cwd;

    /**
     * @param connection Connection to use.
     * @param fileDisplay A display object which refers to the actual window.
     * @param cwd Directory to start in.
     */
    public SSH2SFTPFileBrowser(SSH2Connection connection,
			       FileDisplay fileDisplay,
			       String cwd)
    {
	super(fileDisplay);
	this.connection = connection;
	this.cwd        = cwd;
    }

    /**
     * Handles doubleclick events on a file. If the object is a
     * directory then we change current working directory to that
     * directory. Otherwise nothing happens.
     *
     * @param file File doubleclicked.
     */
    public void fileDoubleClicked(FileListItem file) throws Exception {
	if(file != null & file.isDirectory()) {
	    changeDirectory(cwd + "/" + file.getName());
	}
    }

    /**
     * Refres the listing of the current directory.
     */
    public void refresh() throws Exception {
	SSH2SFTP.FileHandle handle = null;
	try {
	    handle = client.opendir(cwd);
	    SSH2SFTP.FileAttributes[] list = client.readdir(handle);

	    if(!cwd.equals("/") && !cwd.equals("")) {
		dirs.addElement(new FileListItem("..", "", true, "/"));
	    }

	    for(int i = 0; i < list.length; i++) {
		String name = list[i].name;
		if(!("..".equals(name)) && !(".".equals(name))) {
		    boolean isDirectory = list[i].isDirectory();
		    if(list[i].isLink()) {
			isDirectory = isDirectory(name);
		    }
		    FileListItem item = new FileListItem(name, cwd,
							 isDirectory,
							 "/", list[i].size);
		    if(isDirectory) {
			dirs.addElement(item);
		    } else {
			files.addElement(item);
		    }
		}
	    }

	    mFileDisplay.setFileList(dirs, files, cwd, "/");

	} catch (Exception e) {
	    throw new Exception(e.getMessage());
	} finally {
	    try { client.close(handle); }
	    catch (Exception e) { /* don't care */ }
	}
    }

    /**
     * Delete a set of files.
     *
     * @param files Array of files to delete.
     */
    public void delete(FileListItem[] files) throws Exception {
	String file = null;
	try {
	    for(int i = 0; i < files.length; i++) {
		file = files[i].getAbsolutePath();
		SSH2SFTP.FileAttributes attrs = client.stat(file);
		if(attrs.isDirectory()) {
		    client.rmdir(file);
		} else {
		    client.remove(file);
		}
	    }
	} catch (SSH2SFTP.SFTPException e) {
	    throw new Exception("Unable to delete " + file +
				   " - may not have permission or directory may not be empty");
	}
    }

    /**
     * Initialize the object.
     */
    public void initialize() throws Exception {
	try {
	    client = new SSH2SFTPClient(connection, true);
	    SSH2SFTP.FileAttributes attrs = client.realpath(cwd);
	    cwd = attrs.lname;
	    refresh();
	} catch (SSH2SFTP.SFTPException e) {
	    throw new Exception("Could not start sftp session: " +
				   e.getMessage());
	}
    }

    /**
     * Create a directory on the server.
     *
     * @param directoryName Name of directory to create.
     */
    public void makeDirectory(String directoryName) throws Exception {
	try {
	    if(!directoryName.startsWith("/")) {
		directoryName = cwd + "/" + directoryName;
	    }
	    client.mkdir(directoryName, new SSH2SFTP.FileAttributes());
	} catch (SSH2SFTP.SFTPException e) {
	    throw new Exception(e.getMessage());
	}
    }

    /**
     * Renames a file.
     *
     * @param file File to rename.
     * @param newFileName New name.
     */
    public void rename(FileListItem file, String newFileName)
	throws Exception
    {
	try {
	    client.rename(file.getAbsolutePath(), file.getParent() + "/" +
			  newFileName);
	} catch (SSH2SFTP.SFTPException e) {
	    throw new Exception(e.getMessage());
	}
    }

    /**
     * Change current working directory.
     *
     * @param newDir Directory to change into.
     */
    public void changeDirectory(String newDir) throws Exception {
	try {
	    if(!newDir.startsWith("/")) {
		newDir = cwd + "/" + newDir;
	    }
	    SSH2SFTP.FileAttributes attrs  = client.realpath(newDir);
	    SSH2SFTP.FileHandle     handle = client.opendir(newDir);
	    newDir = attrs.lname;
	    client.close(handle);
	} catch (SSH2SFTP.SFTPException e) {
	    newDir = cwd;
	}
	cwd = newDir;
    }

    private boolean isDirectory(String dir) {
	try {
	    dir = cwd + "/" + dir;
	    SSH2SFTP.FileHandle handle = client.opendir(dir);
	    client.close(handle);
	    return true;
	} catch (SSH2SFTP.SFTPException e) {
	}
	return false;
    }

    /**
     * Disconnect from the server.
     */
    public void disconnect() {
	if(client != null) {
	    client.terminate();
	}
    }

}
