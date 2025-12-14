
package security.publickey;

import java.math.BigInteger;

public class DHPrivateKey extends DHKey
    implements jce.crypto.interfaces.DHPrivateKey
{
    protected BigInteger x;

    public DHPrivateKey(BigInteger x, BigInteger p, BigInteger g) {
	super(p, g);
	this.x = x;
    }

    public BigInteger getX() {
	return x;
    }
}
