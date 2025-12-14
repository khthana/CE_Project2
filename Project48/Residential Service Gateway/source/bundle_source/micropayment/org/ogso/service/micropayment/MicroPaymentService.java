package org.ogso.service.micropayment;

public interface MicroPaymentService {
	public boolean makeCharge(String ChargeInfo, String vendorID, String vendorName, int chargeAmount);
}
