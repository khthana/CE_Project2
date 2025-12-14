
package ssh2;

import java.math.BigInteger;

import jca.security.KeyFactory;
import jca.security.PublicKey;
import jca.security.spec.DSAPublicKeySpec;
import jca.security.interfaces.DSAPublicKey;
import jca.security.interfaces.DSAParams;

/**
 * Implements "ssh-dss" signatures according to the ssh standard.
 */
public final class SSH2DSS extends SSH2SimpleSignature {
    public final static String SSH2_KEY_FORMAT = "ssh-dss";

    /**
     * Constructor.
     */
    public SSH2DSS() {
	super("SHA1withRawDSA", SSH2_KEY_FORMAT);
    }

    public byte[] encodePublicKey(PublicKey publicKey) throws SSH2Exception {
	SSH2DataBuffer buf = new SSH2DataBuffer(8192);

	if(!(publicKey instanceof DSAPublicKey)) {
	    throw new SSH2FatalException("SSH2DSS, invalid public key type: " +
					 publicKey);
	}

	DSAPublicKey dsaPubKey = (DSAPublicKey)publicKey;
	DSAParams    dsaParams = dsaPubKey.getParams();

	buf.writeString(SSH2_KEY_FORMAT);
	buf.writeBigInt(dsaParams.getP());
	buf.writeBigInt(dsaParams.getQ());
	buf.writeBigInt(dsaParams.getG());
	buf.writeBigInt(dsaPubKey.getY());

	return buf.readRestRaw();
    }

    public PublicKey decodePublicKey(byte[] pubKeyBlob) throws SSH2Exception {
	BigInteger p, q, g, y;
	SSH2DataBuffer buf = new SSH2DataBuffer(pubKeyBlob.length);

	buf.writeRaw(pubKeyBlob);

	String type = buf.readJavaString();
	if(!type.equals(SSH2_KEY_FORMAT)) {
	    throw new SSH2FatalException("SSH2DSS, keyblob type mismatch, got '"
					 + type + ", (execpted + '" +
					 SSH2_KEY_FORMAT + "')");
	}

	p = buf.readBigInt();
	q = buf.readBigInt();
	g = buf.readBigInt();
	y = buf.readBigInt();

	try {
	    KeyFactory       dsaKeyFact = KeyFactory.getInstance("DSA");
	    DSAPublicKeySpec dsaPubSpec = new DSAPublicKeySpec(y, p, q, g);

	    return dsaKeyFact.generatePublic(dsaPubSpec);

	} catch (Exception e) {
	    throw new SSH2FatalException("SSH2DSS, error decoding public key blob: " +
					 e);
	}
    }

}
