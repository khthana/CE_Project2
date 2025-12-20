/*
 * ParseException.java
 *
 * Created on 14. November 2004, 15:19
 */

package gps.exceptions;

/**
 * Is being thrown when GPS parser fails to parse data delivered by GPS
 * receiver.
 * 
 * @author Dominik Schmidt
 */
public class ParseException extends Exception {
	public ParseException(String msg) {
		super(msg);
	}
}