
package jca.security;

import java.io.Serializable;

public abstract class SecureRandomSpi implements Serializable {

    public SecureRandomSpi() {
    }

    protected abstract byte[] engineGenerateSeed(int numBytes);

    protected abstract void engineNextBytes(byte[] bytes);

    protected abstract void engineSetSeed(byte[] seed);

}
