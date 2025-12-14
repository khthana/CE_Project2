
package jca.security.spec;

import jca.security.GeneralSecurityException;

public class InvalidParameterSpecException extends GeneralSecurityException {

    public InvalidParameterSpecException() {
	super();
    }

    public InvalidParameterSpecException(String msg) {
	super(msg);
    }

}
