
package jce.crypto;

import jca.security.GeneralSecurityException;

public class ShortBufferException extends GeneralSecurityException {
    public ShortBufferException(String msg) {
	super(msg);
    }
}
