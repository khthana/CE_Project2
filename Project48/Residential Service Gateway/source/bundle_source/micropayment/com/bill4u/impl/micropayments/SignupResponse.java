package com.bill4u.impl.micropayments;

public class SignupResponse extends MPSMessage { //send signup id back to micropayment service
	private String message;
	private boolean signupOk;
	private String signupID;
	public SignupResponse(String message, boolean signupOk, String signupID) {
		super(SignupResponse);
		this.message = message;
		this.signupOk = signupOk;
		this.signupID = signupID;
	}
	public SignupResponse(String message, boolean signupOk) {
		this(message, signupOk, "No Signup ID");
	}
	public String getMessage() {
		return message;
	}
	public String getSignupID() {
		return signupID;
	}
	public boolean getSignupOk() {
		return signupOk;
	}
}