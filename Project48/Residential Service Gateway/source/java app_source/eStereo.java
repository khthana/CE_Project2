import java.net.*;
import java.io.*;
import java.util.*;
import javax.sound.sampled.*;
import com.home.service.device.mbus.*;
import com.home.impl.driver.estereo.*;

class eStereo implements Runnable {

	Socket sock = null;
	ObjectInputStream ois = null;
	ObjectOutputStream oos = null;
	LinkedList buffer = null;
	long bufLen = 0;
	Thread player = null;
	boolean emptyResponseSent = true;
	boolean debug = false;

	eStereo(String host, int port) throws IOException {
  		System.out.println("Attempting to establish connection : " + host + " (" + port + ")...");

		sock = new Socket(host, port);
  		ois = new ObjectInputStream(sock.getInputStream());
  		oos = new ObjectOutputStream(sock.getOutputStream());

		System.out.println("Success! Connected to e-Stereo driver: " + host + " (" + port + ")");
		buffer = new LinkedList();
		player = new Thread(this);

		player.start();
	}

	void Producer() throws Exception {
		// send device identification object
		oos.writeObject(new MBusID(MBusID.NoTag,"AdvancedeStereo400")); // Send Mbus object to server

		Object o = null;

		// start to read from the MBus
		while (true) {
			o = ois.readObject();
			if (!o.getClass().getName().equals("com.home.service.device.mbus.MBusDeviceSpecific")) throw new Exception("Unknown packet received");
			//unpack the data
			Object obj = ((MBusDeviceSpecific) o).getObject();
			if (!obj.getClass().getName().equals("com.home.impl.driver.estereo.AudioPacketMessage")) throw new Exception("Unknown object received in DeviceSpecificMessage");
			AudioPacketMessage apm = (AudioPacketMessage) obj;
			synchronized(buffer) {
				buffer.addLast(apm);
				bufLen += apm.getData().length;
				emptyResponseSent = false;
				player.interrupt();
				if (debug) System.out.println("Packet added, buflen="+bufLen);
			}
		}
	}

	public void run() {
   	Mixer dm = AudioSystem.getMixer(AudioSystem.getMixerInfo()[0]);

	   // Generate format object
     	AudioFormat format = new AudioFormat(44100,16,2,true,false);

	   // Open source data line to mixer
   	SourceDataLine line=null;
   	DataLine.Info info = new DataLine.Info(SourceDataLine.class, format);
   	if (!AudioSystem.isLineSupported(info)) {
   		System.err.println("Cannot open source dataline for this format!");
   		System.exit(1);
   	}

  		try {
			line = (SourceDataLine) AudioSystem.getLine(info);
	   	line.open(format, 176400); //176400 = 1000ms x sample rate (44100) x bytes per sample (2) x channels (2)
   		line.start();
		} catch (Exception e) {
			System.err.println("Fatal error, could not open line: " + e.toString());
			System.exit(1);
		}


		byte[] frameBuffer = new byte[4];
		int frameByteCount = 0;

		while (true) {
			boolean noDataExists = false;

			synchronized(buffer) {
				noDataExists = (bufLen == 0);
			}
			// sleep if there is no data to process
			if (noDataExists) {
				//send empty message back to service
				try {
					if (!emptyResponseSent) {
						oos.writeObject(new MBusDeviceSpecific(new BufferStatusMessage(BufferStatusMessage.EMPTY)));
						oos.reset();
						emptyResponseSent = true;
					}
				} catch (IOException ioe) {
					System.err.println("Fatal error: could not write status message " + ioe.toString());
					System.exit(1);
				}
				try {
					Thread.sleep(5000);
				} catch (InterruptedException ie) {
					// do nothing, we've been woken up by the producer
				}
			} else {
				AudioPacketMessage apm = null;
				synchronized(buffer) {
					apm = (AudioPacketMessage) buffer.removeFirst();
					bufLen -= apm.getData().length;
					if (debug) System.out.println("Packet removed, buflen="+bufLen);
					// check if the buffer is almost empty (i.e. less than 2000ms worth of frames left)
					if (bufLen < 352800) {
						//send almost empty message back to service
						try {
							oos.writeObject(new MBusDeviceSpecific(new BufferStatusMessage(BufferStatusMessage.ALMOST_EMPTY)));
							oos.reset();
						} catch (IOException ioe) {
							System.err.println("Fatal error: could not write status message " + ioe.toString());
							System.exit(1);
						}
					}
				}
				int i = 0;
				for (i=frameByteCount; i<4 && i-frameByteCount<apm.getData().length; i++) {
					frameBuffer[i] = apm.getData()[i-frameByteCount];
				}
				// if we dont have a full frame
				if (i!=4) {
					frameByteCount=i;
					continue;
				}
				// write the first full frame to the line
				line.write(frameBuffer,0,4);
				// write the rest of the full frames as we are now frame aligned
				int remainingBytes = (apm.getData().length-(i-frameByteCount))%4;
				int frameStart = i-frameByteCount;
				if (debug) System.out.println("Data as full frames to write: "+(apm.getData().length-frameStart-remainingBytes));
				if (debug) System.out.println("Remaining bytes: "+remainingBytes);
				if (apm.getData().length-frameStart-remainingBytes !=0) line.write(apm.getData(), frameStart, apm.getData().length-frameStart-remainingBytes);
				for (frameByteCount=0; frameByteCount<remainingBytes; frameByteCount++) {
					frameBuffer[frameByteCount] = apm.getData()[apm.getData().length-remainingBytes+frameByteCount];
				}
//				line.drain();
			}
		}
	}



	public static void main(String[] args) {

		String host = null;
		int port = 0;

		try {
   		if (args.length == 2) {
   			host = args[0];
   			port = Integer.parseInt(args[1]);
   		} else {
   			System.err.println("Usage : eStereo host port");
   			System.exit(1);
   		}

			eStereo es = new eStereo(host, port);
			es.Producer();
	  		System.exit(0);
		} catch (Exception e) {
			System.err.println("Exception : " + e.toString());
			System.exit(1);
		}
	}
}