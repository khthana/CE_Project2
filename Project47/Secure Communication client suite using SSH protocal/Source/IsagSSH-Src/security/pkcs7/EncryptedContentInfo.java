
package security.pkcs7;

import asn1.ASN1Sequence;
import asn1.ASN1OID;
import asn1.ASN1OctetString;
import asn1.ASN1Implicit;

import security.x509.AlgorithmIdentifier;

public final class EncryptedContentInfo extends ASN1Sequence {

    public ASN1OID             contentType;
    public AlgorithmIdentifier contentEncryptionAlgorithm;
    public ASN1OctetString     encryptedContent;

    public EncryptedContentInfo() {
	contentType                = new ASN1OID();
	contentEncryptionAlgorithm = new AlgorithmIdentifier();
	encryptedContent           = new ASN1OctetString();
	addComponent(contentType);
	addComponent(contentEncryptionAlgorithm);
	addOptional(new ASN1Implicit(0, encryptedContent));
    }

}

