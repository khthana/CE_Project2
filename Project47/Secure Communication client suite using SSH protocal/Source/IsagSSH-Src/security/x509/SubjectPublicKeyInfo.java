
package security.x509;

import asn1.ASN1Sequence;
import asn1.ASN1BitString;

public class SubjectPublicKeyInfo extends ASN1Sequence {

    public AlgorithmIdentifier algorithm;
    public ASN1BitString       subjectPublicKey;

    public SubjectPublicKeyInfo() {
	algorithm        = new AlgorithmIdentifier();
	subjectPublicKey = new ASN1BitString();
	addComponent(algorithm);
	addComponent(subjectPublicKey);
    }

}
