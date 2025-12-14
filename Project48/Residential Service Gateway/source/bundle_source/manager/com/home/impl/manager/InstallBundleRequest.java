package com.home.impl.manager;

public class InstallBundleRequest extends ManagerMessage {
	private String bundleURL;
	private String certURL;
	public InstallBundleRequest(String bundleURL, String certURL) {
		super(InstallBundleRequest);
		this.bundleURL = bundleURL;
		this.certURL = certURL;
	}
	public String getBundleURL() {
		return bundleURL;
	}

	public String getCertURL() {
		return certURL;
	}
}
