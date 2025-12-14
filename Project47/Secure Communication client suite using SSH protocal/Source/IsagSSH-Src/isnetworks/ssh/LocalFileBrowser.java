/**
* Browser to handle file manipulation on the local machine
*/
package isnetworks.ssh;

import java.io.*;
import ssh.*;


public class LocalFileBrowser extends AbstractFileBrowser {
	
    private File cwd;

    public LocalFileBrowser(FileDisplay fileDisplay, String cwd) {
	super(fileDisplay);
	try {
	    changeDirectory(cwd);
	} catch (Exception e) {
	    this.cwd = new File(".");
	}
    }
	
    /**
     * Jump to the default SSH home directory
     */
    public void initialize() throws Exception {
	refresh();
    }

    public void refresh() throws Exception {
	String[] fileNames = cwd.list();
	boolean  isRoot    = cwd.getParent() == null;

	// Add link to parent directory if we're not already at the root
	if(!isRoot) {
	    dirs.addElement(new FileListItem("..", "", true, File.separator));
	}

	String dir = null;

	try {
	    dir = cwd.getCanonicalPath();
	} catch(IOException e) {
	    throw new Exception( "Unable to refresh file list" );
	}

	if(fileNames != null) {
	    for(int i = 0; i < fileNames.length; i++) {
		File f = new File(cwd, fileNames[i]);
		FileListItem item = new FileListItem(fileNames[i], dir,
						     f.isDirectory(),
						     File.separator, f.length());
		if(f.isDirectory()) {
		    dirs.addElement(item);
		} else {
		    files.addElement(item);
		}
	    }
	}

	mFileDisplay.setFileList(dirs, files, dir, File.separator);
    }

    public void makeDirectory( String directoryName ) throws Exception {
	File newDirectory = new File( cwd, directoryName );
	if ( !newDirectory.mkdirs() ) {
	    throw new Exception( "Unable to make directory: " + newDirectory.getAbsolutePath() );
	}
    }

    public void delete( FileListItem[] fileListItem ) throws Exception {
	for( int i = 0; i < fileListItem.length; i++ ) {
	    File deleteFile = new File( fileListItem[ i ].getParent(), fileListItem[ i ].getName() );
	    if ( !deleteFile.delete() ) {
		throw new Exception( "Unable to delete " + fileListItem[ i ].getAbsolutePath() + " - may not have permission or directory may not be empty" );
	    }
	}
		
    }

    public void changeDirectory( String directoryName ) throws Exception {
	File newDirectory = new File( directoryName );
	if ( !newDirectory.exists() ) {
	    throw new Exception( "Directory " + directoryName + " does not exist or you do not have permission to access it." );		
	}
	if( newDirectory.isFile() ) {
	    throw new Exception( directoryName + " a file, not a directory." );
	}
	// This is the right way to do it, but it doesn't work under Netscape
	// if the directory has a space in its name.  Nice work, Netscape!
	//		if( !newDirectory.isDirectory() ) {
	//			throw new Exception( directoryName + " is not a directory." );
	//		}
	cwd = newDirectory;
    }

    public void rename(FileListItem oldFileListItem, String newName)
	throws Exception
    {
	File oldFile = new File(oldFileListItem.getParent(),
				oldFileListItem.getName());
	File newFile = null;
	if(!newName.startsWith(File.separator)) {
	    newFile = new File(cwd, newName);
	} else {
	    newFile = new File(newName);
	}

	if(!oldFile.renameTo(newFile)) {
	    throw new Exception("Unable to rename file " +
				   oldFileListItem.getAbsolutePath() +
				   " to " + newName);
	}
		
    }

    public void fileDoubleClicked( FileListItem fileListItem )
	throws Exception
    {

	if(fileListItem.isDirectory()) {
	    File newDirectory = null;

	    if(fileListItem.getName().equals( ".." )) {
		newDirectory = new File(cwd.getParent());
	    } else {
		newDirectory = new File(fileListItem.getParent(),
					fileListItem.getName());
	    }

	    if (!newDirectory.exists() || !newDirectory.isDirectory()) {
		throw new Exception("Unable to open directory: " +
				    newDirectory.getAbsolutePath());
	    }

	    cwd = newDirectory;

	}	
    }

}
