
package security.publickey;

import jca.security.Key;

import java.math.BigInteger;

public abstract class RSAKey
    implements jca.security.interfaces.RSAKey, Key {

    protected BigInteger modulus;

    protected RSAKey(BigInteger modulus) {
	this.modulus = modulus;
    }

    public BigInteger getModulus() {
	return modulus;
    }

    public String getAlgorithm() {
	return "RSA";
    }

    public byte[] getEncoded() {
	return null;
    }

    public String getFormat() {
	return null;
    }

}
