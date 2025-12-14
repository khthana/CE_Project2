package com.home.impl.device.mbus;

import org.osgi.framework.*;
import com.home.service.device.mbus.*;
import java.util.*;
import java.io.*;
import java.net.*;

public class MBusServiceImpl extends Thread implements MBusService {
	private Socket sock = null;
	private ServiceRegistration sr = null;
	private boolean isRunning = false;
	private Vector listeners;
	private ObjectOutputStream oos;
	private ObjectInputStream ois;
	private String[] deviceClazzes = {"org.osgi.service.device.Device","com.home.service.device.mbus.MBusService"};
	private Vector clientThreads;
	private boolean debug = false;
	MBusServiceImpl(Socket sock, BundleContext ctxt, Vector clientThreads) throws IOException {
		if (debug) System.out.println("DEBUG: Entering MBusServiceImpl constructor...");
		this.sock = sock;
		this.listeners = new Vector(1);
		this.clientThreads = clientThreads;
		oos = new ObjectOutputStream (sock.getOutputStream());
		ois = new ObjectInputStream (sock.getInputStream());
		// get device id of connecting client
		Object obj = null;
		try {
			obj = ois.readObject();
			if (! obj.getClass().getName().equals("com.home.service.device.mbus.MBusID")) throw new IOException("Error - no MBusID object!");
			} catch (ClassNotFoundException cnfe) {
				throw new IOException("Error - unrecognised client connection");
			}
		MBusID id = (MBusID) obj;
		sock.setSoTimeout(1000); // set blocking timeout
		if (debug) System.out.println("DEBUG: Going to register MBusService...");
		Properties props = new Properties();
		props.put("DEVICE_CATEGORY", "MBus");
		props.put("DEVICE_MAKE", "home-connected inc.");
		props.put("MBUS_ID", id.getID());
		sr = ctxt.registerService(deviceClazzes,this,props);
		if (debug) System.out.println("DEBUG: Registering service!!");
	}

	public void start() {
		isRunning = true;
		super.start();   //thread.start()
	}

	public void run() {
		while (isRunning) {
			try {
				Object obj = ois.readObject();
				if (!obj.getClass().getSuperclass().getName().equals("com.home.service.device.mbus.MBusMessage")) {
					System.err.println("Error...read class: " + obj.getClass().getName() + " - unknown!");
					obj = null;
				} else {
					if (debug) System.out.println("DEBUG (MBUS HANDLER THREAD): Recieved message!");
					synchronized (listeners) {
						for (int i = 0; i < listeners.size(); i++) {
							MBusPacketListener l = (MBusPacketListener) listeners.elementAt(i);
							l.HandleMessage((MBusMessage) obj);
							obj = null;
						}
					}
				}
			} catch (SocketTimeoutException ste) {
				// do nothing...just timed out
			} catch (IOException e) {
				System.err.println("An IO Exception	occured :" + e.toString());
				if (sr != null) {
					// unregister the service
					sr.unregister();
				}
				sr = null;
				isRunning = false;
			} catch (ClassNotFoundException e) {
				System.err.println("Class not found exception: " + e.toString());
			}
		}

		clientThreads.remove(this);
	}

	public void stopThread() {
		isRunning = false;
	}

	public void noDriverFound() {
	}

	public void WriteMessage (MBusMessage message) {
		if (debug) System.out.println("DEBUG: Someone called writemessage!");
		try {
			oos.writeObject(message);
			oos.reset();
		} catch (IOException e) {
			if (sr != null) {
			// unregister the service
			sr.unregister();
			}
			sr = null;
			isRunning = false;
		}
	}

	public void AddListener (MBusPacketListener l) {
		listeners.addElement(l);
	}

	public void RemoveListener (MBusPacketListener l) {
		listeners.removeElement(l);
	}
}