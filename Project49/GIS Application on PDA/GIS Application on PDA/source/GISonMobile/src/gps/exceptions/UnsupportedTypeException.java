/*
 * UnsupportedTypeException.java
 *
 * Created on 14. November 2004, 15:55
 */

package gps.exceptions;


/**
 * Is being thrown when NMEA type is not recognized by parser.
 *
 * @author  Dominik Schmidt
 */
public class UnsupportedTypeException extends Exception {
    public UnsupportedTypeException(String msg) {
        super(msg);
    }    
}
