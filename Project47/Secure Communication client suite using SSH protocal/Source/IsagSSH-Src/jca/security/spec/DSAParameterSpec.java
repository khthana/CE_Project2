
package jca.security.spec;

import java.math.BigInteger;

import jca.security.interfaces.DSAParams;

public class DSAParameterSpec extends DSAParamsImpl
    implements AlgorithmParameterSpec, DSAParams
{
    public DSAParameterSpec(BigInteger p, BigInteger q, BigInteger g) {
	super(p, q, g);
    }

}
