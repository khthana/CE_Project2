
package security.x509;

import asn1.ASN1Sequence;
import asn1.ASN1BitString;

public class Certificate extends ASN1Sequence {

    public TBSCertificate      tbsCertificate;
    public AlgorithmIdentifier signatureAlgorithm;
    public ASN1BitString       signatureValue;

    public Certificate() {
	tbsCertificate     = new TBSCertificate();
	signatureAlgorithm = new AlgorithmIdentifier();
	signatureValue     = new ASN1BitString();
	addComponent(tbsCertificate);
	addComponent(signatureAlgorithm);
	addComponent(signatureValue);
    }

}
