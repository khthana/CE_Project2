
package jca.security.interfaces;

import java.math.BigInteger;

import jca.security.PublicKey;

public interface RSAPublicKey extends RSAKey, PublicKey {
    public BigInteger getPublicExponent();
}
