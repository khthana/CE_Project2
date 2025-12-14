package com.home.impl.driver.estereo;

import org.osgi.framework.*;
import com.home.service.device.mbus.MBusService;
import org.osgi.service.device.*;
import java.util.Properties;

class DriverImpl implements Driver, ServiceListener {
	private ServiceRegistration reg = null;
	private BundleContext ctxt = null;
	private ServiceReference MBusSR = null;
	private boolean debug = false;
	DriverImpl(BundleContext ctxt) {
		this.ctxt = ctxt;
		// add a service listener
		String filter ="(objectClass=com.home.service.device.mbus.MBusService)";
		try {
			ctxt.addServiceListener(this, filter);
		} catch (InvalidSyntaxException ise) {
		// should never happen
		}	
	}

	public int match(ServiceReference sr) {
		String category = (String) sr.getProperty("DEVICE_CATEGORY");
		String make = (String) sr.getProperty("DEVICE_MAKE");
		String DeviceID = (String) sr.getProperty("MBUS_ID");
		if (debug) System.out.println("DEBUG: Attempting to match : " + (category==null?"null":category) + ":" + (make==null?"null":make) + ":" +(DeviceID==null?"null":DeviceID));
		// if not a MBus device then return
		if (DeviceID == null) return Device.MATCH_NONE;
		// if not a recognised devicethen return
		if (!category.equals("MBus") || !make.equals("home-connected inc.") || !DeviceID.equals("AdvancedeStereo400")) return Device.MATCH_NONE;
		if (debug) System.out.println("DEBUG: driver match ok");
		//must be a recognised device!!!
		return MBusService.MATCH_OK;
	}

	public String attach(ServiceReference sr) {
		if (debug) System.out.println("DEBUG: Attempting to attach driver...");
		MBusSR = sr;
		String[] deviceClazzes = new String[]{"org.osgi.service.device.Device", "org.ogso.service.estereo.EStereoDevice"};
		Properties props = new Properties();
		props.put("DEVICE_CATEGORY", "eStereo");
		props.put("DEVICE_MAKE", "home-connected inc.");
		// pass the service reference for the mbus service
		reg = ctxt.registerService(deviceClazzes, new EStereoDeviceImpl(sr, ctxt), props);
		return null;
	}

	public void serviceChanged(ServiceEvent e) {
		if (e.getType() == ServiceEvent.UNREGISTERING) {
			if (e.getServiceReference().equals(MBusSR) && reg != null) {
				// stop the thread running in the service before unregistering!!
				((EStereoDeviceImpl) ctxt.getService(reg.getReference())).stopRunning();
				reg.unregister();
				reg = null;
			}
		}
	}
}

public class Activator implements BundleActivator {
	private ServiceRegistration sr = null;
	public void start(BundleContext ctxt) {
		Properties props = new Properties();
		props.put("DRIVER_ID","com.home.service.driver.estereo");
		props.put("description", "Generic driver for the entire home-connected inc. E-Stereo");
		sr = ctxt.registerService("org.osgi.service.device.Driver", new DriverImpl(ctxt), props);
	}
	public void stop(BundleContext ctxt) {
		if (sr!=null) {
			sr.unregister();
			sr = null;
		}
	}
}
