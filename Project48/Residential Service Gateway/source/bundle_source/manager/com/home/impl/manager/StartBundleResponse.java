package com.home.impl.manager;

public class StartBundleResponse extends ManagerMessage {
	private String errorMessage;
	private boolean statusOk;
	public StartBundleResponse(String errorMessage, boolean statusOk) {
		super(StartBundleResponse);
		this.errorMessage = errorMessage;
		this.statusOk = statusOk;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public boolean getStatusOk() {
		return statusOk;
	}
}