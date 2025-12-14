
package security.pkcs8;

import asn1.ASN1Sequence;
import asn1.ASN1OctetString;

import security.x509.AlgorithmIdentifier;

public class EncryptedPrivateKeyInfo extends ASN1Sequence {

    public AlgorithmIdentifier encryptionAlgorithm;
    public ASN1OctetString     encryptedData;

    public EncryptedPrivateKeyInfo() {
	encryptionAlgorithm = new AlgorithmIdentifier();
	encryptedData       = new ASN1OctetString();
	addComponent(encryptionAlgorithm);
	addComponent(encryptedData);
    }

}
