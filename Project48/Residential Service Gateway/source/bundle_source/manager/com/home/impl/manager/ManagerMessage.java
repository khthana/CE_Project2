package com.home.impl.manager;

import java.io.Serializable;

public class ManagerMessage implements Serializable {
	private int type = 0;
	static final int InstallBundleRequest = 1;
	static final int InstallBundleResponse = 2;
	static final int StartBundleRequest = 3;
	static final int StartBundleResponse = 4;
	public ManagerMessage (int type) {
		this.type = type;
	}
	public int getType () {
		return type;
	}
}
