package gps;

import gps.datatypes.Record;
import gps.exceptions.EmptyBufferException;
import gps.exceptions.ParseException;
import gps.exceptions.UnsupportedTypeException;
import gps.log.Logger;
import gps.parser.Parser;

import java.io.IOException;
import java.io.InputStreamReader;

import javax.microedition.io.Connector;
import javax.microedition.io.StreamConnection;

/**
 * Main class for communication with GPS receiver. Use this class to access GPS
 * receiver from other classes. 
 * 
 * @author dominik.schmidt
 */
public class GPS implements Runnable {
	/**
	 * Time in ms to wait until resume to receive.
	 */
	private static final long BREAK = 500;

	/**
	 * Character which indicates end of line in data send by bluetooth device.
	 */
	private static final int LINE_DELIMITER = 13;

	/**
	 * Buffers parsed record.
	 */
	private RecordBuffer buffer;

	/**
	 * Connection to bluetooth device.
	 */
	private StreamConnection connection;

	/**
	 * Used to show messages.
	 */
	private Logger logger;

	/**
	 * Input reader to read data send by bluetooth device.
	 */
	private InputStreamReader reader;

	/**
	 * Receiving happens in separate thread.
	 */
	private Thread runner;

	/**
	 * URL used to connect to bluetooth device.
	 */
	private String url;

	/**
	 * Creates new receiver. Does not start automatically, use start() instead.
	 * 
	 * @param logger
	 *            Used to show messages.
	 * @param url
	 *            URL of bluetooth device to connect to.
	 */
	public GPS(Logger logger, String url) {
		this.logger = logger;
		this.url = url;

		this.buffer = new RecordBuffer();
	}

	/**
	 * Establishes a bluetooth serial connection (specified in GPS_BT_URL) and
	 * opens an input stream.
	 * 
	 * @throws IOException
	 *             If error occurs while establishing bluetooth connection or
	 *             opening input stream
	 */
	private synchronized void connect() throws IOException {
		connection = (StreamConnection) Connector.open(url, Connector.READ);
		reader = new InputStreamReader(connection.openInputStream());
	}

	/**
	 * Closes input stream and bluetooth connection as well as sets the
	 * corresponding objects to null.
	 */
	private synchronized void disconnect() {
		try {
			if (reader != null)
				reader.close();
			if (connection != null)
				connection.close();
		} catch (IOException e) {
			// Ignore.
		}
		reader = null;
		connection = null;
	}

	/**
	 * 
	 * @return The currently stored record.
	 * @throws EmptyBufferException
	 *             If no record has been stored yet.
	 */
	public Record getRecord() throws EmptyBufferException {
		return buffer.getRecord();
	}

	/**
	 * @return True, if connected and input stream opened
	 */
	public synchronized boolean isConnected() {
		return connection != null && reader != null;
	}

	/**
	 * Reads in records sent by the GPS receiver. When a supported record has
	 * been received pauses for specified amount of time. Continues on I/O
	 * errors.
	 */
	public void run() {
		// Marker that indicates start of one cycle of records.
		int startType = Parser.TYPE_START;
		// Type of currently parsed record.
		int type = Parser.TYPE_NA;
		// Storage.
		Record record = new Record();

		while (Thread.currentThread() == runner) {
			try {
				// If not connected (e.g. because of explicit disconnect before
				// waiting) try to connect again.
				if (!isConnected())
					connect();

				String output = new String();

				// Read one line and try to parse it. If successfull put parsed
				// record in buffer.
				int input;
				while ((input = reader.read()) != LINE_DELIMITER)
					output += (char) input;
				// Remove last character (10 in ASCII)
				
				output = output.substring(1, output.length() - 1);
				record.output = output;
				
				try {
					type = Parser.parse(output, record);
					buffer.putRecord(record);
				}
				// Is being thrown when a record is parsed that has an
				// unsupported type.
				catch (UnsupportedTypeException ue) {
					// Type is not supported.
					type = Parser.TYPE_NA;
				}
				// Error while parsing (supported) record.
				catch (ParseException pe) {
					logger.appendString("Parse exception: " + pe.getMessage());
					pe.printStackTrace();
				}

				// Examine only if valid type was parsed.
				if (type != Parser.TYPE_NA) {
					// End of cycle: wait.
					if (type == startType) {
						disconnect();
						// Reset start marker.
						startType = Parser.TYPE_START;
						// Reset startType and storage.
						record = new Record();
						try {
							Thread.sleep(BREAK);
						} catch (InterruptedException e) {
							logger.appendString(e.getMessage());
						}
					}
					// Set start marker.
					else if (startType == Parser.TYPE_START) {
						startType = type;
					}
				}
			}
			// Most severe type of exception. Either thrown while connecting or
			// while reading. Wait some time before continuing.
			catch (IOException ie) {
				try {
					Thread.sleep(BREAK);
				} catch (InterruptedException e) {
					logger.appendString("IO exception: " + e.getMessage());
				}
				ie.printStackTrace();
			}
		}
	}

	/**
	 * Starts receving of data (if not yet started).
	 *  
	 */
	public void start() {
		if (runner == null) {
			runner = new Thread(this);
			runner.start();
		}
	}

	/**
	 * Stops receiving of data and disconnects from bluetooth device.
	 *  
	 */
	public void stop() {
		runner = null;
		disconnect();
	}
}

