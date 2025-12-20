/*
 * EmptyBufferException.java
 *
 * Created on 14. November 2004, 16:19
 */

package gps.exceptions;


/**
 * Is being thrown when data is requestet from an empty buffer.
 * 
 * @author  Dominik Schmidt
 */
public class EmptyBufferException extends Exception {    
     public EmptyBufferException(String msg) {
        super(msg);
    }   
}
