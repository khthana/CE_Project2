package com.home.service.device.mbus;

import java.io.*;

public class MBusDeviceSpecific extends MBusMessage {
	byte[] serializedObject = null;
	public MBusDeviceSpecific(Object o) {
		super(DeviceSpecific, NoTag);
		try {
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ObjectOutputStream oos = new ObjectOutputStream(baos);
			oos.writeObject(o);
			serializedObject = baos.toByteArray();
		} catch(IOException ioe) {
			System.err.println("Failed to serialize object: " + ioe.toString());
		}
	}

// getObject processing is now done client side 
	public Object getObject() throws ClassNotFoundException {
		if (serializedObject==null) return null;
		try {
			ByteArrayInputStream bis = new ByteArrayInputStream(serializedObject);
			ObjectInputStream ois = new ObjectInputStream(bis);
			return ois.readObject();
		} catch (IOException ioe) {
			System.err.println("Failed to unserialize object: " + ioe.toString());
		return null;
		}
	}

	public byte[] getArray() {
		return serializedObject;
	}

	protected void finalize() {
		serializedObject=null;  //help with garbage collection
	}
}