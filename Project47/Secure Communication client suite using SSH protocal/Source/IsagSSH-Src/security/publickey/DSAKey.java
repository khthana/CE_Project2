
package security.publickey;

import java.math.BigInteger;

import jca.security.Key;
import jca.security.spec.DSAParameterSpec;
import jca.security.interfaces.DSAParams;

public class DSAKey extends DSAParameterSpec
    implements jca.security.interfaces.DSAKey, Key {

    protected DSAKey(BigInteger p, BigInteger q, BigInteger g) {
	super(p, q, g);
    }

    public String getAlgorithm() {
	return "DSA";
    }

    public byte[] getEncoded() {
	return null;
    }

    public String getFormat() {
	return null;
    }

    public DSAParams getParams() {
	return this;
    }

}
