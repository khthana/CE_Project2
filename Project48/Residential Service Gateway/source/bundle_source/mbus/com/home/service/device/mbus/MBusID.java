package com.home.service.device.mbus;

public class MBusID extends MBusMessage {
	String id;

	public MBusID(long tag, String id) {
		super(MBusMessage.MBusID, tag);
		this.id = id;
	}

	public String getID () {
		return id;
	}
}