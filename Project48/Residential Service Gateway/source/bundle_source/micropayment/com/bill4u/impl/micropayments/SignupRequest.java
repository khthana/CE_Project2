package com.bill4u.impl.micropayments;

public class SignupRequest extends MPSMessage {  //send to MPServer
	private String custAcctNumber;
	public SignupRequest(String custAcctNumber) {
		super(SignupRequest);
		this.custAcctNumber = custAcctNumber;
	}
	public String getcustAcctNumber() {
		return custAcctNumber;
	}
}