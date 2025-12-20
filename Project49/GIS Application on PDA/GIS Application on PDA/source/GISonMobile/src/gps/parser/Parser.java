package gps.parser;

import gps.datatypes.Record;
import gps.exceptions.ParseException;
import gps.exceptions.UnsupportedTypeException;

import java.util.NoSuchElementException;

/**
 * NMEA-0183 Parser. Parses data sent by GPS receiver. As data is being
 * transfered via XML to server, parsing consists in most cases of separating
 * fields.
 * 
 * @author Dominik Schmidt
 */
public class Parser {
	/**
	 * Type not supported.
	 */
	public static final int TYPE_NA = -1;

	/**
	 * Start marker, see class GPS.
	 */
	public static final int TYPE_START = -2;

	/**
	 * Type GPRMC.
	 */
	public static final int TYPE_GPRMC = 0;

	/**
	 * Type GPGGA.
	 */
	public static final int TYPE_GPGGA = 1;

	/**
	 * Parses a string sent by GPS receiver.
	 * 
	 * @param s
	 *            String to be parsed
	 * @param record
	 *            Record to store data
	 * @return Type of record
	 * @throws UnsupportedTypeException
	 *             If type is not recognized
	 * @throws ParseException
	 *             If there was an error during parsing
	 */
	public static int parse(String s, Record record)
			throws UnsupportedTypeException, ParseException {

		// Tokenizer to separate tokens
		Tokenizer tokenizer = new Tokenizer(s);
		// Type of record
		int type;

		try {
			String token = tokenizer.next();

			if (token.equals("$GPRMC")) {
				type = TYPE_GPRMC;

				token = tokenizer.next();
	//			record.dateTimeOfFix = token.substring(0, 2) + ":"
	//					+ token.substring(2, 4) + ":" + token.substring(4, 6);

	/*			record.warning = */tokenizer.next().equals(Record.WARNING);

				record.lattitude = tokenizer.next();

		/*		record.lattitudeDirection = */tokenizer.next();

				record.longitude = tokenizer.next();

		/*		record.longitudeDirection =*/ tokenizer.next();

		/*		record.groundSpeed = */tokenizer.next();

		/*		record.courseMadeGood = */tokenizer.next();

		//		token = tokenizer.next();
		//		record.dateTimeOfFix += "/" + token.substring(0, 2) + "."
		//				+ token.substring(2, 4) + "." + token.substring(4, 6);

//				record.magneticVariation = tokenizer.next();
			} else if (token.equals("$GPGGA")) {
				type = TYPE_GPGGA;

				// Time of fix
				tokenizer.next();

				// Lattitude
				tokenizer.next();

				// Lattitude direction
				tokenizer.next();

				// Longitude
				tokenizer.next();

				// Longitude direction
				tokenizer.next();

				record.quality = tokenizer.next();

				record.satelliteCount = tokenizer.next();

				// Ignore rest
			}
			// Type is not supported.
			else {
				throw new UnsupportedTypeException("Type " + token
						+ " is not supported.");
			}
		}
		// Parsing exception.
		catch (NoSuchElementException e) {
			throw new ParseException("Unexpected end of input.");
		}
		return type;
	}
}