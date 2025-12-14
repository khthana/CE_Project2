package com.bill4u.impl.micropayments;

import org.osgi.framework.*;
import org.ogso.service.ui.*;
import java.io.*;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.net.*;
import java.util.Properties;

class PanelManager implements ActionListener, Runnable {
	JPanel panel = null;
	UIService uis = null;
	File userData = null;
	PinPanel pp = new PinPanel(8);
	JTextArea subheader = null;
	boolean panelCreated = false;
	Activator a = null;
	PanelManager(UIService uis, File userData, Activator a) throws Exception {
		this.uis = uis;
		this.userData = userData;
		this.a = a;
		try {
			panel = uis.registerPanel("BILL4U Signup",null);
			panelCreated = true;
		} catch (UIService.UIServiceException e) {
			// should never happen
			throw new Exception("Error adding panel");
		}
		GridBagLayout gridbag = new GridBagLayout();
		GridBagConstraints c = new GridBagConstraints();
		panel.setLayout(gridbag);
		c.weightx = 0;
		c.weighty = 1;
		c.anchor = GridBagConstraints.NORTH;
		c.fill = GridBagConstraints.BOTH;
		JLabel header = new JLabel("<html><u><CENTER><font size=+1>Bill4u inc. Micro-Payments Signup</font></CENTER></u></html>");
		c.gridwidth = GridBagConstraints.REMAINDER;
		c.gridheight = 10;
		gridbag.setConstraints(header, c);
		panel.add(header);
		subheader = new JTextArea("To complete the signup process, enter your customer ID.");
		subheader.setOpaque(false);
		subheader.setEditable(false);
		subheader.setLineWrap(true);
		subheader.setWrapStyleWord(true);
		subheader.setHighlighter(null);
		gridbag.setConstraints(subheader, c);
		panel.add(subheader);
		// get and configure a PinPanel object
		pp.setActionListener(this);
		c.gridheight = 80;
		c.weighty = 4;
		c.weightx = 1;
		gridbag.setConstraints(pp, c);
		panel.add(pp);
		panel.validate();
	}

	public void DestroyPanel() {
		try {
			if (panelCreated) {
				uis.unregisterPanel("BILL4U Signup");
				panelCreated = false;
			}
		} catch (UIService.UIServiceException e) {
			// should never happen
			System.err.println("Error removing panel");
		}
	}
	public void actionPerformed(ActionEvent evt) {
		Thread processSignup = new Thread(this);
		pp.setEnabled(false);
		subheader.setText("Please wait, contacting MicroPayment server...");
		panel.repaint();
		processSignup.start();
	}
	public void run() {
		Socket sock = null;
		ObjectInputStream ois = null;
		ObjectOutputStream oos = null;
		try {
			sock = new Socket("161.246.5.116",1024); //Host and Port number to Micro Payments server
			ois = new ObjectInputStream(sock.getInputStream());
			oos = new ObjectOutputStream(sock.getOutputStream());
			SignupRequest sr = new SignupRequest(pp.getPin());
			oos.writeObject(sr);
		} catch (Exception e) {
			subheader.setText("Error contacting server...please contact technical support");
			pp.setEnabled(true);
			return;
		}
		try {
			Object obj = ois.readObject();
			if (!obj.getClass().getName().equals("com.bill4u.impl.micropayments.SignupResponse")) {
				System.err.println("Error: unexpected class returned" + obj.getClass().getName());
				return;
			}
			SignupResponse sresp = (SignupResponse) obj;
			if (sresp.getSignupOk()) {
				userData.createNewFile();
				FileOutputStream fos = new FileOutputStream(userData);
				Properties props = new Properties();
				props.setProperty("custID", pp.getPin());
				props.setProperty("signupID",sresp.getSignupID());
				props.store(fos, "Micropayment Signup Data");
				fos.close();
				// re-register the service to get the new configuration information
				a.registerService(pp.getPin(),sresp.getSignupID());
				subheader.setText("Thank you. The MicroPayment software has now been installed and is ready for use.");
				panel.repaint();
				try {
					Thread.sleep(5000);
					DestroyPanel();
				} catch (InterruptedException e) {
					System.err.println(e.toString());
				}
			} else {
				subheader.setText(sresp.getMessage());
				panel.repaint();
				pp.setEnabled(true);
			}
		} catch (ClassNotFoundException cnfe) {
			subheader.setText("Error communicating with server...please contact technical support");
			pp.setEnabled(true);
			System.err.println("Error - read object found unrecognised class!");
			return;
		} catch (IOException ioe) {
			subheader.setText("Error communication with server...please contact technical support");
			pp.setEnabled(true);
			System.err.println("Error - IO Exception encountered: " + ioe.toString());
			return;
		}
		try {
			ois.close();
			oos.close();
			sock.close();
			return;
		} catch (Exception e) {
			System.err.println(e.toString());
			return;
		}
	}
}


public class Activator implements BundleActivator, ServiceListener {
	PanelManager pm = null;
	BundleContext ctxt = null;
	ServiceRegistration mpsr = null;
	public void start(BundleContext ctxt) throws Exception {
		this.ctxt = ctxt;
		File userData = null;
		userData = ctxt.getDataFile("customerData");
		if (userData == null) throw new Exception("NO PERSISTANT STORAGE!");
		ctxt.addServiceListener(this,"(objectClass=org.ogso.service.ui.UIService)");
		if (!userData.exists()) {
			// Finish signing up the user
			// Get the UI Service object
			ServiceReference sr = ctxt.getServiceReference("org.ogso.service.ui.UIService");
			if (sr == null) throw new Exception("UI Service not registered!");
			UIService uis = (UIService) ctxt.getService(sr);
			// create the panel manager, pass Activator so we can restart the bundle once signup is complete
			pm = new PanelManager(uis, userData, this);
		} else {
			// get user info from persistant storage
			FileInputStream fis = new FileInputStream(userData);
			Properties userInfo = new Properties();
			userInfo.load(fis);
			String custID = userInfo.getProperty("custID");
			String signupID = userInfo.getProperty("signupID");
			registerService(custID, signupID);
		}
	}
	public void stop(BundleContext ctxt) throws Exception {
		if (mpsr!=null) mpsr.unregister();
		mpsr = null;
		if (pm != null) {
			pm.DestroyPanel();
			pm = null;
		}
		ctxt.removeServiceListener(this);
		this.ctxt = null;
	}

	public void serviceChanged(ServiceEvent e) {
		// this code is listening to the user interface service. Should that service shut down, we do too as we cannot continue running
		if (e.getType() == ServiceEvent.UNREGISTERING &&ctxt != null) {
			try {
				ctxt.getBundle().stop();
			} catch(BundleException be) {
				System.err.println(be.toString());
			}
		}
	}

	public void registerService(String custID, String signupID) {
		Properties mpsProps = new Properties();
		mpsProps.put("description", "bill4u MicroPayment Billing Client Service");
		mpsr = ctxt.registerService("org.ogso.service.micropayment.MicroPaymentService", new MicroPaymentServiceImpl(ctxt, custID, signupID),mpsProps);
	}
}