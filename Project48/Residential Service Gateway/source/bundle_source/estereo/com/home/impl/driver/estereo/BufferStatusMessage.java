package com.home.impl.driver.estereo;

import java.io.Serializable;

public class BufferStatusMessage implements Serializable {
	public final static int EMPTY = 0;
	public final static int ALMOST_EMPTY = 1;
	private int status;
	public BufferStatusMessage(int status) {
		this.status = status; //empty or almost_empty
	}
	public int getStatus() {
		return status;
	}
}