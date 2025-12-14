package com.home.impl.locator.mbus;

import java.util.*;
import java.net.*;
import java.io.*;
import org.osgi.service.device.*;
import java.util.Properties;

public class DriverLocatorImpl implements DriverLocator {
	private Properties driverIDHash;
	private Properties driverURLHash;
	private boolean debug = false;
	public String[] findDrivers(Dictionary props) {
		//props.get ->Returns the value to which the key is mapped in this dictionary
		String dc = (String) props.get("DEVICE_CATEGORY");
		String make = (String) props.get("DEVICE_MAKE");
		String mbusid = (String) props.get("MBUS_ID");
		String devIDs = null;
		if (debug) System.out.println("Calling findDrivers for : " + (dc==null?"NULL":dc) + ", " + (make==null?"NULL":make) + ", " + (mbusid==null?"NULL":mbusid));
		if (! dc.equalsIgnoreCase("mbus")) {
			if (debug) System.out.println("Device category match failed");
			return null;
		}
		if (! make.equalsIgnoreCase("home-connected inc.")) {
			if (debug) System.out.println("Device maker match failed");
			return null;
		}

		devIDs = driverIDHash.getProperty(mbusid); //Searches for the property with the specified key 
		if (devIDs == null) {
			if (debug) System.out.println("deviceIDHash lookup failed");
			return null;
		}
		String[] did = devIDs.split(" "); // Split on " " in the file
		if (debug) System.out.println("findDrivers() succeeded");
		return did;
	}

	public InputStream loadDriver(String id) throws IOException {
		if (debug) System.out.println("Attemping to load driver: " + id);
		URL dURL = new URL(driverURLHash.getProperty(id));
		if (dURL == null) return null;
		return dURL.openStream();
	}

	public DriverLocatorImpl () throws IOException {
		try {
			URL dl = null;
			URL du = null;
			try {
				dl = new URL("http://161.246.5.114:8001/drivers/deviceid.list"); // location of Driver ID file
				du = new URL("http://161.246.5.114:8001/drivers/driverurls.list"); // location of driver URL file
			} catch (MalformedURLException mue) {
				if (dl == null) System.err.println("Error: URL invalid...cannot load driver ID list");
				else System.err.println("Error: URL invalid...cannot load driver URL list");
			}
			driverIDHash = new Properties();
			//dl.openStream() ->Open connection to this URL and returns an InputStream 
			driverIDHash.load(dl.openStream()); 
			driverURLHash = new Properties();
			driverURLHash.load(du.openStream()); 
		} catch (IOException e) {
			System.err.println("Driver Locator Constructor Exception: " + e.toString());
			throw e;
		}
	}
}