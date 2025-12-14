package com.bill4u.impl.micropayments;

public class ChargeResponse extends MPSMessage {
	private String chargeMessage;
	private boolean chargeSuccess;
	private boolean pinError;
	public ChargeResponse(String chargeMessage, boolean chargeSuccess) {
		this(chargeMessage, chargeSuccess, false);
	}
	public ChargeResponse(String chargeMessage, boolean chargeSuccess, boolean pinError) {
		super(ChargeResponse);
		this.chargeMessage = chargeMessage;
		this.chargeSuccess = chargeSuccess;
		this.pinError = pinError;
	}
	public String getChargeMessage() {
		return chargeMessage;
	}
	public boolean getChargeSuccess() {
		return chargeSuccess;
	}
	public boolean getPinError() {
		return pinError;
	}
}
