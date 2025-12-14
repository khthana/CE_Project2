package com.home.impl.manager;

import org.osgi.framework.*;
import java.net.*;
import java.io.*;
import java.util.Vector;
import java.util.Enumeration;
import java.util.jar.*;
import java.security.*;

class ManagerClientImpl extends Thread {
	private boolean isRunning = false;
	private Socket sock = null;
	private BundleContext ctxt = null;
	private ObjectOutputStream oos = null;
	private ObjectInputStream ois = null;
	private Vector clientThreads;
	ManagerClientImpl(Socket sock, BundleContext ctxt, Vector clientThreads) throws IOException {
		this.sock = sock;
		this.ctxt = ctxt;
		this.clientThreads = clientThreads;
		oos = new ObjectOutputStream (sock.getOutputStream());
		ois = new ObjectInputStream (sock.getInputStream());
		sock.setSoTimeout(1000); // set blocking timeout
	}
	public void run() {
		while (isRunning) {
			try {
				Object obj = ois.readObject();
				if (!obj.getClass().getSuperclass().getName().equals("com.home.impl.manager.ManagerMessage")) {
					System.err.println("Error...read class: " + obj.getClass().getName() + " - unknown!");
					obj = null;
				} else {
					switch (((ManagerMessage)obj).getType() ) {
						case ManagerMessage.InstallBundleRequest: {
							InstallBundleRequest ibr = (InstallBundleRequest) obj;
							try {
								Signature sig = Signature.getInstance("DSA");
								sig.initVerify(HomePublicKey.GetKey());
								//Get the certificate
								InputStream sis = new URL(ibr.getCertURL()).openStream();
								int sigLen = sis.available();
								byte[] sigData = new byte[sis.available()];
								int totalRead = 0;
								int numRead = 0;
								do{
									numRead = sis.read(sigData);
									if (numRead != -1) {
										totalRead += numRead;
									}
								}while (numRead != -1);
								if(totalRead != sigLen) {
									throw new IOException ("Corrupt signature file.");
								}
								//Get the Bundle
								InputStream fis = new URL(ibr.getBundleURL()).openStream();
								byte[] buf = new byte[1024];
								do{
									numRead = fis.read(buf);
									if (numRead != -1) {
									sig.update(buf, 0, numRead);
									}	
								}while (numRead != -1);
								//Close input streams
								fis.close();
								sis.close();
								//Verify certificate to bundle
								boolean verified = sig.verify(sigData);
								if(verified) {
									// Install bundle
									ctxt.installBundle(ibr.getBundleURL());
									InstallBundleResponse ibresp = new InstallBundleResponse("Bundle installed successfully.", true);
									oos.writeObject(ibresp); // Throws IO Exception
								}else {
									InstallBundleResponse ibresp = new InstallBundleResponse("Bundle was not signed by Home-Connected Inc.", false);
									oos.writeObject(ibresp); // Throws IO Exception
								}
							} catch(BundleException be) {
								InstallBundleResponse ibresp = new InstallBundleResponse(be.toString(), false);
								oos.writeObject(ibresp); // Throws IO Exception
							} catch(GeneralSecurityException gse) {
								InstallBundleResponse ibresp = new InstallBundleResponse(gse.toString(), false);
								oos.writeObject(ibresp); // Throws IO Exception
							} catch(SecurityException se) {
								InstallBundleResponse ibresp = new InstallBundleResponse(se.toString(), false);
								oos.writeObject(ibresp); // Throws IO Exception
							} catch(MalformedURLException mue) {
								InstallBundleResponse ibresp = new InstallBundleResponse("Malformed URL : "+ibr.getBundleURL(), false);
								oos.writeObject(ibresp); // Throws IO Exception
							} catch(IOException ioe) {
								InstallBundleResponse ibresp = new InstallBundleResponse(ioe.toString(), false);
								oos.writeObject(ibresp); // Throws IO Exception
							}
						} 
						break;
						case ManagerMessage.StartBundleRequest: {
							try {
								StartBundleRequest sbr = (StartBundleRequest) obj;
								Bundle[] bundles = ctxt.getBundles();
								int i;
								for (i = 0; i < bundles.length; i++) {
									if (bundles[i].getLocation() == sbr.getBundleURL()) break;
								}
								if (i < bundles.length) {
									bundles[i].start();
									StartBundleResponse sbresp = new StartBundleResponse("Bundle started sucessfully : " + sbr.getBundleURL(), true);
									oos.writeObject(sbresp);
								}else {
									StartBundleResponse sbresp = new StartBundleResponse("Cound not start bundle - bundle not found", false);
									oos.writeObject(sbresp);
								}
							} catch(SecurityException se) {
								System.err.println("Error: " + se.toString());
								StartBundleResponse sbresp = new StartBundleResponse("Cound not start bundle: " + se.toString(), false);
								oos.writeObject(sbresp);
							} catch(BundleException be) {
								System.err.println("Error: " + be.toString());
								StartBundleResponse sbresp = new StartBundleResponse("Cound not start bundle: " + be.toString(), false);
								oos.writeObject(sbresp);
							} catch(IllegalStateException ise) {
								System.err.println("Error: " + ise.toString());
								StartBundleResponse sbresp = new StartBundleResponse("Cound not start bundle: " + ise.toString(), false);
								oos.writeObject(sbresp);
							}
						}
						break;
						default: {
							System.err.println("Error...read class: " + obj.getClass().getName() + " - unhandled!");
							obj = null;
						}
						break;
						}
					}
				} catch (ClassNotFoundException cnfe) {
					System.err.println("Error - read object found unrecognised class!");
				} catch (SocketTimeoutException ste) {
					// the readObject call timedout, but that's okay!
				} catch (EOFException eofe) {
					isRunning = false;
				} catch (IOException ioe) {
					System.err.println("Error - IO Exception encountered: " + ioe.toString());
					isRunning = false;
				}
			}
			try {
				oos.close();
				ois.close();
				sock.close();
			} catch (IOException ioe) {
				System.err.println("Error: " + ioe.toString());
			}
			clientThreads.remove(this);
	}
	public void start() {
		isRunning = true;
		super.start();
	}
	public void stopThread() {
		isRunning = false;
	}
}

class ManagerListenerThread extends Thread {
	private boolean isRunning = false;
	private ServerSocket sock = null;
	private BundleContext ctxt = null;
	private Vector clientThreads = null;
	ManagerListenerThread(BundleContext ctxt) throws IOException, SocketException {
		int PortNum = 888;
		final int MaxPortNum = 900;
		final int ListenBuffer = 16;
		clientThreads = new Vector(5);
		do {
			try {
				sock = new ServerSocket(PortNum,ListenBuffer);
			} catch (BindException e) {
				System.out.println("Failed to bind to port: " + PortNum); // This code must be removed eventually!
				PortNum++;
				if (PortNum == MaxPortNum) throw new BindException("Failed to bind to all ports in range");
			}
		} while (sock == null);
		sock.setSoTimeout(1000); // Set blocking timeout to 1000ms
		this.ctxt = ctxt;
		System.out.println("Service Manager up and running on port: " + PortNum);
	}

	public void run() {
		ManagerClientImpl mci = null;
		while (isRunning) {
			try {
				Socket client = sock.accept();
				//register the device service
				mci = new ManagerClientImpl(client,ctxt, clientThreads);
				clientThreads.add(mci);
				mci.start();
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

	public void start() {
		isRunning = true;
		super.start();
	}
	public void stopThread() {
		Enumeration e = clientThreads.elements();
		while (e.hasMoreElements()) {
			ManagerClientImpl mci = (ManagerClientImpl)e.nextElement();
			mci.stopThread();
			try {
				mci.join(3000);
			} catch (InterruptedException ie) {
				System.out.println("Thread failed to stop within specified period");
				System.out.println("Exception : " + ie.toString());
			}
		}
		isRunning = false;
	}
}

public class Activator implements BundleActivator {
	private ManagerListenerThread servThread = null;
	public void start(BundleContext ctxt) {
		try {
			servThread = new ManagerListenerThread(ctxt);
		} catch (Exception e) {
			// TO DO...log to OSGI log in future
			System.out.println("Exception : " + e.toString());
		}
		servThread.start();
	}
	public void stop(BundleContext ctxt) {
		if (servThread != null) {
			servThread.stopThread();
			try {
				servThread.join(3000);
			} catch (InterruptedException ie) {
				System.out.println("Thread failed to stop within specified period");
				System.out.println("Exception : " +ie.toString());
			}
		servThread = null;
		}
	}
}