
package jca.security.interfaces;

import jca.security.SecureRandom;
import jca.security.InvalidParameterException;

public interface DSAKeyPairGenerator {
    public void initialize(DSAParams params, SecureRandom random)
	throws InvalidParameterException;
    public void initialize(int modlen, boolean genParams, SecureRandom random)
	throws InvalidParameterException;
}
