
package security.publickey;

import java.math.BigInteger;

import jca.security.KeyPair;
import jca.security.KeyPairGenerator;
import jca.security.SecureRandom;
import jca.security.InvalidAlgorithmParameterException;
import jca.security.spec.AlgorithmParameterSpec;
import jca.security.spec.DSAParameterSpec;

public class DSAKeyPairGenerator extends KeyPairGenerator
{

    protected SecureRandom     random;
    protected int              keysize;
    protected DSAParameterSpec params;

    public DSAKeyPairGenerator() {
	super("DSA");
    }

    public void initialize(int keysize, SecureRandom random) {
	this.random  = random;
	this.keysize = keysize;
    }

    public void initialize(AlgorithmParameterSpec params, SecureRandom random)
	throws InvalidAlgorithmParameterException
    {
	if(!(params instanceof DSAParameterSpec)) {
	    throw new InvalidAlgorithmParameterException("Invalid params: " +
							 params);
	}
	this.params = (DSAParameterSpec)params;
	this.random = random;
    }

    /* !!! TODO implement DSAKeyPairGenerator interface
    public void initialize(DSAParams params, SecureRandom random)
	throws InvalidParameterException
    {
    }

    public void initialize(int modlen, boolean genParams, SecureRandom random)
	throws InvalidParameterException
    {
    }
    */

    public KeyPair generateKeyPair() {
	if(random == null) {
	    random = new SecureRandom();
	}
	if(params == null) {
	    /* !!! REMOVE !!! 
	       Do we want something like this? Maybe not?
	    if(keysize == 768) {
		params = new DSAParameterSpec(ModPGroups.oakleyGroup1P,
					      ModPGroups.oakleyGroup1O,
					      ModPGroups.oakleyGroup1G);
	    } else if(keysize == 1024) {
		params = new DSAParameterSpec(ModPGroups.oakleyGroup2P,
					      ModPGroups.oakleyGroup2O,
					      ModPGroups.oakleyGroup2G);
	    } else if(keysize == 1536) {
		params = new DSAParameterSpec(ModPGroups.oakleyGroup5P,
					      ModPGroups.oakleyGroup5O,
					      ModPGroups.oakleyGroup5G);
	    } else {
	    */
	    // !!! REMOVE !!!
	    // !!! How many bits in order ???
	    params = DSAAlgorithm.generateParams(keysize, 160, random);
		/* !!! REMOVE	    } */
	}

	BigInteger p = params.getP();
	BigInteger q = params.getQ();
	BigInteger g = params.getG();
	BigInteger x = DSAAlgorithm.generatePrivateKey(q, random);
	BigInteger y = DSAAlgorithm.generatePublicKey(g, p, x);

	return new KeyPair(new DSAPublicKey(y, p, q, g),
			   new DSAPrivateKey(x, p, q, g));
    }

}
