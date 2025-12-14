
package sshcommon;

import java.awt.*;
import java.awt.event.*;

import java.io.File;

import application.MindTermApp;
import gui.AWTConvenience;

import isnetworks.ssh.FileListItem;
import isnetworks.ssh.FileBrowser;
import isnetworks.ssh.FileDisplay;

public class SSHFileTransferDialog extends Dialog {

    public final static int ACT_CLOSE    = 0;
    public final static int ACT_TOREMOTE = 1;
    public final static int ACT_TOLOCAL  = 2;

    private class Actions implements ActionListener {

	private int action;

	public Actions(int action) {
	    this.action = action;
	}

	public void actionPerformed(ActionEvent e) {
	    if(action == ACT_CLOSE) {
		setVisible(false);
		mRemoteFileBrowser.disconnect();
	    } else {
		boolean toRemote = (action == ACT_TOREMOTE);
		try {
		    FileListItem[] selectedItems;
		    String         localCWD;
		    String         remoteCWD;
		    String         fromDir;
		    String         toDir;

		    localCWD =
			getLocalFileDisplay().getFileSystemLocationLabelText();
		    remoteCWD =
			getRemoteFileDisplay().getFileSystemLocationLabelText();

		    if(toRemote) {
			selectedItems = mLocalFileDisplay.getSelectedFiles();
			fromDir = localCWD;
			toDir   = remoteCWD;
		    } else {
			selectedItems = mRemoteFileDisplay.getSelectedFiles();
			fromDir = remoteCWD;
			toDir   = localCWD;
		    }

		    String[] files = new String[selectedItems.length];

		    if(selectedItems.length == 0) {
			throw new Exception("Please select file(s) to transfer");
		    }

		    for(int i = 0; i < selectedItems.length; i++ ) {
			files[i] = fromDir + selectedItems[i].getName();
		    }

		    String[] files2 = new String[] {
			toDir
		    };

		    if(!toRemote) {
			String[] tmp = files2;
			files2  = files;
			files = tmp;
		    }

		    SSHFileTransfer fileXfer =
			fileXferFactory.create(client, new File(localCWD));

		    new SSHFileTransferGUIThread(client, fileXfer,
						 files, files2,
						 true, false, toRemote,
						 SSHFileTransferDialog.this);
		} catch (Exception ee) {
		    logError(ee);
		}
	    }
	}

    }

    private Button        mUploadButton;
    private Button        mDownloadButton;

    private Panel         mFileDisplayPanel;
    private Panel         mMainBottomSectionPanel;
    private Button        closeButton;

    /** GUI for browsing file systems */
    private FileDisplay   mLocalFileDisplay;
    private FileDisplay   mRemoteFileDisplay;

    /** Back end for browsing file systems */
    private FileBrowser mRemoteFileBrowser;
    private FileBrowser mLocalFileBrowser;

    private MindTermApp            client;
    private SSHFileTransferFactory fileXferFactory;

    /** Constructor 
     *  Overall, the GUI is composed of two parts:
     *    the bottom section (buttons, messages)
     *    the file-display section (two file displays & arrow buttons)
     */
    public SSHFileTransferDialog(String title, MindTermApp client,
				 SSHFileTransferFactory fileXferFactory)
    {
	super(client.getParentFrame(), title, false);
//	super(title);
	//this.setFont(client.getParentFrame().getFont());

	this.client          = client;
	this.fileXferFactory = fileXferFactory;

	setLayout(new BorderLayout());
	setBackground(Color.lightGray);
	add("South",  getMainBottomSectionPanel());
	add("Center", getFileDisplayPanel());
	addWindowListener(new AWTConvenience.CloseAdapter(closeButton));
	pack();
    }

    public void setLocalFileBrowser(FileBrowser localBrowser) {
	this.mLocalFileBrowser = localBrowser;
    }

    public void setRemoteFileBrowser(FileBrowser remoteBrowser) {
	this.mRemoteFileBrowser = remoteBrowser;
    }

    /**
     * The main bottom part of the GUI.  Now just contains the error text area
     */
    private Panel getMainBottomSectionPanel() {
	if (mMainBottomSectionPanel == null) {
	    mMainBottomSectionPanel = new Panel(new FlowLayout(FlowLayout.RIGHT));
	    closeButton = new Button("Close");
	    closeButton.addActionListener(new Actions(ACT_CLOSE));
	    mMainBottomSectionPanel.add(closeButton);
	}
	return mMainBottomSectionPanel;
    }

    /** This is the upper section of the GUI, containing the
     *  local & remote file displays and the direction buttons
     *  It is a big-bad-evil GridBagLayout (tm)
     *  The general idea is that the file displays expand
     *  horizontally to fill the remaining space equally and
     *  the arrow buttons float in the center between the
     *  two file displays.
     */
    private Panel getFileDisplayPanel() {
	if (mFileDisplayPanel == null) {
	    mFileDisplayPanel = new Panel(new GridBagLayout());

	    GridBagConstraints gbc = new GridBagConstraints();
 
	    gbc.gridx      = 0;
	    gbc.gridy      = 0;
	    gbc.gridwidth  = 1;
	    gbc.gridheight = 2;
	    gbc.fill       = GridBagConstraints.BOTH;
	    gbc.anchor     = GridBagConstraints.CENTER;
	    gbc.weightx    = 0.5;
	    gbc.weighty    = 1.0;
	    mFileDisplayPanel.add(getLocalFileDisplay(), gbc);

	    gbc.gridx      = 2;
	    gbc.gridy      = 0;
	    gbc.gridwidth  = 1;
	    gbc.gridheight = 2;
	    gbc.fill       = GridBagConstraints.BOTH;
	    gbc.anchor     = GridBagConstraints.CENTER;
	    gbc.weightx    = 0.5;
	    gbc.weighty    = 1.0;
	    mFileDisplayPanel.add(getRemoteFileDisplay(), gbc);

	    gbc.gridx      = 1;
	    gbc.gridy      = 0;
	    gbc.gridwidth  = 1;
	    gbc.gridheight = 1;
	    gbc.fill       = GridBagConstraints.NONE;
	    gbc.anchor     = GridBagConstraints.SOUTH;
	    gbc.weightx    = 0.0;
	    gbc.weighty    = 0.5;
	    gbc.insets     = new Insets(0, 4, 2, 4);
	    mFileDisplayPanel.add(getDownloadButton(), gbc);

	    gbc.gridx      = 1;
	    gbc.gridy      = 1;
	    gbc.gridwidth  = 1;
	    gbc.gridheight = 1;
	    gbc.fill       = GridBagConstraints.NONE;
	    gbc.anchor     = GridBagConstraints.NORTH;
	    gbc.weightx    = 0.0;
	    gbc.weighty    = 0.5;
	    gbc.insets     = new Insets(2, 4, 0, 4);
	    mFileDisplayPanel.add(getUploadButton(), gbc);
	}
	return mFileDisplayPanel;
    }

    /** An instance of FileDisplay for the local system */
    public FileDisplay getLocalFileDisplay() {
	if(mLocalFileDisplay == null) {
	    mLocalFileDisplay = newFileDisplay("Local System");
	}
	return mLocalFileDisplay;
    }

    /** An instance of FileDisplay for the remote system */
    public FileDisplay getRemoteFileDisplay() {
	if(mRemoteFileDisplay == null) {
	    mRemoteFileDisplay = newFileDisplay("Remote System");
	}
	return mRemoteFileDisplay;
    }

    private FileDisplay newFileDisplay(String title) {
	return new FileDisplay(client.getParentFrame(), title, this);
    }

    /** A direction button pointing left */
    private Button getDownloadButton() {
	if (mDownloadButton == null) {
	    mDownloadButton = new Button("<--");
	    mDownloadButton.addActionListener(new Actions(ACT_TOLOCAL));
	}
	return mDownloadButton;
    }

    /** A direction button pointing right */
    private Button getUploadButton() {
	if (mUploadButton == null) {
	    mUploadButton = new Button("-->");
	    mUploadButton.addActionListener(new Actions(ACT_TOREMOTE));
	}
	return mUploadButton;
    }

    public void refresh() {
        if (util.Util.isNetscapeJava()) {
            try {
                netscape.security.PrivilegeManager.enablePrivilege("UniversalFileAccess");
            } catch (netscape.security.ForbiddenTargetException e) {
            }
        }
        
	try {
	    mRemoteFileBrowser.refresh();
	    mLocalFileBrowser.refresh();
	} catch (Exception e) {
	    logError(e);
	}
    }

    /**
     * Initialize the connection to the remote system and
     * start in the SSH home directory on the local system
     */
    public void show() {
        if (util.Util.isNetscapeJava()) {
            try {
                netscape.security.PrivilegeManager.enablePrivilege("UniversalFileAccess");
                netscape.security.PrivilegeManager.enablePrivilege("TerminalEmulator");
            } catch (netscape.security.ForbiddenTargetException e) {
            }
        }

	Dimension sDim = Toolkit.getDefaultToolkit().getScreenSize();

	int width  = (sDim.width > 600 ? 600 : sDim.width);
	int height = (sDim.height > 400 ? 400 : sDim.height);

	setSize(width, height);

	try {
	    mRemoteFileBrowser.initialize();
	    mLocalFileBrowser.initialize();
	} catch (Exception e) {
	    logError(e);
	}
	super.show();
    }

    /**
     * An exception happened, so show the user the message in the text area
     */
    public void logError(Exception e) {
	client.alert(e.getMessage());
    }

}
