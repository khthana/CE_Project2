
package security.publickey;

import java.math.BigInteger;

public class RSAPublicKey extends RSAKey
    implements jca.security.interfaces.RSAPublicKey {

    protected BigInteger publicExponent;

    public RSAPublicKey(BigInteger modulus, BigInteger publicExponent) {
	super(modulus);
	this.publicExponent = publicExponent;
    }

    public BigInteger getPublicExponent() {
	return publicExponent;
    }

}
