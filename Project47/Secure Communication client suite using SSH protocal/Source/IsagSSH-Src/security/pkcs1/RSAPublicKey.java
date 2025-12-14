package security.pkcs1;

import java.math.BigInteger;

import asn1.ASN1Sequence;
import asn1.ASN1Integer;

/**
 * <pre>
 * RSAPublicKey ::= SEQUENCE {
 *   modulus          INTEGER, -- (Usually large) n = p*q
 *   publicExponent   INTEGER  -- (Usually small) e 
 * }
 * </pre>
 */
public class RSAPublicKey extends ASN1Sequence {

    public ASN1Integer modulus;
    public ASN1Integer publicExponent;

    public RSAPublicKey() {
	modulus        = new ASN1Integer();
	publicExponent = new ASN1Integer();
	addComponent(modulus);
	addComponent(publicExponent);
    }

    public RSAPublicKey(BigInteger modulus, BigInteger publicExponent) {
	this();
	this.modulus.setValue(modulus);
	this.publicExponent.setValue(publicExponent);
    }

}
