
package jca.security;

public class SignatureException extends GeneralSecurityException {
    public SignatureException() {
	super();
    }

    public SignatureException(String msg) {
	super(msg);
    }
}
