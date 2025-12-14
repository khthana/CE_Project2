/**
* Representation of a file on either the local or remote file systems.
* Knows whether it's a directory as well as its name and path.
*/
package isnetworks.ssh;

import java.io.*;
import java.util.*;

import util.ArraySort;

public final class FileListItem implements ArraySort.Comparable {

    private String  name;
    private String  parent;
    private String  separator;
    private boolean directory;
    private long    size;

    public FileListItem(String name, String parent, boolean directory,
			 String separator) {
	this(name, parent, directory, separator, -1);
    }

    public FileListItem(String name, String parent, boolean directory,
			 String separator, long size) {
	if(!parent.endsWith(separator)) {
	    parent += separator;
	}
	this.name      = name;
	this.parent    = parent;
	this.directory = directory;
	this.separator = separator;
	this.size      = size;
    }

    /**
     * Get fully qualified name
     */
    public String getAbsolutePath() {
	return parent + name;
    }

    /**
     * Get name of file relative to its parent directory
     */
    public String getName() {
	return name;
    }

    /**
     * Get size of file
     */
    public long getSize() {
	return size;
    }

    /**
     * Get full path of directory this file lives in
     */
    public String getParent() {
	return parent;
    }

    public boolean isDirectory() {
	return directory;
    }

    public void sort(FileListItem[] list) {
	ArraySort.sort(list);
    }

    public int compareTo(ArraySort.Comparable other) {
	return name.toUpperCase().
	    compareTo(((FileListItem)other).name.toUpperCase());
    }

}
