
package security.publickey;


import jca.security.Key;
import jca.security.PublicKey;
import jca.security.PrivateKey;
import jca.security.KeyFactorySpi;
import jca.security.InvalidKeyException;
import jca.security.spec.KeySpec;
import jca.security.spec.DSAPublicKeySpec;
import jca.security.spec.DSAPrivateKeySpec;
import jca.security.spec.InvalidKeySpecException;

public class DSAKeyFactory extends KeyFactorySpi {

    protected PublicKey engineGeneratePublic(KeySpec keySpec)
	throws InvalidKeySpecException {
	if(!(keySpec instanceof DSAPublicKeySpec)) {
	    throw new InvalidKeySpecException("KeySpec " + keySpec +
					      ", not supported");
	}
	DSAPublicKeySpec dsaPub = (DSAPublicKeySpec)keySpec;
	return new DSAPublicKey(dsaPub.getY(),
				dsaPub.getP(), dsaPub.getQ(), dsaPub.getG());
    }

    protected PrivateKey engineGeneratePrivate(KeySpec keySpec)
	throws InvalidKeySpecException
    {
	if(!(keySpec instanceof DSAPrivateKeySpec)) {
	    throw new InvalidKeySpecException("KeySpec " + keySpec +
					      ", not supported");
	}
	DSAPrivateKeySpec dsaPrv = (DSAPrivateKeySpec)keySpec;
	return new DSAPrivateKey(dsaPrv.getX(),
				 dsaPrv.getP(), dsaPrv.getQ(), dsaPrv.getG());
    }

    protected KeySpec engineGetKeySpec(Key key, Class keySpec)
	throws InvalidKeySpecException {
	// !!! TODO
	return null;
    }

    protected Key engineTranslateKey(Key key)
	throws InvalidKeyException {
	// !!! TODO
	return null;
    }

}
