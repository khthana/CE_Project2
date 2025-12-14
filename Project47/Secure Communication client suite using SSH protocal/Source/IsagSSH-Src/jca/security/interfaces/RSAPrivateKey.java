
package jca.security.interfaces;

import java.math.BigInteger;

import jca.security.PrivateKey;

public interface RSAPrivateKey extends RSAKey, PrivateKey {
    public BigInteger getPrivateExponent();
}
