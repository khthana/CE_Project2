
package security.publickey;

import java.math.BigInteger;

import jca.security.Key;

import jce.crypto.spec.DHParameterSpec;

public class DHKey extends DHParameterSpec
    implements jce.crypto.interfaces.DHKey, Key
{

    protected DHKey(BigInteger p, BigInteger g) {
	super(p, g);
    }

    public String getAlgorithm() {
	return "DiffieHellman";
    }

    public String getFormat() {
	return null;
    }

    public byte[] getEncoded() {
	return null;
    }

    public DHParameterSpec getParams() {
	return this;
    }

}
