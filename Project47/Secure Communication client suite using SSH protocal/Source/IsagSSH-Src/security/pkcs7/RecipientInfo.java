
package security.pkcs7;

import asn1.ASN1Sequence;
import asn1.ASN1Integer;
import asn1.ASN1OctetString;

import security.x509.AlgorithmIdentifier;

public final class RecipientInfo extends ASN1Sequence {

    ASN1Integer            version;
    IssuerAndSerialNumber  issuerAndSerialNumber;
    AlgorithmIdentifier    keyEncryptionAlgorithm;
    ASN1OctetString        encryptedKey;

    public RecipientInfo() {
	version                = new ASN1Integer();
	issuerAndSerialNumber  = new IssuerAndSerialNumber();
	keyEncryptionAlgorithm = new AlgorithmIdentifier();
	encryptedKey           = new ASN1OctetString();
	addComponent(version);
	addComponent(issuerAndSerialNumber);
	addComponent(keyEncryptionAlgorithm);
	addComponent(encryptedKey);
    }

}

