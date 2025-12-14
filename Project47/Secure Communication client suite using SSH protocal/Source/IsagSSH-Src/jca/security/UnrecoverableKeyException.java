
package jca.security;

public class UnrecoverableKeyException extends GeneralSecurityException {

    public UnrecoverableKeyException() {
	super();
    }

    public UnrecoverableKeyException(String msg) {
	super(msg);
    }

}
