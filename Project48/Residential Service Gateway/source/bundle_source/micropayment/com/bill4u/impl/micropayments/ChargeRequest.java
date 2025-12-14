package com.bill4u.impl.micropayments;

public class ChargeRequest extends MPSMessage {  //object sended to MPServer after user enter pin num. 
	private String acctNumber;
	private String pinNumber;
	private String chargeInfo;
	private String signupID; //reside in permanent storage
	private String vendorID;
	private int chargeAmount;
	public ChargeRequest(String acctNumber, String pinNumber, String chargeInfo, int chargeAmount, String signupID,String vendorID) {
		super(ChargeRequest);
		this.acctNumber = acctNumber;
		this.pinNumber = pinNumber;
		this.chargeInfo = chargeInfo;
		this.signupID = signupID;
		this.chargeAmount = chargeAmount;
		this.vendorID = vendorID;
	}
	public String getAcctNumber() {
		return acctNumber;
	}
	public String getPinNumber() {
		return pinNumber;
	}
	public String getChargeInfo() {
		return chargeInfo;
	}
	public String getSignupID() {
		return signupID;
	}
	public String getVendorID() {
		return vendorID;
	}
	public int getChargeAmount() {
		return chargeAmount;
	}
}