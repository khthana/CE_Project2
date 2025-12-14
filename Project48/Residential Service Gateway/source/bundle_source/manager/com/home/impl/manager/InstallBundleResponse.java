package com.home.impl.manager;

public class InstallBundleResponse extends ManagerMessage {
	private String errorMessage;
	private boolean installOk;
	public InstallBundleResponse(String errorMessage, boolean installOk) {
		super(InstallBundleResponse);
		this.errorMessage = errorMessage;
		this.installOk = installOk;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public boolean getInstallOk() {
		return installOk;
	}
}