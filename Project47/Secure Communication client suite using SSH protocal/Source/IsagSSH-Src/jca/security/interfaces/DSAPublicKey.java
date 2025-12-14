
package jca.security.interfaces;

import java.math.BigInteger;

import jca.security.PublicKey;

public interface DSAPublicKey extends DSAKey, PublicKey {
    public BigInteger getY();
}
