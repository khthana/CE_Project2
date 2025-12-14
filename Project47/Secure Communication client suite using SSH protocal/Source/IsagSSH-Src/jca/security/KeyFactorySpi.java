
package jca.security;

import jca.security.spec.KeySpec;
import jca.security.spec.InvalidKeySpecException;

public abstract class KeyFactorySpi {

    public KeyFactorySpi() {
    }

    protected abstract PublicKey engineGeneratePublic(KeySpec keySpec)
	throws InvalidKeySpecException;

    protected abstract PrivateKey engineGeneratePrivate(KeySpec keySpec)
	throws InvalidKeySpecException;

    protected abstract KeySpec engineGetKeySpec(Key key, Class keySpec)
	throws InvalidKeySpecException;

    protected abstract Key engineTranslateKey(Key key)
	throws InvalidKeyException;

}
