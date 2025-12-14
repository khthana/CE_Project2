
package ssh2;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import sshcommon.SSHFileTransfer;
import sshcommon.SSHFileTransferProgress;

/**
 * Convenience class for transferring files to and from the server.
 */
public class SSH2SFTPTransfer implements SSHFileTransfer,
					 SSH2SFTP.AsyncListener
{
    private SSHFileTransferProgress progress = null;
    private SSH2SFTPClient          client;
    private File                    cwd;

    /**
     * @param cwd Directory on server to transfer the files to/from.
     * @param connection SSH connection to use.
     */
    public SSH2SFTPTransfer(File cwd, SSH2Connection connection)
	throws SSH2Exception
    {
	try {
	    this.cwd    = cwd;
	    this.client = new SSH2SFTPClient(connection, false);
	} catch (SSH2SFTP.SFTPException e) {
	    throw new SSH2FatalException("Could not start sftp session", e);
	}
    }

    /**
     * Associate a <code>SSHFileTransferProgress</code> object with
     * this file transfer object. The associated object will get
     * reports on any transfer progress.
     *
     * @param progress Object which will get progress reports.
     */
    public void setProgress(SSHFileTransferProgress progress) {
	this.progress = progress;
    }

    /**
     * Copy local files to the server. If the <code>remoteFile</code>
     * parameter refers to a directory the all local files are placed
     * into it. However it is kind of meaningless to specify multiple
     * local files and one remote regular file since all files will be
     * copied to the same name.
     *
     * @param localFiles Array of local files to copy.
     * @param remoteFile Name to store file(s) as on server. If this
     * is a directory then all files are copied to that directory.
     * @param recursive If true recurse into directories and copy all
     * files found. The directory structure is recreated on the server.
     */
    public void copyToRemote(String[] localFiles, String remoteFile,
			     boolean recursive)
	throws IOException
    {
	if(remoteFile == null || remoteFile.equals(""))
	    remoteFile = "./";

	for(int i = 0; i < localFiles.length; i++) {
	    File lf = new File(localFiles[i]);
	    if(!lf.isAbsolute())
		lf = new File(cwd, localFiles[i]);
	    if(!lf.isFile() && !lf.isDirectory()) {
		throw new IOException("File: " + lf.getName() +
				      " is not a regular file or directory");
	    }
	    try {
		writeFileToRemote(lf, remoteFile, recursive);
	    } catch (SSH2SFTP.SFTPException e) {
		throw new IOException("Error writing file: " + e.getMessage());
	    }
	}
    }

    /**
     * Copy remote files to the local system. If the <code>localFile</code>
     * parameter refers to a directory the all remote files are placed
     * into it. However it is kind of meaningless to specify multiple
     * remote files and one local regular file since all files will be
     * copied to the same name.
     *
     * @param localFile Name to store file(s) as locally. If this
     * is a directory then all files are copied to that directory.
     * @param remoteFiles Array of files to copy.
     * @param recursive If true recurse into directories and copy all
     * files found. The directory structure is recreated on the server.
     */
    public void copyToLocal(String localFile, String remoteFiles[],
			    boolean recursive)
	throws IOException
    {
	if(localFile == null || localFile.equals(""))
	    localFile = ".";

	File lf = new File(localFile);
	if(!lf.isAbsolute())
	    lf = new File(cwd, localFile);

	if(lf.exists() && !lf.isFile() && !lf.isDirectory()) {
	    throw new IOException("File: " + localFile +
				  " is not a regular file or directory");
	}

	for(int i = 0; i < remoteFiles.length; i++) {
	    String fName = remoteFiles[i];
	    try {
		readFileFromRemote(fName, localFile, recursive);
	    } catch (SSH2SFTP.SFTPException e) {
		throw new IOException(e.getMessage());
	    }
	}
    }

    private void writeFileToRemote(File file, String remoteFile,
				   boolean recursive)
	throws IOException, SSH2SFTP.SFTPException
    {
	String fName = file.getName();

	if(file.isDirectory() && recursive) {
	    writeDirToRemote(file, remoteFile);
	} else if(file.isFile()) {
	    if(progress != null)
		progress.startFile(fName, file.length());

            String remoteFileName;
            
            SSH2SFTP.FileAttributes attrs = null;
            try {
               attrs = client.stat(remoteFile);
            } catch (Exception e) {
            }

            if (attrs != null && attrs.isDirectory()) {
                if(!remoteFile.endsWith("/")) {
                    remoteFile += "/";
                }
                remoteFileName = remoteFile + fName;
            } else {
                remoteFileName = remoteFile;                
            }

	    FileInputStream     fin = new FileInputStream(file);
	    SSH2SFTP.FileHandle fh  = null;
	    try {
		fh = client.open(remoteFileName,
				 SSH2SFTP.SSH_FXF_WRITE |
				 SSH2SFTP.SSH_FXF_TRUNC |
				 SSH2SFTP.SSH_FXF_CREAT,
				 new SSH2SFTP.FileAttributes());
		fh.addAsyncListener(this);
		client.writeFully(fh, fin);
	    } finally {
		fin.close();
	    }

	    if(progress != null)
		progress.endFile();
	} else {
	    throw new IOException("Not ordinary file: " + fName);
	}
    }

    private void writeDirToRemote(File dir, String remoteDir)
	throws IOException, SSH2SFTP.SFTPException
    {
	if(progress != null)
	    progress.startDir(dir.getAbsolutePath());
	if(!remoteDir.endsWith("/")) {
	    remoteDir += "/";
	}
	remoteDir += dir.getName();
	try {
	    client.stat(remoteDir);
	} catch (SSH2SFTP.SFTPException e) {
	    client.mkdir(remoteDir, new SSH2SFTP.FileAttributes());
	}
	String[] dirList = dir.list();
	for(int i = 0; i < dirList.length; i++) {
	    File f = new File(dir, dirList[i]);
	    writeFileToRemote(f, remoteDir, true);
	}
	if(progress != null)
	    progress.endDir();
    }

    private void readFileFromRemote(String fName, String localFile,
				    boolean recursive)
	throws IOException, SSH2SFTP.SFTPException
    {
	SSH2SFTP.FileAttributes attrs = client.stat(fName);
	SSH2SFTP.FileHandle     fh    = null;

	File targetFile = new File(localFile);
	if(targetFile.isDirectory()) {
	    String f = fName;
	    int    n = fName.lastIndexOf('/');
	    if(n != -1) {
		f = fName.substring(n + 1);
	    }
	    targetFile = new File(targetFile, f);
	}

	if(attrs.isDirectory() && recursive) {
	    if(targetFile.exists()) {
		if(!targetFile.isDirectory()) {
		    throw new IOException("Invalid target " +
					  targetFile.getName() +
					  ", must be a directory");
		}
	    } else {
		if(!targetFile.mkdir()) {
		    throw new IOException("Could not create directory: " +
					  targetFile.getName());
		}
	    }
	    fh = client.opendir(fName);
	    SSH2SFTP.FileAttributes[] list = client.readdir(fh);
	    for(int i = 0; i < list.length; i++) {
		String name = list[i].name;
		if("..".equals(name) || ".".equals(name)) {
		    continue;
		}
		readFileFromRemote(fName + "/" + name,
				   targetFile.getAbsolutePath(), recursive);
	    }
	} else if(attrs.isFile()) {
	    FileOutputStream fout = new FileOutputStream(targetFile);
	    try {
		fh = client.open(fName, SSH2SFTP.SSH_FXF_READ,
				 new SSH2SFTP.FileAttributes());
		if(progress != null)
		    progress.startFile(targetFile.getName(), attrs.size);
		fh.addAsyncListener(this);
		client.readFully(fh, fout);
		if(progress != null)
		    progress.endFile();
	    } finally {
		fout.close();
	    }
	} else {
	    throw new IOException("Not ordinary file: " + fName);
	}
    }

    /**
     * Abort all operations
     */
    public void abort() {
	if(client != null) {
	    client.terminate();
	}
    }

    public void progress(long size) {
        if (progress != null)
            progress.progress((int)size);
    }

}
