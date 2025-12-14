
package jca.security.interfaces;

import java.math.BigInteger;

import jca.security.PrivateKey;

public interface DSAPrivateKey extends DSAKey, PrivateKey {
    public BigInteger getX();
}
