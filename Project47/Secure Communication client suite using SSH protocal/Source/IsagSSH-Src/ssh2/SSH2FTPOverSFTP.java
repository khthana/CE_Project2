
package ssh2;

import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

import net.ftp.FTPServer;
import net.ftp.FTPServerEventHandler;
import net.ftp.FTPException;

/**
 * Implements a proxy which proxies between an ftp client and an sftp server.
 */
public class SSH2FTPOverSFTP implements FTPServerEventHandler {

    protected SSH2Connection connection;
    protected SSH2SFTPClient sftp;
    protected FTPServer      ftp;

    private String         remoteDir;
    private String         renameFrom;
    private String         user;

    private SSH2SFTP.FileAttributes attrs;

    protected SSH2FTPOverSFTP(InputStream ftpInput, OutputStream ftpOutput,
			      String identity, boolean needPassword)
    {
	initFTP(ftpInput, ftpOutput, identity, needPassword);
    }

    public SSH2FTPOverSFTP(SSH2Connection connection,
			   InputStream ftpInput, OutputStream ftpOutput,
			   String identity)
	throws SSH2SFTP.SFTPException
    {
	initSFTP(connection);
	initFTP(ftpInput, ftpOutput, identity, false);
    }

    /**
     * Connect this instance with an <code>SSH2Connection</code> which is
     * connected to the server we want to transfer files to/from.
     *
     * @param connection Established connection to the server.
     */
    protected void initSFTP(SSH2Connection connection)
	throws SSH2SFTP.SFTPException
    {
	this.connection = connection;
	this.attrs      = null;
	try {
	    this.sftp = new SSH2SFTPClient(connection, false);
	} catch (SSH2SFTP.SFTPException e) {
            if (ftp != null)
                ftp.terminate();
	    throw e;
	}
    }

    /**
     * Initialize the FTP server portion of this class.
     *
     * @param ftpInput The ftp command input stream.
     * @param ftpOutput The ftp command output stream.
     * @param identity Username to log in as
     * @param needPassowrd Tells the instance if it should request a
     *                     password or not from the user. The actual password
     *                     the user then gives is ignored.
     */
    protected void initFTP(InputStream ftpInput, OutputStream ftpOutput,
		      String identity, boolean needPassword) {
	this.ftp = new FTPServer(identity, this, ftpInput, ftpOutput,
				 needPassword);
    }

    /**
     * Login to server. This is actually a null operation for this class
     * since the user is already authenticated as part of the SSH connection.
     *
     * @param user Username to login as.
     * @param pass Password.
     *
     * @return Returns true if the login was successful.
     */
    public boolean login(String user, String pass) {
	connection.getLog().notice("SSH2FTPOverSFTP", "user " + user + " login");
	try {
	    attrs = sftp.realpath(".");
	} catch (SSH2SFTP.SFTPException e) {
	    // !!! TODO, should disconnect ???
	    return false;
	}
	remoteDir = attrs.lname;
	this.user = user;
	return true;
    }

    public void quit() {
	connection.getLog().notice("SSH2FTPOverSFTP", "user " + user + " logout");
	sftp.terminate();
    }

    public boolean isPlainFile(String file) {
	try {
	    file  = expandRemote(file);
	    attrs = sftp.lstat(file);
	    return attrs.isFile();
	} catch (SSH2SFTP.SFTPException e) {
	    return false;
	}
    }

    public void changeDirectory(String dir) throws FTPException {
	if(dir != null) {
	    String newDir = expandRemote(dir);
	    try {
		attrs = sftp.realpath(newDir);
	    } catch (SSH2SFTP.SFTPException e) {
		throw new FTPException(550, dir + ": No such directory.");
	    }
	    newDir = attrs.lname;
	    try {
		SSH2SFTP.FileHandle f = sftp.opendir(newDir);
		sftp.close(f);
	    } catch (SSH2SFTP.SFTPException e) {
		throw new FTPException(550, dir + ": Not a directory.");
	    }
	    remoteDir = newDir;
	}
    }

    public void renameFrom(String from) throws FTPException {
	try {
	    String fPath = expandRemote(from);
	    attrs = sftp.lstat(fPath);
	    renameFrom = fPath;
	} catch (SSH2SFTP.SFTPException e) {
	    throw new FTPException(550, from + ": No such file or directory.");
	}
    }

    public void renameTo(String to) throws FTPException {
	if(renameFrom != null) {
	    try {
		sftp.rename(renameFrom, expandRemote(to));
	    } catch (SSH2SFTP.SFTPException e) {
		throw new FTPException(550, "rename: Operation failed.");
	    } finally {
		renameFrom = null;
	    }
	} else {
	    throw new FTPException(503, "Bad sequence of commands.");
	}
    }

    public void delete(String file) throws FTPException {
	try {
	    sftp.remove(expandRemote(file));
	} catch (SSH2SFTP.SFTPException e) {
	    String msg = (e instanceof SSH2SFTP.SFTPPermissionDeniedException) ?
		"access denied." : file + ": no such file.";
	    throw new FTPException(550, msg);
	}
    }

    public void rmdir(String dir) throws FTPException {
	try {
	    sftp.rmdir(expandRemote(dir));
	} catch (SSH2SFTP.SFTPException e) {
	    String msg = (e instanceof SSH2SFTP.SFTPPermissionDeniedException) ?
		"access denied." : dir + ": no such directory.";
	    throw new FTPException(550, msg);
	}
    }

    public void mkdir(String dir) throws FTPException {
	try {
	    sftp.mkdir(expandRemote(dir), new SSH2SFTP.FileAttributes());
	} catch (SSH2SFTP.SFTPException e) {
	    
	}
    }

    public String pwd() {
	return remoteDir;
    }

    public String system() {
	return "UNIX Type: L8";
    }

    public long modTime(String file) throws FTPException {
	return (timeAndSize(file))[0];
    }

    public long size(String file) throws FTPException {
	return (timeAndSize(file))[1];
    }

    private long[] timeAndSize(String file) throws FTPException {
	try {
	    long[] ts = new long[2];
	    String fPath = expandRemote(file);
	    attrs = sftp.lstat(fPath);
	    if(!attrs.hasSize || !attrs.hasModTime) {
		throw new FTPException(550,
				       "SFTP server don't return time/size.");
	    }
	    ts[0] = attrs.mtime * 1000L;
	    ts[1] = attrs.size;
	    return ts;
	} catch (SSH2SFTP.SFTPException e) {
	    throw new FTPException(550, file + ": No such file or directory.");
	}
    }

    public void store(String file, InputStream data, boolean binary)
	throws FTPException
    {
	SSH2SFTP.FileHandle handle = null;
	try {
	    file = expandRemote(file);
	    handle = sftp.open(file, SSH2SFTP.SSH_FXF_WRITE |
			       SSH2SFTP.SSH_FXF_TRUNC |
			       SSH2SFTP.SSH_FXF_CREAT,
			       new SSH2SFTP.FileAttributes());

	    sftp.writeFully(handle, data);

	} catch (IOException e) {
	    throw new FTPException(425, "Error writing to data connection: " +
				   e.getMessage());
	} catch (SSH2SFTP.SFTPPermissionDeniedException e) {
	    throw new FTPException(553, file + ": Permission denied.");
	} catch (SSH2SFTP.SFTPException e) {
	    throw new FTPException(550, file + ": Error in sftp connection, " +
				   e.getMessage());
	} finally {
	    try { data.close(); } catch (Exception e) { /* don't care */ }
	}
    }

    public void retrieve(String file, OutputStream data, boolean binary)
	throws FTPException
    {
	SSH2SFTP.FileHandle handle = null;
	try {
	    String eFile = expandRemote(file);
	    handle = sftp.open(eFile, SSH2SFTP.SSH_FXF_READ,
			       new SSH2SFTP.FileAttributes());
	    sftp.readFully(handle, data);

	} catch (SSH2SFTP.SFTPNoSuchFileException e) {
	    throw new FTPException(550, file + ": No such file or directory.");
	} catch (SSH2SFTP.SFTPException e) {
	    throw new FTPException(550, file + ": Error in sftp connection, " +
				   e.getMessage());
	} catch (IOException e) {
	    throw new FTPException(550, file + ": Error in sftp connection, " +
				   e.getMessage());
	} finally {
	    try { data.close(); } catch (Exception e) { /* don't care */ }
	}
    }

    public void list(String path, OutputStream data) throws FTPException {
	try {
	    SSH2SFTP.FileAttributes[] list = dirList(path);
	    for(int i = 0; i < list.length; i++) {
		if(".".equals(list[i].name) || "..".equals(list[i].name)) {
		    continue;
		}
		String row = list[i].lname;
		if (row.endsWith("/")) {
		    row = row.substring(0, row.length() - 1);
		}
		row += "\r\n";
		data.write(row.getBytes());
	    }
	} catch (IOException e) {
	    throw new FTPException(425, "Error writing to data connection: " +
				   e.getMessage());
	}
    }

    public void nameList(String path, OutputStream data) throws FTPException {
	// !!! TODO some *-expansion maybe
	try {
	    SSH2SFTP.FileAttributes[] list = dirList(path);
	    for(int i = 0; i < list.length; i++) {
		if(".".equals(list[i].name) || "..".equals(list[i].name)) {
		    continue;
		}
		String row = list[i].name + "\r\n";
		data.write(row.getBytes());
	    }
	} catch (IOException e) {
	    throw new FTPException(425, "Error writing to data connection: " +
				   e.getMessage());
	}
    }

    private SSH2SFTP.FileAttributes[] dirList(String path) throws FTPException {
	SSH2SFTP.FileHandle       handle = null;
	SSH2SFTP.FileAttributes[] list   = new SSH2SFTP.FileAttributes[0];

	try {
	    String fPath = expandRemote(path);
	    attrs = sftp.lstat(fPath);
	    if(attrs.isDirectory()) {
		handle = sftp.opendir(fPath);
		list = sftp.readdir(handle);
                if (list != null) {
                    for(int i=0; i<list.length; i++) {
                        list[i].lname = list[i].toString(list[i].name);
                    }
                }
	    } else {
		list          = new SSH2SFTP.FileAttributes[1];
		list[0]       = new SSH2SFTP.FileAttributes();
		list[0].name  = path;
		list[0].lname = attrs.toString(path);
	    }
	} catch (SSH2SFTP.SFTPException e) {
	    throw new FTPException(550, path + ": Not a directory.");
	} finally {
	    try { if(handle != null) sftp.close(handle); }
	    catch (Exception e) { /* don't care */ }
	}

	return list;
    }

    public void abort() {
	// !!! TODO !!!
    }

    private String expandRemote(String name) {
	if(name == null || name.length() == 0) {
	    return remoteDir;
	}
	if(name.charAt(0) != '/')
	    name = remoteDir + "/" + name;
	return name;
    }

}
