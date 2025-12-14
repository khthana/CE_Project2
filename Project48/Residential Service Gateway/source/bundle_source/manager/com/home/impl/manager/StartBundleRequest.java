package com.home.impl.manager;

public class StartBundleRequest extends ManagerMessage {
	private String bundleURL;
	public StartBundleRequest(String bundleURL) {
		super(StartBundleRequest);
		this.bundleURL = bundleURL;
	}
	public String getBundleURL() {
		return bundleURL;
	}
}