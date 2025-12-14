
package jca.security.spec;

import jca.security.GeneralSecurityException;

public class InvalidKeySpecException extends GeneralSecurityException {

    public InvalidKeySpecException() {
	super();
    }

    public InvalidKeySpecException(String msg) {
	super(msg);
    }

}
