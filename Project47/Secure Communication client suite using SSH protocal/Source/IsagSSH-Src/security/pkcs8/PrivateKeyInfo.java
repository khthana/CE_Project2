
package security.pkcs8;

import asn1.ASN1Integer;
import asn1.ASN1OctetString;
import asn1.ASN1Sequence;
import asn1.ASN1SetOf;
import asn1.ASN1Implicit;

import security.x509.AlgorithmIdentifier;
import security.x509.Attribute;

public final class PrivateKeyInfo extends ASN1Sequence {

    public ASN1Integer         version;
    public AlgorithmIdentifier privateKeyAlgorithm;
    public ASN1OctetString     privateKey;
    public ASN1SetOf           attributes;

    public PrivateKeyInfo() {
	version             = new ASN1Integer();
	privateKeyAlgorithm = new AlgorithmIdentifier();
	privateKey          = new ASN1OctetString();
	attributes          = new ASN1SetOf(Attribute.class);
	addComponent(version);
	addComponent(privateKeyAlgorithm);
	addComponent(privateKey);
	addOptional(new ASN1Implicit(0, attributes));
    }

}

