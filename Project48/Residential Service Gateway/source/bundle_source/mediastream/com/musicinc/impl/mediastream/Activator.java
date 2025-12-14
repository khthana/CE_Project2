package com.musicinc.impl.mediastream;

import org.osgi.framework.*;
import org.ogso.service.ui.*;
import org.ogso.service.estereo.*;
import org.ogso.service.micropayment.*;

public class Activator implements BundleActivator {
	TrackSelectorPanel tsp = null;
	PlayListPanel plp = null;
	QueuePanel qp = null;
	PanelController pc = null;
	public void start(BundleContext ctxt) throws Exception {
		// Get the UI Service object
		ServiceReference sr = ctxt.getServiceReference("org.ogso.service.ui.UIService");
		if (sr == null) throw new Exception("UI Service not registered!");
		UIService uis = (UIService) ctxt.getService(sr);
		sr = ctxt.getServiceReference("org.ogso.service.micropayment.MicroPaymentService");
		if (sr==null) throw new Exception ("Micro billing service not registered!");
		MicroPaymentService mps = (MicroPaymentService)ctxt.getService(sr);
		sr = ctxt.getServiceReference("org.ogso.service.estereo.EStereoDevice");
		if (sr==null) throw new Exception ("EStereo Device service not registered!");
		EStereoDevice stereo = (EStereoDevice) ctxt.getService(sr);
		pc = new PanelController();
		tsp = new TrackSelectorPanel(uis, pc);
		plp = new PlayListPanel(uis, pc, mps);
		qp = new QueuePanel(uis, pc, stereo);
	}
	public void stop(BundleContext ctxt) throws Exception {
		// Get the UI Service object
		ServiceReference sr = ctxt.getServiceReference("org.ogso.service.ui.UIService");
		if (sr == null) throw new Exception("UI Service not registered!");
		UIService uis = (UIService) ctxt.getService(sr);
		uis.unregisterPanel("MUSIC-CONNECTED INC: Search");
		uis.unregisterPanel("MUSIC-CONNECTED INC: Playlist");
		uis.unregisterPanel("MUSIC-CONNECTED INC: Queue");
		tsp = null;
		plp = null;
		qp = null;
	}
}