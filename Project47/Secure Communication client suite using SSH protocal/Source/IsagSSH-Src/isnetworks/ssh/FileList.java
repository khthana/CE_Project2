/**
* Subclass of java.awt.List which allows the List to be treated as though
* it directly help FileListItems instead of Strings.  Handles the setting
* and getting of the List's contents as FileListItems.
*/
package isnetworks.ssh;

import java.awt.*;
import java.util.*;

import util.StringUtil;

public class FileList extends java.awt.List {

    /**
     * Array of FileListItems which corresponds to the contents of the List
     */
    private FileListItem[] mListItems;

    /**
     * Set the contents of the List to be the array
     */
    public void setListItems(FileListItem[] listItems) {
	removeAll();
	mListItems = listItems;
	for(int i = 0; i < listItems.length; i++) {
	    FileListItem item = listItems[i];
	    if(item.isDirectory()) {
		add( "[" + item.getName() + "]" );
	    } else {
		long sz = item.getSize();
		add(item.getName() + (sz >= 0 ?
				      " (" +
				      StringUtil.nBytesToString(sz, 4) +
				      ")" : ""));
	    }
	}
    }

    /**
     * Gets the first selected item in the list
     */
    public FileListItem getSelectedFileListItem() {
	FileListItem item = null;
	if(getSelectedIndex() != -1) {
	    item = mListItems[getSelectedIndex()];
	}
	return item;
    }

    /**
     * Gets all of the current selected items in the list.  Filters out the
     * entry ".." if it exists since the user can't do anything with
     * it, except double click on it to move to the parent directory
     */
    public FileListItem[] getSelectedFileListItems() {
	int[] selectedIndexes = getSelectedIndexes();
	boolean skipZero = isIndexSelected(0) &&
	    mListItems[0].getName().equals("..");
	FileListItem[] selectedItems =
	    new FileListItem[getSelectionCount()];
		
	// Don't count .. in the selected list
	int itemIndex = 0;
	for(int i = 0; i < selectedIndexes.length; i++) {
	    if(selectedIndexes[i] != 0 || !skipZero) {
		selectedItems[itemIndex++] = mListItems[selectedIndexes[i]];
	    }
	}

	return selectedItems;
    }

    /**
     * @return Number of items currently selected in the list, not counting ".." if it is selected
     */
    public int getSelectionCount() {
	int[] selectedIndexes = getSelectedIndexes();
	// Don't count .. in the selected list
	if(isIndexSelected( 0 ) && mListItems[0].getName().equals(".." )) {
	    return selectedIndexes.length - 1;
	}
	return selectedIndexes.length;
    }

    /**
     * @return The FileListItem that matches the given String, displayed in the list, or null if it does not exist
     */
    public FileListItem getFileListItem(String name) {
	if(name != null) {
	    for(int i = 0; i < getItemCount(); i++) {
		if(name.equals(getItem(i))) {
		    return mListItems[i];
		}
	    }
	}
	return null;
    }

}
