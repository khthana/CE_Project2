
package security.publickey;


import jca.security.KeyPair;
import jca.security.KeyPairGenerator;
import jca.security.SecureRandom;
import jca.security.InvalidAlgorithmParameterException;
import jca.security.spec.AlgorithmParameterSpec;

public class RSAKeyPairGenerator extends KeyPairGenerator {

    protected SecureRandom random;
    protected int          keysize;

    public RSAKeyPairGenerator() {
	super("RSA");
    }

    public void initialize(int keysize, SecureRandom random) {
	this.random  = random;
	this.keysize = keysize;
    }

    public void initialize(AlgorithmParameterSpec params, SecureRandom random)
	throws InvalidAlgorithmParameterException
    {
	throw new Error("Not implemented: " +
			"'RSAKeyPairGenerator.initialize(int, SecureRandom)'");
    }

    public KeyPair generateKeyPair() {
	if(random == null) {
	    random = new SecureRandom();
	}
	return RSAAlgorithm.generateKeyPair(keysize, random);
    }

}
