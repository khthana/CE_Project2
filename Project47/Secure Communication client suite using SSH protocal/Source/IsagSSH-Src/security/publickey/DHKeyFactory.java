
package security.publickey;


import jca.security.Key;
import jca.security.PublicKey;
import jca.security.PrivateKey;
import jca.security.KeyFactorySpi;
import jca.security.InvalidKeyException;
import jca.security.spec.KeySpec;
import jca.security.spec.InvalidKeySpecException;

import jce.crypto.spec.DHPublicKeySpec;
import jce.crypto.spec.DHPrivateKeySpec;

public final class DHKeyFactory extends KeyFactorySpi {

    protected PublicKey engineGeneratePublic(KeySpec keySpec)
	throws InvalidKeySpecException
    {
	if(!(keySpec instanceof DHPublicKeySpec)) {
	    throw new InvalidKeySpecException("KeySpec " + keySpec +
					      ", not supported");
	}
	DHPublicKeySpec dhPub = (DHPublicKeySpec)keySpec;
	return new DHPublicKey(dhPub.getY(), dhPub.getP(), dhPub.getG());
    }

    protected PrivateKey engineGeneratePrivate(KeySpec keySpec)
	throws InvalidKeySpecException
    {
	if(!(keySpec instanceof DHPrivateKeySpec)) {
	    throw new InvalidKeySpecException("KeySpec " + keySpec +
					      ", not supported");
	}
	DHPrivateKeySpec dhPrv = (DHPrivateKeySpec)keySpec;
	return new DHPrivateKey(dhPrv.getX(), dhPrv.getP(), dhPrv.getG());
    }

    protected KeySpec engineGetKeySpec(Key key, Class keySpec)
	throws InvalidKeySpecException
    {
	// !!! TODO
	throw new Error("DHKeyFactory.engineGetKeySpec() not implemented");
    }

    protected Key engineTranslateKey(Key key) throws InvalidKeyException {
	// !!! TODO
	throw new Error("DHKeyFactory.engineTranslateKey() not implemented");
    }

}
