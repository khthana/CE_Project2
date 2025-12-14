package com.home.impl.ui;

import javax.swing.*;
import org.osgi.framework.*;
import java.util.Properties;
import org.ogso.service.ui.*;

class UIImpl extends JFrame implements UIService {
	JTabbedPane jtp;
	public UIImpl() {
		// configure the JFrame
		super("Remote Control");  //create frame titled "Remote Control"
		setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE); //Sets the operation that will happen by default when the user initiates a "close" on this frame
		setSize(300, 500);
		// create and add the tabbed panel
		jtp = new JTabbedPane();
		getContentPane().add(jtp);
		// make it all visible
		setVisible(true);
	}

	public JPanel registerPanel(String tabTitle, Icon tabIcon) throws UIServiceException {
		// check if tab has unique name
		// jtp.indexOfTab(tabTitle) -> Returns the first tab index with a given title, or -1 if no tab has this title
		if(jtp.indexOfTab(tabTitle) != -1) throw new UIServiceException("Tab with name: " + tabTitle + " already exists");
		JPanel jp = new JPanel();
		jtp.addTab(tabTitle, tabIcon, jp);
		return jp;
	}

	public void unregisterPanel(String tabTitle) throws UIServiceException {
		if(jtp.indexOfTab(tabTitle) == -1) throw new UIServiceException("Tab with name: " + tabTitle + " does not exist");
		// remove tab
		try {
			jtp.removeTabAt(jtp.indexOfTab(tabTitle));
		} catch (IndexOutOfBoundsException e) {
			// should never occur
			throw new UIServiceException("Index out of bounds");
		}
	}
}

public class Activator implements BundleActivator {
	private ServiceRegistration sr = null;
	private UIImpl ui = null;
	public void start(BundleContext ctxt) {
		ui = new UIImpl();
		Properties uiProps = new Properties();
		uiProps.put("author", "home-connected.inc");
		uiProps.put("description", "Standard user interface service");
		sr = ctxt.registerService("org.ogso.service.ui.UIService", ui, uiProps);
	}

	public void stop(BundleContext ctxt) {
		if (sr != null) {
			sr.unregister();
			sr = null;
			ui.dispose(); //-Releases all of the native screen resources used by this Window
			ui=null;
		}
	}
}