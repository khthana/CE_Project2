
package sshcommon;

import java.awt.*;
import java.awt.event.*;

import application.MindTermApp;

import gui.ProgressBar;
import gui.AWTConvenience;
import gui.AWTGridBagContainer;

import util.StringUtil;

public final class SSHFileTransferGUIThread extends Thread
    implements SSHFileTransferProgress, ActionListener
{
    boolean               recursive, background, toRemote;
    SSHFileTransferDialog xferDialog;
    MindTermApp           client;

    String[]    localFileList;
    String[]    remoteFileList;

    Dialog          copyIndicator;
    ProgressBar     progress;
    SSHFileTransfer fileXfer;
    Thread          copyThread;
    Label           srcLbl, dstLbl, sizeLbl, nameLbl, speedLbl;
    Button          cancB;
    long            startTime;
    long            lastTime;
    long            totTransSize;
    long            fileTransSize;
    long            curFileSize;
    long            lastSize;
    int             fileCnt;
    boolean         doneCopying;

    volatile boolean userCancel;

    boolean isCopyThread;

    public SSHFileTransferGUIThread(MindTermApp client,
				    SSHFileTransfer fileXfer,
			    String[] localFileList, String[] remoteFileList,
			    boolean recursive, boolean background,
			    boolean toRemote, SSHFileTransferDialog xferDialog)
	throws Exception
    {
        setName("SSHFileTransferGUIThread1");

	isCopyThread = false;

        if (util.Util.isNetscapeJava()) {
            try {
                netscape.security.PrivilegeManager.enablePrivilege("UniversalFileAccess");
            } catch (netscape.security.ForbiddenTargetException e) {
            }
        }
    
	this.localFileList  = localFileList;
	this.remoteFileList = remoteFileList;

	if(!toRemote) {
	    if(localFileList.length > 1) {
		throw new Exception("Ambiguous local target");
	    }
	} else {
	    if(remoteFileList.length > 1) {
		throw new Exception("Ambiguous remote target");
	    }
	}

	this.client        = client;
	this.fileXfer      = fileXfer;
	this.recursive     = recursive;
	this.background    = background;
	this.toRemote      = toRemote;
	this.fileCnt       = 0;
	this.doneCopying   = false;
	this.startTime     = 0;
	this.lastTime      = 0;
	this.totTransSize  = 0;
	this.fileTransSize = 0;
	this.lastSize      = 0;
	this.xferDialog  = xferDialog;
	this.start();
    }

    public void run() {
	// !!! OUCH
	if(isCopyThread) {
	    copyThreadMain();
	} else {
	    createGUIAndCopyThread();
	}
    }

    private void copyThreadMain() {

        if (util.Util.isNetscapeJava()) {
            try {
                netscape.security.PrivilegeManager.enablePrivilege("UniversalFileAccess");
                netscape.security.PrivilegeManager.enablePrivilege("TerminalEmulator");
            } catch (netscape.security.ForbiddenTargetException e) {
            }
        }
        
	try {
	    nameLbl.setText("...connected");
	    fileXfer.setProgress(this);
	    if(toRemote) {
		fileXfer.copyToRemote(localFileList, remoteFileList[0],
				      recursive);
	    } else {
		fileXfer.copyToLocal(localFileList[0], remoteFileList,
				     recursive);
	    }

	    copyThread.setPriority(Thread.NORM_PRIORITY);
	} catch (Exception e) {
	    if(!userCancel) {
		client.alert("File Transfer Error: " + e.getMessage());
	    }
	} finally {
	    try {
		Toolkit.getDefaultToolkit().beep();
	    } catch (Throwable t) {
		/* What can we do... */
	    }
	}

	nameLbl.setText("Copied " + fileCnt + " file" + (fileCnt != 1 ? "s" : "") + ".");
	sizeLbl.setText(StringUtil.nBytesToString(totTransSize, 4));
	doneCopying = true;
        if(fileXfer != null)
            fileXfer.abort();
	cancB.setLabel("Done");

	xferDialog.refresh();

	AWTConvenience.setKeyListenerOfChildren(copyIndicator,
			new AWTConvenience.OKCancelAdapter(cancB, cancB),
						null);
    }

    private void createGUIAndCopyThread() {
	String sourceFile = "localhost:" + unQuote(localFileList[0]);
	String destFile   = client.getHost() + ":" + unQuote(remoteFileList[0]);

	if(!toRemote) {
	    String tmp;
	    tmp        = sourceFile;
	    sourceFile = destFile;
	    destFile   = tmp;
	}

	copyIndicator = new Dialog(client.getParentFrame(),
				   "MindTerm - File Transfer", false);

	Label               lbl;
	AWTGridBagContainer grid  = new AWTGridBagContainer(copyIndicator);

	lbl = new Label("Source:");
	grid.add(lbl, 0, 1);
	  
	srcLbl = new Label(cutName(sourceFile, 32));
	grid.add(srcLbl, 0, 4);

	lbl = new Label("Destination:");
	grid.add(lbl, 1, 1);
	  
	dstLbl = new Label(cutName(destFile, 32));
	grid.add(dstLbl, 1, 4);

	lbl= new Label("Current:");
	grid.add(lbl, 2, 1);

	nameLbl = new Label("connecting...");
	grid.add(nameLbl, 2, 3);

	sizeLbl = new Label("");
	grid.add(sizeLbl, 2, 1);

	grid.getConstraints().fill   = GridBagConstraints.NONE;
	grid.getConstraints().anchor = GridBagConstraints.CENTER;
	grid.getConstraints().insets = new Insets(4, 12, 4, 4);

	progress = new ProgressBar(512, 160, 20);
	grid.add(progress, 3, 3);

	grid.getConstraints().fill   = GridBagConstraints.HORIZONTAL;
	grid.getConstraints().insets = new Insets(4, 4, 4, 4);

	speedLbl = new Label("0.0 kB/sec", Label.CENTER);
	grid.add(speedLbl, 3, GridBagConstraints.REMAINDER);

	cancB = new Button("Cancel");
	cancB.addActionListener(this);

	grid.getConstraints().fill  = GridBagConstraints.NONE;
	grid.getConstraints().ipadx = 2;
	grid.getConstraints().ipady = 2;

	grid.add(cancB, 4, GridBagConstraints.REMAINDER);

	AWTConvenience.setBackgroundOfChildren(copyIndicator);

	Dimension d = speedLbl.getSize();
	d.width += d.width * 2;
	speedLbl.setSize(d);
	sizeLbl.setSize(d);

	copyIndicator.setResizable(true);
	copyIndicator.pack();
	AWTConvenience.placeDialog(copyIndicator);

	// !!! OUCH
	isCopyThread = true;
	copyThread = new Thread(this, "SSHFileTransferGUIThread2");

	if(background) {
	    copyThread.setPriority(Thread.MIN_PRIORITY);
	}

	copyThread.start();

	copyIndicator.setVisible(true);
    }

    public void startFile(String file, long size) {
	sizeLbl.setText(StringUtil.nBytesToString(size, 4));
	nameLbl.setText(unQuote(file));
	progress.setMax(size, true);
	lastTime = System.currentTimeMillis();
	if(startTime == 0)
	    startTime = lastTime;
	curFileSize   = size;
	fileTransSize = 0;
	fileCnt++;
    }
    public void startDir(String file) {
	if(startTime == 0)
	    startTime = System.currentTimeMillis();
	if(toRemote) {
	    srcLbl.setText(cutName("localhost:" + unQuote(file), 32));
	} else {
	    dstLbl.setText(cutName("localhost:" + unQuote(file), 32));
	}
    }

    public void endFile() {
	progress.setValue(curFileSize, true);
    }

    public void endDir() {
    }

    public void progress(int size) {
	totTransSize  += (long)size;
	fileTransSize += (long)size;
	if((curFileSize > 0) &&
	   ((((totTransSize - lastSize) * 100) / curFileSize) >= 1)) {
	    progress.setValue(fileTransSize, !background);
	    long   now      = System.currentTimeMillis();
	    long   elapsed  = (now - startTime);
	    if(elapsed > 0) {
		long curSpeed = (long)((double)totTransSize /
				       ((double)elapsed / 1000));
		elapsed = (now - lastTime);
		if(elapsed == 0) {
		    elapsed = 1;
		}
		curSpeed += (long)((double)(totTransSize - lastSize) /
				   ((double)elapsed / 1000));
		curSpeed >>>= 1;
		speedLbl.setText(StringUtil.nBytesToString(curSpeed, 4) + "/sec");
	    }
	    lastSize = totTransSize;
	    lastTime = now;
	}
    }

    String cutName(String name, int len) {
	if(name.length() > len) {
	    len -= 3;
	    String pre = name.substring(0, len / 2);
	    String suf = name.substring(name.length() - (len / 2));
	    name = pre + "..." + suf;
	}
	return name;
    }

    String unQuote(String str) {
	if(str.charAt(0) == '"') {
	    str = str.substring(1, str.length() - 1);
	}
	return str;
    }

    public void actionPerformed(ActionEvent e) {
	if(!doneCopying) {
	    userCancel = true;
	    if(fileXfer != null)
		fileXfer.abort();
	    Thread.yield();
	    if(copyThread != null)
		copyThread.stop();
	}
	copyIndicator.setVisible(false);
    }

}
