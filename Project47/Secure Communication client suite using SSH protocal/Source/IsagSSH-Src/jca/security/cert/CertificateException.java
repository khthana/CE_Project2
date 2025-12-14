
package jca.security.cert;

import jca.security.GeneralSecurityException;

public class CertificateException extends GeneralSecurityException {

    public CertificateException() {
	super();
    }

    public CertificateException(String msg) {
	super(msg);
    }

}
