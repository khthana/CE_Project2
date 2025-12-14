package jce.crypto.spec;

import java.math.BigInteger;

import jca.security.spec.AlgorithmParameterSpec;

public class DHParameterSpec extends DHParamsImpl
    implements AlgorithmParameterSpec
{
    protected int l;

    public DHParameterSpec(BigInteger p, BigInteger g) {
	this(p, g, 0);
    }

    public DHParameterSpec(BigInteger p, BigInteger g, int l) {
	super(p, g);
	this.l = l;
    }

    public int getL() {
	return l;
    }

}
