
package security.publickey;

import java.math.BigInteger;

public class DSAPublicKey extends DSAKey
    implements jca.security.interfaces.DSAPublicKey
{
    protected BigInteger y;

    public DSAPublicKey(BigInteger y, BigInteger p, BigInteger q, BigInteger g)
    {
	super(p, q, g);
	this.y = y;
    }

    public BigInteger getY() {
	return y;
    }

}
