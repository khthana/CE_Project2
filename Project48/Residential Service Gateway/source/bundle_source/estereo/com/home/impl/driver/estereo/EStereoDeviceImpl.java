package com.home.impl.driver.estereo;

import org.ogso.service.estereo.*;
import com.home.service.device.mbus.*;
import org.osgi.framework.*;
import java.util.*;
import javax.sound.sampled.*;
import org.osgi.service.device.*;
import java.io.*;

class PlayListNode {
	private AudioInputStream ais = null;
	private AudioInputStream ois = null;
	private EStereoEventListener esel = null;
	PlayListNode(AudioInputStream ais, AudioInputStream ois, EStereoEventListener esel) {
		this.ais = ais;
		this.ois = ois;
		this.esel = esel;
	}
	public AudioInputStream getAudioInputStream() {
		return ais;
	}
	public AudioInputStream getOriginalInputStream() {
		return ois;
	}
	public EStereoEventListener getEventListener() {
		return esel;
	}
}

public class EStereoDeviceImpl implements EStereoDevice, MBusPacketListener, Runnable, Device {
	private ServiceReference sr = null;
	private BundleContext ctxt = null;
	private LinkedList playList = null;
	private Thread consumer = null;
	private boolean isRunning = false;
	private MBusService mbs = null;
	private LinkedList messageQueue = null;
	private boolean debug = false;
	public EStereoDeviceImpl(ServiceReference sr, BundleContext ctxt) {
		this.sr = sr;
		this.ctxt = ctxt;
		playList = new LinkedList();
		messageQueue = new LinkedList();
		consumer = new Thread(this);
		consumer.start();
		mbs = (MBusService) ctxt.getService(sr);
		mbs.AddListener(this);
	}
	public void play(AudioInputStream ais, EStereoEventListener esel) throws UnsupportedAudioFileException {
		// get audioinputstream, convert it to required format and add to the playlist
		AudioFormat format = new AudioFormat(44100,16,2,true,false);//Constructs an AudioFormat with a linear PCM encoding and the given parameters
		AudioInputStream cis = null;
		try {
			cis = AudioSystem.getAudioInputStream(format,ais);
		} catch (IllegalArgumentException iae) {
			throw new UnsupportedAudioFileException("Cannot convert audio input stream");
		}
		PlayListNode node = new PlayListNode(cis, ais, esel);
		synchronized(playList) {
			playList.addLast(node);
			consumer.interrupt();
		}
	}
	public void run() {
		isRunning = true;
		boolean playListEmpty = true;
		boolean nodeSuccess = true;
		while(isRunning) {
			synchronized(playList) {
				playListEmpty = playList.isEmpty();
			}
			if (playListEmpty) {
			// nothing on the playList, go to sleep
				try {
					Thread.sleep(5000);
				} catch (InterruptedException ie) {
					// we've been woken up...
				}
			} else {
				PlayListNode node = null;
				synchronized (playList) {
					node = (PlayListNode)playList.removeFirst();
					nodeSuccess = true;
				}
				// buffer to hold 4000ms worth of audio data
				byte[] buffer = new byte[705600];
				int bytesRead;
				try {
					while(true) {
						bytesRead = node.getAudioInputStream().read(buffer);
						if (bytesRead == 0)continue;
						if (bytesRead == -1)break;
						AudioPacketMessage packet = new AudioPacketMessage(buffer, 0, bytesRead);
						// reset the flags and send the message via the mbus
						mbs.WriteMessage(new MBusDeviceSpecific(packet));
						boolean emptyMessageQueue;
						// wait for an almost empty response
						while(isRunning) {
							synchronized(messageQueue) {
								emptyMessageQueue = messageQueue.isEmpty();
							}
							if(emptyMessageQueue) {
								try{
									Thread.sleep(5000);
								}catch (InterruptedException ie) {
									//woken up
								}
							} else {
								//process message on the message queue
								MBusDeviceSpecific rm = null;
								synchronized(messageQueue) {
									rm = (MBusDeviceSpecific) messageQueue.removeFirst();
								}
								try{
									// BufferStatusMessage bsm = (BufferStatusMessage) rm.getObject();
									BufferStatusMessage bsm = null;
									try {
										ByteArrayInputStream bis = new ByteArrayInputStream(rm.getArray());
										ObjectInputStream ois = new ObjectInputStream(bis);
										bsm = (BufferStatusMessage) ois.readObject();
									} catch (IOException ioe) {
										System.err.println("Failed to unserialize object: " +ioe.toString());
									}
									if (bsm.getStatus() != BufferStatusMessage.ALMOST_EMPTY) {
										if (debug) System.err.println("Warning: possible eStereo buffer underrun");
									} else break;
								}catch (ClassNotFoundException cnfe) {
									System.err.println("Class not found exception:" + cnfe.toString());
								}
							}
						}
						//check if still running, if not notify calling services of error
						if (!isRunning) {
							node.getEventListener().EStereoEvent(node.getOriginalInputStream(), false);
							synchronized(playList) {
								while (!playList.isEmpty()) {
									node = (PlayListNode) playList.removeFirst();
									node.getEventListener().EStereoEvent(node.getOriginalInputStream(), false);
								}
							}
							return;
						}
					}//end while(true)
				} catch (EOFException eof) {
					// end of input stream...continue
				} catch (IOException ioe) {
					nodeSuccess = false;
				}
				// wait for an empty response
				while(isRunning) {
					boolean emptyMessageQueue;
					synchronized(messageQueue) {
					emptyMessageQueue = messageQueue.isEmpty();
					}
					if (emptyMessageQueue) {
						try {
							Thread.sleep(5000);
						} catch(InterruptedException ie) {
						//woken up
						}
					} else {
						// process message on the message queue 
						MBusDeviceSpecific rm = null;
						synchronized(messageQueue) {
							rm =(MBusDeviceSpecific) messageQueue.removeFirst();
						}
						try {
						//  BufferStatusMessage bsm = (BufferStatusMessage) rm.getObject();
							BufferStatusMessage bsm = null;
							try {
								ByteArrayInputStream bis = new ByteArrayInputStream(rm.getArray());
								ObjectInputStream ois = new ObjectInputStream(bis);
								bsm = (BufferStatusMessage) ois.readObject();
							} catch(IOException ioe) {
								System.err.println("Failed to unserialize object: " + ioe.toString());
							}
							if(bsm.getStatus() == BufferStatusMessage.EMPTY) break;
						} catch(ClassNotFoundException cnfe) {
							System.err.println("Class not found exception: " + cnfe.toString());
						}
					}
				}
				//check if still running, if not notify calling services of error
				if (!isRunning) {
					node.getEventListener().EStereoEvent(node.getOriginalInputStream(), false);
					synchronized(playList) {
						while(!playList.isEmpty()) {
							node =(PlayListNode) playList.removeFirst();
							node.getEventListener().EStereoEvent(node.getOriginalInputStream(), false);
						}
					}
					return;
				}
				//recieved our empty response...notify calling service of success
				node.getEventListener().EStereoEvent(node.getOriginalInputStream(), nodeSuccess);
			}
		}
	}

	public void HandleMessage(MBusMessage message) {
		// is the message destined for us?
		if (message.getType() == MBusMessage.DeviceSpecific) {
			messageQueue.addLast((MBusDeviceSpecific)message);
			consumer.interrupt();
		}
	}
	public void stopRunning() {
		// method used so our device driver can stop the thread before unregistering us
		isRunning = false;
	}
	public void noDriverFound() {
		// used if no driver cannot further refine our device
	}
}