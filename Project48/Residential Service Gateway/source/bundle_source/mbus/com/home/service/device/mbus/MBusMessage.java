package com.home.service.device.mbus;

import java.io.Serializable;

public class MBusMessage implements Serializable {  //-implements Serializable to make instances of this class serializable 
	private long type = 0;
	private long tag;//-to pair response msg with original
	private static long tagCounter = 0;
	public final static long NoTag = 0;
	public final static long DeviceSpecific = 0; // Messages intended for devices on the MBus
	public final static long MBusID = 1; // Standard message type
	public MBusMessage (long type, long tag) {
		this.type = type;
		this.tag = tag;
	}

	public long getType () {
		return type;
	}

	public long getTag () {
		return tag;
	}

	public static long getNewTag() {
		if (tagCounter==0) tagCounter++;
		return tagCounter++;
	}
}