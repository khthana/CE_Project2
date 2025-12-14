
package jce.crypto.interfaces;

import java.math.BigInteger;

import jca.security.PrivateKey;

public interface DHPrivateKey extends DHKey, PrivateKey {
    public BigInteger getX();
}
