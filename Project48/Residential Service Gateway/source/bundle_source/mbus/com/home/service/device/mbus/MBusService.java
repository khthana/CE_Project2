package com.home.service.device.mbus;

import org.osgi.service.device.Device;

public interface MBusService extends Device {  //extends Device wishing to be discovered by driverlocator service
	public final static int MATCH_OK = 1;
	public void WriteMessage (MBusMessage message);
	public void AddListener (MBusPacketListener l);
	public void RemoveListener (MBusPacketListener l);
}
