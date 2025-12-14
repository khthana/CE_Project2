package com.home.service.device.mbus;

public interface MBusPacketListener {
	public void HandleMessage (MBusMessage message);
}