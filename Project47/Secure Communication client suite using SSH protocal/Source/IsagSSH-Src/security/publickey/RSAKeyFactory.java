
package security.publickey;


import jca.security.Key;
import jca.security.PublicKey;
import jca.security.PrivateKey;
import jca.security.KeyFactorySpi;
import jca.security.InvalidKeyException;
import jca.security.spec.KeySpec;
import jca.security.spec.RSAPublicKeySpec;
import jca.security.spec.RSAPrivateKeySpec;
import jca.security.spec.RSAPrivateCrtKeySpec;
import jca.security.spec.InvalidKeySpecException;

public class RSAKeyFactory extends KeyFactorySpi {

    protected PublicKey engineGeneratePublic(KeySpec keySpec)
	throws InvalidKeySpecException
    {
	if(!(keySpec instanceof RSAPublicKeySpec)) {
	    throw new InvalidKeySpecException("KeySpec " + keySpec +
					      ", not supported");
	}
	RSAPublicKeySpec rsaPub = (RSAPublicKeySpec)keySpec;
	return new RSAPublicKey(rsaPub.getModulus(),
				rsaPub.getPublicExponent());
    }

    protected PrivateKey engineGeneratePrivate(KeySpec keySpec)
	throws InvalidKeySpecException
    {
	if(!(keySpec instanceof RSAPrivateKeySpec)) {
	    throw new InvalidKeySpecException("KeySpec " + keySpec +
					      ", not supported");
	}

	if(keySpec instanceof RSAPrivateCrtKeySpec) {
	    RSAPrivateCrtKeySpec rsaPrv = (RSAPrivateCrtKeySpec)keySpec;
	    return new RSAPrivateCrtKey(rsaPrv.getModulus(),
					rsaPrv.getPublicExponent(),
					rsaPrv.getPrivateExponent(),
					rsaPrv.getPrimeP(),
					rsaPrv.getPrimeQ(),
					rsaPrv.getPrimeExponentP(),
					rsaPrv.getPrimeExponentQ(),
					rsaPrv.getCrtCoefficient());
	} else {
	    RSAPrivateKeySpec rsaPrv = (RSAPrivateKeySpec)keySpec;
	    return new RSAPrivateKey(rsaPrv.getModulus(),
				     rsaPrv.getPrivateExponent());
	}
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
