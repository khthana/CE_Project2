
package isnetworks.ssh;

public interface FileBrowser {

    /**
     * User wants to switch to a directory
     */
    public void fileDoubleClicked( FileListItem file ) throws Exception;
	
    /**
     * Refresh the file list
     */
    public void refresh() throws Exception;
	
    /**
     * Delete a file or set of files from the file system
     */
    public void delete( FileListItem[] file ) throws Exception;

    /**
     * Connect with the file system if needed
     */
    public void initialize() throws Exception;
	
    /**
     * Create a new empty directory
     */
    public void makeDirectory( String directoryName ) throws Exception;
	
    /**
     * Rename an existing file
     */
    public void rename( FileListItem file, String newFileName ) throws Exception;
	
    /**
     * Switch to a specific, user-input directory
     */
    public void changeDirectory( String directoryName ) throws Exception;

    /**
     * Shut down the file browser
     */
    public void disconnect();

}
