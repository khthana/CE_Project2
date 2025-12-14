
package jce.crypto.interfaces;

import java.math.BigInteger;

import jca.security.PublicKey;

public interface DHPublicKey extends DHKey, PublicKey {
    public BigInteger getY();
}
