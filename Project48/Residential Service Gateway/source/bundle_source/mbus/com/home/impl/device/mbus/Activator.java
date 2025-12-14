package com.home.impl.device.mbus;

import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;
import org.osgi.service.log.LogService;
import org.osgi.framework.*;
import java.net.*;
import java.io.*;
import java.util.*;
import com.home.impl.device.mbus.MBusServiceImpl;
import com.home.impl.locator.mbus.DriverLocatorImpl;
//import javax.sound.sampled.*;
class MBusListenerThread extends Thread {
	private boolean isRunning = false;
	private ServerSocket sock = null;
	private String[] deviceClazzes = {"com.home.service.device.mbus.MBusService","org.osgi.service.device.Device"};
	private BundleContext ctxt = null;
	private Vector clientThreads = null;
	MBusListenerThread (BundleContext ctxt) throws IOException, SocketException {
		int PortNum = 4413;
		final int MaxPortNum = 5000;
		final int ListenBuffer = 16; //length of the queue
		clientThreads = new Vector(5);
		do {
			try {
				sock = new ServerSocket(PortNum,ListenBuffer);
			} catch (BindException e) {
				//System.out.println("Failed to bind to port: " + PortNum); // This code must be removed eventually!
				PortNum++;
				if (PortNum == MaxPortNum) throw new BindException("Failed to bind to all ports in range");
			}
		} while (sock == null);  //-try to bind a port in range(max 5000) 
		sock.setSoTimeout(1000); // Set blocking timeout to 1000ms
		this.ctxt = ctxt;

// Removed.
// Suspected initialisation problem - getServiceReference returns null upon JES box startup as
// no LogService has been registered in the system
// try {
// ServiceReference logRef = ctxt.getServiceReference("org.osgi.service.log.LogService");
// LogService logService = (LogService)ctxt.getService(logRef);
// logService.log(LogService.LOG_DEBUG, "MBus up and running on port " + PortNum);
// } catch (Exception e) {
// System.err.println(e.toString());
// Thread.dumpStack();
// }
		System.out.println("MBus up and running on port: " + PortNum);
	}

	public void start() {
		isRunning = true;
		super.start();
	}

	public void run() {
		MBusServiceImpl mbs = null;
		while (isRunning) {
			try {
				Socket client = sock.accept();
				System.out.println("DEBUG: Client connected!");
				//register the device service
				mbs = new MBusServiceImpl(client,ctxt,clientThreads);
				clientThreads.add(mbs);
				mbs.start();
				client = null;
				} catch (SocketTimeoutException ste) {
					// socket time out exception
				} catch (IOException e) {
					// TO DO...log to OSGI log in future
					System.out.println("Exception : " + e.toString());
					isRunning = false;
				}
			}
	}


	public void stopThread() {
		Enumeration e = clientThreads.elements();
		while (e.hasMoreElements()) {
			MBusServiceImpl msi = (MBusServiceImpl)e.nextElement();
			msi.stopThread();
			try {
				msi.join(3000); //-Waits at most 3000 milliseconds for this thread to die.
			} catch (InterruptedException ie) {
				System.out.println("Thread failed to stop within specified period");
				System.out.println("Exception : " + ie.toString());
			}
		}
		isRunning = false;
	}
}

public class Activator implements BundleActivator {
	private MBusListenerThread servThread = null;
	private ServiceRegistration sr = null;
	public void start(BundleContext ctxt) {
		try {
			Properties props = new Properties();
			props.put("description", "Driver locator service for home-connected inc. mbus devices");
			sr=ctxt.registerService("org.osgi.service.device.DriverLocator", new DriverLocatorImpl(), props);
			servThread = new MBusListenerThread(ctxt);
			} catch (Exception e) {
				// TO DO...log to OSGI log in future
				Thread.dumpStack(); //-Prints a stack trace of the current thread.
				System.out.println("Exception : " + e.toString());
			}
		servThread.start();
	}

	public void stop(BundleContext ctxt) {
		if (sr!=null) sr.unregister(); // Manually unregister DriverLocator service or JES wont shutdown
		if (servThread != null) {
			servThread.stopThread();
			try {
				servThread.join(3000);
			} catch (InterruptedException ie) {
				System.out.println("Thread failed to stop within specified period");
				System.out.println("Exception : " + ie.toString());
			}
			servThread = null;
		}
	}
}