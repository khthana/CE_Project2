
package jca.security;

public class InvalidParameterException extends IllegalArgumentException {

    public InvalidParameterException() {
	super();
    }

    public InvalidParameterException(String msg) {
	super(msg);
    }

}
