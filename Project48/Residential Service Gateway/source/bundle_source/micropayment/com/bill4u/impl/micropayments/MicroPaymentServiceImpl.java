package com.bill4u.impl.micropayments;

import org.ogso.service.micropayment.*;
import org.ogso.service.ui.*;
import org.osgi.framework.*;
import java.awt.event.*;
import javax.swing.*;
import java.awt.*;
import java.net.*;
import java.io.*;

public class MicroPaymentServiceImpl implements MicroPaymentService, ActionListener{
	String custID = null;
	String signupID = null;
	BundleContext ctxt = null;
	boolean pinEntered = false;
	boolean cancelSelected = false;
	JButton btnCancel = null;
	PinPanel pp = null;
	class MicroPaymentException extends Exception {
		boolean retVal;
		MicroPaymentException(String msg, boolean retVal) {
			super(msg);
			this.retVal = retVal;
		}
		public boolean getRetVal() {
			return retVal;
		}
	}
	MicroPaymentServiceImpl(BundleContext ctxt, String custID, String signupID) {
		this.custID = custID;
		this.signupID = signupID;
		this.ctxt = ctxt;
	}
	public boolean makeCharge(String chargeInfo, String vendorID, String vendorName, int chargeAmount) {
		JPanel panel = null;
		pp = new PinPanel(4);
		ServiceReference sr = ctxt.getServiceReference("org.ogso.service.ui.UIService");
		if (sr == null) {
			System.err.println("Error UIService not yet registered.");
			return false;
		}
		UIService uis = (UIService) ctxt.getService(sr);
		try {
			panel = uis.registerPanel("BILL4U Confirm", null);
		} catch (UIService.UIServiceException e) {
			// should never happen
			System.err.println("Error adding Panel.");
			return false;
		}
		// create our panel
		GridBagLayout gridbag = new GridBagLayout();
		GridBagConstraints c = new GridBagConstraints();
		panel.setLayout(gridbag);
		c.weightx = 0; //Specifies how to distribute extra horizontal space
		c.weighty = 1; //Specifies how to distribute extra vertical space
		c.anchor = GridBagConstraints.NORTH; 
		c.fill = GridBagConstraints.BOTH; //Make the component fill its display area entirely
		JLabel header = new JLabel("<html><u><CENTER><font size=+1>Bill4u inc. Charge Request</font></CENTER></u></html>");
		c.gridwidth = GridBagConstraints.REMAINDER; //Specifies that this component is the last component in its row.
		c.gridheight = 10;
		gridbag.setConstraints(header, c);
		panel.add(header);
		JTextArea subheader = new JTextArea("Please confirm the charge request detailed below by entering your secret PIN code and press OK ,Otherwise press CANCEL");
		subheader.setOpaque(false);
		subheader.setEditable(false);
		subheader.setLineWrap(true);
		subheader.setWrapStyleWord(true);
		subheader.setHighlighter(null);
		gridbag.setConstraints(subheader, c);
		panel.add(subheader);
		JLabel lblVendorName = new JLabel("<html>&nbsp&nbsp<font size=4><b>Vendor:</b><font color=\"#33CCFF\"> " + vendorName +"</font></font></html>");
		c.gridwidth = GridBagConstraints.REMAINDER;
		c.gridheight = 10;
		gridbag.setConstraints(lblVendorName, c);
		panel.add(lblVendorName);
		JLabel lblChargeInfo = new JLabel("<html>&nbsp&nbsp<font size=4><b>Details:</b><font color=\"#0099FF\"><i> " + chargeInfo +"</i></font></font></html>");
		c.gridwidth = GridBagConstraints.REMAINDER;
		c.gridheight = 10;
		gridbag.setConstraints(lblChargeInfo, c);
		panel.add(lblChargeInfo);
		JLabel lblChargeAmount = new JLabel("<html>&nbsp&nbsp<font size=6><b>Cost:<font color=\"#FF33FF\">" + chargeAmount +"&nbsp;&nbsp;Baht</font></b></font></html>");
		c.gridwidth = GridBagConstraints.REMAINDER;
		c.gridheight = 10;
		gridbag.setConstraints(lblChargeAmount, c);
		panel.add(lblChargeAmount);
		// add the PinPanel object
		c.gridheight = 40;
		c.weighty = 4;
		c.weightx = 1;
		gridbag.setConstraints(pp, c);
		panel.add(pp);
		// create and add the cancel button
		btnCancel = new JButton("CANCEL");
		c.weighty = 1;
		c.gridwidth = GridBagConstraints.REMAINDER;
		c.gridheight = 7;
		gridbag.setConstraints(btnCancel, c);
		panel.add(btnCancel);
		panel.validate();
		//setup the event listeners
		pp.setActionListener(this);
		btnCancel.addActionListener(this);
		// connect to billu2much server and send charge request
		Socket sock = null;
		ObjectInputStream ois = null;
		ObjectOutputStream oos = null;
		try {
			for (int retries=0; retries<3; retries++) { //limit invalid pin for 3 times
				pp.setEnabled(true);
				btnCancel.setEnabled(true);
				pinEntered = false;
				cancelSelected = false;
				//wait for PIN code to be entered
				while (!pinEntered && !cancelSelected) {
					// sleep for a while (don't take all processing cycles!)
					try {
						Thread.sleep(200);
					} catch (InterruptedException ie) {
						// shouldn't occur
						System.err.println(ie.toString());
					}
				}
				if (cancelSelected) throw new MicroPaymentException("Cancel button pressed, cancelling transaction...", false);
				// user must have pressed OK,continue
				String userPin = pp.getPin();
				subheader.setText("Attempting to connect to bill4u server...");
				if (sock==null) {
					try {
						sock = new Socket("161.246.5.116",1024); // Host and Port number to Micro Payments server
						ois = new ObjectInputStream(sock.getInputStream());
						oos = new ObjectOutputStream(sock.getOutputStream());
					} catch (IOException ioe) {
						throw new MicroPaymentException("Error connecting to server. Please contact technical support. You have not been billed for this transaction....", false);
					}
				}
				try {
					// send the object to the server
					ChargeRequest cr = new ChargeRequest(custID, userPin, chargeInfo, chargeAmount, signupID, vendorID);
					oos.writeObject(cr);
					// get server response
					Object obj = ois.readObject();
					if (!obj.getClass().getName().equals("com.bill4u.impl.micropayments.ChargeResponse")) throw new MicroPaymentException("Communication error. Please contact technical support. You have not been billed for this transaction....", false);
					ChargeResponse cresp =(ChargeResponse)obj;
					if (cresp.getChargeSuccess()|| !cresp.getPinError()) throw new MicroPaymentException(cresp.getChargeMessage(), cresp.getChargeSuccess());
					// customer not billed because they entered the pin wrong, give them another chance...
					subheader.setText("You have entered your PIN code incorrectly. Please try again.");
					pp.clearPin();
				} catch (ClassNotFoundException cnfe){
					throw new MicroPaymentException("Communication error. Please contact technical support. You have not been billed for this transaction....", false);
				} catch (IOException ioe) {
					throw new MicroPaymentException("Communication error. Please contact technical support. You have not been billed for this transaction....", false);
				}
			}
			// number of PIN retries, exhausted
			throw new MicroPaymentException("Sorry, you have incorrectly entered your PIN code 3 times without success. Please contact customer services for further assistance.", false);
		} catch (MicroPaymentException mpe) {
			subheader.setText(mpe.getMessage());
			try {
				Thread.sleep(5000);
			} catch (InterruptedException ie) {
				System.err.println(ie.toString());
			}
			try {
				uis.unregisterPanel("BILL4U Confirm");
			} catch(UIService.UIServiceException uise) {
				System.err.println(uise.toString());
			}
			try {
				if (oos!=null) oos.close();
				if (ois!=null) ois.close();
				if (sock!=null) sock.close();
			} catch(IOException ioe) {
				System.err.println(ioe.toString());
			}
			btnCancel = null;
			pp = null;
			return mpe.getRetVal();
		}
	}

	public void actionPerformed(ActionEvent evt) {
		Object obj = evt.getSource();
		if (obj==btnCancel) {
			cancelSelected = true;
			pp.setEnabled(false);
			btnCancel.setEnabled(false);
		} else {
			pinEntered = true;
			pp.setEnabled(false);
			btnCancel.setEnabled(false);
		}
	}
}