
package jca.security.cert;

import java.io.ObjectStreamException;

import jca.security.PublicKey;
import jca.security.SignatureException;
import jca.security.InvalidKeyException;
import jca.security.NoSuchAlgorithmException;
import jca.security.NoSuchProviderException;

public abstract class Certificate {

    protected Certificate(String type) {
    }

    public final String getType() {
	return null;
    }

    public boolean equals(Object other) {
	return false;
    }

    public int hashCode() {
	return 0;
    }

    public abstract byte[] getEncoded() throws CertificateEncodingException;

    public abstract void verify(PublicKey key)
	throws CertificateException, NoSuchAlgorithmException,
	       InvalidKeyException, NoSuchProviderException, SignatureException;

    public abstract void verify(PublicKey key, String sigProvider)
	throws CertificateException, NoSuchAlgorithmException,
	       InvalidKeyException, NoSuchProviderException, SignatureException;

    public abstract String toString();

    public abstract PublicKey getPublicKey();

    protected Object writeReplace() throws ObjectStreamException {
	return null;
    }

}
