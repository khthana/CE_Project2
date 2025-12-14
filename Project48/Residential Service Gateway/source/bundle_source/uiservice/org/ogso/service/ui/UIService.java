package org.ogso.service.ui;

import javax.swing.*;

public interface UIService {
	public class UIServiceException extends Exception {
		public UIServiceException(String message) {
			super(message);
		}
	}

	public JPanel registerPanel(String tabTitle, Icon tabIcon) throws UIServiceException;
	// exception thrown if a tab with tab title is already present
	public void unregisterPanel(String tabTitle) throws UIServiceException;
	// exception thrown if no tab exists with specified tab title
}