//micropayment service message 
package com.bill4u.impl.micropayments;

import java.io.Serializable;

public class MPSMessage implements Serializable {
	private int type = 0;
	public static final int SignupRequest = 1;
	public static final int SignupResponse = 2;
	public static final int ChargeRequest = 3;
	public static final int ChargeResponse = 4;
	public MPSMessage(int type) {
		this.type = type;
	}
	public int getType () {
		return type;
	}
}